import sqlalchemy as db

def connect_transport_db():
  engine = db.create_engine("mysql://root:root@localhost/transportation_service_db")
  conn = engine.connect()
  return conn

def connect_dw_transport():
  engine = db.create_engine("mysql://root:root@localhost/dw_transportation_service")
  conn = engine.connect()
  return conn