// ignore_for_file: public_member_api_docs, sort_constructors_first
const double xOrigin = 0;
const double yOrigin = 0;

class Point {
  final double x;
  final double y;

  // Sets the x and y instance variables
  // before the constructor body runs.
  Point(this.x, this.y);

  // Named constructor
  Point.origin()
      : x = xOrigin,
        y = yOrigin;

  Point.named()
      : x = 10,
        y = 11;

  // We can use late variable type for below to work
  // Point.namedConst() {
  //   x = 10;
  //   y = 10;
  // }
}

class Dot extends Point {
  final int z;

  Dot.origin(this.z) : super.origin();
  Dot.named(this.z) : super.named();
  Dot(double x, double y, this.z) : super(x, y);
  // Dot(super.x, super.y, this.z);
}

class Customer {
  String name;
  int age;
  String? locations;

  // Name parameter constructor example
  //
  Customer({required this.name, required this.age, this.locations});

  static final Customer origin = Customer(name: "", age: 0, locations: "");

  // Non Named Parameter constructor example
  //
  // Customer(
  //    this.name,
  //    this.age,
  //    this.location
  // );

  // static final Customer origin = Customer( "",  0,  "");

  // factory constructor
  factory Customer.factoryCreate() {
    return origin;
  }
}

class Logger {
  final String name;
  bool mute = false;

  // _cache is library-private, thanks to
  // the _ in front of its name.
  static final Map<String, Logger> _cache = <String, Logger>{};

  factory Logger(String name) {
    return _cache.putIfAbsent(name, () => Logger._internal(name));
  }

  factory Logger.fromJson(Map<String, Object> json) {
    return Logger(json['name'].toString());
  }

  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) print(msg);
  }
}

class Color {
  int? colorID = 0;
  String colorName;

  Color(this.colorName, [this.colorID]);
  Color.withOutColorId(String color) : this.colorName = color;
}

// void main() {
//   final color = Color("New Color");
//   print(color.colorID);
// }
