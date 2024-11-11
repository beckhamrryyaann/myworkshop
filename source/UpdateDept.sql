create or replace procedure UpdateDepartment(
  IN deptno char(3),
  IN newName char(36),
  IN newManager char(6),
  IN parentDepartment char(3),
  IN newLocation char(16)
)
LANGUAGE RPGLE
MODIFIES SQL DATA
EXTERNAL NAME UPDDEPT GENERAL;