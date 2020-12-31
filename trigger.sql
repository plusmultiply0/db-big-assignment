-- 乐队表添加属性：成员人数
ALTER table bandt ADD COLUMN bsum smallint;

-- 添加乐队人数属性值
UPDATE bandt set bsum=5 WHERE bno=1;
UPDATE bandt set bsum=5 WHERE bno=2;
UPDATE bandt set bsum=4 WHERE bno=3;
UPDATE bandt set bsum=3 WHERE bno=4;
UPDATE bandt set bsum=4 WHERE bno=5;

-- trigger
-- mysql trigger 一次只能定义一个trigger_event(insert|delete|update)
-- 所以此处定义了两个trigger
-- bandmenbert为乐队成员关系表

-- 新增成员后
DELIMITER $
CREATE TRIGGER add_bandmember
AFTER insert on bandmenbert
FOR EACH ROW
BEGIN
    UPDATE bandt set bsum=bsum+1 WHERE bno=new.bno;
END$
DELIMITER ;

-- 删除成员后
DELIMITER $
CREATE TRIGGER reduce_bandmember
AFTER delete on bandmenbert
FOR EACH ROW
BEGIN
    UPDATE bandt set bsum=bsum-1 WHERE bno=old.bno;
END$
DELIMITER ;

-- to test trigger ---------------------------------------------------------------------
-- 测试插入
INSERT INTO menbert(mno,mname,mjointime,mleavetime) VALUES (NULL,'工具人','2020-12-31',NULL);
INSERT INTO bandmenbert(bno,mno)VALUES(1,22);

SELECT * FROM bandt;

-- 测试删除
DELETE FROM bandmenbert WHERE mno=22;

SELECT * FROM bandt;