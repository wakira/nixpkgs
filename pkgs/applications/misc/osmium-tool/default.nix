{ lib, stdenv
, fetchFromGitHub
, cmake
, installShellFiles
, pandoc
, boost
, bzip2
, expat
, libosmium
, lz4
, protozero
, zlib
}:

stdenv.mkDerivation rec {
  pname = "osmium-tool";
  version = "1.13.1";

  src = fetchFromGitHub {
    owner = "osmcode";
    repo = "osmium-tool";
    rev = "v${version}";
    sha256 = "sha256-IeFbcgwayBl3xxv3onCJr0f1oeveyyNlLxXQlzOoVq0=";
  };

  nativeBuildInputs = [
    cmake
    installShellFiles
    pandoc
  ];

  buildInputs = [
    boost
    bzip2
    expat
    libosmium
    lz4
    protozero
    zlib
  ];

  doCheck = true;

  postInstall = ''
    installShellCompletion --zsh ../zsh_completion/_osmium
  '';

  meta = with lib; {
    description = "Multipurpose command line tool for working with OpenStreetMap data based on the Osmium library";
    homepage = "https://osmcode.org/osmium-tool/";
    license = with licenses; [ gpl3Plus mit bsd3 ];
    maintainers = with maintainers; [ das-g ];
  };
}
