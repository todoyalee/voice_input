class TcModel {
  final int id;
  final String value;
  final DateTime createdAt;
  final DateTime updatedAt;

  TcModel({
    required this.id,
    required this.value,
    required this.createdAt,
    required this.updatedAt,
  });

  TcModel copyWith({
    int? id,
    String? value,
    DateTime? createdAt,
    DateTime? updatedAt,  
  }) =>
      TcModel(
        id: id ?? this.id,
        value: value ?? this.value,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory TcModel.fromJson(Map<String, dynamic> json) => TcModel(
        id: json["id"],
        value: json["value"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

const initialData = [
  {
    "id": 7610,
    "value": "Hard work always pays off",
    "createdAt": "2023-09-04 12:11:42",
    "updatedAt": "2023-09-04 12:11:42"
  },
  {
    "id": 7611,
    "value": "If there is a will , there is a way",
    "createdAt": "2023-09-04 12:11:42",
    "updatedAt": "2023-09-04 12:11:42"
  },
  {
    "id": 7612,
    "value":
        "Material will be delivered 3-4 weeks the date of Confirmation of Order",
    "createdAt": "2023-09-04 12:11:42",
    "updatedAt": "2023-09-04 12:11:42"
  },
  {
    "id": 7613,
    "value": "When you give up, that s when the game is over.",
    "createdAt": "2023-09-04 12:11:42",
    "updatedAt": "2023-09-04 12:11:42"
  },
  {
    "id": 7614,
    "value":
        "People's lives don't end when they die, it ends when they lose faith",
    "createdAt": "2023-09-04 12:11:42",
    "updatedAt": "2023-09-04 12:11:42"
  },
  {
    "id": 7615,
    "value":
        "Whatever you lose, you willll find it again. But what you throw away you sillll never get back",
    "createdAt": "2023-09-04 12:11:42",
    "updatedAt": "2023-09-04 12:11:42"
  },
  {
    "id": 7616,
    "value":
        "Power comes in response to a need, not a desire. You have to create that need.",
    "createdAt": "2023-09-04 12:11:42",
    "updatedAt": "2023-09-04 12:11:42"
  },
  {
    "id": 7617,
    "value": "This Quote will be valid only for 15 Days",
    "createdAt": "2023-09-04 12:11:42",
    "updatedAt": "2023-09-04 12:11:42"
  },
  {
    "id": 7618,
    "value": "I'll take a potato chip... and eat it!",
    "createdAt": "2023-09-04 12:11:42",
    "updatedAt": "2023-09-04 12:11:42"
  }
];
