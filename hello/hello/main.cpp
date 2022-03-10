//Evan Sinasac - 1081418
//INFO6025 Configuration and Deployment (Project 3)
//main.cpp description:
//			        The main purpose of project 3 is to create a simple exe (this program) that reads and displays the contents of hello.txt
//					Then there is the installer script, installer_script.nsi, which creates an installer, hello_installer.exe, which
//					creates a folder named "Hello" on the dektop which contains hello.exe (this program) and hello.txt.
//					The installer also creates an uninstaller, hello_uninstaller.exe, which cleans itself, hello.exe, hello.txt and the Hello folder

#include <stdlib.h>
#include <stdio.h>
#include <iostream>
#include <string>
#include <fstream>

int main(int argc, char** argv)
{
	std::string fileName = "hello.txt";

	std::ifstream theFile(fileName);

	if (!theFile.is_open())
	{
		fprintf(stderr, "Could not open hello.txt\n");
		system("pause");
		return -1;
	}

	std::string nextToken;

	while (theFile >> nextToken)
	{
		std::cout << nextToken << std::endl;
	}


	theFile.close();
	system("pause");
	//char temp;
	//getchar();
	return 0;
} //end of main