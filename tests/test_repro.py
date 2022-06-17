import dask.dataframe
import pandas
from dask_sql import Context

example = dict(
    number=[1, 2, 3, 4, 5],
)

df = dask.dataframe.from_pandas(pandas.DataFrame(example), npartitions=1)


def test_one():
    c = Context()
    c.create_table("dataset", df)
    res = c.sql("SELECT * FROM dataset").compute()
    assert res is not None
