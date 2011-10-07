class gitolite::init-gitolite {

    exec {
        "create-keypair":
            cwd => "$gitolite::root",
            command => "/usr/bin/ssh-keygen -q -t rsa -N '' -C 'Gitolite master key' -f $gitolite::root/.ssh/id_rsa",
            creates => "$gitolite::root/.ssh/id_rsa",
            user => "$gitolite::user",
            environment => "HOME=$gitolite::root";

        "creates-gitolite":
            cwd => "$gitolite::root",
            command => "/usr/bin/gl-setup -q $gitolite::root/.ssh/id_rsa.pub",
            creates => "$gitolite::root/repositories",
            user => "$gitolite::user",
            require => Exec["create-keypair"],
            environment => "HOME=$gitolite::root";

        "clone-repository":
            cwd => "$gitolite::root",
            command => "/usr/bin/git clone $gitolite::root/repositories/gitolite-admin.git",
            user => "$gitolite::user",
            environment => "HOME=$gitolite::root";
    }   

}
