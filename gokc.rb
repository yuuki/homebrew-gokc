class Gokc < Formula
  gokc_version = '0.3.4'
  homepage 'https://github.com/yuuki/gokc'
  version gokc_version

  if Hardware::CPU.is_64_bit?
    url "https://github.com/yuuki/gokc/releases/download/v#{gokc_version}/gokc_darwin_amd64.zip"
    sha256 '8426f0f8011601b570f3e7f302dada17dcbd10719ee163fd92382efdf8fc39b5'
  else
    url "https://github.com/yuuki/gokc/releases/download/v#{gokc_version}/gokc_darwin_386.zip"
    sha256 'f55465c57932d6fb667f9ef2e6127ffdcaa215a8123509f800f69b2e8e71ba15'
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
