import 'package:social_app/dto/comment_dto.dart';

class PostDto {
  final String id;
  final String userId;
  final String image;
  final String description;
  final CommentDto comment;
  final DateTime timestamp;

  PostDto({
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

  factory PostDto.fromJson(Map<String, dynamic> json) {
    return PostDto(
      id: json['id'],
      userId: json['userId'],
      image: json['image'],
      description: json['description'],
      comment: CommentDto.fromJson(json['comment']),
      timestamp: DateTime.parse(json['timestamp']),
    );
  } 
}

/*
  final String id;
  final String userId;
  final String image;
  final String description;
  final Comment comment;
  final DateTime timestamp;
*/