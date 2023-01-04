part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginStateEvent extends LoginEvent {
  LoginStateEvent({required this.email,required this.password});
    String email;
  String password;
}