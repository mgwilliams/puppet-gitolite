class gitolite ($root="/var/lib/gitolite",
                $user="gitolite",
                $group="gitolite",
                $sshkey = "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAz2t/Qki/Y383Q58HhwrJGaiGRKQtCZau8JdknxKGM+9GKEplrZ1hJJp34QcZaitMbcil9YCA+JTIYJxLh4YIwuhULecCh2G1Wwf6+6x5uBnfYwIP4yZORWk2CJLfaG6UggFFMIC0TJtCeqZs+kGOqgsUe1ZdtY5hNoJlbmLXPc3FEZ72FvcjwHcXPsHiqn6CAWPEd9qLpgqrmszBjgqq4M9aYjep5ZPS3Pt+9J9ytrjp5WXcVt4Z6eLpJLe43zqsIn2Z4QJnbXetlDbUsOy2jh6x2FhYkR3mpH0uvbw2ewkI0Q1ec7O5+C4BEvhjYxPgzoAQzgtOL7XkBooxJuz2Yw== root@centos-vm"
    ) {


    yumrepo { "epel":
        mirrorlist => "http://mirrors.fedoraproject.org/mirrorlist?repo=epel-6&arch=$basearch",
        enabled => 1,
        gpgcheck => 0,
    }

    class {
        'gitolite::packages':
            before => Class['gitolite::init-gitolite'];
        'gitolite::init-gitolite':
            before => Class['gitolite::config'];
        'gitolite::config':
            before => Class['gitolite::repos'];
        'gitolite::repos':;
    }
}
