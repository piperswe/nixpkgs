{ stdenv, python3Packages, fetchFromGitLab }:
with stdenv.lib;
python3Packages.buildPythonApplication rec {
  pname = "pmbootstrap";
  version = "1.22.0";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "0ilnw03vm3qfafdb1nyswsb866qppvji7qrb9nmzlkljq8k5ksk3";
  };

  propagatedBuildInputs = with python3Packages; [
    pytest
  ];

  doCheck = false;

  meta = {
    description = "Sophisticated chroot/build/flash tool to develop and install postmarketOS";
    homepage = "https://postmarketos.org/";
    license = licenses.gpl3;
    maintainers = with maintainers; [ piperswe ];
    platforms = platforms.linux;
  };
}
