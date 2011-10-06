class gitolite::repos1 {
    file {
        "/bin/ls":
            ensure => present,
    }
}
