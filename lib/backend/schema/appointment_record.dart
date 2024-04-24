import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class AppointmentRecord extends FirestoreRecord {
  AppointmentRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "patient_id" field.
  DocumentReference? _patientId;
  DocumentReference? get patientId => _patientId;
  bool hasPatientId() => _patientId != null;

  // "doctor_id" field.
  DocumentReference? _doctorId;
  DocumentReference? get doctorId => _doctorId;
  bool hasDoctorId() => _doctorId != null;

  void _initializeFields() {
    _state = snapshotData['state'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _patientId = snapshotData['patient_id'] as DocumentReference?;
    _doctorId = snapshotData['doctor_id'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Appointment');

  static Stream<AppointmentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppointmentRecord.fromSnapshot(s));

  static Future<AppointmentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AppointmentRecord.fromSnapshot(s));

  static AppointmentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppointmentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppointmentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppointmentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppointmentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppointmentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAppointmentRecordData({
  String? state,
  DateTime? date,
  DocumentReference? patientId,
  DocumentReference? doctorId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'state': state,
      'date': date,
      'patient_id': patientId,
      'doctor_id': doctorId,
    }.withoutNulls,
  );

  return firestoreData;
}

class AppointmentRecordDocumentEquality implements Equality<AppointmentRecord> {
  const AppointmentRecordDocumentEquality();

  @override
  bool equals(AppointmentRecord? e1, AppointmentRecord? e2) {
    return e1?.state == e2?.state &&
        e1?.date == e2?.date &&
        e1?.patientId == e2?.patientId &&
        e1?.doctorId == e2?.doctorId;
  }

  @override
  int hash(AppointmentRecord? e) =>
      const ListEquality().hash([e?.state, e?.date, e?.patientId, e?.doctorId]);

  @override
  bool isValidKey(Object? o) => o is AppointmentRecord;
}
