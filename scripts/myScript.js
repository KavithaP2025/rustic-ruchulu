var app = angular.module('rusticRuchuluApp', []);
app.controller('rusticRuchuluController', function ($scope, $http) {

    $scope.IsLogin = false;
    $scope.LoginUserRole = "User";
    $scope.LoginUserID = 0;
    $scope.LoginUserName = "";
    $scope.LoginUserEmail = "";
    $scope.IsLoading = false;
    $scope.displayAddressFlag = false;



    $scope.addressList = [];
    $scope.SelectedUserAddressID = 0;
    $scope.AddressUserName = "";
    $scope.AddressPhoneNumber = "";
    $scope.Locality = "";
    $scope.Address = "";
    $scope.Pincode = "";
    $scope.City = "";
    $scope.State = "";




    $scope.categories = [];
    $scope.userEmail = "";
    $scope.IsEmailError = false;
    $scope.IsOTPInputError = false;


    $scope.showAlert = false;
    $scope.alertClass = "";
    $scope.alertMessage = "";

    $scope.CartItems = [];
    $scope.SelectedAddressIdForCart = 1;
    $scope.CartSubTotal = 0;
    $scope.CartDiscount = 0;
    $scope.CartTotal = 0;

    $scope.CategoriesList = [];
    $scope.AdminCategoryID = 0;
    $scope.AdminCategoryName = "";
    $scope.AdminCategoryDescription = "";
    $scope.AdminCategoryImage = "";
    $scope.AdminSortOrder = 1;
    $scope.displayNewCategoryFlag = false;

    $scope.AdminItemImage = "";

    $scope.handleAlert = function (alertClass, alertMessage) {
        $scope.showAlert = true;
        $scope.alertClass = alertClass;
        $scope.alertMessage = alertMessage;
        setTimeout(() => {
            $scope.showAlert = false;
        }, 5000)
    }

    const cart = JSON.parse(localStorage.getItem('rustic-ruchulu-user-cart-data'));
    if (cart == null || cart == undefined || cart == {} || cart == '{}' || cart == '') {
        //alert('please login');
    }
    else {

    }

    const user = JSON.parse(localStorage.getItem('rustic-ruchulu-user-data'));
    if (user == null || user == undefined || user == {} || user == '{}' || user == '') {
        //alert('please login');
    }
    else {
        $scope.IsLogin = true;
        $scope.LoginUserRole = user.LoginUserRole;
        $scope.LoginUserID = user.LoginUserID;
        $scope.LoginUserName = user.LoginUserName;
        $scope.LoginUserEmail = user.LoginUserEmail;
    }


    $scope.closeAlert = function () {
        $scope.showAlert = false;
    }


    /////////////////////////  login script start //////////////////////////////


    $scope.RequestOTP = function () {
        if ($scope.userEmail.length == 0) {
            $scope.IsEmailError = true;
            return false;
        }
        else {
            $scope.IsLoading = true;
            $scope.IsEmailError = false;
            $scope.CheckEmailAndGenerateCode();
        }

    }

    $scope.CheckEmailAndGenerateCode = function () {
        var send = {
            method: 'POST',
            url: 'login.aspx/CheckEmailAndGenerateCode',
            headers: {
                'Content-Type': 'application/json; charset=utf-8',
                'dataType': 'json'
            },
            data: { "email": $scope.userEmail },
            async: false,
        }
        $http(send).success(function (response) {
            // debugger;
            var responce = JSON.parse(response.d).Table;
            if (responce.legnth == 0) {
                $scope.handleAlert("alert-danger", "Failed to login. Please contact support team.");
            }
            else if (responce[0].Status == "Failed") {
                $scope.handleAlert("alert-danger", responce[0].Message);
            }
            else if (responce[0].Status == "Success") {
                $scope.SendMail(responce[0].Code, responce[0].UserName);
                //$scope.LoginUserRole = responce[0].Role;
                //$scope.LoginUserID = responce[0].UserID;
            }
        })
    }

    $scope.SendMail = function (Code, UserName) {
        var send = {
            method: 'POST',
            url: 'login.aspx/SendMail',
            headers: {
                'Content-Type': 'application/json; charset=utf-8',
                'dataType': 'json'
            },
            data: { "email": $scope.userEmail, "code": Code, "username": UserName },
            async: false,
        }
        $http(send).success(function (response) {
            $scope.responce = response.d;
            if ($scope.responce) {
                $scope.IsOTPInputError = false;
                var myModal = new bootstrap.Modal(document.getElementById('loginModel'), {
                    backdrop: 'static',
                    keyboard: false
                });
                myModal.show();
            }
            else {
                $scope.handleAlert("alert-danger", "Failed to send mail. Please contact support team.");
            }
            $scope.IsLoading = false;
        })
    }

    $scope.ValidateEmailAndPin = function () {
        if ($scope.otpText1 == "" || $scope.otpText2 == "" || $scope.otpText3 == "" || $scope.otpText4 == "" || $scope.otpText5 == "" || $scope.otpText6 == "" ||
            $scope.otpText1 == undefined || $scope.otpText2 == undefined || $scope.otpText3 == undefined || $scope.otpText4 == undefined || $scope.otpText5 == undefined || $scope.otpText6 == undefined) {
            $scope.IsOTPInputError = true;
            return false;
        }
        $scope.IsOTPInputError = false;
        var PIN = `${$scope.otpText1}${$scope.otpText2}${$scope.otpText3}${$scope.otpText4}${$scope.otpText5}${$scope.otpText6}`;
        var send = {
            method: 'POST',
            url: 'login.aspx/ValidateEmailAndPin',
            headers: {
                'Content-Type': 'application/json; charset=utf-8',
                'dataType': 'json'
            },
            data: { "PIN": PIN, "Email": $scope.userEmail },
            async: false,
        }
        $http(send).success(function (response) {
            $scope.responce = JSON.parse(response.d).Table;
            if ($scope.responce[0].legth == 0) {
                $scope.handleAlert("alert-danger", "Failed to send mail. Please contact support team.");
            }
            else if ($scope.responce[0].Status == "Failed") {
                $scope.handleAlert("alert-danger", $scope.responce[0].Message);
            }
            else if ($scope.responce[0].Status == "Success") {
                alert("Success");
                let userObj = {
                    LoginUserID: $scope.responce[0].UserID,
                    LoginUserRole: $scope.responce[0].Role,
                    LoginUserName: $scope.responce[0].UserName,
                    LoginUserEmail: $scope.responce[0].Email,
                }
                $scope.LoginUserID = $scope.responce[0].UserID;
                $scope.LoginUserRole = $scope.responce[0].Role;
                $scope.LoginUserName = $scope.responce[0].UserName;
                $scope.LoginUserEmail = $scope.responce[0].Email;
                localStorage.setItem('rustic-ruchulu-user-data', JSON.stringify(userObj));
                window.location.href = 'index.aspx';
            }
            var myModal = new bootstrap.Modal(document.getElementById('loginModel'), {
                backdrop: 'static',
                keyboard: false
            });
            myModal.hide();
            $scope.otpText1 = "";
            $scope.otpText2 = "";
            $scope.otpText3 = "";
            $scope.otpText4 = "";
            $scope.otpText5 = "";
            $scope.otpText6 = "";


        })
    }

    $scope.redirectToRegister = function () {
        window.location.href = 'register.aspx';
    }

    $scope.redirectToLogin = function () {
        window.location.href = 'login.aspx';
    }

    /////////////////////////  login script end //////////////////////////////


    /////////////////////////  register script start //////////////////////////////



    $scope.Register = function () {
        var send = {
            method: 'POST',
            url: 'register.aspx/Register',
            headers: {
                'Content-Type': 'application/json; charset=utf-8',
                'dataType': 'json'
            },
            data: { "UserName": $scope.UserName, "UserEmail": $scope.UserEmail, "UserPhone": $scope.UserPhone },
            async: false,
        }
        $http(send).success(function (response) {

            $scope.responce = JSON.parse(response.d).Table;
            if ($scope.responce[0].legth == 0) {
                $scope.handleAlert("alert-danger", "Failed to register. Please contact support team.");
            }
            else if ($scope.responce[0].Status == "Warning") {
                $scope.handleAlert("alert-danger", $scope.responce[0].Message);
            }
            else if ($scope.responce[0].Status == "Success") {
                $scope.handleAlert("alert-success", $scope.responce[0].Message);
                setTimeout(() => {
                    window.location.href = 'login.aspx';
                }, 2000);               
            }
        })
    }


    /////////////////////////  register script end //////////////////////////////

    
    /////////////////////////  address script start //////////////////////////////

    $('#AddNewAddress').click(function () {
            $('#createAddressDiv').fadeIn(500);
            $scope.displayAddressFlag = true;
    });

    $scope.ResetAddress = function () {
        $('#createAddressDiv').fadeOut(300);
        $scope.displayAddressFlag = false;
        $scope.SelectedUserAddressID = 0;
        $scope.AddressUserName = "";
        $scope.AddressPhoneNumber = "";
        $scope.Locality = "";
        $scope.Address = "";
        $scope.Pincode = "";
        $scope.City = "";
        $scope.State = "";
    }

    $scope.GetUserAddress = function () {
        $scope.IsLoading = true;
        var send = {
            method: 'POST',
            url: 'address.aspx/GetUserAddress',
            headers: {
                'Content-Type': 'application/json; charset=utf-8',
                'dataType': 'json'
            },
            data: { UserID  : 1 },
            async: false,
        }
        $http(send).success(function (response) {
            var responce = JSON.parse(response.d).Table;
            $scope.addressList = responce;
            $scope.SelectedUserAddressID = 0;
            $scope.IsLoading = false;
        })
    }

    

    $scope.SelectedUserAddress = function (AddressID) {
        $scope.SelectedUserAddressID = AddressID;
        var myModal = new bootstrap.Modal(document.getElementById('deleteAddressModel'), {
            backdrop: 'static',
            keyboard: false
        });
        myModal.show();
    }


    $scope.UpsertUserAddress = function () {
        $scope.IsLoading = true;
        var send = {
            method: 'POST',
            url: 'address.aspx/UpsertUserAddress',
            headers: {
                'Content-Type': 'application/json; charset=utf-8',
                'dataType': 'json'
            },
            data: {
                AddressID: $scope.SelectedUserAddressID,
                UserID: $scope.LoginUserID,
                AddressUserName: $scope.AddressUserName,
                AddressPhoneNumber: $scope.AddressPhoneNumber,
                Pincode: $scope.Pincode,
                Locality: $scope.Locality,
                Address: $scope.Address,
                City: $scope.City,
                State: $scope.State
            },
            async: false,
        }
        $http(send).success(function (response) {
            var responce = JSON.parse(response.d).Table;
            if (responce?.length) {
                if (responce[0].Status == 'Success') {
                    $scope.handleAlert("alert-success", responce[0].Message);
                    $scope.ResetAddress();
                    setTimeout(() => {
                        $scope.GetUserAddress();
                    }, 2000)
                }
                else if (responce[0].Status == 'Warning') {
                    $scope.handleAlert("alert-danger", responce[0].Message);
                }
                else {
                    $scope.handleAlert("alert-danger", "Failed to delete address. Please contact support team.");
                }
            }
            else {
                $scope.handleAlert("alert-danger", "Failed to delete address. Please contact support team.");
            }
            $scope.SelectedUserAddressID = 0;
            $scope.IsLoading = false;
        })
    }

    $scope.DeleteUserAddress = function () {
        $scope.IsLoading = true;
        var send = {
            method: 'POST',
            url: 'address.aspx/DeleteUserAddress',
            headers: {
                'Content-Type': 'application/json; charset=utf-8',
                'dataType': 'json'
            },
            data: { AddressID: $scope.SelectedUserAddressID },
            async: false,
        }
        $http(send).success(function (response) {
            var responce = JSON.parse(response.d).Table;
            if (responce?.length) {
                if (responce[0].Status == 'Success') {
                    $scope.handleAlert("alert-success", responce[0].Message); 
                    //var myModal = new bootstrap.Modal(document.getElementById('deleteAddressModel'), {
                    //    backdrop: 'static',
                    //    keyboard: false
                    //});
                    //myModal.hide();
                    $scope.GetUserAddress();
                }
                else if (responce[0].Status == 'Warning') {
                    $scope.handleAlert("alert-danger", responce[0].Message);
                }
                else {
                    $scope.handleAlert("alert-danger", "Failed to delete address. Please contact support team.");
                }
            }
            else {
                $scope.handleAlert("alert-danger", "Failed to delete address. Please contact support team.");
            }
            $scope.SelectedUserAddressID = 0;
            $scope.IsLoading = false;
        })
    }



    /////////////////////////  address script end //////////////////////////////




    /////////////////////////  category script start //////////////////////////////


    $scope.GetItemsByCategory = function () {
        $scope.IsLoading = true;
        var send = {
            method: 'POST',
            url: 'categories.aspx/GetItemsByCategory',
            headers: {
                'Content-Type': 'application/json; charset=utf-8',
                'dataType': 'json'
            },
            data: { UserID: $scope.LoginUserID  },
            async: false,
        }
        $http(send).success(function (response) {
            // debugger
            $scope.responce = JSON.parse(response.d).Table;
            $scope.ItemTags = JSON.parse(response.d).Table1;
            if ($scope.responce.legth == 0) {
                $scope.handleAlert("alert-danger", "No Data.");
            }
            else {
                $scope.CategoriesList = $scope.responce;
                // Initialize an empty categories array
                let categories = [];

                // Loop through the res array
                $scope.responce.forEach(item => {
                    // Check if the category already exists
                    let category = categories.find(cat => cat.CategoryName === item.CategoryName);

                    // If the category does not exist, create it
                    if (!category) {
                        category = {
                            CategoryID: item.CategoryID,
                            CategoryName: item.CategoryName,
                            CategoryDescription: item.CategoryDescription,
                            CategoryImage: item.CategoryImage,
                            items: []
                        };
                        categories.push(category);
                    }

                    //let tags = $scope.ItemTags.filter(tag => tag.ItemID === item.ItemID);

                    // Add the item to the category
                    category.items.push({
                        ItemID: item.ItemID,
                        ItemName: item.ItemName,
                        ItemDescription: item.ItemDescription,
                        //QuantityTags: tags, // This is a placeholder, modify as needed
                        OriginalPrice: item.OriginalPrice,
                        Price: item.OriginalPrice,
                        DiscountPercentage: item.DiscountPercentage,
                        ItemImage: item.ItemImage,
                        CartCount: item.ItemCount,
                        IsEdit: false
                    });
                });

                $scope.categories = categories; // Assign the result to $scope.categories
                $scope.IsLoading = false;

            }
        })
    }

    $scope.AddToCart = function (CategoryID, ItemID, Type, ItemCount, CartID) {
        debugger;
        console.log($scope.LoginUserID);
        if ($scope.LoginUserID == 0) {
            var myModal = new bootstrap.Modal(document.getElementById('loginModel'), {
                backdrop: 'static',
                keyboard: false
            });
            myModal.show();
            return false;
        }
        var count = 0;
        if (Type == "Add") {
            count = 1;
        }
        else if (Type == "Plus") {
            count = ItemCount + 1;
        }
        else if (Type == "Minus") {
            count = ItemCount - 1;
        }
        $scope.IsLoading = true;
        var send = {
            method: 'POST',
            url: 'cart.aspx/UpsertCartItem',
            headers: {
                'Content-Type': 'application/json; charset=utf-8',
                'dataType': 'json'
            },
            data: { CartID: CartID, UserID: $scope.LoginUserID, ItemID: ItemID, CategoryID: CategoryID, ItemCount: count  },
            async: false,
        }
        $http(send).success(function (response) {
            var responce = JSON.parse(response.d).Table;
            if (responce?.length) {
                if (responce[0].Status == 'Success') {
                    $scope.GetCartItemsByUser();
                }
                else if (responce[0].Status == 'Warning') {
                    $scope.handleAlert("alert-danger", responce[0].Message);
                }
                else {
                    $scope.handleAlert("alert-danger", "Failed to add in cart. Please contact support team.");
                }
            }
            else {
                $scope.handleAlert("alert-danger", "Failed to add in cart. Please contact support team.");
            }
            setTimeout(() => {
                $scope.IsLoading = false;
            }, 2000);
            
        })
    }

    $scope.IncreaseFromCart = function (CategoryID, ItemID) {
        let categoryIndex = $scope.categories.findIndex(cat => cat.CategoryID === CategoryID);
        let itemIndex = $scope.categories[categoryIndex].items.findIndex(item => item.ItemID === ItemID);
        $scope.categories[categoryIndex].items[itemIndex].CartCount += 1;
    }
    $scope.DecreaseFromCart = function (CategoryID, ItemID) {
        let categoryIndex = $scope.categories.findIndex(cat => cat.CategoryID === CategoryID);
        let itemIndex = $scope.categories[categoryIndex].items.findIndex(item => item.ItemID === ItemID);
        $scope.categories[categoryIndex].items[itemIndex].CartCount -= 1;
    }


    /////////////////////////  category script end //////////////////////////////




    /////////////////////////  cart script start //////////////////////////////

    $scope.GetCartItemsByUser = function () {
        $scope.IsLoading = true;
        var send = {
            method: 'POST',
            url: 'cart.aspx/GetCartItemsByUser',
            headers: {
                'Content-Type': 'application/json; charset=utf-8',
                'dataType': 'json'
            },
            data: { UserID: $scope.LoginUserID },
            async: false,
        }
        $http(send).success(function (response) {
            var responce = JSON.parse(response.d).Table;
            if (responce?.length) {
                // debugger;
                $scope.CartItems = responce;

                let CartSubTotal = 0;
                let CartDiscount = 0;
                let TotalPrice = 0;

                responce.forEach(item => {
                    CartSubTotal += item.OriginalPrice;
                    CartDiscount += (item.OriginalPrice - item.WithDiscountItemPrice);
                    TotalPrice += item.TotalPrice;
                });
                $scope.CartSubTotal = CartSubTotal;
                $scope.CartDiscount = CartDiscount;
                $scope.CartTotal = TotalPrice;
            }
            else {
                $scope.handleAlert("alert-danger", "No items in cart.");
            }
            $scope.IsLoading = false;
        })
    }



    /////////////////////////  cart script end //////////////////////////////



    /////////////////////////  admin category script start //////////////////////////////


    $('#AddNewCategory').click(function () {
        $('#createDivCategory').fadeIn(500);
        $scope.displayNewCategoryFlag = true;
        $scope.resetCategoriesAllIsEdit();
    });

    $scope.ResetCategory = function () {
        $('#createDivCategory').fadeOut(300);
        $scope.AdminCategoryID = 0;
        $scope.AdminCategoryName = "";
        $scope.AdminCategoryDescription = "";
        $scope.AdminCategoryImage = "";
        $scope.AdminSortOrder = 1;
        $scope.displayNewCategoryFlag = false;
        $scope.resetCategoriesAllIsEdit();
    }

    $scope.resetCategoriesAllIsEdit = function () {
        $scope.CategoriesList.forEach(function (item) {
            item.IsEdit = false;
        });
    };


    $scope.EditCategory = function (index, CategoryID) {
        $scope.CategoriesList.forEach(function (item, i) {
            item.IsEdit = (i === index) ? !$scope.CategoriesList[index].IsEdit : false;
        });
        $('#createDivCategory').fadeOut(300);
        var selectedCategory = $scope.CategoriesList.find(item => item.CategoryID == CategoryID);
        $scope.AdminCategoryID = selectedCategory.CategoryID;
        $scope.AdminCategoryImage = selectedCategory.CategoryImage;
        $scope.AdminSortOrder = 1;
        $scope.displayNewCategoryFlag = false;
    }


    $scope.GetCategories = function () {
        $scope.IsLoading = true;
        var send = {
            method: 'POST',
            url: 'adminCategory.aspx/GetCategories',
            headers: {
                'Content-Type': 'application/json; charset=utf-8',
                'dataType': 'json'
            },
            data: { },
            async: false,
        }
        $http(send).success(function (response) {
            $scope.responce = JSON.parse(response.d).Table;
            if ($scope.responce.legth == 0) {
                $scope.handleAlert("alert-danger", "No Data.");
            }
            else {
                $scope.CategoriesList = $scope.responce;
                $scope.IsLoading = false;

            }
        })
    }


    $scope.UpsertCategory = function () {
        var selectedCategory = $scope.CategoriesList.find(item => item.CategoryID == $scope.AdminCategoryID);
        $scope.IsLoading = true;
        var send = {
            method: 'POST',
            url: 'adminCategory.aspx/UpsertCategory',
            headers: {
                'Content-Type': 'application/json; charset=utf-8',
                'dataType': 'json'
            },
            data: {
                CategoryID: $scope.AdminCategoryID,
                CategoryName: selectedCategory.CategoryName,
                CategoryDescription: selectedCategory.CategoryDescription,
                CategoryImage: $scope.AdminCategoryImage,
                SortOrder: $scope.AdminSortOrder,
                IsActive: 1
            },
            async: false,
        }
        $http(send).success(function (response) {
            var responce = JSON.parse(response.d).Table;
            if (responce?.length) {
                if (responce[0].Status == 'Success') {
                    $scope.handleAlert("alert-success", responce[0].Message);
                    $scope.ResetCategory();
                    setTimeout(() => {
                        $scope.GetCategories();
                    }, 2000)
                }
                else if (responce[0].Status == 'Warning') {
                    $scope.handleAlert("alert-danger", responce[0].Message);
                }
                else {
                    $scope.handleAlert("alert-danger", "Failed to insert category details. Please contact support team.");
                }
            }
            else {
                $scope.handleAlert("alert-danger", "Failed to insert category details. Please contact support team.");
            }
            $scope.AdminCategoryID = 0;
            $scope.IsLoading = false;
        })
    }

    $scope.uploadImage = function (input) {
        if (input.files && input.files[0]) {
            var file = input.files[0];

            // Preview (optional)
            var reader = new FileReader();
            reader.onload = function (e) {
                $scope.$apply(function () {
                    $scope.imagePreview = e.target.result; // base64 image string
                });
            };
            reader.readAsDataURL(file);

            // Raw File Data (e.g., for FormData)
            $scope.selectedImageFile = file;
        }
    };

    $scope.convertToBase64ForCatogory = function (input) {
        if (input.files && input.files[0]) {
            var file = input.files[0];
            var reader = new FileReader();

            reader.onload = function (e) {
                $scope.$apply(function () {
                    $scope.AdminCategoryImage = e.target.result;
                });
            };

            reader.readAsDataURL(file); // Converts to base64
        }
    };
    $scope.convertToBase64ForItem = function (input) {
        if (input.files && input.files[0]) {
            var file = input.files[0];
            var reader = new FileReader();

            reader.onload = function (e) {
                $scope.$apply(function () {
                    $scope.AdminItemImage = e.target.result;
                });
            };

            reader.readAsDataURL(file); // Converts to base64
        }
    };
    


    /////////////////////////  admin category script end //////////////////////////////


    /////////////////////////  admin item script start //////////////////////////////



    $scope.AddNewItem = function (CategoryID) {
        let obj = {
            CategoryID: CategoryID,
            ItemID: 0,
            ItemName: "",
            ItemDescription: "",
            ItemImage: "",
            OriginalPrice: 0,
            DiscountPercentage: 0,
            IsActive: 1,
            IsEdit: true
        }
        let categoryIndex = $scope.categories.findIndex(item => item.CategoryID == CategoryID);
        $scope.categories[categoryIndex].items.unshift({...obj});
    }


    $scope.EditItemClick = function (CategoryID, ItemID) {
        $scope.resetItemsAllIsEdit();
        let categoryIndex = $scope.categories.findIndex(item => item.CategoryID == CategoryID);
        let itemIndex = $scope.categories[categoryIndex].items.findIndex(item => item.ItemID == ItemID);
        $scope.categories[categoryIndex].items[itemIndex].IsEdit = true;
        $scope.AdminItemImage = $scope.categories[categoryIndex].items[itemIndex].ItemImage;
    }

    $scope.resetItemsAllIsEdit = function () {
        $scope.categories.forEach(function (category) {
            category.items.forEach(function (item) {
                item.IsEdit = false;
            });
        });
        $scope.AdminItemImage = "";
    };


    $scope.UpsertItem = function (CategoryID, ItemID) {
        let categoryIndex = $scope.categories.findIndex(item => item.CategoryID == CategoryID);
        let itemIndex = $scope.categories[categoryIndex].items.findIndex(item => item.ItemID == ItemID);
        var selectedItem = $scope.categories[categoryIndex].items[itemIndex];
        $scope.IsLoading = true;
        var send = {
            method: 'POST',
            url: 'adminItems.aspx/UpsertItem',
            headers: {
                'Content-Type': 'application/json; charset=utf-8',
                'dataType': 'json'
            },
            data: {
                CategoryID: CategoryID,
                ItemID: ItemID,
                ItemName: selectedItem.ItemName,
                ItemDescription: selectedItem.ItemDescription,
                ItemImage: $scope.AdminItemImage,
                OriginalPrice: selectedItem.OriginalPrice,
                DiscountPercentage: selectedItem.DiscountPercentage,
                IsActive: 1
            },
            async: false,
        }
        $http(send).success(function (response) {
            var responce = JSON.parse(response.d).Table;
            if (responce?.length) {
                if (responce[0].Status == 'Success') {
                    $scope.handleAlert("alert-success", responce[0].Message);
                    $scope.resetItemsAllIsEdit();
                    setTimeout(() => {
                        $scope.GetItemsByCategory();
                    }, 2000)
                }
                else if (responce[0].Status == 'Warning') {
                    $scope.handleAlert("alert-danger", responce[0].Message);
                }
                else {
                    $scope.handleAlert("alert-danger", "Failed to insert item details. Please contact support team.");
                }
            }
            else {
                $scope.handleAlert("alert-danger", "Failed to insert item details. Please contact support team.");
            }
            $scope.IsLoading = false;
        })
    }


    /////////////////////////  admin item script end //////////////////////////////



    $scope.logout = function () {
        localStorage.removeItem('rustic-ruchulu-user-data');
        window.location.href = "index.aspx";
    }


})