// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStore, Store {
  late final _$bluetoothEnabledAtom =
      Atom(name: '_HomeStore.bluetoothEnabled', context: context);

  @override
  bool get bluetoothEnabled {
    _$bluetoothEnabledAtom.reportRead();
    return super.bluetoothEnabled;
  }

  @override
  set bluetoothEnabled(bool value) {
    _$bluetoothEnabledAtom.reportWrite(value, super.bluetoothEnabled, () {
      super.bluetoothEnabled = value;
    });
  }

  late final _$_HomeStoreActionController =
      ActionController(name: '_HomeStore', context: context);

  @override
  void changePageWithBottomBar() {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.changePageWithBottomBar');
    try {
      return super.changePageWithBottomBar();
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
bluetoothEnabled: ${bluetoothEnabled}
    ''';
  }
}
