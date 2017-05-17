# osdc-inspec-talk

TODO: Enter the cookbook description here.

TODO: clean up a bit

This repo is a quick demo of InSpec and profiles. You'll need Vagrant and ChefDK.

When running "kitchen test" without the hardening recipe, more than half the tests will fail.
With the hardening recipe included, they should all pass. You can turn it on and off by commenting it out in .kitchen.yml with a hash #.

There are a couple of things in the default recipe to help with being on a guest, like the rng packages. You're unlikely to ever get enough natural entropy on a vagrant guest on a workstation.


