SET SERVEROUTPUT ON;
SET VERIFY OFF;
declare
  /*nombre variable*/numero1 /*tipo variable*/number(4) := /*lo que pide por pantalla*/&numero1;
  numero2 number(4) := &numero2;
  numero3 number(4) := &numero3;

begin
--imprimir por pantalla
   DBMS_OUTPUT.PUT_LINE('El valor introducido es ' || numero2);
end;
/