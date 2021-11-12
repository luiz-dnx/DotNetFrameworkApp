using System.ServiceProcess;
using System.Web.Http;
using System.Web.Http.Results;

namespace DotNetFrameworkApp.API.Controllers
{
    public class StatusController : ApiController
    {
        [HttpGet]
        public JsonResult<StatusResponse> Get()
        {
            var sc = new ServiceController("WorkerSVC");
            var response = new StatusResponse { Service = sc.DisplayName, Status = sc.Status.ToString() };
            return Json(response);
        }
    }

    public class StatusResponse
    {
        public string Service { get; set; }

        public string Status { get; set; }
    }
}
