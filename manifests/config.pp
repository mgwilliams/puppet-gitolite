class gitolite::config {
    File {
        owner => "$gitolite::user",
        group => "$gitolite::group",
        mode => 0600,
    }

    file {
        "gitolite.conf":
            ensure => present,
            path => "$gitolite::root/gitolite-admin/conf/gitolite.conf",
            content => template("gitolite/gitolite.conf.erb"),
            notify => Exec["update-conf"];

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

    exec { "update-conf":
        cwd => "$gitolite::root/gitolite-admin/",
        command => "/usr/bin/git commit -a -q -m 'autoupdating due to puppet update' || echo 'nothing changed, no commit' && /usr/bin/gl-admin-push",
        user => "$gitolite::user",
        environment => "HOME=$gitolite::root",
        refreshonly => true;
    }
}
