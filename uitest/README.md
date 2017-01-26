# Adding a UITest Test tor your Jenkins Build

### Overview

This guide represents _one_ way to configure Jenkins to submit your UITests tests to Xamarin Test Cloud.  There are infinite possible ways to do this, so please take this simply as a guideline, and modify to suite your team's needs.

Also, please make sure that you have already completed all of the dependencies noted on the main readme.  If not, please go back and make sure you have all of these dependencies configured by clicking [here](../README.md#notes).


### Prerequisites

This guide assumes that you can already submit Xamarin Test Cloud jobs via your `terminal`.  If you haven't already configured your environment to be able to submit a UITest test to Xamarin Test Cloud from your OS X build slave, please visit [https://developer.xamarin.com/guides/testcloud/uitest/cheatsheet/#Submitting_Tests_To_Xamarin_Test_Cloud](https://developer.xamarin.com/guides/testcloud/uitest/cheatsheet/#Submitting_Tests_To_Xamarin_Test_Cloud) to configure your slave. 

### Parameter Dictionary

This script requires several parameters to be passed from your build.  In this example, we will use the Parameterized Build plugin for Jenkins do define the following parameters

> Note: This script expects several parameters to be provided.  In this example, we are providing all of those via the [Parameterized Build](https://wiki.jenkins-ci.org/display/JENKINS/Parameterized+Build) plugin.  Alternatively, values can be specified in places like Jenkins Environment Varables.  Please follow your team's best practices when deciding where/how to define all of the values that Xamarin Test Cloud requires.

| Paramenter | Description | Example |
| --- | --- | --- |
| `XTC_UPLOADER_PATH` | Path to the Xamarin.UITest (test-cloud.exe) NuGet package | packages/Xamarin.UITest.2.0.0/tools/test-cloud.exe |
| `XTC_TEST_DIRECTORY` | Location of the test project dlls | [TEST_PROJECT_NAME]/bin/"$CONFIGURATION" |
| `XTC_APP_FILE` | Location of your compiled app (.IPA for iOS, .APK for Android) | path/to/your/app.apk
| `XTC_APP_NAME` | The name of your app| 'Xamarin CRM' |
| `XTC_API_KEY` | The API key for Xamarin Test Cloud | 92cdb777d02122870e7b9f834686fc44 | 
| `XTC_SERIES` | The Name of the test series that you want these test results to be organized in | master | 
| `XTC_LOCALE` | The Locale that you want your device to be configured as for the duration of the test run | en_US | 
| `XTC_DEVICE_KEY` | The Device Set Key from Xamarin Test Cloud (these will differ between iOS/Android) | 7c6ca13d | 
| `XTC_USER` | The e-mail address of the user submitting the test | monoDeveloper@xamarin.com | 
###Optional Parameters

| Paramenter | Description | Example |
| --- | --- | --- |
| `XTC_DYSM_PATH` | Path to the generated DSYM file (iOS-only) | /bin/iPhone/Debug/build-iphone9.2-10.2/MyDrivingiOS.app.dSYM |
| `XTC_NUNIT_XML` | Access the NUnit xml report of your test run  | --nunit-xml reportFile.xml |
| `XTC_MONO_PATH` | Mono (OSX only) is required to upload from Mac OSX) | /Library/Frameworks/Mono.framework/Versions/Current/bin 


### Steps to Configure

#####Step 1. Check the ```This project is parameterized``` box and set the appropriate parameters

> See [Parameter Dictionary](#parameter-dictionary) above for a list of all the parameters, and example values

![](img/buildWithParam.png?raw=true)

Here we are setting up a Choice Parameter for various language/country codes that are important to our app.

![](img/choiceParameter.png?raw=true)

A String Parameter will have a single static string for a location that we expect not to change. 

![](img/stringParam.png?raw=true)


#####Step 2. Add a 'Execute shell' build step to your existing (iOS/Android) Jenkins build configuration.

![](img/addBuildStep.png?raw=true)

#####Step 3. Add shell code to newly created build step

Paste the contents of [uitestXTC.sh](uitestXTC.sh) into the edit text box. Please note that [uitestXTC.sh](uitestXTC.sh) is slightly different if your build server is running Windows vs OSX, make sure you uncomment the command for your OS.

![](img/macVsWindows.png?raw=true)


#####Step 4. Trigger a build manually and verfiy that the app succesfully uploaded to Xamarin Test Cloud

You can validate that this occured succesfully by looking at the Jenkins Log

Additionally you can now view the pending run in the respective Test Cloud app page in your https://testcloud.xamarin.com/ 



















