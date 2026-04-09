chrome-browser-formula
==================

A SaltStack formula designed to install and configure Google's [Chrome Browser](https://www.google.com/chrome). 

It is primarily expected that this formula will be run via [P3](https://www.plus3it.com/)'s "[watchmaker](https://watchmaker.readthedocs.io/en/stable/)" framework.

This formula is able to install the Chrome browser on both Linux[^1] and Windows Server[^2] operating environments:

* On Linux hosts, it will install using the distro's native package-manager[^1]
* On Windows hosts, it will install using the installer-EXE[^3]

## Available states

- [chrome-browser](#chrome-browser)
- [chrome-browser.clean](#chrome-browser.clean)
- [chrome-browser.package](#chrome-browser.package)
- [chrome-browser.package.clean](#chrome-browser.package.clean)
- [chrome-browser.config](#chrome-browser.config)
- [chrome-browser.config.clean](#chrome-browser.config.clean)

### chrome-browser

Executes the `package` and `config` states to install and configure the Chrome Browser

### chrome-browser.clean

Executes the `package` and `config` states' `clean` actions to fully uninstall the Chrome Browser and remove previously-installed browser policy-configs (and, on Windows, associated registry entries)

### chrome-browser.package

Executes _just_ the `package` state to install the Chrome Browser package.

### chrome-browser.package.clean

Executes _just_ the `package.clean` state to uninstall the Chrome Browser package.

### chrome-browser.config

Executes _just_ the `config` state to install/configure the Chrome policy files

### chrome-browser.config.clean

Executes _just_ the `config` state to uninstall the Chrome policy files and, on Windows, remove any registry-keys set by prior install-runs of the formula.



[^1]: As of this README's writing, only Enterprise Linux and related distros (Red Hat and Oracle Enterprise, CentOS Stream, Rocky and Alma Linux). It has only been specifically tested with EL **_9_** variants.
[^2]: As of this README's writing, this functionality has only been tested on Windows Server 2022
[^3]: Future iterations _may_ allow the use of MSI-based installers.
