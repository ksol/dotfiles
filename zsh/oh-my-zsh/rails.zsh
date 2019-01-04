alias bx='bundle exec'
alias bs='bundle show'
alias bu='bundle update'
alias bo='bundle open'
alias nvp='noveku production'
alias nvs='noveku staging'
alias bxsc='bundle exec script/console'
alias bxrc='bundle exec rails console'
alias bxr='bundle exec rake'

# Rails 3/4 Server
function bxrs()
{
  if [ -e '.foreman' ] && [ -f '.foreman' ] && [ -r '.foreman' ]; then
    bundle exec rails server -p `cat .foreman | grep port | cut -c 7-`
  else
    bundle exec rails server
  fi
}

# Rails 2 Server
function bxss()
{
  if [ -e '.foreman' ] && [ -f '.foreman' ] && [ -r '.foreman' ]; then
    bundle exec script/server -p `cat .foreman | grep port | cut -c 7-`
  else
    bundle exec script/server
  fi
}

# Rails major version
function rails_major()
{
  # 'brc' in the grep segment allows to match for beta/rc versions
  cat Gemfile.lock | egrep '^(\ )*rails \([0-9brc\.]*\)' | cut -d ' ' -f 6 | cut -d '(' -f 2 | cut -d ')' -f 1 | cut -d '.' -f 1
}

# Rails server
function bxs()
{
  if [ $(rails_major) -ge "3" ]; then
    bxrs
  else
    bxss
  fi
}

# Rails console
function bxc()
{
  if [ $(rails_major) -ge "3" ]; then
    bxrc
  else
    bxsc
  fi
}

# Capistrano staging
function caps()
{
  if [ -e 'Gemfile.lock' ] && [ -f 'Gemfile.lock' ] && [ -r 'Gemfile.lock' ]; then
    bundle exec cap staging $@
  else
    cap staging $@
  fi
}

# Capistrano production
function capp()
{
  if [ -e 'Gemfile.lock' ] && [ -f 'Gemfile.lock' ] && [ -r 'Gemfile.lock' ]; then
    bundle exec cap production $@
  else
    cap production $@
  fi
}

alias csd='caps deploy'
alias csdm='caps deploy:migrations'
alias csm='caps deploy:migrate'
alias csdr='caps db:dump_and_restore'
alias csdrm='caps db:dump_and_restore FILE=mongoid'
alias csr='caps deploy:restart'
alias css='caps deploy:start'
alias cst='caps deploy:stop'

alias cpd='capp deploy'
alias cpdm='capp deploy:migrations'
alias cpm='capp deploy:migrate'
alias cpdr='capp db:dump_and_restore'
alias cpdrm='capp db:dump_and_restore FILE=mongoid'
alias cpr='capp deploy:restart'
alias cps='capp deploy:start'
alias cpt='capp deploy:stop'
