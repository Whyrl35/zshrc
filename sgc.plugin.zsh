if ! $(which bw 2>&1 > /dev/null)
then
    echo "You need to install the bitwarden-cli command"
    return
fi

if ! $(which sshpass 2>&1 > /dev/null)
then
    echo "You need to install the sshpass command"
    return
fi


sgc() {
    unset SSHPASS
    host=$1
    BW_SESSION=$(cat /home/ludovic/snap/bw/current/.session)

    if ! bw --session "${BW_SESSION}" unlock --check 2>&1 > /dev/null
    then
        bw unlock --raw > /home/ludovic/snap/bw/current/.session
        BW_SESSION=$(cat /home/ludovic/snap/bw/current/.session)
    fi

    bw --session "${BW_SESSION}" sync 2>&1 > /dev/null

    Z98_PASSWORD=$(bw --session "${BW_SESSION}" get item fa8beeb1-66a0-4f3a-be3c-aaf1015a707b | jq '.login.password' | xargs)
    A98_PASSWORD=$(bw --session "${BW_SESSION}" get item 3ffcf5a1-e9d7-4ec1-8b1d-aaf1015a707b | jq '.login.password' | xargs)

    if [[ ${host:0:3} == "z98" ]]
    then
        echo "$fg[black]ssh on $fg_bold[blue]${host} $fg[black]with $fg_bold[green]Z98 $fg[black]account...$reset_color"
        export SSHPASS="${Z98_PASSWORD}"
    else
        echo "$fg[black]ssh on $fg_bold[blue]${host} $fg[black]with $fg_bold[green]A98 $fg[black]account...$reset_color"
        export SSHPASS="${A98_PASSWORD}"
    fi

    sshpass -e ssh -o "StrictHostKeyChecking no" "$@"
}
