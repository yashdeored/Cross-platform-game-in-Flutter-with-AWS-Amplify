<h2>Windows</h2>
Downloading Flutter SDK
Download the zip folder at the Flutter Website. 
Extract the Flutter SDK to a folder called development at your Desktop.
The file folder step above is just a recommendation and this reference will be used through the workshop. You can move it to any other folder as well. Just be sure to keep a reference to where your Flutter folder is extracted.

Adding Flutter to the Path
Go to the extracted Flutter folder and copy the path of it.
You can copy it either with a right click to the folder and selecting "Copy as Path" option or

![image](https://github.com/yashdeored/Cross-platform-game-in-Flutter-with-AWS-Amplify/assets/152061059/b3706267-d798-450e-81de-446f929b2d05)

Click on the navigation bar on the top of the window and copy the path text from there. Flutter Path 1
Click on the Windows icon on the bottom left and search for Environment Variables at the start page, select the Edit Environment variables for your account option. Flutter Path 2

![image](https://github.com/yashdeored/Cross-platform-game-in-Flutter-with-AWS-Amplify/assets/152061059/b65ea293-6047-4260-ba5d-28fa3c994c8e)

It should open a window with Advanced tab selected at System Properties, click on the Environment Variables... button. Flutter Path 3

![image](https://github.com/yashdeored/Cross-platform-game-in-Flutter-with-AWS-Amplify/assets/152061059/22af07b7-8b78-46bf-9a66-85acea52bc8e)

On the opened window, at to System variables section, find Path and double click on it. Flutter Path 4

![image](https://github.com/yashdeored/Cross-platform-game-in-Flutter-with-AWS-Amplify/assets/152061059/10d92150-39b1-4a24-9321-7629e04db789)

Add a new field by clicking the New button on the right side and paste the path you copied earlier. Flutter Path 5

![image](https://github.com/yashdeored/Cross-platform-game-in-Flutter-with-AWS-Amplify/assets/152061059/35741b91-1b22-4007-9065-56c6c3d577da)

Save and close all the windows
Close any Command Prompt as well
Then open a fresh Command Prompt and write the following to test:
flutter doctor
<h1> VS Code Installation: </h1>
Installing VSCode
Go to the VSCode <a href="https://code.visualstudio.com/download">download page</a>  and download the User Installer according to your system.
Run the downloaded installer and follow the steps if there is any. This should take around a minute.

<h1>Common Flutter Errors while installing: </h1>

Flutter Setup Health Check
Easiest way to check if everything is alright with Flutter setup is to run flutter doctor -v over your Terminal or CMD on macOS or Windows respectively.

A successful check should not have any issues, it might look like the following. If you have any trouble with the issues with your installation, check the section below for possible fixes.

You might see errors around Android Studio, Android Toolchain and Xcode. Do not worry about them. You just need to have Google Chrome to run the project.

```
msalihg ~ % flutter doctor -v      
[✓] Flutter (Channel stable, 3.13.9, on macOS 13.6 22G120 darwin-arm64, locale
    en-DE)
    • Flutter version 3.13.9 on channel stable at
      /Users/<username>/Desktop/development/flutter
    • Upstream repository https://github.com/flutter/flutter.git
    • Framework revision d211f42860 (2 weeks ago), 2023-10-25 13:42:25 -0700
    • Engine revision 0545f8705d
    • Dart version 3.1.5
    • DevTools version 2.25.0

[✓] Chrome - develop for the web
    • Chrome at /Applications/Google Chrome.app/Contents/MacOS/Google Chrome

[✓] VS Code (version 1.84.1)
    • VS Code at /Applications/Visual Studio Code.app/Contents
    • Flutter extension version 3.76.0

[✓] Connected device (3 available)
    • Chrome (web)           • chrome                               •
      web-javascript • Google Chrome 119.0.6045.123

[✓] Network resources
    • All expected network resources are available.
Common Flutter installation problems and their fixes
Android Licenses not accepted
Android toolchain - develop for Android devices (Android SDK 26.0.2) ! Some Android licenses not accepted. To resolve this, run: flutter doctor --android-licenses

```
Fix:

Open your terminal
Write the following to terminal

```
flutter doctor --android-licenses
```

Type y to accept the licenses each time you are prompted

<h2>CocoaPods not installed.</h2>
CocoaPods not installed. CocoaPods is used to retrieve the iOS and macOS platform side's plugin code that responds to your plugin usage on the Dart side.

For fixing this, you need to install CocoaPods.

Pre-installation check: If you are on M1 Mac run the following on your terminal:

```
sudo gem uninstall ffi && sudo gem install ffi -- --enable-libffi-alloc
```

Run the following on your terminal to install CocoaPods:

```
sudo gem install cocoapods
```

<h2>Unable to find bundled Java version</h2>

Android development and Flutter development rely on Java version 8. Even though the Java Development Kit (JDK) and Java Runtime Environment (JRE) are bundled with Android Studio, sometimes Flutter is having hard time to find these references.

Delete the previous versions of the Android Studios
If you have upgraded your Android Studio to the newer versions, be sure to remove the previous versions. The Flutter ecosystem might think that it is still using the earlier versions of the studio.

For Windows go to C:\Program Files\Android\Android Studio directory and check if older Android Studio folders exist and remove them if there are any.
For macOS go to the Applications folder and remove any earlier configuration and application files.
Add Java to the Path
If you see a message like the following, you need to fix your problem with Java installation.

Unable to determine bundled Java version. • Try updating or re-installing Android Studio.

One of the common ways of this problem to occur is that it is missing the JAVA_HOME property on your computer. If you are sure that you installed the Android Studio's latest stable version properly you can fix it like the following.

Small Hack macOS Only

As per a bug from the Flutter  (it seems to be closed now though), copy the /Applications/Android Studio Preview.app/Contents/jre/Contents to /Applications/Android Studio Preview.app/Contents/jre/jdk/Contents

Add the JDK from Android Studio to the Path (Recommended)

Open your terminal and write the following to learn about your terminal type:

```
echo $SHELL
```

If you are using Bash, write

```
open ~/.bash_profile # or open ~/.bashrc
```

If you using Z shell, write:

```
open ~/.zshrc
```

Paste the following in to the file as a new line:

```
export JAVA_HOME=/Applications/Android\ Studio.app/Contents/jre/Contents/Home/
```

Close all the terminals and open a new one
Then write the following to test:

```
flutter doctor
```

Install the Java version by yourself

Install the Java version by using Homebrew

```
brew tap adoptopenjdk/openjdk
brew install -cask adoptopenjdk8
```

If you are using Android Studio as your IDE, go to your IDE Settings/Preferences and update any JDK Location that is required for your setup.
