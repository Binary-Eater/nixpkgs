{ callPackage
, gpauth
, openconnect
, openssl
, perl
}:
let
  common = opts: callPackage (import ../../../tools/networking/globalprotect-openconnect/common.nix opts) { };
in common {
  pname = "gpclient";
  buildAndTestSubdir = "apps/gpclient";
  cargoHash = "sha256-s9qfMMedy8FJ1tAvBiKXm+Cuk/I1w6JUO7KO4kyYZg4=";
  nativeBuildInputs = [ perl ];
  buildInputs = [ gpauth openconnect openssl ];
  preConfigure = ''
    sed -e s@/usr/bin/gpauth@${gpauth}/bin/gpauth@g -i crates/gpapi/src/lib.rs
  '';
}
