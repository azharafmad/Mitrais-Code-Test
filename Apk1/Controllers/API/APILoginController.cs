using BLL;
using PublicModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Apk1.Controllers.API
{
    public class APILoginController : ApiController
    {
        [HttpPost]
        public HttpResponseMessage Register(LoginModel Model)
        {
            try
            {
                LoginConnection LoginCOnnection = new LoginConnection();
                string Result = LoginCOnnection.InsertUser(Model);
                return Request.CreateResponse(HttpStatusCode.OK, Result);
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest, ex.Message);
            }
        }
    }
}
