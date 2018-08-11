require 'formula'

class Cgminer < Formula
  homepage 'https://github.com/ckolivas/cgminer'
  head 'https://github.com/ckolivas/cgminer.git', :branch => 'master'
  url 'https://github.com/ckolivas/cgminer/archive/v3.7.2.zip'
  sha256 'a9fc205ce2bc0ad52b83890dfac41d12053e792dbe3a09a0876f41dba8d616a4'
  version '3.7.2'

  depends_on 'autoconf' => :build
  depends_on 'automake' => :build
  depends_on 'libtool' => :build
  depends_on 'pkg-config' => :build
  depends_on 'coreutils' => :build
  depends_on 'libusb' => :build
  depends_on 'curl'

  def install
    system "autoreconf -fvi"
    system "./autogen.sh", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "PKG_CONFIG_PATH=#{HOMEBREW_PREFIX}/opt/curl/lib/pkgconfig:#{HOMEBREW_PREFIX}/opt/jansson/lib/pkgconfig:#{HOMEBREW_PREFIX}/opt/libusb/lib/pkgconfig",
                          "--enable-bflsc",
                          "--enable-bitforce",
                          "--enable-icarus",
                          "--enable-modminer",
                          "--enable-avalon",
                          "--disable-adl",
                          "--enable-opencl",
                          "--enable-bitfury",
                          "--enable-hashfast",
                          "--enable-klondike",
                          "--enable-drillbit",
                          "--enable-avalon2",
                          "--enable-blockerupter",
                          "--enable-cointerra",
                          "--enable-hashratio"
    system "make", "install"
  end

  test do
    system "cgminer"
  end
end
