import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class PatientRecord extends FirestoreRecord {
  PatientRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "Email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  void _initializeFields() {
    _phoneNumber = snapshotData['phone_number'] as String?;
    _name = snapshotData['name'] as String?;
    _password = snapshotData['password'] as String?;
    _email = snapshotData['Email'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Patient');

  static Stream<PatientRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PatientRecord.fromSnapshot(s));

  static Future<PatientRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PatientRecord.fromSnapshot(s));

  static PatientRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PatientRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PatientRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PatientRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PatientRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PatientRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPatientRecordData({
  String? phoneNumber,
  String? name,
  String? password,
  String? email,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'phone_number': phoneNumber,
      'name': name,
      'password': password,
      'Email': email,
    }.withoutNulls,
  );

  return firestoreData;
}

class PatientRecordDocumentEquality implements Equality<PatientRecord> {
  const PatientRecordDocumentEquality();

  @override
  bool equals(PatientRecord? e1, PatientRecord? e2) {
    return e1?.phoneNumber == e2?.phoneNumber &&
        e1?.name == e2?.name &&
        e1?.password == e2?.password &&
        e1?.email == e2?.email;
  }

  @override
  int hash(PatientRecord? e) => const ListEquality()
      .hash([e?.phoneNumber, e?.name, e?.password, e?.email]);

  @override
  bool isValidKey(Object? o) => o is PatientRecord;
}
