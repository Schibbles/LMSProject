using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;
using LMSProject.DATA.EF;
using Microsoft.AspNet.Identity;

namespace LMSProject.UI.MVC.Controllers
{
    public class CoursesController : Controller
    {
        private LMSEntities1 db = new LMSEntities1();

        // GET: Courses
        public ActionResult Index(int? id)
        {
            string currentUserId = User.Identity.GetUserId();
            var cc = db.CourseCompletions.Where(x => x.UserId == currentUserId);
            var courses = db.Courses;
            foreach (var c in cc)
            {
                foreach (var course in courses)
                {
                    if (course.CourseId == c.CourseId)
                    {
                        course.hasCompleted = true;
                    }
                }
            }
            return View(courses.ToList());
        }

        // GET: Courses/Details/5
        public ActionResult Details(int id)
        {
            string currentUserId = User.Identity.GetUserId();
            var cl = db.LessonViews.Where(x => x.UserId == currentUserId);
            var lessons = db.Lessons.Include(l => l.Cours);
            foreach (var c in cl)
            {
                foreach (var lesson in lessons)
                {
                    lesson.hasCompleted = true;
                }
            }
            #region Records Lessons Completed
            string userid = User.Identity.GetUserId();
            LessonView lessonView = new LessonView();
            lessonView.UserId = userid;
            lessonView.LessonId = id;
            lessonView.DateViewed = DateTime.Now;

            //Record only first time viewed

            var firstView = db.LessonViews.Where(x => x.LessonId == id && x.UserId == userid).FirstOrDefault();
            if (User.IsInRole("Employee") && firstView == null)
            {
                db.LessonViews.Add(lessonView);
                db.SaveChanges();
            }
            #endregion

            Course course = db.Courses.Find(id);
            if (course == null)
            {
                return HttpNotFound();
            }
            
            var clessons = db.Lessons.Where(x => x.CourseId == course.CourseId);
            return View(clessons.ToList());
            
        }

        // GET: Courses/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Courses/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "CourseId,CourseName,CourseDescription,IsActive")] Course course)
        {
            if (ModelState.IsValid)
            {
                db.Courses.Add(course);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(course);
        }

        // GET: Courses/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Course course = db.Courses.Find(id);
            if (course == null)
            {
                return HttpNotFound();
            }
            return View(course);
        }

        // POST: Courses/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "CourseId,CourseName,CourseDescription,IsActive")] Course course)
        {
            if (ModelState.IsValid)
            {
                db.Entry(course).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(course);
        }

        // GET: Courses/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Course course = db.Courses.Find(id);
            if (course == null)
            {
                return HttpNotFound();
            }
            return View(course);
        }

        // POST: Courses/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Course course = db.Courses.Find(id);
            db.Courses.Remove(course);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
