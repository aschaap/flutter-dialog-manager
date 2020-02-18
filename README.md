# Flutter Dialog Service/Manager
Based on Dane Mackier's writeup and initial code: https://medium.com/flutter-community/manager-your-flutter-dialogs-with-a-dialog-manager-1e862529523a.
Both versions 3.0.3 and 3.1.0 of `get_it` worked, but had to be explicitly named in `pubspec.yaml`.
Due to changes in `get_it`, the locator has to defined like so in the provided base project:
```dart
GetIt locator = GetIt.I;
```

Extended a tiny bit with more variability (namely having either one or two buttons in the popup dialog), to show that this architecture makes doing so easier.