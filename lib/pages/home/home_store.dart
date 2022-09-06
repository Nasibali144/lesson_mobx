import 'package:flutter/material.dart';
import 'package:lesson_mobx/models/post_model.dart';
import 'package:lesson_mobx/pages/detail/detail_page.dart';
import 'package:lesson_mobx/services/network_service.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  ObservableList<Post> list = ObservableList.of([]);

  @observable
  Post? selected;

  @action
  Future<void> getAllPost() async {
    String? response = await NetworkService.GET(NetworkService.API_LIST, NetworkService.paramsEmpty());
    list = ObservableList.of(NetworkService.parsePostList(response!));
  }

  @action
  Future<void> goToDetailPage(BuildContext context) async {

    await Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailPage()));
    getAllPost();
  }

  @action
  void editPost(BuildContext context, Post post) {
    selected = post;
    Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailPage())).then((value) {
      updateData();
    });
  }

  @action
  void updateData () {
    list = ObservableList.of(list);
    selected = null;
  }
}
