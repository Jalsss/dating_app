
class Message {
  int id;
  String content;
  String createdAt;
  bool isYou;

  Message(
      {this.id,
        this.createdAt,
        this.content,
        this.isYou});
}