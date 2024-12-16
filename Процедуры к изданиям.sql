-- добавление публикации
CREATE OR REPLACE PROCEDURE ADD_PUBLICATION (
  p_id IN INT,
  p_title IN VARCHAR2,
  p_author_id IN INT,
  p_genre_id IN INT,
  p_date IN DATE,
  p_type_id IN INT,
  p_pages IN INT
)
IS
  l_count INT;
BEGIN
  -- ѕровер€ем, существует ли запись с таким же идентификатором
  SELECT COUNT(*)
  INTO l_count
  FROM Publications
  WHERE publication_id = p_id;

  IF l_count = 0 THEN
    -- ≈сли записи с таким идентификатором нет, добавл€ем новую запись
    INSERT INTO Publications (
      publication_id,
      publication_title,
      publication_author_id,
      publication_genre_id,
      publication_date,
      publication_type_id,
      volume_in_pages
    ) VALUES (
      p_id,
      p_title,
      p_author_id,
      p_genre_id,
      p_date,
      p_type_id,
      p_pages
    );
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Publication added successfully.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Publication with the same ID already exists.');
  END IF;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Error adding publication: ' || SQLERRM);
END;


-----CHECKKKKK-----
BEGIN
  ADD_PUBLICATION(1, 'Title', 1, 1, SYSDATE, 1, 100);
END;
-------------------





