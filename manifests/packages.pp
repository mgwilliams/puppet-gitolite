class gitolite::packages {
    package {
        ["gitweb", "gitolite"] {
            ensure => installed,
            require => Repo["epel"],
    }
}
