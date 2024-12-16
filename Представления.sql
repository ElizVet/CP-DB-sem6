CREATE OR REPLACE VIEW ORDERS_VIEW AS
select orders.order_id, customers.customer_name, orders.order_acceptance_date, 
      orders.order_completion_date, orders.order_circulation, publications.publication_title, orders.order_status
FROM ORDERS INNER JOIN CUSTOMERS ON ORDERS.ORDER_CUSTOMER_ID = CUSTOMERS.CUSTOMER_ID
            inner join publications on publications.publication_id = orders.order_publication_id;
            

create view publications_view as
select publications.publication_title, producttypes.product_type_name,
       authors.first_name, genres.genre_name, publications.publication_date,
       publications.VOLUME_IN_PAGES
from publications inner join producttypes on publications.publication_type_id = producttypes.product_type_id
                  inner join authors on publications.publication_author_id = authors.author_id
                  inner join genres on publications.publication_genre_id = genres.genre_id;
                  

create or replace 
PROCEDURE GET_ALL_ORDERS_VIEW (ORDERS_array out SYS.ODCIVARCHAR2LIST)
as
begin
  ORDERS_array := SYS.ODCIVARCHAR2LIST();
  for ORDERS_rec in (select  * from orders_view) 
  LOOP
    ORDERS_ARRAY.EXTEND;
    ORDERS_ARRAY(ORDERS_ARRAY.LAST) := ORDERS_REC.ORDER_ID || ',' || 
    orders_rec.customer_name || ',' || orders_rec.order_acceptance_date || ',' || 
    orders_rec.order_completion_date || ',' || orders_rec.order_circulation || ',' || 
    orders_rec.publication_title || ',' || orders_rec.order_status;
    
    dbms_output.put_line(ORDERS_REC.ORDER_ID || ',' || 
    orders_rec.customer_name || ',' || orders_rec.order_acceptance_date || ',' || 
    orders_rec.order_completion_date || ',' || orders_rec.order_circulation || ',' || 
    orders_rec.publication_title || ',' || orders_rec.order_status);
  END LOOP;
END;




create or replace 
PROCEDURE GET_ALL_publications_view (publications_array out SYS.ODCIVARCHAR2LIST)
as
  /*ORDERS_array SYS.ODCIVARCHAR2LIST := SYS.ODCIVARCHAR2LIST(); -- �������� ������� �������*/
begin
  publications_array := SYS.ODCIVARCHAR2LIST();
  for publications_rec in (select  * from publications_view) 
  LOOP
    publications_ARRAY.EXTEND;
    publications_ARRAY(publications_ARRAY.LAST) := publications_REC.publication_title || ',' || 
    publications_rec.product_type_name || ',' || publications_rec.first_name || ',' || 
    publications_rec.genre_name || ',' || publications_rec.publication_date || ',' || 
    publications_rec.VOLUME_IN_PAGES;
    
    dbms_output.put_line(publications_REC.publication_title || ',' || 
    publications_rec.product_type_name || ',' || publications_rec.first_name || ',' || 
    publications_rec.genre_name || ',' || publications_rec.publication_date || ',' || 
    publications_rec.VOLUME_IN_PAGES);
  END LOOP;
end;


// топ популярных изданий по кол-ву заказов
CREATE OR REPLACE PROCEDURE GetTopPopularPublications
AS
  CURSOR c_top_publications IS
    SELECT p.publication_id, p.publication_title, COUNT(o.order_id) AS order_count
    FROM Publications p
    inner join orders o on p.publication_id = o.order_publication_id
    WHERE o.order_acceptance_date >= SYSDATE - INTERVAL '1000' MONTH
    GROUP BY p.publication_id, p.publication_title
    ORDER BY order_count DESC
    FETCH FIRST 5 ROWS ONLY;
    
  v_publication_id Publications.publication_id%TYPE;
  v_publication_title Publications.publication_title%TYPE;
  v_order_count NUMBER;
BEGIN
  OPEN c_top_publications;
  
  DBMS_OUTPUT.PUT_LINE('Top 5 Popular Publications:');
  DBMS_OUTPUT.PUT_LINE('-------------------------');
  
  LOOP
    FETCH c_top_publications INTO v_publication_id, v_publication_title, v_order_count;
    EXIT WHEN c_top_publications%NOTFOUND;
    
    DBMS_OUTPUT.PUT_LINE('Publication ID: ' || v_publication_id);
    DBMS_OUTPUT.PUT_LINE('Publication Title: ' || v_publication_title);
    DBMS_OUTPUT.PUT_LINE('Order Count: ' || v_order_count);
    DBMS_OUTPUT.PUT_LINE('-------------------------');
  END LOOP;
  
  CLOSE c_top_publications;
end;

