Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C94882F318F
	for <lists+linux-media@lfdr.de>; Tue, 12 Jan 2021 14:26:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726862AbhALNYa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 08:24:30 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40312 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726612AbhALNYa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 08:24:30 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id A40171F451D0
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 00/13] V4L2 Async notifier API cleanup
Date:   Tue, 12 Jan 2021 10:23:26 -0300
Message-Id: <20210112132339.5621-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The goal of this series is to make the API more consistent,
also fixing all the drivers which are currently misusing the API.

With this change, the v4l2-async functions that add subdevices
to a notifier have the same semantics, that is they all
allocate a struct v4l2_async_subdev, and take a size argument
for drivers to embed struct v4l2_async_subdev in a larger
struct.

This makes the struct v4l2_async_subdev allocation model
more consistent, simpler to understand, and harder to misuse.

The V4L2 sub-devices documentation, as well as the kernel-doc
are also improved a bit, clarifying the API.

Finally, all the drivers previously using v4l2_async_notifier_add_subdev
are converted to proper helpers,

I have tried to convert the drivers in the least invasive way,
keeping the original code as much as possible. In many cases,
specially the old drivers, there is some bitrot and some room
for more cleanups, which is beyond the scope of this patchset.

I'd like to make v4l2_async_notifier_add_subdev() internal, which
might be possible once the (currently deprecated)
v4l2_async_notifier_parse_fwnode_endpoints() function
is removed. For the time being, I'm proposing to rename
v4l2_async_notifier_add_subdev to __v4l2_async_notifier_add_subdev,
so it's clearer the function is not really meant for drivers to use.

Ezequiel Garcia (13):
  media: v4l2-async: Clean v4l2_async_notifier_add_fwnode_remote_subdev semantics
  media: stm32-dcmi: Use v4l2_async_notifier_add_fwnode_remote_subdev helpers
  media: renesas-ceu: Use v4l2_async_notifier_add_{i2c,fwnode_remote}_subdev helpers
  media: exynos4-is: Use v4l2_async_notifier_add_fwnode_remote_subdev
  media: st-mipid02: Use v4l2_async_notifier_add_fwnode_remote_subdev helpers
  media: atmel: Use v4l2_async_notifier_add_fwnode_remote_subdev helpers
  media: cdns-csi2rx: Use v4l2_async_notifier_add_fwnode_remote_subdev helpers
  media: marvell-ccic: Use v4l2_async_notifier_add_{i2c,fwnode_remote}_subdev helpers
  media: pxa-camera: Use v4l2_async_notifier_add_{i2c,fwnode_remote}_subdev helpers
  media: davinci: vpif_display: Remove unused v4l2-async code
  media: v4l2-async: Drop v4l2_fwnode_reference_parse_sensor_common mention
  media: Clarify v4l2-async subdevice addition API
  media: v4l2-async: Discourage use of v4l2_async_notifier_add_subdev

 .../driver-api/media/v4l2-subdev.rst          | 38 ++++++--
 drivers/media/i2c/st-mipid02.c                | 16 ++--
 drivers/media/pci/intel/ipu3/ipu3-cio2.c      | 17 ++--
 drivers/media/platform/atmel/atmel-isc.h      |  1 +
 drivers/media/platform/atmel/atmel-isi.c      | 46 +++-------
 .../media/platform/atmel/atmel-sama5d2-isc.c  | 44 ++++-----
 drivers/media/platform/cadence/cdns-csi2rx.c  | 16 ++--
 drivers/media/platform/davinci/vpif_display.c | 86 ++++--------------
 drivers/media/platform/davinci/vpif_display.h |  1 -
 drivers/media/platform/exynos4-is/media-dev.c | 25 +++---
 drivers/media/platform/exynos4-is/media-dev.h |  2 +-
 .../media/platform/marvell-ccic/cafe-driver.c | 14 ++-
 .../media/platform/marvell-ccic/mcam-core.c   | 10 ---
 .../media/platform/marvell-ccic/mcam-core.h   |  1 -
 .../media/platform/marvell-ccic/mmp-driver.c  | 11 ++-
 drivers/media/platform/omap3isp/isp.c         | 78 +++++++---------
 drivers/media/platform/pxa_camera.c           | 53 +++++------
 drivers/media/platform/renesas-ceu.c          | 89 +++++++------------
 .../platform/rockchip/rkisp1/rkisp1-dev.c     | 15 ++--
 drivers/media/platform/stm32/stm32-dcmi.c     | 86 +++++++-----------
 .../platform/sunxi/sun4i-csi/sun4i_csi.c      |  9 +-
 .../platform/sunxi/sun4i-csi/sun4i_csi.h      |  1 -
 drivers/media/platform/video-mux.c            | 14 +--
 drivers/media/v4l2-core/v4l2-async.c          | 34 +++----
 drivers/media/v4l2-core/v4l2-fwnode.c         |  2 +-
 drivers/staging/media/imx/imx-media-csi.c     | 14 +--
 drivers/staging/media/imx/imx6-mipi-csi2.c    | 19 ++--
 drivers/staging/media/imx/imx7-media-csi.c    | 16 ++--
 drivers/staging/media/imx/imx7-mipi-csis.c    | 15 +---
 include/media/davinci/vpif_types.h            |  2 -
 include/media/v4l2-async.h                    | 40 ++++++---
 31 files changed, 323 insertions(+), 492 deletions(-)

-- 
2.29.2

