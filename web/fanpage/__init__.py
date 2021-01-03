from flask import Flask
from flask_sqlalchemy import SQLAlchemy

# 以包的形式组织代码——代码/项目的基本文件结构
# 硬编码——包名
app=Flask('fanpage')
app.config.from_pyfile('settings.py')
app.jinja_env.trim_blocks=True
app.jinja_env.lstrip_blocks=True

db=SQLAlchemy(app)

from fanpage import views,errors,commands
