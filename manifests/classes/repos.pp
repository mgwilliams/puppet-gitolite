class gitolite::repos {
    file {
        "/bin/ls":
            ensure => present,
    }
}
