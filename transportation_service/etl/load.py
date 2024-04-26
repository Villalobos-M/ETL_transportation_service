import pandas as pd

def load_dw_transportation_service(table, conn, df):
  try:
    df.to_sql(table, conn, if_exists='append', index=False)
  except Exception as e:
    print(e) 