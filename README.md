# Usage
## Preparation
Required files in `$webdir`:
* public.key containing your public GPG key
* private.key containing your private GPG key
* passphrase containing the passphrase (so it is non-interactive)

## Launch
`docker run --name aptly -d -v $webdir:/opt/aptly -v $shareddir:/shared celforyon/aptly`

## Create repository
`docker exec aptly aptly repo-create $dist`

## Publishing
```bash
tmp=$(mktemp -dp $shareddir)
mkdir $tmp/$dist
cp $debfile $tmp/$dist/
```

The debfile and two directories will be removed
The subdirectory `$dist` must be a valid repository name
The temporary directory is required but you can name it otherwise

## Serving
To serve your published packages, you need to run a web server on `$webdir/public`
