import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:view_canine_application/screens/confirm_appointment_screen.dart';
import 'package:view_canine_application/screens/menu_screen.dart';

// Pantalla de citas disponibles
class AppointmentsScreen extends StatelessWidget {
  final DateTime selectedDate;

  const AppointmentsScreen({required this.selectedDate, super.key});

  @override
  Widget build(BuildContext context) {
    final String formattedDate =
        "${selectedDate.day} de ${_monthName(selectedDate.month)} de ${selectedDate.year}";

    return Scaffold(
      body: Stack(
        children: [
          // Fondo con la imagen
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/fondo.png'),
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
                IconButton(
                  icon: const Icon(Icons.home, size: 30, color: Colors.black),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MenuScreen()),
                      );
                  },
                ),
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
                const SizedBox(height: 60),
                Center(
                  child: Text(
                    "Jueves $formattedDate",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Escoge una hora",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    children: [
                      _AppointmentItem(
                        stylist: "Jenny Perez",
                        time: "8:00 am",
                        selectedDate: formattedDate,
                      ),
                      _AppointmentItem(
                        stylist: "Pedro Gonzalez",
                        time: "8:00 am",
                        selectedDate: formattedDate,
                      ),
                      _AppointmentItem(
                        stylist: "Jenny Perez",
                        time: "10:00 am",
                        selectedDate: formattedDate,
                      ),
                      _AppointmentItem(
                        stylist: "Pedro Gonzalez",
                        time: "4:00 pm",
                        selectedDate: formattedDate,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade200,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    "Consultar otra fecha",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _monthName(int month) {
    const months = [
      "enero",
      "febrero",
      "marzo",
      "abril",
      "mayo",
      "junio",
      "julio",
      "agosto",
      "septiembre",
      "octubre",
      "noviembre",
      "diciembre"
    ];
    return months[month - 1];
  }
}

class _AppointmentItem extends StatelessWidget {
  final String stylist;
  final String time;
   final String selectedDate;

  const _AppointmentItem({
    required this.stylist,
    required this.time,
    required this.selectedDate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Estilista: $stylist",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  time,
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConfirmAppointmentScreen(
                      date: selectedDate,
                      time: time,
                      stylist: stylist,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade200,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text("Agendar"),
            ),
          ],
        ),
      ),
    );
  }
}