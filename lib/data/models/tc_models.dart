
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
    "value": "1 Year Service Warranty & 5 Years Plywood Warranty",
    "createdAt": "2023-09-04 12:11:42",
    "updatedAt": "2023-09-04 12:11:42"
  },
  {
    "id": 7611,
    "value": "Customer Should inform about the Changes (if any Design & colour) before\nproduction or else Customer should pay Extra",
    "createdAt": "2023-09-04 12:11:42",
    "updatedAt": "2023-09-04 12:11:42"
  },
  {
    "id": 7612,
    "value": "Material will be delivered 3-4 weeks the date of Confirmation of Order",
    "createdAt": "2023-09-04 12:11:42",
    "updatedAt": "2023-09-04 12:11:42"
  },
  {
    "id": 7613,
    "value": "Quotation cant be changed / revised once accepted by the customer",
    "createdAt": "2023-09-04 12:11:42",
    "updatedAt": "2023-09-04 12:11:42"
  },
  {
    "id": 7614,
    "value": "If any extra works are needed then it should be paid by customer",
    "createdAt": "2023-09-04 12:11:42",
    "updatedAt": "2023-09-04 12:11:42"
  },
  {
    "id": 7615,
    "value": "Custom Handles will be charged extra.Handle price may vary based of designs &\nspecifications",
    "createdAt": "2023-09-04 12:11:42",
    "updatedAt": "2023-09-04 12:11:42"
  },
  {
    "id": 7616,
    "value": "Once the Project is confirmed, the amount cannot be refunded",
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
    "value": "Any additional work which is out of the quotation in any aspects is to be paid extra by\nthe customer",
    "createdAt": "2023-09-04 12:11:42",
    "updatedAt": "2023-09-04 12:11:42"
  }
];
