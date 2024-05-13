// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionStruct extends FFFirebaseStruct {
  QuestionStruct({
    String? questionDescription,
    String? answer,
    List<String>? options,
    String? userAnswer,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _questionDescription = questionDescription,
        _answer = answer,
        _options = options,
        _userAnswer = userAnswer,
        super(firestoreUtilData);

  // "QuestionDescription" field.
  String? _questionDescription;
  String get questionDescription => _questionDescription ?? '';
  set questionDescription(String? val) => _questionDescription = val;
  bool hasQuestionDescription() => _questionDescription != null;

  // "Answer" field.
  String? _answer;
  String get answer => _answer ?? '';
  set answer(String? val) => _answer = val;
  bool hasAnswer() => _answer != null;

  // "Options" field.
  List<String>? _options;
  List<String> get options => _options ?? const [];
  set options(List<String>? val) => _options = val;
  void updateOptions(Function(List<String>) updateFn) =>
      updateFn(_options ??= []);
  bool hasOptions() => _options != null;

  // "UserAnswer" field.
  String? _userAnswer;
  String get userAnswer => _userAnswer ?? '';
  set userAnswer(String? val) => _userAnswer = val;
  bool hasUserAnswer() => _userAnswer != null;

  static QuestionStruct fromMap(Map<String, dynamic> data) => QuestionStruct(
        questionDescription: data['QuestionDescription'] as String?,
        answer: data['Answer'] as String?,
        options: getDataList(data['Options']),
        userAnswer: data['UserAnswer'] as String?,
      );

  static QuestionStruct? maybeFromMap(dynamic data) =>
      data is Map ? QuestionStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'QuestionDescription': _questionDescription,
        'Answer': _answer,
        'Options': _options,
        'UserAnswer': _userAnswer,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'QuestionDescription': serializeParam(
          _questionDescription,
          ParamType.String,
        ),
        'Answer': serializeParam(
          _answer,
          ParamType.String,
        ),
        'Options': serializeParam(
          _options,
          ParamType.String,
          true,
        ),
        'UserAnswer': serializeParam(
          _userAnswer,
          ParamType.String,
        ),
      }.withoutNulls;

  static QuestionStruct fromSerializableMap(Map<String, dynamic> data) =>
      QuestionStruct(
        questionDescription: deserializeParam(
          data['QuestionDescription'],
          ParamType.String,
          false,
        ),
        answer: deserializeParam(
          data['Answer'],
          ParamType.String,
          false,
        ),
        options: deserializeParam<String>(
          data['Options'],
          ParamType.String,
          true,
        ),
        userAnswer: deserializeParam(
          data['UserAnswer'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'QuestionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is QuestionStruct &&
        questionDescription == other.questionDescription &&
        answer == other.answer &&
        listEquality.equals(options, other.options) &&
        userAnswer == other.userAnswer;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([questionDescription, answer, options, userAnswer]);
}

QuestionStruct createQuestionStruct({
  String? questionDescription,
  String? answer,
  String? userAnswer,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    QuestionStruct(
      questionDescription: questionDescription,
      answer: answer,
      userAnswer: userAnswer,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

QuestionStruct? updateQuestionStruct(
  QuestionStruct? question, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    question
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addQuestionStructData(
  Map<String, dynamic> firestoreData,
  QuestionStruct? question,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (question == null) {
    return;
  }
  if (question.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && question.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final questionData = getQuestionFirestoreData(question, forFieldValue);
  final nestedData = questionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = question.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getQuestionFirestoreData(
  QuestionStruct? question, [
  bool forFieldValue = false,
]) {
  if (question == null) {
    return {};
  }
  final firestoreData = mapToFirestore(question.toMap());

  // Add any Firestore field values
  question.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getQuestionListFirestoreData(
  List<QuestionStruct>? questions,
) =>
    questions?.map((e) => getQuestionFirestoreData(e, true)).toList() ?? [];
