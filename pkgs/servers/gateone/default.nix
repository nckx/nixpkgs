{ stdenv, fetchgit, python34Packages }:

with python34Packages;

buildPythonPackage rec {
  version = "1.2.0-20140920142541";
  name = "gateone-${version}";

  # Releases discontinued in 2012; development continues
  src = fetchgit {
    url = git://github.com/liftoff/GateOne.git;
    rev = "4613bf790c60cf3832d439f6c59188faa35c850f";
    sha256 = "75fa4fa17bf8302d4a53261f76e39ad145f27059cf15c73c212620dcd02f4b3e";
  };

  buildInputs = [ setuptools ];
  propagatedBuildInputs = [ futures html5lib tornado ];

  meta = with stdenv.lib; {
    description = "HTML5 terminal emulator and SSH client";
    longDescription = ''
      Open source, web-based terminal emulator with a powerful plugin system.
      It comes bundled with a plugin that turns Gate One into an SSH client
      but Gate One can actually be used to run any terminal application. You
      can even embed Gate One into other applications to provide an interface
      into serial consoles, virtual servers, or anything you like. Works in
      any browser that supports WebSockets. No browser plugins required.
    '';
    homepage = http://liftoffsoftware.com/Products/GateOne;
    license = with licenses; agpl3;
    platforms = with platforms; linux;
    maintainers = with maintainers; [ nckx ];
  };
}
