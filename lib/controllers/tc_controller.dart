

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tc_editor/data/models/tc_models.dart';

final tcProvider = StateNotifierProvider<TCController, List<TcModel>>((ref) => TCController());

class TCController extends StateNotifier<List<TcModel>>{
  TCController():super([]){
    _init();
  }

  _init(){
    state = initialData.map((e) => TcModel.fromJson(e)).toList();
  }

  addNewTC(String terms){
    final today = DateTime.now();
    state = [
      ...state,
      TcModel(
          id: today.microsecondsSinceEpoch,
          value: terms,
          createdAt: today,
          updatedAt: today)
    ];
  }

  editTC(TcModel data){
    state = [
      for(final tc in state)
        data.id != tc.id ? tc : data
    ];
  }

}