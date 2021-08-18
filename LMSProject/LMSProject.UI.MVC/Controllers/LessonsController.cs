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
    public class LessonsController : Controller
    {
        private LMSEntities1 db = new LMSEntities1();

        // GET: Lessons
        public ActionResult Index()
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
            return View(lessons.ToList());
        }

        // GET: Lessons/Details/5
        [Authorize(Roles = "Admin, Manager, Employee")]
        public ActionResult Details(int id)
        {
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

            #region Record Course Completion
            Lesson lesson = db.Lessons.Find(id);
            int courseLessonCount = db.Lessons.Where(x => x.CourseId == lesson.CourseId && x.IsActive == true).Count();
            int completedLessonCount = db.LessonViews.Where(x => x.Lesson.CourseId == lesson.CourseId && x.UserId == userid && x.Lesson.IsActive == true).Count();

            if (User.IsInRole("Employee") && courseLessonCount == completedLessonCount)
            {
                CourseCompletion comp = new CourseCompletion();
                comp.UserId = userid;
                comp.CourseId = lesson.CourseId;
                comp.DateCompleted = DateTime.Now.Date;

                //Prevent duplicate completions
                var firstCompletion = db.CourseCompletions.Where(x => x.UserId == userid && x.CourseId == lesson.CourseId).FirstOrDefault();
                if (firstCompletion == null)
                {
                    db.CourseCompletions.Add(comp);
                    db.SaveChanges();

                    string completer = db.UserDetails.Where(x => x.UserId == userid).FirstOrDefault().FullName;
                    string completedCourse = db.Courses.Where(x => x.CourseId == lesson.CourseId).FirstOrDefault().CourseName;
                    var completeDate = comp.DateCompleted;

                    string msg = $"{completer} completed the {completedCourse} course, on {completeDate:d}.";

                    MailMessage m = new MailMessage("dwschejbal@outlook.com", "fall3ndown369@yahoo.com", "Course Completion", msg);

                    m.Priority = MailPriority.High;
                    SmtpClient client = new SmtpClient("mail.schejbalcodes.com");
                    client.Credentials = new NetworkCredential("dwschejbal@outlook.com", "P@ssw0rd");
                }
            }
            #endregion


            if (lesson == null)
            {
                return HttpNotFound();
            }
            return View(lesson);
        }

        // GET: Lessons/Create
        [Authorize(Roles ="Admin")]
        public ActionResult Create()
        {
            ViewBag.CourseId = new SelectList(db.Courses, "CourseId", "CourseName");
            return View();
        }

        // POST: Lessons/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "LessonId,LessonTitle,CourseId,Introduction,VideoURL,PdfFilename,IsActive")] Lesson lesson, HttpPostedFileBase pdf)
        {
            if (ModelState.IsValid)
            {
                #region File Upload
                string pdfName = "noPDF.pdf";
                if (pdf != null)
                {
                    pdfName = pdf.FileName;

                    string ext = pdfName.Substring(pdfName.LastIndexOf("."));

                    string goodExt = ".pdf";

                    if (goodExt.Contains(ext.ToLower()))
                    {
                        pdfName = Guid.NewGuid() + ext;

                        pdf.SaveAs(Server.MapPath("~/Content/images/pdf/" + pdfName));
                    }
                    else
                    {
                        pdfName = "noPDF.pdf";
                    }
                }

                lesson.PdfFilename = pdfName;
                #endregion
                if (lesson.VideoURL.Contains("/watch"))
            {
                lesson.VideoURL = lesson.VideoURL.Replace("/watch?v=", "/embed/");
            }
                db.Lessons.Add(lesson);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            
           
            ViewBag.CourseId = new SelectList(db.Courses, "CourseId", "CourseName", lesson.CourseId);
            return View(lesson);
        }

        // GET: Lessons/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Lesson lesson = db.Lessons.Find(id);
            if (lesson == null)
            {
                return HttpNotFound();
            }
            ViewBag.CourseId = new SelectList(db.Courses, "CourseId", "CourseName", lesson.CourseId);
            return View(lesson);
        }

        // POST: Lessons/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult Edit([Bind(Include = "LessonId,LessonTitle,CourseId,Introduction,VideoURL,PdfFilename,IsActive")] Lesson lesson, HttpPostedFileBase pdf)
        {
            if (ModelState.IsValid)
            {
                #region File Upload
                string pdfName = "noPDF.pdf";
                if (pdf != null)
                {
                    pdfName = pdf.FileName;

                    string ext = pdfName.Substring(pdfName.LastIndexOf("."));

                    string goodExt = ".pdf";

                    if (goodExt.Contains(ext.ToLower()) && pdf.ContentLength <= 4194304)
                    {
                        pdfName = Guid.NewGuid() + ext;

                        pdf.SaveAs(Server.MapPath("~/Content/images/pdf/" + pdfName));
                    }
                    else
                    {
                        pdfName = "noPDF.pdf";
                    }
                }

                lesson.PdfFilename = pdfName;
                #endregion

                if (lesson.VideoURL.Contains("/watch"))
            {
                lesson.VideoURL = lesson.VideoURL.Replace("/watch?v=", "/embed/");
            }
                db.Entry(lesson).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            
            
            ViewBag.CourseId = new SelectList(db.Courses, "CourseId", "CourseName", lesson.CourseId);
            return View(lesson);
        }

        // GET: Lessons/Delete/5
        [Authorize(Roles = "Admin")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Lesson lesson = db.Lessons.Find(id);
            if (lesson == null)
            {
                return HttpNotFound();
            }
            return View(lesson);
        }

        // POST: Lessons/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult DeleteConfirmed(int id)
        {
            Lesson lesson = db.Lessons.Find(id);

            if (lesson.PdfFilename != null && lesson.PdfFilename != "noPDF.pdf")
            {
                System.IO.File.Delete(Server.MapPath("~/Content/images/pdf/" + Session["currentPDF"].ToString()));
            }
            db.Lessons.Remove(lesson);
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
