import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load();
  runApp(MyApp());
}

class Note {
  final double latitude;
  final double longitude;
  String noteText;

  Note(this.latitude, this.longitude, this.noteText);
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class MyApp extends StatelessWidget {
  final String appId = Uuid().v4();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Location Notes',
      home: MapScreen(),
    );
  }
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;
  Set<Marker> _markers = {};
  @override
  void initState() {
    super.initState();
    _getInitialCameraPosition();
  }
  Future<void> _getInitialCameraPosition() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );
      LatLng initialCameraPosition = LatLng(position.latitude, position.longitude);
      mapController?.moveCamera(CameraUpdate.newLatLngZoom(initialCameraPosition, 17.5));
    } catch (e) {
      print('Error getting initial  camera position: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Been There'),
      ),
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        onTap: _addNoteMaker,
        markers: _markers,
        initialCameraPosition: CameraPosition(
          target: LatLng(0, 0),
          zoom: 17.5,
        ),
      ),
    );
  }

  void _addNoteMaker(LatLng latLng) {
    showDialog(
      context: context, 
      builder: (context) => NoteInputDialog(),
    ).then((noteText) {
      if (noteText != null) {
        setState(() {
          _markers.add(
            Marker(
              markerId: MarkerId(latLng.toString()),
              position: latLng,
              onTap: () => _showNoteDetails(latLng, noteText),            
            ),
          );
        });
        _createNoteOnServerInBackground(latLng.latitude, latLng.longitude, noteText)
          .then((response) {
            print('Note Created Successfully!');
        })
          .catchError((error) {
            print('Failed to create note: $error');
        });
      }
    });
  }
  void _showNoteDetails(LatLng latLng, String noteText) {
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: Text('Note Details'),
        content: Text(
          'Latitude: ${latLng.latitude}\nLongitude: ${latLng.longitude}\n\nNote: $noteText',
        ),
        actions: [
          TextButton(
            onPressed: ()=> Navigator.of(context).pop(), 
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
  Future<void> _createNoteOnServerInBackground(double latitude, double longitude, String noteText) {
    final response = http.post(
      Uri.parse('http://10.0.2.2:8000/notes/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "latitude": latitude,
        "longitude": longitude,
        "message": noteText,
      }),
    );
    return response.then((response) {
      if (response.statusCode == 201) {
        return;
      } else {
        throw Exception('Failed to create note. Status Code: ${response.statusCode}');
      }
    }).catchError((e) {
      throw Exception('Error creating note: $e');
    });
  }
}

class NoteInputDialog extends StatefulWidget {
  @override
  _NoteInputDialogState createState() =>  _NoteInputDialogState();
}
class _NoteInputDialogState extends State<NoteInputDialog> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Note'),
      content: TextField(
        controller: _textEditingController,
        decoration: InputDecoration(labelText: 'Enter Your Note: '),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel')
        ),
        TextButton(
          onPressed: () {
            String noteText =_textEditingController.text;
            Navigator.of(context).pop(noteText);
          }, 
          child: Text('Add'),
        ),
      ],
    );
  }
  @override
  void dispose(){
    _textEditingController.dispose();
    super.dispose();
  }
}