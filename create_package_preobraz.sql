CREATE OR REPLACE PACKAGE preobraz AS 
Function Min_in_hour ( duration IN varchar2 )
   RETURN varchar2;
Function Rating_description (rating IN varchar2)
 RETURN varchar2;
Function check_year
   ( release_year IN NUMBER )
   RETURN BOOLEAN;
end preobraz;

CREATE OR REPLACE PACKAGE BODY preobraz AS
 Function Min_in_hour
   ( duration IN varchar2 )
   RETURN varchar2
IS
result varchar2(200);
begin
select  to_char(floor(to_number(replace(duration,' min',''))/60)) || 'h ' || to_char(mod(to_number(replace(duration,' min','')),60))  || 'min' into result
from dual;
return result;
END;

Function Rating_description
(rating IN varchar2)
 RETURN varchar2
 IS
 result varchar2(200);
begin
case when rating='TV-14'
then return '';
when rating='R'
then return '';
when rating='NC-17'
then return '';
when rating='TV-MA'
then return '';
when rating='PG-13'
then return '';
when rating='UR'
then return ' ';
when rating='PG'
then return '';
when rating='TV-Y7'
then return '';
when rating='NR'
then return ' ';
when rating='TV-Y'
then return '';
when rating='TV-PG'
then return '';
when rating='TV-G'
then return '';
when rating='G'
then return '';
when rating='TV-Y7-FV'
then return '';
end case;
end; 

Function check_year
   ( release_year IN NUMBER )
   RETURN BOOLEAN
IS
result BOOLEAN;
begin
if length(to_char(release_year ))<>4
then result:=false;
else
result:=true;
end if;
return result;
END;

end Preobraz;


