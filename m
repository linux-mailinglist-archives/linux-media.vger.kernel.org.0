Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44B2E49FCBC
	for <lists+linux-media@lfdr.de>; Fri, 28 Jan 2022 16:23:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245600AbiA1PXf convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 28 Jan 2022 10:23:35 -0500
Received: from www.linuxtv.org ([130.149.80.248]:53210 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245268AbiA1PXe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jan 2022 10:23:34 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nDT60-00CJdd-Lz; Fri, 28 Jan 2022 15:23:29 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nDT5z-004fMT-5M; Fri, 28 Jan 2022 15:23:26 +0000
Date:   Fri, 28 Jan 2022 15:23:26 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        mchehab@linuxtv.org
Message-ID: <1443332750.1.1643383406611@builder.linuxtv.org>
Subject: Build failed in Jenkins: media_stage_gcc #33
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: media_stage_gcc
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/media_stage_gcc/33/display/redirect?page=changes>

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

[Mauro Carvalho Chehab] media: aspeed: use v4l2_info/v4l2_warn/v4l2_dbg for log

[Mauro Carvalho Chehab] media: aspeed: add more debug log messages

[Mauro Carvalho Chehab] media: aspeed: Fix no complete irq for non-64-aligned width

[Mauro Carvalho Chehab] media: aspeed: Correct value for h-total-pixels

[Mauro Carvalho Chehab] media: aspeed: Use FIELD_GET to improve readability

[Mauro Carvalho Chehab] media: aspeed: Correct values for detected timing

[Mauro Carvalho Chehab] media: lirc: remove unused lirc features

[Mauro Carvalho Chehab] media: rc-core: rename ir_raw_event_reset to ir_raw_event_overflow

[Mauro Carvalho Chehab] media: lirc: report ir receiver overflow


------------------------------------------
[...truncated 61.24 KB...]
  CC      drivers/media/pci/tw686x/tw686x-video.o
  CC      drivers/media/usb/em28xx/em28xx-i2c.o
  CC      drivers/media/usb/cx231xx/cx231xx-avcore.o
  CC      drivers/media/i2c/max2175.o
  CC      drivers/media/usb/tm6000/tm6000-video.o
  CC      drivers/media/rc/mtk-cir.o
  CC      drivers/media/usb/usbtv/usbtv-audio.o
  CC      drivers/media/usb/go7007/go7007-v4l2.o
  AR      drivers/media/platform/rockchip/rkisp1/built-in.a
  CC      drivers/media/platform/rockchip/rga/rga.o
  CC      drivers/media/pci/tw686x/tw686x-audio.o
  CC      drivers/media/usb/em28xx/em28xx-cards.o
  CC      drivers/media/rc/xbox_remote.o
  AR      drivers/media/usb/usbtv/built-in.a
  CC      drivers/media/i2c/ov08d10.o
  CC      drivers/media/usb/tm6000/tm6000-stds.o
  CC      drivers/media/usb/cx231xx/cx231xx-417.o
  CC      drivers/media/usb/cx231xx/cx231xx-pcb-cfg.o
  AR      drivers/media/pci/tw686x/built-in.a
  CC      drivers/media/pci/dt3155/dt3155.o
  CC      drivers/media/rc/ir_toy.o
  CC      drivers/media/platform/rockchip/rga/rga-hw.o
  CC      drivers/media/usb/tm6000/tm6000-input.o
  CC      drivers/media/usb/em28xx/em28xx-camera.o
  CC      drivers/media/platform/rockchip/rga/rga-buf.o
  CC      drivers/media/usb/go7007/go7007-driver.o
  AR      drivers/media/rc/built-in.a
  CC      drivers/media/i2c/hi847.o
  CC      drivers/media/test-drivers/vimc/vimc-core.o
  AR      drivers/media/pci/dt3155/built-in.a
  CC      drivers/media/pci/meye/meye.o
  CC      drivers/media/usb/cx231xx/cx231xx-vbi.o
  CC      drivers/media/usb/cx231xx/cx231xx-input.o
  CC      drivers/media/usb/tm6000/tm6000-alsa.o
  AR      drivers/media/platform/rockchip/rga/built-in.a
  CC      drivers/media/platform/omap/omap_vout.o
  CC      drivers/media/usb/em28xx/em28xx-video.o
  CC      drivers/media/test-drivers/vimc/vimc-common.o
  AR      drivers/media/i2c/built-in.a
  CC      drivers/media/test-drivers/vivid/vivid-core.o
  CC      drivers/media/usb/go7007/go7007-i2c.o
  CC      drivers/media/test-drivers/vim2m.o
  CC      drivers/media/usb/cx231xx/cx231xx-audio.o
  AR      drivers/media/pci/meye/built-in.a
  CC      drivers/media/pci/sta2x11/sta2x11_vip.o
  CC      drivers/media/test-drivers/vimc/vimc-streamer.o
  CC      drivers/media/usb/tm6000/tm6000-dvb.o
  CC      drivers/media/usb/go7007/go7007-fw.o
  CC      drivers/media/platform/omap/omap_vout_vrfb.o
  CC      drivers/media/test-drivers/vimc/vimc-capture.o
  CC      drivers/media/usb/cx231xx/cx231xx-dvb.o
  CC      drivers/media/test-drivers/vimc/vimc-debayer.o
  CC      drivers/media/test-drivers/vivid/vivid-ctrls.o
  CC      drivers/media/usb/em28xx/em28xx-vbi.o
  AR      drivers/media/pci/sta2x11/built-in.a
  CC      drivers/media/pci/solo6x10/solo6x10-core.o
  AR      drivers/media/usb/tm6000/built-in.a
  CC      drivers/media/test-drivers/vivid/vivid-vid-common.o
  CC      drivers/media/test-drivers/vicodec/vicodec-core.o
  CC      drivers/media/test-drivers/vimc/vimc-scaler.o
  CC      drivers/media/usb/em28xx/em28xx-audio.o
  AR      drivers/media/platform/omap/built-in.a
  CC      drivers/media/usb/go7007/snd-go7007.o
  CC      drivers/media/platform/am437x/am437x-vpfe.o
  AR      drivers/media/usb/cx231xx/built-in.a
  CC      drivers/media/test-drivers/vimc/vimc-sensor.o
  CC      drivers/media/test-drivers/vivid/vivid-vid-cap.o
  CC      drivers/media/pci/solo6x10/solo6x10-i2c.o
  CC      drivers/media/usb/go7007/go7007-usb.o
  CC      drivers/media/test-drivers/vivid/vivid-vid-out.o
  CC      drivers/media/usb/em28xx/em28xx-dvb.o
  CC      drivers/media/test-drivers/vivid/vivid-kthread-cap.o
  AR      drivers/media/test-drivers/vimc/built-in.a
  CC      drivers/media/test-drivers/vivid/vivid-kthread-out.o
  CC      drivers/media/pci/solo6x10/solo6x10-p2m.o
  AR      drivers/media/test-drivers/vicodec/built-in.a
  CC      drivers/media/pci/solo6x10/solo6x10-v4l2.o
  AR      drivers/media/platform/am437x/built-in.a
  CC      drivers/media/usb/go7007/s2250-board.o
  CC      drivers/media/platform/rcar-isp.o
  CC      drivers/media/platform/xilinx/xilinx-dma.o
  CC      drivers/media/platform/xilinx/xilinx-vip.o
  CC      drivers/media/usb/em28xx/em28xx-input.o
  CC      drivers/media/platform/xilinx/xilinx-vipp.o
  CC      drivers/media/test-drivers/vivid/vivid-radio-rx.o
  CC      drivers/media/platform/xilinx/xilinx-csi2rxss.o
  CC      drivers/media/pci/solo6x10/solo6x10-tw28.o
  AR      drivers/media/usb/go7007/built-in.a
  CC      drivers/media/platform/xilinx/xilinx-tpg.o
  CC      drivers/media/test-drivers/vivid/vivid-radio-tx.o
  CC      drivers/media/test-drivers/vivid/vivid-radio-common.o
  CC      drivers/media/platform/xilinx/xilinx-vtc.o
  CC      drivers/media/test-drivers/vivid/vivid-sdr-cap.o
  AR      drivers/media/usb/em28xx/built-in.a
  AR      drivers/media/usb/built-in.a
  CC      drivers/media/test-drivers/vivid/vivid-vbi-cap.o
  CC      drivers/media/radio/radio-isa.o
  CC      drivers/media/pci/solo6x10/solo6x10-gpio.o
  CC      drivers/media/pci/solo6x10/solo6x10-disp.o
  CC      drivers/media/pci/solo6x10/solo6x10-enc.o
  CC      drivers/media/pci/solo6x10/solo6x10-v4l2-enc.o
  CC      drivers/media/pci/solo6x10/solo6x10-g723.o
  CC      drivers/media/pci/cobalt/cobalt-driver.o
  AR      drivers/media/platform/xilinx/built-in.a
  CC      drivers/media/platform/rcar-vin/rcar-csi2.o
  CC      drivers/media/test-drivers/vivid/vivid-vbi-out.o
  CC      drivers/media/radio/radio-aztech.o
  CC      drivers/media/test-drivers/vivid/vivid-osd.o
  CC      drivers/media/test-drivers/vivid/vivid-meta-cap.o
  CC      drivers/media/pci/tw5864/tw5864-core.o
  CC      drivers/media/pci/tw5864/tw5864-video.o
  CC      drivers/media/pci/solo6x10/solo6x10-eeprom.o
  CC      drivers/media/radio/radio-rtrack2.o
  CC      drivers/media/platform/rcar-vin/rcar-core.o
  CC      drivers/media/platform/rcar-vin/rcar-dma.o
  CC      drivers/media/pci/cobalt/cobalt-irq.o
  CC      drivers/media/pci/tw5864/tw5864-h264.o
  CC      drivers/media/pci/cobalt/cobalt-v4l2.o
  CC      drivers/media/radio/radio-sf16fmi.o
  AR      drivers/media/pci/solo6x10/built-in.a
  CC      drivers/media/pci/cobalt/cobalt-i2c.o
  CC      drivers/media/pci/cobalt/cobalt-omnitek.o
  CC      drivers/media/radio/radio-sf16fmr2.o
  CC      drivers/media/test-drivers/vivid/vivid-meta-out.o
  CC      drivers/media/radio/radio-cadet.o
  CC      drivers/media/platform/rcar-vin/rcar-v4l2.o
  CC      drivers/media/radio/radio-typhoon.o
  CC      drivers/media/pci/tw5864/tw5864-util.o
  CC      drivers/media/test-drivers/vivid/vivid-kthread-touch.o
  CC      drivers/media/test-drivers/vivid/vivid-touch-cap.o
  CC      drivers/media/pci/cobalt/cobalt-flash.o
  CC      drivers/media/test-drivers/vivid/vivid-cec.o
  CC      drivers/media/pci/cobalt/cobalt-cpld.o
  CC      drivers/media/radio/radio-terratec.o
  AR      drivers/media/platform/rcar-vin/built-in.a
  CC      drivers/media/platform/atmel/atmel-isi.o
  AR      drivers/media/pci/tw5864/built-in.a
  CC      drivers/media/pci/cobalt/cobalt-alsa-main.o
  CC      drivers/media/pci/cobalt/cobalt-alsa-pcm.o
  CC      drivers/media/platform/atmel/atmel-isc-base.o
  CC      drivers/media/radio/radio-maxiradio.o
  CC      drivers/media/platform/atmel/atmel-isc-clk.o
  CC      drivers/media/platform/atmel/atmel-sama5d2-isc.o
  AR      drivers/media/test-drivers/vivid/built-in.a
  AR      drivers/media/test-drivers/built-in.a
  CC      drivers/media/platform/atmel/atmel-sama7g5-isc.o
  CC      drivers/media/platform/atmel/microchip-csi2dc.o
  CC      drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.o
  CC      drivers/media/radio/radio-shark.o
  AR      drivers/media/pci/cobalt/built-in.a
  AR      drivers/media/pci/built-in.a
  CC      drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.o
  CC      drivers/media/radio/radio-shark2.o
  CC      drivers/media/radio/radio-tea5777.o
  CC      drivers/media/radio/radio-aimslab.o
  CC      drivers/media/radio/radio-zoltrix.o
  CC      drivers/media/radio/radio-gemtek.o
drivers/media/platform/atmel/microchip-csi2dc.c: In function ‘csi2dc_get_mbus_config’:
drivers/media/platform/atmel/microchip-csi2dc.c:360:17: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
  360 |  if (mbus_config.flags & V4L2_MBUS_CSI2_CHANNEL_0)
      |                 ^
drivers/media/platform/atmel/microchip-csi2dc.c:360:26: error: ‘V4L2_MBUS_CSI2_CHANNEL_0’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
  360 |  if (mbus_config.flags & V4L2_MBUS_CSI2_CHANNEL_0)
      |                          ^~~~~~~~~~~~~~~~~~~~~~~~
      |                          V4L2_MBUS_CSI2_CPHY
drivers/media/platform/atmel/microchip-csi2dc.c:360:26: note: each undeclared identifier is reported only once for each function it appears in
drivers/media/platform/atmel/microchip-csi2dc.c:362:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
  362 |  else if (mbus_config.flags & V4L2_MBUS_CSI2_CHANNEL_1)
      |                      ^
drivers/media/platform/atmel/microchip-csi2dc.c:362:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_1’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
  362 |  else if (mbus_config.flags & V4L2_MBUS_CSI2_CHANNEL_1)
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~
      |                               V4L2_MBUS_CSI2_CPHY
drivers/media/platform/atmel/microchip-csi2dc.c:364:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
  364 |  else if (mbus_config.flags & V4L2_MBUS_CSI2_CHANNEL_2)
      |                      ^
drivers/media/platform/atmel/microchip-csi2dc.c:364:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_2’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
  364 |  else if (mbus_config.flags & V4L2_MBUS_CSI2_CHANNEL_2)
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~
      |                               V4L2_MBUS_CSI2_CPHY
drivers/media/platform/atmel/microchip-csi2dc.c:366:22: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
  366 |  else if (mbus_config.flags & V4L2_MBUS_CSI2_CHANNEL_3)
      |                      ^
drivers/media/platform/atmel/microchip-csi2dc.c:366:31: error: ‘V4L2_MBUS_CSI2_CHANNEL_3’ undeclared (first use in this function); did you mean ‘V4L2_MBUS_CSI2_CPHY’?
  366 |  else if (mbus_config.flags & V4L2_MBUS_CSI2_CHANNEL_3)
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~
      |                               V4L2_MBUS_CSI2_CPHY
drivers/media/platform/atmel/microchip-csi2dc.c:371:33: error: ‘struct v4l2_mbus_config’ has no member named ‘flags’
  371 |  csi2dc->clk_gated = mbus_config.flags &
      |                                 ^
  CC      drivers/media/radio/radio-trust.o
make[4]: *** [scripts/Makefile.build:288: drivers/media/platform/atmel/microchip-csi2dc.o] Error 1
make[3]: *** [scripts/Makefile.build:550: drivers/media/platform/atmel] Error 2
make[3]: *** Waiting for unfinished jobs....
  CC      drivers/media/radio/radio-si476x.o
  CC      drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.o
  CC      drivers/media/radio/radio-miropcm20.o
  CC      drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.o
  CC      drivers/media/radio/dsbr100.o
  CC      drivers/media/radio/si470x/radio-si470x-common.o
  CC      drivers/media/radio/si4713/si4713.o
  CC      drivers/media/radio/radio-mr800.o
  CC      drivers/media/radio/si470x/radio-si470x-usb.o
  CC      drivers/media/radio/si470x/radio-si470x-i2c.o
  CC      drivers/media/radio/radio-keene.o
  CC      drivers/media/radio/radio-ma901.o
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.o
  CC      drivers/media/platform/mtk-vcodec/vdec_drv_if.o
  CC      drivers/media/platform/mtk-vcodec/vdec_vpu_if.o
  CC      drivers/media/platform/mtk-vcodec/vdec_msg_queue.o
  CC      drivers/media/radio/si4713/radio-usb-si4713.o
  CC      drivers/media/radio/si4713/radio-platform-si4713.o
  AR      drivers/media/radio/si470x/built-in.a
  CC      drivers/media/radio/radio-tea5764.o
  CC      drivers/media/radio/saa7706h.o
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.o
  CC      drivers/media/radio/tef6862.o
  CC      drivers/media/radio/radio-timb.o
  CC      drivers/media/radio/radio-wl1273.o
  CC      drivers/media/radio/tea575x.o
  CC      drivers/media/radio/wl128x/fmdrv_common.o
  AR      drivers/media/radio/si4713/built-in.a
  CC      drivers/media/radio/radio-raremono.o
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.o
  CC      drivers/media/radio/wl128x/fmdrv_rx.o
  CC      drivers/media/radio/wl128x/fmdrv_tx.o
  CC      drivers/media/radio/wl128x/fmdrv_v4l2.o
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.o
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.o
  CC      drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.o
  CC      drivers/media/platform/mtk-vcodec/venc/venc_h264_if.o
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.o
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.o
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.o
  CC      drivers/media/platform/mtk-vcodec/venc_drv_if.o
  CC      drivers/media/platform/mtk-vcodec/venc_vpu_if.o
  AR      drivers/media/radio/wl128x/built-in.a
  AR      drivers/media/radio/built-in.a
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.o
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_util.o
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.o
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.o
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_scp.o
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.o
  AR      drivers/media/platform/mtk-vcodec/built-in.a
make[2]: *** [scripts/Makefile.build:550: drivers/media/platform] Error 2
make[1]: *** [scripts/Makefile.build:550: drivers/media] Error 2
make: *** [Makefile:1831: drivers] Error 2
Build step 'Execute shell' marked build as failure
