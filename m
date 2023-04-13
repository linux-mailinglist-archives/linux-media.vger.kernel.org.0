Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F0536E04D4
	for <lists+linux-media@lfdr.de>; Thu, 13 Apr 2023 04:48:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230167AbjDMCrz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Apr 2023 22:47:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230210AbjDMCrm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Apr 2023 22:47:42 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F36FC93D0
        for <linux-media@vger.kernel.org>; Wed, 12 Apr 2023 19:46:54 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1pmmxr-00Haw3-Jc; Thu, 13 Apr 2023 02:45:35 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1pmmxp-0002CW-GA; Thu, 13 Apr 2023 02:45:33 +0000
Date:   Thu, 13 Apr 2023 02:45:31 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <2085275934.0.1681353932615@builder.linuxtv.org>
Subject: Build failed in Jenkins: linux-media #314
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: linux-media
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/linux-media/314/display/redirect>

Changes:


------------------------------------------
Started by an SCM change
[Pipeline] Start of Pipeline
[Pipeline] node
Running on slave0 in /var/lib/jenkins/workspace/linux-media
[Pipeline] {
[Pipeline] timeout
Timeout set to expire in 6 hr 0 min
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
Running on slave2 in /var/lib/jenkins/workspace/linux-media
Running on slave0 in /var/lib/jenkins/workspace/linux-media@2
[Pipeline] {
[Pipeline] {
[Pipeline] checkout
[Pipeline] checkout
The recommended git tool is: NONE
The recommended git tool is: NONE
Running on slave1 in /var/lib/jenkins/workspace/linux-media
[Pipeline] {
[Pipeline] stage
[Pipeline] { (docs)
[Pipeline] node
Running on slave1 in /var/lib/jenkins/workspace/linux-media@2
[Pipeline] {
[Pipeline] checkout
The recommended git tool is: NONE
No credentials specified
Fetching changes from the remote Git repository
 > git rev-parse --resolve-git-dir /var/lib/jenkins/workspace/linux-media@2/.git # timeout=10
 > git config remote.origin.url git://linuxtv.org/media_tree.git # timeout=10
Fetching upstream changes from git://linuxtv.org/media_tree.git
 > git --version # timeout=10
 > git --version # 'git version 2.30.2'
 > git fetch --tags --force --progress -- git://linuxtv.org/media_tree.git +refs/heads/*:refs/remotes/origin/* # timeout=120
No credentials specified
Fetching changes from the remote Git repository
 > git rev-parse --resolve-git-dir /var/lib/jenkins/workspace/linux-media/.git # timeout=10
 > git config remote.origin.url git://linuxtv.org/media_tree.git # timeout=10
Fetching upstream changes from git://linuxtv.org/media_tree.git
 > git --version # timeout=10
 > git --version # 'git version 2.30.2'
 > git fetch --tags --force --progress -- git://linuxtv.org/media_tree.git +refs/heads/*:refs/remotes/origin/* # timeout=120
No credentials specified
Fetching changes from the remote Git repository
 > git rev-parse --resolve-git-dir /var/lib/jenkins/workspace/linux-media@2/.git # timeout=10
 > git config remote.origin.url git://linuxtv.org/media_tree.git # timeout=10
Fetching upstream changes from git://linuxtv.org/media_tree.git
 > git --version # timeout=10
 > git --version # 'git version 2.30.2'
 > git fetch --tags --force --progress -- git://linuxtv.org/media_tree.git +refs/heads/*:refs/remotes/origin/* # timeout=120
Checking out Revision eeac8ede17557680855031c6f305ece2378af326 (refs/remotes/origin/master)
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
 > git config core.sparsecheckout # timeout=10
 > git checkout -f eeac8ede17557680855031c6f305ece2378af326 # timeout=10
Commit message: "Linux 6.3-rc2"
 > git rev-list --no-walk 57c3b9f55ba875a6f6295fa59f0bdc0a01c544f8 # timeout=10
The recommended git tool is: NONE
No credentials specified
The recommended git tool is: NONE
No credentials specified
 > git rev-parse HEAD^{commit} # timeout=10
[GitCheckoutListener] Recording commits of 'git git://linuxtv.org/media_tree.git'
[GitCheckoutListener] Found previous build 'linux-media #254' that contains recorded Git commits
[GitCheckoutListener] -> Starting recording of new commits since '57c3b9f'
[GitCheckoutListener] -> Single parent commit found - branch is already descendant of target branch head
[GitCheckoutListener] -> Using head commit 'eeac8ed' as starting point
[GitCheckoutListener] -> Recorded 200 new commits
[GitCheckoutListener] -> Git commit decorator could not be created for SCM 'hudson.plugins.git.GitSCM@d3c1b11'
[Pipeline] sh
+ export CCACHE_DIR=/var/lib/jenkins/.ccache
+ export PATH=/usr/lib/ccache:/var/lib/jenkins/.local/bin:/usr/lib/ccache:/var/lib/jenkins/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/games
+ make O=docs allmodconfig
make[1]: Entering directory '/var/lib/jenkins/workspace/linux-media@2/docs'
  GEN     Makefile
#
# No change to .config
#
make[1]: Leaving directory '/var/lib/jenkins/workspace/linux-media@2/docs'
+ make O=docs -j9 init
make[1]: Entering directory '/var/lib/jenkins/workspace/linux-media@2/docs'
make[1]: Nothing to be done for 'init'.
make[1]: Leaving directory '/var/lib/jenkins/workspace/linux-media@2/docs'
+ make O=docs htmldocs
make[1]: Entering directory '/var/lib/jenkins/workspace/linux-media@2/docs'
make[3]: Nothing to be done for 'html'.
Using alabaster theme
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
  CALL    ../scripts/checksyscalls.sh
  CHK     kernel/kheaders_data.tar.xz
Checking out Revision eeac8ede17557680855031c6f305ece2378af326 (refs/remotes/origin/master)
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
 > git config core.sparsecheckout # timeout=10
 > git checkout -f eeac8ede17557680855031c6f305ece2378af326 # timeout=10
Commit message: "Linux 6.3-rc2"
[GitCheckoutListener] Skipping recording, since SCM 'git git://linuxtv.org/media_tree.git' already has been processed
[Pipeline] sh
+ export CCACHE_DIR=/var/lib/jenkins/.ccache
+ export PATH=/usr/lib/ccache:/usr/lib/ccache:/var/lib/jenkins/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/games
+ make O=x86_64_mod allmodconfig
make[1]: Entering directory '/var/lib/jenkins/workspace/linux-media/x86_64_mod'
  GEN     Makefile
Kernel: arch/x86/boot/bzImage is ready  (#51)
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
Checking out Revision eeac8ede17557680855031c6f305ece2378af326 (refs/remotes/origin/master)
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
 > git config core.sparsecheckout # timeout=10
 > git checkout -f eeac8ede17557680855031c6f305ece2378af326 # timeout=10
Commit message: "Linux 6.3-rc2"
[GitCheckoutListener] Skipping recording, since SCM 'git git://linuxtv.org/media_tree.git' already has been processed
[Pipeline] sh
+ export CCACHE_DIR=/var/lib/jenkins/.ccache
+ export PATH=/usr/lib/ccache:/usr/local/bin:/usr/bin:/bin:/usr/games
+ make O=arm_yes CROSS_COMPILER=/usr/bin/arm-linux-gnueabihf- allyesconfig
make[1]: Entering directory '/var/lib/jenkins/workspace/linux-media@2/arm_yes'
  GEN     Makefile
#
# configuration written to .config
#
make[1]: Leaving directory '/var/lib/jenkins/workspace/linux-media/x86_64_mod'
+ ./scripts/config --file x86_64_mod/.config -d MODULE_SIG -d KEYS -d IMA -d CONFIG_DEBUG_INFO -d SYSTEM_TRUSTED_KEYRING -d MODVERSIONS
+ make O=x86_64_mod -j9
make[1]: Entering directory '/var/lib/jenkins/workspace/linux-media/x86_64_mod'
  SYNC    include/config/auto.conf.cmd
  GEN     Makefile
  GEN     Makefile
  DESCEND objtool
  INSTALL libsubcmd_headers
  CALL    ../scripts/checksyscalls.sh
  CHK     kernel/kheaders_data.tar.xz
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
  DESCEND objtool
  INSTALL libsubcmd_headers
  CALL    ../scripts/checksyscalls.sh
  CHK     kernel/kheaders_data.tar.xz
  LD      vmlinux.o
Kernel: arch/x86/boot/bzImage is ready  (#4)
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
  INSTALL libsubcmd_headers
  CALL    ../scripts/checksyscalls.sh
  CHK     kernel/kheaders_data.tar.xz
  LD      vmlinux.o
Killed
make[2]: *** [../scripts/Makefile.vmlinux_o:61: vmlinux.o] Error 137
make[2]: *** Deleting file 'vmlinux.o'
make[1]: *** [/var/lib/jenkins/workspace/linux-media@2/Makefile:1231: vmlinux_o] Error 2
make[1]: Leaving directory '/var/lib/jenkins/workspace/linux-media@2/arm_yes'
make: *** [Makefile:226: __sub-make] Error 2
[Pipeline] }
[Pipeline] // node
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
Failed in branch arm/aarch64 (builtin)
vmlinux.o: warning: objtool: vmx_vcpu_enter_exit+0x2d8: call to vmread_error_trampoline() leaves .noinstr.text section
vmlinux.o: warning: objtool: lkdtm_UNSET_SMEP+0xe1: relocation to !ENDBR: native_write_cr4+0x40
Killed
make[2]: *** [../scripts/Makefile.vmlinux_o:61: vmlinux.o] Error 137
make[2]: *** Deleting file 'vmlinux.o'
make[1]: *** [/var/lib/jenkins/workspace/linux-media/Makefile:1231: vmlinux_o] Error 2
make[1]: Leaving directory '/var/lib/jenkins/workspace/linux-media/x86_64_yes'
make: *** [Makefile:226: __sub-make] Error 2
[Pipeline] }
[Pipeline] // node
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
Failed in branch x86_64 (builtin/mod)
[Pipeline] // parallel
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Declarative: Post Actions)
[Pipeline] step
