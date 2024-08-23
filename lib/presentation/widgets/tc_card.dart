import 'dart:io' if (dart.library.html) 'dart:html' as platform;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tc_editor/controllers/translator_controller.dart';
import 'package:tc_editor/data/models/tc_models.dart';
import 'package:tc_editor/presentation/widgets/tc_dialog.dart';

class TCCard extends StatefulWidget {
  final TcModel data;
  const TCCard({super.key, required this.data});

  @override
  State<TCCard> createState() => _TCCardState();
}

class _TCCardState extends State<TCCard> {
  bool _showTranslation = false;

  _toggleTranslation() {
    setState(() {
      _showTranslation = !_showTranslation;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showBottomSheet(
            context: context,
            builder: (context) {
              return InputDialog(
                data: widget.data,
              );
            });
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 12),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.data.value,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              if (_showTranslation)
                Consumer(builder: (context, ref, _) {
                  final translator =
                      ref.watch(translateProvider(widget.data.value));
                  return translator.when(
                      data: (text) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            text,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        );
                      },
                      error: (error, stack) {
                        return Text(error.toString());
                      },
                      loading: () => const CircularProgressIndicator());
                }),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                    onPressed: _toggleTranslation,
                    child: Text(
                      "Read in Arabic",
                      // style: Theme.of(context).textTheme.titleSmall,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
