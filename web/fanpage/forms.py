from flask_wtf import FlaskForm
from wtforms import StringField,PasswordField,BooleanField,SubmitField
from wtforms.validators import DataRequired,ValidationError

from fanpage.models import fanst

class LoginForm(FlaskForm):
    username = StringField('用户名(粉丝名)', validators=[DataRequired()])
    password = PasswordField('密码')
    remember = BooleanField('记住我')
    submit = SubmitField('登录')

    def validate_username(form,field):
        fans = fanst.query.all()
        flag = False
        for i in fans:
            if i.fname == field.data:
                flag=True
        if not flag:
            raise ValidationError('用户名（粉丝名）不存在！')

class DeleteForm(FlaskForm):
    submit = SubmitField('Delete')
