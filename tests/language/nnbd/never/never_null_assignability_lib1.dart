// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

Null nil = null;

Never never = throw "Never";

void takesAny(Object? n) {}

void takesObject(Object n) {
  // In weak mode, we may get null.  Throw AssertionError so that this
  // can be distinguished from a dynamic call failure.
  if (n == null) throw AssertionError("Not an Object");
}

void takesInt(int n) {
  // In weak mode, we may get null.  Throw AssertionError so that this
  // can be distinguished from a dynamic call failure.
  if (n == null) throw AssertionError("Not an int");
}

void takesNull(Null n) {
  if (n != null) throw AssertionError("Not null");
}

void takesNever(Never n) {
  // In weak mode, we may get null.  Throw AssertionError so that this
  // can be distinguished from a dynamic call failure.
  if (n != null) throw AssertionError("Not null");
}

void applyTakesNull(void Function(Null) fn, dynamic arg) {
  // Make the cast explicit for clarity.
  fn(arg as Null);
}

void applyTakesNever(void Function(Never) fn, dynamic arg) {
  // Make the cast explicit for clarity.
  fn(arg as Never);
}

void applyTakesNullDynamically(void Function(Null) fn, dynamic arg) {
  (fn as dynamic)(arg);
}

void applyTakesNeverDynamically(void Function(Never) fn, dynamic arg) {
  (fn as dynamic)(arg);
}
