import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<QuestionStruct> _Questions = [
    QuestionStruct.fromSerializableMap(jsonDecode(
        '{\"QuestionDescription\":\"Who is Amdizo\",\"Answer\":\"Amir Edin\",\"Options\":\"[\\\"Amir Jeshi\\\",\\\"Amisho\\\",\\\"Amir Edin\\\"]\",\"UserAnswer\":\"\"}')),
    QuestionStruct.fromSerializableMap(jsonDecode(
        '{\"QuestionDescription\":\"What color is Amdizo\",\"Answer\":\"Pink\",\"Options\":\"[\\\"Red\\\",\\\"Blue\\\",\\\"Pink\\\"]\",\"UserAnswer\":\"\"}')),
    QuestionStruct.fromSerializableMap(jsonDecode(
        '{\"QuestionDescription\":\"What feature distinguishes Amdizo from the rest\",\"Answer\":\"He is a genius\",\"Options\":\"[\\\"Kiara\\\",\\\"He is a genius\\\",\\\"Das desa\\\"]\",\"UserAnswer\":\"\"}')),
    QuestionStruct.fromSerializableMap(jsonDecode(
        '{\"QuestionDescription\":\"What languages does Amdizo use\",\"Answer\":\"Javascript\",\"Options\":\"[\\\"Kiborana\\\",\\\"Kiswahili\\\",\\\"Javascript\\\"]\",\"UserAnswer\":\"\"}')),
    QuestionStruct.fromSerializableMap(jsonDecode(
        '{\"QuestionDescription\":\"Is Amdizo a good footballer?\",\"Answer\":\"Acha jokes\",\"Options\":\"[\\\"Yes\\\",\\\"No\\\",\\\"Acha jokes\\\"]\",\"UserAnswer\":\"\"}'))
  ];
  List<QuestionStruct> get Questions => _Questions;
  set Questions(List<QuestionStruct> value) {
    _Questions = value;
  }

  void addToQuestions(QuestionStruct value) {
    _Questions.add(value);
  }

  void removeFromQuestions(QuestionStruct value) {
    _Questions.remove(value);
  }

  void removeAtIndexFromQuestions(int index) {
    _Questions.removeAt(index);
  }

  void updateQuestionsAtIndex(
    int index,
    QuestionStruct Function(QuestionStruct) updateFn,
  ) {
    _Questions[index] = updateFn(_Questions[index]);
  }

  void insertAtIndexInQuestions(int index, QuestionStruct value) {
    _Questions.insert(index, value);
  }
}
