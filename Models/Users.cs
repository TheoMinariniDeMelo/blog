namespace Blog.Models;
public class Users 
{
    Guid UserId { get; set; }
    string Name { get; set; }
    string Email { get; set; }
    byte[] PasswordHash { get; set; }
    byte[] Salt { get; set; }
    string Algorithm { get; set; }
    string[] Role { get; set; }
    bool IsActive { get; set; }
    DateTime CreatedAt { get; set; }
    DateTime UpdatedAt { get; set; }
    DateTime? DeletedAt { get; set; }
    public Users()
    {
    }

    public Users(
        Guid userId,
        string name,
        string email,
        byte[] passwordHash,
        byte[] salt,
        string algorithm,
        string[] role,
        bool isActive,
        DateTime createdAt,
        DateTime updatedAt,
        DateTime? deletedAt
    )
    {
        UserId = userId;
        Name = name;
        Email = email;
        PasswordHash = passwordHash;
        Salt = salt;
        Algorithm = algorithm;
        Role = role;
        IsActive = isActive;
        CreatedAt = createdAt;
        UpdatedAt = updatedAt;
        DeletedAt = deletedAt;
    }
}