import 'package:app_imc/models/user_app.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  static final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  static Future<void> saveUser(UserApp user) async {
    return users.doc(user.name).set(user.toMap());
  }
  
}
