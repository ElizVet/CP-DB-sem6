// клиент. доступ только на чтение данных
create user c##client identified by 123
default tablespace tspublishinghouse
quota unlimited on tspublishinghouse;

grant create session to c##client;
grant execute on c##shim.get_all_publications_view to c##client;
grant execute on c##shim.GET_ALL_ORDERS_VIEW to c##client;
grant select on c##shim.ORDERS_VIEW to c##client;
grant select on c##shim.publications_view to c##client;
grant execute on c##shim.gettoppopularpublications to c##client;

// выполнение вывода инфо
declare
  ORDERS_array SYS.ODCIVARCHAR2LIST;
begin
  C##SHIM.GET_ALL_ORDERS_VIEW(ORDERS_array);
end;

declare
  publications_array SYS.ODCIVARCHAR2LIST;
begin
  C##SHIM.GET_ALL_publications_view(publications_array);
end;

begin
  C##SHIM.GetTopPopularPublications();
end;