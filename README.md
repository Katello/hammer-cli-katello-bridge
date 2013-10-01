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
    :katello_bridge:
        :cli_description: '/tmp/katello.json'
        #:username: admin
        #:password: admin

run 

    $ hammer -h

    Usage:
        hammer [OPTIONS] SUBCOMMAND [ARG] ...

    Parameters:
        SUBCOMMAND                    subcommand
        [ARG] ...                     subcommand arguments

    Subcommands:
        about                         status of the katello server and its subcomponents
        activation_key                activation key specific actions in the katello server
        admin                         various administrative actions
        changeset                     changeset specific actions in the katello server
        client                        client specific actions in the katello server
        content                       content namespace command
        distribution                  repo specific actions in the katello server
        distributor                   distributor specific actions in the katello server
        environment                   environment specific actions in the katello server
        errata                        errata specific actions in the katello server
        gpg_key                       GPG key specific actions in the katello server
        node                          node specific actions in the katello server
        org                           organization specific actions in the katello server
        package                       package specific actions in the katello server
        package_group                 package group specific actions in the katello server
        permission                    permission specific actions in the katello server
        ping                          get the status of the katello server
        product                       product specific actions in the katello server
        provider                      provider specific actions in the katello server
        puppet_module                 puppet module specific actions in the katello server
        repo                          repo specific actions in the katello server
        shell                         run the cli as a shell
        sync_plan                     synchronization plan specific actions in the katello server
        system                        system specific actions in the katello server
        system_group                  system group specific actions in the katello server
        task                          commands for retrieving task information
        user                          user specific actions in the katello server
        user_role                     user role specific actions in the katello server
        version                       get the version of the katello server

    Options:
        -v, --verbose                 be verbose
        -c, --config CFG_FILE         path to custom config file
        -u, --username USERNAME       username to access the remote system
        -p, --password PASSWORD       password to access the remote system
        --version                     show version
        --show-ids                    Show ids of associated resources
        --csv                         Output as CSV (same as --adapter=csv)
        --adapter ADAPTER             Set output format. One of [base, table, silent, csv]
        -P, --ask-pass                Ask for password
        --autocomplete LINE           Get list of possible endings
        -h, --help                    print help


Username and password
---------------------

There are multiple ways to specify Katello username and password. The priority is as follows (later one overrides the preceeding)

 * in configuration as in the config sample
 * in environment variable ```$KATELLO_USERNAME, $KATELLO_PASSWORD```
 * on command line ```--username, --password```
 * interactive password prompt with ```-P```

