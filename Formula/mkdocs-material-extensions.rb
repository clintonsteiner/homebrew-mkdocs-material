class MkdocsMaterial < Formula
  include Language::Python::Virtualenv
  desc "Markdown extension resources for MkDocs for Material"
  homepage "https://github.com/facelessuser/mkdocs-material-extensions"
  url "https://github.com/facelessuser/mkdocs-material-extensions/archive/refs/tags/1.3.1.tar.gz"
  sha256 "c15129c3f46e60da0651206ce7934c2972b45933d1828583f36ca1fdced7a1a2"
  license "MIT"
  depends_on "python@3"

  def install
    virtualenv_install_with_resources(using: "python@3")
  end

  test do
    ENV["PYTHONDONTWRITEBYTECODE"] = "1"
    Language::Python.each_python(build) do |python, _|
      system python, "-c", "import materialx"
    end
  end
end
