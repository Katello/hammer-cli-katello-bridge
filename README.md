Katello commands for Hammer CLI
===============================

This plugin provides same set of commands as katello CLI.

by inspection of Katello CLI we generate JSON description of its commands. This plugin can load the description and build equivalent set of commands for Hammer CLI.

How to use
----------

clone the plugin

    $ git clone git@github.com:theforeman/hammer-cli-katello-bridge.git
    $ cd hammer-cli-katello-bridge
    $ rake install
    $ cd ..

update the config similar to this

    :modules:
        - hammer_cli_katello_bridge

    :katello_cli_description: '/tmp/katello.json'

run 

    $ hammer -h
    Usage:
        hammer [OPTIONS] SUBCOMMAND [ARG] ...

    Parameters:
        SUBCOMMAND                    subcommand
        [ARG] ...                     subcommand arguments

    Subcommands:
        shell                         Interactive Shell
        activation_key                activation key specific actions in the katello server
        admin                         various administrative actions
        architecture                  Architecture specific actions in the katello server
        changeset                     changeset specific actions in the katello server
        client                        client specific actions in the katello server
        compute_resource              Compute resources specific actions in the katello server
        config_template               config template specific actions in the katello server
        content                       content namespace command
        distribution                  repo specific actions in the katello server
        domain                        domain specific actions in the katello server
        environment                   environment specific actions in the katello server
        errata                        errata specific actions in the katello server
        gpg_key                       GPG key specific actions in the katello server
        hw_model                      hardware model specific actions in the katello server
        org                           organization specific actions in the katello server
        package                       package specific actions in the katello server
        package_group                 package group specific actions in the katello server
        permission                    permission specific actions in the katello server
        ping                          get the status of the katello server
        product                       product specific actions in the katello server
        provider                      provider specific actions in the katello server
        repo                          repo specific actions in the katello server
        shell                         run the cli as a shell
        smart_proxy                   smart proxy specific actions in the katello server
        subnet                        subnet specific actions in the katello server
        sync_plan                     synchronization plan specific actions in the katello server
        system                        system specific actions in the katello server
        system_group                  system group specific actions in the katello server
        task                          commands for retrieving task information
        template                      template specific actions in the katello server
        user                          user specific actions in the katello server
        user_role                     user role specific actions in the katello server
        version                       get the version of the katello server

    Options:
        -v, --verbose                 be verbose
        -u, --username USERNAME       username to access the remote system
        -p, --password PASSWORD       password to access the remote system
        --version                     show version
        --autocomplete LINE           Get list of possible endings
        -h, --help                    print help
