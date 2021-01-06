from flask import redirect, url_for, render_template,abort

from fanpage import app,db
from fanpage.models import menbert,bandt,albumt,songst,fanst
from fanpage.forms import LoginForm,DeleteForm

# 视图文件
# 不同的url端点，对应不同的视图函数，渲染不同的模板

@app.route('/<string:fans_name>',methods=['GET', 'POST'])
@app.route('/',methods=['GET', 'POST'])
def index(fans_name=''):
    fan=''
    if fans_name:
        fan = fanst.query.filter(fanst.fname == fans_name)[0]
    if fan:
        bandlike = fan.bandfanst
        memberlike = fan.memberfanst
        ablumlike = fan.ablumfanst
        songlike = fan.songfanst
        deleteband = DeleteForm()
        deletemember = DeleteForm()
        deleteablum = DeleteForm()
        deletesong = DeleteForm()
        return render_template('index.html',fan=fan,bandlike=bandlike,memberlike=memberlike
                           ,ablumlike=ablumlike,songlike=songlike
        ,deleteband=deleteband,deletemember=deletemember,deleteablum=deleteablum,deletesong=deletesong)
    return render_template('index.html')

# 所有的*
@app.route('/allbands',methods=['GET'])
def all_bands():
    dtype = 'bands'
    result = bandt.query.all()
    return render_template('allthings.html',result=result,dtype=dtype)

@app.route('/allsingers',methods=['GET'])
def all_singers():
    dtype = 'singers'
    result = menbert.query.all()
    return render_template('allthings.html', result=result, dtype=dtype)

@app.route('/allablums',methods=['GET'])
def all_ablums():
    dtype = 'ablums'
    result = albumt.query.all()
    return render_template('allthings.html', result=result, dtype=dtype)

@app.route('/allsongs',methods=['GET'])
def all_songs():
    dtype = 'songs'
    result = songst.query.all()
    return render_template('allthings.html', result=result, dtype=dtype)

# --------------------
# 详细信息**
# 可以扩展为具体CRUD页面
@app.route('/bands/<int:band_id>',methods=['GET'])
def detail_bands(band_id):
    dtype = 'bands'
    result = bandt.query.get(band_id)
    leader = menbert.query.get(result.bleader)
    return render_template('detailthings.html',result=result,dtype=dtype,leader=leader)

@app.route('/singers/<int:singer_id>',methods=['GET'])
def detail_singers(singer_id):
    dtype = 'singers'
    result = menbert.query.get(singer_id)
    return render_template('detailthings.html',result=result,dtype=dtype)

@app.route('/ablums/<int:ablum_id>',methods=['GET'])
def detail_ablums(ablum_id):
    dtype = 'ablums'
    result = albumt.query.get(ablum_id)
    band = bandt.query.get(result.aband)
    return render_template('detailthings.html',result=result,dtype=dtype,band=band)

@app.route('/songs/<int:song_id>',methods=['GET'])
def detail_songs(song_id):
    dtype = 'songs'
    result = songst.query.get(song_id)
    sablum = albumt.query.get(result.sablum)
    return render_template('detailthings.html',result=result,dtype=dtype,sablum=sablum)

# 登录
@app.route('/login',methods=['GET','POST'])
def fan_login():
    form = LoginForm()
    if form.validate_on_submit():
        username = form.username.data
        return redirect(url_for('index',fans_name=username))
    fans = fanst.query.all()
    return render_template('login.html',fans=fans,form=form)

# CRUD
# 删除
@app.route('/<string:fans_name>/bands/delete/<int:band_id>', methods=['POST'])
def delete_bands(fans_name,band_id):
    form = DeleteForm()
    if form.validate_on_submit():
        band = bandt.query.get(band_id)
        fan = fanst.query.filter(fanst.fname == fans_name)[0]
        fan.bandfanst.remove(band)
        db.session.commit()
    else:
        abort(400)
    return redirect(url_for('index',fans_name=fans_name))

@app.route('/<string:fans_name>/singers/delete/<int:singer_id>', methods=['POST'])
def delete_singers(fans_name,singer_id):
    form = DeleteForm()
    if form.validate_on_submit():
        singer = menbert.query.get(singer_id)
        fan = fanst.query.filter(fanst.fname == fans_name)[0]
        fan.memberfanst.remove(singer)
        db.session.commit()
    else:
        abort(400)
    return redirect(url_for('index',fans_name=fans_name))

@app.route('/<string:fans_name>/ablums/delete/<int:ablum_id>', methods=['POST'])
def delete_ablums(fans_name,ablum_id):
    form = DeleteForm()
    if form.validate_on_submit():
        album = albumt.query.get(ablum_id)
        fan = fanst.query.filter(fanst.fname == fans_name)[0]
        fan.ablumfanst.remove(album)
        db.session.commit()
    else:
        abort(400)
    return redirect(url_for('index',fans_name=fans_name))

@app.route('/<string:fans_name>/songs/delete/<int:song_id>', methods=['POST'])
def delete_songs(fans_name,song_id):
    form = DeleteForm()
    if form.validate_on_submit():
        song = songst.query.get(song_id)
        fan = fanst.query.filter(fanst.fname == fans_name)[0]
        fan.songfanst.remove(song)
        db.session.commit()
    else:
        abort(400)
    return redirect(url_for('index',fans_name=fans_name))
