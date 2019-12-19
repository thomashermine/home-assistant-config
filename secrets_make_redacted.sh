#!/bin/sh

# ==============================================================================
# secrets_make_redacted
# ==============================================================================
# Read the whole repository to find secrets
# and create a placeholder file with them.
#
# Used by Dockerfile, at build time
# ==============================================================================

find . -name '*.yaml' -exec grep -i '!secret' {} \; | sed 's/\:.*$/: 0/'  >> secrets.yaml