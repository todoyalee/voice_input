import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tc_editor/controllers/tc_controller.dart';

import '../widgets/tc_card.dart';
import '../widgets/tc_dialog.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tcListController = ref.watch(tcProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms & Conditions'),
      ),
      body: ListView.builder(
          itemCount: tcListController.length + 1,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: (context, index){
            if(index == tcListController.length){
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: MaterialButton(
                  minWidth: double.infinity,
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)
                  ),
                  onPressed: (){
                    showBottomSheet(
                        context: context,
                        builder: (context){
                          return InputDialog();
                        });
                  },
                child: const Text('Add More'),),
              );
            }
        return TCCard(data: tcListController[index],);
      }),
    );
  }
}
