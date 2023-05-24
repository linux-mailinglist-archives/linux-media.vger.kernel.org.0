Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29BCA70F4A1
	for <lists+linux-media@lfdr.de>; Wed, 24 May 2023 12:59:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229729AbjEXK7G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 May 2023 06:59:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbjEXK7F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 May 2023 06:59:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AB0612F
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 03:59:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AD58561A90
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 10:59:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDB56C433D2;
        Wed, 24 May 2023 10:58:59 +0000 (UTC)
Message-ID: <956fce57-b059-d9ea-1bc8-c935edf2338e@xs4all.nl>
Date:   Wed, 24 May 2023 12:58:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Ming Qian <ming.qian@nxp.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.5] Various fixes and enhancements
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Mauro, I plan to push this to staging on Friday if there are no issues.

Regards,

	Hans

The following changes since commit 8bc27fa5d7763d376a992a1638475987ed4807e7:

  docs: uapi: media: ignore new DVB-S2X FEC values (2023-05-15 06:46:17 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.5d

for you to fetch changes up to 51be10ecead5668d05e9891f987a9d4b9c609c2d:

  media: mediatek: vcodec: support stateless hevc decoder (2023-05-24 12:52:00 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Alexander Stein (1):
      media: staging: media: imx6-mipi-csi2: Add log_status core callback

Andrey Konovalov (1):
      media: camss: set VFE bpl_alignment to 16 for sdm845 and sm8250

Angel Alberto Carretero (1):
      media: imx: utils: Enclose IMX_BUS_FMTS macro in parenthesis

Atin Bainada (1):
      media: av7110: Remove unnecessary (void*) conversions

Benjamin Gaignard (2):
      media: verisilicon: Simplify error handling in tile_buffer_reallocate()
      media: uapi: HEVC: Add num_delta_pocs_of_ref_rps_idx field

Bryan O'Donoghue (1):
      media: MAINTAINERS: Add myself as Venus reviewer

Christophe JAILLET (1):
      media: common: saa7146: Avoid a leak in vmalloc_to_sg()

Daniel Lundberg Pedersen (2):
      media: videodev2.h: Fix p_s32 and p_s64 pointer types
      media: docs: vidioc-g-ext-ctrls.rst: Update p_s32 and p_s64 types

Daniil Dulov (1):
      media: usb: Check az6007_read() return value

Deepak R Varma (1):
      media: platform: mtk-mdp3: release node reference before returning

Duoming Zhou (1):
      media: usb: siano: Fix warning due to null work_func_t function pointer

Fei Shao (1):
      media: mediatek: vcodec: mtk_vcodec_dec_hw: Use devm_pm_runtime_enable()

Geert Uytterhoeven (1):
      media: Add common header file with JPEG marker definitions

Jiapeng Chong (1):
      media: nxp: remove unneeded semicolon

Lad Prabhakar (1):
      media: platform: rzg2l-cru: rzg2l-csi2: Enclose the macro in parentheses

Lukas Bulwahn (1):
      media: stk1160: Simplify the build config definition

Marek Vasut (1):
      media: videodev2.h: Fix struct v4l2_input tuner index comment

Max Staudt (1):
      media: vivid: Extend FPS rates offered by simulated webcam

Michael Tretter (1):
      media: rockchip: rga: use v4l2_m2m_buf_copy_metadata

Ming Qian (3):
      media: amphion: drop repeated codec data for vc1l format
      media: amphion: drop repeated codec data for vc1g format
      media: amphion: initiate a drain of the capture queue in dynamic resolution change

Nícolas F. R. A. Prado (1):
      Revert "media: mediatek: vcodec: Fix bitstream crop information error"

Randy Dunlap (1):
      media: mtk-jpeg: move data/code inside CONFIG_OF blocks

Su Hui (3):
      media: usb: remove unnecessary (void*) conversions
      media: platform: Remove unnecessary (void*) conversions
      media: pci: remove unnecessary (void*) conversions

Uwe Kleine-König (1):
      media: Switch i2c drivers back to use .probe()

Yunfei Dong (2):
      media: v4l2-mem2mem: add lock to protect parameter num_rdy
      media: mediatek: vcodec: support stateless hevc decoder

 Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst  |    7 +
 Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst         |    4 +-
 MAINTAINERS                                                          |    1 +
 drivers/media/cec/i2c/ch7322.c                                       |    2 +-
 drivers/media/common/saa7146/saa7146_core.c                          |    6 +-
 drivers/media/dvb-frontends/a8293.c                                  |    2 +-
 drivers/media/dvb-frontends/af9013.c                                 |    2 +-
 drivers/media/dvb-frontends/af9033.c                                 |    2 +-
 drivers/media/dvb-frontends/au8522_decoder.c                         |    2 +-
 drivers/media/dvb-frontends/cxd2099.c                                |    2 +-
 drivers/media/dvb-frontends/cxd2820r_core.c                          |    2 +-
 drivers/media/dvb-frontends/dvb-pll.c                                |    2 +-
 drivers/media/dvb-frontends/helene.c                                 |    2 +-
 drivers/media/dvb-frontends/lgdt3306a.c                              |    2 +-
 drivers/media/dvb-frontends/lgdt330x.c                               |    2 +-
 drivers/media/dvb-frontends/m88ds3103.c                              |    2 +-
 drivers/media/dvb-frontends/mn88443x.c                               |    2 +-
 drivers/media/dvb-frontends/mn88472.c                                |    2 +-
 drivers/media/dvb-frontends/mn88473.c                                |    2 +-
 drivers/media/dvb-frontends/mxl692.c                                 |    2 +-
 drivers/media/dvb-frontends/rtl2830.c                                |    2 +-
 drivers/media/dvb-frontends/rtl2832.c                                |    2 +-
 drivers/media/dvb-frontends/si2165.c                                 |    2 +-
 drivers/media/dvb-frontends/si2168.c                                 |    2 +-
 drivers/media/dvb-frontends/sp2.c                                    |    2 +-
 drivers/media/dvb-frontends/stv090x.c                                |    2 +-
 drivers/media/dvb-frontends/stv6110x.c                               |    2 +-
 drivers/media/dvb-frontends/tc90522.c                                |    2 +-
 drivers/media/dvb-frontends/tda10071.c                               |    2 +-
 drivers/media/dvb-frontends/ts2020.c                                 |    2 +-
 drivers/media/i2c/ad5820.c                                           |    2 +-
 drivers/media/i2c/adp1653.c                                          |    2 +-
 drivers/media/i2c/adv7170.c                                          |    2 +-
 drivers/media/i2c/adv7175.c                                          |    2 +-
 drivers/media/i2c/adv7180.c                                          |    2 +-
 drivers/media/i2c/adv7183.c                                          |    2 +-
 drivers/media/i2c/adv7343.c                                          |    2 +-
 drivers/media/i2c/adv7393.c                                          |    2 +-
 drivers/media/i2c/adv748x/adv748x-core.c                             |    2 +-
 drivers/media/i2c/adv7511-v4l2.c                                     |    2 +-
 drivers/media/i2c/adv7604.c                                          |    2 +-
 drivers/media/i2c/adv7842.c                                          |    2 +-
 drivers/media/i2c/ak7375.c                                           |    2 +-
 drivers/media/i2c/ak881x.c                                           |    2 +-
 drivers/media/i2c/ar0521.c                                           |    2 +-
 drivers/media/i2c/bt819.c                                            |    2 +-
 drivers/media/i2c/bt856.c                                            |    2 +-
 drivers/media/i2c/bt866.c                                            |    2 +-
 drivers/media/i2c/ccs/ccs-core.c                                     |    2 +-
 drivers/media/i2c/cs3308.c                                           |    2 +-
 drivers/media/i2c/cs5345.c                                           |    2 +-
 drivers/media/i2c/cs53l32a.c                                         |    2 +-
 drivers/media/i2c/cx25840/cx25840-core.c                             |    2 +-
 drivers/media/i2c/dw9714.c                                           |    2 +-
 drivers/media/i2c/dw9768.c                                           |    2 +-
 drivers/media/i2c/dw9807-vcm.c                                       |    2 +-
 drivers/media/i2c/et8ek8/et8ek8_driver.c                             |    2 +-
 drivers/media/i2c/hi556.c                                            |    2 +-
 drivers/media/i2c/hi846.c                                            |    2 +-
 drivers/media/i2c/hi847.c                                            |    2 +-
 drivers/media/i2c/imx208.c                                           |    2 +-
 drivers/media/i2c/imx214.c                                           |    2 +-
 drivers/media/i2c/imx219.c                                           |    2 +-
 drivers/media/i2c/imx258.c                                           |    2 +-
 drivers/media/i2c/imx274.c                                           |    2 +-
 drivers/media/i2c/imx290.c                                           |    4 +-
 drivers/media/i2c/imx296.c                                           |    2 +-
 drivers/media/i2c/imx319.c                                           |    2 +-
 drivers/media/i2c/imx334.c                                           |    2 +-
 drivers/media/i2c/imx335.c                                           |    2 +-
 drivers/media/i2c/imx355.c                                           |    2 +-
 drivers/media/i2c/imx412.c                                           |    2 +-
 drivers/media/i2c/imx415.c                                           |    2 +-
 drivers/media/i2c/ir-kbd-i2c.c                                       |    2 +-
 drivers/media/i2c/isl7998x.c                                         |    2 +-
 drivers/media/i2c/ks0127.c                                           |    2 +-
 drivers/media/i2c/lm3560.c                                           |    2 +-
 drivers/media/i2c/lm3646.c                                           |    2 +-
 drivers/media/i2c/m52790.c                                           |    2 +-
 drivers/media/i2c/max2175.c                                          |    2 +-
 drivers/media/i2c/max9286.c                                          |    2 +-
 drivers/media/i2c/ml86v7667.c                                        |    2 +-
 drivers/media/i2c/msp3400-driver.c                                   |    2 +-
 drivers/media/i2c/mt9m001.c                                          |    2 +-
 drivers/media/i2c/mt9m111.c                                          |    2 +-
 drivers/media/i2c/mt9p031.c                                          |    2 +-
 drivers/media/i2c/mt9t112.c                                          |    2 +-
 drivers/media/i2c/mt9v011.c                                          |    2 +-
 drivers/media/i2c/mt9v032.c                                          |    2 +-
 drivers/media/i2c/mt9v111.c                                          |    2 +-
 drivers/media/i2c/og01a1b.c                                          |    2 +-
 drivers/media/i2c/ov02a10.c                                          |    4 +-
 drivers/media/i2c/ov08d10.c                                          |    2 +-
 drivers/media/i2c/ov08x40.c                                          |    2 +-
 drivers/media/i2c/ov13858.c                                          |    2 +-
 drivers/media/i2c/ov13b10.c                                          |    2 +-
 drivers/media/i2c/ov2640.c                                           |    2 +-
 drivers/media/i2c/ov2659.c                                           |    2 +-
 drivers/media/i2c/ov2680.c                                           |    2 +-
 drivers/media/i2c/ov2685.c                                           |    4 +-
 drivers/media/i2c/ov2740.c                                           |    2 +-
 drivers/media/i2c/ov4689.c                                           |    2 +-
 drivers/media/i2c/ov5640.c                                           |    2 +-
 drivers/media/i2c/ov5645.c                                           |    2 +-
 drivers/media/i2c/ov5647.c                                           |    2 +-
 drivers/media/i2c/ov5648.c                                           |    4 +-
 drivers/media/i2c/ov5670.c                                           |    2 +-
 drivers/media/i2c/ov5675.c                                           |    2 +-
 drivers/media/i2c/ov5693.c                                           |    2 +-
 drivers/media/i2c/ov5695.c                                           |    4 +-
 drivers/media/i2c/ov6650.c                                           |    2 +-
 drivers/media/i2c/ov7251.c                                           |    2 +-
 drivers/media/i2c/ov7640.c                                           |    2 +-
 drivers/media/i2c/ov7670.c                                           |    2 +-
 drivers/media/i2c/ov772x.c                                           |    2 +-
 drivers/media/i2c/ov7740.c                                           |    2 +-
 drivers/media/i2c/ov8856.c                                           |    2 +-
 drivers/media/i2c/ov8858.c                                           |    4 +-
 drivers/media/i2c/ov8865.c                                           |    4 +-
 drivers/media/i2c/ov9282.c                                           |    2 +-
 drivers/media/i2c/ov9640.c                                           |    2 +-
 drivers/media/i2c/ov9650.c                                           |    2 +-
 drivers/media/i2c/ov9734.c                                           |    2 +-
 drivers/media/i2c/rdacm20.c                                          |    2 +-
 drivers/media/i2c/rdacm21.c                                          |    2 +-
 drivers/media/i2c/rj54n1cb0c.c                                       |    2 +-
 drivers/media/i2c/s5c73m3/s5c73m3-core.c                             |    2 +-
 drivers/media/i2c/s5k5baf.c                                          |    2 +-
 drivers/media/i2c/s5k6a3.c                                           |    2 +-
 drivers/media/i2c/saa6588.c                                          |    2 +-
 drivers/media/i2c/saa6752hs.c                                        |    2 +-
 drivers/media/i2c/saa7110.c                                          |    2 +-
 drivers/media/i2c/saa7115.c                                          |    2 +-
 drivers/media/i2c/saa7127.c                                          |    2 +-
 drivers/media/i2c/saa717x.c                                          |    2 +-
 drivers/media/i2c/saa7185.c                                          |    2 +-
 drivers/media/i2c/sony-btf-mpx.c                                     |    2 +-
 drivers/media/i2c/st-mipid02.c                                       |    2 +-
 drivers/media/i2c/st-vgxy61.c                                        |    2 +-
 drivers/media/i2c/tc358743.c                                         |    2 +-
 drivers/media/i2c/tc358746.c                                         |    2 +-
 drivers/media/i2c/tda1997x.c                                         |    2 +-
 drivers/media/i2c/tda7432.c                                          |    2 +-
 drivers/media/i2c/tda9840.c                                          |    2 +-
 drivers/media/i2c/tea6415c.c                                         |    2 +-
 drivers/media/i2c/tea6420.c                                          |    2 +-
 drivers/media/i2c/ths7303.c                                          |    2 +-
 drivers/media/i2c/ths8200.c                                          |    2 +-
 drivers/media/i2c/tlv320aic23b.c                                     |    2 +-
 drivers/media/i2c/tvaudio.c                                          |    2 +-
 drivers/media/i2c/tvp514x.c                                          |    2 +-
 drivers/media/i2c/tvp5150.c                                          |    2 +-
 drivers/media/i2c/tvp7002.c                                          |    2 +-
 drivers/media/i2c/tw2804.c                                           |    2 +-
 drivers/media/i2c/tw9903.c                                           |    2 +-
 drivers/media/i2c/tw9906.c                                           |    2 +-
 drivers/media/i2c/tw9910.c                                           |    2 +-
 drivers/media/i2c/uda1342.c                                          |    2 +-
 drivers/media/i2c/upd64031a.c                                        |    2 +-
 drivers/media/i2c/upd64083.c                                         |    2 +-
 drivers/media/i2c/video-i2c.c                                        |    2 +-
 drivers/media/i2c/vp27smpx.c                                         |    2 +-
 drivers/media/i2c/vpx3220.c                                          |    2 +-
 drivers/media/i2c/wm8739.c                                           |    2 +-
 drivers/media/i2c/wm8775.c                                           |    2 +-
 drivers/media/pci/bt8xx/dst_ca.c                                     |    2 +-
 drivers/media/pci/cx18/cx18-dvb.c                                    |    4 +-
 drivers/media/pci/saa7164/saa7164-dvb.c                              |    4 +-
 drivers/media/pci/ttpci/budget-core.c                                |    4 +-
 drivers/media/platform/amphion/vdec.c                                |    7 +-
 drivers/media/platform/amphion/venc.c                                |    4 +-
 drivers/media/platform/amphion/vpu_malone.c                          |   12 +
 drivers/media/platform/amphion/vpu_v4l2.c                            |    5 +-
 drivers/media/platform/amphion/vpu_v4l2.h                            |    2 +-
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c                 |  828 ++++++++++++++--------------
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_parse.c            |   17 +-
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c                 |   15 +-
 drivers/media/platform/mediatek/vcodec/Makefile                      |    1 +
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c           |   26 +-
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c    |   59 +-
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h              |    1 +
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c              |    8 +-
 drivers/media/platform/mediatek/vcodec/vdec/vdec_hevc_req_multi_if.c | 1097 ++++++++++++++++++++++++++++++++++++++
 drivers/media/platform/mediatek/vcodec/vdec_drv_if.c                 |    4 +
 drivers/media/platform/mediatek/vcodec/vdec_drv_if.h                 |    1 +
 drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c              |    2 +-
 drivers/media/platform/qcom/camss/camss-vfe.c                        |    6 +-
 drivers/media/platform/renesas/rcar_jpu.c                            |   55 +-
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c                |    8 +-
 drivers/media/platform/rockchip/rga/rga.c                            |    5 +-
 drivers/media/platform/samsung/s5p-jpeg/jpeg-core.h                  |   12 +-
 drivers/media/platform/st/sti/hva/hva-h264.c                         |    8 +-
 drivers/media/platform/verisilicon/hantro_hevc.c                     |   23 +-
 drivers/media/radio/radio-tea5764.c                                  |    2 +-
 drivers/media/radio/saa7706h.c                                       |    2 +-
 drivers/media/radio/si470x/radio-si470x-i2c.c                        |    2 +-
 drivers/media/radio/si4713/si4713.c                                  |    2 +-
 drivers/media/radio/tef6862.c                                        |    2 +-
 drivers/media/test-drivers/vidtv/vidtv_demod.c                       |    2 +-
 drivers/media/test-drivers/vidtv/vidtv_tuner.c                       |    2 +-
 drivers/media/test-drivers/vivid/vivid-vid-cap.c                     |   49 +-
 drivers/media/tuners/e4000.c                                         |    2 +-
 drivers/media/tuners/fc2580.c                                        |    2 +-
 drivers/media/tuners/m88rs6000t.c                                    |    2 +-
 drivers/media/tuners/mt2060.c                                        |    2 +-
 drivers/media/tuners/mxl301rf.c                                      |    2 +-
 drivers/media/tuners/qm1d1b0004.c                                    |    2 +-
 drivers/media/tuners/qm1d1c0042.c                                    |    2 +-
 drivers/media/tuners/si2157.c                                        |    2 +-
 drivers/media/tuners/tda18212.c                                      |    2 +-
 drivers/media/tuners/tda18250.c                                      |    2 +-
 drivers/media/tuners/tua9001.c                                       |    2 +-
 drivers/media/usb/dvb-usb-v2/az6007.c                                |   19 +-
 drivers/media/usb/go7007/s2250-board.c                               |    2 +-
 drivers/media/usb/siano/smsusb.c                                     |    3 +-
 drivers/media/usb/stk1160/Kconfig                                    |   12 +-
 drivers/media/usb/ttusb-dec/ttusb_dec.c                              |    2 +-
 drivers/media/v4l2-core/tuner-core.c                                 |    2 +-
 drivers/staging/media/av7110/av7110_av.c                             |    4 +-
 drivers/staging/media/imx/imx-media-utils.c                          |    2 +-
 drivers/staging/media/imx/imx6-mipi-csi2.c                           |   45 ++
 include/media/jpeg.h                                                 |   20 +
 include/media/v4l2-mem2mem.h                                         |   18 +-
 include/uapi/linux/v4l2-controls.h                                   |    6 +-
 include/uapi/linux/videodev2.h                                       |    6 +-
 225 files changed, 2028 insertions(+), 772 deletions(-)
 create mode 100644 drivers/media/platform/mediatek/vcodec/vdec/vdec_hevc_req_multi_if.c
 create mode 100644 include/media/jpeg.h
