{
  description = "A simple dev shell flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/22.05";
    flake-utils.url = "github:numtide/flake-utils";
    flake-utils.inputs.nixpkgs.follows = "nixpkgs";
    flake-compat.url = "github:edolstra/flake-compat";
    flake-compat.flake = false;
    dask-sql-src = {
      type = "github";
      owner = "dask-contrib";
      repo = "dask-sql";
      ref = "0d0394aae22860a3af5f419621b8d794aab6019f";
      flake = false;
    };
  };
  outputs = { self, nixpkgs, flake-utils, dask-sql-src, ... }@inputs:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        python = pkgs.python310;
        dask-sql-mvn-repo = pkgs.stdenv.mkDerivation {
          name = "dask-sql-repo";
          buildInputs = [ pkgs.maven ];
          src = "${dask-sql-src}/planner";
          buildPhase = ''
            mvn clean install package -Dmaven.repo.local=$out -f ./pom.xml
          '';

          installPhase = ''
            find $out -type f \
              -name \*.lastUpdated -or \
              -name resolver-status.properties -or \
              -name _remote.repositories \
              -delete
          '';

          dontFixup = true;
          outputHashAlgo = "sha256";
          outputHashMode = "recursive";
          # outputHash = nixpkgs.lib.fakeSha256;
          outputHash = "sha256-5mvAlKmR7JeilCpxPitkWFz1SGTJePLm5XGgBZfehlk=";
        };
        overrides = final: prev: {
          dask = prev.dask.overridePythonAttrs
            (old: {
              propagatedBuildInputs = builtins.filter (e: e.pname != "distributed") old.propagatedBuildInputs;
            });
          tomli = prev.tomli.overridePythonAttrs (old: {
            propagatedBuildInputs = old.propagatedBuildInputs ++ [ final.flit-core ];
          });
          fastapi = prev.fastapi.overridePythonAttrs (old: {
            propagatedBuildInputs = old.propagatedBuildInputs ++ [ final.flit ];
          });
          pyparsing = prev.pyparsing.overridePythonAttrs (old: {
            propagatedBuildInputs = old.propagatedBuildInputs ++ [ final.flit-core ];
          });
          numpy = prev.numpy.overridePythonAttrs (old: {
            buildInputs = old.buildInputs ++ [ final.cython ];
          });
          pandas = prev.pandas.overridePythonAttrs (old: {
            propagatedBuildInputs = old.propagatedBuildInputs ++ [ final.cython ];
          });
          sqlalchemy-querybuilder = prev.sqlalchemy-querybuilder.overridePythonAttrs (old: {
            buildInputs = old.buildInputs ++ [ final.poetry ];
          });
          fancycompleter = prev.fancycompleter.overridePythonAttrs (old: {
            buildInputs = old.buildInputs ++ [ final.setupmeta ];
          });
          dask-sql = prev.dask-sql.overridePythonAttrs (old: {
            src = "${dask-sql-src}";
            propagatedBuildInputs = old.propagatedBuildInputs ++ [ final.fastapi final.distributed ];
            nativeBuildInputs = old.nativeBuildInputs ++ [ pkgs.openjdk11 pkgs.maven pkgs.which ];
            patches = [ ./dask-sql-install.patch ];
            MAVEN_OPTS = "-Dmaven.repo.local=${dask-sql-mvn-repo}";
            MAVEN_ARGS = "--offline --fail-never";
          });
        };
        dev = pkgs.poetry2nix.mkPoetryEnv {
          inherit python overrides;
          projectDir = ./.;
        };
      in
      {

        devShells = {
          default = pkgs.mkShell {
            buildInputs = [ python pkgs.poetry ];
          };
          dev = dev.env.overrideAttrs
            (old: {
              shellHook = ''
                export JAVA_HOME=${pkgs.openjdk11}
              '';
            });
        };
      });
}
