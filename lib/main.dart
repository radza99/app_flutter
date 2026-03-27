import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ControlPage(),
    );
  }
}

class ControlPage extends StatefulWidget {
  const ControlPage({super.key});

  @override
  State<ControlPage> createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {

  final db = FirebaseDatabase.instance.ref();

  String profile = "kale";

  Map<String, bool> deviceState = {
    "water": false,
    "fan": false,
    "light": false,
    "mix": false,
    "fertA": false,
    "fertB": false,
    "acid": false,
    "base": false,
  };

  void setAuto() {
    db.child("mode").set("auto");
  }

  void setManual() {
    db.child("mode").set("manual");
  }

  void toggle(String device, bool value) {
    setState(() {
      deviceState[device] = value;
    });

    db.child("pump/$device").set(value);
  }

  void setProfile(String value) {
    setState(() {
      profile = value;
    });

    db.child("profile").set(value);
  }

  Widget deviceSwitch(String name, String key) {
    return SwitchListTile(
      title: Text(name),
      value: deviceState[key]!,
      onChanged: (v) {
        toggle(key, v);
      },
    );
  }

  Widget cropSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const Text(
          "CROP PROFILE",
          style: TextStyle(fontSize: 22),
        ),

        const SizedBox(height: 10),

        DropdownButton<String>(
          value: profile,
          isExpanded: true,

          items: const [

            DropdownMenuItem(
              value: "kale",
              child: Text("คะน้า"),
            ),

            DropdownMenuItem(
              value: "greencos",
              child: Text("กรีนคอส"),
            ),

          ],

          onChanged: (value) {
            setProfile(value!);
          },

        ),

      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Smart Farm Control"),
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [

          const Text("MODE", style: TextStyle(fontSize: 22)),

          ElevatedButton(
            onPressed: setAuto,
            child: const Text("AUTO"),
          ),

          ElevatedButton(
            onPressed: setManual,
            child: const Text("MANUAL"),
          ),

          const SizedBox(height: 30),

          cropSelector(),

          const SizedBox(height: 30),

          const Text("DEVICES", style: TextStyle(fontSize: 22)),

          deviceSwitch("Water Pump", "water"),
          deviceSwitch("Fan", "fan"),
          deviceSwitch("Light", "light"),
          deviceSwitch("Mix Pump", "mix"),
          deviceSwitch("Fertilizer A", "fertA"),
          deviceSwitch("Fertilizer B", "fertB"),
          deviceSwitch("Acid Pump", "acid"),
          deviceSwitch("Base Pump", "base"),

        ],
      ),
    );
  }
}