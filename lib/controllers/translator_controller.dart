
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:translator/translator.dart';

final translateProvider = FutureProvider.autoDispose.family<String, String>((ref, text) async{
  final translator = GoogleTranslator();
  final result = await translator.translate(text, to: 'hi');
  return result.text;
});