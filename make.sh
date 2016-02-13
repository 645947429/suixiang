find . -name '*.html' -exec rename "s/.html/.md/g" \{\} \;
find . -type f -name "*.md"  -exec sed -i -e 's/.html/.md/g' {} \;
python fix.py
find . -name "*.orig" -type f|xargs rm -f
git init
git add .
git commit -m "update && fix bugs"
git reflog expire --expire-unreachable=0 --all
git gc --prune=0
git remote add origin git@github.com:XL2014/suixiang.git
git push -u -f origin master
