import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignupEvent>((event, emit) async {
      if (event is SignupauthEvent) {
        final auth = FirebaseAuth.instance;
        final userRef = FirebaseFirestore.instance.collection('Users');
        try {
          await auth.createUserWithEmailAndPassword(
              email: event.email, password: event.password);

          await userRef.doc(auth.currentUser!.uid).set({
            'userId': auth.currentUser!.uid,
            'email': event.email,
            'studentName': event.name,
            'mobNo': event.mobileNo,
            'passwrod': event.password,
          });

          emit(SignupSuccess());
        } catch (e) { emit(SignupFailed());}
      }
    });
  }
}
