function get_git_status -d "Gets the current git status"
  if command git rev-parse --is-inside-work-tree >/dev/null 2>&1
    set -l dirty (command git status -s --ignore-submodules=dirty | wc -l | sed -e 's/^ *//' -e 's/ *$//' 2> /dev/null)
    set -l ref (command git symbolic-ref HEAD | sed  "s-refs/heads/--" | sed -e 's/^ *//' -e 's/ *$//' 2> /dev/null)
    set_color white
    echo -n " [$ref]"
    if [ "$dirty" != "0" ]
      set_color -b normal
      set_color red
      echo -n "($dirty+)"
#      if [ "$dirty" != "1" ]
#        echo "s"
#      end
#      echo " "
#      set_color -b red
      set_color white
    else
#      set_color -b cyan
      set_color white
    end
    set_color normal
   end
end

function fish_prompt
  set_color white
  echo -n (date "+%H:%M:%S ")
  set_color magenta
  echo -n (pwd)
  get_git_status
  set_color cyan
  echo -n ' $ '
  set_color normal
end
