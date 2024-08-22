from sqlalchemy import Boolean, String, Column, Integer
from database import Base


class User(Base):
    __tablename__ = "users"

    id= Column(Integer, primary_key=True, index=True)
    username = Column(String(50), unique=True)
    floor = Column(String(50))
    section = Column(String(50))
    password = Column(String(50))
    admin = Column(String(10))


class Report(Base):
    __tablename__ = "reports"

    id= Column(Integer, primary_key=True, index=True)
    userid = Column(String(3), index=True)
    place = Column(String(50))
    kind = Column(String(50))
    name = Column(String(70))
    desc = Column(String(255))
    done = Column(String(50))




