class gitolite {
    include gitolite::packages
    include gitolite::config
    include gitolite::repos
}
