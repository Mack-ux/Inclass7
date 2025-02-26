import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImageWithFrameToggle(),
    );
  }
}

class ImageWithFrameToggle extends StatefulWidget {
  @override
  _ImageWithFrameToggleState createState() => _ImageWithFrameToggleState();
}

class _ImageWithFrameToggleState extends State<ImageWithFrameToggle> {
  bool _isFrameVisible = false;  // Track whether the frame is visible

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image with Rounded Corners & Frame Toggle'),
      ),
      body: Column(
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
    );
  }
}
