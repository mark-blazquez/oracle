SET SERVEROUTPUT ON;
SET VERIFY OFF;
declare
	cursor primero is	
	SELECT
		employees.MANAGER_ID AS CODIGO_JEFE,
		employees.FIRST_NAME AS NOMBRE_JEFE,
		employees.LAST_NAME AS APELLIDO_JEFE,
		COUNT(employees.EMPLOYEE_ID) AS NUM_EMPLEADOS,
		SUM(employees.SALARY) AS SALARIOS
	FROM
		EMPLOYEES
	WHERE
		employees.MANAGER_ID = employees.EMPLOYEE_ID
	GROUP BY
		employees.MANAGER_ID,
		employees.FIRST_NAME,
		employees.LAST_NAME
	ORDER BY employees.MANAGER_ID;
begin
	open primero;
	LOOP
		fetch primero into;
		EXIT WHEN primero%NOTFOUND;
		IF primero.SALARIOS < 30000 THEN
			DBMS_OUTPUT.PUT_LINE('nombre'|NOMBRE_JEFE|'apellido'|APELLIDO_JEFE|);
			INSERT INTO superjefes(EMPLOYEE_ID) VALUES(CODIGO_JEFE);
		END IF;
	end loop;
	close primero;
end;
/