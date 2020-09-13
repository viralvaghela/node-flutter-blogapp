import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String url = "http://192.168.43.138:4000/post";
  var response;
  bool isloaded = false;
  List data;
  @override
  void initState() {
    super.initState();
    getPosts();
  }

  void getPosts() async {
    var response = await http.get(url);
    setState(() {
      data = jsonDecode(response.body);
      isloaded = true;
    });

/* List<Post> myModels;
    //Solution: 2 copy from stackoverflow and i dont know WTF is
    myModels = (json.decode(response.body) as List)                                                                                                                                                                                                                                                                                                                                                                                                                                               
        .map((i) => Post.fromJson(i))
        .toList();
        */

    /*  Solution1 my Own logic
    response = await http.get(url);
    var jsonData = await jsonDecode(response.body);
    post = jsonData.toList();
  
    Post myPost = Post.fromJson(post[0]);
    print("Body:   "+myPost.body);

*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isloaded != false
          ? SingleChildScrollView(
              child: Column(
                children: data.map((item) {
                  return InkWell(
                    onTap: () {
                      print(item['title']);
                    },
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            Text(
                              "${item['title']}",
                              style: TextStyle(fontSize: 24),
                              textAlign: TextAlign.start,
                            ),
                            Padding(padding: EdgeInsets.all(10)),
                            Text("${item['body']}"),
                            Row(
                              children: [
                                IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      deletePost(item['_id']);
                                    }),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            )
          : Center(child: CircularProgressIndicator()),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            isloaded = false;
            getPosts();
          });
        },
      ),
    );
  }

  void deletePost(String postId) async {
    var response = await http.delete(url + "/" + postId);
   
      setState(() {
      isloaded = false;
      getPosts();
    });
  }
}
