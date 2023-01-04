import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  Future<void> setUserData(
    String email,
    String userId,
  ) async {
    final pref = await SharedPreferences.getInstance();
    //data is stroed locally
    pref.setBool('isLogin', true); //it used to chck the user loged
    pref.setString('userId', userId);
    pref.setString('username', email);
  }

  Future<Map> getUserData() async {
    final pref = await SharedPreferences.getInstance();
    final isLogin = await pref.getBool('isLogin');
    final userId = await pref.getString('userId');
    final email = await pref.getString('username');
  

    var userData = {
      'isLogin': isLogin,
      'userId': userId,
      'email': email,
    };
    return userData;
  }

  Future<void> removeUserData() async {
    final pref = await SharedPreferences.getInstance();
    await pref.clear();
  }
}