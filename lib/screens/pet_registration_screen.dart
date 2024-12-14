import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:view_canine_application/screens/login_screen.dart';

class PetRegistrationScreen extends StatefulWidget {
  const PetRegistrationScreen({super.key});

  @override
  State<PetRegistrationScreen> createState() => _PetRegistrationScreenState();
}

class _PetRegistrationScreenState extends State<PetRegistrationScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _breedController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final FocusNode _nameFocusNode = FocusNode();
  bool requiresMuzzle = false;
  bool needsNailTrim = false;
  bool needsGlandCleaning = false;

  void _clearFields() {
    _nameController.clear();
    _breedController.clear();
    _ageController.clear();
    _weightController.clear();
    _descriptionController.clear();
    setState(() {
      requiresMuzzle = false;
      needsNailTrim = false;
      needsGlandCleaning = false;
    });
    _nameFocusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
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
            child: Container(color: Colors.black.withOpacity(0.1)),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    const Text(
                      "Registra tu perrito",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Campos de entrada
                    _CustomTextField(
                      controller: _nameController,
                      focusNode: _nameFocusNode,
                      hintText: "Nombre",
                    ),
                    const SizedBox(height: 10),
                    _CustomTextField(
                      controller: _breedController,
                      hintText: "Raza",
                    ),
                    const SizedBox(height: 10),
                    _CustomTextField(
                      controller: _ageController,
                      hintText: "Edad",
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 10),
                    _CustomTextField(
                      controller: _weightController,
                      hintText: "Peso",
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 10),
                    _CustomTextField(
                      controller: _descriptionController,
                      hintText:
                          "Describe las necesidades de su baño (Corte, tipo de shampoo... lo que consideres)",
                      maxLines: 3,
                    ),
                    const SizedBox(height: 20),
                    // Opciones de selección
                    Row(
                      children: [
                        const Expanded(child: Text("¿Requiere bozal?")),
                        Switch(
                          value: requiresMuzzle,
                          onChanged: (value) {
                            setState(() {
                              requiresMuzzle = value;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Expanded(child: Text("¿Corte de uñas?")),
                        Switch(
                          value: needsNailTrim,
                          onChanged: (value) {
                            setState(() {
                              needsNailTrim = value;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Expanded(child: Text("¿Limpiamos sus glándulas?")),
                        Switch(
                          value: needsGlandCleaning,
                          onChanged: (value) {
                            setState(() {
                              needsGlandCleaning = value;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    // Botones
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: _clearFields,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue.shade200,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text(
                            "Registra otra mascota",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                              (route) => false,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green.shade400,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text(
                            "Terminar Registro",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Campo de texto personalizado
class _CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String hintText;
  final TextInputType keyboardType;
  final int maxLines;

  const _CustomTextField({
    required this.controller,
    this.focusNode,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.blue.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      ),
    );
  }
}
