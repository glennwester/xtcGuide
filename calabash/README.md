# Adding a Calabash Test tor your Jenkins Build

### Overview

This guide represents _one_ way to configure Jenkins to submit your Calabash tests to Xamarin Test Cloud.  There are infinite possible ways to do this, so please take this simply as a guideline, and modify to suite your team's needs.

Also, please make sure that you have already completed all of the dependencies noted on the main readme.  If not, please go back and make sure you have all of these dependencies configured by clicking [here](../README.md#notes).


### Prerequisites

This guide assumes that you can already submit Xamarin Test Cloud jobs via your `terminal`.  If you haven't already configured your environment to be able to submit a Calabash test to Xamarin Test Cloud from your OS X build slave, please visit [https://developer.xamarin.com/guides/testcloud/calabash/configuring/osx/](https://developer.xamarin.com/guides/testcloud/calabash/configuring/osx/) to configure your slave. 

### Parameter Dictionary

This script requires several parameters to be passed from your build.  In this example, we will use the Parameterized Build plugin for Jenkins do define the following parameters

> Note: This script expects several parameters to be provided.  In this example, we are providing all of those via the [Parameterized Build](https://wiki.jenkins-ci.org/display/JENKINS/Parameterized+Build) plugin.  Alternatively, values can be specified in places like Jenkins Environment Varables.  Please follow your team's best practices when deciding where/how to define all of the values that Xamarin Test Cloud requires.

| Paramenter | Description | Example |
| --- | --- | --- |
| `XTC_APK_FILE` | The path to the IPA/APK file to run your tests against | /path/to/com.company.app.apk | 
| `XTC_API_KEY` | The API key for Xamarin Test Cloud | Example | 
| `XTC_DEVICE_KEY` | The Device Set Key from Xamarin Test Cloud | Example | 
| `XTC_SERIES` | The Name of the test series that you want these test results to be organized in | master | 
| `XTC_LOCALE` | The Locale that you want your device to be configured as for the duration of the test run | en_US | 
| `XTC_USER` | The e-mail address of the user submitting the test | user@domain.com | 

### Steps to Configure

Step 1: Add a new Build Step to your build

![]("Adding a new build step")

Step 2:  Configure your Parameters

![]("Adding a new parameter")

> See [Parameter Dictionary](#parameter-dictionary) above for a list of all the parameters, and example values

Step 3: Include the build script

![]("Adding the build script")

Copy/Paste the [calabashXTC.sh](calabashXTC.sh) script
