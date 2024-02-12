import 'package:flutter/material.dart';
import 'package:karrayy_s_application4/core/app_export.dart';
import 'package:karrayy_s_application4/widgets/app_bar/appbar_leading_image.dart';
import 'package:karrayy_s_application4/widgets/app_bar/appbar_title.dart';
import 'package:karrayy_s_application4/widgets/app_bar/appbar_trailing_image.dart';
import 'package:karrayy_s_application4/widgets/app_bar/custom_app_bar.dart';
import 'package:karrayy_s_application4/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class K0Screen extends StatelessWidget {
  K0Screen({Key? key}) : super(key: key);

  TextEditingController sendMessageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  SizedBox(height: 50.v, width: double.maxFinite),
                  Spacer()
                ])),
            bottomNavigationBar: _buildSendAMessagePrompt(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 27.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgBtconBack,
            margin: EdgeInsets.only(left: 20.h, top: 18.v, bottom: 18.v),
            onTap: () {
              onTapBtconBack(context);
            }),
        centerTitle: true,
        title: AppbarTitle(text: "강남스팟"),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgFrame5344,
              margin: EdgeInsets.symmetric(horizontal: 19.h, vertical: 18.v))
        ],
        styleType: Style.bgFill);
  }

  /// Section Widget
  Widget _buildSendAMessagePrompt(BuildContext context) {
    return Container(
        decoration: AppDecoration.fillGray,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(left: 4.h, right: 16.h),
                  decoration: AppDecoration.fillGray,
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgPlus,
                        height: 40.adaptSize,
                        width: 40.adaptSize,
                        margin: EdgeInsets.symmetric(vertical: 4.v)),
                    Expanded(
                        child: CustomTextFormField(
                            controller: sendMessageController,
                            hintText: "메세지 보내기",
                            textInputAction: TextInputAction.done,
                            suffix: Container(
                                padding: EdgeInsets.all(7.h),
                                margin:
                                    EdgeInsets.fromLTRB(30.h, 12.v, 12.h, 12.v),
                                decoration: BoxDecoration(
                                    color: appTheme.gray800,
                                    borderRadius: BorderRadius.circular(12.h)),
                                child: CustomImageView(
                                    imagePath: ImageConstant.imgArrowright,
                                    height: 10.adaptSize,
                                    width: 10.adaptSize)),
                            suffixConstraints: BoxConstraints(maxHeight: 48.v)))
                  ])),
              Container(
                  height: 24.v,
                  width: double.maxFinite,
                  margin: EdgeInsets.only(top: 8.v),
                  decoration: BoxDecoration(color: appTheme.gray900))
            ]));
  }

  /// Navigates back to the previous screen.
  onTapBtconBack(BuildContext context) {
    Navigator.pop(context);
  }
}
