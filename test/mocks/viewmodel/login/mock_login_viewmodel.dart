import 'package:flutter/cupertino.dart';
import 'package:flutter_template/viewmodel/login/login_viewmodel.dart';
import 'package:injectable/injectable.dart';
import 'package:mockito/mockito.dart';

@test
@Singleton(as: LoginViewModel)
class MockLoginViewModel extends Mock with ChangeNotifier implements LoginViewModel {}
