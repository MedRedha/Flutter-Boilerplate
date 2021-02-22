import 'package:flutter/cupertino.dart';
import 'package:flutter_template/repository/locale/locale_repo.dart';
import 'package:flutter_template/repository/locale/locale_repository.dart';
import 'package:flutter_template/repository/shared_prefs/shared_prefs_storing.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

import '../../di/test_injectable.dart';
import '../../util/test_extensions.dart';

void main() {
  SharedPrefsStoring shardPrefs;
  LocaleRepo sut;

  setUp(() async {
    await initTestInjectable();
    shardPrefs = GetIt.I();
    sut = LocaleRepository(shardPrefs);
  });

  group('setCustomLocale', () {
    test('setCustomLocale enabled true', () async {
      await sut.setCustomLocale(const Locale('en'));
      verify(shardPrefs.saveString(key: 'locale', value: 'en')).calledOnce();
      verifyNoMoreInteractions(shardPrefs);
    });

    test('setCustomLocale enabled false', () async {
      await sut.setCustomLocale(const Locale('nl'));
      verify(shardPrefs.saveString(key: 'locale', value: 'nl')).calledOnce();
      verifyNoMoreInteractions(shardPrefs);
    });

    test('setCustomLocale enabled set to null', () async {
      await sut.setCustomLocale(null);
      verify(shardPrefs.deleteKey('locale')).calledOnce();
      verifyNoMoreInteractions(shardPrefs);
    });
  });

  group('getCustomLocale', () {
    test('getCustomLocale when enabled was not set', () async {
      final result = sut.getCustomLocale();
      expect(result, null);
      verify(shardPrefs.getString('locale')).calledOnce();
      verifyNoMoreInteractions(shardPrefs);
    });

    test('getCustomLocale when enabled was set to en', () async {
      when(shardPrefs.getString('locale')).thenAnswer((_) => '');
      final result = sut.getCustomLocale();
      expect(result, null);
      verify(shardPrefs.getString('locale'));
      verifyNoMoreInteractions(shardPrefs);
    });

    test('getCustomLocale when enabled was set to en', () async {
      when(shardPrefs.getString('locale')).thenAnswer((_) => 'en');
      final result = sut.getCustomLocale();
      expect(result.languageCode, 'en');
      verify(shardPrefs.getString('locale')).calledOnce();
      verifyNoMoreInteractions(shardPrefs);
    });

    test('getCustomLocale when enabled was set to nl', () async {
      when(shardPrefs.getString('locale')).thenAnswer((_) => 'nl');
      final result = sut.getCustomLocale();
      expect(result.languageCode, 'nl');
      verify(shardPrefs.getString('locale')).calledOnce();
      verifyNoMoreInteractions(shardPrefs);
    });
  });
}
