# Requerimientos

1. Mostrar los productos mas vendidos y menos vendidos.
2. Wish list.
3. Fidelizacion.
4. Mostrar usuarios con mayor cantidad de compras a traves del tiempo.
5. Mostrar perfil de usuario.
6. Mostrar productos proximos a salir.
7. Busqueda por nombre, precio, categoria, descuentos.
8. Dias y horarios con mas ventas.
9. Gift Cards.
10. Historial de busquedas.
11. Mostrar el inventario en fecha seleccionada.
12. Mostrar el iva del total de ventas.
13. Mostrar ventas respecto al punto de equilibrio de la empresa.
14. Mostrar que productos se compran juntos por lo general.
15. Ofrecer beneficios en compra de mas de 10 productos en un solo pedido.
16. Mostrar sugerencias de acuerdo al genero.
17. En caso de no tener existencias mostrar sugerencias en producto similar y valor.
18. Mostrar 'badge' del comprador de acuerdo a su cantidad de compras.
19. Mostrar posibles compras con fidelizacion.
20. Enviar correo despues de 3 meses de su ultima compra.

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





