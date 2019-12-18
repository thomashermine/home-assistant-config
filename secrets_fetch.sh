#!/bin/sh

# ==============================================================================
# post-merge
# ==============================================================================
# Fetch secrets from private submodule, and move them at the right place.
#
# Set to run automatically after every pull
# on main HA instance with Hook in : 
# .git/hooks/post-merge
# ==============================================================================

git submodule init
git submodule update
mv secrets/secrets.yaml secrets.yaml