from fastapi import FastAPI

from app.core import settings


app = FastAPI(title=settings.APP_TITLE)
