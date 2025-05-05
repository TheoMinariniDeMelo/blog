using Microsoft.AspNetCore.Mvc;

namespace Blog.Controllers;
[Route("/")]
public class SecurityController : Controller
{
    [Route("/login")]
    public IActionResult Login(string returnUrl = "")
    {
        return View();
    }
    [Route("/register")] 
    public IActionResult Register()
    {
        return View();
    }
}