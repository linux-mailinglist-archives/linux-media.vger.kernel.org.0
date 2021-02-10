Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD5073172C7
	for <lists+linux-media@lfdr.de>; Wed, 10 Feb 2021 23:01:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232804AbhBJWAm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Feb 2021 17:00:42 -0500
Received: from www.linuxtv.org ([130.149.80.248]:36710 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231642AbhBJWAl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Feb 2021 17:00:41 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1l9xWf-003UdZ-HC; Wed, 10 Feb 2021 21:59:57 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1l9xaI-0000Xc-C6; Wed, 10 Feb 2021 22:03:42 +0000
Date:   Wed, 10 Feb 2021 22:03:42 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <2125977196.8.1612994622359@builder.linuxtv.org>
Subject: Build failed in Jenkins: kernel_media_pipeline #187
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: kernel_media_pipeline
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/kernel_media_pipeline/187/display/redirect>

Changes:


------------------------------------------
[...truncated 79 lines...]
No credentials specified
The recommended git tool is: NONE
No credentials specified
The recommended git tool is: NONE
No credentials specified
Commit message: "media: i2c: max9271: Add MODULE_* macros"
 > git rev-list --no-walk ce79aecf608469b8b8e422928e6fca50b6ca7133 # timeout=10
The recommended git tool is: NONE
No credentials specified
 > git rev-parse HEAD^{commit} # timeout=10
The recommended git tool is: NONE
No credentials specified
[GitCheckoutListener] Recording commits of 'git git://linuxtv.org/media_tree.git'
[GitCheckoutListener] Found previous build 'kernel_media_pipeline #185' that contains recorded Git commits
[GitCheckoutListener] -> Starting recording of new commits since 'ce79aecf608469b8b8e422928e6fca50b6ca7133'
[GitCheckoutListener] -> Git commit decorator could not be created for SCM 'hudson.plugins.git.GitSCM@31f84da'
[GitCheckoutListener] -> No new commits found
[Pipeline] sh
[GitCheckoutListener] Recording commits of 'git git://linuxtv.org/media_tree.git'
[GitCheckoutListener] Found previous build 'kernel_media_pipeline #185' that contains recorded Git commits
[GitCheckoutListener] -> Starting recording of new commits since 'ce79aecf608469b8b8e422928e6fca50b6ca7133'
[GitCheckoutListener] -> Git commit decorator could not be created for SCM 'hudson.plugins.git.GitSCM@31f84da'
[GitCheckoutListener] -> No new commits found
[Pipeline] sh
+ export CCACHE_DIR=/var/lib/jenkins/.ccache
+ export PATH=/usr/lib/ccache:/var/lib/jenkins/.local/bin:/usr/lib/ccache:/var/lib/jenkins/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/games
+ make O=docs allmodconfig
make[1]: Entering directory '/var/lib/jenkins/workspace/kernel_media_pipeline@2/docs'
  GEN     Makefile
[GitCheckoutListener] Recording commits of 'git git://linuxtv.org/media_tree.git'
[GitCheckoutListener] Found previous build 'kernel_media_pipeline #185' that contains recorded Git commits
[GitCheckoutListener] -> Starting recording of new commits since 'ce79aecf608469b8b8e422928e6fca50b6ca7133'
[GitCheckoutListener] -> Git commit decorator could not be created for SCM 'hudson.plugins.git.GitSCM@31f84da'
[GitCheckoutListener] -> No new commits found
[Pipeline] sh
 > git rev-parse HEAD^{commit} # timeout=10
+ export CCACHE_DIR=/var/lib/jenkins/.ccache
+ export PATH=/usr/lib/ccache:/usr/lib/ccache:/var/lib/jenkins/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/games
+ make O=x86_64_mod allmodconfig
make[1]: Entering directory '/var/lib/jenkins/workspace/kernel_media_pipeline/x86_64_mod'
  GEN     Makefile
 > git rev-parse HEAD^{commit} # timeout=10
+ export CCACHE_DIR=/var/lib/jenkins/.ccache
+ export PATH=/usr/lib/ccache:/usr/lib/ccache:/var/lib/jenkins/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games
+ make O=arm_yes CROSS_COMPILER=/usr/bin/arm-linux-gnueabihf- allyesconfig
make[1]: Entering directory '/var/lib/jenkins/workspace/kernel_media_pipeline@2/arm_yes'
  GEN     Makefile
#
# No change to .config
#
make[1]: Leaving directory '/var/lib/jenkins/workspace/kernel_media_pipeline@2/docs'
+ make O=docs -j9 init
make[1]: Entering directory '/var/lib/jenkins/workspace/kernel_media_pipeline@2/docs'
#
# No change to .config
#
make[1]: Leaving directory '/var/lib/jenkins/workspace/kernel_media_pipeline/x86_64_mod'
+ ./scripts/config -f x86_64_mod/.config -d CHECK_SIGNATURE
bad command: -f
Manipulate options in a .config file from the command line.
Usage:
config options command ...
commands:
	--enable|-e option   Enable option
	--disable|-d option  Disable option
	--module|-m option   Turn option into a module
	--set-str option string
	                     Set option to "string"
	--set-val option value
	                     Set option to value
	--undefine|-u option Undefine option
	--state|-s option    Print state of option (n,y,m,undef)

	--enable-after|-E beforeopt option
                             Enable option directly after other option
	--disable-after|-D beforeopt option
                             Disable option directly after other option
	--module-after|-M beforeopt option
                             Turn option into module directly after other option

	commands can be repeated multiple times

options:
	--file config-file   .config file to change (default .config)
	--keep-case|-k       Keep next symbols' case (dont' upper-case it)

config doesn't check the validity of the .config file. This is done at next
make time.

By default, config will upper-case the given symbol. Use --keep-case to keep
the case of all following symbols unchanged.

config uses 'CONFIG_' as the default symbol prefix. Set the environment
variable CONFIG_ to the prefix to use. Eg.: CONFIG_="FOO_" config ...
[Pipeline] }
[Pipeline] // node
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
Failed in branch x86_64 (builtin/mod)
#
# No change to .config
#
make[1]: Leaving directory '/var/lib/jenkins/workspace/kernel_media_pipeline@2/arm_yes'
+ ./scripts/config -f arm_yes/.config -d CHECK_SIGNATURE
bad command: -f
Manipulate options in a .config file from the command line.
Usage:
config options command ...
commands:
	--enable|-e option   Enable option
	--disable|-d option  Disable option
	--module|-m option   Turn option into a module
	--set-str option string
	                     Set option to "string"
	--set-val option value
	                     Set option to value
	--undefine|-u option Undefine option
	--state|-s option    Print state of option (n,y,m,undef)

	--enable-after|-E beforeopt option
                             Enable option directly after other option
	--disable-after|-D beforeopt option
                             Disable option directly after other option
	--module-after|-M beforeopt option
                             Turn option into module directly after other option

	commands can be repeated multiple times

options:
	--file config-file   .config file to change (default .config)
	--keep-case|-k       Keep next symbols' case (dont' upper-case it)

config doesn't check the validity of the .config file. This is done at next
make time.

By default, config will upper-case the given symbol. Use --keep-case to keep
the case of all following symbols unchanged.

config uses 'CONFIG_' as the default symbol prefix. Set the environment
variable CONFIG_ to the prefix to use. Eg.: CONFIG_="FOO_" config ...
[Pipeline] }
[Pipeline] // node
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
Failed in branch arm/aarch64 (builtin)
  GEN     Makefile
  DESCEND  objtool
  CALL    ../scripts/atomic/check-atomics.sh
  CALL    ../scripts/checksyscalls.sh
  CHK     include/generated/compile.h
make[1]: Leaving directory '/var/lib/jenkins/workspace/kernel_media_pipeline@2/docs'
+ make O=docs htmldocs
make[1]: Entering directory '/var/lib/jenkins/workspace/kernel_media_pipeline@2/docs'
Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_x_calibbias is defined 2 times:  ../Documentation/ABI/testing/sysfs-bus-iio-icm42600:0  ../Documentation/ABI/testing/sysfs-bus-iio:394
Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_y_calibbias is defined 2 times:  ../Documentation/ABI/testing/sysfs-bus-iio-icm42600:1  ../Documentation/ABI/testing/sysfs-bus-iio:395
Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_z_calibbias is defined 2 times:  ../Documentation/ABI/testing/sysfs-bus-iio-icm42600:2  ../Documentation/ABI/testing/sysfs-bus-iio:396
Warning: /sys/bus/iio/devices/iio:deviceX/in_anglvel_x_calibbias is defined 2 times:  ../Documentation/ABI/testing/sysfs-bus-iio-icm42600:3  ../Documentation/ABI/testing/sysfs-bus-iio:397
Warning: /sys/bus/iio/devices/iio:deviceX/in_anglvel_y_calibbias is defined 2 times:  ../Documentation/ABI/testing/sysfs-bus-iio-icm42600:4  ../Documentation/ABI/testing/sysfs-bus-iio:398
Warning: /sys/bus/iio/devices/iio:deviceX/in_anglvel_z_calibbias is defined 2 times:  ../Documentation/ABI/testing/sysfs-bus-iio-icm42600:5  ../Documentation/ABI/testing/sysfs-bus-iio:399
Warning: /sys/bus/iio/devices/iio:deviceX/in_count0_preset is defined 2 times:  ../Documentation/ABI/testing/sysfs-bus-iio-timer-stm32:100  ../Documentation/ABI/testing/sysfs-bus-iio-lptimer-stm32:0
Warning: /sys/bus/iio/devices/iio:deviceX/in_count_quadrature_mode_available is defined 2 times:  ../Documentation/ABI/testing/sysfs-bus-iio-counter-104-quad-8:2  ../Documentation/ABI/testing/sysfs-bus-iio-lptimer-stm32:8
Warning: /sys/bus/iio/devices/iio:deviceX/out_altvoltageY_frequency is defined 2 times:  ../Documentation/ABI/testing/sysfs-bus-iio-frequency-adf4371:0  ../Documentation/ABI/testing/sysfs-bus-iio:599
Warning: /sys/bus/iio/devices/iio:deviceX/out_altvoltageY_powerdown is defined 2 times:  ../Documentation/ABI/testing/sysfs-bus-iio-frequency-adf4371:36  ../Documentation/ABI/testing/sysfs-bus-iio:588
Warning: /sys/bus/iio/devices/iio:deviceX/out_currentY_raw is defined 2 times:  ../Documentation/ABI/testing/sysfs-bus-iio-health-afe440x:38  ../Documentation/ABI/testing/sysfs-bus-iio-light-lm3533-als:43
Warning: /sys/bus/iio/devices/iio:deviceX/out_current_heater_raw is defined 2 times:  ../Documentation/ABI/testing/sysfs-bus-iio-humidity-hdc100x:0  ../Documentation/ABI/testing/sysfs-bus-iio-humidity-hdc2010:0
Warning: /sys/bus/iio/devices/iio:deviceX/out_current_heater_raw_available is defined 2 times:  ../Documentation/ABI/testing/sysfs-bus-iio-humidity-hdc100x:1  ../Documentation/ABI/testing/sysfs-bus-iio-humidity-hdc2010:1
Warning: /sys/bus/iio/devices/iio:deviceX/sensor_sensitivity is defined 2 times:  ../Documentation/ABI/testing/sysfs-bus-iio-proximity-as3935:8  ../Documentation/ABI/testing/sysfs-bus-iio-distance-srf08:0
Warning: /sys/bus/iio/devices/triggerX/sampling_frequency is defined 2 times:  ../Documentation/ABI/testing/sysfs-bus-iio-timer-stm32:92  ../Documentation/ABI/testing/sysfs-bus-iio:45
Warning: /sys/class/backlight/<backlight>/l1_daylight_max is defined 2 times:  ../Documentation/ABI/testing/sysfs-class-backlight-driver-adp8870:4  ../Documentation/ABI/testing/sysfs-class-backlight-adp8860:12
Warning: /sys/class/leds/<led>/repeat is defined 2 times:  ../Documentation/ABI/testing/sysfs-class-led-driver-el15203000:0  ../Documentation/ABI/testing/sysfs-class-led-trigger-pattern:28
Warning: /sys/kernel/iommu_groups/reserved_regions is defined 2 times:  ../Documentation/ABI/testing/sysfs-kernel-iommu_groups:15  ../Documentation/ABI/testing/sysfs-kernel-iommu_groups:27
  SPHINX  htmldocs --> file:///var/lib/jenkins/workspace/kernel_media_pipeline@2/docs/Documentation/output
make[3]: Nothing to be done for 'html'.
enabling CJK for LaTeX builder
make[1]: Leaving directory '/var/lib/jenkins/workspace/kernel_media_pipeline@2/docs'
[Pipeline] }
[Pipeline] // node
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (i386 (builtin))
[Pipeline] node
Running on slave1 in /var/lib/jenkins/workspace/kernel_media_pipeline@2
[Pipeline] {
[Pipeline] sh
+ export CCACHE_DIR=/var/lib/jenkins/.ccache
+ export PATH=/usr/lib/ccache:/usr/lib/ccache:/var/lib/jenkins/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/games
+ make O=i386 ARCH=i386 allyesconfig
make[1]: Entering directory '/var/lib/jenkins/workspace/kernel_media_pipeline@2/i386'
  GEN     Makefile
#
# No change to .config
#
make[1]: Leaving directory '/var/lib/jenkins/workspace/kernel_media_pipeline@2/i386'
+ ./scripts/config -f i386/.config -d CHECK_SIGNATURE
bad command: -f
Manipulate options in a .config file from the command line.
Usage:
config options command ...
commands:
	--enable|-e option   Enable option
	--disable|-d option  Disable option
	--module|-m option   Turn option into a module
	--set-str option string
	                     Set option to "string"
	--set-val option value
	                     Set option to value
	--undefine|-u option Undefine option
	--state|-s option    Print state of option (n,y,m,undef)

	--enable-after|-E beforeopt option
                             Enable option directly after other option
	--disable-after|-D beforeopt option
                             Disable option directly after other option
	--module-after|-M beforeopt option
                             Turn option into module directly after other option

	commands can be repeated multiple times

options:
	--file config-file   .config file to change (default .config)
	--keep-case|-k       Keep next symbols' case (dont' upper-case it)

config doesn't check the validity of the .config file. This is done at next
make time.

By default, config will upper-case the given symbol. Use --keep-case to keep
the case of all following symbols unchanged.

config uses 'CONFIG_' as the default symbol prefix. Set the environment
variable CONFIG_ to the prefix to use. Eg.: CONFIG_="FOO_" config ...
[Pipeline] }
[Pipeline] // node
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // node
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
Failed in branch i386 and docs
[Pipeline] // parallel
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Declarative: Post Actions)
[Pipeline] step
