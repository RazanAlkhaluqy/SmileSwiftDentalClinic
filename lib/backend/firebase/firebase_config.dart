import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBb8cgf_9r8de1VQqYXA7JER08FTqnMmhU",
            authDomain: "smileswift-ab2da.firebaseapp.com",
            projectId: "smileswift-ab2da",
            storageBucket: "smileswift-ab2da.appspot.com",
            messagingSenderId: "400259110098",
            appId: "1:400259110098:web:4d87e914037bbd2d98490b",
            measurementId: "G-4NYLVG6GV7"));
  } else {
    await Firebase.initializeApp();
  }
}
