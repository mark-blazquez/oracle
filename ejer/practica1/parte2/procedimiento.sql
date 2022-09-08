create procedure salario_medio(departamento) as 
	salario employees.salary%TYPE
	departamento employees.department_id%TYPE
	BEGIN
		select avg(salary) into salario where department_id=departamento
		DBMS_OUTPUT.PUT_LINE(salario); 
	END;
-- para ejecutarlo
SET SERVEROUTPUT ON;
begin
	salario_medio(departamento =>2);
end;
/
/*borrar
DROP PROCEDURE nombre_procedimiento;
*/