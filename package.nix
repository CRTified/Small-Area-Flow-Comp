{ buildDotnetModule, dotnetCorePackages}:
buildDotnetModule rec {
  pname = "SmallAreaFlowComp";
  version = "0.7.1";

  src = ./SmallAreaFlowComp;

  projectFile = "SmallAreaFlowComp/SmallAreaFlowComp.csproj";
  # File generated with `nix-build -A package.passthru.fetch-deps`.
  # To run fetch-deps when this file does not yet exist, set nugetDeps to null
  nugetDeps = ./deps.nix;


  dotnet-sdk = dotnetCorePackages.sdk_7_0;
  dotnet-runtime = dotnetCorePackages.runtime_7_0;

  executables = [ "SmallAreaFlowComp" ];

  packNupkg = false;

  postInstall = ''
    cp -v ${./model.txt} $out/lib/SmallAreaFlowComp/model.txt
  '';
}
