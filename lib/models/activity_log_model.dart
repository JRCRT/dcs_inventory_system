import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import 'model.dart';

class ActivityLog extends Equatable {
  final String? activityLogId;
  final DateTime dateCreated;
  final UserModel user;
  final String activity;

  const ActivityLog(
      {this.activityLogId,
      required this.dateCreated,
      required this.user,
      required this.activity});

  ActivityLog copyWith(String? activityLogId, DateTime? dateCreated,
      UserModel? user, String? activity) {
    return ActivityLog(
        dateCreated: dateCreated ?? this.dateCreated,
        user: user ?? this.user,
        activity: activity ?? this.activity);
  }

  factory ActivityLog.fromSnapshot(DocumentSnapshot snap) {
    return ActivityLog(
        activityLogId: snap.id,
        dateCreated: DateTime.parse(
            ((snap['dateCreated']) as Timestamp).toDate().toString()),
        user: UserModel.fromActiviyLogSnapshot(snap['user']),
        activity: snap['activity']);
  }

  Map<String, dynamic> toDocument() {
    return {
      'dateCreated': dateCreated,
      'user': user.toActiviyLogDocument(),
      'activity': activity
    };
  }

  @override
  List<Object?> get props => [activityLogId, activity, user, dateCreated];
}
