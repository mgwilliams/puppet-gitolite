class gitolite ($root="/var/lib/gitolite",
                $user="gitolite",
                $group="gitolite",
                $sshkey = "ssh-rsa something user@host"
    ) {

    include gitolite::packages
    include gitolite::config
    include gitolite::repos

    class {
        'gitolite::packages':
            before => Class['gitolite::config'];
        'gitolite::config':
            before => Class['gitolite::repos'];
    }
}
