import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:view_canine_application/screens/appointment_calendar_screen.dart';
import 'package:view_canine_application/screens/bath_status_screen.dart';
import 'package:view_canine_application/screens/login_screen.dart';
import 'package:view_canine_application/screens/notifications_screen.dart';
import 'package:view_canine_application/screens/pets_list_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo con la imagen
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/fondo.png'), // Ruta de la imagen de fondo
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
          // Icono de configuración en la esquina superior derecha
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GestureDetector(
                  onTap: () {
                    // Acción al presionar el ícono de configuración
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
                  child: const Icon(
                    Icons.settings,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          // Contenido principal
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Avatar y nombre
                  Column(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Icon(
                          Icons.person,
                          size: 60,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Tomas Marny",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  // Opciones del menú centralizadas
                  MenuOption(
                    icon: Icons.pets,
                    text: "Tus mascotas",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PetsListScreen()),
                      );
                    },
                  ),
                  MenuOption(
                    icon: Icons.notifications,
                    text: "Notificaciones",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NotificationsScreen()),
                      );
                    },
                  ),
                  MenuOption(
                    icon: Icons.calendar_today,
                    text: "Agenda tus baños",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AppointmentCalendarScreen()),
                      );
                    },
                  ),
                  MenuOption(
                    icon: Icons.bathtub,
                    text: "Estado del baño",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BathStatusScreen()),
                      );
                    },
                  ),
                  MenuOption(
                    icon: Icons.logout,
                    text: "Cerrar sesión",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MenuOption extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const MenuOption({
    required this.icon,
    required this.text,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 85.0, vertical: 10.0),
        child: Row(
          children: [
            Icon(icon, size: 30, color: Colors.black),
            const SizedBox(width: 20),
            Text(
              text,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
