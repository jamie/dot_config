function fish_prompt --description 'Write out the prompt'
  
  # Just calculate these once, to save a few cycles when displaying the prompt
  if not set -q __fish_prompt_hostname
    set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
  end

  if not set -q __fish_prompt_normal
    set -g __fish_prompt_normal (set_color normal)
  end

  # different path colors for root prompts
  switch $USER
    case root
    if not set -q __fish_prompt_cwd
      if set -q fish_color_cwd_root
        set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
      else
        set -g __fish_prompt_cwd (set_color $fish_color_cwd)
      end
    end

    case '*'
    if not set -q __fish_prompt_cwd
      set -g __fish_prompt_cwd (set_color $fish_color_cwd)
    end
  end

  # basic prompt
  set_title (prompt_pwd)
  printf '%s@%s %s%s%s' $USER $__fish_prompt_hostname "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal"

  # optionally describe current git status
  if git symbolic-ref HEAD >/dev/null ^/dev/null
    printf ' (git:%s' (git-current-branch)
    if not test -z (gitout) >/dev/null ^/dev/null
      printf '+%d' (gitout | wc -l | awk '{print $1}')
    end
    printf ')'
  end
  
  # end the prompt
  switch $USER
    case root
    printf '# '

    case '*'
    printf '> '
  end

end
