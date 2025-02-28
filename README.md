# **CRB Kitchen for Linux**

## Information

This kitchen only currently supports debian based linux distributions and so modifications to the code may be required for other distributions.

## Prepare:

Update Dependencies:

    $ sudo apt update && sudo apt upgrade -y
    $ sudo apt install android-sdk-libsparse-utils simg2img -y

Download The Kitchen:

	$ git clone -b stable https://github.com/samsungexynos850/CRB-Linux.git
	$ cd CRB-Linux

How To Use:

	$ ./start.sh

- This will list all of the available options within CRB
- It is recommended to first Create a New Project
- Then Unpack any images
- Edit the data
- Then Repack those images

Any Bugs or Questions send me a message [here](https://t.me/thomas_turner36)


