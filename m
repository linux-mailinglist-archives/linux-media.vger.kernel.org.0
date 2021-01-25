Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03E2130324F
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 03:59:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728929AbhAYNdM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Jan 2021 08:33:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728900AbhAYNbe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 08:31:34 -0500
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2a01:4f9:c010:4572::e8:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F387BC061793
        for <linux-media@vger.kernel.org>; Mon, 25 Jan 2021 05:27:50 -0800 (PST)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 50915634C99;
        Mon, 25 Jan 2021 15:25:58 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Maxime Ripard <mripard@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v3 00/14]  V4L2 Async notifier API cleanup
Date:   Mon, 25 Jan 2021 15:22:16 +0200
Message-Id: <20210125132230.6600-15-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210125132230.6600-1-sakari.ailus@linux.intel.com>
References: <20210125132230.6600-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

I took Ezequiel's set (after discussing with him) and made changes on top
of v2 based on the review comments.

The goal of this series is to make the API more consistent,
also fixing all the drivers which are currently misusing the API.

With this change, the v4l2-async functions that add subdevices
to a notifier have the same semantics, that is they all
allocate a struct v4l2_async_subdev, and take a size argument
for drivers to embed struct v4l2_async_subdev in a larger
struct.

This makes the struct v4l2_async_subdev allocation model
more consistent, and simpler to understand.

The V4L2 sub-devices documentation, as well as the kernel-doc
are also improved a bit, clarifying the API.

Finally, all the drivers previously using v4l2_async_notifier_add_subdev
are converted to proper helpers, which allows us to rename
v4l2_async_notifier_add_subdev to __v4l2_async_notifier_add_subdev,
and clarify the documentation so hopefully future drivers
will avoid it.

I have tried to convert the drivers in the least invasive way,
keeping the original code as much as possible. In many cases,
specially the old drivers, there is some bitrot and some room
for more cleanups, which is beyond the scope of this patchset.

The series is now rebased on top of these patches:
media: v4l2-async: Remove V4L2_ASYNC_MATCH_CUSTOM
media: v4l2-async: Remove V4L2_ASYNC_MATCH_DEVNAME
media: pxa_camera: Drop the v4l2-clk clock register
media: imx6-mipi-csi2: Call remote subdev get_mbus_config to get active lanes

Since v2:

- Don't do useless assign of ret before returning in
  drivers/media/i2c/st-mipid02.c or drivers/media/platform/renesas-ceu.c.

- Don't do of_node_put(NULL) in
  drivers/media/platform/exynos4-is/media-dev.c.

- Fix comment in drivers/media/v4l2-core/v4l2-async.c.

- List all current driver API functions used for working with async
  notifiers in v4l2_async_notifier_init() and
  v4l2_async_notifier_cleanup() kerneldoc documentation in
  include/media/v4l2-async.h.

Changes from v1:
* Add Laurent's follow cleanup, which makes the API safer.
* Fix commit description s/is discouraged/will be discouraged
* Fix missing allocation in renesas-ceu driver.
* Fix missing of_node puts in exynos4-is driver.
* Rework mention of v4l2_fwnode_reference_parse_sensor_common 

Ezequiel Garcia (13):
  media: v4l2-async: Clean v4l2_async_notifier_add_fwnode_remote_subdev
  media: atmel: Use v4l2_async_notifier_add_fwnode_remote_subdev
  media: stm32: Use v4l2_async_notifier_add_fwnode_remote_subdev
  media: exynos4-is: Use v4l2_async_notifier_add_fwnode_remote_subdev
  media: st-mipid02: Use v4l2_async_notifier_add_fwnode_remote_subdev
  media: cadence: Use v4l2_async_notifier_add_fwnode_remote_subdev
  media: marvell-ccic: Use v4l2_async_notifier_add_*_subdev
  media: renesas-ceu: Use v4l2_async_notifier_add_*_subdev
  media: pxa-camera: Use v4l2_async_notifier_add_*_subdev
  media: davinci: vpif_display: Remove unused v4l2-async code
  media: v4l2-async: Fix incorrect comment
  media: Clarify v4l2-async subdevice addition API
  media: v4l2-async: Discourage use of v4l2_async_notifier_add_subdev

Laurent Pinchart (1):
  media: v4l2-async: Improve v4l2_async_notifier_add_*_subdev() API

 .../driver-api/media/v4l2-subdev.rst          | 38 ++++++--
 drivers/media/i2c/max9286.c                   |  2 +-
 drivers/media/i2c/st-mipid02.c                | 16 ++--
 drivers/media/pci/intel/ipu3/ipu3-cio2.c      | 15 ++--
 drivers/media/platform/am437x/am437x-vpfe.c   |  2 +-
 drivers/media/platform/atmel/atmel-isc.h      |  1 +
 drivers/media/platform/atmel/atmel-isi.c      | 46 +++-------
 .../media/platform/atmel/atmel-sama5d2-isc.c  | 44 ++++------
 drivers/media/platform/cadence/cdns-csi2rx.c  | 17 ++--
 drivers/media/platform/davinci/vpif_capture.c |  2 +-
 drivers/media/platform/davinci/vpif_display.c | 86 ++++--------------
 drivers/media/platform/davinci/vpif_display.h |  1 -
 drivers/media/platform/exynos4-is/media-dev.c | 26 +++---
 drivers/media/platform/exynos4-is/media-dev.h |  2 +-
 .../media/platform/marvell-ccic/cafe-driver.c | 14 ++-
 .../media/platform/marvell-ccic/mcam-core.c   | 10 ---
 .../media/platform/marvell-ccic/mcam-core.h   |  1 -
 .../media/platform/marvell-ccic/mmp-driver.c  | 11 ++-
 drivers/media/platform/omap3isp/isp.c         | 74 ++++++----------
 drivers/media/platform/pxa_camera.c           | 53 +++++------
 drivers/media/platform/qcom/camss/camss.c     | 11 +--
 drivers/media/platform/rcar-vin/rcar-core.c   |  5 +-
 drivers/media/platform/rcar-vin/rcar-csi2.c   |  2 +-
 drivers/media/platform/rcar_drif.c            |  2 +-
 drivers/media/platform/renesas-ceu.c          | 55 +++++-------
 .../platform/rockchip/rkisp1/rkisp1-dev.c     | 15 +---
 drivers/media/platform/stm32/stm32-dcmi.c     | 87 +++++++------------
 .../platform/sunxi/sun4i-csi/sun4i_csi.c      |  9 +-
 .../platform/sunxi/sun4i-csi/sun4i_csi.h      |  1 -
 drivers/media/platform/ti-vpe/cal.c           | 12 ++-
 drivers/media/platform/video-mux.c            | 14 +--
 drivers/media/platform/xilinx/xilinx-vipp.c   | 10 +--
 drivers/media/v4l2-core/v4l2-async.c          | 54 ++++++------
 drivers/media/v4l2-core/v4l2-fwnode.c         |  6 +-
 drivers/staging/media/imx/imx-media-csi.c     | 14 +--
 drivers/staging/media/imx/imx-media-of.c      |  2 +-
 drivers/staging/media/imx/imx6-mipi-csi2.c    | 19 ++--
 drivers/staging/media/imx/imx7-media-csi.c    | 16 ++--
 drivers/staging/media/imx/imx7-mipi-csis.c    | 15 +---
 drivers/staging/media/tegra-video/vi.c        | 10 +--
 include/media/davinci/vpif_types.h            |  2 -
 include/media/v4l2-async.h                    | 62 ++++++++-----
 42 files changed, 367 insertions(+), 517 deletions(-)

-- 
2.29.2




Ezequiel Garcia (13):
  media: v4l2-async: Clean v4l2_async_notifier_add_fwnode_remote_subdev
  media: atmel: Use v4l2_async_notifier_add_fwnode_remote_subdev
  media: stm32: Use v4l2_async_notifier_add_fwnode_remote_subdev
  media: exynos4-is: Use v4l2_async_notifier_add_fwnode_remote_subdev
  media: st-mipid02: Use v4l2_async_notifier_add_fwnode_remote_subdev
  media: cadence: Use v4l2_async_notifier_add_fwnode_remote_subdev
  media: marvell-ccic: Use v4l2_async_notifier_add_*_subdev
  media: renesas-ceu: Use v4l2_async_notifier_add_*_subdev
  media: pxa-camera: Use v4l2_async_notifier_add_*_subdev
  media: davinci: vpif_display: Remove unused v4l2-async code
  media: v4l2-async: Fix incorrect comment
  media: Clarify v4l2-async subdevice addition API
  media: v4l2-async: Discourage use of v4l2_async_notifier_add_subdev

Laurent Pinchart (1):
  media: v4l2-async: Improve v4l2_async_notifier_add_*_subdev() API

 .../driver-api/media/v4l2-subdev.rst          | 38 ++++++--
 drivers/media/i2c/max9286.c                   |  2 +-
 drivers/media/i2c/st-mipid02.c                | 19 ++--
 drivers/media/pci/intel/ipu3/ipu3-cio2.c      | 15 ++--
 drivers/media/platform/am437x/am437x-vpfe.c   |  2 +-
 drivers/media/platform/atmel/atmel-isc.h      |  1 +
 drivers/media/platform/atmel/atmel-isi.c      | 46 +++-------
 .../media/platform/atmel/atmel-sama5d2-isc.c  | 44 ++++------
 drivers/media/platform/cadence/cdns-csi2rx.c  | 17 ++--
 drivers/media/platform/davinci/vpif_capture.c |  2 +-
 drivers/media/platform/davinci/vpif_display.c | 86 ++++--------------
 drivers/media/platform/davinci/vpif_display.h |  1 -
 drivers/media/platform/exynos4-is/media-dev.c | 25 +++---
 drivers/media/platform/exynos4-is/media-dev.h |  2 +-
 .../media/platform/marvell-ccic/cafe-driver.c | 14 ++-
 .../media/platform/marvell-ccic/mcam-core.c   | 10 ---
 .../media/platform/marvell-ccic/mcam-core.h   |  1 -
 .../media/platform/marvell-ccic/mmp-driver.c  | 11 ++-
 drivers/media/platform/omap3isp/isp.c         | 74 ++++++----------
 drivers/media/platform/pxa_camera.c           | 53 +++++------
 drivers/media/platform/qcom/camss/camss.c     | 11 +--
 drivers/media/platform/rcar-vin/rcar-core.c   |  5 +-
 drivers/media/platform/rcar-vin/rcar-csi2.c   |  2 +-
 drivers/media/platform/rcar_drif.c            |  2 +-
 drivers/media/platform/renesas-ceu.c          | 56 +++++-------
 .../platform/rockchip/rkisp1/rkisp1-dev.c     | 15 +---
 drivers/media/platform/stm32/stm32-dcmi.c     | 87 +++++++------------
 .../platform/sunxi/sun4i-csi/sun4i_csi.c      |  9 +-
 .../platform/sunxi/sun4i-csi/sun4i_csi.h      |  1 -
 drivers/media/platform/ti-vpe/cal.c           | 12 ++-
 drivers/media/platform/video-mux.c            | 14 +--
 drivers/media/platform/xilinx/xilinx-vipp.c   | 10 +--
 drivers/media/v4l2-core/v4l2-async.c          | 54 ++++++------
 drivers/media/v4l2-core/v4l2-fwnode.c         |  6 +-
 drivers/staging/media/imx/imx-media-csi.c     | 14 +--
 drivers/staging/media/imx/imx-media-of.c      |  2 +-
 drivers/staging/media/imx/imx6-mipi-csi2.c    | 19 ++--
 drivers/staging/media/imx/imx7-media-csi.c    | 16 ++--
 drivers/staging/media/imx/imx7-mipi-csis.c    | 15 +---
 drivers/staging/media/tegra-video/vi.c        | 10 +--
 include/media/davinci/vpif_types.h            |  2 -
 include/media/v4l2-async.h                    | 64 +++++++++-----
 42 files changed, 369 insertions(+), 520 deletions(-)

-- 
2.29.2

