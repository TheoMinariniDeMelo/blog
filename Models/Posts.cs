namespace Blog.Models;

public class Posts
{
    Guid PostId { get; set; }
    Guid UserId { get; set; }
    string Title { get; set; }
    string Content { get; set; }
    string[] Tags { get; set; }
    bool IsActive { get; set; }
    DateTime CreatedAt { get; set; }
    DateTime UpdatedAt { get; set; }
    DateTime? DeletedAt { get; set; }
    public Posts(
        Guid postId,
        Guid userId,
        string title,
        string content,
        string[] tags,
        bool isActive,
        DateTime createdAt,
        DateTime updatedAt,
        DateTime? deletedAt
        )
    {
        PostId = postId;
        UserId = userId;
        Title = title;
        Content = content;
        Tags = tags;
        IsActive = isActive;
        CreatedAt = createdAt;
        UpdatedAt = updatedAt;
        DeletedAt = deletedAt;
    }
}