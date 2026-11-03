class Mantra < Formula
  desc "Mantra programming language toolchain — Compiler, MDK, LSP, and Runtime"
  homepage "https://solotrondigital.github.io/mantra_website"
  version "0.8.0"
  license "MIT OR GPL-3.0"

  on_macos do
    url "https://github.com/solotrondigital/mantra_programming_language/releases/download/v0.8.0/Mantra-0.8.0-macOS.dmg"
    sha256 "edd23b5049ece3c2cf175c971711a70d5ce1bcce79a7a4d9e1529cb31fc57824"
  end

  on_linux do
    url "https://github.com/solotrondigital/mantra_programming_language/releases/download/v0.8.0/mantra-0.8.0-linux.tar.gz"
    sha256 "596ee57ddeeeab2d53552c7bb0de04b4d707df9f068c05eda80fffb7ac1b0a0d"
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
