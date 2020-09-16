import 'package:flutter/foundation.dart';
import 'package:wiredash/src/feedback/data/feedback_item.dart';

/// Represents a [FeedbackItem] that has not yet been submitted, and that has
/// been saved in the persistent storage.
class PendingFeedbackItem {
  const PendingFeedbackItem({
    @required this.id,
    @required this.feedbackItem,
    @required this.screenshotPath,
  })  : assert(id != null),
        assert(feedbackItem != null);

  final String id;
  final FeedbackItem feedbackItem;
  final String screenshotPath;

  PendingFeedbackItem.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        feedbackItem =
            FeedbackItem.fromJson((json['feedbackItem'] as Map).cast()),
        screenshotPath = json['screenshotPath'] as String;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'feedbackItem': feedbackItem.toJson(),
      'screenshotPath': screenshotPath,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PendingFeedbackItem &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          feedbackItem == other.feedbackItem &&
          screenshotPath == other.screenshotPath;

  @override
  int get hashCode =>
      id.hashCode ^ feedbackItem.hashCode ^ screenshotPath.hashCode;
}
