#!/bin/sh

# Decrypt the file
# --batch to prevent interactive command
# --yes to assume "yes" for questions
gpg --quiet --batch --yes --decrypt --passphrase="$LINK_PASSPHRASE" --output links links.gpg

mkdir processing

python -m pip install --user requests
python download_links.py

cd processing
ls | xargs -n 1 gpg -e -f ../tiles.asc
mv *.gpg ../automatic

cd ../

rm -r processing
rm links