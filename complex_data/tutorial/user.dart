/* 
  "gender": "male",
  "name": {
    "title": "Mr",
    "first": "Jackson",
    "last": "Anderson"
  },
  "location": {
    "street": {
      "number": 8183,
      "name": "Heretaunga Street"
    },
    "city": "Porirua",
    "state": "Gisborne",
    "country": "New Zealand",
    "postcode": 87667,
    "coordinates": {
      "latitude": "51.4002",
      "longitude": "-112.1570"
    },
    "timezone": {
      "offset": "+10:00",
      "description": "Eastern Australia, Guam, Vladivostok"
    }
  },
*/
class User {
  late String gender, email, phone, cell, nat;
  Name name;
  Location location;
  Login login;
  Dob dob;
  Registered registered;
  Id id;
  Picture picture;
  User({
    required this.gender,
    required this.email,
    required this.name,
    required this.location,
    required this.login,
    required this.dob,
    required this.registered,
    required this.phone,
    required this.cell,
    required this.id,
    required this.picture,
    required this.nat,
  });
  factory User.from(dynamic data) {
    Name name = Name.from(data['name']);
    Location location = Location.from(data['location']);
    Login login = Login.from(data['login']);
    Dob dob = Dob.from(data['dob']);
    Registered registered = Registered.from(data['registered']);
    Id id = Id.from(data['id']);
    Picture picture = Picture.from(data['picture']);
    return User(
      gender: data['gender'],
      email: data['email'],
      name: name,
      location: location,
      login: login,
      dob: dob,
      registered: registered,
      phone: data['phone'],
      cell: data['cell'],
      id: id,
      picture: picture,
      nat: data['nat'],
    );
  }
}

class Name {
  late String title, first, last;
  Name({required this.title, required this.first, required this.last});
  factory Name.from(dynamic data) {
    return Name(title: data['title'], first: data['first'], last: data['last']);
  }
}

class Location {
  late Street street;
  late String city, state, country, postcode;
  late Coordinates coordinates;
  late TimeZone timezone;

  Location({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.coordinates,
    required this.timezone,
  });
  factory Location.from(dynamic data) {
    Street street = Street.from(data['street']);
    Coordinates coordinates = Coordinates.from(data['coordinates']);
    TimeZone timezone = TimeZone.from(data['timezone']);
    var pcode = '';
    if (data['postcode'] is int) {
      pcode = data['postcode'].toString();
    } else {
      pcode = data['postcode'];
    }
    return Location(
      street: street,
      city: data['city'],
      state: data['state'],
      country: data['country'],
      postcode: pcode,
      coordinates: coordinates,
      timezone: timezone,
    );
  }
}

class Street {
  late String name;
  late int number;
  Street({required this.number, required this.name});
  factory Street.from(dynamic data) {
    return Street(number: data['number'], name: data['name']);
  }
}

class Coordinates {
  late String latitude, longitude;
  Coordinates({required this.latitude, required this.longitude});
  factory Coordinates.from(dynamic data) {
    return Coordinates(
      latitude: data['latitude'],
      longitude: data['longitude'],
    );
  }
}

class TimeZone {
  late String offset, description;
  TimeZone({required this.offset, required this.description});
  factory TimeZone.from(dynamic data) {
    return TimeZone(offset: data['offset'], description: data['description']);
  }
}

class Login {
  late String uuid, username, password, salt, md5, sha1, sha256;
  Login({
    required this.uuid,
    required this.username,
    required this.password,
    required this.salt,
    required this.md5,
    required this.sha1,
    required this.sha256,
  });
  factory Login.from(dynamic data) {
    return Login(
      uuid: data['uuid'],
      username: data['username'],
      password: data['password'],
      salt: data['salt'],
      md5: data['md5'],
      sha1: data['sha1'],
      sha256: data['sha256'],
    );
  }
}

class Dob {
  late String date;
  late int age;
  Dob({required this.date, required this.age});
  factory Dob.from(dynamic data) {
    return Dob(date: data['date'], age: data['age']);
  }
}

class Registered {
  late String date;
  late int age;
  Registered({required this.date, required this.age});
  factory Registered.from(dynamic data) {
    return Registered(date: data['date'], age: data['age']);
  }
}

class Id {
  late String name, value;
  Id({required this.name, required this.value});
  factory Id.from(dynamic data) {
    String val = data['value'] is Null ? '' : data['value'];
    return Id(name: data['name'], value: val);
  }
}

class Picture {
  late String large, medium, thumbnail;
  Picture({required this.large, required this.medium, required this.thumbnail});
  factory Picture.from(dynamic data) {
    return Picture(
      large: data['large'],
      medium: data['medium'],
      thumbnail: data['thumbnail'],
    );
  }
}
