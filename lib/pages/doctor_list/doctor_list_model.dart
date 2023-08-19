class doc {
  Address? address;
  String? sId;
  String? name;
  String? email;
  String? mobile;
  String? about;
  int? age;
  int? yearofExperience;
  ConsultationTime? consultationTime;
  String? imgUrl;
  String? gender;
  List<String>? qualifications;
  String? specialization;
  int? iV;

  doc(
      {this.address,
        this.sId,
        this.name,
        this.email,
        this.mobile,
        this.about,
        this.age,
        this.yearofExperience,
        this.consultationTime,
        this.imgUrl,
        this.gender,
        this.qualifications,
        this.specialization,
        this.iV});

  doc.fromJson(Map<String, dynamic> json) {
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    about = json['about'];
    age = json['age'];
    yearofExperience = json['yearofExperience'];
    consultationTime = json['consultationTime'] != null
        ? new ConsultationTime.fromJson(json['consultationTime'])
        : null;
    imgUrl = json['imgUrl'];
    gender = json['gender'];
    qualifications = json['qualifications'].cast<String>();
    specialization = json['specialization'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['about'] = this.about;
    data['age'] = this.age;
    data['yearofExperience'] = this.yearofExperience;
    if (this.consultationTime != null) {
      data['consultationTime'] = this.consultationTime!.toJson();
    }
    data['imgUrl'] = this.imgUrl;
    data['gender'] = this.gender;
    data['qualifications'] = this.qualifications;
    data['specialization'] = this.specialization;
    data['__v'] = this.iV;
    return data;
  }
}

class Address {
  String? building;
  String? location;
  String? country;

  Address({this.building, this.location, this.country});

  Address.fromJson(Map<String, dynamic> json) {
    building = json['building'];
    location = json['location'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['building'] = this.building;
    data['location'] = this.location;
    data['country'] = this.country;
    return data;
  }
}

class ConsultationTime {
  int? start;
  int? end;

  ConsultationTime({this.start, this.end});

  ConsultationTime.fromJson(Map<String, dynamic> json) {
    start = json['start'];
    end = json['end'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['start'] = this.start;
    data['end'] = this.end;
    return data;
  }
}