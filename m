Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F99E67E2D7
	for <lists+linux-media@lfdr.de>; Fri, 27 Jan 2023 12:13:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232741AbjA0LNY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Jan 2023 06:13:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232933AbjA0LNX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Jan 2023 06:13:23 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68A281040D
        for <linux-media@vger.kernel.org>; Fri, 27 Jan 2023 03:13:21 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0312F61AC0
        for <linux-media@vger.kernel.org>; Fri, 27 Jan 2023 11:13:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23BC9C433D2
        for <linux-media@vger.kernel.org>; Fri, 27 Jan 2023 11:13:19 +0000 (UTC)
Message-ID: <f8051b0e-55f2-a7d0-6d20-9d6e5fe9d082@xs4all.nl>
Date:   Fri, 27 Jan 2023 12:13:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.3] Various fixes and enhancements
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

The following changes since commit 7120d6bfd6d0b26b49958f429701996f2d3e2c2a:

  media: tm6000: remove deprecated driver (2023-01-22 09:57:19 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.3e

for you to fetch changes up to 27e5b51fcaac53096826f6a04af5f8a6b6d52ca3:

  drivers/media/v4l2-core/v4l2-h264 : add detection of null pointers (2023-01-27 11:50:40 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Arnd Bergmann (2):
      media: camss: csiphy-3ph: avoid undefined behavior
      media: platform: mtk-mdp3: fix Kconfig dependencies

Chen-Yu Tsai (1):
      media: hantro: Use core-generated bus_info value

Colin Ian King (2):
      media: vidtv: make const array DURATION static
      media: rkisp1: make a few const arrays static

Deepak R Varma (1):
      staging: media: imx: change imx_media_fim_set_stream() to return void

Dmitry Torokhov (1):
      media: i2c: s5c73m3: remove support for platform data

Dong Chuanjian (1):
      drivers/media/v4l2-core/v4l2-h264 : add detection of null pointers

Eugen Hristev (1):
      media: microchip: microchip-isc: replace v4l2_{dbg|info|err} with dev-*

Hans Verkuil (4):
      media: videobuf2-core: drop obsolete sanity check in __vb2_queue_free()
      media: s5p-mfc: use vb2_is_streaming()
      media: v4l2-mem2mem: use vb2_is_streaming()
      media: go7007: don't modify q->streaming

Jammy Huang (2):
      media: docs: aspeed-video: Update reference
      media: docs: pixfmt-reserved: Update reference

Krzysztof Kozlowski (2):
      docs: admin-guide: media: align HDMI CEC node names with dtschema
      media: exynos4-is: drop unused pctrl field and headers

Ming Qian (5):
      media: amphion: remove redundant check of colorspace in venc_s_fmt
      media: v4l2-jpeg: correct the skip count in jpeg_parse_app14_data
      media: v4l2-jpeg: ignore the unknown APP14 marker
      media: imx-jpeg: Apply clk_bulk api instead of operating specific clk
      media: amphion: correct the unspecified color space

Nicolas Dufresne (1):
      hantro: Fix JPEG encoder ENUM_FRMSIZE on RK3399

Oleg Verych (1):
      media: sun4i-csi: Fix 'Unbalanced pm_runtime_enable!'

Qiheng Lin (1):
      media: platform: mtk-mdp3: Fix return value check in mdp_probe()

Uwe Kleine-König (3):
      media: ti/davinci: vpbe_osd: Drop empty platform remove function
      media: ti/davinci: vpbe_venc: Drop empty platform remove function
      media: chips-media/imx-vdoa: Drop empty platform remove function

Yang Li (1):
      media: rzg2l-cru: Remove unneeded semicolon

Yunfei Dong (1):
      media: mediatek: vcodec: Using pm_runtime_put instead of pm_runtime_put_sync

Zhou jie (1):
      radio/wl128x: remove unnecessary (void*) conversions

 Documentation/admin-guide/media/cec.rst                    |   4 +--
 Documentation/userspace-api/media/drivers/aspeed-video.rst |   2 +-
 Documentation/userspace-api/media/v4l/pixfmt-reserved.rst  |   2 +-
 drivers/media/common/videobuf2/videobuf2-core.c            |  25 ++-----------
 drivers/media/i2c/s5c73m3/s5c73m3-core.c                   |  20 +++--------
 drivers/media/i2c/s5c73m3/s5c73m3-ctrls.c                  |   1 -
 drivers/media/i2c/s5c73m3/s5c73m3.h                        |   1 -
 drivers/media/platform/amphion/venc.c                      |  18 +++-------
 drivers/media/platform/amphion/vpu_color.c                 |   6 ++--
 drivers/media/platform/chips-media/imx-vdoa.c              |   6 ----
 drivers/media/platform/mediatek/mdp3/Kconfig               |   7 ++--
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c       |   7 ++--
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_pm.c |   6 ++--
 drivers/media/platform/microchip/microchip-isc-base.c      | 109 +++++++++++++++++++++++++--------------------------------
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c             |  35 +++++-------------
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h             |   4 +--
 drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c   |   3 +-
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c      |   2 +-
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c     |   2 +-
 drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c    |  15 ++++----
 drivers/media/platform/samsung/exynos4-is/fimc-is.h        |   3 --
 drivers/media/platform/samsung/exynos4-is/media-dev.h      |   1 -
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c           |   4 +--
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c         |   1 +
 drivers/media/platform/ti/davinci/vpbe_osd.c               |   6 ----
 drivers/media/platform/ti/davinci/vpbe_venc.c              |   6 ----
 drivers/media/platform/verisilicon/hantro_drv.c            |   2 --
 drivers/media/platform/verisilicon/hantro_v4l2.c           |   9 ++---
 drivers/media/radio/wl128x/fmdrv_common.c                  |   2 +-
 drivers/media/test-drivers/vidtv/vidtv_psi.c               |   2 +-
 drivers/media/usb/go7007/go7007-v4l2.c                     |   6 +---
 drivers/media/v4l2-core/v4l2-h264.c                        |   4 +++
 drivers/media/v4l2-core/v4l2-jpeg.c                        |   4 +--
 drivers/media/v4l2-core/v4l2-mem2mem.c                     |   4 +--
 drivers/staging/media/imx/imx-media-csi.c                  |   7 ++--
 drivers/staging/media/imx/imx-media-fim.c                  |   8 ++---
 drivers/staging/media/imx/imx-media.h                      |   6 ++--
 include/media/i2c/s5c73m3.h                                |  41 ----------------------
 38 files changed, 127 insertions(+), 264 deletions(-)
 delete mode 100644 include/media/i2c/s5c73m3.h
