class CommentDto {
    final String id;
    final String content;
    final String authorId;
    final DateTime createdAt;

    CommentDto({
      required this.id,
      required this.content,
      required this.authorId,
      required this.createdAt,
    });
    
    Map<String, dynamic> toJson() {
      return {
        'id': id,
        'content': content,
        'authorId': authorId,
        'createdAt': createdAt.toIso8601String(),
      };
    }
    factory CommentDto.fromJson(Map<String, dynamic> json) {
      return CommentDto(
        id: json['id'],
        content: json['content'],
        authorId: json['authorId'],
        createdAt: DateTime.parse(json['createdAt']),
      );
    }
    /*
    final String id;
  final String content;
  final String authorId;
  final DateTime createdAt;
    */
}