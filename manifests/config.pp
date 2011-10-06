class gitolite::config {
    file {
        "gitolite.conf":
            ensure => present,
            path => "$gitolite::root/.gitolite/conf/gitolite.conf",
            owner => "$gitolite::user",
            group => "$gitolite::group",
            mode => 0600,
            content => template("gitolite/gitolite.conf.erb");

        "gitolite.rc":
            ensure => present,
            path => "$gitolite::root/.gitolite.rc",
            owner => "$gitolite::user",
            group => "$gitolite::group",
            mode => 0644,
            content => template("gitolite/gitolite.rc.erb");

        "ldap-group-query.sh":
            ensure => present,
            path => "/usr/local/bin/ldap-group-query.sh",
            owner => "gitolite",
            group => "gitolite",
            mode => 0700,
            source => "puppet:///gitolite/ldap-group-query.sh",

        "gitweb.conf"
            ensure => present,
            path => "/etc/gitweb.conf",
            owner => "root",
            group => "root",
            mode => 0644,
            source => "puppet:///gitolite/gitweb.conf",

    }
}
