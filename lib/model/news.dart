class News {
  int id;
  String title;
  String desc;
  String image;
  String category;

  News({this.id, this.title, this.desc, this.image, this.category});

  News.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['name'];
    desc = map['descrption'];
    image = map['image'];
    category = map['category'];
  }
}
