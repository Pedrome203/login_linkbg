import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_linkbg/data/rest/auth_rest_service.dart';

enum SplashState {
  login,
  home,
}

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState.login);

  void init() async {
    final response = await validateToken();
    if (response) {
      emit(SplashState.home);
    } else {
      emit(SplashState.login);
    }
  }
}
