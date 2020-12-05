DELIMITER ;;
CREATE PROCEDURE `sp_listaTipo`()
BEGIN
	SELECT * from tipo;
END ;;

DELIMITER ;;
CREATE PROCEDURE `sp_listaMercaderia`()
BEGIN
	SELECT * from mercaderia;
END ;;

DELIMITER ;;
CREATE PROCEDURE `sp_listaMercaderiaExt`()
BEGIN
	SELECT A.idmercaderia AS 'id',A.nombre,A.stock,A.precio,B.idtipo,B.nombre AS 'tipo' from mercaderia A INNER JOIN tipo B ON A.idtipo=B.idtipo;
END ;;

ALTER TABLE mercaderia AUTO_INCREMENT=0;
ALTER TABLE tipo AUTO_INCREMENT=9;

DELIMITER ;;
CREATE PROCEDURE `sp_regMercaderia`(nom VARCHAR(45),stk int,pre DOUBLE, idTip int)
BEGIN
insert into mercaderia values(null,nom,stk,pre,idTip);
END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `sp_upMercaderia`(id int,nom VARCHAR(45),stk int,pre DOUBLE, idTip int)
BEGIN
update mercaderia SET nombre=nom,stock=stk,precio=pre,idtipo=idTip WHERE idmercaderia=id;
END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `sp_delMercaderia`(id int)
BEGIN
delete from mercaderia WHERE idmercaderia=id;
END ;;
DELIMITER ;

call sp_regMercaderia ('jane_doe',20,40.50,2);
call sp_listaMercaderiaExt;

SELECT Auto_increment FROM information_schema.tables WHERE TABLE_NAME='mercaderia';


SHOW VARIABLES LIKE 'auto_inc%';
SET @@auto_increment_increment=1;

