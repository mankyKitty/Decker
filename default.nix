{ stdenv, xxd, SDL2, SDL2_image, multimarkdown }: stdenv.mkDerivation {
  name = "Decker";
  version = "1.19";
  src = ./.;

  nativeBuildInputs = [
    # Prepare a deck for the build
    xxd
    # to build the documentation
    multimarkdown
  ];

  buildInputs = [
    SDL2
    SDL2_image
  ];

  buildPhase = ''
    # Build the thing !
    make lilt
    make decker

    # Build the docs !
    make docs
  '';

  installPhase = ''
    mkdir -p $out/{bin,docs}

    # Copy the shiny html docs in.
    cp -R docs/*.html $out/docs/

    # Copy the bins in
    cp c/build/lilt $out/bin/lilt
    cp c/build/decker $out/bin/decker
  '';
}
