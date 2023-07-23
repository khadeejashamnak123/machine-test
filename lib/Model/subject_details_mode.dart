class SubjectDetailsModel {
 late final int? id;
  late final String? name;
 late final List<Attandence>? attandence;
 late final List<AssignmentStatus>? assignmentStatus;

  SubjectDetailsModel(
      {this.id, this.name, this.attandence, this.assignmentStatus});

  SubjectDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['attandence'] != null) {
      attandence = <Attandence>[];
      json['attandence'].forEach((v) {
        attandence?.add(new Attandence.fromJson(v));
      });
    }
    if (json['assignmentStatus'] != null) {
      assignmentStatus = <AssignmentStatus>[];
      json['assignmentStatus'].forEach((v) {
        assignmentStatus?.add(new AssignmentStatus.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    final attandence = this.attandence;
    if (attandence != null) {
      data['attandence'] = attandence.map((v) => v.toJson()).toList();
    }
    final assignmentStatus = this.assignmentStatus;
    if (assignmentStatus != null) {
      data['assignmentStatus'] =
          assignmentStatus.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Attandence {
late final  String? semester;
late final  int? mark;

  Attandence({this.semester, this.mark});

  Attandence.fromJson(Map<String, dynamic> json) {
    semester = json['semester'];
    mark = json['mark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['semester'] = this.semester;
    data['mark'] = this.mark;
    return data;
  }
}

class AssignmentStatus {
 late final String? status;
late final  int? value;

  AssignmentStatus({this.status, this.value});

  AssignmentStatus.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['value'] = this.value;
    return data;
  }
}

