# Shell function: download a single file from GitHub boilerplate repo
: '
# With env variable
export ASG_BOILER_PLATE_REPO="guneysus/boilerplate"
export ASG_BOILER_PLATE_REPO_BRANCH="master"

boilerplate --path=Makefile

# With command-line repo argument
boilerplate --repository=guneysus/boilerplate --path=Makefile
boilerplate --repository=guneysus/boilerplate --branch=develop --path=Makefile
'
# Shell function: download a single file from GitHub boilerplate repo with configurable branch

# Shell function: download a single file from GitHub boilerplate repo, branch optional
boilerplate () {
  local REPO="${ASG_BOILER_PLATE_REPO:-}"
  local BRANCH="${ASG_BOILER_PLATE_REPO_BRANCH:-main}"
  local FILE_PATH=""

  # Parse arguments
  for arg in "$@"; do
    case $arg in
      --repository=*)
        REPO="${arg#*=}"
        ;;
      --branch=*)
        BRANCH="${arg#*=}"
        ;;
      --path=*)
        FILE_PATH="${arg#*=}"
        ;;
      *)
        # If argument does not match options, assume it is the file path
        FILE_PATH="$arg"
        ;;
    esac
  done

  # Validate inputs
  if [[ -z "$REPO" ]]; then
    echo "Repository not specified. Use --repository or set ASG_BOILER_PLATE_REPO."
    return 1
  fi

  if [[ -z "$FILE_PATH" ]]; then
    echo "File path not specified. Provide as --path=<file> or positional argument."
    return 1
  fi

  # Construct raw GitHub URL
  local RAW_URL="https://raw.githubusercontent.com/${REPO}/${BRANCH}/templates/${FILE_PATH}" # TODO: templates segment should be configurable

  # Download the file
  echo "Downloading $FILE_PATH from $REPO (branch: $BRANCH)..."
  curl -fsSL -o "$(basename "$FILE_PATH")" "$RAW_URL" && echo "Done: $(basename "$FILE_PATH")"
}

