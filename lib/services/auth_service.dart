import 'package:employee_attendance/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService extends ChangeNotifier {
  final SupabaseClient _supabase = Supabase.instance.client;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future registerEmployee(
      String email, String password, BuildContext context) async {
    try {
      setIsLoading = true;
      if(email == "" || password == ""){
        throw("All Fields are require");
      }
      final AuthResponse response = await _supabase.auth.signUp(password: password);
      Utils.showSnackBar("Success ! you can now login", context, color: Colors.green);
      Navigator.pop(context);
      setIsLoading = false;
    } catch(e) {
      setIsLoading = false;
      Utils.showSnackBar(e.toString(), context, color: Colors.red);
    }
  }


}