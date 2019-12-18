# ==============================================================================
# secrets_fetch.sh
# ==============================================================================
# Fetch submodule and copy file at right place after every new commit
# ==============================================================================

git submodule init
git submdule update
mv secrets/secrets.yaml secrets.yaml