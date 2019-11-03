{ stdenv, fetchPypi, buildPythonPackage
, requests }:

buildPythonPackage rec {
  pname = "todoist-python";
  version = "8.1.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "da22f97c353fb0af435dd06194b1c72d0f8ac1c6ea987af0d51b3fb091bb114e";
  };

  propagatedBuildInputs = [ requests ];

  meta = {
    description = "The official Todoist Python API library";
    homepage = http://todoist-python.readthedocs.io/en/latest/;
    license = stdenv.lib.licenses.mit;
    maintainers = with stdenv.lib.maintainers; [ the-kenny ];
  };
}
