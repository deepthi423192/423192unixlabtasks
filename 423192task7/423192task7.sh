mkdir ~/cvs-repo
cd ~/cvs-repo
cvs -d /path/to/cvs/repository init
# Create a new directory for your project
mkdir ~/myproject
cd ~/myproject

# Check out the repository
cvs -d /path/to/cvs/repository checkout myproject
echo "Hello World" > hello.txt
cvs add hello.txt

