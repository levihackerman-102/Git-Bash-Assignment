#!/bin/bash
set() 
{
  echo "Enter key ID"
  read keyid
  git config --global user.signingKey $keyid
  git config --global commit.gpgSign true
}
echo "Use existing GPG key(0) or create a new key(1)"
read choice
if [ $choice -eq 0 ];
then
  gpg --list-keys
  set
else
  gpg --gen-key
  set
fi

#Add key to Github to perform a successful commit
