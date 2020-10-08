using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NhaSachTrucTuyen
{
    public partial class CapNhatSach : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            FileUpload upload = DetailsView1.FindControl("FileUpload2") as FileUpload;
            if (upload.HasFile)
            {
                upload.SaveAs(MapPath("~/Images/Books/") + upload.FileName);
                e.Values["Hinh"] = upload.FileName;
            }
        }

        protected void DetailsView1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
        {
            FileUpload upload = DetailsView1.FindControl("FileUpload1") as FileUpload;
            if (upload.HasFiles)
            {
                upload.SaveAs(MapPath("~/Images/Books/") + upload.FileName);
                e.NewValues["Hinh"] = upload.FileName;

            }
            else
            {
                e.NewValues["Hinh"] = e.OldValues["Hinh"];
            }
        }
    }
}