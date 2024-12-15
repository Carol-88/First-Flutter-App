// Página de perfil del usuario
import 'package:actividad_1_3/main.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppStyles.primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () =>
              Navigator.pop(context), // Vuelve a la pantalla anterior
        ),
        title: Row(children: [
          const Spacer(), // Espaciador para centrar el título
          Text(
            "Profile",
            style: AppStyles.titleMedium.copyWith(color: Colors.white),
          ),
          const Spacer(),
        ]),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Hero para la imagen de perfil
            const Hero(
              tag: 'profile-picture',
              child: CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(
                  'https://randomuser.me/api/portraits/women/44.jpg',
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Antònia Font',
              style: AppStyles.titleLarge.copyWith(color: AppStyles.greyText),
            ),
            Text(
              'des del 20 d\'abril del 2022',
              style: AppStyles.textSmall,
            ),
            const SizedBox(height: 24),
            // Información adicional
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildProfileStat('Time', '2h 45\''),
                _buildProfileStat('Km', '212,4'),
                _buildProfileStat('Activities', '42'),
              ],
            ),
            const SizedBox(height: 24),
            // Sliders
            _buildSlider('Height', 110, '150 cm'),
            _buildSlider('Weight', 55, '55 kg'),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileStat(String label, String value) {
    IconData getIconForLabel(String label) {
      switch (label) {
        case 'Time':
          return Icons.access_time; // Ícono de reloj
        case 'Km':
          return Icons.place; // Ícono de ubicación
        case 'Activities':
          return Icons.home; // Ícono de casa
        default:
          return Icons.info; // Ícono predeterminado
      }
    }

    return Card(
      elevation: 4.0, // Elevación para sombra
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Bordes redondeados
      ),
      color: AppStyles.accentColor, // Color de fondo
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              getIconForLabel(label), // Ícono dinámico basado en el label
              size: 40.0,
              color: Colors.black,
            ),
            const SizedBox(height: 8.0),
            Text(
              label, // Ahora el label está antes del valor
              style: AppStyles.textSmall,
            ),
            Text(
              value,
              style: AppStyles.titleMedium.copyWith(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSlider(String label, double value, String textValue) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 50),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(label, style: AppStyles.textSmall),
          Slider(
            value: value,
            min: 0,
            max: 200,
            activeColor: AppStyles.accentColor,
            onChanged: (_) {}, // Slider fijo (no funcional)
          ),
          Text(textValue, style: AppStyles.textSmall)
        ],
      ),
    );
  }
}
