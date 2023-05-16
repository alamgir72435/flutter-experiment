import "dart:convert";

import "package:flutter/material.dart";
import "package:http/http.dart" as http;

class InfiniteScrl extends StatefulWidget {
  const InfiniteScrl({Key? key}) : super(key: key);

  @override
  State<InfiniteScrl> createState() => _InfiniteScrlState();
}

class _InfiniteScrlState extends State<InfiniteScrl> {
  final scrollController = ScrollController();
  int page = 1;
  List posts = [];
  bool loading = false;
  bool firstLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(_scrollListener);
    fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      // appBar: AppBar(
      //   title: Text('Home'),
      // ),
      body: firstLoading
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.deepPurple,
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.all(12.0),
              controller: scrollController,
              itemCount: loading ? posts.length + 1 : posts.length,
              itemBuilder: (context, index) {
                if (index < posts.length) {
                  final post = posts[index];
                  final title = post['title'];
                  final body = post['body'];
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                      ),
                      title: Text('$title'),
                      subtitle: Text('$body'),
                    ),
                  );
                } else {
                  return Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
    );
  }

  Future<void> fetchPosts() async {
    final url =
        'https://jsonplaceholder.typicode.com/posts?_page=$page&_limit=10';
    print('${url}');

    final uri = Uri.parse(url);
    if (page == 1) {
      setState(() {
        firstLoading = true;
      });
    }

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      // expected response
      final json = jsonDecode(response.body) as List;

      setState(() {
        posts = posts + json;
      });
    } else {
      // error response
      // print('Error Found!');
    }

    if (page == 1) {
      setState(() {
        firstLoading = false;
      });
    }
  }

  _scrollListener() async {
    if (loading) return; // dont call api if loading is processing...
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      // call api
      page = page + 1;
      setState(() {
        loading = true;
      });
      await fetchPosts();
      setState(() {
        loading = false;
      });
    } else {
      // print('Scrolling...');
    }
  }
}
