. ./sharness.sh

unset SSH_AUTH_SOCK

if [ ! -e "$SHARNESS_TEST_DIRECTORY/.gitspindle" ]; then
    echo "No .gitspindle found in test directory, aborting">&2
    exit 1
fi

cp "$SHARNESS_TEST_DIRECTORY/.gitspindle" .
export PYTHONPATH="$SHARNESS_BUILD_DIRECTORY/lib"
export PATH="$SHARNESS_TEST_DIRECTORY/bin:$PATH"
export GIT_CEILING_DIRECTORIES="$SHARNESS_BUILD_DIRECTORY"
export GIT_SSH="$SHARNESS_TEST_DIRECTORY/bin/ssh"

if [ x"$PYTHON" = x ]; then
    PYTHON=python
fi

git_hub() { "$PYTHON" "$SHARNESS_BUILD_DIRECTORY/bin/git-hub" "$@"; }
git_lab() { "$PYTHON" "$SHARNESS_BUILD_DIRECTORY/bin/git-lab" "$@"; }
git_bb()  { "$PYTHON" "$SHARNESS_BUILD_DIRECTORY/bin/git-bb"  "$@"; }

git_hub_1() { "$PYTHON" "$SHARNESS_BUILD_DIRECTORY/bin/git-hub" --account github-test-1    "$@"; }
git_lab_1() { "$PYTHON" "$SHARNESS_BUILD_DIRECTORY/bin/git-lab" --account gitlab-test-1    "$@"; }
git_bb_1()  { "$PYTHON" "$SHARNESS_BUILD_DIRECTORY/bin/git-bb"  --account bitbucket-test-1 "$@"; }

git_hub_2() { "$PYTHON" "$SHARNESS_BUILD_DIRECTORY/bin/git-hub" --account github-test-2    "$@"; }
git_lab_2() { "$PYTHON" "$SHARNESS_BUILD_DIRECTORY/bin/git-lab" --account gitlab-test-2    "$@"; }
git_bb_2()  { "$PYTHON" "$SHARNESS_BUILD_DIRECTORY/bin/git-bb"  --account bitbucket-test-2 "$@"; }

git_hub_3() { "$PYTHON" "$SHARNESS_BUILD_DIRECTORY/bin/git-hub" --account github-test-3    "$@"; }
git_lab_3() { "$PYTHON" "$SHARNESS_BUILD_DIRECTORY/bin/git-lab" --account gitlab-test-3    "$@"; }
git_bb_3()  { "$PYTHON" "$SHARNESS_BUILD_DIRECTORY/bin/git-bb"  --account bitbucket-test-3 "$@"; }

# Make sure git doesn't think we're in a repo
git rev-parse >/dev/null 2>&1 && { echo "Yikes, git sees an outer repo!"; exit 1; }
