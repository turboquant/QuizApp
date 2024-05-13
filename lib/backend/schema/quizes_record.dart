import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';

class QuizesRecord extends FirestoreRecord {
  QuizesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  bool hasUrl() => _url != null;

  // "status" field.
  Status? _status;
  Status? get status => _status;
  bool hasStatus() => _status != null;

  // "errorMessage" field.
  String? _errorMessage;
  String get errorMessage => _errorMessage ?? '';
  bool hasErrorMessage() => _errorMessage != null;

  // "questions" field.
  List<QuestionStruct>? _questions;
  List<QuestionStruct> get questions => _questions ?? const [];
  bool hasQuestions() => _questions != null;

  void _initializeFields() {
    _url = snapshotData['url'] as String?;
    _status = deserializeEnum<Status>(snapshotData['status']);
    _errorMessage = snapshotData['errorMessage'] as String?;
    _questions = getStructList(
      snapshotData['questions'],
      QuestionStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('quizes');

  static Stream<QuizesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuizesRecord.fromSnapshot(s));

  static Future<QuizesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuizesRecord.fromSnapshot(s));

  static QuizesRecord fromSnapshot(DocumentSnapshot snapshot) => QuizesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuizesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuizesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuizesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuizesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuizesRecordData({
  String? url,
  Status? status,
  String? errorMessage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'url': url,
      'status': status,
      'errorMessage': errorMessage,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuizesRecordDocumentEquality implements Equality<QuizesRecord> {
  const QuizesRecordDocumentEquality();

  @override
  bool equals(QuizesRecord? e1, QuizesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.url == e2?.url &&
        e1?.status == e2?.status &&
        e1?.errorMessage == e2?.errorMessage &&
        listEquality.equals(e1?.questions, e2?.questions);
  }

  @override
  int hash(QuizesRecord? e) => const ListEquality()
      .hash([e?.url, e?.status, e?.errorMessage, e?.questions]);

  @override
  bool isValidKey(Object? o) => o is QuizesRecord;
}
