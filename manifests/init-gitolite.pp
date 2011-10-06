class gitolite::init-gitolite {
    file { "masterkey.pub":
        path => "$gitolite::root/masterkey.pub",
        ensure => present,
        owner => "$gitolite::user",
        group => "$gitolite::group",
        mode => 0600,
        content => "$gitolite::sshkey";
    }

    exec { "creates-gitolite":
        cwd => "$gitolite::root",
        command => "/usr/bin/gl-setup -q masterkey.pub",
        creates => "$gitolite::root/repositories",
        user => "$gitolite::user",
        path => "/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin",
        require => File["masterkey.pub"],
    }
}
