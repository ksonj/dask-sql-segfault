# Reproduction of JVM segfault when running pytest on a dask-sql project

## Steps to reproduce

### On Ubuntu

```
poetry install

poetry run py.test
```

### with Nix

```
nix develop .#dev -c py.test
```

## Example stacktrace

```
Fatal Python error: Segmentation fault

Current thread 0x00007f319df6e740 (most recent call first):
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/dask_sql/context.py", line 798 in _get_ral
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/dask_sql/context.py", line 465 in sql
  File "$HOME/projects/dask-sql-segfault/tests/test_repro.py", line 27 in test_one
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/_pytest/python.py", line 192 in pytest_pyfunc_call
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/pluggy/_callers.py", line 39 in _multicall
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/pluggy/_manager.py", line 80 in _hookexec
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/pluggy/_hooks.py", line 265 in __call__
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/_pytest/python.py", line 1761 in runtest
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/_pytest/runner.py", line 166 in pytest_runtest_call
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/pluggy/_callers.py", line 39 in _multicall
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/pluggy/_manager.py", line 80 in _hookexec
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/pluggy/_hooks.py", line 265 in __call__
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/_pytest/runner.py", line 259 in <lambda>
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/_pytest/runner.py", line 338 in from_call
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/_pytest/runner.py", line 258 in call_runtest_hook
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/_pytest/runner.py", line 219 in call_and_report
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/_pytest/runner.py", line 130 in runtestprotocol
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/_pytest/runner.py", line 111 in pytest_runtest_protocol
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/pluggy/_callers.py", line 39 in _multicall
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/pluggy/_manager.py", line 80 in _hookexec
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/pluggy/_hooks.py", line 265 in __call__
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/_pytest/main.py", line 347 in pytest_runtestloop
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/pluggy/_callers.py", line 39 in _multicall
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/pluggy/_manager.py", line 80 in _hookexec
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/pluggy/_hooks.py", line 265 in __call__
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/_pytest/main.py", line 322 in _main
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/_pytest/main.py", line 268 in wrap_session
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/_pytest/main.py", line 315 in pytest_cmdline_main
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/pluggy/_callers.py", line 39 in _multicall
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/pluggy/_manager.py", line 80 in _hookexec
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/pluggy/_hooks.py", line 265 in __call__
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/_pytest/config/__init__.py", line 164 in main
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/_pytest/config/__init__.py", line 187 in console_main
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/bin/pytest", line 8 in <module>

Extension modules: yaml._yaml, psutil._psutil_linux, psutil._psutil_posix, markupsafe._speedups, numpy.core._multiarray_umath, numpy.core._multiarray_tests, numpy.linalg._umath_linalg, numpy.fft._pocketfft_internal, numpy.random._common, numpy.random.bit_generator, numpy.random._bounded_integers, numpy.random._mt19937, numpy.random.mtrand, numpy.random._philox, numpy.random._pcg64, numpy.random._sfc64, numpy.random._generator, pandas._libs.tslibs.dtypes, pandas._libs.tslibs.base, pandas._libs.tslibs.np_datetime, pandas._libs.tslibs.nattype, pandas._libs.tslibs.timezones, pandas._libs.tslibs.ccalendar, pandas._libs.tslibs.tzconversion, pandas._libs.tslibs.strptime, pandas._libs.tslibs.fields, pandas._libs.tslibs.timedeltas, pandas._libs.tslibs.timestamps, pandas._libs.properties, pandas._libs.tslibs.offsets, pandas._libs.tslibs.parsing, pandas._libs.tslibs.conversion, pandas._libs.tslibs.period, pandas._libs.tslibs.vectorized, pandas._libs.ops_dispatch, pandas._libs.missing, pandas._libs.hashtable, pandas._libs.algos, pandas._libs.interval, pandas._libs.tslib, pandas._libs.lib, pandas._libs.hashing, pandas._libs.ops, pandas._libs.arrays, pandas._libs.index, pandas._libs.join, pandas._libs.sparse, pandas._libs.reduction, pandas._libs.indexing, pandas._libs.internals, pandas._libs.writers, pandas._libs.window.aggregations, pandas._libs.window.indexers, pandas._libs.reshape, pandas._libs.groupby, pandas._libs.testing, pandas._libs.parsers, pandas._libs.json, msgpack._cmsgpack, _jpype, pydantic.typing, pydantic.errors, pydantic.version, pydantic.utils, pydantic.class_validators, pydantic.color, pydantic.datetime_parse, pydantic.validators, pydantic.networks, pydantic.types, pydantic.json, pydantic.error_wrappers, pydantic.fields, pydantic.config, pydantic.parse, pydantic.schema, pydantic.main, pydantic.dataclasses, pydantic.annotated_types, pydantic.decorator, pydantic.env_settings, pydantic.tools, pydantic (total: 83)
Fatal Python error: Aborted

Current thread 0x00007f319df6e740 (most recent call first):
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/dask_sql/context.py", line 798 in _get_ral
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/dask_sql/context.py", line 465 in sql
  File "$HOME/projects/dask-sql-segfault/tests/test_repro.py", line 27 in test_one
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/_pytest/python.py", line 192 in pytest_pyfunc_call
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/pluggy/_callers.py", line 39 in _multicall
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/pluggy/_manager.py", line 80 in _hookexec
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/pluggy/_hooks.py", line 265 in __call__
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/_pytest/python.py", line 1761 in runtest
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/_pytest/runner.py", line 166 in pytest_runtest_call
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/pluggy/_callers.py", line 39 in _multicall
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/pluggy/_manager.py", line 80 in _hookexec
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/pluggy/_hooks.py", line 265 in __call__
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/_pytest/runner.py", line 259 in <lambda>
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/_pytest/runner.py", line 338 in from_call
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/_pytest/runner.py", line 258 in call_runtest_hook
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/_pytest/runner.py", line 219 in call_and_report
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/_pytest/runner.py", line 130 in runtestprotocol
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/_pytest/runner.py", line 111 in pytest_runtest_protocol
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/pluggy/_callers.py", line 39 in _multicall
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/pluggy/_manager.py", line 80 in _hookexec
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/pluggy/_hooks.py", line 265 in __call__
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/_pytest/main.py", line 347 in pytest_runtestloop
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/pluggy/_callers.py", line 39 in _multicall
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/pluggy/_manager.py", line 80 in _hookexec
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/pluggy/_hooks.py", line 265 in __call__
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/_pytest/main.py", line 322 in _main
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/_pytest/main.py", line 268 in wrap_session
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/_pytest/main.py", line 315 in pytest_cmdline_main
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/pluggy/_callers.py", line 39 in _multicall
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/pluggy/_manager.py", line 80 in _hookexec
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/pluggy/_hooks.py", line 265 in __call__
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/_pytest/config/__init__.py", line 164 in main
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/lib/python3.10/site-packages/_pytest/config/__init__.py", line 187 in console_main
  File "$HOME/.cache/pypoetry/virtualenvs/dask-sql-segfault-lj8e3rlx-py3.10/bin/pytest", line 8 in <module>

Extension modules: yaml._yaml, psutil._psutil_linux, psutil._psutil_posix, markupsafe._speedups, numpy.core._multiarray_umath, numpy.core._multiarray_tests, numpy.linalg._umath_linalg, numpy.fft._pocketfft_internal, numpy.random._common, numpy.random.bit_generator, numpy.random._bounded_integers, numpy.random._mt19937, numpy.random.mtrand, numpy.random._philox, numpy.random._pcg64, numpy.random._sfc64, numpy.random._generator, pandas._libs.tslibs.dtypes, pandas._libs.tslibs.base, pandas._libs.tslibs.np_datetime, pandas._libs.tslibs.nattype, pandas._libs.tslibs.timezones, pandas._libs.tslibs.ccalendar, pandas._libs.tslibs.tzconversion, pandas._libs.tslibs.strptime, pandas._libs.tslibs.fields, pandas._libs.tslibs.timedeltas, pandas._libs.tslibs.timestamps, pandas._libs.properties, pandas._libs.tslibs.offsets, pandas._libs.tslibs.parsing, pandas._libs.tslibs.conversion, pandas._libs.tslibs.period, pandas._libs.tslibs.vectorized, pandas._libs.ops_dispatch, pandas._libs.missing, pandas._libs.hashtable, pandas._libs.algos, pandas._libs.interval, pandas._libs.tslib, pandas._libs.lib, pandas._libs.hashing, pandas._libs.ops, pandas._libs.arrays, pandas._libs.index, pandas._libs.join, pandas._libs.sparse, pandas._libs.reduction, pandas._libs.indexing, pandas._libs.internals, pandas._libs.writers, pandas._libs.window.aggregations, pandas._libs.window.indexers, pandas._libs.reshape, pandas._libs.groupby, pandas._libs.testing, pandas._libs.parsers, pandas._libs.json, msgpack._cmsgpack, _jpype, pydantic.typing, pydantic.errors, pydantic.version, pydantic.utils, pydantic.class_validators, pydantic.color, pydantic.datetime_parse, pydantic.validators, pydantic.networks, pydantic.types, pydantic.json, pydantic.error_wrappers, pydantic.fields, pydantic.config, pydantic.parse, pydantic.schema, pydantic.main, pydantic.dataclasses, pydantic.annotated_types, pydantic.decorator, pydantic.env_settings, pydantic.tools, pydantic (total: 83)

```
