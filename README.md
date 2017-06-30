# inspec_fivemins


This repo is a quick demo of InSpec and profiles. You'll need Vagrant ('https://vagrantup.com') and ChefDK ('https://downloads.chef.io/chefdk').

The purpose of this repo is to show the impact of testing a sample Linux system, in this example CentOS 7.2, with InSpec and then re-testing after hardening.

Once you have Vagrant and ChefDK installed, you can use Test Kitchen to explore the demo. As delivered, the ```.kitchen.yml``` file will have the ```linux-baseline``` InSpec profile included, but will have the ```os-hardening```cookbook disabled. Your first run through the Test Kitchen workflow will show the parts of the system that don't meet the hardening requirements.

When running "kitchen test" without the hardening recipe, more than half the tests will fail.
With the hardening recipe included, they should all pass. You can turn it on and off by commenting it out in .kitchen.yml with a hash #.

1.  At a terminal window, cd to the ```inspec_fivemins``` directory.
2.  Run ```kitchen verify```

The first run will end similarly to:
```
Profile Summary: 25 successful, 25 failures, 1 skipped
Test Summary: 76 successful, 39 failures, 3 skipped
>>>>>> ------Exception-------
>>>>>> Class: Kitchen::ActionFailed
>>>>>> Message: 1 actions failed.
>>>>>>     Verify failed on instance <default-centos-72>.  Please see .kitchen/logs/default-centos-72.log for more details
>>>>>> ----------------------
>>>>>> Please see .kitchen/logs/kitchen.log for more details
>>>>>> Also try running `kitchen diagnose --all` for configuration

```

3.  Edit the .kitchen.yml file. Remove the ```#``` on line 25 to enable the use of the ```os-hardening``` cookbook.
4.  Run ```kitchen converge``` to apply the cookbook.
5.  Run ```kitchen verify``` to re-run the InSpec profile tests.

If all is well, your output will end with
```
Profile Summary: 50 successful, 0 failures, 1 skipped
Test Summary: 115 successful, 0 failures, 3 skipped
       Finished verifying <default-centos-72> (0m7.69s).
-----> Kitchen is finished. (0m9.79s)
```



There are a couple of things in the default recipe to help with being on a guest, like the rng packages. You're unlikely to ever get enough natural entropy on a vagrant guest on a workstation.
