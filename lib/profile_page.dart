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
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Hero para la imagen de perfil
            const Hero(
              tag: 'profile-picture',
              child: CircleAvatar(
                radius: 60,
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
              style: AppStyles.textSmall.copyWith(fontStyle: FontStyle.italic),
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
            _buildSlider('Height', 150),
            _buildSlider('Weight', 55),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileStat(String label, String value) {
    return Column(
      children: [
        Text(value,
            style:
                AppStyles.titleMedium.copyWith(color: AppStyles.primaryColor)),
        Text(label, style: AppStyles.textSmall),
      ],
    );
  }

  Widget _buildSlider(String label, double value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppStyles.textSmall),
        Slider(
          value: value,
          min: 0,
          max: 200,
          onChanged: (_) {}, // Slider fijo (no funcional)
        ),
      ],
    );
  }
}
