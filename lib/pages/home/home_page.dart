import 'package:flutter/material.dart';
import 'package:lesson_mobx/models/post_model.dart';
import 'package:lesson_mobx/pages/home/home_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeStore store = HomeStore()..getAllPost();
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Posts"),
      ),
      body: Observer(
        builder: (context) {
          return ListView.builder(
            itemCount: store.list.length,
            itemBuilder: (context, index) {
              Post post = store.list[index];

              return Card(
                child: ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.body),
                ),
              );
            },
          );
        }
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => store.goToDetailPage(context),
      ),
    );
  }
}
