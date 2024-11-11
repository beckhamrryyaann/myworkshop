**free

ctl-opt dftactgrp(*no);

dcl-ds departments extname('DEPARTMENT') template;
end-ds;

dcl-ds rows likeds(departments) dim(100);

dcl-s maxRows uns(5) inz(%elem(rows)) ;

// Handle nulls correctly, since nulls in RPG aren't nice
exec sql
  declare c0 cursor for
  select
    deptno,
    deptname,
    ifnull(mgrno, '-1') as mgrno,
    admrdept,
    ifnull(location, 'Unknown') as location
  from sample.department
  for read only ;

exec sql open c0 ;

exec sql fetch c0 for :maxRows rows into :rows ;

exec sql close c0 ;

exec sql set result sets array :rows for 10 rows;

return;