git
===

Tools and templates for working with the git version control system.

gitconfig.sh
------------
Script to set up git in my preferred configuration when moving to a new computer.

gitignore
---------
Template .gitignore file. Contains file extensions that should be ignored by git (not checked into the repository).

Workflow: when starting a new project, copy in the .gitignore file and delete irrelevant sections (for example, in a LaTeX document, the Java and C sections can safely be removed to avoid clutter).

Also see Github's collection of .gitignore templates: https://github.com/github/gitignore.

Future work
-----------
Contemplate a Perl script to construct a .gitignore file for a specific type of project (could also specify a new directory to construct a template README file and hooks for spell checking, cleaning, makefile, etc).