function Register() {
    var dataForm = $('#Form1').serialize();

    if (Validasi()) {
        debugger;
        if (validateMobile()) {
            $.ajax({
                url: API + 'api/APILogin/Register',
                type: 'post',
                data: dataForm,
                success: function (result) {
                    //efect
                    if (result == 'success') {
                        alert('Registration success');
                        $('#txtMobileNUmber').val('');
                        $('#txtFirstName').val('');
                        $('#txtLastName').val('');
                        $('#txtEmail').val('');
                        $('#ddlMonth').val('');
                        $('#ddlDate').val('');
                        $('#ddlYear').val('');
                        $('#btnRegister').attr('disabled', true);
                        $('#overlay').removeAttr('hidden');
                        $('#btnLogin').removeAttr('hidden');

                    } else {
                        alert('mobile number already registered');
                    }
                }
            })
        } else {
            alert('please enter indonesian valid number');
        }
    }
    
}

function toLoginPage() {
    window.location.href = "../Login/Login";
}

function Validasi() {
    debugger;
    if ($('#txtMobileNUmber').val() == '') {
        $('#txtMobileNUmber').focus();
        //$('#txtMobileNUmber').attr('data-original-title', 'phone number is required')
        //    .tooltip('fixTitle')
        //    .tooltip('show');
        return false;
    } else if ($('#txtFirstName').val() == '') {
        $('#txtFirstName').focus();
        return false;
    } else if ($('#txtLastName').val() == '') {
        $('#txtLastName').focus();
        return false;
    } else if ($('#txtEmail').val() == '') {
        $('#txtEmail').focus();
        return false;
    } else {
        return true;
    }
}

function validateMobile() {
    debugger;
    var mobilenumber = $('#txtMobileNUmber').val().toString();
    var format = mobilenumber.substring(0, 2);
    if (format == '62' && mobilenumber.length > 9 && mobilenumber.length < 15) {
        return true;
    } else if (format == '08' && mobilenumber.length > 9 && mobilenumber.length < 15) {
        return true;
    } else {
        return false;
    }
}

function getDate() {
    debugger;
    if ($('#ddlMonth').val() != "" && $('#ddlDate').val() != "" && $('#ddlYear').val() != "") {
        $('#txtDate').val($('#ddlMonth').val() + '/' + $('#ddlDate').val() + '/' + $('#ddlYear').val());
    }
}