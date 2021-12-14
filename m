Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E76AF47435F
	for <lists+linux-media@lfdr.de>; Tue, 14 Dec 2021 14:25:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234363AbhLNNY7 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 14 Dec 2021 08:24:59 -0500
Received: from www.linuxtv.org ([130.149.80.248]:36552 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232033AbhLNNY6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Dec 2021 08:24:58 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mx7nZ-002qBu-4D; Tue, 14 Dec 2021 13:24:53 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mx7nW-005Fzu-NC; Tue, 14 Dec 2021 13:24:50 +0000
Date:   Tue, 14 Dec 2021 13:24:49 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        mchehab@linuxtv.org
Message-ID: <847982460.0.1639488290053@builder.linuxtv.org>
Subject: Build failed in Jenkins: media_stage_gcc #15
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

See <https://builder.linuxtv.org/job/media_stage_gcc/15/display/redirect?page=changes>

Changes:

[Mauro Carvalho Chehab] media: i2c: Add driver for the Analog Devices ADDI9036 ToF front-end

[Mauro Carvalho Chehab] media: pt3: Switch to using functions pcim_* and devm_*


------------------------------------------
[...truncated 59.80 KB...]
  CC      drivers/media/platform/omap/omap_voutlib.o
  CC      drivers/media/platform/xilinx/xilinx-dma.o
  CC      drivers/media/platform/vsp1/vsp1_uds.o
  CC      drivers/media/platform/vsp1/vsp1_hgo.o
  CC      drivers/media/platform/vsp1/vsp1_hgt.o
  CC      drivers/media/platform/omap/omap_vout_vrfb.o
  CC      drivers/media/i2c/rdacm20.o
  CC      drivers/media/usb/pvrusb2/pvrusb2-audio.o
  CC      drivers/media/platform/xilinx/xilinx-vip.o
  CC      drivers/media/usb/hdpvr/hdpvr-video.o
  CC      drivers/media/platform/rcar-isp.o
  CC      drivers/media/platform/rcar-vin/rcar-csi2.o
  AR      drivers/media/platform/am437x/built-in.a
  CC      drivers/media/platform/xilinx/xilinx-vipp.o
  CC      drivers/media/platform/vsp1/vsp1_histo.o
  CC      drivers/media/i2c/rdacm21.o
  CC      drivers/media/usb/pvrusb2/pvrusb2-encoder.o
  CC      drivers/media/i2c/st-mipid02.o
  CC      drivers/media/i2c/max2175.o
  CC      drivers/media/platform/rcar-vin/rcar-core.o
  CC      drivers/media/usb/hdpvr/hdpvr-i2c.o
  AR      drivers/media/platform/omap/built-in.a
  CC      drivers/media/platform/atmel/atmel-isi.o
  CC      drivers/media/platform/xilinx/xilinx-csi2rxss.o
  CC      drivers/media/platform/vsp1/vsp1_lif.o
  CC      drivers/media/platform/xilinx/xilinx-tpg.o
  CC      drivers/media/usb/stk1160/stk1160-core.o
  CC      drivers/media/usb/pvrusb2/pvrusb2-video-v4l.o
  CC      drivers/media/platform/rcar-vin/rcar-dma.o
  CC      drivers/media/i2c/addi9036.o
  AR      drivers/media/usb/hdpvr/built-in.a
  CC      drivers/media/platform/atmel/atmel-isc-base.o
  CC      drivers/media/platform/atmel/atmel-sama5d2-isc.o
  CC      drivers/media/usb/stk1160/stk1160-v4l.o
  CC      drivers/media/platform/vsp1/vsp1_uif.o
  CC      drivers/media/platform/xilinx/xilinx-vtc.o
  CC      drivers/media/usb/pvrusb2/pvrusb2-eeprom.o
  CC      drivers/media/platform/atmel/atmel-sama7g5-isc.o
drivers/media/i2c/addi9036.c: In function ‘addi9036_get_pad_format’:
drivers/media/i2c/addi9036.c:310:52: error: passing argument 2 of ‘v4l2_subdev_get_try_format’ from incompatible pointer type [-Werror=incompatible-pointer-types]
  310 |   return v4l2_subdev_get_try_format(&addi9036->sd, cfg, pad);
      |                                                    ^~~
      |                                                    |
      |                                                    struct v4l2_subdev_pad_config *
In file included from drivers/media/i2c/addi9036.c:17:
./include/media/v4l2-subdev.h:995:33: note: expected ‘struct v4l2_subdev_state *’ but argument is of type ‘struct v4l2_subdev_pad_config *’
  995 |       struct v4l2_subdev_state *state,
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
drivers/media/i2c/addi9036.c: In function ‘addi9036_get_pad_crop’:
drivers/media/i2c/addi9036.c:342:50: error: passing argument 2 of ‘v4l2_subdev_get_try_crop’ from incompatible pointer type [-Werror=incompatible-pointer-types]
  342 |   return v4l2_subdev_get_try_crop(&addi9036->sd, cfg, pad);
      |                                                  ^~~
      |                                                  |
      |                                                  struct v4l2_subdev_pad_config *
In file included from drivers/media/i2c/addi9036.c:17:
./include/media/v4l2-subdev.h:1013:31: note: expected ‘struct v4l2_subdev_state *’ but argument is of type ‘struct v4l2_subdev_pad_config *’
 1013 |     struct v4l2_subdev_state *state,
      |     ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
drivers/media/i2c/addi9036.c: At top level:
drivers/media/i2c/addi9036.c:521:15: error: initialization of ‘int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *)’ from incompatible pointer type ‘int (*)(struct v4l2_subdev *, struct v4l2_subdev_pad_config *)’ [-Werror=incompatible-pointer-types]
  521 |  .init_cfg  = addi9036_entity_init_cfg,
      |               ^~~~~~~~~~~~~~~~~~~~~~~~
drivers/media/i2c/addi9036.c:521:15: note: (near initialization for ‘addi9036_subdev_pad_ops.init_cfg’)
drivers/media/i2c/addi9036.c:522:21: error: initialization of ‘int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_mbus_code_enum *)’ from incompatible pointer type ‘int (*)(struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_mbus_code_enum *)’ [-Werror=incompatible-pointer-types]
  522 |  .enum_mbus_code  = addi9036_enum_mbus_code,
      |                     ^~~~~~~~~~~~~~~~~~~~~~~
drivers/media/i2c/addi9036.c:522:21: note: (near initialization for ‘addi9036_subdev_pad_ops.enum_mbus_code’)
drivers/media/i2c/addi9036.c:523:21: error: initialization of ‘int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_frame_size_enum *)’ from incompatible pointer type ‘int (*)(struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_frame_size_enum *)’ [-Werror=incompatible-pointer-types]
  523 |  .enum_frame_size = addi9036_enum_frame_size,
      |                     ^~~~~~~~~~~~~~~~~~~~~~~~
drivers/media/i2c/addi9036.c:523:21: note: (near initialization for ‘addi9036_subdev_pad_ops.enum_frame_size’)
drivers/media/i2c/addi9036.c:524:14: error: initialization of ‘int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)’ from incompatible pointer type ‘int (*)(struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_format *)’ [-Werror=incompatible-pointer-types]
  524 |  .get_fmt  = addi9036_get_format,
      |              ^~~~~~~~~~~~~~~~~~~
drivers/media/i2c/addi9036.c:524:14: note: (near initialization for ‘addi9036_subdev_pad_ops.get_fmt’)
drivers/media/i2c/addi9036.c:525:14: error: initialization of ‘int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)’ from incompatible pointer type ‘int (*)(struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_format *)’ [-Werror=incompatible-pointer-types]
  525 |  .set_fmt  = addi9036_set_format,
      |              ^~~~~~~~~~~~~~~~~~~
drivers/media/i2c/addi9036.c:525:14: note: (near initialization for ‘addi9036_subdev_pad_ops.set_fmt’)
drivers/media/i2c/addi9036.c:526:20: error: initialization of ‘int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_selection *)’ from incompatible pointer type ‘int (*)(struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_selection *)’ [-Werror=incompatible-pointer-types]
  526 |  .get_selection  = addi9036_get_selection,
      |                    ^~~~~~~~~~~~~~~~~~~~~~
drivers/media/i2c/addi9036.c:526:20: note: (near initialization for ‘addi9036_subdev_pad_ops.get_selection’)
cc1: all warnings being treated as errors
make[3]: *** [scripts/Makefile.build:287: drivers/media/i2c/addi9036.o] Error 1
make[2]: *** [scripts/Makefile.build:549: drivers/media/i2c] Error 2
make[2]: *** Waiting for unfinished jobs....
  CC      drivers/media/usb/pvrusb2/pvrusb2-main.o
  CC      drivers/media/usb/stk1160/stk1160-video.o
  AR      drivers/media/platform/vsp1/built-in.a
  CC      drivers/media/usb/stk1160/stk1160-i2c.o
  CC      drivers/media/platform/rcar-vin/rcar-v4l2.o
  CC      drivers/media/usb/pvrusb2/pvrusb2-hdw.o
  CC      drivers/media/usb/cx231xx/cx231xx-video.o
  CC      drivers/media/usb/tm6000/tm6000-cards.o
  AR      drivers/media/platform/xilinx/built-in.a
  CC      drivers/media/usb/pvrusb2/pvrusb2-v4l2.o
  AR      drivers/media/platform/atmel/built-in.a
  CC      drivers/media/usb/tm6000/tm6000-core.o
  CC      drivers/media/usb/tm6000/tm6000-i2c.o
  CC      drivers/media/usb/tm6000/tm6000-video.o
  CC      drivers/media/usb/stk1160/stk1160-ac97.o
  AR      drivers/media/platform/rcar-vin/built-in.a
  CC      drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.o
  CC      drivers/media/platform/mtk-mdp/mtk_mdp_core.o
  CC      drivers/media/platform/mtk-jpeg/mtk_jpeg_core.o
  CC      drivers/media/platform/qcom/camss/camss.o
  CC      drivers/media/platform/qcom/venus/core.o
  CC      drivers/media/usb/cx231xx/cx231xx-i2c.o
  AR      drivers/media/usb/stk1160/built-in.a
  CC      drivers/media/usb/cx231xx/cx231xx-cards.o
  CC      drivers/media/usb/tm6000/tm6000-stds.o
  CC      drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.o
  CC      drivers/media/platform/qcom/venus/helpers.o
  CC      drivers/media/usb/pvrusb2/pvrusb2-ctrl.o
  CC      drivers/media/platform/mtk-mdp/mtk_mdp_m2m.o
  CC      drivers/media/usb/tm6000/tm6000-input.o
  CC      drivers/media/platform/qcom/camss/camss-csid.o
  CC      drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.o
  CC      drivers/media/usb/tm6000/tm6000-alsa.o
  CC      drivers/media/usb/cx231xx/cx231xx-core.o
  CC      drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.o
  CC      drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.o
  CC      drivers/media/platform/qcom/venus/firmware.o
  CC      drivers/media/usb/pvrusb2/pvrusb2-std.o
  CC      drivers/media/platform/qcom/camss/camss-csid-4-1.o
  CC      drivers/media/platform/mtk-mdp/mtk_mdp_regs.o
  CC      drivers/media/usb/tm6000/tm6000-dvb.o
  CC      drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_parse.o
  CC      drivers/media/usb/cx231xx/cx231xx-avcore.o
  CC      drivers/media/usb/pvrusb2/pvrusb2-devattr.o
  CC      drivers/media/usb/pvrusb2/pvrusb2-context.o
  CC      drivers/media/platform/qcom/camss/camss-csid-4-7.o
  CC      drivers/media/platform/qcom/venus/hfi_venus.o
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.o
  CC      drivers/media/platform/mtk-mdp/mtk_mdp_vpu.o
  CC      drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.o
  CC      drivers/media/platform/qcom/venus/hfi_msgs.o
  AR      drivers/media/usb/tm6000/built-in.a
  CC      drivers/media/usb/cx231xx/cx231xx-417.o
  CC      drivers/media/platform/qcom/camss/camss-csid-170.o
  CC      drivers/media/usb/pvrusb2/pvrusb2-cx2584x-v4l.o
  CC      drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.o
  CC      drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.o
  CC      drivers/media/platform/mtk-vcodec/vdec_drv_if.o
  AR      drivers/media/platform/mtk-mdp/built-in.a
  CC      drivers/media/platform/qcom/camss/camss-csiphy.o
  AR      drivers/media/platform/mtk-jpeg/built-in.a
  CC      drivers/media/platform/qcom/camss/camss-ispif.o
  CC      drivers/media/platform/qcom/venus/hfi.o
  CC      drivers/media/platform/qcom/venus/hfi_parser.o
  CC      drivers/media/usb/pvrusb2/pvrusb2-wm8775.o
  CC      drivers/media/usb/pvrusb2/pvrusb2-cs53l32a.o
  CC      drivers/media/usb/pvrusb2/pvrusb2-dvb.o
  CC      drivers/media/platform/mtk-vcodec/vdec_vpu_if.o
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.o
  CC      drivers/media/platform/qcom/camss/camss-vfe-4-1.o
  CC      drivers/media/usb/cx231xx/cx231xx-pcb-cfg.o
  CC      drivers/media/platform/qcom/camss/camss-vfe-4-7.o
  CC      drivers/media/platform/qcom/camss/camss-vfe-4-8.o
  CC      drivers/media/platform/qcom/camss/camss-vfe-170.o
  CC      drivers/media/platform/qcom/venus/pm_helpers.o
  CC      drivers/media/platform/qcom/camss/camss-vfe-gen1.o
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.o
  CC      drivers/media/usb/pvrusb2/pvrusb2-sysfs.o
  CC      drivers/media/usb/cx231xx/cx231xx-vbi.o
  CC      drivers/media/usb/cx231xx/cx231xx-input.o
  CC      drivers/media/platform/qcom/camss/camss-vfe.o
  CC      drivers/media/usb/cx231xx/cx231xx-audio.o
  CC      drivers/media/usb/cx231xx/cx231xx-dvb.o
  CC      drivers/media/usb/pvrusb2/pvrusb2-debugifc.o
  CC      drivers/media/usb/em28xx/em28xx-core.o
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.o
  CC      drivers/media/platform/qcom/venus/dbgfs.o
  CC      drivers/media/platform/qcom/venus/hfi_platform.o
  AR      drivers/media/usb/pvrusb2/built-in.a
  CC      drivers/media/usb/usbtv/usbtv-core.o
  CC      drivers/media/usb/usbtv/usbtv-video.o
  CC      drivers/media/platform/qcom/venus/hfi_platform_v4.o
  CC      drivers/media/platform/qcom/venus/hfi_platform_v6.o
  AR      drivers/media/usb/cx231xx/built-in.a
  CC      drivers/media/usb/usbtv/usbtv-audio.o
  CC      drivers/media/platform/qcom/camss/camss-video.o
  CC      drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.o
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.o
  CC      drivers/media/usb/em28xx/em28xx-i2c.o
  CC      drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.o
  CC      drivers/media/platform/mtk-vcodec/venc/venc_h264_if.o
  CC      drivers/media/platform/qcom/venus/vdec.o
  CC      drivers/media/platform/qcom/venus/vdec_ctrls.o
  AR      drivers/media/usb/usbtv/built-in.a
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.o
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.o
  AR      drivers/media/platform/qcom/camss/built-in.a
  CC      drivers/media/usb/go7007/go7007-v4l2.o
  CC      drivers/media/usb/as102/as102_drv.o
  CC      drivers/media/usb/em28xx/em28xx-cards.o
  CC      drivers/media/usb/go7007/go7007-driver.o
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.o
  CC      drivers/media/usb/as102/as102_fw.o
  CC      drivers/media/platform/qcom/venus/venc.o
  CC      drivers/media/platform/qcom/venus/venc_ctrls.o
  CC      drivers/media/platform/mtk-vcodec/venc_drv_if.o
  CC      drivers/media/usb/as102/as10x_cmd.o
  CC      drivers/media/usb/em28xx/em28xx-camera.o
  CC      drivers/media/platform/mtk-vcodec/venc_vpu_if.o
  CC      drivers/media/usb/go7007/go7007-i2c.o
  CC      drivers/media/usb/go7007/go7007-fw.o
  CC      drivers/media/usb/go7007/snd-go7007.o
  CC      drivers/media/usb/em28xx/em28xx-video.o
  CC      drivers/media/usb/go7007/go7007-usb.o
  CC      drivers/media/usb/em28xx/em28xx-vbi.o
  CC      drivers/media/usb/go7007/s2250-board.o
  AR      drivers/media/platform/qcom/venus/built-in.a
  CC      drivers/media/usb/em28xx/em28xx-audio.o
  CC      drivers/media/usb/as102/as10x_cmd_stream.o
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.o
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_util.o
  CC      drivers/media/usb/as102/as102_usb_drv.o
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.o
  CC      drivers/media/usb/em28xx/em28xx-dvb.o
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.o
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_scp.o
  CC      drivers/media/usb/as102/as10x_cmd_cfg.o
  CC      drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.o
  AR      drivers/media/usb/go7007/built-in.a
  CC      drivers/media/platform/meson/ge2d/ge2d.o
  CC      drivers/media/usb/em28xx/em28xx-input.o
  AR      drivers/media/usb/as102/built-in.a
  CC      drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.o
  CC      drivers/media/platform/sunxi/sun6i-csi/sun6i_video.o
  CC      drivers/media/platform/sunxi/sun8i-di/sun8i-di.o
  CC      drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.o
  AR      drivers/media/platform/mtk-vcodec/built-in.a
  CC      drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.o
  CC      drivers/media/platform/sunxi/sun8i-rotate/sun8i_formats.o
  CC      drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.o
  AR      drivers/media/usb/em28xx/built-in.a
  AR      drivers/media/usb/built-in.a
  AR      drivers/media/platform/meson/ge2d/built-in.a
  AR      drivers/media/platform/sunxi/sun8i-di/built-in.a
  AR      drivers/media/platform/sunxi/sun6i-csi/built-in.a
  AR      drivers/media/platform/sunxi/sun8i-rotate/built-in.a
  AR      drivers/media/platform/sunxi/sun4i-csi/built-in.a
  AR      drivers/media/platform/sunxi/built-in.a
  AR      drivers/media/platform/built-in.a
make[1]: *** [scripts/Makefile.build:549: drivers/media] Error 2
make: *** [Makefile:1846: drivers] Error 2
Build step 'Execute shell' marked build as failure
