#!/bin/bash
# permission_demo.sh
# Linux File Permission Demonstration - helper script
# Author : Hitesh Solanki (2026B01010448)
#
# Creates a temporary folder with practice files, applies chmod in both
# symbolic and numeric form, shows the result with ls -l and stat, and
# then removes everything again. It does NOT use chown or sudo and it
# never touches any real file outside the temporary folder.

set -u

LAB="$(mktemp -d "${TMPDIR:-/tmp}/permission_lab.XXXXXX")"
trap 'rm -rf "$LAB"' EXIT

show() {
    echo
    echo "---- $1 ----"
    ls -l "$LAB"
}

cd "$LAB" || exit 1

echo "Lab folder: $LAB"
touch notes.txt report.txt script.sh
echo "Linux permission practice file" > notes.txt
show "Step 1: files as created (default mode)"

echo
echo "stat output (symbolic, numeric, owner:group, name):"
stat -c '%A  %a  %U:%G  %n' notes.txt report.txt script.sh

chmod u+x script.sh
chmod g-w,o-r notes.txt
show "Step 2: symbolic chmod (u+x script.sh, g-w,o-r notes.txt)"

chmod 640 notes.txt
chmod 755 script.sh
chmod 600 report.txt
show "Step 3: numeric chmod (640, 755, 600)"

chmod 000 notes.txt
echo
echo "Trying to read notes.txt with mode 000:"
cat notes.txt 2>&1 || true

chmod 644 notes.txt
echo
echo "After chmod 644 notes.txt:"
cat notes.txt
show "Step 4: final state"

echo
echo "Done. The temporary folder will now be deleted."
