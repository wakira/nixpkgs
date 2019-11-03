{ lib, buildPythonPackage, isPy3k, fetchPypi
, urllib3, future, python-dateutil , pytz, faker, mock, nose }:

buildPythonPackage rec {
  pname = "minio";
  version = "5.0.4";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0f00143a360d2073ca0304f3824e6a8d862c4ec14fa31c926b68244f1d907d7c";
  };

  disabled = !isPy3k;

  checkInputs = [ faker mock nose ];
  propagatedBuildInputs = [ urllib3 python-dateutil pytz future ];

  meta = with lib; {
    description = "Simple APIs to access any Amazon S3 compatible object storage server";
    homepage = https://github.com/minio/minio-py;
    maintainers = with maintainers; [ peterromfeldhk ];
    license = licenses.asl20;
  };
}
