# Adding Xamarin Test Cloud to your Jenkins Build

[Xamarin Test Cloud](https://www.xamarin.com/testcloud) is a service for executing automated mobile app tests against thousands of real, physical devices.  Using Xamarin Test Cloud, you can integrate automated testing directly into your CI/CD pipeline to ensure that _every_ build of your app is tested.

Jenkins is an extremely popular CI/CD delivery system, especially in the mobile development community.  It is extremely versitile, and can be (pretty much) configured to do whatever you want it to.  With a little bit of scripting knowledge, extending Jenkins is a breeze.

The purpose of this tutorial is to give a quick example of how to add Xamarin Test Cloud to your existing Jenkins configuration.  We will cover this for the 3 frameworks that Xamarin Test Cloud supports.  Those frameworks are Calabash, UITest, and Appium.  As support for additional frameworks are added, this repo will be updated.

###Notes: 

Each framework requires installation/configuration in order to submit test to Xamarin Test Cloud.  While this document is not intended to outlines step-by-step exactly how to do this, we will do our best to identify "gotchas" that will make it easier to get your Jenkins configured.

Also, I targeted this particular documents at Mac OS X based build hosts, since this is what most mobile app dev shops using Jenkins for builds have configured their build hosts this way (and, Mac OS X is a requirement for compiling iOS apps)

This guide assumes:

- [x] An installed and configured Jenkins environment.
- [x] You have installed the [Parameterized Build](https://wiki.jenkins-ci.org/display/JENKINS/Parameterized+Build) Jenkins Plugin.
- [x] You have already configured your automated builds of your app, and have access to all of the necessary artifacts to submit a job in Xamarin Test Cloud (i.e. IPA/APK, DYSM, test scripts, etc.).
- [x] You have already created a Xamarin Test Cloud Account (you will need an API key).  If you have not, please visit [https://xamarin.com/testcloud](https://xamarin.com/testcloud) to start a trial.
- [x] You can manually submit a job to Xamarin Test Cloud through `terminal` on the build agent (more on in this in the Framework specific guides).

### Let's get Started!!!

Great, now that we've covered all the prerequisites, let's get to the good stuff

- Get started with [Calabash](calabash/)
- Get started with [UITest](uitest/README.md)
- Get started with [Appium](appium/README.md)
