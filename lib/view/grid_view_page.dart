import 'package:flutter/material.dart';

class GridViewPage extends StatelessWidget {
  const GridViewPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: MediaQuery.of(context).size.width,
      child: GridView.builder(
        itemCount: 4,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.amber,
              child: Text('hello'),
            ),
          );
        },
      ),
    );
  }

  Widget buildButton(BuildContext context, int index) {
    Color color;
    String text;
    VoidCallback onPressed;

    switch (index) {
      case 0:
        color = Colors.blue;
        text = 'Request Location Permission';
        onPressed = () async => ();
        break;
      case 1:
        color = const Color.fromARGB(255, 238, 210, 55);
        text = 'Request Notification Permission';
        onPressed = () async => ();
        break;
      case 2:
        color = Colors.green;
        text = 'Start Location Update';
        onPressed = () async => ();
        break;
      case 3:
        color = Colors.red;
        text = 'Stop Location Update';
        onPressed = () async => ();
        break;
      default:
        color = Colors.black;
        text = '';
        onPressed = () {};
        break;
    }

    return Container(
      color: color,
      child: Center(
        child: InkWell(
          onTap: onPressed,
          child: Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void requestLocationPermission(BuildContext context) {
    // Implement your logic here
  }

  void requestNotificationPermission(BuildContext context) {
    // Implement your logic here
  }

  void startLocationUpdates(BuildContext context) {
    // Implement your logic here
  }

  void stopLocationUpdates(BuildContext context) {
    // Implement your logic here
  }
}
