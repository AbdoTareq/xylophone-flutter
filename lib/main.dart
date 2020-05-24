import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SoundButton(),
        ),
      ),
    );
  }
}

class SoundButton extends StatefulWidget {
  @override
  _SoundButtonState createState() => _SoundButtonState();
}

class _SoundButtonState extends State<SoundButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
        // this for take screen wide (match parent)
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildKey(soundNum: 1, color: Colors.red),
          buildKey(soundNum: 2, color: Colors.orange),
          buildKey(soundNum: 3, color: Colors.yellow, text: 'click'),
          buildKey(soundNum: 4, color: Colors.lightGreen),
          buildKey(soundNum: 5, color: Colors.green),
          buildKey(soundNum: 6, color: Colors.blue),
          buildKey(soundNum: 7, color: Colors.purple, text: 'click me'),
        ]);
  }

  Expanded buildKey({int soundNum, MaterialColor color, String text = ''}) {
    return Expanded(
      child: FlatButton(
        onPressed: () {
          setState(() {
            playSound(soundNum);
          });
        },
        color: color,
        child: Text(text),
      ),
    );
  }

  void playSound(int soundNum) {
    final player = AudioCache();
    player.play('note$soundNum.wav');
  }
}
