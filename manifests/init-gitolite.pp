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
        command => "/usr/bin/gl-setup -q $gitolite::root/masterkey.pub",
        creates => "$gitolite::root/repositories",
        user => "$gitolite::user",
        environment => "HOME=$gitolite::root",
        require => File["masterkey.pub"],
    }   
}
