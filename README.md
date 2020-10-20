# Requerimientos

1. Mostrar los productos mas vendidos y menos vendidos.
2. Wish list.
3. Fidelizacion.
4. Mostrar usuarios con mayor cantidad de compras.
5. Mostrar perfil de usuario.
6. Mostrar productos proximos a salir.
7. Busqueda por nombre, precio, categoria, descuentos.
8. Dias y horarios con mas ventas.
9. Gift Cards.
10. Historial de busquedas.

# Vistas





# ER

*Producto*
nombre_producto VARCHAR(15)
precio_producto FLOAT(15)
sku BIGINT(20)
descuento TINYINT(3)
descripcion_producto VARCHAR(500)
cantidad_disponible SMALLINT(6)
reviews VARCHAR(250)
calificacion TINYINT(1)


*Usuario*
id_usuario VARCHAR(20)
tarjeta de credito BIGINT(20)
email VARCHAR(30)
contraseña VARCHAR(20)


*Cart*
sku BIGINT(20)
valor BIGINT(20)
fecha DATETIME
id_envio BIGINT(20)
id_usuario VARCHAR(20)


*Transaccion*
id_transaccion BIGINT(20) 
id_usuario VARCHAR(20)
valor BIGINT(20)
exito BOOL
fecha DATETIME
descuento TINYINT(3)


*Envio*
id_envio BIGINT(20)
direccion VARCHAR(30)
ciudad VARCHAR(30)
fecha_entrega DATETIME
fecha_salida DATETIME





