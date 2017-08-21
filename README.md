# Create Ruby development environment on Windows

The main purpose of this repo is to create a Docker container with Ruby interpreter,
which is installed through *rbenv*.

The container is supposed to be used as development environment with IntelliJ (RubyMine) on Windows.

## Build Docker image, Run Docker container

By using `main.sh` script, you can build a Docker image.

```bash
./main.sh build
```

Also run the container.

```bash
./main.sh run
```

You can login it;

```bash
user@localhost -p 2222
# The password is "password"
```

## Setup rbenv in the container

After the first login, you have to setup `rbenv` by executing `rbenv_setup.sh` script
which has been copied in home directory already.

```bash
# at /home/user in the container
./rbenv_setup.sh
```

After it finished, need to apply changes;

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

## With IntelliJ (RubyMine)

Need to setup these things.

- Deployment configuration
- Remote interpreter

There is a important thing about the path to remote interpreter,  
you need to point `/home/user/.rbenv/versions/2.4.1/bin`  
instead of `/home/user/.rbenv/shims/ruby`.  
Otherwise gems cannot be recognized.

