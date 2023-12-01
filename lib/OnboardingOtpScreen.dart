// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class OnBoardingOtpScreen extends StatefulWidget {
//   const OnBoardingOtpScreen(
//       {Key? key,
//       required this.mobileNo,
//       required this.userId,
//       required this.email,
//       required this.password,
//       this.userProfileBean,
//       this.registrationBean,
//       this.option = OtpOption.PHONE,
//       this.otpVerifyPurpose = OtpVerifyPurpose.FIRSTTIMELOGIN})
//       : super(key: key);
//   final String mobileNo;
//   final String userId;
//   final String email;
//   final String password;
// // For Login
//   final UserProfileBean? userProfileBean;
// // For Registration
//   final RegistrationBean? registrationBean;
//   final OtpOption option;

//   final OtpVerifyPurpose otpVerifyPurpose;
//   @override
//   State<OnBoardingOtpScreen> createState() => _OnBoardingOtpScreenState();
// }

// class _OnBoardingOtpScreenState extends State<OnBoardingOtpScreen> {
//   late RegistrationBloc _registrationBloc;
//   late UserBloc _userBloc;
//   late OTPBloc _otpBloc;
//   late SendOTPBean _sendOTPBean;
//   SentOTPBean? _sentOTPBean;
//   late String errorText;
//   String? activationErrorText;
//   late OtpFieldController _otpFieldController;
//   bool countingDown = false;

//   @override
//   void initState() {
//     super.initState();
//     initApp();
//   }

//   initApp() {
//     errorText = "";
//     _registrationBloc = RegistrationBloc();
//     _otpBloc = OTPBloc();
//     _userBloc = UserBloc();
//     _otpFieldController = OtpFieldController(onVerify: (otpValue) {
//       verifyOTP(otpValue);
//     });
//     _sendOTPBean = SendOTPBean(
//         mobileNo: widget.mobileNo,
//         userId: widget.userId,
//         option: widget.option.optionName,
//         email: widget.email);
//     if (kReleaseMode) {
//       WidgetsBinding.instance.addPostFrameCallback((_) async {
//         _initSendOtp();
//       });
//     }
//   }

//   _initSendOtp() async {
//     final loadingDialog = ViewBloc.showLoadingDialog(context,
//         "${mtl("otpSending")}${StringUtil.maskString(widget.mobileNo)}");
//     dynamic result = await _otpBloc.sendOtp(_sendOTPBean);
//     await Future.delayed(const Duration(milliseconds: 80));
//     loadingDialog.dismiss(() {});
// // If OTP sent successful, it will return SentOTPBean else it&#39;s a error message

//     if (result.runtimeType is SentOTPBean) {
//       _sentOTPBean = result;
//       setState(() {
//         countingDown = true;
//         errorText = "";
//       });
//     } else {
//       setState(() {
//         errorText = result.toString();
//       });
//     }
//   }

//   Future<void> verifyOTP(String otpValue) async {
//     bool verifyResult = true;

//     if (kReleaseMode) {
//       final loadingDialog =
//           ViewBloc.showLoadingDialog(context, mtl("otpVerifying"));
//       verifyResult = await _otpBloc.verifyOtp(
//         otpValue,
//         _sendOTPBean.userId,
//         _sentOTPBean ??
//             SentOTPBean(
//                 otpRefNo: "", resendIntervalInMins: 0, otpMaxReattempt: 0),
//         context,
//         (errMsg) {
//           setState(() {
//             errorText = errMsg;
//           });
//         },
//       );
//       await Future.delayed(const Duration(milliseconds: 2000));
//       loadingDialog.dismiss(() {});
//     }

//     // Extracted methods for success and failure
//     if (handleVerificationResult(verifyResult)) {
//       await onVerificationSuccess();
//     } else {
//       onVerificationFailure();
//     }
//   }

//   bool handleVerificationResult(bool verifyResult) {
//     // Handle the verification result logic here if needed.
//     // You can add additional logic before returning the result.
//     return verifyResult || kDebugMode;
//   }

//   Future<void> onVerificationSuccess() async {
//     // Success logic after OTP verification
//     await ViewBloc.showSuccessDialogForAwhile(context,
//         successMessage: mtl("otpVerified"));

//     // After verification success, different process based on purpose
//     // if (widget.otpVerifyPurpose.verifyPurposeName ==
//     //     OtpVerifyPurpose.REGISTRATION.verifyPurposeName) {
//     //   processForRegistration();
//     // } else if (widget.otpVerifyPurpose.verifyPurposeName ==
//     //     OtpVerifyPurpose.FIRSTTIMELOGIN.verifyPurposeName) {
//     //   processForFirstTimeLogin();
//     // } else if (widget.otpVerifyPurpose.verifyPurposeName ==
//     //     OtpVerifyPurpose.CHANGEPASSWORD.verifyPurposeName) {
//     //   processForChangePassword();
//     // } else {
//     //   processForResetPassword();
//     // }
//   }

//   void onVerificationFailure() {
//     // Verification failed, delete all the text field and re-enter
//     _otpFieldController.verifyUnsuccessful();
//   }

//   Future<void> processForRegistration() async {
//     bool isCustomer = widget.registrationBean?.isCustomer ?? false;
//     if (!isCustomer) {
// // final result = await _registrationBloc.sendValidationEmail(_sendOTPBean.userId, _sendOTPBean.email ?? "", context);

// // if(result){
// // final completed = await ViewBloc.showAlertDialog(
// // context,
// // title: "${mtl("verifyEmailSuccess")} ${_sendOTPBean.email ?? ""}\n${mtl("verifyEmailSuccess2")}",
// // illustration: loadSvg("pictogram/email.svg", color: null),
// // positiveText: mtl("okButton"),
// // onPressedPositive: (){
// // NUINavigator.popWithResult(context, true);
// // }
// // );
// // if(completed){
// // NUINavigator.popAllAndPush(context, const BaseScreen());
// // }
// // return;
// // }else{
// // await Future.delayed(const Duration(milliseconds: 80));
// // // NUINavigator.popAllAndPush(context, const BaseScreen());
// // return;
// // }
// // }
// // else{
// // final result = await _registrationBloc.accountActivation(_sendOTPBean.userId, _sendOTPBean.email ?? "", context);
// // if(result){
// // await Future.delayed(const Duration(milliseconds: 80));
// // // NUINavigator.push(context, SuccessScreen(
// // // title: mtl("regisSuccess"),
// // // description: mtl("regisSuccessDesc"),
// // // illus: loadSvg("pictogram/correct_tick.svg", color: null),
// // // popAll: true
// // // ));
// // }else{
// // // Account activation failed, redirect to base screen
// // await Future.delayed(const Duration(milliseconds: 80));
// // // NUINavigator.popAllAndPush(context, const BaseScreen());
// // }
// // }
//     }

//     Future<void> processForFirstTimeLogin() async {
// //First time login, user will only be saved once OTP success
//       UserProfileBean? userProfileBean = widget.userProfileBean;
//       if (userProfileBean != null) {
//         try {
//           await _userBloc.saveUserToDB(userProfileBean);
//           await _userBloc.saveToken(
//               userProfileBean.loginAccessToken?.accessToken ?? "",
//               userProfileBean.loginAccessToken?.refreshToken ?? "",
//               userProfileBean.loginAccessToken?.expiresIn ?? 0);
//           _userBloc.changeIPushUserId();
//           await Future.delayed(const Duration(milliseconds: 80));
// // await ViewBloc.showSuccessDialogForAwhile(context, successMessage: mtl("loginSuccessDialog"));
// // NUINavigator.push(context, SuccessScreen(title: mtl("verifySuccess"), popAll: true));
//         } catch (e) {
// // logNUI("Otp Screen", "First-time Login Error : $e");
// // await ViewBloc.showFailedDialogForAwhile(context, errorMessage: mtl("loginUnsuccessfulDialog"),);
// // NUINavigator.popAllAndPush(context, const BaseScreen());
//         }
//       }
//     }

//     Future<void> processForResetPassword() async {
// // NUINavigator.popAndPush(context, NewPasswordScreen(isFirstStep: false, userId: widget.userId,));
//     }
//     Future<void> processForChangePassword() async {
// // NUINavigator.popAndPush(context, NewPasswordScreen(isFirstStep: false, userId: widget.userId,
// // inAppChangePassword: true));
//     }
//     Future<bool?> showTerminateDialog() async {
// // final result = await ViewBloc.showAlertDialog(
// // context,
// // title: "${mtl("otpTerminateDialog")} ${widget.otpVerifyPurpose.name} ${mtl("otpTerminateDialog2")}",
// // positiveText: mtl("yes"),
// // onPressedPositive: (){
// // NUINavigator.popWithResult(context, true);
// // },
// // negativeText: mtl("no"),
// // onPressedNegative: (){
// // NUINavigator.popWithResult(context, false);
// // }
// // );
//       return null;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         var a;
//         return a;
//       },
//       child: AnnotatedRegion<SystemUiOverlayStyle>(
//         value: SystemUiOverlayStyle.dark,
//         child: Scaffold(
//           backgroundColor: Colors.white,
//           body: Column(
//             children: [
// // BackToolbar(
// // title: Text(mtl("verification"), style: uiTheme.font(size: 18, colorPair: accentBlue), textAlign:
// // TextAlign.center,),
// // withShadow: true,
// // withStatusBar: true,
// // backButton: true,

// // backIcon: Icon(Icons.arrow_back_rounded, color: uiTheme.color(accentBlue)),
// // onPressed: () async {
// // final result = await showTerminateDialog();
// // if(result){NUINavigator.pop(context);}
// // },
// // ),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Padding(
//                     padding: const EdgeInsets.all(20),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
// // Text("${widget.otpVerifyPurpose.verifyPurposeName} ${mtl("verification")}", style: uiTheme.font(size:
// // 18, colorPair: darkBlue),),
// // const Divider(height: 16),
// // Text(mtl("otpDesc"), style: uiTheme.font(size: 16, colorPair: greyTwo)),
// // const Divider(height: 30),
// // Text(isNullOrEmpty(errorText) ? "" : errorText, style: uiTheme.font(size: 14, colorPair: red)),
// // const Divider(height: 8),
// // OtpField(otpFieldController: _otpFieldController,),
//                         const Divider(height: 15),
// // Visibility(
// // visible: countingDown,
// // child: Text("OTP has been sent to ${StringUtil.maskString(widget.mobileNo)}.", style:
// // uiTheme.font(size: 14, colorPair: darkBlue))
// // ),
//                         const Divider(height: 30),
// // Align(
// // alignment: Alignment.center,
// // child: RichText(
// // textAlign: TextAlign.center,
// // text: TextSpan(
// // text: &#39;${mtl("otpDidNotGetCode")} &#39;,
// // style: uiTheme.font(size: 18, colorPair: darkBlue),
// // children: [
// // TextSpan(
// // text: mtl("otpResend"),
// // style: uiTheme.font(size: 18, color: countingDown ? uiTheme.color(accentBlue).withOpacity(0.3) :
// // uiTheme.color(accentBlue)),
// // recognizer: TapGestureRecognizer()
// // ..onTap = countingDown ? null : ()async{
// // await _initSendOtp();
// // },
// // )
// // ],
// // ),
// // ),
// // ),
//                         const Divider(height: 8),
//                         Visibility(
//                           visible: countingDown,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: const [
// // Text("Resend in ", style: uiTheme.font(size: 14, colorPair: darkBlue)),
// // CustomTimer(
// // seconds: 305,
// // onFinished: (){
// // countingDown = false;
// // setState(() {});
// // },),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
