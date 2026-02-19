#!/bin/bash
# Publish all skills in this mirror to ClawHub/OpenClaw
# Run once after authenticating: npx clawhub login

set -euo pipefail

VERSION="${SKILL_VERSION:-1.0.0}"
CHANGELOG="${SKILL_CHANGELOG:-Generated mirror publish}"

mapfile -t SKILLS < <(find skills -mindepth 1 -maxdepth 1 -type d -printf '%f\n' | sort)

if [[ ${#SKILLS[@]} -eq 0 ]]; then
  echo "No skills found under skills/"
  exit 1
fi

for skill in "${SKILLS[@]}"; do
  echo "Publishing $skill..."
  npx clawhub publish "skills/$skill" \
    --slug "lukeslp/$skill" \
    --name "$skill" \
    --version "$VERSION" \
    --changelog "$CHANGELOG"
  echo "✓ $skill published"
done

echo "All skills published to ClawHub/OpenClaw"
echo "View at: https://clawhub.ai/lukeslp"
