function configure_log(){
    for f in /etc/nova/nova.conf /etc/glance/glance-api.conf /etc/glance/glance-cache.conf /etc/glance/glance-registry.conf /etc/keystone/keystone.conf /etc/neutron/neutron.conf
    do
        iniset $f DEFAULT logging_exception_prefix ''
        iniset $f DEFAULT logging_debug_format_suffix 'from (pid=%(process)d) %(funcName)s %(pathname)s:%(lineno)d'
        iniset $f DEFAULT logging_default_format_string '%(asctime)s.%(msecs)03d %(process)d %(levelname)s %(name)s %(instance)s%(message)s'
        iniset $f DEFAULT logging_context_format_string '%(asctime)s.%(msecs)03d %(process)d %(levelname)s %(name)s [%(request_id)s %(project_id)s %(user_id)s] %(instance)s%(message)s'
    done

    iniset /etc/nova/nova.conf              DEFAULT log_dir /opt/stack/logs/nova
    iniset /etc/glance/glance-api.conf      DEFAULT log_dir /opt/stack/logs/glance
    iniset /etc/glance/glance-cache.conf    DEFAULT log_dir /opt/stack/logs/glance
    iniset /etc/glance/glance-registry.conf DEFAULT log_dir /opt/stack/logs/glance
    iniset /etc/keystone/keystone.conf      DEFAULT log_dir /opt/stack/logs/keystone
    iniset /etc/neutron/neutron.conf        DEFAULT log_dir /opt/stack/logs/neutron
    iniset /etc/cinder/cinder.conf          DEFAULT log_dir /opt/stack/logs/cinder

}

if [[ "$1" == "stack" && "$2" == "post-config" ]]; then
    echo_summary "Configuring Log"
    configure_log
fi

