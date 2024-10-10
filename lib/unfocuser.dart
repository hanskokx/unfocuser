library unfocuser;

/*
(c) Copyright 2020 Serov Konstantin.

Licensed under the MIT license:

    http://www.opensource.org/licenses/mit-license.php

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/

import "package:flutter/material.dart";

/// A widget that unfocuses the currently focused widget when tapping outside of it.
///
/// This is useful for dismissing the keyboard or any focused input field when the user
/// taps outside of the focused area. The widget wraps its `child` with a `GestureDetector`
/// that detects taps and unfocuses the primary focus if there is any.
///
/// The unfocus behavior can be disabled by setting [isEnabled] to `false`.
///
/// Example usage:
///
/// ```dart
/// Unfocuser(
///   child: YourWidget(),
/// )
/// ```
///
/// This will unfocus any input fields when the user taps outside of them.
///
/// [child] The widget that this widget wraps.
/// [isEnabled] Whether the unfocus behavior is enabled. Defaults to `true`.
class Unfocuser extends StatelessWidget {
  /// Creates an [Unfocuser] widget.
  ///
  /// The [child] parameter must not be null. The [isEnabled] parameter determines
  /// whether the unfocus functionality is active.
  const Unfocuser({
    required this.child,
    super.key,
    this.isEnabled = true,
  });

  /// The widget below this widget in the tree.
  ///
  /// This widget will be wrapped with a `GestureDetector` that triggers an
  /// unfocus action when tapped outside a focused widget, if [isEnabled] is `true`.
  final Widget child;

  /// Whether this widget will trigger the unfocus action.
  ///
  /// If set to `true`, tapping outside a focused widget will unfocus it.
  /// Defaults to `true`.
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    if (!isEnabled) {
      return child;
    }
    return GestureDetector(
      onTap: () {
        final focusScopeNode = FocusScope.of(context);
        if (focusScopeNode.hasPrimaryFocus == false &&
            focusScopeNode.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: child,
    );
  }
}
