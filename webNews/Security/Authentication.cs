﻿using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using webNews.Domain;
using webNews.Domain.Entities;
using System.Web.Caching;
using static System.String;
using System.Threading;

namespace webNews.Security
{
    public class Authentication
    {
        public static void ClearAllSession()
        {
        }

        public static HomePageInfo GetHomePageInfo()
        {
            var cache = new Cache();
            HomePageInfo defaultInfo = null;

            if (cache.Get("###HOME_PAGE_INFO###") == null) return defaultInfo;

            return cache.Get("###HOME_PAGE_INFO###") as HomePageInfo;
        }

        public static void MarkHomePageInfo(HomePageInfo homePageInfo)
        {
            var cache = new Cache();
            cache.Insert("###HOME_PAGE_INFO###", homePageInfo);
        }


        public static List<Medium> GetPartners()
        {
            var cache = new Cache();
            List<Medium> defaultInfo = null;

            if (cache.Get("###PARTNERS_INFO###") == null) return defaultInfo;

            return cache.Get("###PARTNERS_INFO###") as List<Medium>;
        }

        public static void MarkPartners(List<Medium> partnersInfo)
        {
            var cache = new Cache();
            cache.Insert("###PARTNERS_INFO###", partnersInfo);
        }


        public static List<Medium> GetBanners()
        {
            var cache = new Cache();
            List<Medium> defaultInfo = null;

            if (cache.Get("###BANNERS_INFO###") == null) return defaultInfo;

            return cache.Get("###BANNERS_INFO###") as List<Medium>;
        }

        public static void MarkBanners(List<Medium> banners)
        {
            var cache = new Cache();
            cache.Insert("###BANNERS_INFO###", banners);
        }
        public static List<Medium> GetBranches()
        {
            var cache = new Cache();
            List<Medium> defaultInfo = null;

            if (cache.Get("###BRANCHES_INFO###") == null) return defaultInfo;

            return cache.Get("###BRANCHES_INFO###") as List<Medium>;
        }

        public static void MarkBranches(List<Medium> banners)
        {
            var cache = new Cache();
            cache.Insert("###BRANCHES_INFO###", banners);
        }
        public static List<Medium> GetLogo()
        {
            var cache = new Cache();
            List<Medium> defaultInfo = null;

            if (cache.Get("###LOGO_INFO###") == null) return defaultInfo;

            return cache.Get("###LOGO_INFO###") as List<Medium>;
        }

        public static void MarkLogo(List<Medium> logo)
        {
            var cache = new Cache();
            cache.Insert("###LOGO_INFO###", logo);
        }

        public static string BuildMenuFE(System_Menu item, List<System_Menu> menus, string lang = "vi")
        {
            var menu = "";
            var listChild = menus.Where(p => p.ParentId == item.Id).OrderBy(p => p.MenuOrder);

            if (listChild.Any())
            {
                menu += "<li> " +
                    $"<a href=\"/{item.Text}\">{item.Text.ToUpper()}</a>";
                if (item.MenuLevel != null)
                    menu += "<ul>";
                menu = listChild.Aggregate(menu, (current, submenu) => current + BuildMenuFE(submenu, menus, lang));
                menu += "</ul></li>";
            }
            else
            {
                if (item.Area == "FE" || item.Area == "")
                {
                    menu += $"<li><a title=\"{item.Text}\" href=\"/{item.Text}\">{item.Text.ToUpper()}</a></li>";
                }
                else
                {
                    menu += $"<li><a title=\"{item.Text}\" href=\"/{item.Text}\">{item.Text.ToUpper()}</a></li>";
                }
            }
            

            return menu;
        }

        public static void MarkMenuFE(List<System_Menu> menus)
        {
            var cache = new Cache();
            var menuEN = menus.Where(p => (p.ParentId ?? 0) == 0).OrderBy(p => p.MenuOrder).ToList().Aggregate("", (current, item) => current + BuildMenuFE(item, menus, "en"));
            var menuVI = menus.Where(p => (p.ParentId ?? 0) == 0).OrderBy(p => p.MenuOrder).ToList().Aggregate("", (current, item) => current + BuildMenuFE(item, menus, "vi"));
            cache.Insert("###MENU_FE_EN###", menuEN);
            cache.Insert("###MENU_FE_VI###", menuVI);
        }

        public static string GetMenuFE()
        {
            var cache = new Cache();
            if(GetLanguageCode() == "en" && cache.Get("###MENU_FE_EN###") != null)
            {
                return cache.Get("###MENU_FE_EN###").ToString();
            }
            else if(GetLanguageCode() == "vi" && cache.Get("###MENU_FE_VI###") != null)
            {

                return cache.Get("###MENU_FE_VI###").ToString();
            }
            return "";
        }

        public static bool Authenticate(string username, string password)
        {
            HttpContext.Current.Session.Timeout = 600;
            if (username == null || password == null) return false;

            if (username.Equals("superadmin") && password.Equals("password"))
            {
                HttpContext.Current.Session["username"] = username;
                return true;
            }
            return false;
        }
        public static bool Logout()
        {
            if (GetUserName() == null) return true;
            if (HttpContext.Current == null || HttpContext.Current.Session == null) return true;
            HttpContext.Current.Session.Abandon();
            HttpContext.Current.Response.Cookies.Add(new HttpCookie("ASP.NET_SessionId", ""));
            SessionIDManager manager = new SessionIDManager();
            manager.RemoveSessionID(HttpContext.Current);
            var newId = manager.CreateSessionID(HttpContext.Current);
            bool isRedirected;
            bool isAdded;
            manager.SaveSessionID(HttpContext.Current, newId, out isRedirected, out isAdded);
            return true;
        }

        public static string GetMenu()
        {
            if (HttpContext.Current == null || HttpContext.Current.Session == null) return string.Empty;
            if (HttpContext.Current.Session["###Menu###"] == null) return string.Empty;
            return HttpContext.Current.Session["###Menu###"].ToString();

        }
        public static void MarkLanguage(string language)
        {
            if (HttpContext.Current == null || HttpContext.Current.Session == null) return;
            HttpContext.Current.Session["languagecode"] = language;
        }
        public static void MarkAuthenticate(System_User user, Vw_UserInfo userInfo)
        {
            HttpContext.Current.Session["username"] = user.UserName;
            HttpContext.Current.Session["userid"] = user.Id;
            HttpContext.Current.Session["===user==="] = user;
            HttpContext.Current.Session["===userInfo==="] = userInfo;
        }
        public static void MarkPermission(List<Security_VwRoleService> permission)
        {
            if (HttpContext.Current == null || HttpContext.Current.Session == null) return;
            HttpContext.Current.Session["permission"] = permission;
        }
        public static void MarkRole(List<Security_UserRole> listRole)
        {
            if (HttpContext.Current == null || HttpContext.Current.Session == null) return;
            HttpContext.Current.Session["roleUser"] = listRole;
        }
        public static void MarkMennu(List<System_Menu> menus)
        {
            var menu = menus.Where(p => (p.ParentId ?? 0) == 0).OrderBy(p => p.MenuOrder).ToList().Aggregate("", (current, item) => current + BuildMenu(item, menus));
            HttpContext.Current.Session["###Menu###"] = menu;

        }
        public static List<Security_VwRoleService> GetPermission()
        {
            if (HttpContext.Current == null || HttpContext.Current.Session == null) return new List<Security_VwRoleService>();
            if (HttpContext.Current.Session["permission"] == null) return new List<Security_VwRoleService>();
            return (List<Security_VwRoleService>)HttpContext.Current.Session["permission"];
        }
        public static void MarkCaptchar(string captchar)
        {
            if (HttpContext.Current == null || HttpContext.Current.Session == null) return;
            HttpContext.Current.Session["Captcha"] = captchar;
        }
        public static int GetUserId()
        {
            if (HttpContext.Current == null || HttpContext.Current.Session == null) return -1;
            if (HttpContext.Current.Session["userid"] == null) return -1;
            return (int)HttpContext.Current.Session["userid"];

        }
        public static System_User GetUser()
        {
            if (HttpContext.Current == null || HttpContext.Current.Session == null) return null;
            if (HttpContext.Current.Session["===user==="] == null) return null;
            return (System_User)HttpContext.Current.Session["===user==="];
        }
        public static Vw_UserInfo GetUserInfo()
        {
            if (HttpContext.Current == null || HttpContext.Current.Session == null) return null;
            if (HttpContext.Current.Session["===userInfo==="] == null) return null;
            return (Vw_UserInfo)HttpContext.Current.Session["===userInfo==="];
        }

        static bool CheckPermissionMenu(System_Menu item, List<System_Menu> listMenus)
        {


            var check = CheckAuthorizer.Authorize(Permission.VIEW, item.Controller ?? "");
            if (check)
                return true;
            var listchild = listMenus.Where(p => p.ParentId == item.Id);

            var systemMenus = listchild as System_Menu[] ?? listchild.ToArray();
            if (systemMenus.Any())
            {
                foreach (var subMenu in systemMenus)
                {
                    check = CheckPermissionMenu(subMenu, listMenus);
                    if (check)
                        return true;
                }
            }
            return false;
        }

        static string BuildMenu(System_Menu item, List<System_Menu> listMenus)
        {


            var menu = "";
            if (CheckPermissionMenu(item, listMenus))
            {
                var listChild = listMenus.Where(p => p.ParentId == item.Id).OrderBy(p => p.MenuOrder);

                if (listChild.Any())
                {
                    menu += "<li> <a href=\"index.html\" class=\"waves-effect\"><i class=\"mdi mdi-av-timer fa-fw\" data-icon=\"v\"></i> <span class=\"hide-menu\">" + 
                        item.Text.ToUpper() +
                        "<span class=\"fa arrow\"></span> </span></a>";
                    if (item.MenuLevel != null)
                        menu += "<ul class='nav nav-" + ((MenuLevel)item.MenuLevel).ToString("G") + "-level'>";
                    menu = listChild.Aggregate(menu, (current, submenu) => current + BuildMenu(submenu, listMenus));
                    menu += "</ul></li>";
                }
                else
                {
                    if(item.Area == "") { 
                        menu += Format("<li><a href='/" + (!string.IsNullOrEmpty(item.AliasUrl) ? item.AliasUrl : item.Controller) + "'>" + "&nbsp;<i class=\"ti-info-alt fa-fw\"></i>&nbsp;<span class=\"hide-menu\">" + item.Text + "</span></a></li>");
                    }
                    else
                    {
                        menu += Format("<li><a href='/" + item.Area + "/" + (!string.IsNullOrEmpty(item.AliasUrl)?item.AliasUrl : item.Controller) + "'>" + "&nbsp;<i class=\"ti-info-alt fa-fw\"></i>&nbsp;<span class=\"hide-menu\">&nbsp;" + item.Text + "</span></a></li>");
                    }
                }
            }
            return menu;
        }
        static string BuildMenu1(System_Menu item, List<System_Menu> listMenus)
        {


            var menu = "";
            if (CheckPermissionMenu(item, listMenus))
            {
                var listChild = listMenus.Where(p => p.ParentId == item.Id).OrderBy(p => p.MenuOrder);

                if (listChild.Any())
                {
                    menu += "<li><a><i class='fa fa-plus - square' aria-hidden='true'></i> " + item.Text.ToUpper() + "<span class='fa arrow'></span></a>";
                    if (item.MenuLevel != null)
                        menu += "<ul class='nav nav-" + ((MenuLevel)item.MenuLevel).ToString("G") + "-level menu-level'>";
                    menu = listChild.Aggregate(menu, (current, submenu) => current + BuildMenu(submenu, listMenus));
                    menu += "</ul></li>";
                }
                else
                {
                    if (item.Area == "")
                    {
                        menu += Format("<li><a href='/" + (!string.IsNullOrEmpty(item.AliasUrl) ? item.AliasUrl : item.Controller) + "'>" + "&nbsp;<i class='fa fa-hand-o-right' aria-hidden='true'></i>&nbsp;" + item.Text + "</a></li>");
                    }
                    else
                    {
                        menu += Format("<li><a href='/" + item.Area + "/" + (!string.IsNullOrEmpty(item.AliasUrl) ? item.AliasUrl : item.Controller) + "'>" + "&nbsp;<i class='fa fa-hand-o-right' aria-hidden='true'></i>&nbsp;" + item.Text + "</a></li>");
                    }
                }
            }
            return menu;
        }
        public static string GetLanguageCode()
        {
            if (HttpContext.Current == null || HttpContext.Current.Session == null) return "vi";
            if (HttpContext.Current.Session["languagecode"] == null) return "vi";
            return (string)HttpContext.Current.Session["languagecode"];

        }
        public static string GetUserName()
        {
            if (HttpContext.Current == null || HttpContext.Current.Session == null) return null;
            if (HttpContext.Current.Session["username"] == null) return null;
            return HttpContext.Current.Session["username"].ToString();

        }

        public static bool IsUserBackEnd()
        {
            if (GetUserName() == null) return false;
            return true;
        }
    }
    public enum MenuLevel
    {
        Second = 1,
        Third = 2,
    }
}
