class Gokc < Formula
  gokc_version = '0.3.1'
  homepage 'https://github.com/yuuki/gokc'
  version gokc_version

  if Hardware.is_64_bit?
    url "https://github.com/yuuki/gokc/releases/download/v#{gokc_version}/gokc_darwin_amd64.zip"
    sha256 '686f2f743651538e206d534b4d786bfb1845fe9002b9614e203c898020b36b77'
  else
    url "https://github.com/yuuki/gokc/releases/download/v#{gokc_version}/gokc_darwin_386.zip"
    sha256 '022f61d18f37b6f2428a655e3144463aba51fc2d5cb078c9dc1c038417e92fc0'
  end

  head do
    url 'https://github.com/yuuki/gokc.git'
    depends_on 'go' => :build
    depends_on 'git' => :build
  end

  def install
    if build.head?
      ENV['GOPATH'] = buildpath/'.go'
      mkdir_p buildpath/'.go/src/github.com/yuuki'
      ln_s buildpath, buildpath/'.go/src/github.com/yuuki/gokc'
      system 'make', 'build'
    end
    bin.install 'gokc'
  end

  test do
    system 'gokc', '-v'
  end
end
