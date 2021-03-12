Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7207338DF3
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 13:57:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231444AbhCLM5M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 07:57:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231441AbhCLM5C (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 07:57:02 -0500
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.eu [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E38B2C061574
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 04:57:01 -0800 (PST)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 02587634C87;
        Fri, 12 Mar 2021 14:54:13 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     ezequiel.garcia@collabora.com
Subject: [PATCH v2 0/4] Knead V4L2 async and fwnode frameworks a little
Date:   Fri, 12 Mar 2021 14:56:53 +0200
Message-Id: <20210312125657.25442-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

This set improves code readability of the users of the V4L2 async and
fwnode frameworks by shortening the names of a few long functions. As a
result, no callers of these functions have to result in overly long lines
(> 80) nor wrapping at opening parenthesis.

This set is flaming hot. It'd be nice to get merged early in the cycle.

since v1:

- Include v4l2-async module split set. That now includes v4l2-async and
  v4l2-fwnode as separate modules. There turned out to be more drivers
  using just v4l2-async but not v4l2-fwnode.

Sakari Ailus (4):
  v4l: fwnode: Rename and make static V4L2 async notifier helper
  v4l: fwnode: Rename v4l2_async_register_subdev_sensor_common
  v4l: async: Wrap long lines, remove '(' at the end of lines
  v4l: async, fwnode: Improve module organisation

 .../driver-api/media/v4l2-subdev.rst          |  16 +-
 drivers/media/i2c/Kconfig                     |   8 +
 drivers/media/i2c/ccs/ccs-core.c              |   2 +-
 drivers/media/i2c/et8ek8/et8ek8_driver.c      |   2 +-
 drivers/media/i2c/hi556.c                     |   2 +-
 drivers/media/i2c/imx214.c                    |   2 +-
 drivers/media/i2c/imx219.c                    |   2 +-
 drivers/media/i2c/imx258.c                    |   2 +-
 drivers/media/i2c/imx319.c                    |   2 +-
 drivers/media/i2c/imx334.c                    |   2 +-
 drivers/media/i2c/imx355.c                    |   2 +-
 drivers/media/i2c/max9286.c                   |  17 +-
 drivers/media/i2c/ov13858.c                   |   2 +-
 drivers/media/i2c/ov2740.c                    |   2 +-
 drivers/media/i2c/ov5640.c                    |   2 +-
 drivers/media/i2c/ov5648.c                    |   2 +-
 drivers/media/i2c/ov5670.c                    |   2 +-
 drivers/media/i2c/ov5675.c                    |   2 +-
 drivers/media/i2c/ov5695.c                    |   2 +-
 drivers/media/i2c/ov8856.c                    |   2 +-
 drivers/media/i2c/ov8865.c                    |   2 +-
 drivers/media/i2c/ov9734.c                    |   2 +-
 drivers/media/i2c/st-mipid02.c                |  22 +--
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |  17 +-
 drivers/media/platform/am437x/am437x-vpfe.c   |  19 +-
 drivers/media/platform/atmel/atmel-isc-base.c |   4 +-
 drivers/media/platform/atmel/atmel-isi.c      |  17 +-
 .../media/platform/atmel/atmel-sama5d2-isc.c  |  15 +-
 drivers/media/platform/cadence/cdns-csi2rx.c  |  13 +-
 drivers/media/platform/davinci/vpif_capture.c |  21 +-
 drivers/media/platform/exynos4-is/media-dev.c |  20 +-
 .../media/platform/marvell-ccic/cafe-driver.c |   9 +-
 .../media/platform/marvell-ccic/mcam-core.c   |  10 +-
 .../media/platform/marvell-ccic/mmp-driver.c  |   6 +-
 drivers/media/platform/omap3isp/isp.c         |  21 +-
 drivers/media/platform/pxa_camera.c           |  26 ++-
 drivers/media/platform/qcom/camss/camss.c     |  18 +-
 drivers/media/platform/rcar-vin/rcar-core.c   |  33 ++--
 drivers/media/platform/rcar-vin/rcar-csi2.c   |  19 +-
 drivers/media/platform/rcar_drif.c            |  14 +-
 drivers/media/platform/renesas-ceu.c          |  29 ++-
 .../platform/rockchip/rkisp1/rkisp1-dev.c     |  17 +-
 drivers/media/platform/stm32/stm32-dcmi.c     |  18 +-
 .../platform/sunxi/sun4i-csi/sun4i_csi.c      |  12 +-
 .../platform/sunxi/sun6i-csi/sun6i_csi.c      |  19 +-
 drivers/media/platform/ti-vpe/cal.c           |  16 +-
 drivers/media/platform/video-mux.c            |  16 +-
 drivers/media/platform/xilinx/xilinx-vipp.c   |  17 +-
 drivers/media/v4l2-core/Kconfig               |   4 +
 drivers/media/v4l2-core/Makefile              |  11 +-
 drivers/media/v4l2-core/v4l2-async.c          | 181 ++++++++++--------
 drivers/media/v4l2-core/v4l2-dev.c            |   5 -
 drivers/media/v4l2-core/v4l2-fwnode.c         |  57 ++++--
 drivers/staging/media/imx/imx-media-csi.c     |  17 +-
 .../staging/media/imx/imx-media-dev-common.c  |   7 +-
 drivers/staging/media/imx/imx-media-dev.c     |   6 +-
 drivers/staging/media/imx/imx-media-of.c      |   6 +-
 drivers/staging/media/imx/imx6-mipi-csi2.c    |  17 +-
 drivers/staging/media/imx/imx7-media-csi.c    |  24 +--
 drivers/staging/media/imx/imx7-mipi-csis.c    |  17 +-
 drivers/staging/media/tegra-video/vi.c        |  17 +-
 include/media/v4l2-async.h                    | 111 ++++++-----
 include/media/v4l2-fwnode.h                   |  27 +--
 63 files changed, 525 insertions(+), 509 deletions(-)

-- 
2.29.2

