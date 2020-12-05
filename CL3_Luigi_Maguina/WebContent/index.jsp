<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css"/>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<title>CL3_Luigi Maguiña Gonzáles</title>
<style>
	.modal-header, h4, .close {
		background-color: #286090;
		color: white !important;
		text-align: center;
		font-size: 20px;
	}
	.help-block{
	 color: red;
	}
	
	.form-group.has-error .form-control-label {
	  color: red;
	}
	
	.form-group.has-error .form-control {
	  border: 1px solid red;
	  box-shadow: 0 0 0 0.2rem rgba(250, 16, 0, 0.18);
	}
	
	
	.dataTables_length{
	 display: none;
	}
	.dataTables_filter{
		text-align: right;
	}
	.dataTables_info{
	 display: none;
	}
	.dataTables_paginate{
		cursor: pointer;
	}
	
</style>
</head>
<body>
<c:if test="${sessionScope.MENSAJE!=null}">
<div class="alert alert-warning alert-dismissible fade show" role="alert" id="success-alert">
  <strong>Sistema:</strong> ${sessionScope.MENSAJE}
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
</c:if>
<c:remove var="MENSAJE"/>

<div class="modal fade" id="idModalDelete" data-backdrop="static">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">Confirmar</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">¿Está Seguro de eliminar el producto?</div>
			<div class="modal-footer">
				<form action="delete" method="post" name="myForm">	
					<input type="hidden" id="idMercaderia" name="mercaderia.id">
					<button type="submit" class="btn btn-primary">SI</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">NO</button>
				</form>
			</div>
		</div>
	</div>
</div>

<div class="container">
	<h3 align="center">Lista de Productos</h3>
	<button type="button" data-toggle='modal'  data-target="#idModalInsert" id="idNuevo" class='btn btn-primary' >Nuevo Producto</button><br>&nbsp;<br>
	<div id="divProducto">
		<table id="idTable" class="table table-striped table-bordered m-0" style="width:100%">
			<thead>
				<tr>
					<th>Nombre</th>
					<th>Stock</th>
					<th>Precio</th>
					<th>Tipo</th>
					<th>Accion</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>	
	</div>
	
	<div class="modal fade bd-example-modal-lg" id="idModalInsert" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header" style="padding: 5px 20px">
					Registro de Producto
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body" style="padding: 20px 20px;">
					<form id="idRegistra" accept-charset="UTF-8" action="save" 
									class="form-horizontal" method="post" 
									data-toggle="validator" role="form">						
						<div class="form-group">
							<label for="staticEmail">Nombre</label>
							<input class="form-control" id="idNombre" name="mercaderia.nombre" placeholder="Ingrese  Nombre de producto"/>
						</div>    
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="staticEmail">Stock</label>
								<input class="form-control" id="idStock" name="mercaderia.stock" placeholder="Ingrese stock inicial"/>
							</div>
							<div class="form-group col-md-6">
								<label for="staticEmail">Precio</label>
								<input class="form-control" id="idPrecio" name="mercaderia.precio" placeholder="Ingrese precio de venta"/>
							</div>
						</div>    
						<div class="form-group">
							<label for="staticEmail">Tipo</label>
							<select id="idTipo" name="mercaderia.idTipo" class='form-control'>
								<option value=" " >[SELECCIONE]</option>
							</select>
						</div>
						
						<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal" id="btnCerrar">Cerrar</button>
						<button type="submit" class="btn btn-primary">Guardar</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade bd-example-modal-lg" id="idModalUpdate" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header" style="padding: 5px 20px">
					Actualizar Producto
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body" style="padding: 20px 20px;">
					<form id="idActualiza" accept-charset="UTF-8" action="update" 
									class="form-horizontal" method="post" 
									data-toggle="validator" role="form">
						<input type="hidden" id="idMerc" name="mercaderia.id">
						<div class="form-group">
							<label for="staticEmail">Nombre</label>
							<input class="form-control" id="idName" name="mercaderia.nombre" placeholder="Ingrese  Nombre de producto"/>
						</div>    
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="staticEmail">Stock</label>
								<input class="form-control" id="idStk" name="mercaderia.stock" placeholder="Ingrese stock inicial"/>
							</div>
							<div class="form-group col-md-6">
								<label for="staticEmail">Precio</label>
								<input class="form-control" id="idPrice" name="mercaderia.precio" placeholder="Ingrese precio de venta"/>
							</div>
						</div>    
						<div class="form-group">
							<label for="staticEmail">Tipo</label>
							<select id="idType" name="mercaderia.idTipo" class='form-control'>
								<option value=" " >[SELECCIONE]</option>
							</select>
						</div>
						
						<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal" id="btnCerrar">Cerrar</button>
						<button type="submit" class="btn btn-primary">Guardar</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		fillTipo();
		fillMercaderia();
		
	$('#idRegistra').bootstrapValidator({      
	  	 fields:{
	  		 Nombre: {
	    		selector:'#idNombre',
	              validators: {
	                  notEmpty: {
	                      message: 'Ingrese nombre de producto'
	                  },
	                  regexp: {
	                      regexp: /^.{3,40}$/,
	                      message: 'Ingresar de 3 a 40 caracteres'
	                  },
	              }
	          },
	          Apellido: {
	    		selector:'#idStock',
	              validators: {
	              	notEmpty: {
	                      message: 'Ingrese stock inicial'
	                  },
	                  regexp: {
	                      regexp: /^[0-9]\d{0,2}$/,
	                      message: 'Ingresar número entre 0 y 999'
	                  },
	              }
	          },
	          Edad: {
	    		selector:'#idPrecio',
	              validators: {
	                  notEmpty: {
	                      message: 'Ingrese precio de venta'
	                  },
	                  regexp: {
	                      regexp: /^[1-9]\d{0,}(?:.\d{2})?$/,
	                      message: 'Precio debe ser valor entero o real'
	                  },
	              }
	          },
	          Distrito: {
	    		selector:'#idTipo',   
	              validators: {    
	                  notEmpty: {    
	                      message: 'Seleccione Distrito'    
	                  },					
	              }    
	          } 
	  	 }
	  });
	});
	
	var codTipo=0;
	
	function fillTipo(){
		$.getJSON("listTipo",{},function (response){
			$.each(response.listaTipo,function(index,item){
				$("#idTipo").append("<option value='"+item.id+"'>"+item.nombre+"</option>");
				$("#idType").append("<option value='"+item.id+"'>"+item.nombre+"</option>");
			})	
		})
	}
	function fillMercaderia(){
		$.getJSON("listMercaderia",{},function (response){
			$.each(response.listaMercaderia,function(index,item){
				$("#idTable").append("<tr><td>"+item.nombre+"</td><td>"+item.stock+"</td><td>"+item.precio+"</td><td>"+item.tipo+"</td><td><li class=\"list-inline-item\"><button class=\"btn btn-primary btn-sm rounded-0\" type=\"button\" data-toggle=\"modal\" data-target=\"#idModalUpdate\" data-placement=\"top\" title=\"Editar\" data-id="+item.id+" data-name="+item.nombre+" data-stock="+item.stock+" data-name="+item.nombre+" data-price="+item.precio+" data-type="+item.idTipo+" id=\"btnEditar\"><i class=\"fa fa-edit\"></i></button></li><li class=\"list-inline-item\"><button class=\"btn btn-danger btn-sm rounded-0\" type=\"button\" data-toggle=\"modal\" data-target=\"#idModalDelete\" data-placement=\"top\" title=\"Eliminar\" data-id="+item.id+" id=\"btnEliminar\"><i class=\"fa fa-trash\"></i></button></li></td></tr>");
			})
			
			$("#idTable").DataTable();
		})
	}
	
	$("#success-alert").fadeTo(3000,1, function(){	
	    $("#success-alert").slideUp(500);
	
	});
	
	$(document).on('click', '#btnEliminar', function(event){
		$("#idModalDelete").find("#idMercaderia").val($(this).data("id"));
	})
	
	$(document).on('click', '#btnEditar', function(){
		$("#idModalUpdate").find("#idMerc").val($(this).data("id"));
		$("#idModalUpdate").find("#idName").val($(this).data("name"));
		$("#idModalUpdate").find("#idStk").val($(this).data("stock"));
		$("#idModalUpdate").find("#idPrice").val($(this).data("price"));
		$("#idModalUpdate").find("#idType").val($(this).data("type"));
	})
	$(document).on('click', '#btnCerrar', function(){
		$('#idRegistra').data('bootstrapValidator').resetForm(true);
	    $('#idRegistra').trigger("reset");
		$("#idCodigo").val(0); 
	})
</script>
</body>
</html>