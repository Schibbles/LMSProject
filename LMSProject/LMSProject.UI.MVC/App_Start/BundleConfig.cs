using System.Web.Optimization;

namespace LMSProject.UI.MVC
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js",
                      "~/Scripts/respond.js",
                      "~/Scripts/js/jquery-1.11.1.min.js",
                      "~/Scripts/js/templatemo_custom.js",
                      "~/Scripts/js/bootstrap-collapse.js",
                      "~/Scripts/js/jquery-ui.min.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/css/font-awesome.min.css",
                      "~/Content/css/bootstrap.min.css",
                      "~/Content/css/jquery-ui.css",
                      "~/Content/css/templatemo_misc.css",
                      "~/Content/css/templatemo_style.css"));
        }
    }
}
