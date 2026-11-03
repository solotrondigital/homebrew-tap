class Mantra < Formula
  desc "Mantra programming language toolchain — Compiler, MDK, LSP, and Runtime"
  homepage "https://solotrondigital.github.io/mantra_website"
  version "0.8.0"
  license "MIT OR GPL-3.0"

  on_macos do
    url "https://github.com/solotrondigital/mantra_programming_language/releases/download/v0.8.0/Mantra-0.8.0-macOS.dmg"
    sha256 "787a5bec36b75ac741d3d73d56a15176d7cd2ed03b4dcc1fd69dd988ad47b17a"
  end

  on_linux do
    url "https://github.com/solotrondigital/mantra_programming_language/releases/download/v0.8.0/mantra-0.8.0-linux.tar.gz"
    sha256 "1c6ecd6c0321078b3b5337f9ae8db1790c4a7478ca80457de94eedbb6d3a308e"
  end

  depends_on "llvm" => :recommended

  def install
    bin.install Dir["bin/*"]
    lib.install Dir["lib/*"] if File.directory?("lib")
    include.install Dir["include/*"] if File.directory?("include")
    share.install Dir["share/*"] if File.directory?("share")
  end

  test do
    system bin/"mantra", "--version"
    system bin/"mantrac", "--help"
  end
end
