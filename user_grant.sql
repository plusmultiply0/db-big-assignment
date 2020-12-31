use banddb;
-- for band user
-- mysql -u band -p -h localhost -P 3306
CREATE USER 'band'@localhost identified by'123456';
-- 维护乐队信息、成员信息、专辑信息、歌曲信息
-- 可以查看歌迷信息，
grant all on table bandt to 'band'@localhost;
grant all on table menbert to 'band'@localhost;
grant all on table albumt to 'band'@localhost;
grant all on table songst to 'band'@localhost;

grant all on table playst to 'band'@localhost;
grant all on table bandmenbert to 'band'@localhost;

grant SELECT on table fanst to 'band'@localhost;


-- for fan user
-- mysql -u fan -p -h localhost -P 3306
CREATE USER 'fan'@localhost identified by'123456';
-- 维护歌迷信息、喜欢的乐队、成员、专辑、歌曲信息
-- 查看乐队信息、成员信息、专辑信息、歌曲信息等
grant all on table fanst to 'fan'@localhost;
grant all on table bandfanst to 'fan'@localhost;
grant all on table memberfanst to 'fan'@localhost;
grant all on table ablumfanst to 'fan'@localhost;
grant all on table songfanstc to 'fan'@localhost;

grant SELECT on table bandt to 'fan'@localhost;
grant SELECT on table menbert to 'fan'@localhost;
grant SELECT on table albumt to 'fan'@localhost;
grant SELECT on table songst to 'fan'@localhost;

-- VIEWS-------------------------------------------------------------------
-- mysql -u band1 -p -h localhost -P 3306
CREATE USER 'band1'@localhost identified by'123456';

-- create views
-- 管理自己乐队、成员、专辑、歌曲相关信息
-- 查看自己的歌迷信息
-- band1 refer to bno=1
-- bandt
CREATE VIEW bandtfor1 AS
SELECT * FROM bandt WHERE bno=1;
-- bandmenbert
CREATE VIEW bandmenbertfor1 AS
SELECT * FROM bandmenbert WHERE bno=1;
-- albumt
CREATE VIEW albumtfor1 AS
SELECT * FROM albumt WHERE aband=1;
-- playst
CREATE VIEW playstfor1 AS
SELECT * FROM playst WHERE bno=1;
-- bandfanst
CREATE VIEW bandfanstfor1 AS
SELECT * FROM bandfanst WHERE bno=1;

-- 显示所有的视图
SHOW FULL TABLES 
WHERE table_type = 'VIEW';

-- grant
grant all on bandtfor1 to 'band1'@localhost;
grant all on bandmenbertfor1 to 'band1'@localhost;
grant all on albumtfor1 to 'band1'@localhost;
grant all on playstfor1 to 'band1'@localhost;
grant SELECT on bandfanstfor1 to 'band1'@localhost;

-- for fan1
-- mysql -u fan1 -p -h localhost -P 3306
CREATE USER 'fan1'@localhost identified by'123456';
-- create views
-- 管理自己喜欢的乐队、成员、专辑、歌曲相关信息
-- 维护自己的歌迷信息
-- fan1 refer to fno=3
-- bandfanst
CREATE VIEW bandfanstfor3 AS
SELECT * FROM bandfanst WHERE fno=3;
-- memberfanst
CREATE VIEW memberfanstfor3 AS
SELECT * FROM memberfanst WHERE fno=3;
-- ablumfanst
CREATE VIEW ablumfanstfor3 AS
SELECT * FROM ablumfanst WHERE fno=3;
-- songfanst
CREATE VIEW songfanstfor3 AS
SELECT * FROM songfanst WHERE fno=3;
-- fanst
CREATE VIEW fanstfor3 AS
SELECT * FROM fanst WHERE fno=3;

-- 显示所有的视图
SHOW FULL TABLES 
WHERE table_type = 'VIEW';

-- grant
grant all on bandfanstfor3 to 'fan1'@localhost;
grant all on memberfanstfor3 to 'fan1'@localhost;
grant all on ablumfanstfor3 to 'fan1'@localhost;
grant all on songfanstfor3 to 'fan1'@localhost;
grant all on fanstfor3 to 'fan1'@localhost;

-- to test all users----------------------------------------------------

-- for band user
-- 维护乐队信息、成员信息、专辑信息、歌曲信息
-- 可以查看歌迷信息
-- mysql -u band -p -h localhost -P 3306
use banddb;
show grants;--截图
show tables;--截图
-- 查询语句，截图

-- for fan user
-- 维护歌迷信息、喜欢的乐队、成员、专辑、歌曲信息
-- 查看乐队信息、成员信息、专辑信息、歌曲信息等
-- mysql -u fan -p -h localhost -P 3306
use banddb;
show grants;
show tables;

-- fpr band1 user
-- band1 refer to bno=1
-- 管理自己乐队、成员、专辑、歌曲相关信息
-- 查看自己的歌迷信息
-- mysql -u band1 -p -h localhost -P 3306
use banddb;
show grants;
show tables;

-- 1.
SELECT * FROM bandtfor1;
UPDATE bandtfor1 set bname='knobest' WHERE bno=1;
UPDATE bandtfor1 set bname='kno' WHERE bno=1;
-- 2.
SELECT * FROM bandmenbertfor1;
DELETE FROM bandmenbertfor1 WHERE mno=5;
INSERT INTO bandmenbertfor1(bno,mno)VALUES(1,5);
-- 3.
SELECT * FROM albumtfor1;
UPDATE albumtfor1 set aname='konmusic_updated' WHERE aband=1;
DELETE FROM albumtfor1 WHERE aband=1;
INSERT INTO albumtfor1(ano,aname,apublishtime,aband)VALUES(NULL,'konmusic','2009-04-02',1);
-- 4.
SELECT * FROM playstfor1;
UPDATE playstfor1 set sno=4 WHERE bno=1 AND sno=5;
DELETE FROM playstfor1 WHERE bno=1 AND sno=4;
INSERT INTO playstfor1(bno,sno)VALUES(1,5); 
INSERT INTO playstfor1(bno,sno)VALUES(1,4); 
-- 5.
SELECT * FROM bandfanstfor1;
INSERT INTO bandfanstfor1(fno,bno)VALUES(3,1);
DELETE FROM bandfanstfor1 WHERE fno=3 AND bno=1;


-- for fan1 user
-- fan1 refer to fno=3
-- 管理自己喜欢的乐队、成员、专辑、歌曲相关信息
-- 维护自己的歌迷信息
-- mysql -u fan1 -p -h localhost -P 3306
use banddb;
show grants;
show tables;

-- 1.
SELECT * FROM fanstfor3;
UPDATE fanstfor3 set fage=19 WHERE fno=3;
-- 2.
SELECT * FROM bandfanstfor3;
INSERT INTO bandfanstfor3(fno,bno)VALUES(3,1);
UPDATE bandfanstfor3 set bno=5 WHERE fno=3 AND bno=1;
DELETE FROM bandfanstfor3 WHERE fno=3 AND bno=5;
-- 3.
SELECT * FROM memberfanstfor3;
INSERT INTO memberfanstfor3(fno,mno)VALUES(3,1);
UPDATE memberfanstfor3 set mno=5 WHERE fno=3 AND mno=1;
DELETE FROM memberfanstfor3 WHERE fno=3 AND mno=5;
-- 4.
SELECT * FROM ablumfanstfor3;
INSERT INTO ablumfanstfor3(fno,ano)VALUES(3,1);
UPDATE ablumfanstfor3 set ano=5 WHERE fno=3 AND ano=1;
DELETE FROM ablumfanstfor3 WHERE fno=3 AND ano=5;
-- 5.
SELECT * FROM songfanstfor3;
INSERT INTO songfanstfor3(fno,sno)VALUES(3,1);
UPDATE songfanstfor3 set sno=5 WHERE fno=3 AND sno=1;
DELETE FROM songfanstfor3 WHERE fno=3 AND sno=5;