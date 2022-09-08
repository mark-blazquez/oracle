/*SET SERVEROUTPUT ON;
SET VERIFY OFF;

declare
	cod_depar number :=&cod_depar;
	num_empleados number;

begin
	select count(first_name) into num_empleados from employees where DEPARTMENT_ID ='&cod_depar';
	DBMS_OUTPUT.PUT_LINE(num_empleados);
	

end;
/
*/
---crear funciones

create function contar_trabajadores(departamento in employees.DEPARTMENT_ID)
	return number is num_empleados ;
begin
	select count(first_name) into num_empleados from employees where DEPARTMENT_ID =departamento;
	EXCEPTION 
		WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('NO HAY DATOS QUE MOSTRAR');
	return num_empleados;
end contar_trabajadores;
/
--select de la funcion 
select contar_trabajadores(20) from employees;
---borrar
drop function contar_trabajadores;

