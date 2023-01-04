part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent {}

class SignupauthEvent extends SignupEvent{

  SignupauthEvent({required this.email,required this.mobileNo,required this.name,required this.password});

   String name;
  String email;
  String mobileNo;
  String password;
}

