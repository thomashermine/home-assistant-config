# ==============================================================================
# secrets_redact.sh
# ==============================================================================
#
# Copy the ignored secrets.yaml into its redacted version.
#
# A pre-commit Git Hook run this everytime we commit.
# See in .git/hooks/pre-commit
# ==============================================================================

sed 's/\:.*$/: REDACTED/' secrets.yaml > secrets_redacted.yaml