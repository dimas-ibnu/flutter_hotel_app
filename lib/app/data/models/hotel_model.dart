// To parse this JSON data, do
//
//     final hotelModel = hotelModelFromJson(jsonString);

import 'dart:convert';

HotelModel hotelModelFromJson(String str) => HotelModel.fromJson(json.decode(str));

String hotelModelToJson(HotelModel data) => json.encode(data.toJson());

class HotelModel {
    List<HotelDataModel>? value;

    HotelModel({
        this.value,
    });

    factory HotelModel.fromJson(Map<String, dynamic> json) => HotelModel(
        value: json["value"] == null ? [] : List<HotelDataModel>.from(json["value"]!.map((x) => HotelDataModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "value": value == null ? [] : List<dynamic>.from(value!.map((x) => x.toJson())),
    };
}

class HotelDataModel {
    String? hotelId;
    String? hotelName;
    String? description;
    String? descriptionFr;
    Category? category;
    List<String>? tags;
    bool? parkingIncluded;
    DateTime? lastRenovationDate;
    double? rating;
    Address? address;
    Location? location;
    List<Room>? rooms;

    HotelDataModel({
        this.hotelId,
        this.hotelName,
        this.description,
        this.descriptionFr,
        this.category,
        this.tags,
        this.parkingIncluded,
        this.lastRenovationDate,
        this.rating,
        this.address,
        this.location,
        this.rooms,
    });

    factory HotelDataModel.fromJson(Map<String, dynamic> json) => HotelDataModel(
        hotelId: json["HotelId"],
        hotelName: json["HotelName"],
        description: json["Description"],
        descriptionFr: json["Description_fr"],
        category: categoryHotelDataModels.map[json["Category"]]!,
        tags: json["Tags"] == null ? [] : List<String>.from(json["Tags"]!.map((x) => x)),
        parkingIncluded: json["ParkingIncluded"],
        lastRenovationDate: json["LastRenovationDate"] == null ? null : DateTime.parse(json["LastRenovationDate"]),
        rating: json["Rating"]?.toDouble(),
        address: json["Address"] == null ? null : Address.fromJson(json["Address"]),
        location: json["Location"] == null ? null : Location.fromJson(json["Location"]),
        rooms: json["Rooms"] == null ? [] : List<Room>.from(json["Rooms"]!.map((x) => Room.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "HotelId": hotelId,
        "HotelName": hotelName,
        "Description": description,
        "Description_fr": descriptionFr,
        "Category": categoryHotelDataModels.reverse[category],
        "Tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "ParkingIncluded": parkingIncluded,
        "LastRenovationDate": lastRenovationDate?.toIso8601String(),
        "Rating": rating,
        "Address": address?.toJson(),
        "Location": location?.toJson(),
        "Rooms": rooms == null ? [] : List<dynamic>.from(rooms!.map((x) => x.toJson())),
    };
}

class Address {
    String? streetAddress;
    String? city;
    String? stateProvince;
    String? postalCode;
    Country? country;

    Address({
        this.streetAddress,
        this.city,
        this.stateProvince,
        this.postalCode,
        this.country,
    });

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        streetAddress: json["StreetAddress"],
        city: json["City"],
        stateProvince: json["StateProvince"],
        postalCode: json["PostalCode"],
        country: countryHotelDataModels.map[json["Country"]]!,
    );

    Map<String, dynamic> toJson() => {
        "StreetAddress": streetAddress,
        "City": city,
        "StateProvince": stateProvince,
        "PostalCode": postalCode,
        "Country": countryHotelDataModels.reverse[country],
    };
}

enum Country { USA }

final countryHotelDataModels = EnumHotelDataModels({
    "USA": Country.USA
});

enum Category { BOUTIQUE, EXTENDED_STAY, RESORT_AND_SPA, LUXURY, BUDGET, SUITE }

final categoryHotelDataModels = EnumHotelDataModels({
    "Boutique": Category.BOUTIQUE,
    "Budget": Category.BUDGET,
    "Extended-Stay": Category.EXTENDED_STAY,
    "Luxury": Category.LUXURY,
    "Resort and Spa": Category.RESORT_AND_SPA,
    "Suite": Category.SUITE
});

class Location {
    Type? type;
    List<double>? coordinates;

    Location({
        this.type,
        this.coordinates,
    });

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        type: typeHotelDataModels.map[json["type"]]!,
        coordinates: json["coordinates"] == null ? [] : List<double>.from(json["coordinates"]!.map((x) => x?.toDouble())),
    );

    Map<String, dynamic> toJson() => {
        "type": typeHotelDataModels.reverse[type],
        "coordinates": coordinates == null ? [] : List<dynamic>.from(coordinates!.map((x) => x)),
    };
}

enum Type { POINT }

final typeHotelDataModels = EnumHotelDataModels({
    "Point": Type.POINT
});

class Room {
    String? description;
    String? descriptionFr;
    TypeEnum? type;
    double? baseRate;
    BedOptions? bedOptions;
    int? sleepsCount;
    bool? smokingAllowed;
    List<Tag>? tags;

    Room({
        this.description,
        this.descriptionFr,
        this.type,
        this.baseRate,
        this.bedOptions,
        this.sleepsCount,
        this.smokingAllowed,
        this.tags,
    });

    factory Room.fromJson(Map<String, dynamic> json) => Room(
        description: json["Description"],
        descriptionFr: json["Description_fr"],
        type: typeEnumHotelDataModels.map[json["Type"]]!,
        baseRate: json["BaseRate"]?.toDouble(),
        bedOptions: bedOptionsHotelDataModels.map[json["BedOptions"]]!,
        sleepsCount: json["SleepsCount"],
        smokingAllowed: json["SmokingAllowed"],
        tags: json["Tags"] == null ? [] : List<Tag>.from(json["Tags"]!.map((x) => tagHotelDataModels.map[x]!)),
    );

    Map<String, dynamic> toJson() => {
        "Description": description,
        "Description_fr": descriptionFr,
        "Type": typeEnumHotelDataModels.reverse[type],
        "BaseRate": baseRate,
        "BedOptions": bedOptionsHotelDataModels.reverse[bedOptions],
        "SleepsCount": sleepsCount,
        "SmokingAllowed": smokingAllowed,
        "Tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => tagHotelDataModels.reverse[x])),
    };
}

enum BedOptions { THE_1_QUEEN_BED, THE_1_KING_BED, THE_2_DOUBLE_BEDS, THE_2_QUEEN_BEDS }

final bedOptionsHotelDataModels = EnumHotelDataModels({
    "1 King Bed": BedOptions.THE_1_KING_BED,
    "1 Queen Bed": BedOptions.THE_1_QUEEN_BED,
    "2 Double Beds": BedOptions.THE_2_DOUBLE_BEDS,
    "2 Queen Beds": BedOptions.THE_2_QUEEN_BEDS
});

enum Tag { VCR_DVD, JACUZZI_TUB, SUITE, BATHROOM_SHOWER, COFFEE_MAKER, ROOM_TAGS, TV }

final tagHotelDataModels = EnumHotelDataModels({
    "bathroom shower": Tag.BATHROOM_SHOWER,
    "coffee maker": Tag.COFFEE_MAKER,
    "jacuzzi tub": Tag.JACUZZI_TUB,
    "Room Tags": Tag.ROOM_TAGS,
    "suite": Tag.SUITE,
    "tv": Tag.TV,
    "vcr/dvd": Tag.VCR_DVD
});

enum TypeEnum { BUDGET_ROOM, DELUXE_ROOM, STANDARD_ROOM, SUITE }

final typeEnumHotelDataModels = EnumHotelDataModels({
    "Budget Room": TypeEnum.BUDGET_ROOM,
    "Deluxe Room": TypeEnum.DELUXE_ROOM,
    "Standard Room": TypeEnum.STANDARD_ROOM,
    "Suite": TypeEnum.SUITE
});

class EnumHotelDataModels<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumHotelDataModels(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
