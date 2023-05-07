Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 803536F9A25
	for <lists+linux-media@lfdr.de>; Sun,  7 May 2023 18:43:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbjEGQnL convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Sun, 7 May 2023 12:43:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjEGQnK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 7 May 2023 12:43:10 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B73EB2D70
        for <linux-media@vger.kernel.org>; Sun,  7 May 2023 09:43:08 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1pvhTW-00H5Jp-RO; Sun, 07 May 2023 16:43:07 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1pvhTU-005ohY-FK; Sun, 07 May 2023 16:43:03 +0000
Date:   Sun, 7 May 2023 16:43:03 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <423812022.0.1683477783384@builder.linuxtv.org>
Subject: Build failed in Jenkins: linux-media #316
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: linux-media
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/linux-media/316/display/redirect>

Changes:


------------------------------------------
[...truncated 91 lines...]
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
  GEN     kernel/kheaders_data.tar.xz
Checking out Revision 20af6be6bee4c3af80aac9b44b3d32d89824dde7 (refs/remotes/origin/master)
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 20af6be6bee4c3af80aac9b44b3d32d89824dde7 # timeout=10
  CC      drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.o
  CC      drivers/media/platform/nxp/imx7-media-csi.o
  CC      drivers/media/platform/nxp/imx-mipi-csis.o
  CC      drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.o
  CC      drivers/media/platform/nxp/imx-pxp.o
  CC      drivers/media/platform/rockchip/rga/rga.o
  CC      drivers/media/platform/nxp/mx2_emmaprp.o
../drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c: In function ‘mxc_isi_channel_set_inbuf’:
../drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c:33:5: error: "CONFIG_ARCH_DMA_ADDR_T_64BIT" is not defined, evaluates to 0 [-Werror=undef]
   33 | #if CONFIG_ARCH_DMA_ADDR_T_64BIT
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c: In function ‘mxc_isi_channel_set_outbuf’:
../drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c:51:5: error: "CONFIG_ARCH_DMA_ADDR_T_64BIT" is not defined, evaluates to 0 [-Werror=undef]
   51 | #if CONFIG_ARCH_DMA_ADDR_T_64BIT
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c:66:5: error: "CONFIG_ARCH_DMA_ADDR_T_64BIT" is not defined, evaluates to 0 [-Werror=undef]
   66 | #if CONFIG_ARCH_DMA_ADDR_T_64BIT
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[7]: *** [../scripts/Makefile.build:252: drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.o] Error 1
make[7]: *** Waiting for unfinished jobs....
  CC      drivers/media/platform/samsung/exynos-gsc/gsc-core.o
make[6]: *** [../scripts/Makefile.build:494: drivers/media/platform/nxp/imx8-isi] Error 2
make[6]: *** Waiting for unfinished jobs....
  CC      drivers/media/platform/samsung/exynos-gsc/gsc-m2m.o
  CC      drivers/media/platform/samsung/exynos4-is/mipi-csis.o
  CC      drivers/media/platform/samsung/exynos4-is/fimc-lite-reg.o
  CC      drivers/media/platform/samsung/exynos-gsc/gsc-regs.o
make[5]: *** [../scripts/Makefile.build:494: drivers/media/platform/nxp] Error 2
make[5]: *** Waiting for unfinished jobs....
  CC      drivers/media/platform/samsung/exynos4-is/fimc-lite.o
  CC      drivers/media/platform/rockchip/rga/rga-hw.o
  CC      drivers/media/platform/samsung/exynos4-is/fimc-is.o
  CC      drivers/media/platform/rockchip/rga/rga-buf.o
  CC      drivers/media/platform/samsung/exynos4-is/fimc-isp.o
  CC      drivers/media/platform/samsung/exynos4-is/fimc-is-regs.o
  CC      drivers/media/platform/samsung/exynos4-is/fimc-is-param.o
  AR      drivers/media/platform/samsung/exynos-gsc/built-in.a
  CC      drivers/media/platform/samsung/s3c-camif/camif-core.o
  CC      drivers/media/platform/samsung/exynos4-is/fimc-is-errno.o
  CC      drivers/media/platform/samsung/exynos4-is/fimc-is-i2c.o
  CC      drivers/media/platform/samsung/exynos4-is/fimc-isp-video.o
  AR      drivers/media/platform/rockchip/rga/built-in.a
  CC      drivers/media/platform/rockchip/rkisp1/rkisp1-capture.o
  CC      drivers/media/platform/rockchip/rkisp1/rkisp1-common.o
  CC      drivers/media/platform/samsung/exynos4-is/fimc-core.o
  CC      drivers/media/platform/rockchip/rkisp1/rkisp1-csi.o
  CC      drivers/media/platform/samsung/exynos4-is/fimc-reg.o
  CC      drivers/media/platform/samsung/s3c-camif/camif-capture.o
  CC      drivers/media/platform/samsung/s3c-camif/camif-regs.o
  CC      drivers/media/platform/samsung/exynos4-is/fimc-m2m.o
  CC      drivers/media/platform/rockchip/rkisp1/rkisp1-dev.o
  CC      drivers/media/platform/samsung/s5p-g2d/g2d.o
  CC      drivers/media/platform/samsung/exynos4-is/fimc-capture.o
  CC      drivers/media/platform/samsung/exynos4-is/media-dev.o
  CC      drivers/media/platform/samsung/exynos4-is/common.o
Checking out Revision 20af6be6bee4c3af80aac9b44b3d32d89824dde7 (refs/remotes/origin/master)
  CC      drivers/media/platform/rockchip/rkisp1/rkisp1-isp.o
  CC      drivers/media/platform/samsung/s5p-jpeg/jpeg-core.o
  AR      drivers/media/platform/samsung/s3c-camif/built-in.a
  CC      drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.o
  CC      drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos3250.o
  CC      drivers/media/platform/samsung/s5p-g2d/g2d-hw.o
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 20af6be6bee4c3af80aac9b44b3d32d89824dde7 # timeout=10
  CC      drivers/media/platform/rockchip/rkisp1/rkisp1-stats.o
  CC      drivers/media/platform/samsung/s5p-mfc/s5p_mfc.o
  CC      drivers/media/platform/rockchip/rkisp1/rkisp1-params.o
  CC      drivers/media/platform/samsung/s5p-mfc/s5p_mfc_intr.o
  AR      drivers/media/platform/samsung/exynos4-is/built-in.a
  CC      drivers/media/platform/samsung/s5p-mfc/s5p_mfc_dec.o
  CC      drivers/media/platform/rockchip/rkisp1/rkisp1-debug.o
  CC      drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos4.o
  AR      drivers/media/platform/samsung/s5p-g2d/built-in.a
  CC      drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-s5p.o
  CC      drivers/media/platform/samsung/s5p-mfc/s5p_mfc_enc.o
  AR      drivers/media/platform/rockchip/rkisp1/built-in.a
  AR      drivers/media/platform/rockchip/built-in.a
  CC      drivers/media/platform/samsung/s5p-mfc/s5p_mfc_ctrl.o
  CC      drivers/media/platform/samsung/s5p-mfc/s5p_mfc_pm.o
  AR      drivers/media/platform/samsung/s5p-jpeg/built-in.a
  CC      drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr.o
  CC      drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v5.o
  CC      drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.o
  CC      drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd.o
  CC      drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v5.o
  CC      drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.o
  AR      drivers/media/platform/samsung/s5p-mfc/built-in.a
  AR      drivers/media/platform/samsung/built-in.a
make[4]: *** [../scripts/Makefile.build:494: drivers/media/platform] Error 2
make[3]: *** [../scripts/Makefile.build:494: drivers/media] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [../scripts/Makefile.build:494: drivers] Error 2
make[2]: *** Waiting for unfinished jobs....
Commit message: "media: nxp: imx8-isi: Remove 300ms sleep after enabling channel"
[GitCheckoutListener] Skipping recording, since SCM 'git git://linuxtv.org/media_tree.git' already has been processed
[Pipeline] sh
+ export CCACHE_DIR=/var/lib/jenkins/.ccache
+ export PATH=/usr/lib/ccache:/usr/local/bin:/usr/bin:/bin:/usr/games
+ make O=arm_yes CROSS_COMPILER=/usr/bin/arm-linux-gnueabihf- allyesconfig
make[1]: Entering directory '/var/lib/jenkins/workspace/linux-media@2/arm_yes'
  GEN     Makefile
  CC      kernel/kheaders.o
  AR      kernel/built-in.a
make[1]: *** [/var/lib/jenkins/workspace/linux-media@2/Makefile:2028: .] Error 2
make[1]: Leaving directory '/var/lib/jenkins/workspace/linux-media@2/i386'
make: *** [Makefile:226: __sub-make] Error 2
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
Commit message: "media: nxp: imx8-isi: Remove 300ms sleep after enabling channel"
[GitCheckoutListener] Skipping recording, since SCM 'git git://linuxtv.org/media_tree.git' already has been processed
[Pipeline] sh
+ export CCACHE_DIR=/var/lib/jenkins/.ccache
+ export PATH=/usr/lib/ccache:/usr/lib/ccache:/var/lib/jenkins/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/games
+ make O=x86_64_mod allmodconfig
make[1]: Entering directory '/var/lib/jenkins/workspace/linux-media/x86_64_mod'
  GEN     Makefile
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
  CHK     kernel/kheaders_data.tar.xz
  LD      vmlinux.o
Kernel: arch/x86/boot/bzImage is ready  (#1)
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
