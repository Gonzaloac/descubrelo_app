import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Juego de Desafíos',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String nombre = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Descubrelo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Bienvenido a Descubrelo',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Ingresa tu nombre',
              ),
              onChanged: (value) {
                setState(() {
                  nombre = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (nombre.isNotEmpty) {
                  // Navegar a la siguiente pantalla con el nombre del usuario
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainScreen(nombre: nombre),
                    ),
                  );
                } else {
                  // Mostrar un mensaje de error si el nombre está vacío
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Por favor, ingresa tu nombre.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Continuar'),
            ),
          ],
        ),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  final String nombre;

  MainScreen({required this.nombre});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('¡Hola, $nombre!'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hola $nombre, ¿dónde te encuentras?',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navega a la tercera pantalla cuando se presiona el botón "Bar"
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoriaScreen(nombre: nombre),
                  ),
                );
              },
              child: Text('Bar'),
            ),
            ElevatedButton(
              onPressed: () {
                // Puedes agregar la lógica para el botón de "Casa" aquí.
              },
              child: Text('Casa'),
            ),
            ElevatedButton(
              onPressed: () {
                // Puedes agregar la lógica para el botón de "Disco" aquí.
              },
              child: Text('Disco'),
            ),
            // Puedes agregar más botones según sea necesario para otros lugares.
          ],
        ),
      ),
    );
  }
}

String preguntaAleatoria(String categoria) {
  final Map<String, List<String>> preguntasPorCategoria = {
    'Picante': [
      'Dile a la persona más atractiva de la habitación que te gusta.',
      'Besa a alguien del mismo sexo.',
      // Agrega más preguntas picantes aquí.
    ],
    'Caliente': [
      'Baila de manera sensual con alguien.',
      'Dibuja un corazón en tu brazo con lápiz labial.',
      // Agrega más preguntas "calientes" aquí.
    ],
    'Descúbrelo': [
      'Elige un número entre 1 y 10 y cuenta un secreto sobre ti por cada número.',
      'Haz una pregunta indiscreta a alguien y responde tú también.',
      // Agrega más preguntas "descúbrelo" aquí.
    ],
  };

  final List<String> preguntas = preguntasPorCategoria[categoria]!;
  if (preguntas != null && preguntas.isNotEmpty) {
    final random = Random();
    final indice = random.nextInt(preguntas.length);
    return preguntas[indice];
  }
  return 'No hay preguntas disponibles para esta categoría.';
}


class CategoriaScreen extends StatelessWidget {
  final String nombre;

  CategoriaScreen({required this.nombre});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('¡Hola, $nombre!'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '¿Qué categoría eliges?',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final categoriaElegida = 'Picante'; // Debes obtener la categoría seleccionada aquí
                final pregunta = preguntaAleatoria(categoriaElegida);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PreguntaScreen(pregunta: pregunta),
                  ),
                );
              },
              child: Text('Picante'),
            ),
            ElevatedButton(
              onPressed: () {
                // Lógica para la categoría "Caliente"
                final categoriaElegida = 'Caliente'; // Debes obtener la categoría seleccionada aquí
                final pregunta = preguntaAleatoria(categoriaElegida);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PreguntaScreen(pregunta: pregunta),
                  ),
                );
              },
              child: Text('Caliente'),
            ),
            ElevatedButton(
              onPressed: () {
                // Lógica para la categoría "Descúbrelo"
                final categoriaElegida = 'Descúbrelo'; // Debes obtener la categoría seleccionada aquí
                final pregunta = preguntaAleatoria(categoriaElegida);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PreguntaScreen(pregunta: pregunta),
                  ),
                );
              },
              child: Text('Descúbrelo'),
            ),
            // Puedes agregar más botones para otras categorías.
          ],
        ),
      ),
    );
  }
}

class PreguntaScreen extends StatefulWidget {
  final String pregunta;

  PreguntaScreen({required this.pregunta});

  @override
  _PreguntaScreenState createState() => _PreguntaScreenState();
}

class _PreguntaScreenState extends State<PreguntaScreen> {
  String preguntaActual = '';

  @override
  void initState() {
    super.initState();
    preguntaActual = widget.pregunta;
  }

  String preguntaAleatoria(String categoria) {
    final Map<String, List<String>> preguntasPorCategoria = {
      'Picante': [
        'Dile a la persona más atractiva de la habitación que te gusta.',
        'Besa a alguien del mismo sexo.',
        // Agrega más preguntas picantes aquí.
      ],
      'Caliente': [
        'Baila de manera sensual con alguien.',
        'Dibuja un corazón en tu brazo con lápiz labial.',
        // Agrega más preguntas "calientes" aquí.
      ],
      'Descúbrelo': [
        'Elige un número entre 1 y 10 y cuenta un secreto sobre ti por cada número.',
        'Haz una pregunta indiscreta a alguien y responde tú también.',
        // Agrega más preguntas "descúbrelo" aquí.
      ],
    };

    final List<String>? preguntas = preguntasPorCategoria[categoria];
    if (preguntas != null && preguntas.isNotEmpty) {
      final random = Random();
      final indice = random.nextInt(preguntas.length);
      return preguntas[indice];
    }
    return 'No hay preguntas disponibles para esta categoría.';
  }

  void cambiarPregunta() {
    final categoriaElegida = 'Picante'; // Debes obtener la categoría seleccionada aquí
    final pregunta = preguntaAleatoria(categoriaElegida);
    setState(() {
      preguntaActual = pregunta;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pregunta'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFE63130), Color(0xFFFA8623)],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                preguntaActual,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  cambiarPregunta();
                },
                child: Text('Volver a Pregunta'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}