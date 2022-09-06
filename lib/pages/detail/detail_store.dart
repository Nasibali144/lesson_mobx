import 'package:flutter/material.dart';
import 'package:lesson_mobx/models/post_model.dart';
import 'package:lesson_mobx/pages/home/home_store.dart';
import 'package:lesson_mobx/services/network_service.dart';
import 'package:lesson_mobx/services/service_locator.dart';
import 'package:mobx/mobx.dart';

part 'detail_store.g.dart';

class DetailStore = DetailStoreBase with _$DetailStore;

abstract class DetailStoreBase with Store {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  @action
  void init() {
    var homeStore = locator<HomeStore>();
    if(homeStore.selected != null) {
      titleController.text = homeStore.selected!.title;
      bodyController.text = homeStore.selected!.body;
    }
  }

  @action
  Future<void> savePost(BuildContext context) async {
    var homeStore = locator<HomeStore>();
    String title = titleController.text.trim();
    String body = bodyController.text.trim();

    if(homeStore.selected != null) {
      homeStore.selected!.title = title;
      homeStore.selected!.body = body;
      await NetworkService.PUT(NetworkService.API_UPDATE + homeStore.selected!.id, NetworkService.paramsUpdate(homeStore.selected!));
    } else {
      Post post = Post(id: "01", title: title, body: body, userId: 1);
      await NetworkService.POST(NetworkService.API_CREATE, NetworkService.paramsCreate(post));
    }

    Navigator.pop(context);
  }
}