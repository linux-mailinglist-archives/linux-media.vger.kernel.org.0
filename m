Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDCD2388A4F
	for <lists+linux-media@lfdr.de>; Wed, 19 May 2021 11:16:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344304AbhESJRs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 May 2021 05:17:48 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38258 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343716AbhESJRr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 May 2021 05:17:47 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5EE5745E;
        Wed, 19 May 2021 11:16:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621415786;
        bh=IS8YokG2hcXsvIaIjiu5wCa6gRk3GweChUHjsXS95do=;
        h=From:To:Cc:Subject:Date:From;
        b=mChuYTQnmz6OkD7FY819pS+MNRFaVqYJzrIN335b76o6fwYwxJpeRL8Uc4oSkw4Rk
         9XhjVHm3jQ9kSXPFPzeVGmxnm7N0KeJMDcMzxWNNceXhrfypnAX6c+1IbLeYYYOVW7
         bJkb+QC/+NzElP+JTZPRGG3ryRkmHNRu32gHFwhM=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 0/1] media: v4l2-subdev: add subdev-wide state struct
Date:   Wed, 19 May 2021 12:15:57 +0300
Message-Id: <20210519091558.562318-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

This adds a new v4l2 subdev state struct as described in the patch
description, and as seen in the two RFCs I have sent:

https://lore.kernel.org/linux-media/20210409133659.389544-1-tomi.valkeinen@ideasonboard.com/
https://lore.kernel.org/linux-media/20210423102952.137638-1-tomi.valkeinen@ideasonboard.com/

This is the first real version, as it contains changes to all the
drivers. Unfortunately the change is rather large, and I don't really
know how to make the review easier.

Perhaps the v4l2 core changes (drivers/media/v4l2-core/v4l2-subdev.c and
include/media/v4l2-subdev.h) can be first reviewed normally, then review
the semantic patch, and then verify that the semantic patch produces the
changes in this patch.

 Tomi

Tomi Valkeinen (1):
  media: v4l2-subdev: add subdev-wide state struct

 drivers/media/i2c/adv7170.c                   |   6 +-
 drivers/media/i2c/adv7175.c                   |   6 +-
 drivers/media/i2c/adv7180.c                   |  18 +--
 drivers/media/i2c/adv7183.c                   |   8 +-
 drivers/media/i2c/adv748x/adv748x-afe.c       |  13 +-
 drivers/media/i2c/adv748x/adv748x-csi2.c      |  14 +-
 drivers/media/i2c/adv748x/adv748x-hdmi.c      |  13 +-
 drivers/media/i2c/adv7511-v4l2.c              |  10 +-
 drivers/media/i2c/adv7604.c                   |  12 +-
 drivers/media/i2c/adv7842.c                   |  12 +-
 drivers/media/i2c/ak881x.c                    |   6 +-
 drivers/media/i2c/ccs/ccs-core.c              |  84 ++++++-----
 drivers/media/i2c/cx25840/cx25840-core.c      |   2 +-
 drivers/media/i2c/et8ek8/et8ek8_driver.c      |  23 +--
 drivers/media/i2c/hi556.c                     |  15 +-
 drivers/media/i2c/imx214.c                    |  37 ++---
 drivers/media/i2c/imx219.c                    |  30 ++--
 drivers/media/i2c/imx258.c                    |  19 +--
 drivers/media/i2c/imx274.c                    |  32 ++--
 drivers/media/i2c/imx290.c                    |  20 +--
 drivers/media/i2c/imx319.c                    |  18 +--
 drivers/media/i2c/imx334.c                    |  18 +--
 drivers/media/i2c/imx355.c                    |  18 +--
 drivers/media/i2c/m5mols/m5mols_core.c        |  21 ++-
 drivers/media/i2c/max9286.c                   |  17 ++-
 drivers/media/i2c/ml86v7667.c                 |   4 +-
 drivers/media/i2c/mt9m001.c                   |  18 +--
 drivers/media/i2c/mt9m032.c                   |  34 +++--
 drivers/media/i2c/mt9m111.c                   |  18 +--
 drivers/media/i2c/mt9p031.c                   |  45 +++---
 drivers/media/i2c/mt9t001.c                   |  44 +++---
 drivers/media/i2c/mt9t112.c                   |  14 +-
 drivers/media/i2c/mt9v011.c                   |   6 +-
 drivers/media/i2c/mt9v032.c                   |  44 +++---
 drivers/media/i2c/mt9v111.c                   |  23 +--
 drivers/media/i2c/noon010pc30.c               |  19 ++-
 drivers/media/i2c/ov02a10.c                   |  17 ++-
 drivers/media/i2c/ov13858.c                   |  18 +--
 drivers/media/i2c/ov2640.c                    |  16 +-
 drivers/media/i2c/ov2659.c                    |  14 +-
 drivers/media/i2c/ov2680.c                    |  23 +--
 drivers/media/i2c/ov2685.c                    |  10 +-
 drivers/media/i2c/ov2740.c                    |  15 +-
 drivers/media/i2c/ov5640.c                    |  14 +-
 drivers/media/i2c/ov5645.c                    |  38 ++---
 drivers/media/i2c/ov5647.c                    |  26 ++--
 drivers/media/i2c/ov5648.c                    |  14 +-
 drivers/media/i2c/ov5670.c                    |  19 +--
 drivers/media/i2c/ov5675.c                    |  15 +-
 drivers/media/i2c/ov5695.c                    |  15 +-
 drivers/media/i2c/ov6650.c                    |  28 ++--
 drivers/media/i2c/ov7251.c                    |  39 ++---
 drivers/media/i2c/ov7670.c                    |  17 ++-
 drivers/media/i2c/ov772x.c                    |  12 +-
 drivers/media/i2c/ov7740.c                    |  17 ++-
 drivers/media/i2c/ov8856.c                    |  15 +-
 drivers/media/i2c/ov8865.c                    |  14 +-
 drivers/media/i2c/ov9640.c                    |   8 +-
 drivers/media/i2c/ov9650.c                    |  17 ++-
 drivers/media/i2c/ov9734.c                    |  15 +-
 drivers/media/i2c/rdacm20.c                   |   4 +-
 drivers/media/i2c/rdacm21.c                   |   4 +-
 drivers/media/i2c/rj54n1cb0c.c                |  12 +-
 drivers/media/i2c/s5c73m3/s5c73m3-core.c      |  55 +++----
 drivers/media/i2c/s5k4ecgx.c                  |  22 +--
 drivers/media/i2c/s5k5baf.c                   |  49 +++---
 drivers/media/i2c/s5k6a3.c                    |  19 ++-
 drivers/media/i2c/s5k6aa.c                    |  39 ++---
 drivers/media/i2c/saa6752hs.c                 |   6 +-
 drivers/media/i2c/saa7115.c                   |   2 +-
 drivers/media/i2c/saa717x.c                   |   2 +-
 drivers/media/i2c/sr030pc30.c                 |   8 +-
 drivers/media/i2c/st-mipid02.c                |  21 +--
 drivers/media/i2c/tc358743.c                  |   8 +-
 drivers/media/i2c/tda1997x.c                  |  14 +-
 drivers/media/i2c/tvp514x.c                   |   6 +-
 drivers/media/i2c/tvp5150.c                   |  20 +--
 drivers/media/i2c/tvp7002.c                   |  11 +-
 drivers/media/i2c/tw9910.c                    |  10 +-
 drivers/media/i2c/vs6624.c                    |   8 +-
 drivers/media/pci/cx18/cx18-av-core.c         |   2 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |  17 ++-
 drivers/media/pci/saa7134/saa7134-empress.c   |   5 +-
 drivers/media/platform/atmel/atmel-isc-base.c |  19 ++-
 drivers/media/platform/atmel/atmel-isi.c      |  19 ++-
 drivers/media/platform/cadence/cdns-csi2tx.c  |  14 +-
 .../media/platform/exynos4-is/fimc-capture.c  |  22 +--
 drivers/media/platform/exynos4-is/fimc-isp.c  |  37 +++--
 drivers/media/platform/exynos4-is/fimc-lite.c |  39 ++---
 drivers/media/platform/exynos4-is/mipi-csis.c |  17 ++-
 .../media/platform/marvell-ccic/mcam-core.c   |   5 +-
 drivers/media/platform/omap3isp/ispccdc.c     |  85 ++++++-----
 drivers/media/platform/omap3isp/ispccp2.c     |  41 ++---
 drivers/media/platform/omap3isp/ispcsi2.c     |  41 ++---
 drivers/media/platform/omap3isp/isppreview.c  |  69 +++++----
 drivers/media/platform/omap3isp/ispresizer.c  |  70 +++++----
 drivers/media/platform/pxa_camera.c           |   5 +-
 .../media/platform/qcom/camss/camss-csid.c    |  35 ++---
 .../media/platform/qcom/camss/camss-csiphy.c  |  40 ++---
 .../media/platform/qcom/camss/camss-ispif.c   |  36 ++---
 drivers/media/platform/qcom/camss/camss-vfe.c |  84 ++++++-----
 drivers/media/platform/rcar-vin/rcar-csi2.c   |   8 +-
 drivers/media/platform/rcar-vin/rcar-v4l2.c   |  10 +-
 drivers/media/platform/renesas-ceu.c          |   7 +-
 .../platform/rockchip/rkisp1/rkisp1-isp.c     | 112 ++++++++------
 .../platform/rockchip/rkisp1/rkisp1-resizer.c |  95 +++++++-----
 .../media/platform/s3c-camif/camif-capture.c  |  18 +--
 drivers/media/platform/stm32/stm32-dcmi.c     |  14 +-
 .../platform/sunxi/sun4i-csi/sun4i_v4l2.c     |  16 +-
 drivers/media/platform/ti-vpe/cal-camerarx.c  |  35 +++--
 drivers/media/platform/via-camera.c           |   5 +-
 drivers/media/platform/video-mux.c            |  22 +--
 drivers/media/platform/vsp1/vsp1_brx.c        |  34 +++--
 drivers/media/platform/vsp1/vsp1_clu.c        |  13 +-
 drivers/media/platform/vsp1/vsp1_entity.c     |  53 +++----
 drivers/media/platform/vsp1/vsp1_entity.h     |  20 +--
 drivers/media/platform/vsp1/vsp1_histo.c      |  51 ++++---
 drivers/media/platform/vsp1/vsp1_hsit.c       |  14 +-
 drivers/media/platform/vsp1/vsp1_lif.c        |  13 +-
 drivers/media/platform/vsp1/vsp1_lut.c        |  13 +-
 drivers/media/platform/vsp1/vsp1_rwpf.c       |  32 ++--
 drivers/media/platform/vsp1/vsp1_rwpf.h       |   2 +-
 drivers/media/platform/vsp1/vsp1_sru.c        |  22 +--
 drivers/media/platform/vsp1/vsp1_uds.c        |  22 +--
 drivers/media/platform/vsp1/vsp1_uif.c        |  27 ++--
 .../media/platform/xilinx/xilinx-csi2rxss.c   |  20 +--
 drivers/media/platform/xilinx/xilinx-tpg.c    |  25 ++--
 drivers/media/platform/xilinx/xilinx-vip.c    |   8 +-
 drivers/media/platform/xilinx/xilinx-vip.h    |   4 +-
 .../media/test-drivers/vimc/vimc-debayer.c    |  20 +--
 drivers/media/test-drivers/vimc/vimc-scaler.c |  36 ++---
 drivers/media/test-drivers/vimc/vimc-sensor.c |  16 +-
 drivers/media/usb/go7007/s2250-board.c        |   2 +-
 drivers/media/v4l2-core/v4l2-subdev.c         | 141 ++++++++++--------
 .../media/atomisp/i2c/atomisp-gc0310.c        |  10 +-
 .../media/atomisp/i2c/atomisp-gc2235.c        |  10 +-
 .../media/atomisp/i2c/atomisp-mt9m114.c       |  12 +-
 .../media/atomisp/i2c/atomisp-ov2680.c        |  10 +-
 .../media/atomisp/i2c/atomisp-ov2722.c        |  10 +-
 .../media/atomisp/i2c/ov5693/atomisp-ov5693.c |  10 +-
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  33 ++--
 .../staging/media/atomisp/pci/atomisp_csi2.c  |  28 ++--
 .../staging/media/atomisp/pci/atomisp_csi2.h  |   2 +-
 .../staging/media/atomisp/pci/atomisp_file.c  |  14 +-
 .../staging/media/atomisp/pci/atomisp_fops.c  |   6 +-
 .../media/atomisp/pci/atomisp_subdev.c        |  64 ++++----
 .../media/atomisp/pci/atomisp_subdev.h        |   9 +-
 .../staging/media/atomisp/pci/atomisp_tpg.c   |  12 +-
 drivers/staging/media/imx/imx-ic-prp.c        |  19 +--
 drivers/staging/media/imx/imx-ic-prpencvf.c   |  31 ++--
 drivers/staging/media/imx/imx-media-csi.c     |  82 +++++-----
 drivers/staging/media/imx/imx-media-utils.c   |   4 +-
 drivers/staging/media/imx/imx-media-vdic.c    |  24 +--
 drivers/staging/media/imx/imx-media.h         |   2 +-
 drivers/staging/media/imx/imx6-mipi-csi2.c    |  12 +-
 drivers/staging/media/imx/imx7-media-csi.c    |  33 ++--
 drivers/staging/media/imx/imx7-mipi-csis.c    |  35 +++--
 drivers/staging/media/ipu3/ipu3-v4l2.c        |  26 ++--
 drivers/staging/media/omap4iss/iss_csi2.c     |  37 ++---
 drivers/staging/media/omap4iss/iss_ipipe.c    |  37 ++---
 drivers/staging/media/omap4iss/iss_ipipeif.c  |  47 +++---
 drivers/staging/media/omap4iss/iss_resizer.c  |  39 ++---
 drivers/staging/media/tegra-video/csi.c       |  10 +-
 drivers/staging/media/tegra-video/vi.c        |  24 +--
 include/media/v4l2-subdev.h                   |  72 +++++----
 165 files changed, 2124 insertions(+), 1769 deletions(-)

-- 
2.25.1

