class gitolite ($root="/var/lib/gitolite",
                $user="gitolite",
                $group="gitolite",
                $sshkey = "ssh-rsa something user@host"
    ) {
    import "classes/*"

    yumrepo { "epel":
        mirrorlist => "http://mirrors.fedoraproject.org/mirrorlist?repo=epel-6&arch=$basearch",
        enabled => 1,
        gpgcheck => 0,
    }

    class {
        'gitolite::packages':
            before => Class['gitolite::config'];
        'gitolite::config':
            before => Class['gitolite::repos'];
    }
}
