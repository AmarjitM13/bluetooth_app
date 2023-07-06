// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_image_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DogImageStore on _DogImageStore, Store {
  late final _$fetchingDataAtom =
      Atom(name: '_DogImageStore.fetchingData', context: context);

  @override
  bool get fetchingData {
    _$fetchingDataAtom.reportRead();
    return super.fetchingData;
  }

  @override
  set fetchingData(bool value) {
    _$fetchingDataAtom.reportWrite(value, super.fetchingData, () {
      super.fetchingData = value;
    });
  }

  late final _$dogImageUrlAtom =
      Atom(name: '_DogImageStore.dogImageUrl', context: context);

  @override
  String? get dogImageUrl {
    _$dogImageUrlAtom.reportRead();
    return super.dogImageUrl;
  }

  @override
  set dogImageUrl(String? value) {
    _$dogImageUrlAtom.reportWrite(value, super.dogImageUrl, () {
      super.dogImageUrl = value;
    });
  }

  late final _$loadDogImageAsyncAction =
      AsyncAction('_DogImageStore.loadDogImage', context: context);

  @override
  Future<void> loadDogImage() {
    return _$loadDogImageAsyncAction.run(() => super.loadDogImage());
  }

  @override
  String toString() {
    return '''
fetchingData: ${fetchingData},
dogImageUrl: ${dogImageUrl}
    ''';
  }
}
