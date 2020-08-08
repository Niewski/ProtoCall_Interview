using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

public partial class People : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ASPxGridView1_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
    {
        // Checks for null values.
        if (e.NewValues["FirstName"] == null)
        {
            AddError(e.Errors, ASPxGridView1.Columns["FirstName"],
            "You must provide a First Name.");
        }
        if (e.NewValues["LastName"] == null)
        {
            AddError(e.Errors, ASPxGridView1.Columns["LastName"],
            "You must provide a Last Name.");
        }
        if (string.IsNullOrEmpty(e.RowError) && e.Errors.Count > 0)
            e.RowError = "Please, correct all errors.";
    }

    void AddError(Dictionary<GridViewColumn, string> errors,
    GridViewColumn column, string errorText)
    {
        if (errors.ContainsKey(column)) return;
        errors[column] = errorText;
    }

    protected void ASPxGridView1_HtmlRowPrepared(object sender,
    ASPxGridViewTableRowEventArgs e)
    {
        // Checks whether the generated row has the errors.
        bool hasError = e.GetValue("FirstName") == null;
        hasError = hasError || e.GetValue("LastName") == null;
        // If the row has the error(s), its text color is set to red.
        if (hasError)
            e.Row.ForeColor = System.Drawing.Color.Red;
    }

    protected void ASPxGridView1_StartRowEditing(object sender,
    DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
    {
        // Validates the edited row if it isn't a new row,.
        if (!ASPxGridView1.IsNewRowEditing)
            ASPxGridView1.DoRowValidation();
    }
}