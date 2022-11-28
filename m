Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3799B63A880
	for <lists+linux-media@lfdr.de>; Mon, 28 Nov 2022 13:34:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230040AbiK1Mez (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Nov 2022 07:34:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbiK1Mey (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Nov 2022 07:34:54 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4A0F1A05F
        for <linux-media@vger.kernel.org>; Mon, 28 Nov 2022 04:34:51 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 90FDFB80D88
        for <linux-media@vger.kernel.org>; Mon, 28 Nov 2022 12:34:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C331C433D6;
        Mon, 28 Nov 2022 12:34:47 +0000 (UTC)
Message-ID: <a2d90ef2-3219-b2e8-15de-fa1da9d031d5@xs4all.nl>
Date:   Mon, 28 Nov 2022 13:34:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Smitha T Murthy <smitha.t@samsung.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.2 v2] Various fixes and enhancements
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Changes since v1:

Dropped two patches:

This will go in through a PR from Jason:

Jason A. Donenfeld (1):
      media: stv0288: use explicitly signed char

This actually needed more work, and I missed that:

wangjianli (1):
      platform/renesas: fix repeated words in comments

Regards,

	Hans

The following changes since commit 3ab848bea7790583674a0e08eb5f8c1553d07751:

  media: dt-bindings: s5p-mfc: Add new compatible string for Exynos3250 SoC (2022-11-25 11:33:17 +0000)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.2i

for you to fetch changes up to aaf6b00841d3507cc1020117142a976fddfca71a:

  media: s5c73m3: Switch to GPIO descriptors (2022-11-28 13:30:03 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Aakarsh Jain (1):
      media: s5p-mfc: Add variant data for MFC v7 hardware for Exynos 3250 SoC

Adam Borowski (1):
      media: ipu3-cio2: make the bridge depend on i2c

Chen-Yu Tsai (1):
      media: dt-bindings: allwinner: h6-vpu-g2: Add IOMMU reference property

Christophe JAILLET (4):
      media: pt3: Use dma_set_mask_and_coherent() and simplify code
      media: ths7303: Fix the include guard
      headers: Remove some left-over license text in include/uapi/linux/dvb/
      headers: Remove some left-over license text in include/uapi/linux/v4l2-*

Colin Ian King (1):
      media: i2c: isl7998x: make const array isl7998x_video_in_chan_map static

Dmitry Torokhov (2):
      media: i2c: s5k6a3: switch to using gpiod API
      media: i2c: s5k5baf: switch to using gpiod API

Geert Uytterhoeven (1):
      media: staging: stkwebcam: Restore MEDIA_{USB,CAMERA}_SUPPORT dependencies

Gustavo A. R. Silva (1):
      media: usb: pwc-uncompress: Use flex array destination for memcpy()

Hans de Goede (1):
      media: MAINTAINERS: Add Hans de Goede as staging/atomisp maintainer

Jiasheng Jiang (2):
      media: coda: Add check for dcoda_iram_alloc
      media: coda: Add check for kmalloc

Lecopzer Chen (1):
      media: Kconfig: Make DVB_CORE=m possible when MEDIA_SUPPORT=y

Liang He (1):
      media: c8sectpfe: Add of_node_put() when breaking out of loop

Linus Walleij (3):
      media: s5k4ecgx: Switch to GPIO descriptors
      media: s5k4ecgx: Delete driver
      media: s5c73m3: Switch to GPIO descriptors

Lukas Bulwahn (1):
      media: imx: remove code for non-existing config IMX_GPT_ICAP

Maíra Canal (1):
      dt-bindings: media: s5c73m3: Fix reset-gpio descriptor

Michael Riesch (2):
      dt-bindings: media: video-interfaces: add support for dual edge sampling
      media: v4l2-mediabus: add support for dual edge sampling

Moses Christopher Bollavarapu (1):
      drivers: staging: media: omap4iss: Use BIT macro instead of left shifting

Philipp Zabel (1):
      media: imx: Use get_mbus_config instead of parsing upstream DT endpoints

Shigeru Yoshida (1):
      media: si470x: Fix use-after-free in si470x_int_in_callback()

Smitha T Murthy (3):
      media: s5p-mfc: Fix in register read and write for H264
      media: s5p-mfc: Clear workbit to handle error condition
      media: s5p-mfc: Fix to handle reference queue during finishing

Yang Yingliang (1):
      media: Switch to use dev_err_probe() helper

 Documentation/devicetree/bindings/media/allwinner,sun50i-h6-vpu-g2.yaml |    5 +
 Documentation/devicetree/bindings/media/samsung-s5c73m3.txt             |    2 +-
 Documentation/devicetree/bindings/media/video-interfaces.yaml           |    5 +-
 MAINTAINERS                                                             |    1 +
 drivers/media/Kconfig                                                   |    2 +-
 drivers/media/cec/platform/stm32/stm32-cec.c                            |    9 +-
 drivers/media/i2c/Kconfig                                               |   10 -
 drivers/media/i2c/Makefile                                              |    1 -
 drivers/media/i2c/ad5820.c                                              |   18 +-
 drivers/media/i2c/imx274.c                                              |    5 +-
 drivers/media/i2c/isl7998x.c                                            |    2 +-
 drivers/media/i2c/s5c73m3/s5c73m3-core.c                                |  107 +---
 drivers/media/i2c/s5c73m3/s5c73m3-ctrls.c                               |    1 -
 drivers/media/i2c/s5c73m3/s5c73m3.h                                     |   10 +-
 drivers/media/i2c/s5k4ecgx.c                                            | 1031 ----------------------------------
 drivers/media/i2c/s5k5baf.c                                             |   64 +--
 drivers/media/i2c/s5k6a3.c                                              |   30 +-
 drivers/media/i2c/tc358743.c                                            |    9 +-
 drivers/media/pci/intel/ipu3/Kconfig                                    |    1 +
 drivers/media/pci/pt3/pt3.c                                             |   16 +-
 drivers/media/platform/chips-media/coda-bit.c                           |   14 +-
 drivers/media/platform/mediatek/mdp/mtk_mdp_comp.c                      |    5 +-
 drivers/media/platform/samsung/exynos4-is/media-dev.c                   |    4 +-
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c                        |   17 +-
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc_ctrl.c                   |    4 +-
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc_enc.c                    |   12 +-
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c                 |   14 +-
 drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c                |    1 +
 drivers/media/platform/st/stm32/stm32-dcmi.c                            |   27 +-
 drivers/media/platform/ti/omap3isp/isp.c                                |    3 +-
 drivers/media/platform/xilinx/xilinx-csi2rxss.c                         |    8 +-
 drivers/media/radio/si470x/radio-si470x-usb.c                           |    4 +-
 drivers/media/rc/gpio-ir-recv.c                                         |   10 +-
 drivers/media/rc/gpio-ir-tx.c                                           |    9 +-
 drivers/media/rc/ir-rx51.c                                              |    9 +-
 drivers/media/usb/pwc/pwc-uncompress.c                                  |    2 +-
 drivers/media/usb/uvc/uvc_driver.c                                      |    9 +-
 drivers/media/v4l2-core/v4l2-fwnode.c                                   |   23 +-
 drivers/staging/media/deprecated/stkwebcam/Kconfig                      |    2 +-
 drivers/staging/media/imx/TODO                                          |   12 -
 drivers/staging/media/imx/imx-media-csi.c                               |  135 +++--
 drivers/staging/media/imx/imx-media-fim.c                               |   57 +-
 drivers/staging/media/imx/imx-media-utils.c                             |   33 --
 drivers/staging/media/imx/imx-media.h                                   |    1 -
 drivers/staging/media/omap4iss/iss_video.h                              |   18 +-
 include/media/i2c/s5c73m3.h                                             |   15 -
 include/media/i2c/s5k4ecgx.h                                            |   33 --
 include/media/i2c/ths7303.h                                             |    4 +-
 include/media/v4l2-mediabus.h                                           |   17 +-
 include/uapi/linux/dvb/audio.h                                          |   15 -
 include/uapi/linux/dvb/ca.h                                             |   15 -
 include/uapi/linux/dvb/dmx.h                                            |   15 -
 include/uapi/linux/dvb/frontend.h                                       |   15 -
 include/uapi/linux/dvb/net.h                                            |   15 -
 include/uapi/linux/dvb/osd.h                                            |   15 -
 include/uapi/linux/dvb/version.h                                        |   15 -
 include/uapi/linux/dvb/video.h                                          |   15 -
 include/uapi/linux/v4l2-common.h                                        |   39 --
 include/uapi/linux/v4l2-controls.h                                      |   38 --
 include/uapi/linux/v4l2-dv-timings.h                                    |    9 -
 include/uapi/linux/v4l2-mediabus.h                                      |    4 -
 include/uapi/linux/v4l2-subdev.h                                        |   13 -
 62 files changed, 264 insertions(+), 1790 deletions(-)
 delete mode 100644 drivers/media/i2c/s5k4ecgx.c
 delete mode 100644 include/media/i2c/s5k4ecgx.h
