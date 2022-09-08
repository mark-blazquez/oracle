SET SERVEROUTPUT ON;
SET VERIFY OFF;
declare
	codempleado number(3) ;
	nombre varchar(20) ;
	apellido varchar(20) ;
begin
	select last_name into apellido from  employees where EMPLOYEE_ID='&codempleado';
	select first_name into nombre from  employees where EMPLOYEE_ID='&codempleado';
	DBMS_OUTPUT.PUT_LINE('el nombre es '||nombre||'y el apellido '||apellido);

	EXCEPTION
	WHEN NO_DATA_FOUND THEN
	DBMS_OUTPUT.PUT_LINE('NO HAY DATOS QUE MOSTRAR');
end;
/