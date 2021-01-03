import os
from fanpage import app

# dev_db=xxx
SECRET_KEY=os.getenv('SECRET_KEY','srcSTH')
SQLALCHEMY_TRACK_MODIFICATIONS=False
SQLALCHEMY_DATABASE_URI=os.getenv('DATABASE_URL')
