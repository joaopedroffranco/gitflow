# Livelo Git Flow
is_JIRA() {
    prefix="$(echo $1 | cut -d '-' -f1)"
    echo $prefix
    if [[ $prefix = "APP" ]]; then
        return
    fi

    false
}

current_is_master() {
    current="$(git branch | grep \* | cut -d ' ' -f2)"
    if [[ $current = "master" ]]; then
        return
    fi

    false
}

current_is_dev() {
    current="$(git branch | grep \* | cut -d ' ' -f2)"
    if [[ $current = "dev" ]]; then
        return
    fi

    false
}

current_is_feature() {
    current="$(git branch | grep \* | cut -d ' ' -f2 | cut -d '/' -f1)"
    if [[ $current = "feature" ]]; then
        return
    fi

    false
}

current_is_story() {
    current="$(git branch | grep \* | cut -d ' ' -f2 | cut -d '/' -f1)"
    if [[ $current = "story" ]]; then
        return
    fi

    false
}

create_release() {
    release_name=$1
    if current_is_dev ; then
        if [[ -n $release_name ]] ; then
            git checkout -b release/version_$release_name
        else
            echo "fatal: branch name required"
        fi
    else
        echo "fatal: creating release branch only from dev"
    fi
}

create_feature() {
    feature_name=$1
    if current_is_dev ; then
        if [[ -n $feature_name ]] ; then
            git checkout -b feature/$feature_name
        else
            echo "fatal: branch name required"
        fi
    else
        echo "fatal: creating feature branch only from dev"
    fi
}

create_story() {
    story_name=$1
    if current_is_feature ; then
        if [[ -n $story_name ]] && is_JIRA $story_name ; then
            git checkout -b story/$story_name
        else
            echo "fatal: JIRA branch name required"
        fi
    else
        echo "fatal: creating story branch only from feature"
    fi
}

create_subtask() {
    subtask_name=$1
    if current_is_story ; then
        if [[ -n $subtask_name ]] && is_JIRA $subtask_name ; then
            git checkout -b subtask/$subtask_name
        else
            echo "fatal: branch name required"
        fi
    else
        echo "fatal: creating subtask branch only from story"
    fi
}

create_task() {
    task_name=$1
    if [[ -n $task_name ]] && is_JIRA $task_name ; then
        git checkout -b task/$task_name
    else
        echo "fatal: branch name required"
    fi
}

create_bugfix() {
    bugfix_name=$1
    if [[ -n $bugfix_name ]] && is_JIRA $bugfix_name ; then
        git checkout -b bugfix/$bugfix_name
    else
        echo "fatal: branch name required"
    fi
}

create_hotfix() {
    hotfix_name=$1
    if current_is_master && is_JIRA $hotfix_name ; then
        if [[ -n $hotfix_name ]] ; then
            git checkout -b hotfix/$hotfix_name
        else
            echo "fatal: branch name required"
        fi
    else
        echo "fatal: creating hotfix branch only from master"
    fi
}

alias gb='create_bugfix'
alias gh='create_hotfix'
alias gr='create_release'
alias gt='create_task'
alias gf='create_feature'
alias gs='create_story'
alias gst='create_subtask'