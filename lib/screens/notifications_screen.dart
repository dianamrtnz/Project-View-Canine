import 'dart:ui';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

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
                    // Acción para volver al menú
                    Navigator.pop(context);
                  },
                ),
                // Ícono de configuración
                IconButton(
                  icon: const Icon(Icons.settings, size: 30, color: Colors.black),
                  onPressed: () {
                    // Acción al presionar configuración
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
                    "Notificaciones",
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
                      NotificationItem(
                        text: "Ruffus está en sala de espera",
                      ),
                      NotificationItem(
                        text: "Ruffus está siendo bañado",
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

class NotificationItem extends StatelessWidget {
  final String text;

  const NotificationItem({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue.shade100,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            const Icon(Icons.circle, size: 10, color: Colors.black),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
