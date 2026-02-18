#!/bin/bash
# Publish geepers-api-skills to ClawHub
# Run this once after authenticating: npx clawhub login
#
# Then run: bash publish-to-clawhub.sh

set -e

SKILLS=(geepers-llm geepers-data geepers-orchestrate geepers-corpus geepers-etymology)

for skill in "${SKILLS[@]}"; do
  echo "Publishing $skill..."
  npx clawhub publish "skills/$skill" \
    --slug "lukeslp/$skill" \
    --name "$skill" \
    --version "1.0.0" \
    --changelog "Initial release"
  echo "✓ $skill published"
done

echo "All skills published to ClawHub!"
echo "View at: https://clawhub.ai/lukeslp"
