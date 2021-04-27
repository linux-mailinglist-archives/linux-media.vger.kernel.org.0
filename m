Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF63036C436
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:35:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238514AbhD0KgL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:36:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:56376 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239212AbhD0KfN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:35:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 205C761026
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 10:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519670;
        bh=fRK+IpN+lfrDCUJvXguVlRtwKKvl2RXMsI/cgeMOJRQ=;
        h=Date:From:To:Subject:From;
        b=g8Gq9pkPYBxeDmSjaDL0Elrh53c/aB5CbFvF6x2WtLVIuE54tq7UM51DEYOakhXRK
         Sje0kOZVQcO+oivGBaBC6R1E6JrKBGdxol4uz1SDIZdZcsF/Z2qWDk0P39xHtR847B
         708vMA4SIXSjLdHdx7LLpe9xymiF7EEevHc+U+GdwNEnj4+tg2WJIaS5c9HCWNi19m
         iFAgb3HvPaCijV2uNw4h9qn1QCVt4549szqygqHViSXNaOBG1GAUiBPxP7Y5PMx+eJ
         0xy0VUmnx/iOwvnPQ4CTJwgq8x7D0VXq3y2QBqj3uLTRXkjsMyQS2TRItjDbucQ281
         E9IM9bV8YU1bw==
Date:   Tue, 27 Apr 2021 12:34:26 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     linux-media@vger.kernel.org
Subject: Address some issues with PM runtime at media subsystem
Message-ID: <20210427123426.2f34d5bd@coco.lan>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 0b276e470a4d43e1365d3eb53c608a3d208cabd4:

  media: coda: fix macroblocks count control usage (2021-04-15 13:23:26 +0200)

are available in the Git repository at:

  git://linuxtv.org/mchehab/experimental.git tags/pm-runtime-v3

for you to fetch changes up to 230f22170db7fa57b49cff4570cef15bf11b2ad5:

  media: hantro: document the usage of pm_runtime_get_sync() (2021-04-27 12:23:25 +0200)

----------------------------------------------------------------
Address several issues with PM runtime

----------------------------------------------------------------
Mauro Carvalho Chehab (79):
      media: venus: fix PM runtime logic at venus_sys_error_handler()
      media: i2c: ccs-core: return the right error code at suspend
      media: i2c: mt9m001: don't resume at remove time
      media: i2c: ov7740: don't resume at remove time
      media: i2c: video-i2c: don't resume at remove time
      media: exynos-gsc: don't resume at remove time
      media: atmel: properly get pm_runtime
      media: marvel-ccic: fix some issues when getting pm_runtime
      media: mdk-mdp: fix pm_runtime_get_sync() usage count
      media: rcar_fdp1: fix pm_runtime_get_sync() usage count
      media: rga-buf: use pm_runtime_resume_and_get()
      media: renesas-ceu: Properly check for PM errors
      media: s5p: fix pm_runtime_get_sync() usage count
      media: am437x: fix pm_runtime_get_sync() usage count
      media: sh_vou: fix pm_runtime_get_sync() usage count
      media: mtk-vcodec: fix pm_runtime_get_sync() usage count
      media: s5p-jpeg: fix pm_runtime_get_sync() usage count
      media: delta-v4l2: fix pm_runtime_get_sync() usage count
      media: sun8i_rotate: fix pm_runtime_get_sync() usage count
      staging: media: rkvdec: fix pm_runtime_get_sync() usage count
      staging: media: atomisp_fops: use pm_runtime_resume_and_get()
      staging: media: imx7-mipi-csis: use pm_runtime_resume_and_get()
      staging: media: ipu3: use pm_runtime_resume_and_get()
      staging: media: cedrus_video: use pm_runtime_resume_and_get()
      staging: media: vde: use pm_runtime_resume_and_get()
      staging: media: csi: use pm_runtime_resume_and_get()
      staging: media: vi: use pm_runtime_resume_and_get()
      media: i2c: ak7375: use pm_runtime_resume_and_get()
      media: i2c: ccs-core: use pm_runtime_resume_and_get()
      media: i2c: dw9714: use pm_runtime_resume_and_get()
      media: i2c: dw9768: use pm_runtime_resume_and_get()
      media: i2c: dw9807-vcm: use pm_runtime_resume_and_get()
      media: i2c: hi556: use pm_runtime_resume_and_get()
      media: i2c: imx214: use pm_runtime_resume_and_get()
      media: i2c: imx219: use pm_runtime_resume_and_get()
      media: i2c: imx258: use pm_runtime_resume_and_get()
      media: i2c: imx274: use pm_runtime_resume_and_get()
      media: i2c: imx290: use pm_runtime_resume_and_get()
      media: i2c: imx319: use pm_runtime_resume_and_get()
      media: i2c: imx334: use pm_runtime_resume_and_get()
      media: i2c: imx355: use pm_runtime_resume_and_get()
      media: i2c: mt9m001: use pm_runtime_resume_and_get()
      media: i2c: ov02a10: use pm_runtime_resume_and_get()
      media: i2c: ov13858: use pm_runtime_resume_and_get()
      media: i2c: ov2659: use pm_runtime_resume_and_get()
      media: i2c: ov2685: use pm_runtime_resume_and_get()
      media: i2c: ov2740: use pm_runtime_resume_and_get()
      media: i2c: ov5647: use pm_runtime_resume_and_get()
      media: i2c: ov5648: use pm_runtime_resume_and_get()
      media: i2c: ov5670: use pm_runtime_resume_and_get()
      media: i2c: ov5675: use pm_runtime_resume_and_get()
      media: i2c: ov5695: use pm_runtime_resume_and_get()
      media: i2c: ov7740: use pm_runtime_resume_and_get()
      media: i2c: ov8856: use pm_runtime_resume_and_get()
      media: i2c: ov8865: use pm_runtime_resume_and_get()
      media: i2c: ov9734: use pm_runtime_resume_and_get()
      media: i2c: tvp5150: use pm_runtime_resume_and_get()
      media: i2c: video-i2c: use pm_runtime_resume_and_get()
      media: sti/hva: use pm_runtime_resume_and_get()
      media: ipu3: use pm_runtime_resume_and_get()
      media: coda: use pm_runtime_resume_and_get()
      media: exynos4-is: use pm_runtime_resume_and_get()
      media: exynos-gsc: use pm_runtime_resume_and_get()
      media: mtk-jpeg: use pm_runtime_resume_and_get()
      media: camss: use pm_runtime_resume_and_get()
      media: venus: use pm_runtime_resume_and_get()
      media: venus: vdec: use pm_runtime_resume_and_get()
      media: venus: venc: use pm_runtime_resume_and_get()
      media: rcar-fcp: use pm_runtime_resume_and_get()
      media: rkisp1: use pm_runtime_resume_and_get()
      media: s3c-camif: use pm_runtime_resume_and_get()
      media: s5p-mfc: use pm_runtime_resume_and_get()
      media: bdisp-v4l2: use pm_runtime_resume_and_get()
      media: stm32: use pm_runtime_resume_and_get()
      media: sunxi: use pm_runtime_resume_and_get()
      media: ti-vpe: use pm_runtime_resume_and_get()
      media: vsp1: use pm_runtime_resume_and_get()
      media: rcar-vin: use pm_runtime_resume_and_get()
      media: hantro: document the usage of pm_runtime_get_sync()

 drivers/media/cec/platform/s5p/s5p_cec.c           |  5 +++-
 drivers/media/i2c/ak7375.c                         | 10 +-------
 drivers/media/i2c/ccs/ccs-core.c                   | 18 ++++++--------
 drivers/media/i2c/dw9714.c                         | 10 +-------
 drivers/media/i2c/dw9768.c                         | 10 +-------
 drivers/media/i2c/dw9807-vcm.c                     | 10 +-------
 drivers/media/i2c/hi556.c                          |  3 +--
 drivers/media/i2c/imx214.c                         |  6 ++---
 drivers/media/i2c/imx219.c                         |  6 ++---
 drivers/media/i2c/imx258.c                         |  6 ++---
 drivers/media/i2c/imx274.c                         |  3 +--
 drivers/media/i2c/imx290.c                         |  6 ++---
 drivers/media/i2c/imx319.c                         |  6 ++---
 drivers/media/i2c/imx334.c                         |  5 ++--
 drivers/media/i2c/imx355.c                         |  6 ++---
 drivers/media/i2c/mt9m001.c                        |  8 +++----
 drivers/media/i2c/ov02a10.c                        |  6 ++---
 drivers/media/i2c/ov13858.c                        |  6 ++---
 drivers/media/i2c/ov2659.c                         |  6 ++---
 drivers/media/i2c/ov2685.c                         |  7 +++---
 drivers/media/i2c/ov2740.c                         |  6 ++---
 drivers/media/i2c/ov5647.c                         |  9 +++----
 drivers/media/i2c/ov5648.c                         |  6 ++---
 drivers/media/i2c/ov5670.c                         |  6 ++---
 drivers/media/i2c/ov5675.c                         |  3 +--
 drivers/media/i2c/ov5695.c                         |  6 ++---
 drivers/media/i2c/ov7740.c                         |  8 ++-----
 drivers/media/i2c/ov8856.c                         |  3 +--
 drivers/media/i2c/ov8865.c                         |  6 ++---
 drivers/media/i2c/ov9734.c                         |  3 +--
 drivers/media/i2c/tvp5150.c                        | 16 +++----------
 drivers/media/i2c/video-i2c.c                      | 14 ++++-------
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c      |  3 +--
 drivers/media/platform/am437x/am437x-vpfe.c        | 22 ++++++++++++-----
 drivers/media/platform/atmel/atmel-isc-base.c      | 27 +++++++++++++++------
 drivers/media/platform/atmel/atmel-isi.c           | 19 +++++++++++----
 drivers/media/platform/coda/coda-common.c          |  5 ++--
 drivers/media/platform/exynos-gsc/gsc-core.c       |  3 ---
 drivers/media/platform/exynos-gsc/gsc-m2m.c        |  2 +-
 drivers/media/platform/exynos4-is/fimc-capture.c   |  6 ++---
 drivers/media/platform/exynos4-is/fimc-is.c        |  4 ++--
 drivers/media/platform/exynos4-is/fimc-isp-video.c |  3 +--
 drivers/media/platform/exynos4-is/fimc-isp.c       |  7 +++---
 drivers/media/platform/exynos4-is/fimc-lite.c      |  5 ++--
 drivers/media/platform/exynos4-is/fimc-m2m.c       |  2 +-
 drivers/media/platform/exynos4-is/media-dev.c      |  8 +++----
 drivers/media/platform/exynos4-is/mipi-csis.c      |  8 +++----
 drivers/media/platform/marvell-ccic/mcam-core.c    |  9 +++++--
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c    |  4 ++--
 drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c       |  6 ++---
 .../media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c  |  4 ++--
 drivers/media/platform/qcom/camss/camss-csid.c     |  6 ++---
 drivers/media/platform/qcom/camss/camss-csiphy.c   |  6 ++---
 drivers/media/platform/qcom/camss/camss-ispif.c    |  6 ++---
 drivers/media/platform/qcom/camss/camss-vfe.c      |  5 ++--
 drivers/media/platform/qcom/venus/core.c           | 28 +++++++++++++---------
 drivers/media/platform/qcom/venus/pm_helpers.c     | 10 ++++----
 drivers/media/platform/qcom/venus/vdec.c           |  4 ++--
 drivers/media/platform/qcom/venus/venc.c           |  5 ++--
 drivers/media/platform/rcar-fcp.c                  |  6 ++---
 drivers/media/platform/rcar-vin/rcar-csi2.c        |  6 +++++
 drivers/media/platform/rcar-vin/rcar-dma.c         |  6 ++---
 drivers/media/platform/rcar-vin/rcar-v4l2.c        |  6 ++---
 drivers/media/platform/rcar_fdp1.c                 | 12 ++++++++--
 drivers/media/platform/renesas-ceu.c               |  4 ++--
 drivers/media/platform/rockchip/rga/rga-buf.c      |  3 +--
 drivers/media/platform/rockchip/rga/rga.c          |  4 +++-
 .../platform/rockchip/rkisp1/rkisp1-capture.c      |  3 +--
 drivers/media/platform/s3c-camif/camif-capture.c   |  2 +-
 drivers/media/platform/s3c-camif/camif-core.c      |  5 ++--
 drivers/media/platform/s5p-jpeg/jpeg-core.c        |  2 +-
 drivers/media/platform/s5p-mfc/s5p_mfc_pm.c        |  6 ++---
 drivers/media/platform/sh_vou.c                    |  6 ++++-
 drivers/media/platform/sti/bdisp/bdisp-v4l2.c      |  7 +++---
 drivers/media/platform/sti/delta/delta-v4l2.c      |  4 ++--
 drivers/media/platform/sti/hva/hva-hw.c            | 17 ++++++-------
 drivers/media/platform/stm32/stm32-dcmi.c          |  5 ++--
 .../media/platform/sunxi/sun4i-csi/sun4i_v4l2.c    |  6 +++--
 .../platform/sunxi/sun8i-rotate/sun8i_rotate.c     |  2 +-
 drivers/media/platform/ti-vpe/cal-video.c          |  4 +++-
 drivers/media/platform/ti-vpe/cal.c                |  8 ++++---
 drivers/media/platform/ti-vpe/vpe.c                |  4 +---
 drivers/media/platform/vsp1/vsp1_drv.c             |  6 ++---
 drivers/staging/media/atomisp/pci/atomisp_fops.c   |  4 ++--
 drivers/staging/media/hantro/hantro_drv.c          |  7 ++++++
 drivers/staging/media/imx/imx7-mipi-csis.c         |  7 +++---
 drivers/staging/media/ipu3/ipu3.c                  |  3 +--
 drivers/staging/media/rkvdec/rkvdec.c              |  2 +-
 drivers/staging/media/sunxi/cedrus/cedrus_video.c  |  6 ++---
 drivers/staging/media/tegra-vde/vde.c              | 16 ++++++++-----
 drivers/staging/media/tegra-video/csi.c            |  3 +--
 drivers/staging/media/tegra-video/vi.c             |  3 +--
 92 files changed, 297 insertions(+), 334 deletions(-)


Thanks,
Mauro
