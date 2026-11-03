class Mantra < Formula
  desc "Mantra programming language toolchain — Compiler, MDK, LSP, and Runtime"
  homepage "https://solotrondigital.github.io/mantra_website"
  version "0.8.0"
  license "MIT OR GPL-3.0"

  on_macos do
    url "https://github.com/solotrondigital/mantra_programming_language/releases/download/v0.8.0/Mantra-0.8.0-macOS.dmg"
    sha256 "8ca2751bcb1de61305bda4ff1b2e945204720c44fc7da66201e69cda0b19491a"
  end

  on_linux do
    url "https://github.com/solotrondigital/mantra_programming_language/releases/download/v0.8.0/mantra-0.8.0-linux.tar.gz"
    sha256 "094cb0d27002520e88f040af8c1553fb196e419944c9b0c4dc532721a0fe738d"
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
