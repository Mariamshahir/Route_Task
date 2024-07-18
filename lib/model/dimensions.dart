/// width : 23.17
/// height : 14.43
/// depth : 28.01

class Dimensions {
  num? width;
  num? height;
  num? depth;

  Dimensions(this.height, this.width, this.depth);

  Dimensions.fromJson(dynamic json) {
    width = json['width'];
    height = json['height'];
    depth = json['depth'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['width'] = width;
    map['height'] = height;
    map['depth'] = depth;
    return map;
  }
}
