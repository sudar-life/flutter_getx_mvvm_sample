class RandomUserSimple {
  final String? thumbnail;
  final String? fullname;
  final String? phone;

  RandomUserSimple({
    this.thumbnail,
    this.fullname,
    this.phone,
  });
  factory RandomUserSimple.fromJson(Map<String, dynamic> json) {
    var nameBuffer = StringBuffer();
    nameBuffer.writeAll([
      json["name"]['first'],
      json["name"]['last'],
    ]);
    var thumbnail = json['picture']['thumbnail'];
    return RandomUserSimple(
      fullname: nameBuffer.toString(),
      phone: json["phone"],
      thumbnail: thumbnail,
    );
  }
}
