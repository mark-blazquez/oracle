SET SERVEROUTPUT ON;
SET VERIFY OFF;
declare
	cursor primero is	
	SELECT
		FIRST_NAME AS NOMBRE,
		LAST_NAME AS APELLIDO,
		JOB_HISTORY.EMPLOYEE_ID,
		COUNT(JOB_HISTORY.EMPLOYEE_ID) AS NUM_PUESTOS,
		SUM(END_DATE-START_DATE) AS DIAS
	FROM
		JOB_HISTORY, EMPLOYEES
	WHERE
		JOB_HISTORY.EMPLOYEE_ID=EMPLOYEES.EMPLOYEE_ID
	GROUP BY
		JOB_HISTORY.EMPLOYEE_ID,
		FIRST_NAME,
		LAST_NAME ;
begin
	open primero;
	LOOP
		fetch primero into;
		EXIT WHEN primero%NOTFOUND;
		IF primero.NUM_PUESTOS > 1 THEN
			if primero.dias > 1000 THEN
				DBMS_OUTPUT.PUT_LINE('nombre'|primero.NOMBRE|'apellido'|primero.APELLIDO|);
				INSERT INTO antiguedad(EMPLOYEE_ID) VALUES(primero.EMPLOYEE_ID);
			END IF;
		END IF;
	end loop;
	close primero;
end;
/