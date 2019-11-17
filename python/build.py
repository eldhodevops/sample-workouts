#import shutil
import subprocess
import sys

from versionfolder.__version__ import __version__

if __name__ == "__main__":

    x = None

    try:
       x = sys.argv[1].upper()
    except:
        pass
    #print raw_input('Enter the name you wish to build Jenkins or other')
    x = input('Enter the name you wish to build Jenkins or other\n')
    if not x in ["Jenkins"]:
        print("Invalid name")
        exit()

    with open("Dockerfile.template") as f:
        template = f.read()
    template = template.replace("{VERSION}", __version__)

    if x == "Jenkins":
        template = template.replace("{IMAGE}", "jenkins:2.60.1")
    else:
        print ('Invalid name')

    with open("Dockerfile", "w") as f:
        f.write(template)
    process = subprocess.Popen(["docker", "build", "--tag",
                                "eldhodoc/jenkins:{}-{}".format(__version__, x),
                                "."])
    process.wait()
    process = subprocess.Popen(["docker", "push", "--tag",
                                "eldhodoc/jenkins:{}-{}".format(__version__, x),
                                "."])
    # remove build so it gets rebuild properly
    #shutil.rmtree("build")
