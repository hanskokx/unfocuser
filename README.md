## Features

Unfocuser pops the keyboard when tapping outside of a text input.

## Getting started

- Add `unfocuser: ^1.0.0` to your pubspec.yaml.
- Wrap your parent widget with `Unfocuser`
  - This often works well when wrapping your `MaterialApp`

## Usage

```dart
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Unfocuser(
      child: MaterialApp(
        home: TextFormField(),
      ),
    );
  }
}
```

## Additional information

Original code by Serov Konstantin. All credit goes to them.
