using LMSProject.DATA.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LMSProject.UI.MVC.Models
{
    public class CourseViewModel
    {
        public List<Course> Courses { get; set; }
        public List<Lesson> Lessons { get; set; }
    }
}