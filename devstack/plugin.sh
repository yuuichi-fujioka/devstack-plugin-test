function configure_glance {
    iniset $GLANCE_API_CONF glance_store swift_store_multi_tenant True
}

if [[ "$1" == "stack" && "$2" == "post-config" ]]; then
    echo_summary "Configuring Glance"
    configure_glance
fi

