Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 422465449E5
	for <lists+linux-media@lfdr.de>; Thu,  9 Jun 2022 13:21:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236987AbiFILVq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jun 2022 07:21:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231712AbiFILVp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Jun 2022 07:21:45 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01F3D25C5
        for <linux-media@vger.kernel.org>; Thu,  9 Jun 2022 04:21:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9B325B82C7E
        for <linux-media@vger.kernel.org>; Thu,  9 Jun 2022 11:21:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E45EC3411B
        for <linux-media@vger.kernel.org>; Thu,  9 Jun 2022 11:21:39 +0000 (UTC)
Message-ID: <29f3db0b-ee7d-c4ba-dec7-95b693b0e5ac@xs4all.nl>
Date:   Thu, 9 Jun 2022 13:21:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.20] Various fixes/enhancements
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.20c

for you to fetch changes up to 7c7a740032d192fb42b94a02912e1322286d5339:

  pvrusb2: fix memory leak in pvr_probe (2022-06-09 12:33:34 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Benjamin Gaignard (2):
      media: hantro: Be more accurate on pixel formats step_width constraints
      media: Hantro: Correct G2 init qp field

Chengguang Xu (1):
      media: platform: fix missing/incorrect resource cleanup in error case

Dongliang Mu (1):
      pvrusb2: fix memory leak in pvr_probe

Eugen Hristev (1):
      media: atmel: atmel-isc-base: move cropping settings outside start_dma

Haowen Bai (1):
      media: mediatek: vcodec: Use kmemdup rather than kmalloc/memcpy

Julia Lawall (4):
      media: platform: exynos-gsc: fix typo in comment
      media: mediatek: vcodec: fix typo in comment
      media: platform: exynos4-is: fix typos in comments
      media: staging: atomisp: fix typo in comment

Justin Green (1):
      mediatek/vcodec: Enable incoherent buffer allocation

Kees Cook (1):
      media: amphion: Replace zero-length array with flexible-array member

Linus Walleij (1):
      media: platform: omap: Pass a pointer to virt_to_page()

Ming Qian (6):
      media: amphion: vdec check format in enum_fmt
      media: amphion: return error if format is unsupported by vpu
      media: imx-jpeg: Correct some definition according specification
      media: imx-jpeg: Leave a blank space before the configuration data
      media: imx-jpeg: Align upwards buffer size
      media: imx-jpeg: Implement drain using v4l2-mem2mem helpers

Niklas Söderlund (1):
      media: rcar-vin: Fix channel routing for Ebisu

Oliver Neukum (1):
      airspy: respect the DMA coherency rules

Scott Chao (1):
      media: platform: cros-ec: Add moli to the match table

Vladimir Zapolskiy (2):
      media: camss: Allocate camss struct as a managed device resource
      media: camss: Move and unexport functions specific to ISPIF

Zheyu Ma (2):
      media: tw5864: Convert to use managed functions pcim* and devm*
      media: tw686x: Register the irq at the end of probe

Ziyang Xuan (1):
      media: amphion: delete unnecessary NULL check

kyrie wu (2):
      media: media: jpegenc: add mediatek,mt8186-jpgenc compatible
      media: media: jpegenc: set bit mask for jpegenc

 Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml |   6 ++
 drivers/media/cec/platform/cros-ec/cros-ec-cec.c                   |   2 +
 drivers/media/pci/tw5864/tw5864-core.c                             |  30 ++------
 drivers/media/pci/tw686x/tw686x-core.c                             |  18 +++--
 drivers/media/platform/amphion/vdec.c                              |   3 +-
 drivers/media/platform/amphion/venc.c                              |   3 +-
 drivers/media/platform/amphion/vpu_cmds.c                          |   3 +-
 drivers/media/platform/amphion/vpu_dbg.c                           |   2 +-
 drivers/media/platform/amphion/vpu_malone.c                        |  18 +++++
 drivers/media/platform/amphion/vpu_malone.h                        |   1 +
 drivers/media/platform/amphion/vpu_rpc.c                           |   2 +-
 drivers/media/platform/amphion/vpu_v4l2.c                          |   6 +-
 drivers/media/platform/atmel/atmel-isc-base.c                      |  14 ++--
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c               |   3 +
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c            |   2 +
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h            |   2 +-
 drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c  |   3 +-
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h                  |   8 +--
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c                     | 252 +++++++++++++++++++++++++++++++------------------------------------
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h                     |   2 -
 drivers/media/platform/qcom/camss/camss-ispif.c                    |  39 ++++++++++-
 drivers/media/platform/qcom/camss/camss-vfe.c                      |  34 ---------
 drivers/media/platform/qcom/camss/camss-vfe.h                      |   3 -
 drivers/media/platform/qcom/camss/camss.c                          |  33 +++------
 drivers/media/platform/renesas/rcar-vin/rcar-core.c                |   2 +-
 drivers/media/platform/samsung/exynos-gsc/gsc-core.h               |   2 +-
 drivers/media/platform/samsung/exynos4-is/fimc-is-errno.h          |   2 +-
 drivers/media/platform/samsung/exynos4-is/mipi-csis.c              |   2 +-
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc_pm.c                |   3 +-
 drivers/media/platform/ti/omap/omap_voutlib.c                      |   4 +-
 drivers/media/usb/airspy/airspy.c                                  |  17 ++++-
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c                            |   1 +
 drivers/staging/media/atomisp/i2c/ov5693/ov5693.h                  |   2 +-
 drivers/staging/media/hantro/hantro_drv.c                          |  12 ++--
 drivers/staging/media/hantro/hantro_g2_regs.h                      |   2 +-
 drivers/staging/media/hantro/hantro_hevc.c                         |  30 ++++++++
 drivers/staging/media/hantro/hantro_hw.h                           |  14 ++++
 drivers/staging/media/hantro/hantro_v4l2.c                         |   2 +-
 drivers/staging/media/hantro/imx8m_vpu_hw.c                        |  80 ++++++++++++++-------
 drivers/staging/media/hantro/rockchip_vpu_hw.c                     | 104 ++++++++++++++++++----------
 drivers/staging/media/hantro/sama5d4_vdec_hw.c                     |  40 +++++++----
 drivers/staging/media/hantro/sunxi_vpu_hw.c                        |  24 +++++--
 42 files changed, 485 insertions(+), 347 deletions(-)
