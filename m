Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C34FC474387
	for <lists+linux-media@lfdr.de>; Tue, 14 Dec 2021 14:33:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234429AbhLNNdL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Dec 2021 08:33:11 -0500
Received: from www.linuxtv.org ([130.149.80.248]:38042 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232098AbhLNNdL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Dec 2021 08:33:11 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mx7vW-002qlX-H3; Tue, 14 Dec 2021 13:33:06 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mx7vU-005HGe-Gq; Tue, 14 Dec 2021 13:33:04 +0000
Date:   Tue, 14 Dec 2021 13:33:03 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        mchehab@linuxtv.org
Message-ID: <1805868822.1.1639488783969@builder.linuxtv.org>
Subject: Build failed in Jenkins: media_stage_clang #391
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

See <https://builder.linuxtv.org/job/media_stage_clang/391/display/redirect?page=changes>

Changes:

[Mauro Carvalho Chehab] media: i2c: Add driver for the Analog Devices ADDI9036 ToF front-end

[Mauro Carvalho Chehab] media: pt3: Switch to using functions pcim_* and devm_*


------------------------------------------
[...truncated 59.39 KB...]
  CC      drivers/media/platform/vsp1/vsp1_uif.o
  CC      drivers/media/usb/gspca/pac207.o
  CC      drivers/media/platform/rcar-vin/rcar-v4l2.o
  AR      drivers/media/platform/atmel/built-in.a
  CC      drivers/media/usb/gspca/pac7302.o
  CC      drivers/media/i2c/imx412.o
  CC      drivers/media/usb/stk1160/stk1160-core.o
  CC      drivers/media/usb/stk1160/stk1160-v4l.o
  CC      drivers/media/usb/pvrusb2/pvrusb2-cx2584x-v4l.o
  AR      drivers/media/platform/vsp1/built-in.a
  CC      drivers/media/usb/pvrusb2/pvrusb2-wm8775.o
  CC      drivers/media/usb/pvrusb2/pvrusb2-cs53l32a.o
  CC      drivers/media/usb/pvrusb2/pvrusb2-dvb.o
  AR      drivers/media/platform/rcar-vin/built-in.a
  CC      drivers/media/usb/gspca/pac7311.o
  CC      drivers/media/i2c/max9286.o
  CC      drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.o
  CC      drivers/media/platform/mtk-mdp/mtk_mdp_core.o
  CC      drivers/media/usb/stk1160/stk1160-video.o
  CC      drivers/media/platform/mtk-jpeg/mtk_jpeg_core.o
  CC      drivers/media/platform/qcom/camss/camss.o
  CC      drivers/media/platform/qcom/venus/core.o
  CC      drivers/media/usb/gspca/se401.o
  CC      drivers/media/usb/pvrusb2/pvrusb2-sysfs.o
  CC      drivers/media/i2c/rdacm20.o
  CC      drivers/media/usb/stk1160/stk1160-i2c.o
  CC      drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.o
  CC      drivers/media/platform/mtk-mdp/mtk_mdp_m2m.o
  CC      drivers/media/usb/pvrusb2/pvrusb2-debugifc.o
  CC      drivers/media/platform/qcom/venus/helpers.o
  CC      drivers/media/platform/qcom/camss/camss-csid.o
  CC      drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.o
  CC      drivers/media/usb/gspca/sn9c2028.o
  CC      drivers/media/i2c/rdacm21.o
  AR      drivers/media/usb/pvrusb2/built-in.a
  CC      drivers/media/usb/stk1160/stk1160-ac97.o
  CC      drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.o
  CC      drivers/media/i2c/st-mipid02.o
  CC      drivers/media/platform/qcom/camss/camss-csid-4-1.o
  CC      drivers/media/platform/mtk-mdp/mtk_mdp_regs.o
  CC      drivers/media/usb/gspca/sn9c20x.o
  AR      drivers/media/usb/stk1160/built-in.a
  CC      drivers/media/usb/cx231xx/cx231xx-video.o
  CC      drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.o
  CC      drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_parse.o
  CC      drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.o
  CC      drivers/media/i2c/max2175.o
  CC      drivers/media/platform/qcom/venus/firmware.o
  CC      drivers/media/platform/qcom/camss/camss-csid-4-7.o
  CC      drivers/media/platform/mtk-mdp/mtk_mdp_vpu.o
  CC      drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.o
  CC      drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.o
  CC      drivers/media/usb/gspca/sonixb.o
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.o
  CC      drivers/media/platform/qcom/camss/camss-csid-170.o
  CC      drivers/media/i2c/addi9036.o
  CC      drivers/media/usb/cx231xx/cx231xx-i2c.o
  CC      drivers/media/platform/qcom/venus/hfi_venus.o
  AR      drivers/media/platform/mtk-mdp/built-in.a
  CC      drivers/media/platform/meson/ge2d/ge2d.o
  AR      drivers/media/platform/mtk-jpeg/built-in.a
  CC      drivers/media/usb/gspca/sonixj.o
  CC      drivers/media/usb/tm6000/tm6000-cards.o
  CC      drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.o
drivers/media/i2c/addi9036.c:310:52: error: incompatible pointer types passing 'struct v4l2_subdev_pad_config *' to parameter of type 'struct v4l2_subdev_state *' [-Werror,-Wincompatible-pointer-types]
                return v4l2_subdev_get_try_format(&addi9036->sd, cfg, pad);
                                                                 ^~~
./include/media/v4l2-subdev.h:995:33: note: passing argument to parameter 'state' here
                           struct v4l2_subdev_state *state,
                                                     ^
drivers/media/i2c/addi9036.c:342:50: error: incompatible pointer types passing 'struct v4l2_subdev_pad_config *' to parameter of type 'struct v4l2_subdev_state *' [-Werror,-Wincompatible-pointer-types]
                return v4l2_subdev_get_try_crop(&addi9036->sd, cfg, pad);
                                                               ^~~
./include/media/v4l2-subdev.h:1013:31: note: passing argument to parameter 'state' here
                         struct v4l2_subdev_state *state,
                                                   ^
drivers/media/i2c/addi9036.c:521:15: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_pad_config *)' [-Werror,-Wincompatible-function-pointer-types]
        .init_cfg               = addi9036_entity_init_cfg,
                                  ^~~~~~~~~~~~~~~~~~~~~~~~
drivers/media/i2c/addi9036.c:522:21: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_mbus_code_enum *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_mbus_code_enum *)' [-Werror,-Wincompatible-function-pointer-types]
        .enum_mbus_code         = addi9036_enum_mbus_code,
                                  ^~~~~~~~~~~~~~~~~~~~~~~
drivers/media/i2c/addi9036.c:523:21: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_frame_size_enum *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_frame_size_enum *)' [-Werror,-Wincompatible-function-pointer-types]
        .enum_frame_size        = addi9036_enum_frame_size,
                                  ^~~~~~~~~~~~~~~~~~~~~~~~
drivers/media/i2c/addi9036.c:524:14: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_format *)' [-Werror,-Wincompatible-function-pointer-types]
        .get_fmt                = addi9036_get_format,
                                  ^~~~~~~~~~~~~~~~~~~
drivers/media/i2c/addi9036.c:525:14: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_format *)' [-Werror,-Wincompatible-function-pointer-types]
        .set_fmt                = addi9036_set_format,
                                  ^~~~~~~~~~~~~~~~~~~
drivers/media/i2c/addi9036.c:526:20: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_selection *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_selection *)' [-Werror,-Wincompatible-function-pointer-types]
        .get_selection          = addi9036_get_selection,
                                  ^~~~~~~~~~~~~~~~~~~~~~
8 errors generated.
make[3]: *** [scripts/Makefile.build:287: drivers/media/i2c/addi9036.o] Error 1
make[2]: *** [scripts/Makefile.build:549: drivers/media/i2c] Error 2
make[2]: *** Waiting for unfinished jobs....
  CC      drivers/media/usb/em28xx/em28xx-core.o
  CC      drivers/media/platform/mtk-vcodec/vdec_drv_if.o
  CC      drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.o
  CC      drivers/media/usb/cx231xx/cx231xx-cards.o
  CC      drivers/media/platform/qcom/venus/hfi_msgs.o
  AR      drivers/media/platform/meson/ge2d/built-in.a
  CC      drivers/media/usb/usbtv/usbtv-core.o
  AR      drivers/media/platform/sunxi/sun4i-csi/built-in.a
  CC      drivers/media/platform/sunxi/sun6i-csi/sun6i_video.o
  CC      drivers/media/platform/mtk-vcodec/vdec_vpu_if.o
  CC      drivers/media/usb/tm6000/tm6000-core.o
  CC      drivers/media/usb/gspca/spca500.o
  CC      drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.o
  CC      drivers/media/usb/em28xx/em28xx-i2c.o
  CC      drivers/media/usb/cx231xx/cx231xx-core.o
  CC      drivers/media/platform/qcom/venus/hfi.o
  CC      drivers/media/usb/usbtv/usbtv-video.o
  CC      drivers/media/usb/gspca/spca501.o
  CC      drivers/media/usb/tm6000/tm6000-i2c.o
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.o
  CC      drivers/media/platform/qcom/camss/camss-csiphy.o
  CC      drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.o
  CC      drivers/media/usb/em28xx/em28xx-cards.o
  CC      drivers/media/usb/cx231xx/cx231xx-avcore.o
  CC      drivers/media/platform/qcom/venus/hfi_parser.o
  CC      drivers/media/usb/usbtv/usbtv-audio.o
  CC      drivers/media/usb/tm6000/tm6000-video.o
  CC      drivers/media/platform/qcom/camss/camss-ispif.o
  CC      drivers/media/usb/gspca/spca505.o
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.o
  CC      drivers/media/platform/qcom/venus/pm_helpers.o
  AR      drivers/media/platform/sunxi/sun6i-csi/built-in.a
  AR      drivers/media/usb/usbtv/built-in.a
  CC      drivers/media/platform/sunxi/sun8i-di/sun8i-di.o
  CC      drivers/media/platform/qcom/venus/dbgfs.o
  CC      drivers/media/usb/em28xx/em28xx-camera.o
  CC      drivers/media/usb/cx231xx/cx231xx-417.o
  CC      drivers/media/usb/gspca/spca506.o
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.o
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.o
  CC      drivers/media/platform/qcom/camss/camss-vfe-4-1.o
  CC      drivers/media/usb/tm6000/tm6000-stds.o
  CC      drivers/media/platform/qcom/venus/hfi_platform.o
  CC      drivers/media/usb/em28xx/em28xx-video.o
  CC      drivers/media/usb/gspca/spca508.o
  CC      drivers/media/platform/qcom/venus/hfi_platform_v4.o
  CC      drivers/media/usb/cx231xx/cx231xx-pcb-cfg.o
  CC      drivers/media/platform/qcom/venus/hfi_platform_v6.o
  AR      drivers/media/platform/sunxi/sun8i-di/built-in.a
  CC      drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.o
  CC      drivers/media/usb/go7007/go7007-v4l2.o
  CC      drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.o
  CC      drivers/media/usb/tm6000/tm6000-input.o
  CC      drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.o
  CC      drivers/media/platform/qcom/camss/camss-vfe-4-7.o
  CC      drivers/media/usb/gspca/spca561.o
  CC      drivers/media/usb/cx231xx/cx231xx-vbi.o
  CC      drivers/media/platform/sunxi/sun8i-rotate/sun8i_formats.o
  CC      drivers/media/platform/mtk-vcodec/venc/venc_h264_if.o
  CC      drivers/media/usb/em28xx/em28xx-vbi.o
  CC      drivers/media/usb/tm6000/tm6000-alsa.o
  CC      drivers/media/platform/qcom/venus/vdec.o
  CC      drivers/media/usb/go7007/go7007-driver.o
  CC      drivers/media/usb/gspca/spca1528.o
  CC      drivers/media/usb/cx231xx/cx231xx-input.o
  CC      drivers/media/platform/qcom/camss/camss-vfe-4-8.o
  CC      drivers/media/usb/em28xx/em28xx-audio.o
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.o
  AR      drivers/media/platform/sunxi/sun8i-rotate/built-in.a
  AR      drivers/media/platform/sunxi/built-in.a
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.o
  CC      drivers/media/usb/gspca/sq905.o
  CC      drivers/media/usb/go7007/go7007-i2c.o
  CC      drivers/media/usb/tm6000/tm6000-dvb.o
  CC      drivers/media/platform/qcom/venus/vdec_ctrls.o
  CC      drivers/media/usb/cx231xx/cx231xx-audio.o
  CC      drivers/media/platform/qcom/camss/camss-vfe-170.o
  CC      drivers/media/usb/em28xx/em28xx-dvb.o
  CC      drivers/media/usb/go7007/go7007-fw.o
  CC      drivers/media/usb/cx231xx/cx231xx-dvb.o
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.o
  CC      drivers/media/usb/gspca/sq905c.o
  CC      drivers/media/platform/qcom/venus/venc.o
  AR      drivers/media/usb/tm6000/built-in.a
  CC      drivers/media/usb/gspca/sq930x.o
  CC      drivers/media/platform/mtk-vcodec/venc_drv_if.o
  CC      drivers/media/platform/qcom/camss/camss-vfe-gen1.o
  CC      drivers/media/platform/qcom/camss/camss-vfe.o
  CC      drivers/media/platform/mtk-vcodec/venc_vpu_if.o
  CC      drivers/media/usb/em28xx/em28xx-input.o
  CC      drivers/media/usb/gspca/sunplus.o
  AR      drivers/media/usb/cx231xx/built-in.a
  CC      drivers/media/platform/qcom/venus/venc_ctrls.o
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.o
  CC      drivers/media/usb/go7007/snd-go7007.o
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_util.o
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.o
  CC      drivers/media/platform/qcom/camss/camss-video.o
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.o
  CC      drivers/media/usb/go7007/go7007-usb.o
  AR      drivers/media/usb/em28xx/built-in.a
  CC      drivers/media/usb/gspca/stk014.o
  AR      drivers/media/platform/qcom/venus/built-in.a
  CC      drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_scp.o
  CC      drivers/media/usb/as102/as102_drv.o
  CC      drivers/media/usb/gspca/stk1135.o
  CC      drivers/media/usb/gspca/stv0680.o
  CC      drivers/media/usb/as102/as102_fw.o
  CC      drivers/media/usb/as102/as10x_cmd.o
  AR      drivers/media/platform/qcom/camss/built-in.a
  CC      drivers/media/usb/as102/as10x_cmd_stream.o
  CC      drivers/media/usb/as102/as102_usb_drv.o
  CC      drivers/media/usb/as102/as10x_cmd_cfg.o
  AR      drivers/media/platform/mtk-vcodec/built-in.a
  AR      drivers/media/platform/built-in.a
  CC      drivers/media/usb/gspca/t613.o
  CC      drivers/media/usb/go7007/s2250-board.o
  CC      drivers/media/usb/gspca/topro.o
  CC      drivers/media/usb/gspca/touptek.o
  CC      drivers/media/usb/gspca/tv8532.o
  CC      drivers/media/usb/gspca/vc032x.o
  CC      drivers/media/usb/gspca/vicam.o
  CC      drivers/media/usb/gspca/xirlink_cit.o
  AR      drivers/media/usb/as102/built-in.a
  CC      drivers/media/usb/gspca/zc3xx.o
  AR      drivers/media/usb/go7007/built-in.a
  CC      drivers/media/usb/gspca/m5602/m5602_core.o
  CC      drivers/media/usb/gspca/stv06xx/stv06xx.o
  CC      drivers/media/usb/gspca/stv06xx/stv06xx_vv6410.o
  CC      drivers/media/usb/gspca/gl860/gl860.o
  CC      drivers/media/usb/gspca/gl860/gl860-mi1320.o
  CC      drivers/media/usb/gspca/gl860/gl860-ov2640.o
  CC      drivers/media/usb/gspca/gl860/gl860-ov9655.o
  CC      drivers/media/usb/gspca/gl860/gl860-mi2020.o
  CC      drivers/media/usb/gspca/stv06xx/stv06xx_hdcs.o
  CC      drivers/media/usb/gspca/stv06xx/stv06xx_pb0100.o
  CC      drivers/media/usb/gspca/m5602/m5602_ov9650.o
  CC      drivers/media/usb/gspca/m5602/m5602_ov7660.o
  CC      drivers/media/usb/gspca/m5602/m5602_mt9m111.o
  CC      drivers/media/usb/gspca/m5602/m5602_po1030.o
  CC      drivers/media/usb/gspca/m5602/m5602_s5k83a.o
  CC      drivers/media/usb/gspca/m5602/m5602_s5k4aa.o
  AR      drivers/media/usb/gspca/gl860/built-in.a
  CC      drivers/media/usb/gspca/stv06xx/stv06xx_st6422.o
  AR      drivers/media/usb/gspca/m5602/built-in.a
  AR      drivers/media/usb/gspca/stv06xx/built-in.a
  AR      drivers/media/usb/gspca/built-in.a
  AR      drivers/media/usb/built-in.a
make[1]: *** [scripts/Makefile.build:549: drivers/media] Error 2
make: *** [Makefile:1846: drivers] Error 2
Build step 'Execute shell' marked build as failure
