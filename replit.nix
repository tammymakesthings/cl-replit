{ pkgs }: {
  deps = [
    pkgs.sbcl
    pkgs.inotify-tools
    pkgs.openssl
    pkgs.sqlite
    pkgs.sbclPackages.re
    pkgs.sbclPackages.zmq
    pkgs.sbclPackages.cffi
    pkgs.c2ffi
  ];
}