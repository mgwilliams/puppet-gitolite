class gitolite::packages {
    package {
        ["gitweb", "gitolite"]:
            ensure => installed,
            require => Yumrepo["epel"],
    }
}
