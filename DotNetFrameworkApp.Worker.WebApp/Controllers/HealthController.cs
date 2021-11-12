using System.Web.Http;

namespace DotNetFrameworkApp.API.Controllers
{
    public class HealthController : ApiController
    {
        public IHttpActionResult Get()
        {
            return Ok();
        }
    }
}