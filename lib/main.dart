import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista de Productos: 0344',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductosScreen(),
    );
  }
}

class Producto {
  final int id_producto;
  final String nom;
  final double precio;

  Producto(
      {required this.id_producto, required this.nom, required this.precio});
}

class ProductosScreen extends StatelessWidget {
  // Lista de mapas con datos de productos
  final List<Map<String, dynamic>> productosData = [
    {'id_producto': 1, 'nom': 'Producto 1', 'precio': 10.99},
    {'id_producto': 2, 'nom': 'Producto 2', 'precio': 20.99},
    {'id_producto': 3, 'nom': 'Producto 3', 'precio': 30.99},
    {'id_producto': 4, 'nom': 'Producto 4', 'precio': 40.99},
    {'id_producto': 5, 'nom': 'Producto 5', 'precio': 50.99},
  ];

  // Convertir la lista de mapas a una lista de objetos Producto
  List<Producto> get productos {
    return productosData.map((data) {
      return Producto(
        id_producto: data['id_producto'],
        nom: data['nom'],
        precio: data['precio'],
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Productos: Eduardo 0344'),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(16),
        itemCount: productos.length,
        separatorBuilder: (context, index) =>
            SizedBox(height: 16), // Separador entre contenedores
        itemBuilder: (context, index) {
          final producto = productos[index];
          return Container(
            decoration: BoxDecoration(
              color: Colors.primaries[index % Colors.primaries.length]
                  .withOpacity(0.2), // Color diferente
              borderRadius: BorderRadius.circular(12), // Bordes redondeados
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ID: ${producto.id_producto}',
                    style: TextStyle(fontSize: 16)),
                Text('Nombre: ${producto.nom}', style: TextStyle(fontSize: 16)),
                Text('Precio: \$${producto.precio.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 16)),
              ],
            ),
          );
        },
      ),
    );
  }
}
