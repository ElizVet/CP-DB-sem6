-- Директория в Oracle, место сохранения файла 
CREATE DIRECTORY XML_DIR AS 'D:\app\ora_install_user\xml';
select * from dba_directories where directory_name='XML_DIR';

grant read, write on directory XML_DIR to C##SHIM;
grant datapump_exp_full_database TO C##SHIM;

select * from TESTPUBLICATIONS;