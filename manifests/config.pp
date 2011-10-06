class gitolite::config {
    File {
        owner => "$gitolite::user",
        group => "$gitolite::group",
        mode => 0600,
    }

    File['.gitolite'] -> File['gitolite-confdir'] -> File['gitolite.conf']

    file {
        ".gitolite":
            ensure => directory,
            path => "$gitolite::root/.gitolite";

        "gitolite-confdir":
            ensure => directory,
            path => "$gitolite::root/.gitolite/conf";

        "gitolite.conf":
            ensure => present,
            path => "$gitolite::root/.gitolite/conf/gitolite.conf",
            require => File["gitolite-confdir"]
            content => template("gitolite/gitolite.conf.erb");

        "gitolite.rc":
            ensure => present,
            path => "$gitolite::root/.gitolite.rc",
            mode => 0644,
            content => template("gitolite/gitolite.rc.erb");

        "ldap-group-query.sh":
            ensure => present,
            path => "/usr/local/bin/ldap-group-query.sh",
            mode => 0700,
            source => "puppet:///modules/gitolite/ldap-group-query.sh";

        "gitweb.conf":
            ensure => present,
            path => "/etc/gitweb.conf",
            mode => 0644,
            source => "puppet:///modules/gitolite/gitweb.conf",

    }
}
