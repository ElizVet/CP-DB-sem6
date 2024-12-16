----- ДОБАВЛЕНИЕ ------
CREATE OR REPLACE PROCEDURE ADD_PRODUCT_TYPE(p_name IN VARCHAR2)
AS
  v_id NUMBER;
  v_count NUMBER;
BEGIN
  LOOP
    -- Генерация случайного пятизначного ID
    v_id := TRUNC(DBMS_RANDOM.VALUE(10000, 99999));

    -- Проверка на уникальность ID
    SELECT COUNT(*) INTO v_count
    FROM PRODUCTTYPES
    WHERE PRODUCT_TYPE_ID = v_id;

    EXIT WHEN v_count = 0;
  END LOOP;

  INSERT INTO PRODUCTTYPES
  VALUES (v_id, p_name);
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Error adding product type: ' || SQLERRM);
END;




----- ОБНОВЛЕНИЕ ------
CREATE OR REPLACE PROCEDURE UPDATE_PRODUCT_TYPE(OLD_NAME IN VARCHAR2, NEW_NAME IN VARCHAR2)
AS
BEGIN
  UPDATE PRODUCTTYPES
  SET PRODUCT_TYPE_NAME = NEW_NAME
  WHERE PRODUCT_TYPE_NAME = OLD_NAME;
  COMMIT;
  EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Error updating product type: ' || SQLERRM);
END;





----- УДАЛЕНИЕ ------
CREATE OR REPLACE PROCEDURE DELETE_PRODUCT_TYPE(P_NAME IN VARCHAR2)
AS
BEGIN
  delete from PRODUCTTYPES
  WHERE PRODUCT_TYPE_NAME = P_NAME;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    rollback;
    DBMS_OUTPUT.PUT_LINE('Error deleting product type: ' || SQLERRM);
END;






-----CHECKKKKK-----
begin
  ADD_PRODUCT_TYPE('GGGGG');
END;
begin
  UPDATE_PRODUCT_TYPE('GGGGG', 'Новое');
END;
begin
  DELETE_PRODUCT_TYPE('Новое');
END;
-------------------



SELECT * FROM PRODUCTTYPES;

