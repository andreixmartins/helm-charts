


helm package boot-chart

mkdir -p .publish

mv boot-*.tgz .publish/

helm repo index .publish --url https://andreixmartins.github.io/helm-charts

touch .publish/.nojekyll

mv .publish/* .

rsync -a .publish/ . 
rm -rf .publish

git add index.yaml *.tgz .nojekyll

git commit -m "Publish Helm repo"

git push

# rm boot-*.tgz
# rm index.yaml
# rm .nojekyll