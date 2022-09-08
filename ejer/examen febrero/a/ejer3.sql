SET SERVEROUTPUT ON;
SET VERIFY OFF;
declare
  NOMBRE EMPLOYEES.FIRST_NAME%TYPE;
  APELLIDO EMPLOYEES.LAST_NAME%TYPE;
  iddepa EMPLOYEES.department_id%TYPE;
  lugar departments.location_id%TYPE;
  nombrelugar locations.state_province%TYPE;

begin

	select department_id INTO iddepa FROM employees where first_name= '&NOMBRE' and last_name='&APELLIDO';
	--DBMS_OUTPUT.PUT_LINE(iddepa);
	SELECT location_id INTO lugar FROM departments WHERE department_ID=iddepa;
	--DBMS_OUTPUT.PUT_LINE(lugar);
	SELECT state_province INTO nombrelugar FROM locations  WHERE location_id=lugar;
	DBMS_OUTPUT.PUT_LINE(nombrelugar);

EXCEPTION
	WHEN NO_DATA_FOUND THEN
	DBMS_OUTPUT.PUT_LINE('NO HAY DATOS QUE MOSTRAR');
	WHEN TOO_MANY_ROWS THEN
	DBMS_OUTPUT.PUT_LINE('ha surgido un error al mostrar varios anteriores puestos de trabajo');

end;
/
