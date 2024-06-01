{ callPackage
, libsoup
, openssl
, pkg-config
, perl
, webkitgtk
}:
let
  common = opts: callPackage (import ../../../tools/networking/globalprotect-openconnect/common.nix opts) { };
in common {
  pname = "gpauth";
  buildAndTestSubdir = "apps/gpauth";
  cargoHash = "sha256-aBxGmZY46CSuXiooc2XieuBbGhQhDYuCU+ceHcyLxXk=";
  nativeBuildInputs = [ perl pkg-config ];
  buildInputs = [ libsoup openssl webkitgtk ];
}
