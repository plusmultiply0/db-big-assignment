from fanpage import db

# 关系表----------------------------------------
# 歌曲和乐队多对多关系
playst_table = db.Table('playst',
                        db.Column('bno',db.Integer,db.ForeignKey('bandt.bno')),
                        db.Column('sno',db.Integer,db.ForeignKey('songst.sno'))
                        )
# 粉丝与乐队，成员，专辑，歌曲多对多关系
# 乐队粉丝表
bandfans_table = db.Table('bandfanst',
                        db.Column('bno',db.Integer,db.ForeignKey('bandt.bno')),
                        db.Column('fno',db.Integer,db.ForeignKey('fanst.fno'))
                        )
# 成员粉丝表
memberfans_table = db.Table('memberfanst',
                        db.Column('mno',db.Integer,db.ForeignKey('menbert.mno')),
                        db.Column('fno',db.Integer,db.ForeignKey('fanst.fno'))
                        )
# 专辑粉丝表
ablumfans_table = db.Table('ablumfanst',
                        db.Column('ano',db.Integer,db.ForeignKey('albumt.ano')),
                        db.Column('fno',db.Integer,db.ForeignKey('fanst.fno'))
                        )
# 歌曲粉丝表
songfans_table = db.Table('songfanst',
                        db.Column('fno',db.Integer,db.ForeignKey('fanst.fno')),
                        db.Column('sno',db.Integer,db.ForeignKey('songst.sno'))
                        )

# 建模型/定义表-----------------------------------
# 乐队成员表
class menbert(db.Model):
    mno=db.Column(db.Integer,primary_key=True,nullable=False,autoincrement=True)
    mname=db.Column(db.String(20))
    mjointime=db.Column(db.DateTime)
    mleavetime=db.Column(db.DateTime)
    # 定义双向关系
    # 乐队与队长一对一
    mbandleader=db.relationship('bandt',back_populates='bandleader',)
    # 出于方便，这里和sql定义表不一样，成员表多了个所属乐队的外码（原先是乐队成员关系表）
    mband = db.Column(db.Integer,db.ForeignKey('bandt.bno'))
    # 乐队与成员一对多
    bandmenbert=db.relationship('bandt',back_populates='bandmenbert')

# 乐队表
class bandt(db.Model):
    bno=db.Column(db.Integer,primary_key=True,nullable=False,autoincrement=True)
    bname=db.Column(db.String(30))
    bfound=db.Column(db.DateTime)
    bleader=db.Column(db.Integer,db.ForeignKey('menbert.mno'),unique=True)
    # 定义双向关系
    # 乐队与队长一对一
    bandleader=db.relationship('menbert',back_populates='mbandleader',uselist=False)
    # 专辑与乐队一对一
    albumown=db.relationship('albumt',back_populates='albumbelong',uselist=False)
    # 歌曲和乐队多对多关系
    playst = db.relationship('songst',secondary=playst_table,back_populates='playst')
    # 乐队与成员一对多
    bandmenbert = db.relationship('menbert', back_populates='bandmenbert')

# 专辑表
class albumt(db.Model):
    ano = db.Column(db.Integer, primary_key=True, nullable=False, autoincrement=True)
    aname = db.Column(db.String(30))
    apublishtime=db.Column(db.DateTime)
    aband=db.Column(db.Integer,db.ForeignKey('bandt.bno'),)
    # 定义双向关系
    # 专辑与乐队一对一
    albumbelong=db.relationship('bandt',back_populates='albumown')
    # 专辑与歌曲一对一
    songsown=db.relationship('songst',back_populates='songsbelong')

# 歌曲表
class songst(db.Model):
    sno = db.Column(db.Integer, primary_key=True, nullable=False, autoincrement=True)
    sname = db.Column(db.String(30))
    sablum =db.Column(db.Integer,db.ForeignKey('albumt.ano'))
    # 定义双向关系
    # 专辑与歌曲一对一
    songsbelong=db.relationship('albumt',back_populates='songsown')
    # 歌曲和乐队多对多关系
    playst = db.relationship('bandt',secondary=playst_table,back_populates='playst')

# 歌迷表
class fanst(db.Model):
    fno = db.Column(db.Integer, primary_key=True, nullable=False, autoincrement=True)
    fname = db.Column(db.String(20))
    fsex = db.Column(db.String(10))
    # 忽略了一个约束条件fage<=200 AND fage>=000
    fage=db.Column(db.Integer)


