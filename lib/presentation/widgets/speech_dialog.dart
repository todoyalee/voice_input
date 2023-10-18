import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechDialog extends StatefulWidget {
  final Function(String) onSubmit;
  const SpeechDialog({super.key, required this.onSubmit});

  @override
  State<SpeechDialog> createState() => _SpeechDialogState();
}

class _SpeechDialogState extends State<SpeechDialog> {
  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  /// This has to happen only once per app
  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  /// Each time to start a speech recognition session
  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(_lastWords, style: Theme.of(context).textTheme.bodyLarge,),
          const SizedBox(height: 16,),
          Text(
            // If listening is active show the recognized words
            _speechToText.isListening
                ? 'Listening...'
            // If listening isn't active but could be tell the user
            // how to start it, otherwise indicate that speech
            // recognition is not yet ready or not supported on
            // the target device
                : _speechEnabled
                ? 'Tap the microphone to start listening...'
                : 'Speech not available',
          ),

          IconButton(onPressed: _speechToText.isNotListening ? _startListening : _stopListening,
              icon: Icon(_speechToText.isNotListening ? Icons.mic_off : Icons.mic)),

          MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6)
            ),
            color: Colors.green,
            onPressed: _speechToText.isListening ? null : (){
              widget.onSubmit(_lastWords);
              Navigator.of(context).pop();
            },
            child: const Text('Submit'),)
        ],
      ),
    );
  }
}
