import 'package:flutter/material.dart';
import 'package:lesson_mobx/models/post_model.dart';
import 'package:lesson_mobx/services/network_service.dart';
import 'package:mobx/mobx.dart';

part 'detail_store.g.dart';

class DetailStore = DetailStoreBase with _$DetailStore;

abstract class DetailStoreBase with Store {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  @action
  Future<void> createPost(BuildContext context) async {
    String title = titleController.text.trim();
    String body = bodyController.text.trim();
    Post post = Post(id: "01", title: title, body: body, userId: 1);

    await NetworkService.POST(NetworkService.API_CREATE, NetworkService.paramsCreate(post));
    Navigator.pop(context);
  }
}