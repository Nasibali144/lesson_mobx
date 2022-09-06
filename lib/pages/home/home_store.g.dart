// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$listAtom = Atom(name: 'HomeStoreBase.list', context: context);

  @override
  ObservableList<Post> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(ObservableList<Post> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  late final _$selectedAtom =
      Atom(name: 'HomeStoreBase.selected', context: context);

  @override
  Post? get selected {
    _$selectedAtom.reportRead();
    return super.selected;
  }

  @override
  set selected(Post? value) {
    _$selectedAtom.reportWrite(value, super.selected, () {
      super.selected = value;
    });
  }

  late final _$getAllPostAsyncAction =
      AsyncAction('HomeStoreBase.getAllPost', context: context);

  @override
  Future<void> getAllPost() {
    return _$getAllPostAsyncAction.run(() => super.getAllPost());
  }

  late final _$goToDetailPageAsyncAction =
      AsyncAction('HomeStoreBase.goToDetailPage', context: context);

  @override
  Future<void> goToDetailPage(BuildContext context) {
    return _$goToDetailPageAsyncAction.run(() => super.goToDetailPage(context));
  }

  late final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase', context: context);

  @override
  void editPost(BuildContext context, Post post) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.editPost');
    try {
      return super.editPost(context, post);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateData() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.updateData');
    try {
      return super.updateData();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list},
selected: ${selected}
    ''';
  }
}
