class setupassistantprofiler(
    $payloadidentifier = 'org.company.profile.setupassistant',
    $payloadorganization = 'Your Organization',
    ) {
    if ! defined(File["${::puppet_vardir}/setupassistantprofiler"]) {
      file { "${::puppet_vardir}/setupassistantprofiler":
        ensure => directory,
      }
    }

    file {"${::puppet_vardir}/setupassistantprofiler/SetupAssistant.mobileconfig":
        owner   => 0,
        group   => 0,
        mode    => 644,
        content => template('setupassistantprofiler/SetupAssistant.mobileconfig.erb')
    }

    outset::everyboot{'setup_assistant_profiler.py':
        script  => template('setupassistantprofiler/dock/setup_assistant_profiler.py.erb'),
        type    => 'template',
    }
}