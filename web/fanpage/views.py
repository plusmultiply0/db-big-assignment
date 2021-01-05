from flask import flash, redirect, url_for, render_template

from fanpage import app,db
from fanpage.models import menbert,bandt,albumt,songst,fanst,bandmenbert

@app.route('/',methods=['GET', 'POST'])
def index():
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
