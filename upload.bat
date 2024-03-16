


set folder=$(pwd)


if [ $EUID -ne 0 ]; then
  echo "Root preveliges are required"
  exit 1
fi

if [ $# -lt 3 ]; then
  echo "Usage: $0 [username] [repository_name] [commit_message]"
  exit 1
fi

echo "SSH repository upload utility"

echo "Uploading $folder directory contents to github repo $2"
git init -b main
git add .
git commit -m "$3"
git remote add origin git@github.com:$1/$2.git
git remote -v
git push -u origin main
cls
echo "Done!"


