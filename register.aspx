<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="RusticRuchulu.register" %>


<!doctype html>
<html class="no-js" lang="zxx" ng-app="rusticRuchuluApp">

<head>
    <!-- Meta Tags -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="keywords" content="Site keywords here">
    <meta name="description" content="">
    <meta name='copyright' content=''>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Title -->
    <title>Rustic Ruchulu</title>

    <!-- Favicon -->
    <link rel="icon" href="img/favicon.png">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap"
        rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Nice Select CSS -->
    <link rel="stylesheet" href="css/nice-select.css">
    <!-- Font Awesome CSS -->
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <!-- icofont CSS -->
    <link rel="stylesheet" href="css/icofont.css">
    <!-- Slicknav -->
    <link rel="stylesheet" href="css/slicknav.min.css">
    <!-- Owl Carousel CSS -->
    <link rel="stylesheet" href="css/owl-carousel.css">
    <!-- Datepicker CSS -->
    <link rel="stylesheet" href="css/datepicker.css">
    <!-- Animate CSS -->
    <link rel="stylesheet" href="css/animate.min.css">
    <!-- Magnific Popup CSS -->
    <link rel="stylesheet" href="css/magnific-popup.css">

    <!-- Medipro CSS -->
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="css/responsive.css">
</head>

<body ng-controller="rusticRuchuluController">

    <div ng-if="IsLoading" class="loading-wrapper">
        <img src="./img/Animation.gif" />
    </div>

    <div class="site-mobile-menu site-navbar-target">
        <div class="site-mobile-menu-header">
            <img src="images/rubiks_trsprnt_bg.png" id="RubiksLogoMobile" />
            <div class="site-mobile-menu-close">
                <span class="icon-close2 js-menu-toggle"></span>
            </div>
        </div>
        <div class="site-mobile-menu-body"></div>
    </div>

    <!-- .site-mobile-menu -->

    <div class="site-navbar-wrap">
        <div class="site-navbar site-navbar-target js-sticky-header">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-6 logo_img">
                        <a href="index.aspx">Rustic Ruchulu
                        <%--<img src="images/rubiks_transparenr_white.png" id="RubiksLogo" />--%>
                        </a>
                    </div>
                    <div class="col-6">
                        <nav class="site-navigation text-right" role="navigation">
                            <div class="">
                                <div class="d-inline-block d-lg-none ml-md-0 mr-auto py-3">
                                    <a href="#"
                                        class="site-menu-toggle js-menu-toggle text-white"><span
                                            class="icon-menu h3"></span></a>
                                </div>
                                <ul class="site-menu main-menu js-clone-nav d-none d-lg-block">
                                    <li><a href="index.aspx" class="nav-link">
                                        <svg width="25" height="25" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" transform="rotate(0 0 0)">
                                            <path fill-rule="evenodd" clip-rule="evenodd" d="M12.45 4.90342C12.1833 4.70342 11.8167 4.70342 11.55 4.90342L5.05 9.77842C4.86115 9.92006 4.75 10.1423 4.75 10.3784V18.4998C4.75 18.9141 5.08579 19.2498 5.5 19.2498H9V16.9998C9 15.343 10.3431 13.9998 12 13.9998C13.6569 13.9998 15 15.343 15 16.9998V19.2498H18.5C18.9142 19.2498 19.25 18.9141 19.25 18.4998V10.3784C19.25 10.1423 19.1389 9.92006 18.95 9.77842L12.45 4.90342ZM10.65 3.70342C11.45 3.10342 12.55 3.10342 13.35 3.70342L19.85 8.57842C20.4166 9.00334 20.75 9.67021 20.75 10.3784V18.4998C20.75 19.7425 19.7426 20.7498 18.5 20.7498H14.25C13.8358 20.7498 13.5 20.4141 13.5 19.9998V16.9998C13.5 16.1714 12.8284 15.4998 12 15.4998C11.1716 15.4998 10.5 16.1714 10.5 16.9998V19.9998C10.5 20.4141 10.1642 20.7498 9.75 20.7498H5.5C4.25736 20.7498 3.25 19.7425 3.25 18.4998V10.3784C3.25 9.67021 3.58344 9.00334 4.15 8.57842L10.65 3.70342Z" fill="#343C54" />
                                        </svg>
                                        &nbsp;Home</a>
                                    </li>
                                    <%--User Categories--%>
                                    <li ng-if="LoginUserRole == 'User'">
                                        <a href="categories.aspx" class="nav-link">
                                            <svg width="25" height="25" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" transform="rotate(0 0 0)">
                                                <path d="M20 7.125L8 7.125C7.37868 7.125 6.875 6.62132 6.875 6C6.875 5.37868 7.37868 4.875 8 4.875L20 4.875C20.6213 4.875 21.125 5.37868 21.125 6C21.125 6.62132 20.6213 7.125 20 7.125ZM20 13.125L8 13.125C7.37868 13.125 6.875 12.6213 6.875 12C6.875 11.3787 7.37868 10.875 8 10.875L20 10.875C20.6213 10.875 21.125 11.3787 21.125 12C21.125 12.6213 20.6213 13.125 20 13.125ZM20 19.125L8 19.125C7.37868 19.125 6.875 18.6213 6.875 18C6.875 17.3787 7.37868 16.875 8 16.875L20 16.875C20.6213 16.875 21.125 17.3787 21.125 18C21.125 18.6213 20.6213 19.125 20 19.125Z" fill="#343C54" />
                                                <path d="M2.75977 6C2.75977 5.30964 3.31941 4.75 4.00977 4.75H4.01977C4.71012 4.75 5.26977 5.30964 5.26977 6C5.26977 6.69036 4.71012 7.25 4.01977 7.25H4.00977C3.31941 7.25 2.75977 6.69036 2.75977 6ZM2.75977 12C2.75977 11.3096 3.31941 10.75 4.00977 10.75H4.01977C4.71012 10.75 5.26977 11.3096 5.26977 12C5.26977 12.6904 4.71012 13.25 4.01977 13.25H4.00977C3.31941 13.25 2.75977 12.6904 2.75977 12ZM2.75977 18C2.75977 17.3096 3.31941 16.75 4.00977 16.75H4.01977C4.71012 16.75 5.26977 17.3096 5.26977 18C5.26977 18.6904 4.71012 19.25 4.01977 19.25H4.00977C3.31941 19.25 2.75977 18.6904 2.75977 18Z" fill="#343C54" />
                                            </svg>
                                            &nbsp;Categories
                                        </a></li>
                                    <%--Admin Categories--%>
                                    <li ng-if="LoginUserRole == 'Admin'">
                                        <a href="adminCategory.aspx" class="nav-link">
                                            <svg width="25" height="25" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" transform="rotate(0 0 0)">
                                                <path d="M4.5 19.75V9.75084H10.0004C11.2436 9.75084 12.2512 8.74244 12.2504 7.49924L12.2474 2H17.25C18.4926 2 19.5 3.00736 19.5 4.25V10.3782C18.6253 9.97492 17.6514 9.75 16.625 9.75C12.828 9.75 9.75 12.828 9.75 16.625C9.75 18.8006 10.7606 20.7403 12.338 22H6.75C5.50736 22 4.5 20.9926 4.5 19.75Z" fill="#343C54" />
                                                <path d="M10.5262 2.65951C10.5961 2.58957 10.6701 2.52471 10.7477 2.46516L10.7504 7.5003C10.7507 7.91473 10.4148 8.25084 10.0004 8.25084H4.96533C5.02455 8.1737 5.08902 8.10008 5.15851 8.03055L10.5262 2.65951Z" fill="#343C54" />
                                                <path d="M16.625 11.25C13.6565 11.25 11.25 13.6565 11.25 16.625C11.25 19.5935 13.6565 22 16.625 22C19.5935 22 22 19.5935 22 16.625C22 13.6565 19.5935 11.25 16.625 11.25ZM16.6251 14.2498C17.0393 14.2498 17.3751 14.5855 17.3751 14.9998V15.8748H18.2502C18.6644 15.8748 19.0002 16.2106 19.0002 16.6248C19.0002 17.039 18.6644 17.3748 18.2502 17.3748H17.3751V18.2499C17.3751 18.6642 17.0393 18.9999 16.6251 18.9999C16.2109 18.9999 15.8751 18.6642 15.8751 18.2499V17.3748H15C14.5858 17.3748 14.25 17.039 14.25 16.6248C14.25 16.2106 14.5858 15.8748 15 15.8748H15.8751V14.9998C15.8751 14.5855 16.2109 14.2498 16.6251 14.2498Z" fill="#343C54" />
                                            </svg>&nbsp;Categories
                                        </a></li>
                                    <%--Admin Items--%>
                                    <li ng-if="LoginUserRole == 'Admin'">
                                        <a href="adminItems.aspx" class="nav-link">
                                            <svg width="25" height="25" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" transform="rotate(0 0 0)">
                                                <path fill-rule="evenodd" clip-rule="evenodd" d="M10.9453 20.5C11.3327 21.0667 11.8027 21.5725 12.338 22H6.75C5.50736 22 4.5 20.9926 4.5 19.75V9.62105C4.5 9.02455 4.73686 8.45247 5.15851 8.03055L10.5262 2.65951C10.9482 2.23725 11.5207 2 12.1177 2H17.25C18.4926 2 19.5 3.00736 19.5 4.25V10.3782C19.0266 10.1599 18.5241 9.99391 18 9.88753V4.25C18 3.83579 17.6642 3.5 17.25 3.5H12.248L12.2509 7.4984C12.2518 8.74166 11.2442 9.75 10.0009 9.75H6V19.75C6 20.1642 6.33579 20.5 6.75 20.5H10.9453ZM10.7488 4.55876L7.05986 8.25H10.0009C10.4153 8.25 10.7512 7.91389 10.7509 7.49947L10.7488 4.55876Z" fill="#343C54" />
                                                <path d="M15.8751 14.9999C15.8751 14.5857 16.2109 14.2499 16.6251 14.2499C17.0393 14.2499 17.3751 14.5857 17.3751 14.9999V15.8749H18.2502C18.6644 15.8749 19.0002 16.2107 19.0002 16.6249C19.0002 17.0391 18.6644 17.3749 18.2502 17.3749H17.3751V18.25C17.3751 18.6643 17.0393 19 16.6251 19C16.2109 19 15.8751 18.6643 15.8751 18.25V17.3749H15C14.5858 17.3749 14.25 17.0391 14.25 16.6249C14.25 16.2107 14.5858 15.8749 15 15.8749H15.8751V14.9999Z" fill="#343C54" />
                                                <path fill-rule="evenodd" clip-rule="evenodd" d="M11.25 16.625C11.25 13.6565 13.6565 11.25 16.625 11.25C19.5935 11.25 22 13.6565 22 16.625C22 19.5935 19.5935 22 16.625 22C13.6565 22 11.25 19.5935 11.25 16.625ZM16.625 12.75C14.4849 12.75 12.75 14.4849 12.75 16.625C12.75 18.7651 14.4849 20.5 16.625 20.5C18.7651 20.5 20.5 18.7651 20.5 16.625C20.5 14.4849 18.7651 12.75 16.625 12.75Z" fill="#343C54" />
                                            </svg>
                                            &nbsp;Items
                                        </a></li>
                                    <%--User Cart--%>
                                    <li ng-if="IsLogin && LoginUserRole == 'User'"><a href="cart.aspx" class="nav-link">
                                        <svg width="25" height="25" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" transform="rotate(0 0 0)">
                                            <path fill-rule="evenodd" clip-rule="evenodd" d="M2.31641 3.25C1.90219 3.25 1.56641 3.58579 1.56641 4C1.56641 4.41421 1.90219 4.75 2.31641 4.75H3.49696C3.87082 4.75 4.18759 5.02534 4.23965 5.39556L5.49371 14.3133C5.6499 15.424 6.60021 16.25 7.72179 16.25L18.0664 16.25C18.4806 16.25 18.8164 15.9142 18.8164 15.5C18.8164 15.0858 18.4806 14.75 18.0664 14.75L7.72179 14.75C7.34793 14.75 7.03116 14.4747 6.9791 14.1044L6.85901 13.2505H17.7114C18.6969 13.2505 19.5678 12.6091 19.8601 11.668L21.7824 5.48032C21.8531 5.25268 21.8114 5.00499 21.6701 4.81305C21.5287 4.62112 21.3045 4.50781 21.0662 4.50781H5.51677C5.14728 3.75572 4.37455 3.25 3.49696 3.25H2.31641ZM5.84051 6.00781L6.64807 11.7505H17.7114C18.0399 11.7505 18.3302 11.5367 18.4277 11.223L20.0478 6.00781H5.84051Z" fill="#092a8e" />
                                            <path d="M7.78418 17.75C6.81768 17.75 6.03418 18.5335 6.03418 19.5C6.03418 20.4665 6.81768 21.25 7.78418 21.25C8.75068 21.25 9.53428 20.4665 9.53428 19.5C9.53428 18.5335 8.75068 17.75 7.78418 17.75Z" fill="#092a8e" />
                                            <path d="M14.5703 19.5C14.5703 18.5335 15.3538 17.75 16.3203 17.75C17.2868 17.75 18.0704 18.5335 18.0704 19.5C18.0704 20.4665 17.2869 21.25 16.3204 21.25C15.3539 21.25 14.5703 20.4665 14.5703 19.5Z" fill="#092a8e" />
                                        </svg>&nbsp;Cart
                                    </a></li>
                                    <li ng-if="!IsLogin"><a href="login.aspx" class="nav-link active">
                                        <svg width="25" height="25" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" transform="rotate(0 0 0)">
                                            <path fill-rule="evenodd" clip-rule="evenodd" d="M2.31641 3.25C1.90219 3.25 1.56641 3.58579 1.56641 4C1.56641 4.41421 1.90219 4.75 2.31641 4.75H3.49696C3.87082 4.75 4.18759 5.02534 4.23965 5.39556L5.49371 14.3133C5.6499 15.424 6.60021 16.25 7.72179 16.25L18.0664 16.25C18.4806 16.25 18.8164 15.9142 18.8164 15.5C18.8164 15.0858 18.4806 14.75 18.0664 14.75L7.72179 14.75C7.34793 14.75 7.03116 14.4747 6.9791 14.1044L6.85901 13.2505H17.7114C18.6969 13.2505 19.5678 12.6091 19.8601 11.668L21.7824 5.48032C21.8531 5.25268 21.8114 5.00499 21.6701 4.81305C21.5287 4.62112 21.3045 4.50781 21.0662 4.50781H5.51677C5.14728 3.75572 4.37455 3.25 3.49696 3.25H2.31641ZM5.84051 6.00781L6.64807 11.7505H17.7114C18.0399 11.7505 18.3302 11.5367 18.4277 11.223L20.0478 6.00781H5.84051Z" fill="#092a8e" />
                                            <path d="M7.78418 17.75C6.81768 17.75 6.03418 18.5335 6.03418 19.5C6.03418 20.4665 6.81768 21.25 7.78418 21.25C8.75068 21.25 9.53428 20.4665 9.53428 19.5C9.53428 18.5335 8.75068 17.75 7.78418 17.75Z" fill="#092a8e" />
                                            <path d="M14.5703 19.5C14.5703 18.5335 15.3538 17.75 16.3203 17.75C17.2868 17.75 18.0704 18.5335 18.0704 19.5C18.0704 20.4665 17.2869 21.25 16.3204 21.25C15.3539 21.25 14.5703 20.4665 14.5703 19.5Z" fill="#092a8e" />
                                        </svg>&nbsp;Login
                                    </a></li>
                                    <li ng-if="IsLogin" class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                            <svg width="25" height="25" viewBox="0 0 25 24" fill="none" xmlns="http://www.w3.org/2000/svg" transform="rotate(0 0 0)">
                                                <path fill-rule="evenodd" clip-rule="evenodd" d="M16.4337 6.35C16.4337 8.74 14.4937 10.69 12.0937 10.69L12.0837 10.68C9.69365 10.68 7.74365 8.73 7.74365 6.34C7.74365 3.95 9.70365 2 12.0937 2C14.4837 2 16.4337 3.96 16.4337 6.35ZM14.9337 6.34C14.9337 4.78 13.6637 3.5 12.0937 3.5C10.5337 3.5 9.25365 4.78 9.25365 6.34C9.25365 7.9 10.5337 9.18 12.0937 9.18C13.6537 9.18 14.9337 7.9 14.9337 6.34Z" fill="#343C54" />
                                                <path d="M12.0235 12.1895C14.6935 12.1895 16.7835 12.9395 18.2335 14.4195V14.4095C20.2801 16.4956 20.2739 19.2563 20.2735 19.4344L20.2735 19.4395C20.2635 19.8495 19.9335 20.1795 19.5235 20.1795H19.5135C19.0935 20.1695 18.7735 19.8295 18.7735 19.4195C18.7735 19.3695 18.7735 17.0895 17.1535 15.4495C15.9935 14.2795 14.2635 13.6795 12.0235 13.6795C9.78346 13.6795 8.05346 14.2795 6.89346 15.4495C5.27346 17.0995 5.27346 19.3995 5.27346 19.4195C5.27346 19.8295 4.94346 20.1795 4.53346 20.1795C4.17346 20.1995 3.77346 19.8595 3.77346 19.4495L3.77345 19.4448C3.77305 19.2771 3.76646 16.506 5.81346 14.4195C7.26346 12.9395 9.35346 12.1895 12.0235 12.1895Z" fill="#343C54" />
                                            </svg>
                                            &nbsp;{{LoginUserName}} <b
                                                class="caret"></b></a>
                                        <ul class="dropdown-menu">
                                            <li ng-if="LoginUserRole == 'User'"><a href="#">My Orders</a></li>
                                            <li ng-if="LoginUserRole == 'User'"><a href="address.aspx">Address</a></li>
                                            <li ng-click="logout()"><a href="#">Logout</a></li>
                                        </ul>
                                    </li>
                                    <%--<li class="callus-btn">
        <a href="tel:+919989196018">
            <button class="submit-btn">Call Us</button>
        </a>
    </li>--%>
                                </ul>
                            </div>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="alert {{alertClass}}" role="alert" ng-if="showAlert">
        {{alertMessage}} <i class="fa fa-times" aria-hidden="true" ng-click="closeAlert()"></i>
    </div>

    <div class="login">
        <div class="login_body row">
            <div class="login_body1 col-sm-12 col-md-6 col-xl-6">
                <div>
                    <h2>Looks like you're new here!</h2>
                    <h5 class="mb-4">Sign up with your email to get started</h5>
                    <button class="btn register_btn" onclick="redirectToLoginPage()">Back to login</button>
                </div>

            </div>
            <div class="login_body2 col-sm-12 col-md-6 col-xl-6">
                <div>
                    <form class="contact-inform form">
                        <div class="form-control">
                            <input type="text" ng-model="UserName" name="username" class="form-input" placeholder="none" required>
                            <label for="username" class="form-label">User Name<span>*</span></label>
                        </div>
                        <div class="form-control">
                            <input type="email" ng-model="UserEmail" name="email" class="form-input" placeholder="none" required>
                            <label for="email" class="form-label">Email<span>*</span></label>
                        </div>
                        <div class="form-control">
                            <input type="text" ng-model="UserPhone" name="phoneno" class="form-input" placeholder="none" required>
                            <label for="phoneno" class="form-label">Phone No.<span>*</span></label>
                        </div>
                        <button class="btn OTP_btn" ng-click="Register()">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer Area -->
    <footer id="footer" class="footer ">
        <!-- Footer Top -->
        <div class="footer-top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-12">
                        <div class="single-footer">
                            <h2>About Us</h2>
                            <p>Discover Authentic Flavors: Handpicked Cashews, Raw Honey, and Traditional Pickles</p>
                            <p>Indulge in the Finest Flavors, Delivered to Your Doorstep.s</p>
                            <p>Elevate Your Meals with Our Premium Range of Spices and Ingredients.</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-12">
                        <div class="single-footer f-link">
                            <h2>Quick Links</h2>
                            <ul>
                                <li>
                                    <a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i>Home</a>
                                </li>
                                <li>
                                    <a href="#Categories">
                                        <i class="fa fa-caret-right" aria-hidden="true"></i>Categories
                                    </a>
                                </li>
                                <li>
                                    <a href="#contact"><i class="fa fa-caret-right" aria-hidden="true"></i>Contact Us</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-12">
                        <div class="single-footer">
                            <h2>Open Hours</h2>
                            <ul class="time-sidual">
                                <li class="day">Monday - Friday <span>8.00-20.00</span></li>
                                <li class="day">Saturday <span>9.00-18.30</span></li>
                                <li class="day">Sunday <span>Closed</span></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-12">
                        <div class="single-footer">
                            <h2>Follow Us</h2>
                            <!-- Social -->
                            <ul class="social">
                                <li><a href="#"><i class="icofont-facebook"></i></a></li>
                                <li><a href="#"><i class="icofont-twitter"></i></a></li>
                                <li><a href="#"><i class="icofont-instagram"></i></a></li>
                            </ul>
                            <!-- End Social -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--/ End Footer Top -->
        <!-- Copyright -->
        <div class="copyright">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-12">
                        <div class="copyright-content">
                            <p>© Copyright 2025 | All Rights Reserved by  </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--/ End Copyright -->
    </footer>
    <!--/ End Footer Area -->



    <script>
        function redirectToLoginPage() {
            window.location.href = "/login.aspx"; // Replace with your desired URL
        }

        const inputs = document.querySelectorAll(".otp-input");

        inputs.forEach((input, index) => {
            input.addEventListener("input", () => {
                const value = input.value;
                if (value.length === 1 && index < inputs.length - 1) {
                    inputs[index + 1].focus();
                }
            });

            input.addEventListener("keydown", (e) => {
                if (e.key === "Backspace" && !input.value && index > 0) {
                    inputs[index - 1].focus();
                }
            });
        });
    </script>

    <!-- angular JS -->
    <script src="js/angular.min.js"></script>
    <script src="scripts/myScript.js"></script>
    <!-- jquery Min JS -->
    <script src="js/jquery.min.js"></script>
    <!-- jquery Migrate JS -->
    <script src="js/jquery-migrate-3.0.0.js"></script>
    <!-- jquery Ui JS -->
    <script src="js/jquery-ui.min.js"></script>
    <!-- Easing JS -->
    <script src="js/easing.js"></script>
    <!-- Color JS -->
    <script src="js/colors.js"></script>
    <!-- Popper JS -->
    <script src="js/popper.min.js"></script>
    <!-- Bootstrap Datepicker JS -->
    <script src="js/bootstrap-datepicker.js"></script>
    <!-- Jquery Nav JS -->
    <script src="js/jquery.nav.js"></script>
    <!-- Slicknav JS -->
    <script src="js/slicknav.min.js"></script>
    <!-- ScrollUp JS -->
    <script src="js/jquery.scrollUp.min.js"></script>
    <!-- Niceselect JS -->
    <script src="js/niceselect.js"></script>
    <!-- Tilt Jquery JS -->
    <script src="js/tilt.jquery.min.js"></script>
    <!-- Owl Carousel JS -->
    <script src="js/owl-carousel.js"></script>
    <!-- counterup JS -->
    <script src="js/jquery.counterup.min.js"></script>
    <!-- Steller JS -->
    <script src="js/steller.js"></script>
    <!-- Wow JS -->
    <script src="js/wow.min.js"></script>
    <!-- Magnific Popup JS -->
    <script src="js/jquery.magnific-popup.min.js"></script>
    <!-- Counter Up CDN JS -->
    <script src="http://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="js/bootstrap.min.js"></script>
    <!-- Main JS -->
    <script src="js/main.js"></script>
    <script src="js/b.js"></script>
    <script src="js/c.js"></script>
    <script src="js/jquery.sticky.js"></script>
    <script src="js/sidenav.js"></script>
</body>

</html>
