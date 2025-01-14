# Ensure PR title follows conventional commits
unless /^(feat|fix|chore):\s/.match(github.pr_title)
    options = %w(feat fix chore).join(", ")
    fail("PR title should start with one of: #{options}. Ex.: 'feat: create some view'")
end

unless /task(.*)(mmbrothers.atlassian.net)|\[skip task\]/.match(github.pr_body.downcase)
    fail(
      "Missing task link on PR description.
      If this PR has no task, you should add `\"[skip task]\"` anywhere on the description."
    )
end

unless /github.com(\/user-attachments)\/assets|\[skip evidence\]/.match(github.pr_body.downcase)
    fail(
      "Missing evidence on PR description.
      Please add an image or video to `Evidências`.
      If this PR has no Evidence, you should add `\"[skip evidence]\"` anywhere on the description."
    )
end

# Warn when there is a big PR
warn("Big PR") if git.lines_of_code > 500

# Don't let testing shortcuts get into master by accident
fail("fdescribe left in tests") if `grep -r fdescribe specs/ `.length > 1
fail("fit left in tests") if `grep -r fit specs/ `.length > 1
