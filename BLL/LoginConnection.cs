using DAL;
using PublicModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class LoginConnection
    {
        DbTransaction dbTrans = DbTrans.defaultTransaction();
        
        public string InsertUser(LoginModel Model)
        {
            try
            {
                return dbTrans.DbToString("USP_Insert_User", new
                {
                    MobileNumber = Model.txtMobileNumber,
                    FirstName = Model.txtFirstName,
                    LastName = Model.txtLastName,
                    DateofBirth = Model.txtDate,
                    Gender = Model.rbGender,
                    Email = Model.txtEmail,
                }, true);
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }
        //public string DeleteUser(LoginModel Model)
        //{
        //    try
        //    {
        //        dbTrans.DbExecute("USP_Delete_User", new
        //        {
        //            ID = Model.ID,
        //        }, true);
        //        return "Sukses";
        //    }
        //    catch (Exception ex)
        //    {
        //        return ex.Message;
        //    }
        //}
    }
}
