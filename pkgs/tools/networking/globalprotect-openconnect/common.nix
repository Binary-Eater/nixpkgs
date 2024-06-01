{ buildAndTestSubdir
, cargoHash
, pname
, nativeBuildInputs
, buildInputs
, preConfigure ? null
}:

{ stdenv
, lib
, fetchFromGitHub
, rustPlatform
}:

rustPlatform.buildRustPackage rec {
  version = "2.3.1";

  src = fetchFromGitHub {
    owner = "yuezk";
    repo = "GlobalProtect-openconnect";
    rev = "v${version}";
    hash = "sha256-RATGYwgdwj59mPgTqknefDO5B011zC0RSZXKuJlQxuQ=";
  };

  inherit buildAndTestSubdir
    cargoHash
    pname
    nativeBuildInputs
    buildInputs
    preConfigure;

  meta = with lib; {
    changelog = "https://github.com/${src.owner}/${src.repo}/blob/${src.rev}/changelog.md";
    description = "A CLI for GlobalProtect VPN, based on OpenConnect, supports the SSO authentication method";
    longDescription = ''
      A CLI for GlobalProtect VPN, based on OpenConnect, supports the SSO
      authentication method. Inspired by gp-saml-gui.

      The CLI version is always free and open source in this repo. It has almost
      the same features as the GUI version.
    '';
    homepage = "https://github.com/${src.owner}/${src.repo}";
    license = with licenses; [ gpl3Only ];
    maintainers = with maintainers; [ binary-eater ];
  };
}
