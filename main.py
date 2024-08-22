from fastapi import Response,FastAPI, HTTPException, Depends, status
from pydantic import BaseModel
from typing import Annotated
import models
from database import engine, session
from sqlalchemy.orm import Session
import uvicorn


app = FastAPI()

models.Base.metadata.create_all(bind=engine)



class ReportBase(BaseModel):
    userid:str
    name:str
    place:str
    kind:str
    desc:str
    done:str

class UserBase(BaseModel):
    username:str
    floor:str
    section:str
    password:str
    admin:str



def get_db():
    db = session()
    try:
        yield db
    finally:
        db.close()    




db_dependency = Annotated[Session, Depends(get_db)]

@app.post("/add", status_code=status.HTTP_201_CREATED)
async def main(report:ReportBase, db:db_dependency):
    db_report = models.Report(**report.__dict__)
    db.add(db_report)
    db.commit()
    print(db_report)
    #db.close()


@app.get("/users", status_code=status.HTTP_200_OK)
async def reports(db:db_dependency):
    users = db.query(models.User).all()
    if users is None:
        raise HTTPException(status_code=404 , detail='There is No Users!')
    return users


@app.put("/admin/{id}", status_code=status.HTTP_200_OK)
async def done(id:int, db:db_dependency):
    user = db.query(models.User).filter(models.User.id == id).first()
    if user is None:
        raise HTTPException(status_code=404, detail="Error: No User!")
    user.admin = "true"
    db.add(user)
    db.commit()
    db.refresh(user)
    return user


@app.put("/not_admin/{id}", status_code=status.HTTP_200_OK)
async def done(id:int, db:db_dependency):
    user = db.query(models.User).filter(models.User.id == id).first()
    if user is None:
        raise HTTPException(status_code=404, detail="Error: No User!")
    user.admin = "false"
    db.add(user)
    db.commit()
    db.refresh(user)
    return user

@app.delete('/del_user/{id}' , status_code=status.HTTP_200_OK)
def del_report(id: int , db : db_dependency):
    user=db.query(models.User).filter(models.User.id == id).first()
    if user is None:
        raise HTTPException(status_code=404 , detail='User is not Found')
    db.delete(user)
    db.commit()
    return "Done"    
    #db.commit()


@app.post("/login", status_code=status.HTTP_201_CREATED)
async def login(user:UserBase, db:db_dependency):
    db_user = models.User(**user.__dict__)
    other_user = db.query(models.User).filter(models.User.password == user.password).filter(models.User.username== user.username).first()
    other_user_name = db.query(models.User).filter(models.User.username == user.username).first()
    #print(db_user.username + "     " +other_users.password)
    #print(db_user.password)
    if(other_user == None and other_user_name == None):
        
        db.add(db_user)
        db.commit()
        db.close()
        return db.query(models.User).filter(models.User.username == user.username).filter(models.User.password == user.password).first()

    elif(other_user == None and other_user_name != None):
        
        return status.HTTP_203_NON_AUTHORITATIVE_INFORMATION
        
        
    
    else :
        other_user.section = user.section
        other_user.floor = user.floor
        db.add(other_user)
        db.commit()
        db.refresh(other_user)
        return other_user
    


@app.get("/reports", status_code=status.HTTP_200_OK)
async def reports(db:db_dependency):
    reports = db.query(models.Report).all()
    if reports is None:
        raise HTTPException(status_code=404 , detail='There is No reports')
    return reports
    
    


@app.post("/user/{id}", status_code=status.HTTP_200_OK)
async def user(id:int, db:db_dependency):
    user = db.query(models.User).filter(models.User.id == id).first()
    if user is None:
        raise HTTPException(status_code=404, detail="User not found!")
    return user


@app.post("/reports/{user_id}", status_code=status.HTTP_200_OK)
async def reports_user(user_id:int, db:db_dependency):
    reports = db.query(models.Report).filter(models.Report.userid == user_id).all()
    if reports is None:
        raise HTTPException(status_code=404, detail="There is no Reports")
    return reports



@app.put("/done/{id}", status_code=status.HTTP_200_OK)
async def done(id:int, db:db_dependency):
    report = db.query(models.Report).filter(models.Report.id == id).first()
    if report is None:
        raise HTTPException(status_code=404, detail="Error: No Report!")
    report.done = "true"
    db.add(report)
    db.commit()
    db.refresh(report)
    return report

@app.put("/notyet/{id}", status_code=status.HTTP_200_OK)
async def done(id:int, db:db_dependency):
    report = db.query(models.Report).filter(models.Report.id == id).first()
    if report is None:
        raise HTTPException(status_code=404, detail="Error: No Report!")
    report.done = "false"
    db.add(report)
    db.commit()
    db.refresh(report)
    return report

@app.delete("/delete/{id}", status_code=status.HTTP_200_OK)
async def done(id:int, db:db_dependency):
    report = db.query(models.Report).filter(models.Report.id == id).first()
    if report is None:
        raise HTTPException(status_code=404, detail="Error: No Report!")
    
    db.delete(report)
    db.commit()
    
    

if __name__ == "__main__":
    uvicorn.run(
        "main:app",
        host="0.0.0.0",
        port=8000,
        log_level="debug",
        reload=True,
    )