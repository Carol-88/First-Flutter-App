import 'package:actividad_1_3/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() {
  runApp(const FitnessTimeApp());
}

// Punto de entrada principal de la aplicación
class FitnessTimeApp extends StatelessWidget {
  const FitnessTimeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Oculta la bandera de depuración
      home: FitnessHomePage(), // Página principal de la app
    );
  }
}

// Definición de estilos reutilizables
class AppStyles {
  static const Color primaryColor = Color(0xFFF896D8);
  static const Color accentColor = Color(0xFFBF63F8);
  static const Color darkBlue = Color(0xFF3407DA);
  static const Color backgroundColor = Color.fromARGB(255, 253, 242, 250);
  static const Color lightGrey = Color.fromARGB(255, 249, 235, 244);
  static const Color greyText = Colors.black45;

  static TextStyle titleLarge = GoogleFonts.montserrat(
    fontSize: 40,
    color: greyText,
  );

  static TextStyle titleMedium = GoogleFonts.montserrat(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: backgroundColor,
  );

  static TextStyle activityType = GoogleFonts.montserrat(
    fontSize: 18,
    color: greyText,
  );

  static TextStyle distance = GoogleFonts.montserrat(
    fontSize: 24,
    fontWeight: FontWeight.normal,
    color: greyText,
  );

  static TextStyle textSmall = GoogleFonts.montserrat(
    fontSize: 14,
    color: greyText,
  );
}

// Página principal de la aplicación
class FitnessHomePage extends StatelessWidget {
  const FitnessHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          AppStyles.backgroundColor, // Color de fondo de la pantalla
      appBar: AppBar(
        backgroundColor: AppStyles.primaryColor, // Color del AppBar
        leading: const Icon(Icons.menu, color: Colors.white), // Icono del menú
        elevation: 0,
        title: Row(
          children: [
            const Spacer(), // Espaciador para centrar el título
            Text(
              "Fitness Time",
              style: AppStyles.titleMedium.copyWith(color: Colors.white),
            ),
            const Spacer(),
            Hero(
              tag: 'profile-picture', // Etiqueta única para la animación Hero
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilePage()),
                  );
                },
                child: const CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                    'https://randomuser.me/api/portraits/women/44.jpg',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Saludo y recordatorio de hidratación
              Row(
                children: [
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hola Antònia,',
                          style: AppStyles.titleMedium
                              .copyWith(color: AppStyles.greyText),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Recorda beure aigua regularment al llarg del dia per mantenir el teu cos hidratat i millorar el teu rendiment físic i mental.',
                          style: AppStyles.textSmall,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Més detalls',
                            style: AppStyles.textSmall.copyWith(
                              color: AppStyles.darkBlue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Sección "Darreres activitats"
              Text(
                'Darreres activitats',
                style:
                    AppStyles.titleMedium.copyWith(color: AppStyles.greyText),
              ),
              const Divider(),
              const SizedBox(height: 8),

              // Tarjetas de actividades recientes
              _buildActivityCard('Running', 'Ayer, 18:20', '7,300 km'),
              const SizedBox(height: 8),
              _buildActivityCard('Running', '15 Sep 2024, 21:45', '6,550 km'),
              const SizedBox(height: 8),
              _buildActivityCard('Running', '10 Sep 2024, 21:33', '7,100 km'),

              const SizedBox(height: 40),

              // Indicador de progreso circular
              Center(
                child: CircularPercentIndicator(
                  radius: 60,
                  lineWidth: 14,
                  percent: 0.65, // Porcentaje del objetivo
                  center: Text(
                    '65%',
                    style: AppStyles.titleLarge.copyWith(color: Colors.black54),
                  ),
                  progressColor: AppStyles.darkBlue, // Color del progreso
                  backgroundColor: Colors.black12, // Color de fondo
                ),
              ),
              const SizedBox(height: 2),

              // Texto debajo del indicador
              Center(
                child: Text(
                  'Objectiu mensual',
                  style: AppStyles.textSmall,
                ),
              ),
            ],
          ),
        ),
      ),

      // Barra de navegación inferior
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppStyles.darkBlue, // Color del ítem seleccionado
        unselectedItemColor:
            AppStyles.greyText, // Color de ítems no seleccionados
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inici',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Cercar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            label: 'Botiga',
          ),
        ],
      ),
    );
  }

  // Widget para crear una tarjeta de actividad
  Widget _buildActivityCard(String type, String time, String distance) {
    return Card(
      color: AppStyles.lightGrey, // Define el color de fondo de la tarjeta
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            const Icon(Icons.run_circle_outlined,
                color: AppStyles.accentColor, size: 40),
            const SizedBox(width: 18),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    type,
                    style: AppStyles.activityType,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    time,
                    style: AppStyles.textSmall
                        .copyWith(fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
            Text(
              distance,
              style: AppStyles.distance,
            ),
          ],
        ),
      ),
    );
  }
}



// Subrayado para Mes detalls, fontWeight en darreres activitats y hola antonia