#!/bin/bash
set -e
C=frontend/src/ts/constants
# Empty Firebase config = accounts disabled, test still works
cp $C/firebase-config-example.ts $C/firebase-config.ts
cp $C/firebase-config-example.ts $C/firebase-config-live.ts
# Dummy recaptcha key (build fails without it); point backend at a dead local port so calls fail fast
printf 'RECAPTCHA_SITE_KEY=dummy\nBACKEND_URL=http://127.0.0.1:9\n' > frontend/.env
pnpm run build-fe
