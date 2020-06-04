use master

use northwind
drop database Proyecto
go
create database Proyecto
go 
use Proyecto

--Creacion de tablas de la base
go
create table tblProducto(
idProducto int identity primary key,
nombreProducto varchar(50),
precioProducto float,
cantidadProducto int

);

go
create table tblCliente(
idCliente int identity primary key,
nombreCliente varchar(50),
apellidoCliente varchar(50),
direccionCliente varchar(50),
cedula varchar(10),
correo varchar(50),
);

go
create table tblCargo(
idCargo int identity primary key,
nombreCargo varchar(50),
sueldo float
);

go
create table tblEmpleado(
idEmpleado int identity primary key,
nombreEmpleado varchar(50),
apellidoEmpleado varchar(50),
cedula varchar(10),
idCargo int,
--foreign key (idCargo) references tblCargo (idCargo)
);

go
create table tblFactura(
idFactura int identity primary key,
fechaEmision date,
subtotal float,
total float,
idCliente int,
--foreign key (idCliente) references tblCliente (idCliente),
idEmpleado int,
--foreign key (idEmpleado) references tblEmpleado (idEmpleado)
);


go
create table tblFacturaBar(
idFacturaBar int identity primary key,
idCliente int,
--foreign key (idProducto) references tblProducto (idProducto),
--idFactura int,
--foreign key (idFactura) references tblFactura (idFactura)
subtotal float,
total float


);


go
create table tblFacturaBarProducto(
idFacturaBarProducto int identity primary key,
cantidad int,
idProducto int,
--foreign key (idProducto) references tblProducto (idProducto),
idFacturaBar int,
--foreign key (idFacturaBar) references tblFacturaBar (idFacturaBar)
);


go
create table tblActividades(
idActividad int identity primary key,
descripcion varchar(50),
idCargo int,
--foreign key (idCargo) references tblCargo (idCargo)
);


go
create table tblAudio(
idAudio int identity primary key,
nombreAudio varchar(50)
);

go
create table tblVideo(
idVideo int identity primary key,
nombreVideo varchar(50)
);

go
create table tblFormato(
idFormato int identity primary key,
nombreFormato varchar(50),
idAudio int,
--foreign key (idAudio) references tblAudio (idAudio),
idVideo int,
--foreign key (idVideo) references tblVideo (idVideo),
)


go
create table tblCategoria(
idCategoria int identity primary key,
nombreCategoria varchar(50),
descripcion varchar(50),
);

go
create table tblClasificacion(
idClasificacion int identity primary key,
nombreClasificacion varchar(50),
descripcion varchar(50),
);

go
create table tblPelicula(
idPelicula int identity primary key,
titulo varchar(50),
duracion varchar(50),
director varchar(50),
sinopsis varchar(100),
idCategoria int,
--foreign key (idCategoria) references tblCategoria (idCategoria),
idClasificacion int,
--foreign key (idClasificacion) references tblClasificacion (idClasificacion),
idFormato int,
--foreign key (idFormato)  references tblFormato (idFormato)
);


go
create table tblTicket(
idTicket int identity primary key,
precio float,
idPelicula int,
--foreign key (idPelicula) references tblPelicula (idPelicula)
);


go
create table tblFacturaTicket(
idFacturaTicket int identity primary key,
idFactura int,
--foreign key (idFactura) references tblFactura (idFactura),
idTicket int,
--foreign key (idTicket) references tblTicket (idTicket)
);

go
create table tblFormatoPelicula(
idFormatoPelicula int identity primary key,
idPelicula int,
--foreign key (idPelicula) references tblPelicula (idPelicula),
idFormato int,
--foreign key (idFormato) references tblFormato  (idFormato)
);


go
create table tblSala(
idSala int identity primary key,
nombreSala varchar(50),
capacidad int
);

go
create table tblAsiento(
idAsiento int identity primary key,
fila varchar(50),
columna varchar(50),
estado varchar(50),
idSala int,
--foreign key (idSala ) references tblSala (idSala)
);


go
create table tblSalaPelicula(
idSalapelicula int identity primary key,
horario varchar(50),
fecha date,
idSala int,
--foreign key (idSala ) references tblSala (idSala),
idPelicula int,
--foreign key (idPelicula) references tblPelicula (idPelicula),
idTicket int,
--foreign key (idTicket) references tblTicket (idTicket)
);


--alteraciones en las tablas creadas
go
use Proyecto
alter table tblEmpleado
add constraint FK_tblEmpleado_idCargo foreign key (idCargo) references tblCargo(idCargo);


alter table tblFactura
add constraint FK_tblFactura_idCliente foreign key (idCliente) references tblCliente(idCliente);

go
alter table tblFactura
add constraint FK_tblFactura_idEmpleado foreign key (idEmpleado) references tblEmpleado(idEmpleado);

go
alter table tblFacturaBar
add constraint FK_tblFacturaBar_idCliente foreign key (idCliente) references tblCliente (idCliente);

go
alter table tblFacturaBarProducto
add constraint FK_tblFacturaBarProducto_idProducto foreign key (idProducto) references tblProducto (idProducto);

go
alter table tblFacturaBarProducto
add constraint FK_tblFacturaBarProducto_idFacturaBar foreign key (idFacturaBar) references tblFacturaBar (idFacturaBar);

go
alter table tblActividades
add constraint FK_tblActividades_idCargo foreign key (idCargo) references tblCargo (idCargo);

go
alter table tblFormato
add constraint FK_tblFormato_idAudio foreign key (idAudio) references tblAudio (idAudio) ;

go
alter table tblFormato
add constraint FK_tblFormato_idVideo foreign key (idVideo) references tblVideo (idVideo);

go
alter table tblPelicula
add constraint FK_TblPelcula_idCategoria  foreign key (idCategoria) references tblCategoria (idCategoria);

go
alter table tblPelicula
add constraint FK_TblPelcula_idClasificacion  foreign key (idClasificacion) references tblClasificacion (idClasificacion);

go
alter table tblPelicula
add constraint FK_TblPelcula_idFormato  foreign key (idFormato)  references tblFormato (idFormato);

go
alter table tblTicket
add constraint FK_TtblTicket_idPelicula foreign key (idPelicula) references tblPelicula (idPelicula)


go
alter table tblFacturaTicket
add constraint FK_tblFacturaTicket_idFactura foreign key (idFactura) references tblFactura (idFactura);

go
alter table tblFacturaTicket
add constraint FK_tblFacturaTickett_idTicketa foreign key (idTicket) references tblTicket (idTicket);

go
alter table tblFormatoPelicula
add constraint FK_tblFormatoPelicula_idPelicula foreign key (idPelicula) references tblPelicula (idPelicula);

go
alter table tblFormatoPelicula
add constraint FK_tblFormatoPelicula_idFormato foreign key (idFormato) references tblFormato  (idFormato);

go
alter table tblAsiento
add constraint FK_tblAsiento_idSala foreign key (idSala) references tblSala (idSala);


go
alter table tblSalaPelicula
add constraint FK_tblSalaPelicula_idSala  foreign key (idSala) references tblSala (idSala);

go
alter table tblSalaPelicula
add constraint FK_tblSalaPelicula_idPelicula  foreign key (idPelicula) references tblPelicula (idPelicula);

go
alter table tblSalaPelicula
add constraint FK_tblSalaPelicula_idTicket foreign key (idTicket) references tblTicket (idTicket);


------------ VISTAS
use Proyecto
GO
CREATE VIEW vw_Actividades AS
SELECT * FROM tblActividades

GO
CREATE VIEW vw_Asiento AS
SELECT * FROM tblAsiento

GO
CREATE VIEW vw_Audio AS
SELECT * FROM tblAudio

GO
CREATE VIEW vw_Cargo AS
SELECT * FROM tblCargo

GO
CREATE VIEW vw_Categoria AS
SELECT * FROM tblCategoria

GO
CREATE VIEW vw_Clasificacion AS
SELECT * FROM tblClasificacion

GO
CREATE VIEW vw_Cliente AS
SELECT * FROM tblCliente

GO
CREATE VIEW vw_Empleado AS
SELECT * FROM tblEmpleado

GO
CREATE VIEW vw_Factura AS
SELECT * FROM tblFactura

GO
CREATE VIEW vw_FacturaBar AS
SELECT * FROM tblFacturaBar

GO
CREATE VIEW vw_FacturaBarProduct AS
SELECT * FROM tblFacturaBarProducto

GO
CREATE VIEW vw_FacturaTicke AS
SELECT * FROM tblFacturaTicket

GO
CREATE VIEW vw_Formato AS
SELECT * FROM tblFormato

GO
CREATE VIEW vw_FormatoPelicula AS
SELECT * FROM tblFormatoPelicula

GO
CREATE VIEW vw_Pelicula AS
SELECT * FROM tblPelicula

GO
CREATE VIEW vw_Producto AS
SELECT * FROM tblProducto

GO
CREATE VIEW vw_Sala AS
SELECT * FROM tblSala

GO
CREATE VIEW vw_SalaPelicula AS
SELECT * FROM tblSalaPelicula

GO
CREATE VIEW vw_Ticket AS
SELECT * FROM tblTicket

GO
CREATE VIEW vw_Video AS
SELECT * FROM tblVideo

------------------------------VISTAS COMPLETAS-------------------------------------------
--vista de las caracteristicas de una pelicula
go
create view vw_Pelicula2 
as
select p.titulo, p.director, p.duracion, p.sinopsis, cat.nombreCategoria, clf.nombreClasificacion, ft.nombreFormato
from tblPelicula as p
inner join tblCategoria as cat
on p.idCategoria = cat.idCategoria
inner join tblClasificacion as clf
on p.idClasificacion = clf.idClasificacion
inner join tblFormato as ft
on p.idFormato = ft.idFormato

--select * from vw_Pelicula2

--Vista de un empleado con cargo
go
create view vw_Empleado2
as
select e.idEmpleado, e.nombreEmpleado, e.apellidoEmpleado, e.cedula, c.nombreCargo 
from tblEmpleado as e
inner join tblCargo as c
on e.idCargo = c.idCargo

--select * from vw_Empleado2

--Vista de una sala con su disponivilidad de ascientos
go
create view vw_Sala2
as
select s.nombreSala, a.columna, a.fila, a.estado from
tblSala as s
inner join tblAsiento as a
on s.idSala = a.idSala 

--select * from vw_sala2

go
create view vw_SalaPelicula2
as
select s.nombreSala, p.titulo, sp.fecha, sp.horario as 'Pelicula en Sala' from
tblSalaPelicula as sp
inner join tblSala as s
on sp.idSala = s.idSala
inner join tblPelicula as p
on sp.idPelicula = p.idPelicula

--select * from vw_SalaPelicula2
 


--PROCEDIMIENTOS ALMACENADOS
--Ingresar productos
go
create proc sp_IngresarProducto
@nombre_Producto varchar(50),
@precio_Producto float,
@cantidad_Producto int
as begin
insert into tblProducto (nombreProducto,precioProducto, cantidadProducto)
values(@nombre_Producto,@precio_Producto, @cantidad_Producto)
end
--Actualizar Prodcuto
go
create proc sp_ActualizarProducto
@id_producto int,
@nombre_Producto varchar(50),
@precio_Producto float,
@cantidad_Producto int
as begin
update tblProducto 
set
nombreProducto = @nombre_Producto,
precioProducto = @precio_Producto,
cantidadProducto = @cantidad_Producto
where idProducto = @id_producto
end
--Ingresar cliente
go
create proc sp_IngresarCliente
@nombre_Cliente varchar(50),
@apellido_Cliente varchar(50),
@direccion_Cliente varchar(50),
@cedula varchar(50),
@correo varchar(50)
as begin
insert into tblCliente(nombreCliente,apellidoCliente,direccionCliente,cedula,correo)
values(@nombre_Cliente,@apellido_Cliente,@direccion_Cliente,@cedula,@correo)
end

--Actualizar Cliente
go
create proc sp_ActualizarCliente
@idCliente int,
@nombre_Cliente varchar(50),
@apellido_Cliente varchar(50),
@direccion_Cliente varchar(50),
@cedula varchar(50),
@correo varchar(50)
as begin
update
tblCliente
set
nombreCliente = @nombre_Cliente,
apellidoCliente = @apellido_Cliente,
direccionCliente = @direccion_Cliente,
cedula = @cedula,
correo = @correo
where idCliente = @idCliente
end
--Ingresar cargo
go
create proc sp_IngresarCargo
@NombreCargo varchar(50),
@sueldo float
as begin
insert into tblCargo(nombreCargo,sueldo)
values(@NombreCArgo, @sueldo)
end
--Actualizar Cargo
go
create proc sp_ActualizarCargo
@idCliente int,
@NombreCargo varchar(50),
@sueldo float
as begin
update tblCargo
set 
nombreCargo = @NombreCargo ,
sueldo = @sueldo
where idCargo = @idCliente
end
--Ingresar empleado
go
create proc sp_IngresarEmpleado
@nombre_Empleado varchar(50),
@apellido_Empleado varchar(50),
@cedula varchar(10),
@id_Cargo int
as begin
insert into tblEmpleado(nombreEmpleado,apellidoEmpleado,cedula,idCargo)
values(@nombre_Empleado,@apellido_Empleado,@cedula, @id_Cargo)
end
--Actualizar Empleado
--Ingresar empleado
go
create proc sp_ActualizarEmpleado
@idEmpleado int,
@nombre_Empleado varchar(50),
@apellido_Empleado varchar(50),
@cedula varchar(10),
@id_Cargo int
as begin
update tblEmpleado
set 
nombreEmpleado = @nombre_Empleado,
apellidoEmpleado = @apellido_Empleado,
cedula = @cedula,
idCargo = @id_Cargo
where idEmpleado = @idEmpleado
end
--Ingresar factura
go
create proc sp_IngresarFactura

@fechaEmision date,
@subtotal float,
@total float,
@idCliente int,
@idEmpleado int
as begin
insert into tblFactura( fechaEmision, subtotal, total, idEmpleado, idCliente)
values(@fechaEmision, @subtotal, @total, @idCliente, @idEmpleado)
end
--Ingresar factura bar
go
create proc sp_IngresarFacturaBar

@idCliente int,
@subtotal float,
@total float
as begin
insert into tblFacturaBar(idCliente, subtotal, total)
values( @idCliente , @subtotal, @total )
end
--Ingresar facturas bar producto
go
create proc sp_IngresarFacturaBarProducto

@idProducto int,
@idFacturaBar int,
@cantidad int
as begin
insert into tblFacturaBarProducto(idProducto, idFacturaBar, cantidad)
values(@idProducto,@idFacturaBar, @cantidad)
end
--Ingresar actividades
go
create proc sp_IngresarActividades

@descripcion varchar(50),
@idCargo int
as begin
insert into tblActividades(descripcion,idCargo)
values(@descripcion,@idCargo)
end

--Actualizar Actividades
go
create proc sp_ActualizarActividades
@idActividad int,
@descripcion varchar(50),
@idCargo int
as begin
update tblActividades set
descripcion = @descripcion,
idCargo = @idCargo
where idActividad = @idActividad
end
--Ingresar audio
go
create proc sp_IngresarAudio

@nombreAudio varchar(50)
as begin
insert into tblAudio(nombreAudio)
values(@nombreAudio)
end
--Ingresar video
go
create proc sp_IngresarVideo

@nombreVideo  varchar(50)
as begin
insert into tblVideo(nombreVideo)
values(@nombreVideo)
end
--Ingresar formato
go
create proc sp_IngresarFormato
@nombreFormato varchar(50),
@idAudio int,
@idVideo int
as begin
insert into tblFormato(nombreFormato,idAudio,idVideo)
values(@nombreFormato,@idAudio,@idVideo)
end
--Ingresar categoria
go
create proc sp_IngresarCategoria

@nombreCategoria varchar(50),
@descripcion varchar(50)
as begin
insert into tblCategoria(nombreCategoria,descripcion)
values(@nombreCategoria,@descripcion)
end
--Ingresar clasificacion
go
create proc sp_IngresarClasificacion

@nombreClasificacion varchar(50),
@descripcion varchar(50)
as begin
insert into tblClasificacion(nombreClasificacion,descripcion)
values(@nombreClasificacion,@descripcion)
end
--Ingresar pelicula
go
create proc sp_IngresarPelicula

@titulo varchar(50),
@duracion varchar(50),
@director varchar(50),
@sinopsis varchar(100),
@idCategoria int,
@idClasificacion int,
@idFormato int
as begin
insert into tblPelicula(titulo,duracion,director,sinopsis,idCategoria,idClasificacion,idFormato)
values(@titulo,@duracion,@director,@sinopsis,@idCategoria,@idClasificacion,@idFormato)
end
--Actualizar Pelicula
go
create proc sp_ActualizarPelicula
@idPelicula int,
@titulo varchar(50),
@duracion varchar(50),
@director varchar(50),
@sinopsis varchar(100),
@idCategoria int,
@idClasificacion int,
@idFormato int
as begin
update tblPelicula
set
titulo = @titulo,
duracion = @duracion,
director = @director,
sinopsis = @sinopsis,
idCategoria = @idCategoria,
idClasificacion = @idClasificacion,
idFormato = @idFormato
where idPelicula = @idPelicula
end
--Ingresar ticket
go
create proc sp_IngresarTicket

@precio float,
@idPelicula int
as begin
insert into tblTicket(precio,idPelicula)
values(@precio,@idPelicula)
end
--Ingresar factura ticket
go
create proc sp_IngresarFacturaTicket

@idFactura int,
@idTicket int
as begin
insert into tblFacturaTicket(idFactura,idTicket)
values(@idFactura,@idTicket)
end
--Ingresar formato pelicula
go
create proc sp_IngresarFormatoPelicula

@idPelicula int,
@idFormato int
as begin
insert into tblFormatoPelicula(idPelicula,idFormato)
values(@idPelicula,@idFormato)
end
--Ingresar sala
go
create proc sp_IngresarSala
@nombreSala varchar(50),
@capacidad  int
as begin
insert into tblSala(nombreSala,capacidad)
values(@nombreSala, @capacidad)
end
--Ingresar asiento
go
create proc sp_IngresarAsiento

@fila varchar(50),
@columna varchar(50),
@estado varchar(50),
@idSala int
as begin
insert into tblAsiento(fila,columna,estado,idSala)
values(@fila,@columna,@estado,@idSala)
end
--Actualizar Asiento
go
create proc sp_ActualizarAsiento
@idAsiento int,
@fila varchar(50),
@columna varchar(50),
@estado varchar(50),
@idSala int
as begin
update tblAsiento
set
fila = @fila,
columna = @columna,
estado = @estado,
idSala = @idSala
where idAsiento = @idAsiento
end
--Ingresar sala pelicula
go
create proc sp_IngresarSalaPelicula

@horario varchar(50),
@fecha date,
@idSala int,
@idPelicula int,
@idTicket int
as begin
insert into tblSalaPelicula(horario,fecha,idSala,idPelicula,idTicket)
values(@horario,@fecha,@idSala,@idPelicula,@idTicket)
end

-----------------------------------------------------------------------------
--Busqueda con Funciones
-----------------------------------------------------------------------------

--BuscarProducto
go
use Proyecto
go
create procedure sp_BuscarProducto
@nombrebuscar varchar(50)
as
begin
	declare @val int
	declare @out varchar(50)
	select * from tblProducto
	where nombreProducto like @nombrebuscar
	--or idProducto=cast(@nombrebuscar as int)
	set @val= @@rowcount

	if @val >0
		begin
			set @out = 'Existen Campos '+cast(@val as varchar)
		end
	else
			set @out = 'No Existen Campos'
	print @out
end


--go
--use Proyecto
--go
--exec sp_BuscarProducto 'Nachos'

--Buscar CLiente
go
create procedure sp_BuscarCliente
@nombrebuscar varchar(50)
as
begin
	declare @val int
	declare @out varchar(50)
	select * from tblCliente
	where nombreCliente like @nombrebuscar 
	or apellidoCliente like @nombrebuscar
	or cedula like @nombrebuscar
	--or Id_cliente=cast(@nombrebuscar as int)
	set @val= @@rowcount

	if @val >0
		begin
			set @out = 'Existen Campos '+cast(@val as varchar)
		end
	else
			set @out = 'No Existen Campos'
	print @out
end

--go
--use Proyecto 
--go
exec sp_BuscarCliente 'Carlos'

--Buscar Empleado

go
create procedure sp_BuscarEmpleado
@nombrebuscar varchar(50)
as
begin
	declare @val int
	declare @out varchar(50)
	select * from vw_Empleado2
	where nombreEmpleado like @nombrebuscar 
	or apellidoEmpleado like @nombrebuscar
	or cedula like @nombrebuscar
	--or Id_empleado=cast(@nombrebuscar as int)
	set @val= @@rowcount

	if @val >0
		begin
			set @out = 'Existen Campos '+cast(@val as varchar)
		end
	else
			set @out = 'No Existen Campos'
	print @out
end

--go
--use Proyecto 
--go
--exec sp_BuscarEmpleado '1804171918'

--BuscarPelicula
go
create procedure sp_BuscarPeliculaCategoria
@nombrecategoria varchar(50)
as
begin
	declare @val int
	declare @out varchar(50)
	select * from vw_Pelicula2
	where nombreCategoria like @nombrecategoria
	--or Id_empleado=cast(@nombrebuscar as int)
	set @val= @@rowcount

	if @val >0
		begin
			set @out = 'Existen Campos '+cast(@val as varchar)
		end
	else
			set @out = 'No Existen Campos'
	print @out
end

--go
--use Proyecto
--go
--exec sp_BuscarPeliculaCategoria 'Accion'

---------------------------------------------------------------------
--Funcion para ingreso de pedido
--------------------------------------------------------------
go
--ingreso de idfacturabar, idproducto, idcantidad
create procedure InsertarPedidoBar
@Id_facturabar int,
@Id_producto int,
@cantidadOrden int
as
begin
	begin tran
		begin try
			declare @stock int
			set @stock =(Select cantidadProducto from tblProducto
			where tblProducto.idProducto = @Id_producto)
	
			if @stock > @cantidadOrden
				begin

					insert into tblFacturaBarProducto
					([idFacturaBar] , [idProducto],  cantidad  )
					values(
					@Id_facturabar ,
					@Id_producto ,
					@cantidadOrden)

					declare @total float
					set @total =(Select [precioProducto] from [tblProducto]
					where tblProducto.idProducto = @Id_producto)

					update tblFacturaBar 
					set tblFacturaBar.total = (tblFacturaBar.total+(@total*@cantidadOrden))
					where idFacturaBar = @Id_facturabar

					update tblProducto 
					set tblProducto.cantidadProducto = (cantidadProducto - (@cantidadOrden))
					where idProducto=@Id_Producto
				end
			else
					Print ('No hay suficiente Stock del producto seleccionado')
		commit 
	end try
	begin catch
		rollback tran
		Print('Error en registrar el pedido del bar')
	end catch
end

--Funcion para ingreso de cine
go

--Requiero el ingreso  idAsiento, idPelicula
--drop procedure InsertarPedidoCine
create procedure InsertarPedidoCine
@idFactura int,
@idAsiento int,
@idPelicula int
as
begin
	begin tran
		begin try
			declare @estado varchar(50)
			set @estado = (Select estado from tblAsiento
			where tblAsiento.idAsiento = @idAsiento)
	
			if @estado = 'Libre'
				begin
					declare @idTicket int
					set @idTicket = ( 
					select sp.idTicket from
					tblSalaPelicula as sp
					inner join tblSala as s
					on sp.idSala = s.idSala
					where sp.idPelicula = @idPelicula)

					insert into tblFacturaTicket
					( [idFactura], [idTicket])
					values(
					@idfactura,
					@idTicket
					)

					declare @total float
					set @total =(Select [precio] from [tblTicket]
					where tblTicket.idTicket = @idTicket)

					update tblFactura 
					set tblFactura.total = (tblFactura.total+(@total))
					where idFactura = @idFactura

					update tblAsiento
					set estado = 'Ocupado'
					where idAsiento =  @idAsiento
				end
			else
					Print ('El asiento elegido no esta disponible')
		commit 
	end try
	begin catch
		rollback tran
		Print('Error en registrar el Pedido del cine')
	end catch
end


--Ingreso de Datos
--Ingreso de Audio
go
use Proyecto
go
exec sp_IngresarAudio 'Mono Stereo'
exec sp_IngresarAudio 'Multi Stereo'
exec sp_IngresarAudio 'Soround'

--Ingresar Video
go
use Proyecto
go
exec sp_IngresarVideo 'HD'
exec sp_IngresarVideo 'FULL HD'
exec sp_IngresarVideo '4K'

--Ingresar Cargo Empleados
go
use Proyecto
go
execute sp_IngresarCargo 'Gerente', 1000
execute sp_IngresarCargo 'Cajero',500
execute sp_IngresarCargo 'Encargado Pasillos',360
execute sp_IngresarCargo 'Boleteria',360
execute sp_IngresarCargo 'Encargado Bar',360

--ingreso de actividades
go
use Proyecto
go
exec sp_IngresarActividades 'Administrar Cine', 1
exec sp_IngresarActividades 'Cobrar Consumo', 2
exec sp_IngresarActividades 'Vigilar pasillos', 3
exec sp_IngresarActividades 'Guiar Clientes', 3
exec sp_IngresarActividades 'Vender Boletos', 4
exec sp_IngresarActividades 'Atender pedidos Cliente', 5


--Ingresar Empleados
go
use Proyecto
go
exec sp_IngresarEmpleado 'Rodrigo', 'Suarez', '1804171915',1
exec sp_IngresarEmpleado 'Carlos', 'Santamaria','1804171918' ,2
exec sp_IngresarEmpleado 'Marco', 'Lopez', '0265987456',2
exec sp_IngresarEmpleado 'Karina', 'Fonseca','0125896358' ,3
exec sp_IngresarEmpleado 'Marcia', 'Montero', '1698658963',4
exec sp_IngresarEmpleado 'Manolo', 'Navas', '1857410369',5
exec sp_IngresarEmpleado 'Noah', 'Parra', '4961684941',5
exec sp_IngresarEmpleado 'Louis', 'Montenegro', '0614616516',4
exec sp_IngresarEmpleado 'Zoe', 'Romero', '1235496846',3
exec sp_IngresarEmpleado 'Emma', 'Escobar', '1649842123',2
exec sp_IngresarEmpleado 'Luna', 'Sosa', '5132064618',5
exec sp_IngresarEmpleado 'Henry', 'Medina', '0654162019',4
exec sp_IngresarEmpleado 'Felix', 'Arce', '1644163200',3
exec sp_IngresarEmpleado 'Aiden', 'Gonzales', '0806064682',2
exec sp_IngresarEmpleado 'Francisco', 'Mendoza', '6132065448',5
exec sp_IngresarEmpleado 'Amelia', 'Gomez', '0616513230',4
exec sp_IngresarEmpleado 'Carlos', 'Diaz', '1651984620',3
exec sp_IngresarEmpleado 'Fatima', 'Lopez', '1606846516',2
exec sp_IngresarEmpleado 'Elena', 'Campos', '1989461621',5
exec sp_IngresarEmpleado 'Martin', 'Martinez', '1032304035',4


go
use Proyecto
go

execute sp_IngresarCliente 'Carlos', 'Montanada', 'Quito', '1804171915', null
execute sp_IngresarCliente 'Cesar', 'Miranda', 'Baños', '1804171915', null
execute sp_IngresarCliente 'Marco', 'Lopez', 'Quito', '1804158615', null
execute sp_IngresarCliente 'Jose', 'Toro', 'Ambato', '1804578915', null
execute sp_IngresarCliente 'Luis', 'Moreno', 'Ambato', '1809991915', null
execute sp_IngresarCliente 'Isaac', 'Contreras', 'Quito','2132136545', null
execute sp_IngresarCliente 'Luciano', 'Gabri','Guayaquil', '0351684613',null
execute sp_IngresarCliente 'Ignacio', 'Rodriguez',  'Quito', '3516846132',null
execute sp_IngresarCliente 'Julieta', 'Alvarez', 'Quito', '1215646125',null
execute sp_IngresarCliente 'Catalina', 'Martinez', 'Ambato','0231654637', null
execute sp_IngresarCliente 'Alexander', 'Fuentes', 'Quito','0516846135',null
execute sp_IngresarCliente 'Pablo', 'Torres','Guayaquil','0231654684',null
execute sp_IngresarCliente 'Paula', 'Castillo','Quito','1323546846', null
execute sp_IngresarCliente 'Valentin', 'Castro','Quito','1316468465', null
execute sp_IngresarCliente 'Jose', 'Reyes','Ambato', '0211654646',null
execute sp_IngresarCliente 'Guadalupe', 'Andradre', 'Quito','2316546846', null
execute sp_IngresarCliente 'Paulina', 'Mejia', 'Quito','1235464321', null
execute sp_IngresarCliente 'Fernanda', 'Bustamente', 'Cuenca','0659462264', null
execute sp_IngresarCliente 'Alexa', 'Gomez',  'Quito','0654894651', null
execute sp_IngresarCliente 'Eduarda', 'Martinez', 'Guayaquil','0549841158', null
execute sp_IngresarCliente 'Anna', 'Tapia', 'Quito','0548462320', null
execute sp_IngresarCliente 'Luciano', 'Bustos', 'Guayaquil','1624940318', null
execute sp_IngresarCliente 'Vicente', 'Lagos', 'Quito', '1264484161',null
execute sp_IngresarCliente 'Anastasia', 'Valdes', 'Quito','1654320654', null
execute sp_IngresarCliente 'Manuel', 'Romero', 'Ambato','1321654651', null
execute sp_IngresarCliente 'Sofia', 'Saavedra', 'Quito','1564613203', null
execute sp_IngresarCliente 'Julian', 'Garrido', 'Quito','0235146846', null
execute sp_IngresarCliente 'Dante', 'Gallardo', 'Cuenca','0321684641', null
execute sp_IngresarCliente 'Gael', 'Vega', 'Quito','1321846516', null
execute sp_IngresarCliente 'Gabriel', 'Figueroa',  'Guayaquil','1326549684', null
execute sp_IngresarCliente 'Clara', 'Guzman', 'Quito','0235168465', null
execute sp_IngresarCliente 'Agustin', 'Aguilera', 'Guayaquil','3216564684', null
execute sp_IngresarCliente 'David', 'Godoy', 'Quito','1354684316', null
execute sp_IngresarCliente 'Isabelle', 'Ruiz', 'Quito','0231654968', null
execute sp_IngresarCliente 'Felipe', 'Sandoval', 'Ambato','1316515464', null
execute sp_IngresarCliente 'Leonardo', 'Miranda', 'Quito','1231546844', null
execute sp_IngresarCliente 'Amelia', 'Jara', 'Quito','0231354685', null
execute sp_IngresarCliente 'Andrea', 'Leiva', 'Cuenca','0231655164', null
execute sp_IngresarCliente 'Camila', 'Olivares',  'Quito','1232168465', null
execute sp_IngresarCliente 'Samuel', 'Sanchez',  'Guayaquil','1646431164', null
execute sp_IngresarCliente 'Daniel', 'Herrera', 'Quito','0531316851', null
execute sp_IngresarCliente 'Joaquin', 'Gomez', 'Guayaquil','1234684651', null
execute sp_IngresarCliente 'Isabella', 'Vera','Quito','0203516428', null
execute sp_IngresarCliente 'Emiliano', 'Saez',  'Quito','0321354684', null
execute sp_IngresarCliente 'Isabella', 'Caravajal', 'Ambato','0265498643', null
execute sp_IngresarCliente 'Martin', 'Donoso', 'Quito','0346448421', null
execute sp_IngresarCliente 'Benjamin', 'Paredes',  'Quito','1231684613', null
execute sp_IngresarCliente 'Sophia', 'Dias', 'Cuenca','0231321651', null
execute sp_IngresarCliente 'Sebastian', 'Rojas', 'Quito','0230564313', null
execute sp_IngresarCliente 'Santiago', 'Gonzales', 'Guayaquil','2132136545', null



--Ingreso de categoria pelicula
go
use Proyecto
go
exec sp_IngresarCategoria 'Accion', null
exec sp_IngresarCategoria 'Accion y Ciencia Ficcion', null
exec sp_IngresarCategoria 'Animacion', null
exec sp_IngresarCategoria 'Artes Marciales', null
exec sp_IngresarCategoria 'Accion', null
exec sp_IngresarCategoria 'Aventura', null
exec sp_IngresarCategoria 'Basado en hechos reales', null
exec sp_IngresarCategoria 'Ciencia Ficcion', null 
exec sp_IngresarCategoria 'Comica', null 
exec sp_IngresarCategoria 'Documental', null 
exec sp_IngresarCategoria 'Dramatica', null 
exec sp_IngresarCategoria 'Erotica', null 
exec sp_IngresarCategoria 'Infantiles', null 
exec sp_IngresarCategoria 'Intriga', null 
exec sp_IngresarCategoria 'Misterio', null
exec sp_IngresarCategoria 'Musicales', null  
exec sp_IngresarCategoria 'Policias', null 
exec sp_IngresarCategoria 'Romanticas', null 
exec sp_IngresarCategoria 'Satirica', null 
exec sp_IngresarCategoria 'Surrealista', null 
exec sp_IngresarCategoria 'Satirica', null 
exec sp_IngresarCategoria 'Terror', null
exec sp_IngresarCategoria 'Tragicomedia', null

--Ingresar Clasificaion
go 
use Proyecto
go
exec sp_IngresarClasificacion 'G', 'de 1 a 9 años'
exec sp_IngresarClasificacion 'PG', 'de 10 a 12 años'
exec sp_IngresarClasificacion 'PG - 13', 'de 13 a 16 años' 
exec sp_IngresarClasificacion 'R', 'de 17 años'  
exec sp_IngresarClasificacion 'NC - 17', 'de 18 años en adelante'   

--ingresar Formato Pelicula
go
use Proyecto
go 
exec sp_IngresarFormato '2D',1, 1
exec sp_IngresarFormato '3D',1, 2
exec sp_IngresarFormato '2D',1, 3
exec sp_IngresarFormato '3D',2, 1
exec sp_IngresarFormato '4D',2, 2
exec sp_IngresarFormato 'D4',2, 3

--ingresar Pelicula
go 
use Proyecto
go
exec sp_IngresarPelicula 'Old man Logan', '2 : 30', 'Ricardo del Toro', 'Wolverine y su vejez', 2, 4, 3
exec sp_IngresarPelicula 'Buscando a Nemo', '1 : 30', 'Steven Spilber', 'Nemo se perdio', 1, 3, 2
exec sp_IngresarPelicula 'La vida es bella', '2 : 00', 'Roberto Benigni', 'Una historia bella sobre el holocausto',11 ,5 ,4
exec sp_IngresarPelicula 'Forrest Gump', '2 : 00','ROBERT ZEMECKIS', 'Una historia fuera de lo comun', 7, 2,1
exec sp_IngresarPelicula 'Titanic','2 : 30', 'JAMES CAMERON,',  'un barco se unde en medio de una historia de amor',7 , 2,1
exec sp_IngresarPelicula 'El rey león', '1 : 00','ROB MINKOFF Y ROGER ALLENS', 'hay un nuevo rey entre los leones',13 ,1 ,2
exec sp_IngresarPelicula 'Eduardo Manostijeras', '2 : 00','TIM BURTON',  'Una historia conmovedora',13 ,2 ,1
exec sp_IngresarPelicula 'Up', '2 : 10','PETE DOCTER Y BOB PETERSON',  'un nño y un viejo saln a dar una vuelta',13,1 , 2
exec sp_IngresarPelicula 'Monstruos S. A.', '2 : 00','PETE DOCTER, LEE UNKRICH Y DAVID SILVERMAN',  'los monstruos cobran vida',13 ,1 ,3
exec sp_IngresarPelicula 'El pianista', '1 : 00','ROMAN POLANSKI',  'un pianista polaco sobrevive a la ww2',16 ,3 ,4
exec sp_IngresarPelicula 'Gladiator','2 : 50', 'RIDLEY SCOTT',  'La historia de un gladiador',1 ,3 ,5
exec sp_IngresarPelicula 'Toy Story', '2 : 00','JOHN LASSETER',  'los juguetes cobran vida',13 ,1 ,6
exec sp_IngresarPelicula 'Shrek','2 : 45','ANDREW ADAMSON',  'un ogro verde se roba ll show',13 ,1 ,5
exec sp_IngresarPelicula 'Avatar','3 : 00', 'JAMES CAMERON',  'gente azul del futuro',13 ,3 ,4
exec sp_IngresarPelicula 'La lista de Schindler','2:15', 'STEVEN SPIELBERG',  'una hemosa historia sobre la guerra',11 ,4 ,3
exec sp_IngresarPelicula 'V de Vendetta','2 : 45', 'JAMES MCTEIQUE',  'basado en comics',10 ,2 ,2
exec sp_IngresarPelicula 'Regreso al futuro', '10 : 30', 'ROBERT ZEMECKIS', 'el doc brown lo logró',7, 3,2
exec sp_IngresarPelicula 'Origen','12 : 00',  'CHRISTOPHER NOLAN', 'un thriller psicolofico por el  sus extediones',6 ,5 ,3
exec sp_IngresarPelicula 'El padrino', '5 : 00','FRANCIS FORD COPPOLA',  'la mafi italiana hace cosas',5 , 4,1
exec sp_IngresarPelicula 'Grease',  '2 : 15','RANDAL KLEISER', 'john travaolta canta y baia',16 ,2 ,2
exec sp_IngresarPelicula 'Braveheart','3 : 00', 'MEL GIBSON',  'escocia es libre de los ingleses', 1,2 ,4
exec sp_IngresarPelicula 'La naranja mecánica', '1 : 00', 'STANLEY KUBRICK', 'un hiistoria de stanley ubrick',1 ,2 ,2
exec sp_IngresarPelicula 'Matrix', '2 : 30','LANA WACHOWSKY',  'una simulacion de computadira es la vida',1 ,4 ,4
exec sp_IngresarPelicula 'Parque jurásico', '1:45','STEVEN SPIELBERG',  'los donosaurios se adueñan todo', 2, 4,2
exec sp_IngresarPelicula 'Salvar al soldado Ryan','1:30', 'STEVEN SPIELBERG',  'uns historia sobre el dia d',11, 3,2

go
use Proyecto
go
exec sp_IngresarProducto 'Canguild pequeño', 3.5 , 5
exec sp_IngresarProducto 'Canguild Mediano', 4 , 5
exec sp_IngresarProducto 'Canguild Grande', 4.5 , 5
exec sp_IngresarProducto 'Hot dog', 2 , 5
exec sp_IngresarProducto 'Nachos', 2 , 5
exec sp_IngresarProducto 'Cola Pequeña', 1 , 5
exec sp_IngresarProducto 'Cola Mediana', 1.5 , 5
exec sp_IngresarProducto 'Cola Grande', 2 , 3
exec sp_IngresarProducto 'Manicho Pequeño', 0.50 , 5   
exec sp_IngresarProducto 'Manicho Medano', 0.90 , 5
exec sp_IngresarProducto 'Manicho Grande', 1.50 , 5
exec sp_IngresarProducto 'Cola Personal', 0.50 , 5
exec sp_IngresarProducto 'Gomitas Pequeña', 0.75 , 5
exec sp_IngresarProducto 'Nuves de Vainilla', 1 , 5
exec sp_IngresarProducto 'Ferrero x3', 1  , 5

--go
--select * from tblProducto
 
 --Ingresar Sala
go
use Proyecto
go
 exec sp_IngresarSala 'A1', 40
 exec sp_IngresarSala 'A2', 40
 exec sp_IngresarSala 'A3', 40
 exec sp_IngresarSala 'A4', 40
 exec sp_IngresarSala 'A5', 40

 --go
 --select * from tblSala

--Ingrsar Asiento
go
use Proyecto
go
exec sp_IngresarAsiento 'A','1','Libre', 1 
exec sp_IngresarAsiento 'A','2','Libre', 1 
exec sp_IngresarAsiento 'A','3','Libre', 1 
exec sp_IngresarAsiento 'A','4','Libre', 1 
exec sp_IngresarAsiento 'A','5','Libre', 1 
exec sp_IngresarAsiento 'A','6','Libre', 1 
exec sp_IngresarAsiento 'A','7','Libre', 1 
exec sp_IngresarAsiento 'A','8','Libre', 1 
exec sp_IngresarAsiento 'A','9','Libre', 1 
exec sp_IngresarAsiento 'A','10','Libre', 1 
exec sp_IngresarAsiento 'B','1','Libre', 1 
exec sp_IngresarAsiento 'B','2','Libre', 1 
exec sp_IngresarAsiento 'B','3','Libre', 1 
exec sp_IngresarAsiento 'B','4','Libre', 1 
exec sp_IngresarAsiento 'B','5','Libre', 1 
exec sp_IngresarAsiento 'B','6','Libre', 1 
exec sp_IngresarAsiento 'B','7','Libre', 1 
exec sp_IngresarAsiento 'B','8','Libre', 1 
exec sp_IngresarAsiento 'B','9','Libre', 1 
exec sp_IngresarAsiento 'B','10','Libre', 1 
exec sp_IngresarAsiento 'C','1','Libre', 1 
exec sp_IngresarAsiento 'C','2','Libre', 1 
exec sp_IngresarAsiento 'C','3','Libre', 1 
exec sp_IngresarAsiento 'C','4','Libre', 1 
exec sp_IngresarAsiento 'C','5','Libre', 1 
exec sp_IngresarAsiento 'C','6','Libre', 1 
exec sp_IngresarAsiento 'C','7','Libre', 1 
exec sp_IngresarAsiento 'C','8','Libre', 1 
exec sp_IngresarAsiento 'C','9','Libre', 1 
exec sp_IngresarAsiento 'C','10','Libre', 1 
exec sp_IngresarAsiento 'D','1','Libre', 1 
exec sp_IngresarAsiento 'D','2','Libre', 1 
exec sp_IngresarAsiento 'D','3','Libre', 1 
exec sp_IngresarAsiento 'D','4','Libre', 1 
exec sp_IngresarAsiento 'D','5','Libre', 1 
exec sp_IngresarAsiento 'D','6','Libre', 1 
exec sp_IngresarAsiento 'D','7','Libre', 1 
exec sp_IngresarAsiento 'D','8','Libre', 1 
exec sp_IngresarAsiento 'D','9','Libre', 1 
exec sp_IngresarAsiento 'D','10','Libre', 1  
exec sp_IngresarAsiento 'A','1','Libre', 2 
exec sp_IngresarAsiento 'A','2','Libre', 2 
exec sp_IngresarAsiento 'A','3','Libre', 2 
exec sp_IngresarAsiento 'A','4','Libre', 2
exec sp_IngresarAsiento 'A','5','Libre', 2 
exec sp_IngresarAsiento 'A','6','Libre', 2 
exec sp_IngresarAsiento 'A','7','Libre', 2 
exec sp_IngresarAsiento 'A','8','Libre', 2 
exec sp_IngresarAsiento 'A','9','Libre', 2 
exec sp_IngresarAsiento 'A','10','Libre', 2 
exec sp_IngresarAsiento 'B','1','Libre', 2 
exec sp_IngresarAsiento 'B','2','Libre', 2 
exec sp_IngresarAsiento 'B','3','Libre', 2 
exec sp_IngresarAsiento 'B','4','Libre', 2 
exec sp_IngresarAsiento 'B','5','Libre', 2 
exec sp_IngresarAsiento 'B','6','Libre', 2 
exec sp_IngresarAsiento 'B','7','Libre', 2 
exec sp_IngresarAsiento 'B','8','Libre', 2 
exec sp_IngresarAsiento 'B','9','Libre', 2 
exec sp_IngresarAsiento 'B','10','Libre', 2 
exec sp_IngresarAsiento 'C','1','Libre', 2 
exec sp_IngresarAsiento 'C','2','Libre', 2 
exec sp_IngresarAsiento 'C','3','Libre', 2 
exec sp_IngresarAsiento 'C','4','Libre', 2 
exec sp_IngresarAsiento 'C','5','Libre', 2 
exec sp_IngresarAsiento 'C','6','Libre', 2 
exec sp_IngresarAsiento 'C','7','Libre', 2 
exec sp_IngresarAsiento 'C','8','Libre', 2 
exec sp_IngresarAsiento 'C','9','Libre', 2 
exec sp_IngresarAsiento 'C','10','Libre', 2 
exec sp_IngresarAsiento 'D','1','Libre', 2 
exec sp_IngresarAsiento 'D','2','Libre', 2 
exec sp_IngresarAsiento 'D','3','Libre', 2 
exec sp_IngresarAsiento 'D','4','Libre', 2 
exec sp_IngresarAsiento 'D','5','Libre', 2 
exec sp_IngresarAsiento 'D','6','Libre', 2 
exec sp_IngresarAsiento 'D','7','Libre', 2 
exec sp_IngresarAsiento 'D','8','Libre', 2 
exec sp_IngresarAsiento 'D','9','Libre', 2
exec sp_IngresarAsiento 'D','10','Libre', 2  

--go
--select * from tblAsiento
go
use Proyecto
--Precio, idPelicula
exec sp_IngresarTicket 2.5, 1
exec sp_IngresarTicket 3.5, 2

--go
--select * from tblTicket

go
use Proyecto
--Horario, fecha, idSala, idPelicula, idTicket
exec sp_IngresarSalaPelicula '12:00', '2018-02-20', 1, 2, 2
exec sp_IngresarSalaPelicula '14:00', '2018-02-20', 2, 1, 1
 

--go
--select * from tblSalaPelicula

--go
--use Proyecto
--go
--select * from vw_Cargo
--select * from vw_Empleado
--select * from vw_Cliente
--select * from vw_Asiento
--select * from vw_Producto
--select * from vw_Sala
--select * from vw_Pelicula2

---------------------------------------------------------------------------
--ingreso de Facturabar


--Creacion de factura Bar
go
exec sp_IngresarFacturaBar 1, 0, 0 

--select * from tblFacturaBar

go 
--ingreso de idfacturabar, idproducto, idcantidad
exec InsertarPedidoBar 1, 2, 3

--go
--select * from tblFacturaBarProducto

--select * from tblFacturaBar


------------------------------------------------------------------------------
--Ingreso Factura Cine


go
exec sp_IngresarFactura '2018-02-22', 0, 0, 1, 2
go
--select * from tblFactura

go
--Requiero el ingreso  idAsiento, idPelicula
exec InsertarPedidoCine 1, 1, 1

--select * from tblFactura

--select * from vw_Sala2
--select * from vw_Pelicula2
-----------------------Creacion de Triggers----------------


--Creacion de Usuarios


--Pruebas
--Administrador

--Empleado
go
use Proyecto
select * from tblCargo


------------------------------------------------------------
--Creacion Triggers
-------------------------------------------------------------
go
use Proyecto

go
create table tblHistoriaACtividad
(
P_ID int identity(1,1) not null primary key,
usuario varchar(225),
descripcion varchar(255),
fecha date
);


go
use Proyecto
--go
--SELECT * INTO [TblClientes_Eliminados] from tblCliente
--where 1=0
go
create table [TblClientes_Eliminados](
idCliente int ,
nombreCliente varchar(50),
apellidoCliente varchar(50),
direccionCliente varchar(50),
cedula varchar(10),
correo varchar(50),
);

--go
--SELECT * INTO [TblEmpleados_Eliminados] from tblEmpleado
--where 1=0
go
create table [TblEmpleados_Eliminados](
idEmpleado int ,
nombreEmpleado varchar(50),
apellidoEmpleado varchar(50),
cedula varchar(10),
idCargo int,
--foreign key (idCargo) references tblCargo (idCargo)
);


go
use Proyecto
go
create trigger [Tr_RegistroEliminarCliente]
on TblCliente
after delete
as
insert into tblHistoriaACtividad
(usuario, descripcion, fecha)
values(user,'Cliente Eliminado', GETDATE())
insert into [TblClientes_Eliminados]
select * from deleted
;

go
use Proyecto
go
create trigger [Tr_RegistroEliminarEmpleado]
on TblEmpleado
after delete
as
insert into tblHistoriaACtividad
(usuario, descripcion, fecha)
values(user,'Empleado Eliminado', GETDATE())
insert into [TblEmpleados_Eliminados]
select * from deleted
;

go

CREATE TRIGGER tr_Cliente_Nuevo 
on TblCliente
after Insert
as
insert into tblHistoriaACtividad
(usuario, descripcion, fecha)
values(user,'Cliente Nuevo', GETDATE())
;

go

CREATE TRIGGER tr_Empleado_Nuevo
on TblEmpleado
after Insert
as
insert into tblHistoriaACtividad
(usuario, descripcion, fecha)
values(user,'Empleado Nuevo', GETDATE())
;

go

CREATE TRIGGER tr_No_Borrado_Tablas
on database
FOR DROP_TABLE
as
begin
print 'No es posible Borrar Tablas'
rollback
end 

go

CREATE TRIGGER tr_No_Creacion_Tablas
on database
FOR CREATE_TABLE
as
begin
print 'No es posible Crear Nuevas Tablas'
rollback
end 


--select * from vw_Cargo
--select * from vw_Empleado
--select * from vw_Cliente
--select * from vw_Asiento
--select * from vw_Producto
--select * from vw_Sala
--select * from vw_Pelicula2


----Probando Trigger de tblHistoriaACtividad

--go
--use Proyecto
--go
--exec sp_IngresarEmpleado 'Mauricio', 'Carrasco', '1857410369',5

--go
--use Proyecto
--go
--exec sp_IngresarCliente 'Marlon', 'Miranda', 'Quito', '1596873698', null


--go
--use Proyecto
--go
--delete from tblCliente
--where idCliente = 6;

--go
--use Proyecto
--go
--select * from [TblClientes_Eliminados]
--select * from tblHistoriaACtividad
--drop table [TblClientes_Eliminados];




---------Vistas detalladas y total de facturas
--------ver factura detallada de la compra del bar
go
create view vw_DetalleFacturaProductos
as
select fb.idFacturaBar, c.nombreCliente,c.apellidoCliente,p.nombreProducto,fbp.cantidad,p.precioProducto
from tblFacturaBar as fb
inner join tblCliente as c on fb.idCliente=c.idCliente
inner join tblFacturaBarProducto as fbp on fbp.idFacturaBar=fb.idFacturaBar
inner join tblProducto as p on p.idProducto=fbp.idProducto

-----factura total
go
create view vw_FacturaTotalProductos
as
select f.idFacturaBar,c.nombreCliente,c.apellidoCliente,f.total
from tblFacturaBar as f
inner join tblCliente as c on c.idCliente=f.idCliente


------ver factura detallada de los ticket
go
create view vw_DetalleFacturaTicket
as
select f.idFactura, f.fechaEmision,f.subtotal, c.nombreCliente, c.apellidoCliente, t.precio, p.titulo, p.duracion, s.nombreSala
from tblFactura as f
inner join tblCliente as c on c.idCliente=f.idCliente
inner join tblFacturaTicket as ft on  ft.idFactura=f.idFactura
inner join tblTicket as t on t.idTicket=ft.idFactura
inner join tblPelicula as p on p.idPelicula=t.idPelicula
inner join tblSalaPelicula as sp on sp.idPelicula=p.idPelicula
inner join tblSala as s on s.idSala=sp.idSala

--factura ticket total
go
create view vwFacturaTicketTotal
as
select f.idFactura,f.fechaEmision,c.nombreCliente,c.apellidoCliente,f.total
from tblFactura as f
inner join tblCliente as c on c.idCliente=f.idCliente
go
--pureba vistas
select * from vw_DetalleFacturaProductos
select * from vw_FacturaTotalProductos

select * from vw_DetalleFacturaTicket
select * from vwFacturaTicketTotal
go



--Creacion de Usuarios


--Pruebas
--Administrador

--Empleado
go
use Proyecto
select * from tblCargo

-------------------------------------------------
--Usaurio Administrador
-----------------------------------------------
USE [master]
GO
CREATE LOGIN [Administrador] WITH PASSWORD=N'123' MUST_CHANGE, DEFAULT_DATABASE=[master], CHECK_EXPIRATION=ON, CHECK_POLICY=ON
GO
USE [Proyecto]
GO
CREATE USER [Administrador] FOR LOGIN [Administrador]
GO
USE [Proyecto]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [Administrador]
GO




--------------------------------------------------------
--Creacion Usuario Empleado
---------------------------------------------------------------------
USE [master]
GO
CREATE LOGIN [Empleadojulio] WITH PASSWORD=N'123', DEFAULT_DATABASE=[Proyecto], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE [Proyecto]
GO
CREATE USER [Empleadojulio] FOR LOGIN [Empleadojulio]
GO


-------------------------------------------------------------
--Permisos
--------------------------------------------------------------
use [Proyecto]
GO
DENY UPDATE ON [dbo].[tblEmpleado] TO [Empleadojulio]
GO
use [Proyecto]
GO
DENY CONTROL ON [dbo].[tblEmpleado] TO [Empleadojulio]
GO
use [Proyecto]
GO
DENY DELETE ON [dbo].[tblEmpleado] TO [Empleadojulio]
GO
use [Proyecto]
GO
DENY INSERT ON [dbo].[tblEmpleado] TO [Empleadojulio]
GO
use [Proyecto]
GO
DENY ALTER ON [dbo].[tblEmpleado] TO [Empleadojulio]
GO
use [Proyecto]
GO
DENY SELECT ON [dbo].[tblEmpleado] TO [Empleadojulio]
GO
use [Proyecto]
GO
DENY UPDATE ON [dbo].[tblCargo] TO [Empleadojulio]
GO
use [Proyecto]
GO
DENY CONTROL ON [dbo].[tblCargo] TO [Empleadojulio]
GO
use [Proyecto]
GO
DENY DELETE ON [dbo].[tblCargo] TO [Empleadojulio]
GO
use [Proyecto]
GO
DENY INSERT ON [dbo].[tblCargo] TO [Empleadojulio]
GO
use [Proyecto]
GO
DENY ALTER ON [dbo].[tblCargo] TO [Empleadojulio]
GO
use [Proyecto]
GO
DENY SELECT ON [dbo].[tblCargo] TO [Empleadojulio]
GO
use [Proyecto]
GO
DENY UPDATE ON [dbo].[tblActividades] TO [Empleadojulio]
GO
use [Proyecto]
GO
DENY CONTROL ON [dbo].[tblActividades] TO [Empleadojulio]
GO
use [Proyecto]
GO
DENY DELETE ON [dbo].[tblActividades] TO [Empleadojulio]
GO
use [Proyecto]
GO
DENY INSERT ON [dbo].[tblActividades] TO [Empleadojulio]
GO
use [Proyecto]
GO
DENY ALTER ON [dbo].[tblActividades] TO [Empleadojulio]
GO
use [Proyecto]
GO
DENY SELECT ON [dbo].[tblActividades] TO [Empleadojulio]
GO

