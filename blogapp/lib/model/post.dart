class Post {
  String sId;
  String title;
  String body;
  String date;
  int iV;

  Post({this.sId, this.title, this.body, this.date, this.iV});

  Post.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    body = json['body'];
    date = json['date'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['body'] = this.body;
    data['date'] = this.date;
    data['__v'] = this.iV;
    return data;
  }
}
