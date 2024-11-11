**free

ctl-opt dftactgrp(*no);

dcl-pi upddept;
  deptno char(3);
  deptname char(36);
  mgrno char(6);
  admrdept char(3);
  location char(16);
end-pi;

dcl-ds result qualified dim(1);
  success char(1);
end-ds;

exec sql
  update sample.department
    set deptname = :deptname,
        mgrno = :mgrno,
        admrdept = :admrdept,
        location = :location
    where deptno = :deptno;

if (SQLCOD = 0);
  result(1).success = 'Y';
else;
  result(1).success = 'N';
endif;

exec sql set result sets array :result for 1 rows;

return;