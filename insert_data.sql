-- auto_increment 插入时可忽略

-- 插入成员数据
-- kon
INSERT INTO menbert(mno,mname,mjointime,mleavetime) VALUES (NULL,'平沢唯','2009-04-02',NULL);
INSERT INTO menbert(mno,mname,mjointime,mleavetime) VALUES (NULL,'秋山澪','2009-04-02',NULL);
INSERT INTO menbert(mno,mname,mjointime,mleavetime) VALUES (NULL,'田井中律','2009-04-02',NULL);
INSERT INTO menbert(mno,mname,mjointime,mleavetime) VALUES (NULL,'琴吹䌷','2009-04-02',NULL);
INSERT INTO menbert(mno,mname,mjointime,mleavetime) VALUES (NULL,'中野梓','2009-04-02',NULL);
-- Sound! Euphonium
INSERT INTO menbert(mno,mname,mjointime,mleavetime) VALUES (NULL,'黄前久美子','2015-06-30',NULL);
INSERT INTO menbert(mno,mname,mjointime,mleavetime) VALUES (NULL,'加藤叶月','2015-06-30',NULL);
INSERT INTO menbert(mno,mname,mjointime,mleavetime) VALUES (NULL,'高坂丽奈','2015-06-30',NULL);
INSERT INTO menbert(mno,mname,mjointime,mleavetime) VALUES (NULL,'田中明日香','2015-06-30',NULL);
INSERT INTO menbert(mno,mname,mjointime,mleavetime) VALUES (NULL,'川岛绿辉','2015-06-30',NULL);

-- BanG Dream! 
INSERT INTO menbert(mno,mname,mjointime,mleavetime) VALUES (NULL,'户山香澄','2019-01-03',NULL);
INSERT INTO menbert(mno,mname,mjointime,mleavetime) VALUES (NULL,'花园多惠','2019-01-03',NULL);
INSERT INTO menbert(mno,mname,mjointime,mleavetime) VALUES (NULL,'牛迂里美','2019-01-03',NULL);
INSERT INTO menbert(mno,mname,mjointime,mleavetime) VALUES (NULL,'山吹沙绫','2019-01-03',NULL);
-- WHITE ALBUM2
INSERT INTO menbert(mno,mname,mjointime,mleavetime) VALUES (NULL,'小木曾雪菜','2013-10-05',NULL);
INSERT INTO menbert(mno,mname,mjointime,mleavetime) VALUES (NULL,'冬马和纱','2013-10-05',NULL);
INSERT INTO menbert(mno,mname,mjointime,mleavetime) VALUES (NULL,'北原春希','2013-10-05',NULL);
-- Your lie in April
INSERT INTO menbert(mno,mname,mjointime,mleavetime) VALUES (NULL,'有马公生','2014-10-09',NULL);
INSERT INTO menbert(mno,mname,mjointime,mleavetime) VALUES (NULL,'宫园薰','2014-10-09',NULL);
INSERT INTO menbert(mno,mname,mjointime,mleavetime) VALUES (NULL,'泽部椿','2014-10-09',NULL);
INSERT INTO menbert(mno,mname,mjointime,mleavetime) VALUES (NULL,'渡亮太','2014-10-09',NULL);

-- 插入乐队数据
-- 需要先查询到 队长id 才能插
-- 平沢唯
INSERT INTO bandt(bno,bname,bfound,bleader) VALUES(NULL,'kon','2009-04-02',1);
-- 黄前久美子
INSERT INTO bandt(bno,bname,bfound,bleader) VALUES(NULL,'Euphonium','2015-06-30',6);
-- 户山香澄
INSERT INTO bandt(bno,bname,bfound,bleader) VALUES(NULL,'BanG','2019-01-03',11);
-- 北原春希
INSERT INTO bandt(bno,bname,bfound,bleader) VALUES(NULL,'WHITE','2013-10-05',17);
-- 有马公生
INSERT INTO bandt(bno,bname,bfound,bleader) VALUES(NULL,'April','2014-10-09',18);

-- 插入专辑数据
-- 需要先查询到 乐队id 才能插

INSERT INTO albumt(ano,aname,apublishtime,aband)VALUES(NULL,'konmusic','2009-04-02',1);

INSERT INTO albumt(ano,aname,apublishtime,aband)VALUES(NULL,'Euphoniummusic','2015-06-30',2);

INSERT INTO albumt(ano,aname,apublishtime,aband)VALUES(NULL,'BanGmusic','2019-01-03',3);

INSERT INTO albumt(ano,aname,apublishtime,aband)VALUES(NULL,'WHITEmusic','2013-10-05',4);

INSERT INTO albumt(ano,aname,apublishtime,aband)VALUES(NULL,'Aprilmusic','2014-10-09',5);

-- 插入歌曲数据
-- 需要先查询到 专辑id 才能插

INSERT INTO songst(sno,sname,sablum)VALUES(NULL,'song1',5);

INSERT INTO songst(sno,sname,sablum)VALUES(NULL,'song2',4);

INSERT INTO songst(sno,sname,sablum)VALUES(NULL,'song3',3);

INSERT INTO songst(sno,sname,sablum)VALUES(NULL,'song4',2);

INSERT INTO songst(sno,sname,sablum)VALUES(NULL,'song5',1);

-- 插入歌迷数据

INSERT INTO fanst(fno,fname,fsex,fage)VALUES(NULL,'安德烈','male',28);
INSERT INTO fanst(fno,fname,fsex,fage)VALUES(NULL,'武田绫乃','female',18);
INSERT INTO fanst(fno,fname,fsex,fage)VALUES(NULL,'藤本树','male',9);
INSERT INTO fanst(fno,fname,fsex,fage)VALUES(NULL,'白非立','male',20);
INSERT INTO fanst(fno,fname,fsex,fage)VALUES(NULL,'陈睿','male',38);
INSERT INTO fanst(fno,fname,fsex,fage)VALUES(NULL,'麻枝准','male',48);
INSERT INTO fanst(fno,fname,fsex,fage)VALUES(NULL,'露娜','female',21);
INSERT INTO fanst(fno,fname,fsex,fage)VALUES(NULL,'佩洛','male',57);
INSERT INTO fanst(fno,fname,fsex,fage)VALUES(NULL,'纳什','male',15);
INSERT INTO fanst(fno,fname,fsex,fage)VALUES(NULL,'金田一','male',37);

-- 插入演奏表
-- 乐队号，歌曲号;sno=bno+3%5+1
INSERT INTO playst(bno,sno)VALUES(1,5);
INSERT INTO playst(bno,sno)VALUES(2,1);
INSERT INTO playst(bno,sno)VALUES(3,2);
INSERT INTO playst(bno,sno)VALUES(4,3);
INSERT INTO playst(bno,sno)VALUES(5,4);
INSERT INTO playst(bno,sno)VALUES(1,4);
INSERT INTO playst(bno,sno)VALUES(3,5);
INSERT INTO playst(bno,sno)VALUES(4,2);

-- 乐队成员表
INSERT INTO bandmenbert(bno,mno)VALUES(1,1);
INSERT INTO bandmenbert(bno,mno)VALUES(1,2);
INSERT INTO bandmenbert(bno,mno)VALUES(1,3);
INSERT INTO bandmenbert(bno,mno)VALUES(1,4);
INSERT INTO bandmenbert(bno,mno)VALUES(1,5);
INSERT INTO bandmenbert(bno,mno)VALUES(2,6);
INSERT INTO bandmenbert(bno,mno)VALUES(2,7);
INSERT INTO bandmenbert(bno,mno)VALUES(2,8);
INSERT INTO bandmenbert(bno,mno)VALUES(2,9);
INSERT INTO bandmenbert(bno,mno)VALUES(2,10);
INSERT INTO bandmenbert(bno,mno)VALUES(3,11);
INSERT INTO bandmenbert(bno,mno)VALUES(3,12);
INSERT INTO bandmenbert(bno,mno)VALUES(3,13);
INSERT INTO bandmenbert(bno,mno)VALUES(3,14);
INSERT INTO bandmenbert(bno,mno)VALUES(4,15);
INSERT INTO bandmenbert(bno,mno)VALUES(4,16);
INSERT INTO bandmenbert(bno,mno)VALUES(4,17);
INSERT INTO bandmenbert(bno,mno)VALUES(5,18);
INSERT INTO bandmenbert(bno,mno)VALUES(5,19);
INSERT INTO bandmenbert(bno,mno)VALUES(5,20);
INSERT INTO bandmenbert(bno,mno)VALUES(5,21);

-- 乐队粉丝表
INSERT INTO bandfanst(fno,bno)VALUES(1,5);
INSERT INTO bandfanst(fno,bno)VALUES(2,4);
INSERT INTO bandfanst(fno,bno)VALUES(3,3);
INSERT INTO bandfanst(fno,bno)VALUES(4,2);
INSERT INTO bandfanst(fno,bno)VALUES(5,1);
INSERT INTO bandfanst(fno,bno)VALUES(6,1);
INSERT INTO bandfanst(fno,bno)VALUES(7,2);
INSERT INTO bandfanst(fno,bno)VALUES(8,3);

-- 成员粉丝表
INSERT INTO memberfanst(fno,mno)VALUES(1,1);
INSERT INTO memberfanst(fno,mno)VALUES(3,6);
INSERT INTO memberfanst(fno,mno)VALUES(5,11);
INSERT INTO memberfanst(fno,mno)VALUES(7,15);
INSERT INTO memberfanst(fno,mno)VALUES(9,18);
INSERT INTO memberfanst(fno,mno)VALUES(2,5);
INSERT INTO memberfanst(fno,mno)VALUES(4,8);
INSERT INTO memberfanst(fno,mno)VALUES(6,16);
INSERT INTO memberfanst(fno,mno)VALUES(8,17);
INSERT INTO memberfanst(fno,mno)VALUES(10,18);
INSERT INTO memberfanst(fno,mno)VALUES(3,7);
INSERT INTO memberfanst(fno,mno)VALUES(6,19);
INSERT INTO memberfanst(fno,mno)VALUES(9,21);

-- 专辑粉丝表
INSERT INTO ablumfanst(fno,ano)VALUES(10,1);
INSERT INTO ablumfanst(fno,ano)VALUES(9,2);
INSERT INTO ablumfanst(fno,ano)VALUES(8,3);
INSERT INTO ablumfanst(fno,ano)VALUES(7,4);
INSERT INTO ablumfanst(fno,ano)VALUES(6,5);
INSERT INTO ablumfanst(fno,ano)VALUES(5,5);
INSERT INTO ablumfanst(fno,ano)VALUES(4,4);
INSERT INTO ablumfanst(fno,ano)VALUES(3,2);

-- 歌曲粉丝表
INSERT INTO songfanst(fno,sno)VALUES(10,1);
INSERT INTO songfanst(fno,sno)VALUES(9,2);
INSERT INTO songfanst(fno,sno)VALUES(8,3);
INSERT INTO songfanst(fno,sno)VALUES(7,4);
INSERT INTO songfanst(fno,sno)VALUES(6,5);
INSERT INTO songfanst(fno,sno)VALUES(5,5);
INSERT INTO songfanst(fno,sno)VALUES(4,4);
INSERT INTO songfanst(fno,sno)VALUES(3,3);
INSERT INTO songfanst(fno,sno)VALUES(2,2);
INSERT INTO songfanst(fno,sno)VALUES(1,1);

-- 查询语句
SELECT * FROM menbert;
SELECT * FROM bandt;
SELECT * FROM albumt;
SELECT * FROM songst;
SELECT * FROM fanst;
SELECT * FROM playst;
SELECT * FROM bandmenbert;
SELECT * FROM bandfanst;
SELECT * FROM memberfanst;
SELECT * FROM ablumfanst;
SELECT * FROM songfanst;

show tables;