Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35D813B2A85
	for <lists+linux-media@lfdr.de>; Thu, 24 Jun 2021 10:40:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbhFXInN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Jun 2021 04:43:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbhFXInL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Jun 2021 04:43:11 -0400
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.eu [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7783C061574
        for <linux-media@vger.kernel.org>; Thu, 24 Jun 2021 01:40:48 -0700 (PDT)
Received: from lanttu.localdomain (unknown [192.168.2.193])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 794E2634C87;
        Thu, 24 Jun 2021 11:40:31 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v3 0/6] V4L2 driver documentation, v4l2-async improvements
Date:   Thu, 24 Jun 2021 11:40:40 +0300
Message-Id: <20210624084046.13136-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi folks,

Here's a refresh of my somewhat old patches, improving V4L2 camera sensor,
CSI-2 and parallel interface documentation as well as v4l2-async. I've
tried to take feedback into account but unfortunately I no longer have
details of that. A lot has been rewritten in the documentation in any
case.

I'd like to get these to 5.15 early on (unless somehow 5.14 is possible)
so comments would be welcome now.

Note that the documentation of frame rate configuration can be improved,
too, but I think that can be after this set.

since v1:

- Fix compile problems in async notifier rename patch.

- Language fixes and other minor improvements in tx-rx documentation.

Niklas Söderlund (2):
  media: v4l2-fwnode: Simplify v4l2_async_nf_parse_fwnode_endpoints()
  media: rcar-vin: Remove explicit device availability check

Sakari Ailus (4):
  Documentation: media: Improve camera sensor documentation
  Documentation: media: Fix v4l2-async kerneldoc syntax
  v4l: async: Rename async nf functions, clean up long lines
  Documentation: v4l: Fix V4L2_CID_PIXEL_RATE documentation

 .../driver-api/media/camera-sensor.rst        |  45 ++---
 Documentation/driver-api/media/csi2.rst       |  94 ----------
 Documentation/driver-api/media/index.rst      |   2 +-
 Documentation/driver-api/media/tx-rx.rst      | 117 ++++++++++++
 .../driver-api/media/v4l2-subdev.rst          |  14 +-
 .../media/v4l/ext-ctrls-image-process.rst     |   6 +-
 drivers/media/i2c/max9286.c                   |  17 +-
 drivers/media/i2c/st-mipid02.c                |  22 ++-
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |  17 +-
 drivers/media/platform/am437x/am437x-vpfe.c   |  19 +-
 drivers/media/platform/atmel/atmel-isc-base.c |   4 +-
 drivers/media/platform/atmel/atmel-isi.c      |  17 +-
 .../media/platform/atmel/atmel-sama5d2-isc.c  |  15 +-
 .../media/platform/atmel/atmel-sama7g5-isc.c  |  15 +-
 drivers/media/platform/cadence/cdns-csi2rx.c  |  14 +-
 drivers/media/platform/davinci/vpif_capture.c |  21 +--
 drivers/media/platform/exynos4-is/media-dev.c |  20 +--
 .../media/platform/marvell-ccic/cafe-driver.c |   9 +-
 .../media/platform/marvell-ccic/mcam-core.c   |  10 +-
 .../media/platform/marvell-ccic/mmp-driver.c  |   6 +-
 drivers/media/platform/omap3isp/isp.c         |  21 ++-
 drivers/media/platform/pxa_camera.c           |  26 ++-
 drivers/media/platform/qcom/camss/camss.c     |  18 +-
 drivers/media/platform/rcar-vin/rcar-core.c   |  41 ++---
 drivers/media/platform/rcar-vin/rcar-csi2.c   |  19 +-
 drivers/media/platform/rcar_drif.c            |  14 +-
 drivers/media/platform/renesas-ceu.c          |  29 ++-
 .../platform/rockchip/rkisp1/rkisp1-dev.c     |  17 +-
 drivers/media/platform/stm32/stm32-dcmi.c     |  18 +-
 .../platform/sunxi/sun4i-csi/sun4i_csi.c      |  12 +-
 .../platform/sunxi/sun6i-csi/sun6i_csi.c      |  19 +-
 drivers/media/platform/ti-vpe/cal.c           |  16 +-
 drivers/media/platform/video-mux.c            |  17 +-
 drivers/media/platform/xilinx/xilinx-vipp.c   |  17 +-
 drivers/media/v4l2-core/v4l2-async.c          | 168 +++++++++---------
 drivers/media/v4l2-core/v4l2-fwnode.c         |  83 +++------
 drivers/staging/media/imx/imx-media-csi.c     |  17 +-
 .../staging/media/imx/imx-media-dev-common.c  |   7 +-
 drivers/staging/media/imx/imx-media-dev.c     |   6 +-
 drivers/staging/media/imx/imx-media-of.c      |   6 +-
 drivers/staging/media/imx/imx6-mipi-csi2.c    |  17 +-
 drivers/staging/media/imx/imx7-media-csi.c    |  24 +--
 drivers/staging/media/imx/imx7-mipi-csis.c    |  16 +-
 drivers/staging/media/tegra-video/vi.c        |  17 +-
 include/media/v4l2-async.h                    | 105 ++++++-----
 include/media/v4l2-fwnode.h                   |  12 +-
 46 files changed, 607 insertions(+), 639 deletions(-)
 delete mode 100644 Documentation/driver-api/media/csi2.rst
 create mode 100644 Documentation/driver-api/media/tx-rx.rst

-- 
2.30.2

