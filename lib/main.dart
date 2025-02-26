import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false; // Track dark mode state

  void toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light, // Toggle theme mode
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: ImageWithFrameToggle(toggleTheme: toggleTheme), // Pass theme toggle function to the widget
    );
  }
}

class ImageWithFrameToggle extends StatefulWidget {
  final VoidCallback toggleTheme; // Add the toggleTheme function as a parameter

  ImageWithFrameToggle({required this.toggleTheme});

  @override
  _ImageWithFrameToggleState createState() => _ImageWithFrameToggleState();
}

class _ImageWithFrameToggleState extends State<ImageWithFrameToggle> {
  bool _isFrameVisible = false; // Track whether the frame is visible

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image with Rounded Corners & Frame Toggle'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16), // Rounded corners
                child: Container(
                  decoration: BoxDecoration(
                    border: _isFrameVisible
                        ? Border.all(color: Colors.blue, width: 4) // Blue border
                        : null,
                  ),
                  child: Image.asset(
                    'assets/image.png',
                    width: 200, // You can adjust the size
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            SwitchListTile(
              title: Text('Toggle Frame'),
              value: _isFrameVisible,
              onChanged: (bool value) {
                setState(() {
                  _isFrameVisible = value;
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: widget.toggleTheme, // Toggle theme when pressed
        child: Icon(
          _isDarkMode() ? Icons.wb_sunny : Icons.nightlight_round,
        ),
        tooltip: 'Toggle Brightness',
        backgroundColor: Colors.blue,
      ),
    );
  }

  bool _isDarkMode() {
    return Theme.of(context).brightness == Brightness.dark;
  }
}
