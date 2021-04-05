# Flutter Template by Med Redha

[![Coverage Status](https://coveralls.io/repos/github/icapps/flutter-template/badge.svg)](https://coveralls.io/github/icapps/flutter-template)
[![MIT license](https://img.shields.io/badge/License-MIT-blue.svg)](https://lbesson.mit-license.org/)

- Dependency injection (kiwi)
- Network layer (dio)
- Network logging (niddler, dio)
- Viewmodels (provider)
- Translations
- Json serialization (json_serializable)
- Different environments (dev/alpha/beta/prod)
- Themes (oh yeah!)
- Navigator
- Linting (flutter analyze)

## Update the translations

A custom dart program is used for updating the translations

https://pub.dev/packages/icapps_translations

Add your locale folder to your flutter config
```
flutter:
  assets:
    - assets/locale/
```

Command to run to update the translations
```
flutter packages pub run icapps_translations
```

## Json Serializable & Kiwi

```
flutter packages pub run build_runner build
flutter packages pub run build_runner build --delete-conflicting-outputs
flutter packages pub run build_runner watch
```
## Environments

`--release` is not available for emulators. Performance will be better

### Dev, Debug
```
flutter run --flavor dev -t lib/main.dart

flutter run --release --flavor dev -t lib/main.dart
```

### Alpha
```
flutter run --flavor alpha -t lib/main_alpha.dart

flutter run --release --flavor alpha -t lib/main_alpha.dart
```

### Beta
```
flutter run --flavor beta -t lib/main_beta.dart

flutter run --release --flavor beta -t lib/main_beta.dart
```

### Prod, Release
```
flutter run --flavor prod -t lib/main_prod.dart

flutter run --release --flavor prod -t lib/main_prod.dart
```

## Linting

To check your code matches our linting. The analysis_options.yaml contains all the code checks.

```
flutter analyze
```

## Testing

In order to run the test we need to run

```
flutter test
```

## Fastlane

Fastlane is used for building iOS and Android

## Transform this template project

#### Rename this project

This script will run a dart script. The dart script itself will ask you some input to complete the full rename 
```
./tool/rename_project.sh
```

#### Add provisioning files

```
place the provisioning profiles -> provision_profile/**
naming should be the same as provided in the iOS/Configuration/** files (underscore will be replaced with a space in the configuration files)
```

#### Languages

```
Configure the required languages in xCode
```

### Obfuscation

Obfuscation is enabled by default when using fastlane for building. The symbol files are stored in
`./build/debug-info/#{options[:flavor]}`

**Important**: Add the following regex to jenking configuration to also archive the symbol files
```
**/*.symbols
```

### Icons

Replace the files in assets_launcher_icons/

You can also change the adaptive_icon_background in the flutter_launcher_icons-{flavor}.yaml (currently "#CB2E63") (only available for Android 8.0 devices and above)

After this, run the following command

```
flutter pub run flutter_launcher_icons:main -f flutter_launcher_icons-dev.yaml
```

### Common issues

```
No Flavor provided
```

Add a flavor to your configuration.

### Questions?

For question contact me or check Stackoverflow
