Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8646566908
	for <lists+linux-media@lfdr.de>; Tue,  5 Jul 2022 13:22:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229833AbiGELWR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jul 2022 07:22:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229795AbiGELWR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jul 2022 07:22:17 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5DFF15A0D
        for <linux-media@vger.kernel.org>; Tue,  5 Jul 2022 04:22:14 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1o8gdB-00FaKB-8R; Tue, 05 Jul 2022 11:22:13 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1o8gd8-00BkqF-V3; Tue, 05 Jul 2022 11:22:10 +0000
Date:   Tue, 5 Jul 2022 11:22:10 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <47894334.1.1657020130300@builder.linuxtv.org>
Subject: Build failed in Jenkins: linux-media #286
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: linux-media
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

See <https://builder.linuxtv.org/job/linux-media/286/display/redirect>

Changes:


------------------------------------------
[...truncated 483 lines...]
  LD [M]  drivers/media/platform/mediatek/vcodec/mtk-vcodec-common.o
  LD [M]  drivers/media/platform/mediatek/vcodec/mtk-vcodec-dec-hw.o
  CC [M]  drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.o
  CC      drivers/media/usb/em28xx/em28xx-core.o
  CC      drivers/media/usb/gspca/xirlink_cit.o
  CC      drivers/media/usb/em28xx/em28xx-i2c.o
  CC [M]  drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.o
  CC      drivers/media/usb/em28xx/em28xx-cards.o
  AR      drivers/media/usb/gspca/built-in.a
  CC      drivers/media/usb/em28xx/em28xx-camera.o
  CC      drivers/media/usb/em28xx/em28xx-video.o
  CC      drivers/media/usb/em28xx/em28xx-vbi.o
  CC [M]  drivers/media/v4l2-core/v4l2-mem2mem.o
  CC [M]  drivers/media/cec/platform/cros-ec/cros-ec-cec.o
  CC      drivers/media/usb/em28xx/em28xx-audio.o
  LD [M]  drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-encdec.o
  CC      drivers/media/usb/em28xx/em28xx-dvb.o
  CC      drivers/media/usb/em28xx/em28xx-input.o
  AR      drivers/media/usb/em28xx/built-in.a
  CC [M]  drivers/media/platform/renesas/rcar_drif.o
  CC      drivers/media/usb/hdpvr/hdpvr-video.o
  AR      drivers/media/usb/hdpvr/built-in.a
  CC [M]  drivers/media/platform/rockchip/rkisp1/rkisp1-capture.o
  AR      drivers/media/usb/built-in.a
  CC [M]  drivers/media/platform/rockchip/rkisp1/rkisp1-common.o
  CC [M]  drivers/media/platform/rockchip/rkisp1/rkisp1-dev.o
  CC [M]  drivers/media/platform/rockchip/rkisp1/rkisp1-isp.o
  CC [M]  drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.o
  CC [M]  drivers/media/platform/st/stm32/stm32-dcmi.o
  CC [M]  drivers/media/platform/rockchip/rkisp1/rkisp1-stats.o
  CC [M]  drivers/media/platform/rockchip/rkisp1/rkisp1-params.o
  CC [M]  drivers/media/platform/rockchip/rkisp1/rkisp1-debug.o
  LD [M]  drivers/media/platform/rockchip/rkisp1/rockchip-isp1.o
  CC      drivers/staging/media/rkvdec/rkvdec-vp9.o
  AR      drivers/media/built-in.a
  AR      drivers/staging/media/rkvdec/built-in.a
  CC      drivers/staging/media/av7110/av7110.o
  AR      drivers/staging/media/av7110/built-in.a
  AR      drivers/staging/media/built-in.a
  AR      drivers/staging/built-in.a
  CC [M]  drivers/staging/media/rkvdec/rkvdec-vp9.o
  LD [M]  drivers/staging/media/rkvdec/rockchip-vdec.o
  CC [M]  drivers/staging/media/av7110/av7110.o
  LD [M]  drivers/staging/media/av7110/dvb-ttpci.o
  AR      drivers/built-in.a
  MODPOST modules-only.symvers
Kernel: arch/x86/boot/bzImage is ready  (#6)
  GEN     .version
  CHK     include/generated/compile.h
  UPD     include/generated/compile.h
  CC      init/version.o
  AR      init/built-in.a
  LD      vmlinux.o
  GEN     Module.symvers
  CC [M]  drivers/media/cec/platform/cros-ec/cros-ec-cec.mod.o
  LD [M]  drivers/media/pci/ddbridge/ddbridge.ko
  LD [M]  drivers/media/pci/saa7164/saa7164.ko
  CC [M]  drivers/media/pci/tw686x/tw686x.mod.o
  CC [M]  drivers/media/platform/amphion/amphion-vpu.mod.o
  CC [M]  drivers/media/platform/atmel/atmel-isc-common.mod.o
  LD [M]  drivers/media/platform/mediatek/vcodec/mtk-vcodec-common.ko
  LD [M]  drivers/media/platform/mediatek/vcodec/mtk-vcodec-dec-hw.ko
  CC [M]  drivers/media/platform/mediatek/vcodec/mtk-vcodec-dec.mod.o
  CC [M]  drivers/media/platform/mediatek/vcodec/mtk-vcodec-enc.mod.o
  CC [M]  drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-encdec.mod.o
  LD [M]  drivers/media/platform/renesas/rcar_drif.ko
  CC [M]  drivers/media/platform/rockchip/rkisp1/rockchip-isp1.mod.o
  CC [M]  drivers/media/platform/st/stm32/stm32-dcmi.mod.o
  CC [M]  drivers/media/usb/em28xx/em28xx-alsa.mod.o
  CC [M]  drivers/media/usb/em28xx/em28xx-dvb.mod.o
  CC [M]  drivers/media/usb/em28xx/em28xx-rc.mod.o
  CC [M]  drivers/media/usb/em28xx/em28xx-v4l.mod.o
  CC [M]  drivers/media/usb/em28xx/em28xx.mod.o
  LD [M]  drivers/media/usb/gspca/gspca_xirlink_cit.ko
  CC [M]  drivers/media/usb/hdpvr/hdpvr.mod.o
  CC [M]  drivers/media/v4l2-core/v4l2-mem2mem.mod.o
  LD [M]  drivers/staging/media/av7110/dvb-ttpci.ko
  CC [M]  drivers/staging/media/rkvdec/rockchip-vdec.mod.o
  LD [M]  drivers/media/cec/platform/cros-ec/cros-ec-cec.ko
  LD [M]  drivers/media/pci/tw686x/tw686x.ko
  LD [M]  drivers/media/platform/amphion/amphion-vpu.ko
  LD [M]  drivers/media/platform/atmel/atmel-isc-common.ko
  LD [M]  drivers/media/platform/mediatek/vcodec/mtk-vcodec-dec.ko
  LD [M]  drivers/media/platform/mediatek/vcodec/mtk-vcodec-enc.ko
  LD [M]  drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-encdec.ko
  LD [M]  drivers/media/platform/rockchip/rkisp1/rockchip-isp1.ko
  LD [M]  drivers/media/platform/st/stm32/stm32-dcmi.ko
  LD [M]  drivers/media/usb/em28xx/em28xx-alsa.ko
  LD [M]  drivers/media/usb/em28xx/em28xx-dvb.ko
  LD [M]  drivers/media/usb/em28xx/em28xx-rc.ko
  LD [M]  drivers/media/usb/em28xx/em28xx-v4l.ko
  LD [M]  drivers/media/usb/em28xx/em28xx.ko
  LD [M]  drivers/media/usb/hdpvr/hdpvr.ko
  LD [M]  drivers/media/v4l2-core/v4l2-mem2mem.ko
  LD [M]  drivers/staging/media/rkvdec/rockchip-vdec.ko
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
  CC      drivers/media/cec/platform/cros-ec/cros-ec-cec.o
  CC      drivers/media/v4l2-core/v4l2-mem2mem.o
  AR      drivers/media/cec/platform/cros-ec/built-in.a
  AR      drivers/media/v4l2-core/built-in.a
  AR      drivers/media/cec/platform/built-in.a
  AR      drivers/media/cec/built-in.a
  CC      drivers/media/platform/atmel/atmel-isc-base.o
  CC      drivers/media/platform/amphion/vpu_msgs.o
  AR      drivers/media/platform/atmel/built-in.a
  AR      drivers/media/platform/amphion/built-in.a
  CC      drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_if.o
  CC      drivers/media/pci/ddbridge/ddbridge-main.o
  CC      drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.o
  CC      drivers/media/pci/ddbridge/ddbridge-core.o
  CC      drivers/media/platform/mediatek/vcodec/vdec/vdec_vp8_if.o
  CC      drivers/media/pci/ddbridge/ddbridge-ci.o
  CC      drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.o
  CC      drivers/media/pci/ddbridge/ddbridge-hw.o
  CC      drivers/media/pci/ddbridge/ddbridge-i2c.o
  CC      drivers/media/platform/mediatek/vcodec/vdec/vdec_vp8_req_if.o
  CC      drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.o
  CC      drivers/media/pci/ddbridge/ddbridge-max.o
  AR      drivers/media/platform/nxp/imx-jpeg/built-in.a
  AR      drivers/media/platform/nxp/built-in.a
  CC      drivers/media/pci/ddbridge/ddbridge-mci.o
  CC      drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.o
  CC      drivers/media/pci/ddbridge/ddbridge-sx8.o
  CC      drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_if.o
  CC      drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_common.o
  CC      drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.o
  CC      drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.o
  AR      drivers/media/pci/ddbridge/built-in.a
  CC      drivers/media/platform/mediatek/vcodec/vdec_drv_if.o
  CC      drivers/media/platform/mediatek/vcodec/vdec_vpu_if.o
  CC      drivers/media/usb/gspca/xirlink_cit.o
  CC      drivers/media/platform/mediatek/vcodec/vdec_msg_queue.o
  CC      drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.o
  AR      drivers/media/usb/gspca/built-in.a
  CC      drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateful.o
  CC      drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.o
  CC      drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_pm.o
  CC      drivers/media/usb/em28xx/em28xx-core.o
  CC      drivers/media/usb/hdpvr/hdpvr-video.o
  CC      drivers/media/pci/saa7164/saa7164-api.o
  AR      drivers/media/pci/saa7164/built-in.a
  CC      drivers/media/platform/mediatek/vcodec/venc/venc_vp8_if.o
  AR      drivers/media/usb/hdpvr/built-in.a
  CC      drivers/media/usb/em28xx/em28xx-i2c.o
  CC      drivers/media/pci/tw686x/tw686x-core.o
  CC      drivers/media/platform/mediatek/vcodec/venc/venc_h264_if.o
  CC      drivers/media/platform/rockchip/rkisp1/rkisp1-capture.o
  CC      drivers/media/usb/em28xx/em28xx-cards.o
  CC      drivers/media/platform/renesas/rcar_drif.o
  CC      drivers/media/pci/tw686x/tw686x-video.o
  CC      drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.o
  CC      drivers/media/platform/rockchip/rkisp1/rkisp1-common.o
  CC      drivers/media/usb/em28xx/em28xx-camera.o
  AR      drivers/media/platform/renesas/built-in.a
  AR      drivers/media/pci/tw686x/built-in.a
  AR      drivers/media/pci/built-in.a
  CC      drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.o
  CC      drivers/media/platform/rockchip/rkisp1/rkisp1-dev.o
  CC      drivers/media/usb/em28xx/em28xx-video.o
  CC      drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.o
  CC      drivers/media/platform/rockchip/rkisp1/rkisp1-isp.o
  CC      drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.o
  CC      drivers/media/platform/mediatek/vcodec/venc_drv_if.o
  CC      drivers/media/platform/st/stm32/stm32-dcmi.o
  CC      drivers/media/platform/rockchip/rkisp1/rkisp1-stats.o
  CC      drivers/media/usb/em28xx/em28xx-vbi.o
  CC      drivers/media/platform/mediatek/vcodec/venc_vpu_if.o
  CC      drivers/media/platform/rockchip/rkisp1/rkisp1-params.o
  CC      drivers/media/platform/rockchip/rkisp1/rkisp1-debug.o
  AR      drivers/media/platform/st/stm32/built-in.a
  AR      drivers/media/platform/st/built-in.a
  CC      drivers/media/platform/mediatek/vcodec/mtk_vcodec_intr.o
  CC      drivers/media/usb/em28xx/em28xx-audio.o
  AR      drivers/media/platform/rockchip/rkisp1/built-in.a
  AR      drivers/media/platform/rockchip/built-in.a
  CC      drivers/media/platform/mediatek/vcodec/mtk_vcodec_util.o
  CC      drivers/media/usb/em28xx/em28xx-dvb.o
  CC      drivers/media/usb/em28xx/em28xx-input.o
  CC      drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw.o
  CC      drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw_vpu.o
  CC      drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw_scp.o
  AR      drivers/media/usb/em28xx/built-in.a
  AR      drivers/media/usb/built-in.a
  CC      drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.o
  AR      drivers/media/platform/mediatek/vcodec/built-in.a
  AR      drivers/media/platform/mediatek/built-in.a
  AR      drivers/media/platform/built-in.a
  AR      drivers/media/built-in.a
  CC      drivers/staging/media/rkvdec/rkvdec-vp9.o
  AR      drivers/staging/media/rkvdec/built-in.a
  CC      drivers/staging/media/av7110/av7110.o
  AR      drivers/staging/media/av7110/built-in.a
  AR      drivers/staging/media/built-in.a
  AR      drivers/staging/built-in.a
  AR      drivers/built-in.a
  GEN     .version
  CHK     include/generated/compile.h
  UPD     include/generated/compile.h
  CC      init/version.o
  AR      init/built-in.a
  LD      vmlinux.o
Killed
make[2]: *** [../scripts/Makefile.vmlinux_o:68: vmlinux.o] Error 137
make[2]: *** Deleting file 'vmlinux.o'
make[1]: *** [/var/lib/jenkins/workspace/linux-media@2/Makefile:1164: vmlinux] Error 2
make[1]: Leaving directory '/var/lib/jenkins/workspace/linux-media@2/arm_yes'
make: *** [Makefile:219: __sub-make] Error 2
[Pipeline] }
[Pipeline] // node
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
Failed in branch arm/aarch64 (builtin)
Killed
make[2]: *** [../scripts/Makefile.vmlinux_o:68: vmlinux.o] Error 137
make[2]: *** Deleting file 'vmlinux.o'
make[1]: *** [/var/lib/jenkins/workspace/linux-media/Makefile:1164: vmlinux] Error 2
make[1]: Leaving directory '/var/lib/jenkins/workspace/linux-media/x86_64_yes'
make: *** [Makefile:219: __sub-make] Error 2
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
