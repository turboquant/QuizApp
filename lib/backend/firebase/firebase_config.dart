import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyD8henrbklmbXaIDbhuYGH_spUF3KOC7TA",
            authDomain: "quizapp-adfee.firebaseapp.com",
            projectId: "quizapp-adfee",
            storageBucket: "quizapp-adfee.appspot.com",
            messagingSenderId: "767090572267",
            appId: "1:767090572267:web:9417e0448352adbe86f7ae",
            measurementId: "G-BEE2CRSM35"));
  } else {
    await Firebase.initializeApp();
  }
}
