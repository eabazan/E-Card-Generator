using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing.Text;
using System.ComponentModel;

namespace E_Card_Generator
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // My third change to commit
            if(!IsPostBack)
            {
                //Set color options
                string[] colorArray = Enum.GetNames(typeof(KnownColor));
                lstBackColor.DataSource = colorArray;
                lstBackColor.DataBind();
                //Set font option
                InstalledFontCollection fonts = new InstalledFontCollection();
                foreach(FontFamily family in fonts.Families)
                {
                    lstFontName.Items.Add(family.Name);
                }                
                //set border style
                string[] borderStyleArray = Enum.GetNames(typeof(BorderStyle));
                lstBorder1.DataSource = borderStyleArray;
                lstBorder1.DataBind();
                //salect the first border option
                lstBorder1.SelectedIndex = 0;
                //set the picture
                imgDefault.ImageUrl = "~/App_Image/defaultpic.png";
                imgDefault.Visible = false;
                // this is my second change
            }
        }

        protected void cmdUpdate_Click(object sender, EventArgs e)
        {
            //update the color
            pnlCard.BackColor = Color.FromName(lstBackColor.SelectedItem.Text);
            //update font
            lblGretting.Font.Name = lstFontName.SelectedItem.Text;
            if (int.Parse(txtFontSize.Text) > 0)
            {
                lblGretting.Font.Size = FontUnit.Point(int.Parse(txtFontSize.Text));
            }
            // find the appropiate TypeConverter for the BorderStyle enumeration
            TypeConverter converter = TypeDescriptor.GetConverter(typeof(BorderStyle));
            // update the border style using the value from converter
            pnlCard.BorderStyle = (BorderStyle)converter.ConvertFromString(lstBorder1.SelectedItem.Text);
            //update pic
            if (chkPicture.Checked)
                imgDefault.Visible = true;
            else
                imgDefault.Visible = false;

            lblGretting.Text = txtGreeting.Text;
            //My first change to be commited to the local repo.
        }
    }
}