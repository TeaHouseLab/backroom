set -x prefix "[BackRoom]"
set -x codename Joshua
set -x ver 1
set -x root $argv[1]
set -x logcat $argv[2]
checkdependence jq curl
if test -e $root
    if test -d $root
        if test -w $root; and test -r $root
        else
            logger 5 "root => $root is not Readable/Writable"
            exit 128
        end
    else
        logger 5 "root => $root is not a diretory file"
        exit 128
    end
else
    logger 5 "root => $root is not found"
    exit 128
end
switch $argv[3]
    case enter
        switch $argv[4]
            case nspawn
            case chroot
        end
    case manage
        switch $argv[4]
            case service
                service $argv[5..-1]
            case level
                level $argv[5..-1]
        end
    case host
        api $argv[4..-1]
    case v version
        logger 1 "$codename@build$version"
    case h help '*'
        help_echo
end
