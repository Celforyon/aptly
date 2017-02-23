# Documentation
## Environment variables
| Name             | Possible values | Default | Effect                                              |
| ---------------- | --------------- | ------- | --------------------------------------------------- |
| AUTO_CREATE_REPO | true/false      | false   | If true, will automatically create new repositories |
| PASSPHRASE       | any             | empty   | If set, create the *passphrase* file                |

## Installation and usage
### Preparation
Required files in `$webdir`:
* private.key containing your private GPG key
* passphrase containing the passphrase (so it is non-interactive)

### Launch
`docker run --name aptly -d -e GPGKEY=$KEY -v $webdir:/opt/aptly -v $shareddir:/shared celforyon/aptly`

### Create repository
`docker exec aptly aptly repo-create $dist`

### Publishing
```bash
tmp=$(mktemp -dp $shareddir)
mkdir $tmp/$dist
cp $debfile $tmp/$dist/
```

The debfile and two directories will be removed
The subdirectory `$dist` must be a valid repository name
The temporary directory is required but you can name it otherwise

### Serving
To serve your published packages, you need to run a web server on `$webdir/public`

## Available scripts
You can make use of these scripts by doing:
`docker exec -it aptly *script*`

### repo-create
It allows to create an *aptly* repository and is the same as:
`aptly repo create -distribution=$dist -component=main $dist`

### purge-aptly
**Dangerous command**
It deletes all *aptly* generated data, plus the `debs` archive of deb files
