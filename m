Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6BD136C642
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 14:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236192AbhD0Mqt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 08:46:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235426AbhD0Mqt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 08:46:49 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F8A5C061574
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 05:46:06 -0700 (PDT)
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 44829E9;
        Tue, 27 Apr 2021 14:46:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619527563;
        bh=g0ryOu9cMHMaZ4C27WQkMAI/MSDCGFt0khPlB8o8r5s=;
        h=From:To:Cc:Subject:Date:From;
        b=IMNzo3UmGewgpHbuaLBFpDzv+Iao2XwJJHnllQUU7nt6dJUN/5cD6yT6NGHRAcvdK
         2jSxSqsHNZNAO01TK3cniUiwxpkDObwezD5x2hBFC45whKkC8dhjf0IERZTwlSfcQk
         TDrQS565lFKEpzn93N0VpBU7rZbZE5z59W3IlynM=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v6 00/24] v4l: subdev internal routing
Date:   Tue, 27 Apr 2021 15:44:59 +0300
Message-Id: <20210427124523.990938-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

This is v6 of the series. Previous one can be found from:

https://lore.kernel.org/linux-media/20210415130450.421168-1-tomi.valkeinen@ideasonboard.com/

Changes to v5:
- Dropped "v4l: mc: Add an S_ROUTING helper function for power state changes" as discussed
- Added MEDIA_PAD_FL_MULTIPLEXED flag to indicate that a pad works in multiplexed mode
- Documentation improvements
- Renamed struct v4l2_mbus_frame_desc_entry_csi2 fields
- Fixed setting routing->num_routes in G_ROUTING
- Many smaller cosmetic changes as per comments

One bigger topic I didn't change is the in-kernel API for get/set routing.
Currently the link validation needs to get the routing tables multiple times,
each leading to memory allocations (and frees). A different API would allow the
link validation to peek at the routing without any allocations, but I haven't
solved that yet.

A simple solution would be to require a lock to be held when accessing the
routing table, and making get_routing return a pointer to the driver's routing
table. But this kind of API would be quite different than, say, get_fmt.

Another would be to keep the API, but have a state object during link
validation, which would hold preallocated routing tables, so that link
validation wouldn't need to allocate new ones for each get_routing call.

Anything we do here is a kernel internal change, so it's not super critical to
solve it right away.

 Tomi

Jacopo Mondi (2):
  media: entity: Add iterator helper for entity pads
  media: Documentation: Add GS_ROUTING documentation

Laurent Pinchart (3):
  media: entity: Add has_route entity operation
  media: entity: Add media_entity_has_route() function
  media: entity: Use routing information during graph traversal

Sakari Ailus (9):
  media: entity: Use pad as a starting point for graph walk
  media: entity: Use pads instead of entities in the media graph walk
    stack
  v4l: mc: Start walk from a specific pad in use count calculation
  media: entity: Move the pipeline from entity to pads
  media: entity: Use pad as the starting point for a pipeline
  media: entity: Skip link validation for pads to which there is no
    route to
  media: entity: Add only connected pads to the pipeline
  media: entity: Add debug information in graph walk route check
  v4l: Add stream to frame descriptor

Tomi Valkeinen (10):
  media: entity: Walk the graph based on pads
  media: entity: Add an iterator helper for connected pads
  v4l: Add bus type to frame descriptors
  v4l: Add CSI-2 bus configuration to frame descriptors
  v4l: subdev: Add [GS]_ROUTING subdev ioctls and operations
  v4l: subdev: routing kernel helper functions
  v4l: subdev: add v4l2_subdev_get_format_dir()
  media: uapi: add MEDIA_PAD_FL_MULTIPLEXED flag
  v4l: subdev: Take routing information into account in link validation
  v4l: subdev: increase V4L2_FRAME_DESC_ENTRY_MAX to 8

 Documentation/driver-api/media/mc-core.rst    |  15 +-
 .../media/mediactl/media-types.rst            |   6 +
 .../userspace-api/media/v4l/dev-subdev.rst    | 125 ++++++
 .../userspace-api/media/v4l/user-func.rst     |   1 +
 .../media/v4l/vidioc-subdev-g-routing.rst     | 138 +++++++
 drivers/media/mc/mc-device.c                  |  13 +-
 drivers/media/mc/mc-entity.c                  | 241 ++++++-----
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |   6 +-
 .../media/platform/exynos4-is/fimc-capture.c  |   8 +-
 .../platform/exynos4-is/fimc-isp-video.c      |   8 +-
 drivers/media/platform/exynos4-is/fimc-isp.c  |   2 +-
 drivers/media/platform/exynos4-is/fimc-lite.c |  10 +-
 drivers/media/platform/exynos4-is/media-dev.c |  20 +-
 drivers/media/platform/omap3isp/isp.c         |   2 +-
 drivers/media/platform/omap3isp/ispvideo.c    |  25 +-
 drivers/media/platform/omap3isp/ispvideo.h    |   2 +-
 .../media/platform/qcom/camss/camss-video.c   |   6 +-
 drivers/media/platform/rcar-vin/rcar-core.c   |  16 +-
 drivers/media/platform/rcar-vin/rcar-dma.c    |   8 +-
 .../platform/rockchip/rkisp1/rkisp1-capture.c |   6 +-
 .../media/platform/s3c-camif/camif-capture.c  |   6 +-
 drivers/media/platform/stm32/stm32-dcmi.c     |   6 +-
 .../platform/sunxi/sun4i-csi/sun4i_dma.c      |   6 +-
 .../platform/sunxi/sun6i-csi/sun6i_video.c    |   6 +-
 drivers/media/platform/ti-vpe/cal-video.c     |   6 +-
 drivers/media/platform/vsp1/vsp1_video.c      |  18 +-
 drivers/media/platform/xilinx/xilinx-dma.c    |  20 +-
 drivers/media/platform/xilinx/xilinx-dma.h    |   2 +-
 .../media/test-drivers/vimc/vimc-capture.c    |   6 +-
 drivers/media/usb/au0828/au0828-core.c        |   8 +-
 drivers/media/v4l2-core/v4l2-ioctl.c          |  25 +-
 drivers/media/v4l2-core/v4l2-mc.c             |  43 +-
 drivers/media/v4l2-core/v4l2-subdev.c         | 376 +++++++++++++++++-
 drivers/staging/media/imx/imx-media-utils.c   |   8 +-
 drivers/staging/media/ipu3/ipu3-v4l2.c        |   6 +-
 drivers/staging/media/omap4iss/iss.c          |   2 +-
 drivers/staging/media/omap4iss/iss_video.c    |  38 +-
 drivers/staging/media/omap4iss/iss_video.h    |   2 +-
 drivers/staging/media/tegra-video/tegra210.c  |   6 +-
 include/media/media-entity.h                  | 144 +++++--
 include/media/v4l2-subdev.h                   | 107 ++++-
 include/uapi/linux/media.h                    |   1 +
 include/uapi/linux/v4l2-subdev.h              |  48 +++
 43 files changed, 1246 insertions(+), 302 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst

-- 
2.25.1

