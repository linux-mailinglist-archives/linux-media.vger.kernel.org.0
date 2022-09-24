Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 228DA5E8A44
	for <lists+linux-media@lfdr.de>; Sat, 24 Sep 2022 10:50:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233599AbiIXIuW convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Sat, 24 Sep 2022 04:50:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233484AbiIXIuV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Sep 2022 04:50:21 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 891F6AA4CF
        for <linux-media@vger.kernel.org>; Sat, 24 Sep 2022 01:50:19 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1oc0rV-009UFG-Vi; Sat, 24 Sep 2022 08:50:14 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1oc0rR-00FbiJ-F3; Sat, 24 Sep 2022 08:50:11 +0000
Date:   Sat, 24 Sep 2022 08:50:08 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        mchehab@linuxtv.org
Message-ID: <5238096.3.1664009408815@builder.linuxtv.org>
In-Reply-To: <14251207.2.1664009297444@builder.linuxtv.org>
References: <14251207.2.1664009297444@builder.linuxtv.org>
Subject: Build failed in Jenkins: media_stage_gcc #112
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: media_stage_gcc
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/media_stage_gcc/112/display/redirect?page=changes>

Changes:

[Mauro Carvalho Chehab] media: sunxi: Fix some error handling path of sun8i_a83t_mipi_csi2_probe()

[Mauro Carvalho Chehab] media: sunxi: Fix some error handling path of sun6i_mipi_csi2_probe()

[Mauro Carvalho Chehab] media: cx88: add IR remote support for NotOnlyTV LV3H

[Mauro Carvalho Chehab] media: venus: dec: Handle the case where find_format fails

[Mauro Carvalho Chehab] media: venus: Fix NV12 decoder buffer discovery on HFI_VERSION_1XX

[Mauro Carvalho Chehab] media: venus : Add default values for the control

[Mauro Carvalho Chehab] media: venus : Addition of control support - V4L2_CID_MIN_BUFFERS_FOR_OUTPUT

[Mauro Carvalho Chehab] media: venus : CAPTURE Plane width/height alignment with OUT plane.

[Mauro Carvalho Chehab] media: venus : Addition of EOS Event support for Encoder

[Mauro Carvalho Chehab] media: venus : Addition of support for VIDIOC_TRY_ENCODER_CMD

[Mauro Carvalho Chehab] media: venus : Remove the capture plane settings for venc_g_parm/venc_s_parm

[Mauro Carvalho Chehab] media: venus : Allow MIN/MAX settings for the v4l2 encoder controls defined range.

[Mauro Carvalho Chehab] media: venus: venc_ctrls: Add default value for CLL info

[Mauro Carvalho Chehab] media: venus: venc: Set HDR10 PQ SEI property only for MAIN10 profile

[Mauro Carvalho Chehab] media: venus: hfi: Remove the unneeded result variable


------------------------------------------
Started by an SCM change
Running as SYSTEM
Building remotely on slave2 in workspace <https://builder.linuxtv.org/job/media_stage_gcc/ws/>
The recommended git tool is: NONE
No credentials specified
 > git rev-parse --resolve-git-dir <https://builder.linuxtv.org/job/media_stage_gcc/ws/.git> # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url git://linuxtv.org/media_stage.git # timeout=10
Fetching upstream changes from git://linuxtv.org/media_stage.git
 > git --version # timeout=10
 > git --version # 'git version 2.30.2'
 > git fetch --tags --force --progress -- git://linuxtv.org/media_stage.git +refs/heads/*:refs/remotes/origin/* # timeout=30
Seen branch in repository origin/master
Seen 1 remote branch
 > git show-ref --tags -d # timeout=10
Checking out Revision d7438db9b0b7157bf576c1a907690e77776ef593 (origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f d7438db9b0b7157bf576c1a907690e77776ef593 # timeout=10
Commit message: "media: venus: hfi: Remove the unneeded result variable"
 > git rev-list --no-walk df383edffd2e3af1d0f4df48f248efcb49c58f79 # timeout=10
The recommended git tool is: NONE
No credentials specified
 > git rev-parse d7438db9b0b7157bf576c1a907690e77776ef593^{commit} # timeout=10
The recommended git tool is: NONE
No credentials specified
[GitCheckoutListener] Recording commits of 'git git://linuxtv.org/media_stage.git'
[GitCheckoutListener] Found previous build 'media_stage_gcc #111' that contains recorded Git commits
[GitCheckoutListener] -> Starting recording of new commits since 'df383ed'
[GitCheckoutListener] -> Using head commit 'd7438db' as starting point
[GitCheckoutListener] -> Git commit decorator could not be created for SCM 'hudson.plugins.git.GitSCM@5c728ce'
[GitCheckoutListener] -> Recorded 15 new commits
[media_stage_gcc] $ /bin/sh -xe /tmp/jenkins2257966611719843029.sh
+ export CCACHE_DIR=/var/lib/jenkins/.ccache
+ export PATH=/usr/lib/ccache:/usr/lib/ccache:/var/lib/jenkins/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/games
+ make W=1 allyesconfig
#
# configuration written to .config
#
+ ./scripts/config -d MODULE_SIG -d KEYS -d IMA -d CONFIG_DEBUG_INFO -d SYSTEM_TRUSTED_KEYRING -d MODVERSIONS -d CHECK_SIGNATURE
+ make W=1 init
  SYNC    include/config/auto.conf.cmd
  DESCEND objtool
  HOSTCC  <https://builder.linuxtv.org/job/media_stage_gcc/ws/tools/objtool/fixdep.o>
  CALL    scripts/atomic/check-atomics.sh
  CALL    scripts/checksyscalls.sh
  HOSTLD  <https://builder.linuxtv.org/job/media_stage_gcc/ws/tools/objtool/fixdep-in.o>
  LINK    <https://builder.linuxtv.org/job/media_stage_gcc/ws/tools/objtool/fixdep>
  CC      <https://builder.linuxtv.org/job/media_stage_gcc/ws/tools/objtool/exec-cmd.o>
  CC      <https://builder.linuxtv.org/job/media_stage_gcc/ws/tools/objtool/weak.o>
  CC      <https://builder.linuxtv.org/job/media_stage_gcc/ws/tools/objtool/help.o>
  CC      <https://builder.linuxtv.org/job/media_stage_gcc/ws/tools/objtool/check.o>
  CC      <https://builder.linuxtv.org/job/media_stage_gcc/ws/tools/objtool/pager.o>
  CC      <https://builder.linuxtv.org/job/media_stage_gcc/ws/tools/objtool/special.o>
  CC      <https://builder.linuxtv.org/job/media_stage_gcc/ws/tools/objtool/arch/x86/special.o>
  CC      <https://builder.linuxtv.org/job/media_stage_gcc/ws/tools/objtool/parse-options.o>
  CC      <https://builder.linuxtv.org/job/media_stage_gcc/ws/tools/objtool/builtin-check.o>
  CC      <https://builder.linuxtv.org/job/media_stage_gcc/ws/tools/objtool/run-command.o>
  CC      <https://builder.linuxtv.org/job/media_stage_gcc/ws/tools/objtool/elf.o>
  CC      <https://builder.linuxtv.org/job/media_stage_gcc/ws/tools/objtool/objtool.o>
  CC      <https://builder.linuxtv.org/job/media_stage_gcc/ws/tools/objtool/arch/x86/decode.o>
  CC      <https://builder.linuxtv.org/job/media_stage_gcc/ws/tools/objtool/sigchain.o>
  CC      <https://builder.linuxtv.org/job/media_stage_gcc/ws/tools/objtool/subcmd-config.o>
  CC      <https://builder.linuxtv.org/job/media_stage_gcc/ws/tools/objtool/orc_gen.o>
  CC      <https://builder.linuxtv.org/job/media_stage_gcc/ws/tools/objtool/orc_dump.o>
  CC      <https://builder.linuxtv.org/job/media_stage_gcc/ws/tools/objtool/libstring.o>
  CC      <https://builder.linuxtv.org/job/media_stage_gcc/ws/tools/objtool/libctype.o>
  CC      <https://builder.linuxtv.org/job/media_stage_gcc/ws/tools/objtool/str_error_r.o>
  CC      <https://builder.linuxtv.org/job/media_stage_gcc/ws/tools/objtool/librbtree.o>
  LD      <https://builder.linuxtv.org/job/media_stage_gcc/ws/tools/objtool/libsubcmd-in.o>
  AR      <https://builder.linuxtv.org/job/media_stage_gcc/ws/tools/objtool/libsubcmd.a>
  LD      <https://builder.linuxtv.org/job/media_stage_gcc/ws/tools/objtool/arch/x86/objtool-in.o>
  LD      <https://builder.linuxtv.org/job/media_stage_gcc/ws/tools/objtool/objtool-in.o>
  LINK    <https://builder.linuxtv.org/job/media_stage_gcc/ws/tools/objtool/objtool>
  CHK     include/generated/compile.h
+ make W=1 -j9 drivers/staging/media/
  DESCEND objtool
  CALL    scripts/atomic/check-atomics.sh
  CALL    scripts/checksyscalls.sh
  CC      drivers/staging/media/max96712/max96712.o
  CC      drivers/staging/media/deprecated/meye/meye.o
  CC      drivers/staging/media/deprecated/cpia2/cpia2_v4l.o
  CC      drivers/staging/media/rkvdec/rkvdec.o
  CC      drivers/staging/media/omap4iss/iss.o
  CC      drivers/staging/media/deprecated/stkwebcam/stk-webcam.o
  CC      drivers/staging/media/meson/vdec/esparser.o
  CC      drivers/staging/media/imx/imx-media-capture.o
  CC      drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.o
  CC      drivers/staging/media/deprecated/cpia2/cpia2_usb.o
  AR      drivers/staging/media/max96712/built-in.a
  CC      drivers/staging/media/imx/imx-media-dev-common.o
  CC      drivers/staging/media/meson/vdec/vdec.o
  CC      drivers/staging/media/omap4iss/iss_csi2.o
  CC      drivers/staging/media/rkvdec/rkvdec-h264.o
  CC      drivers/staging/media/deprecated/cpia2/cpia2_core.o
  CC      drivers/staging/media/deprecated/stkwebcam/stk-sensor.o
  AR      drivers/staging/media/atomisp/i2c/ov5693/built-in.a
  CC      drivers/staging/media/atomisp/i2c/atomisp-mt9m114.o
  AR      drivers/staging/media/deprecated/meye/built-in.a
  CC      drivers/staging/media/imx/imx-media-of.o
  CC      drivers/staging/media/atomisp/i2c/atomisp-gc2235.o
  CC      drivers/staging/media/atomisp/i2c/atomisp-ov2722.o
  CC      drivers/staging/media/meson/vdec/vdec_helpers.o
  AR      drivers/staging/media/deprecated/cpia2/built-in.a
  AR      drivers/staging/media/deprecated/stkwebcam/built-in.a
  CC      drivers/staging/media/meson/vdec/vdec_platform.o
  CC      drivers/staging/media/omap4iss/iss_csiphy.o
  CC      drivers/staging/media/rkvdec/rkvdec-vp9.o
  CC      drivers/staging/media/atomisp/i2c/atomisp-ov2680.o
  CC      drivers/staging/media/meson/vdec/vdec_1.o
  CC      drivers/staging/media/imx/imx-media-utils.o
  CC      drivers/staging/media/imx/imx-media-dev.o
  CC      drivers/staging/media/imx/imx-media-internal-sd.o
  CC      drivers/staging/media/omap4iss/iss_ipipeif.o
  CC      drivers/staging/media/imx/imx-ic-common.o
  CC      drivers/staging/media/atomisp/i2c/atomisp-gc0310.o
  CC      drivers/staging/media/imx/imx-ic-prp.o
  AR      drivers/staging/media/rkvdec/built-in.a
  CC      drivers/staging/media/imx/imx-ic-prpencvf.o
  CC      drivers/staging/media/meson/vdec/vdec_hevc.o
  CC      drivers/staging/media/atomisp/i2c/atomisp-lm3554.o
  CC      drivers/staging/media/imx/imx-media-vdic.o
  CC      drivers/staging/media/omap4iss/iss_ipipe.o
  CC      drivers/staging/media/omap4iss/iss_resizer.o
  CC      drivers/staging/media/omap4iss/iss_video.o
  CC      drivers/staging/media/imx/imx-media-csc-scaler.o
  CC      drivers/staging/media/meson/vdec/codec_mpeg12.o
  CC      drivers/staging/media/meson/vdec/codec_h264.o
  CC      drivers/staging/media/imx/imx-media-csi.o
  AR      drivers/staging/media/atomisp/i2c/built-in.a
  CC      drivers/staging/media/imx/imx-media-fim.o
  CC      drivers/staging/media/atomisp/pci/atomisp_cmd.o
  CC      drivers/staging/media/imx/imx6-mipi-csi2.o
  CC      drivers/staging/media/imx/imx7-media-csi.o
  CC      drivers/staging/media/imx/imx8mq-mipi-csi2.o
  CC      drivers/staging/media/meson/vdec/codec_hevc_common.o
  AR      drivers/staging/media/omap4iss/built-in.a
  CC      drivers/staging/media/meson/vdec/codec_vp9.o
  CC      drivers/staging/media/sunxi/cedrus/cedrus.o
  CC      drivers/staging/media/ipu3/ipu3-dmamap.o
  CC      drivers/staging/media/deprecated/tm6000/tm6000-cards.o
  CC      drivers/staging/media/sunxi/cedrus/cedrus_video.o
  CC      drivers/staging/media/ipu3/ipu3-tables.o
  CC      drivers/staging/media/sunxi/cedrus/cedrus_hw.o
  AR      drivers/staging/media/imx/built-in.a
  CC      drivers/staging/media/ipu3/ipu3-css-pool.o
  CC      drivers/staging/media/ipu3/ipu3-css-fw.o
  CC      drivers/staging/media/ipu3/ipu3-css-params.o
  CC      drivers/staging/media/sunxi/cedrus/cedrus_dec.o
  CC      drivers/staging/media/deprecated/tm6000/tm6000-core.o
  CC      drivers/staging/media/deprecated/tm6000/tm6000-i2c.o
  AR      drivers/staging/media/meson/vdec/built-in.a
  CC      drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.o
  CC      drivers/staging/media/atomisp/pci/atomisp_compat_css20.o
  CC      drivers/staging/media/atomisp/pci/atomisp_csi2.o
  CC      drivers/staging/media/sunxi/cedrus/cedrus_h264.o
  CC      drivers/staging/media/sunxi/cedrus/cedrus_h265.o
  CC      drivers/staging/media/deprecated/fsl-viu/fsl-viu.o
  CC      drivers/staging/media/sunxi/cedrus/cedrus_vp8.o
  CC      drivers/staging/media/deprecated/tm6000/tm6000-video.o
  CC      drivers/staging/media/ipu3/ipu3-css.o
  CC      drivers/staging/media/deprecated/tm6000/tm6000-stds.o
  CC      drivers/staging/media/atomisp/pci/atomisp_drvfs.o
  CC      drivers/staging/media/atomisp/pci/atomisp_fops.o
  CC      drivers/staging/media/atomisp/pci/atomisp_ioctl.o
  CC      drivers/staging/media/atomisp/pci/atomisp_subdev.o
  AR      drivers/staging/media/sunxi/cedrus/built-in.a
  AR      drivers/staging/media/sunxi/built-in.a
  CC      drivers/staging/media/atomisp/pci/atomisp_tpg.o
  AR      drivers/staging/media/deprecated/fsl-viu/built-in.a
  CC      drivers/staging/media/atomisp/pci/atomisp_v4l2.o
  CC      drivers/staging/media/deprecated/tm6000/tm6000-input.o
  CC      drivers/staging/media/deprecated/tm6000/tm6000-alsa.o
  CC      drivers/staging/media/deprecated/tm6000/tm6000-dvb.o
  CC      drivers/staging/media/ipu3/ipu3-v4l2.o
  CC      drivers/staging/media/ipu3/ipu3.o
  CC      drivers/staging/media/atomisp/pci/sh_css_firmware.o
  CC      drivers/staging/media/atomisp/pci/sh_css_host_data.o
drivers/staging/media/atomisp/pci/atomisp_ioctl.c: In function ‘atomisp_streamon’:
drivers/staging/media/atomisp/pci/atomisp_ioctl.c:1714:30: error: variable ‘sink’ set but not used [-Werror=unused-but-set-variable]
 1714 |   struct v4l2_mbus_framefmt *sink;
      |                              ^~~~
cc1: all warnings being treated as errors
make[4]: *** [scripts/Makefile.build:249: drivers/staging/media/atomisp/pci/atomisp_ioctl.o] Error 1
make[4]: *** Waiting for unfinished jobs....
  CC      drivers/staging/media/deprecated/zr364xx/zr364xx.o
  AR      drivers/staging/media/deprecated/tm6000/built-in.a
  CC      drivers/staging/media/deprecated/vpfe_capture/vpfe_capture.o
  CC      drivers/staging/media/deprecated/saa7146/saa7146/mxb.o
  AR      drivers/staging/media/ipu3/built-in.a
  CC      drivers/staging/media/deprecated/saa7146/av7110/budget-patch.o
  CC      drivers/staging/media/deprecated/saa7146/av7110/av7110_hw.o
  CC      drivers/staging/media/deprecated/saa7146/common/saa7146_i2c.o
  CC      drivers/staging/media/deprecated/saa7146/ttpci/budget-core.o
  CC      drivers/staging/media/deprecated/saa7146/av7110/av7110_v4l.o
make[3]: *** [scripts/Makefile.build:465: drivers/staging/media/atomisp] Error 2
make[3]: *** Waiting for unfinished jobs....
  CC      drivers/staging/media/deprecated/saa7146/av7110/av7110_av.o
  CC      drivers/staging/media/deprecated/saa7146/saa7146/hexium_orion.o
  CC      drivers/staging/media/deprecated/saa7146/common/saa7146_core.o
  AR      drivers/staging/media/deprecated/zr364xx/built-in.a
  CC      drivers/staging/media/deprecated/saa7146/common/saa7146_fops.o
  CC      drivers/staging/media/deprecated/saa7146/common/saa7146_video.o
  CC      drivers/staging/media/deprecated/saa7146/common/saa7146_hlp.o
  CC      drivers/staging/media/deprecated/saa7146/ttpci/budget.o
  CC      drivers/staging/media/deprecated/saa7146/av7110/av7110_ca.o
  AR      drivers/staging/media/deprecated/vpfe_capture/built-in.a
  CC      drivers/staging/media/deprecated/saa7146/av7110/av7110.o
  CC      drivers/staging/media/deprecated/saa7146/saa7146/hexium_gemini.o
  CC      drivers/staging/media/deprecated/saa7146/common/saa7146_vbi.o
  CC      drivers/staging/media/deprecated/saa7146/ttpci/budget-av.o
  CC      drivers/staging/media/deprecated/saa7146/ttpci/budget-ci.o
  CC      drivers/staging/media/deprecated/saa7146/av7110/av7110_ir.o
  CC      drivers/staging/media/deprecated/saa7146/av7110/sp8870.o
  AR      drivers/staging/media/deprecated/saa7146/saa7146/built-in.a
  AR      drivers/staging/media/deprecated/saa7146/common/built-in.a
  AR      drivers/staging/media/deprecated/saa7146/av7110/built-in.a
  AR      drivers/staging/media/deprecated/saa7146/ttpci/built-in.a
  AR      drivers/staging/media/deprecated/saa7146/built-in.a
make[2]: *** [scripts/Makefile.build:465: drivers/staging/media] Error 2
make[1]: *** [scripts/Makefile.build:465: drivers/staging] Error 2
make: *** [Makefile:1855: drivers] Error 2
Build step 'Execute shell' marked build as failure
