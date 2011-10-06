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
    }
}
