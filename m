Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 817073F2D1C
	for <lists+linux-media@lfdr.de>; Fri, 20 Aug 2021 15:27:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229829AbhHTN2e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Aug 2021 09:28:34 -0400
Received: from www.linuxtv.org ([130.149.80.248]:44238 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229707AbhHTN2d (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Aug 2021 09:28:33 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mH4Ys-007RHd-6z; Fri, 20 Aug 2021 13:27:54 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mH4Yr-00DSbZ-9K; Fri, 20 Aug 2021 13:27:52 +0000
Date:   Fri, 20 Aug 2021 13:27:52 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <920196211.1.1629466072205@builder.linuxtv.org>
Subject: Build failed in Jenkins: linux-media #244
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: linux-media
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/linux-media/244/display/redirect>

Changes:


------------------------------------------
[...truncated 46 lines...]
Fetching upstream changes from git://linuxtv.org/media_tree.git
 > git --version # timeout=10
 > git --version # 'git version 2.30.2'
 > git fetch --tags --force --progress -- git://linuxtv.org/media_tree.git +refs/heads/*:refs/remotes/origin/* # timeout=120
 > git rev-parse --resolve-git-dir /var/lib/jenkins/workspace/linux-media@2/.git # timeout=10
 > git config remote.origin.url git://linuxtv.org/media_tree.git # timeout=10
Fetching upstream changes from git://linuxtv.org/media_tree.git
 > git --version # timeout=10
 > git --version # 'git version 2.30.2'
 > git fetch --tags --force --progress -- git://linuxtv.org/media_tree.git +refs/heads/*:refs/remotes/origin/* # timeout=120
 > git rev-parse --resolve-git-dir /var/lib/jenkins/workspace/linux-media@2/.git # timeout=10
 > git config remote.origin.url git://linuxtv.org/media_tree.git # timeout=10
Fetching upstream changes from git://linuxtv.org/media_tree.git
 > git --version # timeout=10
 > git --version # 'git version 2.30.2'
 > git fetch --tags --force --progress -- git://linuxtv.org/media_tree.git +refs/heads/*:refs/remotes/origin/* # timeout=120
Checking out Revision 9c3a0f285248899dfa81585bc5d5bc9ebdb8fead (refs/remotes/origin/master)
Checking out Revision 9c3a0f285248899dfa81585bc5d5bc9ebdb8fead (refs/remotes/origin/master)
Commit message: "Merge tag 'v5.14-rc4' into media_tree"
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 9c3a0f285248899dfa81585bc5d5bc9ebdb8fead # timeout=10
 > git rev-list --no-walk 9c3a0f285248899dfa81585bc5d5bc9ebdb8fead # timeout=10
The recommended git tool is: NONE
No credentials specified
The recommended git tool is: NONE
No credentials specified
[GitCheckoutListener] Recording commits of 'git git://linuxtv.org/media_tree.git'
[GitCheckoutListener] Found previous build 'linux-media #240' that contains recorded Git commits
[GitCheckoutListener] -> Starting recording of new commits since '9c3a0f2'
[GitCheckoutListener] -> Using head commit '9c3a0f2' as starting point
[GitCheckoutListener] -> Git commit decorator could not be created for SCM 'hudson.plugins.git.GitSCM@4f356adb'
[GitCheckoutListener] -> No new commits found
[Pipeline] sh
Commit message: "Merge tag 'v5.14-rc4' into media_tree"
[GitCheckoutListener] Skipping recording, since SCM 'git git://linuxtv.org/media_tree.git' already has been processed
[Pipeline] sh
+ export CCACHE_DIR=/var/lib/jenkins/.ccache
+ export PATH=/usr/lib/ccache:/var/lib/jenkins/.local/bin:/usr/lib/ccache:/var/lib/jenkins/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/games
+ make O=docs allmodconfig
make[1]: Entering directory '/var/lib/jenkins/workspace/linux-media@2/docs'
  GEN     Makefile
+ export CCACHE_DIR=/var/lib/jenkins/.ccache
+ export PATH=/usr/lib/ccache:/usr/lib/ccache:/var/lib/jenkins/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/games
+ make O=x86_64_mod allmodconfig
make[1]: Entering directory '/var/lib/jenkins/workspace/linux-media/x86_64_mod'
  GEN     Makefile
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 9c3a0f285248899dfa81585bc5d5bc9ebdb8fead # timeout=10
 > git rev-parse HEAD^{commit} # timeout=10
#
# No change to .config
#
make[1]: Leaving directory '/var/lib/jenkins/workspace/linux-media@2/docs'
+ make O=docs -j9 init
make[1]: Entering directory '/var/lib/jenkins/workspace/linux-media@2/docs'
  GEN     Makefile
  DESCEND objtool
  CALL    ../scripts/atomic/check-atomics.sh
  CALL    ../scripts/checksyscalls.sh
  CHK     include/generated/compile.h
make[1]: Leaving directory '/var/lib/jenkins/workspace/linux-media@2/docs'
+ make O=docs htmldocs
make[1]: Entering directory '/var/lib/jenkins/workspace/linux-media@2/docs'
#
# configuration written to .config
#
make[1]: Leaving directory '/var/lib/jenkins/workspace/linux-media/x86_64_mod'
+ ./scripts/config --file x86_64_mod/.config -d MODULE_SIG -d KEYS -d IMA -d CONFIG_DEBUG_INFO -d SYSTEM_TRUSTED_KEYRING -d MODVERSIONS
+ make O=x86_64_mod -j9
make[1]: Entering directory '/var/lib/jenkins/workspace/linux-media/x86_64_mod'
Warning: /sys/bus/iio/devices/triggerX/sampling_frequency is defined 2 times:  ../Documentation/ABI/testing/sysfs-bus-iio-timer-stm32:92  ../Documentation/ABI/testing/sysfs-bus-iio:91
  SPHINX  htmldocs --> file:///var/lib/jenkins/workspace/linux-media@2/docs/Documentation/output
make[3]: Nothing to be done for 'html'.
  SYNC    include/config/auto.conf.cmd
Checking out Revision 9c3a0f285248899dfa81585bc5d5bc9ebdb8fead (refs/remotes/origin/master)
  GEN     Makefile
Warning: The Sphinx 'sphinx_rtd_theme' HTML theme was not found. Make sure you have the theme installed to produce pretty HTML output. Falling back to the default theme.
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 9c3a0f285248899dfa81585bc5d5bc9ebdb8fead # timeout=10
  GEN     Makefile
  DESCEND objtool
  CALL    ../scripts/atomic/check-atomics.sh
  CALL    ../scripts/checksyscalls.sh
  CHK     include/generated/compile.h
make[1]: Leaving directory '/var/lib/jenkins/workspace/linux-media@2/docs'
[Pipeline] }
[Pipeline] // node
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (i386 (builtin))
[Pipeline] node
Running on slave1 in /var/lib/jenkins/workspace/linux-media@2
[Pipeline] {
[Pipeline] sh
+ export CCACHE_DIR=/var/lib/jenkins/.ccache
+ export PATH=/usr/lib/ccache:/usr/lib/ccache:/var/lib/jenkins/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/games
+ make O=i386 ARCH=i386 allyesconfig
make[1]: Entering directory '/var/lib/jenkins/workspace/linux-media@2/i386'
  GEN     Makefile
  CHK     kernel/kheaders_data.tar.xz
#
# configuration written to .config
#
make[1]: Leaving directory '/var/lib/jenkins/workspace/linux-media@2/i386'
+ ./scripts/config --file i386/.config -d MODULE_SIG -d KEYS -d IMA -d CONFIG_DEBUG_INFO -d SYSTEM_TRUSTED_KEYRING -d MODVERSIONS
+ make O=i386 ARCH=i386 -j9
make[1]: Entering directory '/var/lib/jenkins/workspace/linux-media@2/i386'
  SYNC    include/config/auto.conf.cmd
  GEN     Makefile
  GEN     Makefile
  CALL    ../scripts/atomic/check-atomics.sh
  CALL    ../scripts/checksyscalls.sh
  CHK     include/generated/compile.h
  CHK     kernel/kheaders_data.tar.xz
Kernel: arch/x86/boot/bzImage is ready  (#50)
make[1]: Leaving directory '/var/lib/jenkins/workspace/linux-media@2/i386'
[Pipeline] }
[Pipeline] // node
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // node
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
Commit message: "Merge tag 'v5.14-rc4' into media_tree"
[GitCheckoutListener] Skipping recording, since SCM 'git git://linuxtv.org/media_tree.git' already has been processed
[Pipeline] sh
+ export CCACHE_DIR=/var/lib/jenkins/.ccache
+ export PATH=/usr/lib/ccache:/usr/local/bin:/usr/bin:/bin:/usr/games
+ make O=arm_yes CROSS_COMPILER=/usr/bin/arm-linux-gnueabihf- allyesconfig
make[1]: Entering directory '/var/lib/jenkins/workspace/linux-media@2/arm_yes'
  GEN     Makefile
  HOSTCC  scripts/basic/fixdep
Kernel: arch/x86/boot/bzImage is ready  (#6)
  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/confdata.o
  HOSTCC  scripts/kconfig/expr.o
  LEX     scripts/kconfig/lexer.lex.c
  YACC    scripts/kconfig/parser.tab.[ch]
  HOSTCC  scripts/kconfig/lexer.lex.o
  HOSTCC  scripts/kconfig/menu.o
  HOSTCC  scripts/kconfig/parser.tab.o
  HOSTCC  scripts/kconfig/preprocess.o
  HOSTCC  scripts/kconfig/symbol.o
  HOSTCC  scripts/kconfig/util.o
  HOSTLD  scripts/kconfig/conf
#
# configuration written to .config
#
make[1]: Leaving directory '/var/lib/jenkins/workspace/linux-media@2/arm_yes'
+ ./scripts/config --file arm_yes/.config -d MODULE_SIG -d KEYS -d IMA -d CONFIG_DEBUG_INFO -d SYSTEM_TRUSTED_KEYRING -d MODVERSIONS
+ make O=arm_yes CROSS_COMPILER=/usr/bin/arm-linux-gnueabihf- -j9
make[1]: Entering directory '/var/lib/jenkins/workspace/linux-media@2/arm_yes'
  SYNC    include/config/auto.conf.cmd
  GEN     Makefile
  GEN     Makefile
  UPD     include/config/kernel.release
  HOSTCC  arch/x86/tools/relocs_32.o
  HOSTCC  arch/x86/tools/relocs_64.o
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_32.h
  HOSTCC  scripts/unifdef
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_64.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_x32.h
  HOSTCC  arch/x86/tools/relocs_common.o
  SYSTBL  arch/x86/include/generated/asm/syscalls_32.h
  SYSHDR  arch/x86/include/generated/asm/unistd_32_ia32.h
  SYSHDR  arch/x86/include/generated/asm/unistd_64_x32.h
  SYSTBL  arch/x86/include/generated/asm/syscalls_64.h
  SYSTBL  arch/x86/include/generated/asm/syscalls_x32.h
  HYPERCALLS arch/x86/include/generated/asm/xen-hypercalls.h
  DESCEND objtool
  UPD     include/generated/utsrelease.h
  HOSTCC  scripts/dtc/dtc.o
  HOSTCC  scripts/dtc/flattree.o
  HOSTCC  scripts/dtc/fstree.o
  HOSTCC  scripts/dtc/data.o
  HOSTCC  scripts/dtc/livetree.o
  HOSTCC  scripts/dtc/treesource.o
  HOSTCC  scripts/dtc/srcpos.o
  HOSTCC  scripts/dtc/checks.o
  HOSTLD  arch/x86/tools/relocs
  HOSTCC  scripts/dtc/util.o
  LEX     scripts/dtc/dtc-lexer.lex.c
  YACC    scripts/dtc/dtc-parser.tab.[ch]
make[5]: *** No rule to make target '/usr/lib/gcc/x86_64-linux-gnu/8/include/stddef.h', needed by '/var/lib/jenkins/workspace/linux-media@2/arm_yes/tools/objtool/fixdep.o'.  Stop.
make[4]: *** [Makefile:47: /var/lib/jenkins/workspace/linux-media@2/arm_yes/tools/objtool/fixdep-in.o] Error 2
make[3]: *** [/var/lib/jenkins/workspace/linux-media@2/tools/build/Makefile.include:5: fixdep] Error 2
make[2]: *** [Makefile:69: objtool] Error 2
make[1]: *** [/var/lib/jenkins/workspace/linux-media@2/Makefile:1355: tools/objtool] Error 2
make[1]: *** Waiting for unfinished jobs....
  HOSTCC  scripts/dtc/libfdt/fdt.o
  HOSTCC  scripts/dtc/libfdt/fdt_ro.o
  HOSTCC  scripts/dtc/libfdt/fdt_wip.o
  HOSTCC  scripts/dtc/libfdt/fdt_sw.o
  HOSTCC  scripts/dtc/libfdt/fdt_rw.o
  HOSTCC  scripts/dtc/libfdt/fdt_strerror.o
  HOSTCC  scripts/dtc/libfdt/fdt_empty_tree.o
  HOSTCC  scripts/dtc/libfdt/fdt_addresses.o
  HOSTCC  scripts/dtc/libfdt/fdt_overlay.o
  HOSTCC  scripts/dtc/fdtoverlay.o
  HOSTCC  scripts/dtc/dtc-lexer.lex.o
  HOSTCC  scripts/dtc/dtc-parser.tab.o
  HOSTLD  scripts/dtc/dtc
  HOSTLD  scripts/dtc/fdtoverlay
make[1]: Leaving directory '/var/lib/jenkins/workspace/linux-media@2/arm_yes'
make: *** [Makefile:220: __sub-make] Error 2
[Pipeline] }
[Pipeline] // node
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
Failed in branch arm/aarch64 (builtin)
make[1]: Leaving directory '/var/lib/jenkins/workspace/linux-media/x86_64_mod'
+ make O=x86_64_yes allyesconfig
make[1]: Entering directory '/var/lib/jenkins/workspace/linux-media/x86_64_yes'
  GEN     Makefile
#
# configuration written to .config
#
make[1]: Leaving directory '/var/lib/jenkins/workspace/linux-media/x86_64_yes'
+ ./scripts/config --file x86_64_yes/.config -d MODULE_SIG -d KEYS -d IMA -d CONFIG_DEBUG_INFO -d SYSTEM_TRUSTED_KEYRING -d MODVERSIONS
+ make O=x86_64_yes -j9
make[1]: Entering directory '/var/lib/jenkins/workspace/linux-media/x86_64_yes'
  SYNC    include/config/auto.conf.cmd
  GEN     Makefile
  GEN     Makefile
  DESCEND objtool
  CALL    ../scripts/atomic/check-atomics.sh
  CALL    ../scripts/checksyscalls.sh
  CHK     include/generated/compile.h
  CHK     kernel/kheaders_data.tar.xz
Kernel: arch/x86/boot/bzImage is ready  (#17)
make[1]: Leaving directory '/var/lib/jenkins/workspace/linux-media/x86_64_yes'
[Pipeline] }
[Pipeline] // node
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // parallel
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Declarative: Post Actions)
[Pipeline] step
