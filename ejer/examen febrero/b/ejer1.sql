SET SERVEROUTPUT ON;
SET VERIFY OFF;
declare
  numero1 number(4) := &numero1;
  numero2 number(4) := &numero2;
  numero3 number(4) := &numero3;
  pequeno number := null ;

begin
	IF numero1<numero2 then
		pequeno := numero1;
		IF numero1>numero3 then
			pequeno := numero3;
		END IF;
	ELSE
		pequeno := numero2;
		IF pequeno>numero3 then
			pequeno := numero3;
		END IF;
	END IF;

   	DBMS_OUTPUT.PUT_LINE('El valor introducido es ' || pequeno);

end;
/