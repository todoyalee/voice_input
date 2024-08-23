import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tc_editor/controllers/translator_controller.dart';
import 'package:tc_editor/presentation/widgets/speech_dialog.dart';

import '../../controllers/tc_controller.dart';
import '../../data/models/tc_models.dart';

class InputDialog extends ConsumerWidget {
  final TcModel? data;
  InputDialog({super.key, this.data});

  final _textController = TextEditingController();
  final _showHindi = ValueNotifier(false);
  final _formKey = GlobalKey<FormState>();
  final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (data != null) {
      _textController.text = data!.value;
    }
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
      child: SizedBox(
        height: 380,
        child: Column(
          children: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: SpeechDialog(
                            onSubmit: (value) {
                              if (value.isNotEmpty) {
                                _textController.text = value;
                              }
                            },
                          ),
                        );
                      });
                },
                icon: Icon(
                  Icons.mic,
                  size: 30,
                )),
            Form(
                key: _formKey,
                child: TextFormField(
                  maxLines: 4,
                  focusNode: _focusNode,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Cannot be empty';
                    }
                    return null;
                  },
                  controller: _textController,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                )),
            TextButton(
                onPressed: () {
                  _showHindi.value = !_showHindi.value;
                },
                child: const Text('View in english')),
            Expanded(
                child: SingleChildScrollView(
              child: ValueListenableBuilder(
                valueListenable: _showHindi,
                builder: (context, showHindi, _) {
                  if (showHindi && _textController.text.isNotEmpty) {
                    return Consumer(builder: (context, ref, _) {
                      final translator =
                          ref.watch(translateProvider(_textController.text));
                      return translator.when(
                          data: (text) {
                            return Text(text);
                          },
                          error: (error, stack) {
                            return Text(error.toString());
                          },
                          loading: () => const CircularProgressIndicator());
                    });
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            )),
            MaterialButton(
              minWidth: double.infinity,
              color: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ///Null data means its a new tc
                  if (data == null) {
                    ref
                        .read(tcProvider.notifier)
                        .addNewTC(_textController.text);
                    Navigator.of(context).pop();
                  } else {
                    ref
                        .read(tcProvider.notifier)
                        .editTC(data!.copyWith(value: _textController.text));
                    Navigator.of(context).pop();
                  }
                }
              },
              child: const Text('CONFIRM'),
            )
          ],
        ),
      ),
    );
  }
}
