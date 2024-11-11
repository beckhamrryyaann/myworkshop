call m24cbeck.depts();

call m24cbeck.UpdateDepartment('J22', 'New Department Name', '000010', 'D01', 'New Location');

select * from sample.department;