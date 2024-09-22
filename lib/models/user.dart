class User {
  int? id;
  String name, username, email, phone, website;
  Address address;
  Company company;

  User({
    this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      username: map['username'],
      email: map['email'],
      address: Address.fromMap(map['address']), // Convert nested address
      phone: map['phone'],
      website: map['website'],
      company: Company.fromMap(map['company']), // Convert nested company
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'address': address.toMap(), // Convert Address object to Map
      'phone': phone,
      'website': website,
      'company': company.toMap(), // Convert Company object to Map
    };
  }
}

class Address {
  String street, suite, city, zipcode;
  Geo geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      street: map['street'],
      suite: map['suite'],
      city: map['city'],
      zipcode: map['zipcode'],
      geo: Geo.fromMap(map['geo']), // Convert nested geo object
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'street': street,
      'suite': suite,
      'city': city,
      'zipcode': zipcode,
      'geo': geo.toMap(),
    };
  }
}

class Geo {
  String lat, lng;

  Geo({
    required this.lat,
    required this.lng,
  });

  factory Geo.fromMap(Map<String, dynamic> map) {
    return Geo(
      lat: map['lat'],
      lng: map['lng'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }
}

class Company {
  String name, catchPhrase, bs;

  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory Company.fromMap(Map<String, dynamic> map) {
    return Company(
      name: map['name'],
      catchPhrase: map['catchPhrase'],
      bs: map['bs'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'catchPhrase': catchPhrase,
      'bs': bs,
    };
  }
}
