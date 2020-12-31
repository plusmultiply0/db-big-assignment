CREATE DATABASE banddb;
USE banddb;

/* 建表 */
/* 乐队成员表 */
CREATE table menbert(
    mno int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    mname varchar(20),
    mjointime date,
    mleavetime date,
);
/* 乐队表 */
-- 每个乐队的领队唯一
CREATE table bandt(
    bno int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    bname varchar(30),
    bfound date,
    bleader int UNIQUE,
    FOREIGN KEY(bleader) REFERENCES menbert(mno),
);
/* 专辑表 */
CREATE table albumt(
    ano int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    aname varchar(30),
    apublishtime date,
    aband int,
    FOREIGN KEY(aband) REFERENCES bandt(bno)
);
/* 歌曲表 */
CREATE table songst(
    sno int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    sname varchar(30),
    sablum int,
    FOREIGN KEY(sablum) REFERENCES albumt(ano)
);
/* 歌迷表 */
CREATE table fanst(
    fno int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    fname varchar(20),
    fsex char(10),
    fage INT CHECK(fage>=000 AND fage<=200)
);
-- 下为关系表
/* 演奏表 */
-- 歌曲和乐队也是多对多关系
CREATE table playst(
    bno int,
    sno int,
    FOREIGN KEY(bno) REFERENCES bandt(bno),
    FOREIGN KEY(sno) REFERENCES songst(sno)
);
/* 乐队成员表 */
-- 每个乐队成员同一时期只能加入一支乐队
CREATE table bandmenbert(
    bno int UNIQUE,
    mno int,
    FOREIGN KEY(bno) REFERENCES bandt(bno),
    FOREIGN KEY(mno) REFERENCES menbert(mno)
);
-- 粉丝与乐队，成员，专辑，歌曲多对多关系
/* 乐队粉丝表 */
CREATE table bandfanst(
    fno int,
    bno int,
    FOREIGN KEY(bno) REFERENCES bandt(bno),
    FOREIGN KEY(fno) REFERENCES fanst(fno)
);
/* 成员粉丝表 */
CREATE table memberfanst(
    fno int,
    mno int,
    FOREIGN KEY(fno) REFERENCES fanst(fno),
    FOREIGN KEY(mno) REFERENCES menbert(mno)
);
/* 专辑粉丝表 */
CREATE table ablumfanst(
    fno int,
    ano int,
    FOREIGN KEY(fno) REFERENCES fanst(fno),
    FOREIGN KEY(ano) REFERENCES albumt(ano)
);
/* 歌曲粉丝表 */
CREATE table songfanst(
    fno int,
    sno int,
    FOREIGN KEY(fno) REFERENCES fanst(fno),
    FOREIGN KEY(sno) REFERENCES songst(sno)
);

