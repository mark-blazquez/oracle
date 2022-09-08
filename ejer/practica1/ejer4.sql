SET SERVEROUTPUT ON;
SET VERIFY OFF;

declare
	cod_empleado number(5) :=&cod_empleado;
	trabajos varchar (20);
	NOMBREDEPAR varchar(20);
	IDDEPAR varchar(20);

	cursor datos is 
	SELECT DEPARTMENT_NAME FROM DEPARTMENTS WHERE DEPARTMENT_ID in (SELECT DEPARTMENT_ID FROM JOB_HISTORY WHERE EMPLOYEE_ID='&cod_empleado');

begin
	open datos; 
		LOOP  
			fetch datos into trabajos ;
			EXIT WHEN datos%NOTFOUND;
			DBMS_OUTPUT.PUT_LINE(trabajos);
		end loop;
	close datos;

end;
/