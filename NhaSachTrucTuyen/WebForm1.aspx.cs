using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NhaSachTrucTuyen
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void FileUpload1_DataBinding(object sender, EventArgs e)
        {
            FileUpload1.SaveAs("C:/Users/hieuv/Pictures/Screenshots/kkk/");
            Image1.ImageUrl = FileUpload1.PostedFile.ToString();
        }

        protected void FileUpload1_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            FileUpload1.SaveAs("C:/Users/hieuv/Pictures/Screenshots/" + FileUpload1.FileName);
            Image1.ImageUrl = "C:\\Users\\hieuv\\Pictures\\Screenshots\\" + FileUpload1.FileName.ToString();
        }
    }
}