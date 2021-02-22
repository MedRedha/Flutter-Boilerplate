import 'package:flutter/material.dart';
import 'package:flutter_template/repository/login/login_repo.dart';
import 'package:flutter_template/repository/shared_prefs/local/local_storing.dart';
import 'package:flutter_template/util/mixin/dispose_mixin.dart';
import 'package:injectable/injectable.dart';

@injectable
class SplashViewModel with ChangeNotifier, DisposeMixin {
  final LoginRepo _loginRepo;
  final LocalStoring _localStoring;

  SplashViewModel(this._loginRepo, this._localStoring);

  Future<void> init(SplashNavigator navigator) async {
    await _localStoring.checkForNewInstallation();
    final result = await _loginRepo.isLoggedIn();
    if (result) {
      navigator.goToHome();
    } else {
      navigator.goToLogin();
    }
  }
}

abstract class SplashNavigator {
  void goToHome();

  void goToLogin();
}
