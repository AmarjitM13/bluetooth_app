// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileStore on _ProfileStore, Store {
  late final _$fetchingProfileDataAtom =
      Atom(name: '_ProfileStore.fetchingProfileData', context: context);

  @override
  bool get fetchingProfileData {
    _$fetchingProfileDataAtom.reportRead();
    return super.fetchingProfileData;
  }

  @override
  set fetchingProfileData(bool value) {
    _$fetchingProfileDataAtom.reportWrite(value, super.fetchingProfileData, () {
      super.fetchingProfileData = value;
    });
  }

  late final _$profileDataAtom =
      Atom(name: '_ProfileStore.profileData', context: context);

  @override
  ProfileModel? get profileData {
    _$profileDataAtom.reportRead();
    return super.profileData;
  }

  @override
  set profileData(ProfileModel? value) {
    _$profileDataAtom.reportWrite(value, super.profileData, () {
      super.profileData = value;
    });
  }

  late final _$getProfileDataAsyncAction =
      AsyncAction('_ProfileStore.getProfileData', context: context);

  @override
  Future<void> getProfileData() {
    return _$getProfileDataAsyncAction.run(() => super.getProfileData());
  }

  @override
  String toString() {
    return '''
fetchingProfileData: ${fetchingProfileData},
profileData: ${profileData}
    ''';
  }
}
