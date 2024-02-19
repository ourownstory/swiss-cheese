# Git Best Practices

## contribute to a public repo
Good general guidelines and steps described:
https://akrabat.com/the-beginners-guide-to-contributing-to-a-github-project/

## git rebase, squash when working on a forked repo

* When rebasing based on remote repo: (assuming you added remote forked repo as upstream `git remote add upstream git@github.com:user/repo.git`)
* Do all your work, commit it and stash the rest. Push to origin `git push -u origin master`
* Optional: To be safe, make a copy of the current state of your origin/master before rebasing `git checkout -b origin/copy_master origin/master`
* Update upstream `git fetch upstream`
* Rebase with upstream `git rebase upstream/master`
* Optional: Prettify your commit history `git rebase -i HEAD~3`. Change number to the amount of commits you want to squash. You can view the history to decide how many you want to rework by looking at `git log origin/master`.
* Rewrite origin's history `git push origin master --force` 
* initiate PR on github
* Optional: If your PR got a change request, and you did your updates and are ready to redo the above steps, you can first view if the upstream master has since been updated with `git log HEAD..upstream/master`. This shows the commits in upstream that are not in your current origin. Note: regardless of changes in upstream, you can directly push to your PR branch with `git push origin master`.

## reset local branch to origin

* If you want to overwrite your local branch with a remote branch `git reset --hard origin/master`

## .gitignore
https://labs.consol.de/development/git/2017/02/22/gitignore.html

# Git Advanced Operations
## git submodules
When in need of source code files from another project. Read https://github.blog/2016-02-01-working-with-submodules/

## split a subfolder into a new repo
guide from github https://docs.github.com/en/get-started/using-git/splitting-a-subfolder-out-into-a-new-repository

using filter-repo (recommended) https://github.com/newren/git-filter-repo

guide guide using filter-branch (not recommended) https://manishearth.github.io/blog/2017/03/05/understanding-git-filter-branch/

