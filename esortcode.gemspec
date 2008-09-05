(in /Users/ggarside/Gits/esortcode)
Gem::Specification.new do |s|
  s.name = %q{esortcode}
  s.version = "0.9.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Geoff Garside"]
  s.cert_chain = ["/Users/ggarside/.gem/gem-public_cert.pem"]
  s.date = %q{2008-09-05}
  s.description = %q{Ruby interface to eSortCode UK Account and Bank Branch validator}
  s.email = ["ruby@geoffgarside.co.uk"]
  s.extra_rdoc_files = ["History.txt", "License.txt", "Manifest.txt", "PostInstall.txt", "README.txt", "website/index.txt"]
  s.files = ["History.txt", "License.txt", "Manifest.txt", "PostInstall.txt", "README.txt", "Rakefile", "config/hoe.rb", "config/requirements.rb", "lib/esortcode.rb", "lib/esortcode/client.rb", "lib/esortcode/errors.rb", "lib/esortcode/version.rb", "lib/esortcode/xml_response.rb", "lib/esortcode/xml_response/hpricot.rb", "lib/esortcode/xml_response/libxml.rb", "lib/esortcode/xml_response/rexml.rb", "script/console", "script/destroy", "script/generate", "script/txt2html", "setup.rb", "tasks/deployment.rake", "tasks/environment.rake", "tasks/website.rake", "test/test_esortcode.rb", "test/test_helper.rb", "website/index.html", "website/index.txt", "website/javascripts/rounded_corners_lite.inc.js", "website/stylesheets/screen.css", "website/template.html.erb"]
  s.has_rdoc = true
  s.homepage = %q{http://esortcode.rubyforge.org}
  s.post_install_message = %q{Esortcode Client will use REXML to parse web service
responses. You can however increase the speed of
parsing by installing either

  * libxml-ruby >= 0.8.3
  * hpricot >- 0.6.0

and the client will use one of these instead. If
libxml-ruby is installed it will take preference over
hpricot.
}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{esortcode}
  s.rubygems_version = %q{1.2.0}
  s.signing_key = %q{/Users/ggarside/.gem/gem-private_key.pem}
  s.summary = %q{Ruby interface to eSortCode UK Account and Bank Branch validator}
  s.test_files = ["test/test_esortcode.rb", "test/test_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if current_version >= 3 then
      s.add_development_dependency(%q<hoe>, [">= 1.7.0"])
    else
      s.add_dependency(%q<hoe>, [">= 1.7.0"])
    end
  else
    s.add_dependency(%q<hoe>, [">= 1.7.0"])
  end
end
