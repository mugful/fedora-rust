fedora-rust
===========

Docker image with Rust programming language and Cargo package manager.

Why
---

Rust changes a lot, many devs want to develop using the Rust nightly
builds. It's customary to download precompiled binaries directly from
Rust's site, but it's a bit cleaner to install such directly
downloaded binaries into a somewhat isolated environment, like a
docker container.

It's also easy to temporarily revert to a previous Rust nightly in
case a new Rust nightly breaks your dependencies way too much, just
name your containers by date when you create them, and then keep them
around for a while.


Usage
-----

```
docker pull dockingbay/fedora-rust:nightly
```

The intended use case is to base your own per-project images on the
fedora-rust image nightly build. An example Dockerfile:

```
FROM dockingbay/fedora-rust:nightly

# create a user
RUN useradd project -u 1000 -d /home/project -G wheel; passwd --stdin project <<< 'weakpw'

# install dependencies needed for building your project
RUN dnf -y install freetype-devel portaudio-devel SDL2-devel tmux zlib-devel; dnf clean all

# don't forget LD_LIBRARY_PATH for rustc
RUN echo -e '\nexport LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib' >> /home/project/.bashrc

# a nicer command prompt
RUN echo "export PS1='[\u@\h \W]\$ '" >> /home/project/.bashrc

VOLUME ["/home/project/my_project_directory"]
USER project
ENV HOME /home/project
CMD ["/usr/bin/tmux"]
```

Build your customized project image:

```
docker build -t myname/my_project_image .
```

Create a container, you'll get a shell where you can run rustc and cargo:

```
docker run --name my_project_2015_01_05 -i -t -v /home/myname/projects/my_project:/home/project/my_project_directory
```

Re-use a previously created container in case the newest nightly makes
you feel dizzy:

```
docker start -a -i my_project_2015_01_02
```
