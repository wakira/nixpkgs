{ fetchPypi
, lib
, buildPythonPackage
, attrs
, click
, effect
, jinja2
}:

buildPythonPackage rec {
  pname = "nix-prefetch-github";
  version = "2.3.2";

  src = fetchPypi {
    inherit pname version;
    sha256 = "bdd5d879294bf5e1b72d445b8f08072fe2d801b5cea4e4ce8a2368f95130b2a3";
  };

  propagatedBuildInputs = [
    attrs
    click
    effect
    jinja2
  ];

  meta = with lib; {
    description = "Prefetch sources from github";
    homepage = https://github.com/seppeljordan/nix-prefetch-github;
    license = licenses.gpl3;
    maintainers = with maintainers; [ seppeljordan ];
  };
}
