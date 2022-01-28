Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AE6D49FC95
	for <lists+linux-media@lfdr.de>; Fri, 28 Jan 2022 16:16:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240420AbiA1PQ1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jan 2022 10:16:27 -0500
Received: from www.linuxtv.org ([130.149.80.248]:52226 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240716AbiA1PQZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jan 2022 10:16:25 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nDSz4-00CJA6-Vq; Fri, 28 Jan 2022 15:16:19 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nDSz2-004ehi-Gu; Fri, 28 Jan 2022 15:16:16 +0000
Date:   Fri, 28 Jan 2022 15:16:15 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        mchehab@linuxtv.org
Message-ID: <1554577671.0.1643382975915@builder.linuxtv.org>
Subject: Build failed in Jenkins: media_stage_clang #411
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: media_stage_clang
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/media_stage_clang/411/display/redirect?page=changes>

Changes:

[Mauro Carvalho Chehab] media: dt-bindings: media: camss: Remove clock-lane property

[Mauro Carvalho Chehab] media: pxa_camera: Drop usage of .set_mbus_config()

[Mauro Carvalho Chehab] media: i2c: ov6650: Drop implementation of .set_mbus_config()

[Mauro Carvalho Chehab] media: v4l2-subdev: Drop .set_mbus_config() operation

[Mauro Carvalho Chehab] media: v4l2-fwnode: Move bus config structure to v4l2_mediabus.h

[Mauro Carvalho Chehab] media: v4l2-mediabus: Use structures to describe bus configuration

[Mauro Carvalho Chehab] media: v4l2-mediabus: Drop legacy V4L2_MBUS_CSI2_*_LANE flags

[Mauro Carvalho Chehab] media: v4l2-mediabus: Drop legacy V4L2_MBUS_CSI2_CHANNEL_* flags

[Mauro Carvalho Chehab] media: v4l2-mediabus: Drop V4L2_MBUS_CSI2_CONTINUOUS_CLOCK flag

[Mauro Carvalho Chehab] media: ov6650: Fix set format try processing path

[Mauro Carvalho Chehab] media: ov6650: Add try support to selection API operations

[Mauro Carvalho Chehab] media: ov6650: Fix crop rectangle affected by set format

[Mauro Carvalho Chehab] media: ov6650: Fix missing frame interval enumeration support

[Mauro Carvalho Chehab] media: v4l: Avoid unaligned access warnings when printing 4cc modifiers

[Mauro Carvalho Chehab] media: ov5648: Don't pack controls struct

[Mauro Carvalho Chehab] media: ov8865: Fix indentation in set_selection callback

[Mauro Carvalho Chehab] media: hi847: Add support for Hi-847 sensor

[Mauro Carvalho Chehab] media: i2c: Add ov08d10 camera sensor driver

[Mauro Carvalho Chehab] media: ov5693: fix boolconv.cocci warnings

[Mauro Carvalho Chehab] media: ov5693: fix returnvar.cocci warnings

[Mauro Carvalho Chehab] media: i2c: max9286: Implement media entity .link_validate() operation

[Mauro Carvalho Chehab] media: MAINTAINERS: Update Benjamin Gaignard maintainer status

[Mauro Carvalho Chehab] media: MAINTAINERS: update drm/stm drm/sti and cec/sti maintainers

[Mauro Carvalho Chehab] media: ov2740: identify module after subdev initialisation

[Mauro Carvalho Chehab] media: i2c: dw9714: add optional regulator support


------------------------------------------
[...truncated 47.85 KB...]
  CC      drivers/media/i2c/s5c73m3/s5c73m3-ctrls.o
  CC      drivers/media/pci/tw68/tw68-video.o
  CC      drivers/media/platform/vsp1/vsp1_histo.o
  CC      drivers/media/platform/vsp1/vsp1_lif.o
  CC      drivers/media/platform/vsp1/vsp1_uif.o
  CC      drivers/media/pci/tw68/tw68-risc.o
  CC      drivers/media/usb/au0828/au0828-input.o
  CC      drivers/media/i2c/lm3646.o
  CC      drivers/media/i2c/ak881x.o
  CC      drivers/media/pci/tw686x/tw686x-core.o
  CC      drivers/media/pci/tw686x/tw686x-video.o
  AR      drivers/media/i2c/s5c73m3/built-in.a
  CC      drivers/media/pci/dt3155/dt3155.o
  CC      drivers/media/pci/meye/meye.o
  AR      drivers/media/pci/tw68/built-in.a
  CC      drivers/media/pci/tw686x/tw686x-audio.o
  AR      drivers/media/platform/vsp1/built-in.a
  CC      drivers/media/platform/am437x/am437x-vpfe.o
  CC      drivers/media/platform/xilinx/xilinx-dma.o
  AR      drivers/media/usb/au0828/built-in.a
  CC      drivers/media/usb/hdpvr/hdpvr-control.o
  CC      drivers/media/i2c/video-i2c.o
  CC      drivers/media/usb/pvrusb2/pvrusb2-i2c-core.o
  CC      drivers/media/i2c/ml86v7667.o
  AR      drivers/media/pci/dt3155/built-in.a
  CC      drivers/media/i2c/ov2659.o
  AR      drivers/media/pci/tw686x/built-in.a
  CC      drivers/media/usb/hdpvr/hdpvr-core.o
  AR      drivers/media/pci/meye/built-in.a
  CC      drivers/media/pci/sta2x11/sta2x11_vip.o
  CC      drivers/media/platform/xilinx/xilinx-vip.o
  CC      drivers/media/usb/pvrusb2/pvrusb2-audio.o
  CC      drivers/media/platform/xilinx/xilinx-vipp.o
  AR      drivers/media/platform/am437x/built-in.a
  CC      drivers/media/i2c/tc358743.o
  CC      drivers/media/usb/hdpvr/hdpvr-video.o
  CC      drivers/media/usb/hdpvr/hdpvr-i2c.o
  CC      drivers/media/platform/rcar-isp.o
  CC      drivers/media/i2c/hi556.o
  CC      drivers/media/platform/rcar-vin/rcar-csi2.o
  AR      drivers/media/pci/sta2x11/built-in.a
  CC      drivers/media/pci/solo6x10/solo6x10-core.o
  CC      drivers/media/usb/pvrusb2/pvrusb2-encoder.o
  CC      drivers/media/pci/cobalt/cobalt-driver.o
  CC      drivers/media/platform/rcar-vin/rcar-core.o
  CC      drivers/media/usb/pvrusb2/pvrusb2-video-v4l.o
  AR      drivers/media/usb/hdpvr/built-in.a
  CC      drivers/media/i2c/hi846.o
  CC      drivers/media/usb/pvrusb2/pvrusb2-eeprom.o
  CC      drivers/media/platform/xilinx/xilinx-csi2rxss.o
  CC      drivers/media/platform/xilinx/xilinx-tpg.o
  CC      drivers/media/pci/solo6x10/solo6x10-i2c.o
  CC      drivers/media/pci/cobalt/cobalt-irq.o
  CC      drivers/media/pci/cobalt/cobalt-v4l2.o
  CC      drivers/media/platform/rcar-vin/rcar-dma.o
  CC      drivers/media/i2c/imx208.o
  CC      drivers/media/i2c/imx214.o
  CC      drivers/media/usb/pvrusb2/pvrusb2-hdw.o
  CC      drivers/media/platform/xilinx/xilinx-vtc.o
  CC      drivers/media/i2c/imx219.o
  CC      drivers/media/pci/solo6x10/solo6x10-p2m.o
  CC      drivers/media/usb/pvrusb2/pvrusb2-v4l2.o
  CC      drivers/media/i2c/imx258.o
  CC      drivers/media/usb/pvrusb2/pvrusb2-ctrl.o
  CC      drivers/media/platform/rcar-vin/rcar-v4l2.o
  AR      drivers/media/platform/xilinx/built-in.a
  CC      drivers/media/pci/cobalt/cobalt-i2c.o
  CC      drivers/media/pci/cobalt/cobalt-omnitek.o
  CC      drivers/media/i2c/imx274.o
  CC      drivers/media/i2c/imx290.o
  CC      drivers/media/i2c/imx319.o
  CC      drivers/media/pci/solo6x10/solo6x10-v4l2.o
  CC      drivers/media/platform/atmel/atmel-isi.o
  AR      drivers/media/platform/rcar-vin/built-in.a
  CC      drivers/media/usb/pvrusb2/pvrusb2-devattr.o
  CC      drivers/media/i2c/imx334.o
  CC      drivers/media/i2c/imx335.o
  CC      drivers/media/pci/cobalt/cobalt-flash.o
  CC      drivers/media/platform/atmel/atmel-isc-base.o
  CC      drivers/media/i2c/imx355.o
  CC      drivers/media/platform/atmel/atmel-isc-clk.o
  CC      drivers/media/pci/solo6x10/solo6x10-tw28.o
  CC      drivers/media/platform/atmel/atmel-sama5d2-isc.o
  CC      drivers/media/usb/pvrusb2/pvrusb2-cx2584x-v4l.o
  CC      drivers/media/usb/pvrusb2/pvrusb2-wm8775.o
  CC      drivers/media/pci/cobalt/cobalt-cpld.o
  CC      drivers/media/usb/pvrusb2/pvrusb2-cs53l32a.o
  CC      drivers/media/usb/pvrusb2/pvrusb2-dvb.o
  CC      drivers/media/i2c/imx412.o
  CC      drivers/media/pci/solo6x10/solo6x10-gpio.o
  CC      drivers/media/platform/atmel/atmel-sama7g5-isc.o
  CC      drivers/media/platform/atmel/microchip-csi2dc.o
  CC      drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.o
  CC      drivers/media/pci/cobalt/cobalt-alsa-main.o
  CC      drivers/media/platform/mtk-mdp/mtk_mdp_core.o
  CC      drivers/media/i2c/max9286.o
  CC      drivers/media/platform/mtk-mdp/mtk_mdp_m2m.o
  AR      drivers/media/usb/pvrusb2/built-in.a
  CC      drivers/media/usb/stk1160/stk1160-core.o
  CC      drivers/media/platform/mtk-mdp/mtk_mdp_regs.o
  CC      drivers/media/pci/solo6x10/solo6x10-disp.o
  CC      drivers/media/pci/cobalt/cobalt-alsa-pcm.o
  CC      drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.o
drivers/media/platform/atmel/microchip-csi2dc.c:360:18: error: no member named 'flags' in 'struct v4l2_mbus_config'
        if (mbus_config.flags & V4L2_MBUS_CSI2_CHANNEL_0)
            ~~~~~~~~~~~ ^
  CC      drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.o
drivers/media/platform/atmel/microchip-csi2dc.c:360:26: error: use of undeclared identifier 'V4L2_MBUS_CSI2_CHANNEL_0'; did you mean 'V4L2_MBUS_CSI2_CPHY'?
        if (mbus_config.flags & V4L2_MBUS_CSI2_CHANNEL_0)
                                ^~~~~~~~~~~~~~~~~~~~~~~~
                                V4L2_MBUS_CSI2_CPHY
./include/media/v4l2-mediabus.h:141:2: note: 'V4L2_MBUS_CSI2_CPHY' declared here
        V4L2_MBUS_CSI2_CPHY,
        ^
drivers/media/platform/atmel/microchip-csi2dc.c:362:23: error: no member named 'flags' in 'struct v4l2_mbus_config'
        else if (mbus_config.flags & V4L2_MBUS_CSI2_CHANNEL_1)
                 ~~~~~~~~~~~ ^
drivers/media/platform/atmel/microchip-csi2dc.c:362:31: error: use of undeclared identifier 'V4L2_MBUS_CSI2_CHANNEL_1'; did you mean 'V4L2_MBUS_CSI2_CPHY'?
        else if (mbus_config.flags & V4L2_MBUS_CSI2_CHANNEL_1)
                                     ^~~~~~~~~~~~~~~~~~~~~~~~
                                     V4L2_MBUS_CSI2_CPHY
./include/media/v4l2-mediabus.h:141:2: note: 'V4L2_MBUS_CSI2_CPHY' declared here
        V4L2_MBUS_CSI2_CPHY,
        ^
drivers/media/platform/atmel/microchip-csi2dc.c:364:23: error: no member named 'flags' in 'struct v4l2_mbus_config'
        else if (mbus_config.flags & V4L2_MBUS_CSI2_CHANNEL_2)
                 ~~~~~~~~~~~ ^
drivers/media/platform/atmel/microchip-csi2dc.c:364:31: error: use of undeclared identifier 'V4L2_MBUS_CSI2_CHANNEL_2'; did you mean 'V4L2_MBUS_CSI2_CPHY'?
        else if (mbus_config.flags & V4L2_MBUS_CSI2_CHANNEL_2)
                                     ^~~~~~~~~~~~~~~~~~~~~~~~
                                     V4L2_MBUS_CSI2_CPHY
./include/media/v4l2-mediabus.h:141:2: note: 'V4L2_MBUS_CSI2_CPHY' declared here
        V4L2_MBUS_CSI2_CPHY,
        ^
drivers/media/platform/atmel/microchip-csi2dc.c:366:23: error: no member named 'flags' in 'struct v4l2_mbus_config'
        else if (mbus_config.flags & V4L2_MBUS_CSI2_CHANNEL_3)
                 ~~~~~~~~~~~ ^
drivers/media/platform/atmel/microchip-csi2dc.c:366:31: error: use of undeclared identifier 'V4L2_MBUS_CSI2_CHANNEL_3'; did you mean 'V4L2_MBUS_CSI2_CPHY'?
        else if (mbus_config.flags & V4L2_MBUS_CSI2_CHANNEL_3)
                                     ^~~~~~~~~~~~~~~~~~~~~~~~
                                     V4L2_MBUS_CSI2_CPHY
./include/media/v4l2-mediabus.h:141:2: note: 'V4L2_MBUS_CSI2_CPHY' declared here
        V4L2_MBUS_CSI2_CPHY,
        ^
drivers/media/platform/atmel/microchip-csi2dc.c:371:34: error: no member named 'flags' in 'struct v4l2_mbus_config'
        csi2dc->clk_gated = mbus_config.flags &
                            ~~~~~~~~~~~ ^
9 errors generated.
make[4]: *** [scripts/Makefile.build:288: drivers/media/platform/atmel/microchip-csi2dc.o] Error 1
make[3]: *** [scripts/Makefile.build:550: drivers/media/platform/atmel] Error 2
make[3]: *** Waiting for unfinished jobs....
  CC      drivers/media/platform/mtk-mdp/mtk_mdp_vpu.o
  CC      drivers/media/usb/stk1160/stk1160-v4l.o
  CC      drivers/media/i2c/rdacm20.o
  CC      drivers/media/i2c/rdacm21.o
  CC      drivers/media/usb/stk1160/stk1160-video.o
  CC      drivers/media/pci/solo6x10/solo6x10-enc.o
  AR      drivers/media/pci/cobalt/built-in.a
  CC      drivers/media/usb/stk1160/stk1160-i2c.o
  CC      drivers/media/usb/stk1160/stk1160-ac97.o
  AR      drivers/media/platform/mtk-mdp/built-in.a
  CC      drivers/media/i2c/st-mipid02.o
  CC      drivers/media/i2c/max2175.o
  CC      drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.o
  CC      drivers/media/i2c/ov08d10.o
  CC      drivers/media/i2c/hi847.o
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.o
  CC      drivers/media/platform/mtk-vcodec/vdec_drv_if.o
  CC      drivers/media/pci/solo6x10/solo6x10-v4l2-enc.o
  AR      drivers/media/usb/stk1160/built-in.a
  CC      drivers/media/pci/solo6x10/solo6x10-g723.o
  CC      drivers/media/usb/cx231xx/cx231xx-video.o
  CC      drivers/media/usb/cx231xx/cx231xx-i2c.o
  CC      drivers/media/usb/cx231xx/cx231xx-cards.o
  CC      drivers/media/usb/cx231xx/cx231xx-core.o
  AR      drivers/media/i2c/built-in.a
  CC      drivers/media/usb/cx231xx/cx231xx-avcore.o
  CC      drivers/media/usb/cx231xx/cx231xx-417.o
  CC      drivers/media/platform/mtk-vcodec/vdec_vpu_if.o
  CC      drivers/media/usb/cx231xx/cx231xx-pcb-cfg.o
  CC      drivers/media/pci/solo6x10/solo6x10-eeprom.o
  CC      drivers/media/platform/mtk-vcodec/vdec_msg_queue.o
  CC      drivers/media/usb/cx231xx/cx231xx-vbi.o
  CC      drivers/media/pci/tw5864/tw5864-core.o
  CC      drivers/media/usb/cx231xx/cx231xx-input.o
  CC      drivers/media/usb/cx231xx/cx231xx-audio.o
  CC      drivers/media/pci/tw5864/tw5864-video.o
  CC      drivers/media/usb/cx231xx/cx231xx-dvb.o
  CC      drivers/media/pci/tw5864/tw5864-h264.o
  AR      drivers/media/pci/solo6x10/built-in.a
  CC      drivers/media/pci/tw5864/tw5864-util.o
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.o
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.o
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.o
  CC      drivers/media/usb/tm6000/tm6000-cards.o
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.o
  CC      drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.o
  CC      drivers/media/usb/tm6000/tm6000-core.o
  AR      drivers/media/usb/cx231xx/built-in.a
  CC      drivers/media/usb/tm6000/tm6000-i2c.o
  CC      drivers/media/platform/mtk-vcodec/venc/venc_h264_if.o
  CC      drivers/media/usb/tm6000/tm6000-video.o
  CC      drivers/media/usb/tm6000/tm6000-stds.o
  AR      drivers/media/pci/tw5864/built-in.a
  AR      drivers/media/pci/built-in.a
  CC      drivers/media/usb/tm6000/tm6000-input.o
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.o
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.o
  CC      drivers/media/usb/tm6000/tm6000-alsa.o
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.o
  CC      drivers/media/platform/mtk-vcodec/venc_drv_if.o
  CC      drivers/media/usb/em28xx/em28xx-core.o
  CC      drivers/media/usb/tm6000/tm6000-dvb.o
  CC      drivers/media/usb/em28xx/em28xx-i2c.o
  CC      drivers/media/platform/mtk-vcodec/venc_vpu_if.o
  CC      drivers/media/usb/em28xx/em28xx-cards.o
  CC      drivers/media/usb/em28xx/em28xx-camera.o
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.o
  CC      drivers/media/usb/em28xx/em28xx-video.o
  CC      drivers/media/usb/em28xx/em28xx-vbi.o
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_util.o
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.o
  AR      drivers/media/usb/tm6000/built-in.a
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.o
  CC      drivers/media/usb/em28xx/em28xx-audio.o
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_scp.o
  CC      drivers/media/usb/em28xx/em28xx-dvb.o
  CC      drivers/media/usb/em28xx/em28xx-input.o
  CC      drivers/media/usb/usbtv/usbtv-core.o
  CC      drivers/media/usb/go7007/go7007-v4l2.o
  CC      drivers/media/usb/go7007/go7007-driver.o
  CC      drivers/media/usb/go7007/go7007-i2c.o
  CC      drivers/media/usb/go7007/go7007-fw.o
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.o
  CC      drivers/media/usb/go7007/snd-go7007.o
  CC      drivers/media/usb/usbtv/usbtv-video.o
  CC      drivers/media/usb/usbtv/usbtv-audio.o
  CC      drivers/media/usb/go7007/go7007-usb.o
  CC      drivers/media/usb/go7007/s2250-board.o
  AR      drivers/media/usb/em28xx/built-in.a
  AR      drivers/media/platform/mtk-vcodec/built-in.a
make[2]: *** [scripts/Makefile.build:550: drivers/media/platform] Error 2
make[2]: *** Waiting for unfinished jobs....
  AR      drivers/media/usb/go7007/built-in.a
  AR      drivers/media/usb/usbtv/built-in.a
  AR      drivers/media/usb/built-in.a
make[1]: *** [scripts/Makefile.build:550: drivers/media] Error 2
make: *** [Makefile:1831: drivers] Error 2
Build step 'Execute shell' marked build as failure
