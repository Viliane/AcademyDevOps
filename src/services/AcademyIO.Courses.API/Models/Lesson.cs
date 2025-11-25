using AcademyIO.Core.DomainObjects;

namespace AcademyIO.Courses.API.Models
{
    public class Lesson(string name, string subject, decimal totalHours, Guid courseId) : Entity, IAggregateRoot
    {
        public string Name { get; set; } = name;
        public string Subject { get; set; } = subject;
        public decimal TotalHours { get; set; } = totalHours;
        public Guid CourseId { get; set; } = courseId;
    }
}
