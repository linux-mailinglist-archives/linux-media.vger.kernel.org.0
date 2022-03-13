Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D22764D74F0
	for <lists+linux-media@lfdr.de>; Sun, 13 Mar 2022 12:13:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233271AbiCMLOS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Mar 2022 07:14:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233239AbiCMLOR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Mar 2022 07:14:17 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E55C06553
        for <linux-media@vger.kernel.org>; Sun, 13 Mar 2022 04:13:07 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nTM9n-006FeH-6W; Sun, 13 Mar 2022 11:13:03 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nTM9l-003FTz-Mb; Sun, 13 Mar 2022 11:13:01 +0000
Date:   Sun, 13 Mar 2022 11:13:01 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        mchehab@linuxtv.org
Message-ID: <553929738.1.1647169981147@builder.linuxtv.org>
Subject: Build failed in Jenkins: media_stage_clang #430
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: media_stage_clang
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/media_stage_clang/430/display/redirect?page=changes>

Changes:

[Mauro Carvalho Chehab] media: platform: rename coda/ to chips-media/

[Mauro Carvalho Chehab] media: platform: rename marvell-ccic/ to marvell/

[Mauro Carvalho Chehab] media: platform: rename meson/ge2d/ to amlogic/meson-ge2d/

[Mauro Carvalho Chehab] media: platform: rename mtk-jpeg/ to mediatek/mtk-jpeg/

[Mauro Carvalho Chehab] media: platform: rename mtk-mdp/ to mediatek/mtk-mdp/

[Mauro Carvalho Chehab] media: platform: rename mtk-vcodec/ to mediatek/mtk-vcodec/

[Mauro Carvalho Chehab] media: platform: rename mtk-vpu/ to mediatek/mtk-vpu/

[Mauro Carvalho Chehab] media: platform: rename sunxi/ to allwinner/

[Mauro Carvalho Chehab] media: platform: rename tegra/vde/ to nvidia/tegra-vde/

[Mauro Carvalho Chehab] media: platform: rename amphion/ to nxp/amphion/

[Mauro Carvalho Chehab] media: platform: rename exynos4-is/ to samsung/exynos4-is/

[Mauro Carvalho Chehab] media: platform: rename exynos-gsc/ to samsung/exynos-gsc/

[Mauro Carvalho Chehab] media: platform: rename s3c-camif/ to samsung/s3c-camif/

[Mauro Carvalho Chehab] media: platform: rename s5p-g2d/ to samsung/s5p-g2d/

[Mauro Carvalho Chehab] media: platform: rename s5p-jpeg/ to samsung/s5p-jpeg/

[Mauro Carvalho Chehab] media: platform: rename s5p-mfc/ to samsung/s5p-mfc/

[Mauro Carvalho Chehab] media: platform: rename stm32/ to sti/stm32/

[Mauro Carvalho Chehab] media: platform: rename am437x/ to ti/am437x/

[Mauro Carvalho Chehab] media: platform: rename davinci/ to ti/davinci/

[Mauro Carvalho Chehab] media: platform: rename omap3isp/ to ti/omap3isp/

[Mauro Carvalho Chehab] media: platform: rename omap/ to ti/omap/

[Mauro Carvalho Chehab] media: platform: rename ti-vpe/ to ti/vpe/

[Mauro Carvalho Chehab] media: platform: Create vendor/{Makefile,Kconfig} files

[Mauro Carvalho Chehab] media: Kconfig: cleanup VIDEO_DEV dependencies

[Mauro Carvalho Chehab] media: platform/*/Kconfig: make menus more uniform


------------------------------------------
Started by an SCM change
Running as SYSTEM
Building remotely on slave2 in workspace <https://builder.linuxtv.org/job/media_stage_clang/ws/>
The recommended git tool is: NONE
No credentials specified
 > git rev-parse --resolve-git-dir <https://builder.linuxtv.org/job/media_stage_clang/ws/.git> # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url git://linuxtv.org/media_stage.git # timeout=10
Fetching upstream changes from git://linuxtv.org/media_stage.git
 > git --version # timeout=10
 > git --version # 'git version 2.30.2'
 > git fetch --tags --force --progress -- git://linuxtv.org/media_stage.git +refs/heads/*:refs/remotes/origin/* # timeout=30
Seen branch in repository origin/master
Seen 1 remote branch
 > git show-ref --tags -d # timeout=10
Checking out Revision 9d8c4cc1be6c37e66662141f1a3ebc8b54cb8dae (origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 9d8c4cc1be6c37e66662141f1a3ebc8b54cb8dae # timeout=10
Commit message: "media: platform/*/Kconfig: make menus more uniform"
 > git rev-list --no-walk 42ae3d28d4d822f3e14db76b99f2f4c41688ae3e # timeout=10
The recommended git tool is: NONE
No credentials specified
 > git rev-parse 9d8c4cc1be6c37e66662141f1a3ebc8b54cb8dae^{commit} # timeout=10
The recommended git tool is: NONE
No credentials specified
[GitCheckoutListener] Recording commits of 'git git://linuxtv.org/media_stage.git'
[GitCheckoutListener] Found previous build 'media_stage_clang #429' that contains recorded Git commits
[GitCheckoutListener] -> Starting recording of new commits since '42ae3d2'
[GitCheckoutListener] -> Using head commit '9d8c4cc' as starting point
[GitCheckoutListener] -> Git commit decorator could not be created for SCM 'hudson.plugins.git.GitSCM@3d1a7699'
[GitCheckoutListener] -> Recorded 200 new commits
[media_stage_clang] $ /bin/sh -xe /tmp/jenkins4429907763665756315.sh
+ export CCACHE_DIR=/var/lib/jenkins/.ccache
+ export PATH=/usr/lib/ccache:/usr/lib/ccache:/var/lib/jenkins/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/games
+ make W=1 CC=clang-12 HOSTCC=clang-12 allyesconfig
#
# configuration written to .config
#
+ ./scripts/config -d MODULE_SIG -d KEYS -d IMA -d CONFIG_DEBUG_INFO -d SYSTEM_TRUSTED_KEYRING -d MODVERSIONS -d CHECK_SIGNATURE
+ make W=1 CC=clang-12 HOSTCC=clang-12 init
  SYNC    include/config/auto.conf.cmd
  DESCEND objtool
  CALL    scripts/atomic/check-atomics.sh
  CALL    scripts/checksyscalls.sh
  CHK     include/generated/compile.h
+ make W=1 CC=clang-12 HOSTCC=clang-12 -j9 drivers/staging/media/
  DESCEND objtool
  CALL    scripts/atomic/check-atomics.sh
  CALL    scripts/checksyscalls.sh
+ make W=1 CC=clang-12 HOSTCC=clang-12 -j9 drivers/media/
  DESCEND objtool
  CALL    scripts/atomic/check-atomics.sh
  CALL    scripts/checksyscalls.sh
  CC      drivers/media/platform/allwinner/sun4i-csi/sun4i_csi.o
  CC      drivers/media/platform/allwinner/sun6i-csi/sun6i_video.o
  CC      drivers/media/platform/allwinner/sun8i-di/sun8i-di.o
  CC      drivers/media/platform/allwinner/sun6i-csi/sun6i_csi.o
  CC      drivers/media/platform/allwinner/sun8i-rotate/sun8i_rotate.o
  CC      drivers/media/platform/allwinner/sun8i-rotate/sun8i_formats.o
  CC      drivers/media/platform/allwinner/sun4i-csi/sun4i_dma.o
  AR      drivers/media/platform/allwinner/sun6i-csi/built-in.a
  AR      drivers/media/platform/allwinner/sun8i-rotate/built-in.a
  CC      drivers/media/platform/allwinner/sun4i-csi/sun4i_v4l2.o
  CC      drivers/media/platform/amlogic/meson-ge2d/ge2d.o
  CC      drivers/media/platform/chips-media/coda-common.o
  CC      drivers/media/platform/marvell/cafe-driver.o
  CC      drivers/media/platform/marvell/mcam-core.o
  CC      drivers/media/platform/marvell/mmp-driver.o
  CC      drivers/media/platform/mediatek/mtk-jpeg/mtk_jpeg_core.o
  AR      drivers/media/platform/allwinner/sun8i-di/built-in.a
  CC      drivers/media/platform/mediatek/mtk-jpeg/mtk_jpeg_dec_hw.o
  CC      drivers/media/platform/chips-media/coda-bit.o
  AR      drivers/media/platform/allwinner/sun4i-csi/built-in.a
  AR      drivers/media/platform/allwinner/built-in.a
  CC      drivers/media/platform/chips-media/coda-gdi.o
  CC      drivers/media/platform/chips-media/coda-h264.o
  CC      drivers/media/platform/mediatek/mtk-jpeg/mtk_jpeg_dec_parse.o
  CC      drivers/media/platform/mediatek/mtk-jpeg/mtk_jpeg_enc_hw.o
  AR      drivers/media/platform/amlogic/meson-ge2d/built-in.a
  AR      drivers/media/platform/amlogic/built-in.a
  CC      drivers/media/platform/chips-media/coda-mpeg2.o
  CC      drivers/media/platform/chips-media/coda-mpeg4.o
  AR      drivers/media/platform/marvell/built-in.a
  CC      drivers/media/platform/chips-media/coda-jpeg.o
  CC      drivers/media/platform/chips-media/imx-vdoa.o
scripts/Makefile.build:44: drivers/media/platform/nvidia/Makefile: No such file or directory
make[4]: *** No rule to make target 'drivers/media/platform/nvidia/Makefile'.  Stop.
make[3]: *** [scripts/Makefile.build:550: drivers/media/platform/nvidia] Error 2
make[3]: *** Waiting for unfinished jobs....
  CC      drivers/media/platform/mediatek/mtk-mdp/mtk_mdp_core.o
  CC      drivers/media/platform/mediatek/mtk-vcodec/vdec/vdec_h264_if.o
  AR      drivers/media/platform/mediatek/mtk-jpeg/built-in.a
  CC      drivers/media/platform/mediatek/mtk-vcodec/vdec/vdec_vp8_if.o
  CC      drivers/media/platform/mediatek/mtk-vpu/mtk_vpu.o
  CC      drivers/media/platform/mediatek/mtk-vcodec/vdec/vdec_vp9_if.o
  CC      drivers/media/platform/mediatek/mtk-mdp/mtk_mdp_comp.o
  CC      drivers/media/platform/mediatek/mtk-mdp/mtk_mdp_m2m.o
  CC      drivers/media/platform/mediatek/mtk-mdp/mtk_mdp_regs.o
  CC      drivers/media/platform/mediatek/mtk-mdp/mtk_mdp_vpu.o
  AR      drivers/media/platform/chips-media/built-in.a
  CC      drivers/media/platform/mediatek/mtk-vcodec/vdec/vdec_h264_req_if.o
  CC      drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_dec_drv.o
  CC      drivers/media/platform/mediatek/mtk-vcodec/vdec_drv_if.o
  CC      drivers/media/platform/mediatek/mtk-vcodec/vdec_vpu_if.o
  AR      drivers/media/platform/mediatek/mtk-vpu/built-in.a
  CC      drivers/media/platform/mediatek/mtk-vcodec/vdec_msg_queue.o
  CC      drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_dec.o
  CC      drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_dec_stateful.o
  AR      drivers/media/platform/mediatek/mtk-mdp/built-in.a
  CC      drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_dec_stateless.o
  CC      drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_dec_pm.o
  CC      drivers/media/platform/mediatek/mtk-vcodec/venc/venc_vp8_if.o
  CC      drivers/media/platform/mediatek/mtk-vcodec/venc/venc_h264_if.o
  CC      drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_enc.o
  CC      drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_enc_drv.o
  CC      drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_enc_pm.o
  CC      drivers/media/platform/mediatek/mtk-vcodec/venc_drv_if.o
  CC      drivers/media/platform/mediatek/mtk-vcodec/venc_vpu_if.o
  CC      drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_intr.o
  CC      drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_util.o
  CC      drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_fw.o
  CC      drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_fw_vpu.o
  CC      drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_fw_scp.o
  CC      drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_dec_hw.o
  AR      drivers/media/platform/mediatek/mtk-vcodec/built-in.a
  AR      drivers/media/platform/mediatek/built-in.a
make[2]: *** [scripts/Makefile.build:550: drivers/media/platform] Error 2
make[1]: *** [scripts/Makefile.build:550: drivers/media] Error 2
make: *** [Makefile:1831: drivers] Error 2
Build step 'Execute shell' marked build as failure
