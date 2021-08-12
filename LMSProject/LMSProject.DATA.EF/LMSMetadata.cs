using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace LMSProject.DATA.EF
{
    [MetadataType(typeof(CourseMetadata))]
    public partial class Course { }

    public class CourseMetadata
    {
        [Required(ErrorMessage = "Course Name is required")]
        [StringLength(200)]
        [Display(Name = "Course Name")]
        public string CourseName { get; set; }

        [StringLength(500, ErrorMessage = "Course Description cannot exceed 500 characters")]
        [Display(Name = "Course Description")]
        public string CourseDescription { get; set; }

        [Required]
        [Display(Name = "Currently Active?")]
        public bool IsActive { get; set; }
    }

    [MetadataType(typeof(CourseCompletionMetadata))]
    public partial class CourseCompletion { }

    public class CourseCompletionMetadata
    {
        [Required(ErrorMessage = "User ID is required")]
        [StringLength(128, ErrorMessage = "User ID cannot exceed 128 characters")]
        [Display(Name = "User ID")]
        public string UserId { get; set; }

        [Required(ErrorMessage = "Course ID is required")]
        [Display(Name = "Course ID")]
        public int CourseId { get; set; }

        [Required]
        public DateTime DateCompleted { get; set; }
    }

    [MetadataType(typeof(LessonMetadata))]
    public partial class Lesson { }

    public class LessonMetadata
    {
        [Required(ErrorMessage = "Lesson Title is required")]
        [Display(Name = "Lesson Title")]
        [StringLength(200, ErrorMessage = "Lesson Title cannot exceed 200 characters")]
        public string LessonTitle { get; set; }

        [Required(ErrorMessage = "Course is required")]
        [Display(Name = "Course")]
        public int CourseId { get; set; }

        [StringLength(300, ErrorMessage = "Introduction cannot exceed 300 characters")]
        [DisplayFormat(NullDisplayText = "N/A")]
        public string Introduction { get; set; }

        [StringLength(250, ErrorMessage = "Video URL cannot exceed 250 characters")]
        [Display(Name = "Video URL")]
        [DisplayFormat(NullDisplayText = "N/A")]
        public string VideoURL { get; set; }

        [StringLength(100, ErrorMessage = "PDF Filename cannot exceed 100 characters")]
        [Display(Name = "PDF Filename")]
        [DisplayFormat(NullDisplayText = "N/A")]
        public string PdfFilename { get; set; }

        [Required]
        [Display(Name = "Currently Active?")]
        public bool IsActive { get; set; }
    }

    [MetadataType(typeof(LessonViewMetadata))]
    public partial class LessonView { }

    public class LessonViewMetadata
    {
        [Required(ErrorMessage = "Lesson Viewed is required")]
        [Display(Name = "Lesson Viewed")]
        public int LessonViewed { get; set; }

        [Required(ErrorMessage = "User ID is required")]
        [Display(Name = "User ID")]
        [StringLength(128)]
        public string UserId { get; set; }

        [Required(ErrorMessage = "Lesson ID is required")]
        [Display(Name = "Lesson ID")]
        public int LessonId { get; set; }

        [Required]
        public DateTime DateViewed { get; set; }
    }

    [MetadataType(typeof(UserDetailMetadata))]

    public class UserDetailMetadata
    {
        [Required(ErrorMessage = "User ID is required")]
        [Display(Name = "User ID")]
        [StringLength(128, ErrorMessage = "User ID cannot exceed 128 characters")]
        public string UserId { get; set; }

        [Required(ErrorMessage = "First Name is required")]
        [StringLength(50)]
        [Display(Name = "First Name")]
        public string FirstName { get; set; }

        [Required(ErrorMessage = "Last Name is required")]
        [StringLength(50)]
        [Display(Name = "Last Name")]
        public string LastName { get; set; }
    }

    public partial class UserDetail
    {
        [Display(Name = "Name")]
        public string FullName => FirstName + "" + LastName;
    }
    
}
