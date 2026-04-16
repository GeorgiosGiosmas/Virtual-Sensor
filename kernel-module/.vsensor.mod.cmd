savedcmd_vsensor.mod := printf '%s\n'   vsensor.o | awk '!x[$$0]++ { print("./"$$0) }' > vsensor.mod
