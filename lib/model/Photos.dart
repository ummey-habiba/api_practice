class Photos {
  Photos({
      this.albumId, 
      this.id, 
      this.title, 
      this.url, 
      this.thumbnailUrl,});

  Photos.fromJson(dynamic json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }
  num? albumId;
  num? id;
  String? title;
  String? url;
  String? thumbnailUrl;
Photos copyWith({  num? albumId,
  num? id,
  String? title,
  String? url,
  String? thumbnailUrl,
}) => Photos(  albumId: albumId ?? this.albumId,
  id: id ?? this.id,
  title: title ?? this.title,
  url: url ?? this.url,
  thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['albumId'] = albumId;
    map['id'] = id;
    map['title'] = title;
    map['url'] = url;
    map['thumbnailUrl'] = thumbnailUrl;
    return map;
  }

}