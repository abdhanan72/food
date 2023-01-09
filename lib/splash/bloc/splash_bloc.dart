import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../sharedpref/view/sharedpref.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashEvent>((event, emit) async {
      if (event is NavigateToLoginEvent) {
        await Future.delayed(const Duration(seconds: 5));

        //shred pefence code
        final data = await SharedPref().getUserData();
        print(data);

        if (data['isLogin'] == true) {
          emit(NaigateToHomeState());
        } else {
          emit(NavigateLoginState());
        }
      }
    });
  }
}
