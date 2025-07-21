SELECT STACK(3,1,date '2015-01-01','z',2,date '2016-01-01','y',3,date '2017-08-09','x') AS (col0,col1,col2)
  UNION ALL
 SELECT STACK(3,4,date '2015-01-01','n',5,date '2016-01-01','m',6,date '2017-08-09','l') AS (col0,col1,col2);

EXPLAIN CBO SELECT STACK(3,1,date '2015-01-01','z',2,date '2016-01-01','y',3,date '2017-08-09','x') AS (col0,col1,col2)
  UNION ALL
 SELECT STACK(3,4,date '2015-01-01','n',5,date '2016-01-01','m',6,date '2017-08-09','l') AS (col0,col1,col2);

SELECT * FROM (VALUES(1, 'yellow'), (2, 'orange')) AS Colors1
  UNION ALL
 SELECT * FROM (VALUES(10, 'green'), (11, 'blue')) AS Colors2
  UNION ALL
 SELECT STACK(2,10,'X',20,'Y');

EXPLAIN CBO SELECT * FROM (VALUES(1, 'yellow'), (2, 'orange')) AS Colors1
  UNION ALL
 SELECT * FROM (VALUES(10, 'green'), (11, 'blue')) AS Colors2
  UNION ALL
 SELECT STACK(2,10,'X',20,'Y');

SELECT INLINE(array(struct('A',10,date '2015-01-01'),struct('B',20,date '2015-02-02')))
  UNION ALL
 SELECT INLINE(array(struct('C',30,date '2016-01-01'),struct('D',40,date '2016-02-02')));

EXPLAIN CBO SELECT INLINE(array(struct('A',10,date '2015-01-01'),struct('B',20,date '2015-02-02')))
  UNION ALL
 SELECT INLINE(array(struct('C',30,date '2016-01-01'),struct('D',40,date '2016-02-02')));

SELECT INLINE(array(struct('A',10,date '2015-01-01'),struct('B',20,date '2015-02-02')))
  UNION ALL
 SELECT INLINE(array(struct('C',30,date '2016-01-01'),struct('D',40,date '2016-02-02')))
  UNION ALL
 SELECT STACK(2,'X',50,date '2017-01-01','Y',60,date '2017-01-01');

EXPLAIN CBO SELECT INLINE(array(struct('A',10,date '2015-01-01'),struct('B',20,date '2015-02-02')))
  UNION ALL
 SELECT INLINE(array(struct('C',30,date '2016-01-01'),struct('D',40,date '2016-02-02')))
  UNION ALL
 SELECT STACK(2,'X',50,date '2017-01-01','Y',60,date '2017-01-01');
