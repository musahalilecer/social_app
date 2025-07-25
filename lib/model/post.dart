import 'package:social_app/model/Comment.dart';

class Post {
  final String id;
  final String userId;
  final String image;
  final String description;
  final Comment comment;
  final DateTime timestamp;

  Post({
    required this.id,
    required this.userId,
    required this.image,
    required this.description,
    required this.comment,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'image': image,
      'description': description,
      'comment': comment.toJson(),
      'timestamp': timestamp.toIso8601String(),
    };
  }
  
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      userId: json['userId'],
      image: json['image'],
      description: json['description'],
      comment: Comment.fromJson(json['comment']),
      timestamp: DateTime.parse(json['timestamp']),
    );
  }
}