import 'dart:ui';
import 'package:flutter/material.dart';

class PetsListScreen extends StatelessWidget {
  const PetsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo con la imagen
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/fondo.png'), // Ruta de la imagen de fondo
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Efecto de Blur
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.black.withOpacity(0.1),
            ),
          ),
          // Iconos superiores
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Botón para volver al menú
                IconButton(
                  icon: const Icon(Icons.home, size: 30, color: Colors.black),
                  onPressed: () {
                    Navigator.pop(context); // Volver al menú
                  },
                ),
                // Ícono de configuración
                IconButton(
                  icon: const Icon(Icons.settings, size: 30, color: Colors.black),
                  onPressed: () {
                    // Mostrar Snackbar
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text(
                          "Esta funcionalidad estará disponible en una futura versión.",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        backgroundColor: Colors.blue,
                        duration: const Duration(seconds: 2), // Duración del Snackbar
                        action: SnackBarAction(
                          label: "OK",
                          textColor: Colors.white,
                          onPressed: () {
                            // Acción opcional al presionar "OK"
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          },
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          // Contenido principal
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 80),
                const Center(
                  child: Text(
                    "Mis Mascotas",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    children: const [
                      PetListItem(
                        name: "Ruffus",
                        imagePath: 'assets/ruffus.png',
                        description: "Jack Russell Terrier, 2 años",
                      ),
                      PetListItem(
                        name: "Max",
                        imagePath: 'assets/max.png',
                        description: "Golden Retriever, 4 años",
                      ),
                      PetListItem(
                        name: "Bella",
                        imagePath: 'assets/bella.png',
                        description: "Poodle, 3 años",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PetListItem extends StatelessWidget {
  final String name;
  final String imagePath;
  final String description;

  const PetListItem({
    required this.name,
    required this.imagePath,
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Imagen de la mascota
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
              child: Image.asset(
                imagePath,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 100,
                    height: 100,
                    color: Colors.grey.shade300,
                    child: const Icon(Icons.pets, size: 40, color: Colors.grey),
                  );
                },
              ),
            ),
            const SizedBox(width: 10),
            // Nombre y descripción
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

