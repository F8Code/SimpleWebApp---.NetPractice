using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;

namespace PAI_Lab1
{
    public partial class Aplikacja : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                HtmlGenericControl main = (HtmlGenericControl)FindControl("main");
                main.Visible = false;

                bool[] imageStates = new bool[9];
                Session["ImageStates"] = imageStates;

                TimeSpan[] minMaxTime = new TimeSpan[2];
                minMaxTime[0] = minMaxTime[1] = TimeSpan.Zero;
                Session["MinMaxTime"] = minMaxTime;

                Session["LastClickTime"] = DateTime.Now;

                FindNewLightBulb(-1);
                SetGridImages();
            }              
        }

        protected void InputNameButton_Click(object sender, EventArgs e)
        {
            HtmlGenericControl form = (HtmlGenericControl)FindControl("form");
            form.Visible = false;

            HtmlGenericControl main = (HtmlGenericControl)FindControl("main");
            main.Visible = true;
        }

        protected void Button_Click(object sender, EventArgs e)
        {
            bool[] imageStates = (bool[])Session["ImageStates"];
            TimeSpan[] minMaxTime = (TimeSpan[])Session["MinMaxTime"];
            DateTime lastClickTime = (DateTime)Session["LastClickTime"];

            ImageButton button = (ImageButton)sender;
            int index = Convert.ToInt32(button.Attributes["data-index"]);

            if (imageStates[index])
            {
                FindNewLightBulb(index);

                TimeSpan timeBetweenClicks = DateTime.Now - lastClickTime;
                if (timeBetweenClicks > TimeSpan.Zero)
                {
                    if (minMaxTime[0] == TimeSpan.Zero || timeBetweenClicks < minMaxTime[0])
                    {
                        minMaxTime[0] = timeBetweenClicks;
                        Session["MinMaxTime"] = minMaxTime;
                    }    
                    if (timeBetweenClicks > minMaxTime[1])
                    {
                        minMaxTime[1] = timeBetweenClicks;
                        Session["MinMaxTime"] = minMaxTime;
                    }  
                }
                Session["LastClickTime"] = DateTime.Now;
            }
            SetGridImages();
        }
        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {  
            //
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SetGridImages();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            FindNewLightBulb(-1);
            SetGridImages();
        }

        private void FindNewLightBulb(int index)
        {
            bool[] imageStates = (bool[])Session["ImageStates"];
            int selectedIndexLayout = DropDownList1.SelectedIndex;

            for (int i = 0; i < 9; i++)
                imageStates[i] = false;

            Random rnd = new Random();
            int num = rnd.Next(9) + 1;

            while (num - 1 == index ||
                (selectedIndexLayout == 0 && num % 2 == 0) ||
                (selectedIndexLayout == 1 && num != 1 && num != 5 && num != 9) ||
                (selectedIndexLayout == 2 && num != 3 && num != 5 && num != 7) ||
                (selectedIndexLayout == 3 && num != 4 && num != 5 && num != 6) ||
                (selectedIndexLayout == 4 && num != 2 && num != 5 && num != 8))
                num = rnd.Next(9) + 1;

            imageStates[num - 1] = true;

            Session["ImageStates"] = imageStates;
        }

        private void SetGridImages()
        {
            int selectedIndexSize = RadioButtonList1.SelectedIndex;
            int selectedIndexLayout = DropDownList1.SelectedIndex;

            List<ImageButton> buttons = new List<ImageButton>() {
                ImageButton1, ImageButton2, ImageButton3,
                ImageButton4, ImageButton5, ImageButton6,
                ImageButton7, ImageButton8, ImageButton9
            };

            string size = "";
            switch (selectedIndexSize)
            {
                case 0:
                    size = "50";
                    break;
                case 1:
                    size = "75";
                    break;
                case 2:
                    size = "100";
                    break;
            }

            for (int i = 0; i < buttons.Count; i++)
            {
                buttons[i].Visible = false;
                buttons[i].Width = buttons[i].Height = Convert.ToInt32(size);//
               // buttons[i].Attributes.Add("onmouseover", "alert('uwaga!!!')");
            }

            switch (selectedIndexLayout)
            {
                case 0:
                    for (int i = 0; i < 9; i += 2)
                        SetImage(buttons[i]);
                    break;
                case 1:
                    for (int i = 0; i < 9; i += 4)
                        SetImage(buttons[i]);
                    break;
                case 2:
                    for (int i = 2; i < 7; i += 2)
                        SetImage(buttons[i]);
                    break;
                case 3:
                    for (int i = 3; i < 6; i++)
                        SetImage(buttons[i]);
                    break;
                case 4:
                    for (int i = 1; i < 9; i += 3)
                        SetImage(buttons[i]);
                    break;
            }

            TimeSpan[] minMaxTime = (TimeSpan[])Session["MinMaxTime"];
            LabelMinTime.Text = string.Format("{0:D2} : {1:D2} , {2:D3} s", minMaxTime[0].Minutes, minMaxTime[0].Seconds, minMaxTime[0].Milliseconds);
            LabelMaxTime.Text = string.Format("{0:D2} : {1:D2} , {2:D3} s", minMaxTime[1].Minutes, minMaxTime[1].Seconds, minMaxTime[1].Milliseconds);
        }

        private void SetImage(ImageButton button)
        {
            bool[] imageStates = (bool[])Session["ImageStates"];
            int index = Convert.ToInt32(button.Attributes["data-index"]);

            button.Visible = true;
            if (imageStates[index])
                button.ImageUrl = "Light.png";
            else
                button.ImageUrl = "Dark.png";
        }
    }
}