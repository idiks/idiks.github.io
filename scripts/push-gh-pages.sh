set -e

# Add noindex to pages
find ./dist -print0 | grep html | xargs sed -0 -i 's/<head>/<head>\n<meta name="robots" content="noindex">/g'

cd dist

git config --global user.email "hongxing.zhang@idiks.com"
git config --global user.name "idiks"
remote=$(git config remote.origin.url)
git init
git remote add origin "$remote"
git checkout -b master
git add .
git commit -m "Update gh-pages [ci skip]"
#ssh-agent bash -c 'ssh-add ~/.ssh/id_rsa_6aa6ace89eee7def1892940bb02c3482; git push -f origin master'
git push -f origin master
