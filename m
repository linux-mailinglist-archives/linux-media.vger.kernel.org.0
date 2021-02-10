Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28FE53172BA
	for <lists+linux-media@lfdr.de>; Wed, 10 Feb 2021 22:54:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232392AbhBJVy0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Feb 2021 16:54:26 -0500
Received: from www.linuxtv.org ([130.149.80.248]:36014 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232312AbhBJVyZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Feb 2021 16:54:25 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1l9xQc-003UIN-5I; Wed, 10 Feb 2021 21:53:42 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1l9xUD-000879-Of; Wed, 10 Feb 2021 21:57:26 +0000
Date:   Wed, 10 Feb 2021 21:57:25 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1193795676.7.1612994245741@builder.linuxtv.org>
Subject: Build failed in Jenkins: kernel_media_pipeline #186
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

See <https://builder.linuxtv.org/job/kernel_media_pipeline/186/display/redirect>

Changes:


------------------------------------------
Started by user Mauro Carvalho Chehab
Running in Durability level: PERFORMANCE_OPTIMIZED
[Pipeline] Start of Pipeline
[Pipeline] node
Running on Jenkins in /var/lib/jenkins/workspace/kernel_media_pipeline
[Pipeline] {
[Pipeline] stage
[Pipeline] { (build)
[Pipeline] parallel
[Pipeline] { (Branch: i386 and docs)
[Pipeline] { (Branch: x86_64 (builtin/mod))
[Pipeline] { (Branch: arm/aarch64 (builtin))
[Pipeline] stage
[Pipeline] { (i386 and docs)
[Pipeline] stage
[Pipeline] { (x86_64 (builtin/mod))
[Pipeline] stage
[Pipeline] { (arm/aarch64 (builtin))
[Pipeline] node
[Pipeline] node
[Pipeline] node
Running on slave1 in /var/lib/jenkins/workspace/kernel_media_pipeline
Running on slave2 in /var/lib/jenkins/workspace/kernel_media_pipeline
Running on Jenkins in /var/lib/jenkins/workspace/kernel_media_pipeline@2
[Pipeline] {
[Pipeline] {
[Pipeline] {
[Pipeline] stage
[Pipeline] { (docs)
[Pipeline] checkout
[Pipeline] checkout
The recommended git tool is: NONE
No credentials specified
 > git rev-parse --is-inside-work-tree # timeout=10
The recommended git tool is: NONE
Fetching changes from the remote Git repository
 > git config remote.origin.url git://linuxtv.org/media_tree.git # timeout=10
[Pipeline] node
Running on slave1 in /var/lib/jenkins/workspace/kernel_media_pipeline@2
[Pipeline] {
[Pipeline] checkout
Fetching upstream changes from git://linuxtv.org/media_tree.git
 > git --version # timeout=10
No credentials specified
The recommended git tool is: NONE
 > git --version # 'git version 2.20.1'
 > git fetch --tags --force --progress -- git://linuxtv.org/media_tree.git +refs/heads/*:refs/remotes/origin/* # timeout=120
Fetching changes from the remote Git repository
No credentials specified
Fetching changes from the remote Git repository
Checking out Revision ce79aecf608469b8b8e422928e6fca50b6ca7133 (refs/remotes/origin/master)
Checking out Revision ce79aecf608469b8b8e422928e6fca50b6ca7133 (refs/remotes/origin/master)
 > git rev-parse --is-inside-work-tree # timeout=10
 > git config remote.origin.url git://linuxtv.org/media_tree.git # timeout=10
Fetching upstream changes from git://linuxtv.org/media_tree.git
 > git --version # timeout=10
 > git --version # 'git version 2.20.1'
 > git fetch --tags --force --progress -- git://linuxtv.org/media_tree.git +refs/heads/*:refs/remotes/origin/* # timeout=120
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
 > git config core.sparsecheckout # timeout=10
 > git checkout -f ce79aecf608469b8b8e422928e6fca50b6ca7133 # timeout=10
 > git rev-parse --is-inside-work-tree # timeout=10
 > git config remote.origin.url git://linuxtv.org/media_tree.git # timeout=10
Fetching upstream changes from git://linuxtv.org/media_tree.git
 > git --version # timeout=10
 > git --version # 'git version 2.20.1'
 > git fetch --tags --force --progress -- git://linuxtv.org/media_tree.git +refs/heads/*:refs/remotes/origin/* # timeout=120
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
 > git config core.sparsecheckout # timeout=10
 > git checkout -f ce79aecf608469b8b8e422928e6fca50b6ca7133 # timeout=10
Commit message: "media: i2c: max9271: Add MODULE_* macros"
The recommended git tool is: NONE
No credentials specified
The recommended git tool is: NONE
No credentials specified
Commit message: "media: i2c: max9271: Add MODULE_* macros"
 > git rev-list --no-walk ce79aecf608469b8b8e422928e6fca50b6ca7133 # timeout=10
[GitCheckoutListener] Recording commits of 'git git://linuxtv.org/media_tree.git'
[GitCheckoutListener] Found previous build 'kernel_media_pipeline #185' that contains recorded Git commits
[GitCheckoutListener] -> Starting recording of new commits since 'ce79aecf608469b8b8e422928e6fca50b6ca7133'
[GitCheckoutListener] -> Git commit decorator could not be created for SCM 'hudson.plugins.git.GitSCM@31f84da'
[GitCheckoutListener] -> No new commits found
The recommended git tool is: NONE
[Pipeline] sh
No credentials specified
The recommended git tool is: NONE
No credentials specified
+ export CCACHE_DIR=/var/lib/jenkins/.ccache
+ export PATH=/usr/lib/ccache:/var/lib/jenkins/.local/bin:/usr/lib/ccache:/var/lib/jenkins/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/games
+ make O=docs allmodconfig
make[1]: Entering directory '/var/lib/jenkins/workspace/kernel_media_pipeline@2/docs'
  GEN     Makefile
 > git rev-parse HEAD^{commit} # timeout=10
[GitCheckoutListener] Recording commits of 'git git://linuxtv.org/media_tree.git'
[GitCheckoutListener] Found previous build 'kernel_media_pipeline #185' that contains recorded Git commits
[GitCheckoutListener] -> Starting recording of new commits since 'ce79aecf608469b8b8e422928e6fca50b6ca7133'
[GitCheckoutListener] -> Git commit decorator could not be created for SCM 'hudson.plugins.git.GitSCM@58d5356'
[GitCheckoutListener] -> No new commits found
[Pipeline] sh
 > git rev-parse HEAD^{commit} # timeout=10
+ export CCACHE_DIR=/var/lib/jenkins/.ccache
+ export PATH=/usr/lib/ccache:/usr/lib/ccache:/var/lib/jenkins/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/games
+ make O=x86_64_mod allmodconfig
make[1]: Entering directory '/var/lib/jenkins/workspace/kernel_media_pipeline/x86_64_mod'
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
+ ./scripts/config -d CHECK_SIGNATURE
  GEN     Makefile
  DESCEND  objtool
grep: .config: No such file or directory
+ ./scripts/config -d CONFIG_DEBUG_INFO
+ make O=x86_64_mod -j9
make[1]: Entering directory '/var/lib/jenkins/workspace/kernel_media_pipeline/x86_64_mod'
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
***
*** The source tree is not clean, please run 'make mrproper'
*** in /var/lib/jenkins/workspace/kernel_media_pipeline
***
make[1]: *** [/var/lib/jenkins/workspace/kernel_media_pipeline/Makefile:547: outputmakefile] Error 1
make[1]: Leaving directory '/var/lib/jenkins/workspace/kernel_media_pipeline/x86_64_mod'
make: *** [Makefile:185: __sub-make] Error 2
[Pipeline] }
[Pipeline] // node
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
Failed in branch x86_64 (builtin/mod)
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
Checking out Revision ce79aecf608469b8b8e422928e6fca50b6ca7133 (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f ce79aecf608469b8b8e422928e6fca50b6ca7133 # timeout=10
enabling CJK for LaTeX builder
Commit message: "media: i2c: max9271: Add MODULE_* macros"
[GitCheckoutListener] Skipping recording, since SCM 'git git://linuxtv.org/media_tree.git' already has been processed
[Pipeline] sh
+ export CCACHE_DIR=/var/lib/jenkins/.ccache
+ export PATH=/usr/lib/ccache:/usr/lib/ccache:/var/lib/jenkins/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games
+ make O=arm_yes CROSS_COMPILER=/usr/bin/arm-linux-gnueabihf- allyesconfig
make[1]: Entering directory '/var/lib/jenkins/workspace/kernel_media_pipeline@2/arm_yes'
  GEN     Makefile
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
+ ./scripts/config -d CHECK_SIGNATURE
grep: .config: No such file or directory
+ ./scripts/config -d CONFIG_DEBUG_INFO
+ make O=i386 ARCH=i386 -j9
make[1]: Entering directory '/var/lib/jenkins/workspace/kernel_media_pipeline@2/i386'
#
# No change to .config
#
make[1]: Leaving directory '/var/lib/jenkins/workspace/kernel_media_pipeline@2/arm_yes'
+ ./scripts/config -d CHECK_SIGNATURE
grep: .config: No such file or directory
+ ./scripts/config -d CONFIG_DEBUG_INFO
+ make O=arm_yes CROSS_COMPILER=/usr/bin/arm-linux-gnueabihf- -j9
make[1]: Entering directory '/var/lib/jenkins/workspace/kernel_media_pipeline@2/arm_yes'
***
*** The source tree is not clean, please run 'make ARCH=i386 mrproper'
*** in /var/lib/jenkins/workspace/kernel_media_pipeline@2
***
make[1]: *** [/var/lib/jenkins/workspace/kernel_media_pipeline@2/Makefile:547: outputmakefile] Error 1
make[1]: Leaving directory '/var/lib/jenkins/workspace/kernel_media_pipeline@2/i386'
make: *** [Makefile:185: __sub-make] Error 2
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
***
*** The source tree is not clean, please run 'make mrproper'
*** in /var/lib/jenkins/workspace/kernel_media_pipeline@2
***
make[1]: *** [/var/lib/jenkins/workspace/kernel_media_pipeline@2/Makefile:547: outputmakefile] Error 1
make[1]: Leaving directory '/var/lib/jenkins/workspace/kernel_media_pipeline@2/arm_yes'
make: *** [Makefile:185: __sub-make] Error 2
[Pipeline] }
[Pipeline] // node
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
Failed in branch arm/aarch64 (builtin)
[Pipeline] // parallel
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Declarative: Post Actions)
[Pipeline] step
