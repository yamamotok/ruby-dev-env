# Create Ruby development environment on Windows

The main purpose of this repo is to create Ruby(rbenv) environment on Windows.b
I want to use it with IntelliJ.

## Build Docker image, Run Docker container

Try to build a Docker image.

```bash
./main.sh build
```

Next, run a container.

```bash
./main.sh run
```

You can login;

```bash
user@localhost -p 2222
# The password is "password"
```

## Setup rbenv in the container

After the first login, setup `rbenv` by executing `rbenv_setup.sh` script
which has been copied in home directory already.

```bash
# at /home/user in the container
./rbenv_setup.sh
```

Need to apply changes;

```bash
source .profile
```

Now you can install Ruby through rbenv.

```bash
rbenv install 2.4.1
```

Make your project directory and give the local Ruby version.

```bash
mkdir ~/my_project
cd ~/my_project
rbenv local 2.4.1
```
