import pandas as pd

def transform_time(conn, query):
  return pd.read_sql(query, con=conn)