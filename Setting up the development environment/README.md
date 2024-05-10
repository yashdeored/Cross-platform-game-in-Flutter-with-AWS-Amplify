<h2>Create an AWS Account</h2>
<p>To create an AWS account head over to the official webpage and register by putting your name, email, payment method. <a href="https://youtu.be/sNByVUDvGTw?si=TDlpZ3EOyz7oUgcE">For an entire video click me</a></p>
<h2>Install Amplify CLI</h2>
Install cURL if you have not yet from the official website 
Run the following commands to install the Amplify CLI
<br>
Mac and Linux:

```
curl -sL https://aws-amplify.github.io/amplify-cli/install | bash && $SHELL
```

Windows:

```
curl -sL https://aws-amplify.github.io/amplify-cli/install-win -o install.cmd && install.cmd
```

<h2>Configure Amplify</h2>
The Amplify CLI requires an IAM user with appropriate policy permissions in order to interact with our AWS account. The amplify configure command will walk us through the process of creating a new user in our AWS account and store the user profile credentials in our local environment. Future commands that we run with the CLI will utilize these credentials for us to perform the actions we request.

```
amplify configure
```

amplify configure will ask you to sign into the AWS Console.
Once you're signed in, Amplify CLI will ask you to create an IAM user. Select the region of your choice and follow the instructions.

```
Specify the AWS Region
? region:  # Your preferred region
Follow the instructions at
https://docs.amplify.aws/cli/start/install/#configure-the-amplify-cli

to complete the user creation in the AWS console
https://console.aws.amazon.com/iamv2/home#/users/create
```

<h2>Creating an IAM User</h2>
Navigate to the IAM User creation page  if it's not already open.

Enter a User name and select Next. You can name the user anything but we'll call it "amplify-dev".

![image](https://github.com/yashdeored/Cross-platform-game-in-Flutter-with-AWS-Amplify/assets/152061059/77491709-4e24-44f7-b80e-5457b020c3c4)

Select Attach policies directly and select AdministratorAccess-Amplify as the Permissions policy. Select Next.

![image](https://github.com/yashdeored/Cross-platform-game-in-Flutter-with-AWS-Amplify/assets/152061059/4f45c230-8a7f-46f6-a530-6119fdcc1667)

On the Review page, check that everything looks good and select Create user.

![image](https://github.com/yashdeored/Cross-platform-game-in-Flutter-with-AWS-Amplify/assets/152061059/03903d08-0718-4c75-84c7-f20082fce9af)

This will redirect to the users list page. Select the user you just created.

![image](https://github.com/yashdeored/Cross-platform-game-in-Flutter-with-AWS-Amplify/assets/152061059/d1ec2f1b-b4cb-40c8-b719-c5d3079028f3)

On the user details page, navigate to the Security credentials tab, scroll down to Access keys and select Create access keys.

![image](https://github.com/yashdeored/Cross-platform-game-in-Flutter-with-AWS-Amplify/assets/152061059/300d0ec3-ba77-472a-8532-ebf77892fb77)

On the next page, select Command Line Interface, acknowledge the warning, and select Next.

![image](https://github.com/yashdeored/Cross-platform-game-in-Flutter-with-AWS-Amplify/assets/152061059/d23b5872-74c5-452f-8f56-f5f36a0618b8)

On the next page select Create access key. Create access key

![image](https://github.com/yashdeored/Cross-platform-game-in-Flutter-with-AWS-Amplify/assets/152061059/a3aeffc8-81b7-4454-909e-22bca7a4cef4)

You’ll then see a page with the access keys for the user. Use the copy icon to copy these values to your clipboard, select the Done button, then return to the Amplify CLI.

![image](https://github.com/yashdeored/Cross-platform-game-in-Flutter-with-AWS-Amplify/assets/152061059/44434b0e-9504-4456-bd1c-de2db0315eef)

Entering Access Key and Secret Access Key
Enter the values you just copied into the corresponding CLI prompts. Use AmplifyWorkshop as a profile name

```
Enter the access key of the newly created user:
? accessKeyId:  # YOUR_ACCESS_KEY_ID
? secretAccessKey:  # YOUR_SECRET_ACCESS_KEY
This would update/create the AWS Profile in your local machine
? Profile Name:  # (default)
```

Successfully set up the new user.

Apple Silicon devices (M1 and M2 chips) only
Apple will recommend users to install Rosetta 2 with any application that requires Rosetta. However if you have not installed it yet, for using Flutter on Apple Silicon device you need to have Rosetta installed, you can install it by running the following:

```
softwareupdate --install-rosetta
```

If you have sudo access on your computer you can also run:

```
sudo softwareupdate --install-rosetta --aggree-to-license
```
