import click
from fanpage import app,db
from fanpage.models import menbert,bandt,albumt,songst,fanst,bandmenbert

# 自定义flask命令
# 定义建库，和填充库数据的命令
# 建库
# flask initdb
# 建表
# flask build
# 运行
# flask run

#python shell上下文
@app.shell_context_processor
def make_shell_context():
    return dict(db=db,menbert=menbert,bandt=bandt,albumt=albumt,songst=songst,fanst=fanst,bandmenbert=bandmenbert)

# 初始化数据库，建表
@app.cli.command()
@click.option('--drop', is_flag=True, help='Create after drop.')
def initdb(drop):
    """Initialize the database."""
    if drop:
        click.confirm('This operation will delete the database, do you want to continue?', abort=True)
        db.drop_all()
        click.echo('Drop tables.')
    db.create_all()
    click.echo('Initialized database.')

# 往表中插入初始数据
@app.cli.command()
def build():
    """Generate prepared messages."""
    click.echo('Working...')
    # 插入数据
    # 插入成员数据
    konmember = ['平沢唯','秋山澪','田井中律','琴吹䌷', '中野梓']
    Euphoniummember = ['黄前久美子','加藤叶月','高坂丽奈','田中明日香','川岛绿辉']
    BanGmember = ['户山香澄','花园多惠', '牛迂里美', '山吹沙绫']
    WHITEmember = ['小木曾雪菜','冬马和纱','北原春希']
    April = ['有马公生','宫园薰', '泽部椿','渡亮太']
    for i in range(0,21):
        if i <= 4:
            m = menbert(mname=konmember[i],mjointime='2009-04-02',mleavetime='')
        elif i<=9:
            m = menbert(mname=Euphoniummember[i-5], mjointime='2015-06-30', mleavetime='')
        elif i<=13:
            m = menbert(mname=BanGmember[i-10], mjointime='2019-01-03', mleavetime='')
        elif i<=16:
            m = menbert(mname=WHITEmember[i-14], mjointime='2013-10-05', mleavetime='')
        elif i<=20:
            m = menbert(mname=April[i-17], mjointime='2014-10-09', mleavetime='')
        db.session.add(m)
    db.session.commit()
    # 插入乐队数据
    bname=['kon','Euphonium','BanG','WHITE','April']
    bfound=['2009-04-02','2015-06-30','2019-01-03','2013-10-05','2014-10-09']
    bleader=[1,6,11,17,18]
    for i in range(5):
        b= bandt(bname=bname[i],bfound=bfound[i],bleader=bleader[i])
        db.session.add(b)
    db.session.commit()
    # 插入专辑数据
    aname = ['konmusic','Euphoniummusic','BanGmusic','WHITEmusic','Aprilmusic']
    apublishtime =['2009-04-02','2015-06-30','2019-01-03','2013-10-05','2014-10-09']
    aband = [1,2,3,4,5]
    for i in range(5):
        a = albumt(aname=aname[i],apublishtime=apublishtime[i],aband=aband[i])
        db.session.add(a)
    db.session.commit()
    # 插入歌曲数据
    sname = ['song1','song2','song3','song4','song5']
    sablum = [5,4,3,2,1]
    for i in range(5):
        s = songst(sname=sname[i],sablum=sablum[i])
        db.session.add(s)
    db.session.commit()
    # 插入歌迷数据
    fname = ['安德烈','武田绫乃','藤本树','白非立','陈睿','麻枝准','露娜','佩洛','纳什','金田一']
    fsex = ['male','female','male','male','male','male','female','male','male','male']
    fage = [28,18,9,20,38,48,21,57,15,37]
    for i in range(10):
        f = fanst(fname=fname[i],fsex=fsex[i],fage=fage[i])
        db.session.add(f)
    db.session.commit()
    # 插入关系表，建立关系-------------------------------
    # 成员与乐队多对一关系
    for i in range(1,22):
        if i <= 5:
            bm = bandmenbert(bno=1,mno=i)
        elif i<=10:
            bm = bandmenbert(bno=2,mno=i)
        elif i<=14:
            bm = bandmenbert(bno=3,mno=i)
        elif i<=17:
            bm = bandmenbert(bno=4,mno=i)
        elif i<=21:
            bm = bandmenbert(bno=5,mno=i)
        db.session.add(bm)
    db.session.commit()
    # # 专辑与乐队一对一
    albumt.query.get(1).albumbelong = bandt.query.get(1)
    albumt.query.get(2).albumbelong = bandt.query.get(2)
    albumt.query.get(3).albumbelong = bandt.query.get(3)
    albumt.query.get(4).albumbelong = bandt.query.get(4)
    albumt.query.get(5).albumbelong = bandt.query.get(5)
    db.session.commit()
    # # 专辑与歌曲一对一关系
    songst.query.get(1).songsbelong = albumt.query.get(5)
    songst.query.get(2).songsbelong = albumt.query.get(4)
    songst.query.get(3).songsbelong = albumt.query.get(3)
    songst.query.get(4).songsbelong = albumt.query.get(2)
    songst.query.get(5).songsbelong = albumt.query.get(1)
    db.session.commit()
    # # 歌曲和乐队多对多关系
    bandn = [1,2,3,4,5,1,3,4]
    songn = [5,1,2,3,4,4,5,2]
    for i in range(8):
        stmp = songst.query.get(songn[i])
        btmp = bandt.query.get(bandn[i])
        btmp.playst.append(stmp)
    db.session.commit()
    # # 乐队粉丝表
    bandn = [5,4,3,2,1,1,2,3]
    fansn = [1,2,3,4,5,6,7,8]
    for i in range(8):
        btmp = bandt.query.get(bandn[i])
        ftmp = fanst.query.get(fansn[i])
        ftmp.bandfanst.append(btmp)
    db.session.commit()
    # # 成员粉丝表
    membern = [1,6,11,15,18,5,8,16,17,18,7,19,21]
    fansn = [1,3,5,7,9,2,4,6,8,10,3,6,9]
    for i in range(13):
        ftmp = fanst.query.get(fansn[i])
        mtmp = menbert.query.get(membern[i])
        ftmp.memberfanst.append(mtmp)
    db.session.commit()
    # # 专辑粉丝表
    ablumn = [1,2,3,4,5,5,4,2]
    fansn = [10,9,8,7,6,5,4,3]
    for i in range(8):
        ftmp = fanst.query.get(fansn[i])
        atmp = albumt.query.get(ablumn[i])
        ftmp.ablumfanst.append(atmp)
    db.session.commit()
    # # 歌曲粉丝表
    fansn = [10,9,8,7,6,5,4,3,2,1]
    songn = [1,2,3,4,5,5,4,3,2,1]
    for i in range(10):
        ftmp = fanst.query.get(fansn[i])
        stmp = songst.query.get(songn[i])
        ftmp.songfanst.append(stmp)
    db.session.commit()
    # 完成插入
    db.session.commit()
    click.echo('Created prepared messages!!!')
