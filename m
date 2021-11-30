Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BE31463650
	for <lists+linux-media@lfdr.de>; Tue, 30 Nov 2021 15:16:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237420AbhK3OUG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Nov 2021 09:20:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbhK3OTz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Nov 2021 09:19:55 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AE6FC061574
        for <linux-media@vger.kernel.org>; Tue, 30 Nov 2021 06:16:36 -0800 (PST)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CE43A8F0;
        Tue, 30 Nov 2021 15:16:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638281793;
        bh=vkShN4Euvd1gfMIIlsKbsOxqD/bjlXqH7Ccni3zRytM=;
        h=From:To:Cc:Subject:Date:From;
        b=sEwEnfkkBxDWLklBnosEcorCCXuCeW5aKHC0+Wy/rdu5uEXHCKRfvAqmCsvRhCq/z
         cp3u72OrKMzDWXg2XK3+k4KIxnGbNkwJuPPrvdYmAm6K+mEli81qiRkn5yXkDZcV44
         pxMaIMgRLU6OfYS4Sl751bfTKZd0jHStAIBoOlUM=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v10 00/38] v4l: subdev internal routing and streams
Date:   Tue, 30 Nov 2021 16:14:58 +0200
Message-Id: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

This is v10 of the multiplexed streams series. v8 can be found from:

https://lore.kernel.org/all/20211005085750.138151-1-tomi.valkeinen@ideasonboard.com/

I have pushed my work branch to:

git://git.kernel.org/pub/scm/linux/kernel/git/tomba/linux.git multistream/work-v10

which contains the patches in this series, along with subdev drivers
using multiplexed streams.

I have also pushed v4l-utils changes to:

https://github.com/tomba/v4l-utils.git streams-review-v1

Changes to v9:

- Add V4L2_SUBDEV_CAP_MPLEXED flag
- Use standard kmalloc and kmemdup for routes
- Allow NULL as pad/stream param for v4l2_state_find_opposite_end
- Add for_each_active_route
- Use _BITUL() in uapi header
- Rearrange struct v4l2_subdev_routing members to align on 64 bit
- Renames:
	sd->state -> sd->active_state
	v4l2_state_find_opposite_end -> v4l2_subdev_routing_find_opposite_end
	v4l2_state_get_opposite_stream_format -> v4l2_subdev_state_get_opposite_stream_format
	v4l2_routing_simple_verify -> v4l2_subdev_routing_validate_1_to_1
	v4l2_subdev_validate_and_lock_state -> v4l2_subdev_lock_and_return_state
- Doc & comment updates

 Tomi

Jacopo Mondi (3):
  media: entity: Add iterator helper for entity pads
  media: Documentation: Add GS_ROUTING documentation
  media: subdev: Add for_each_active_route() macro

Laurent Pinchart (4):
  media: entity: Add has_route entity operation
  media: entity: Add media_entity_has_route() function
  media: entity: Use routing information during graph traversal
  media: subdev: Add [GS]_ROUTING subdev ioctls and operations

Sakari Ailus (13):
  media: entity: Use pad as a starting point for graph walk
  media: entity: Use pads instead of entities in the media graph walk
    stack
  media: entity: Walk the graph based on pads
  media: mc: Start walk from a specific pad in use count calculation
  media: entity: Move the pipeline from entity to pads
  media: entity: Use pad as the starting point for a pipeline
  media: entity: Skip link validation for pads to which there is no
    route
  media: entity: Add an iterator helper for connected pads
  media: entity: Add only connected pads to the pipeline
  media: entity: Add debug information in graph walk route check
  media: Add bus type to frame descriptors
  media: Add CSI-2 bus configuration to frame descriptors
  media: Add stream to frame descriptor

Tomi Valkeinen (18):
  media: subdev: rename subdev-state alloc & free
  media: subdev: add active state to struct v4l2_subdev
  media: subdev: pass also the active state to subdevs from ioctls
  media: subdev: add subdev state locking
  media: subdev: Add v4l2_subdev_lock_and_return_state()
  media: Documentation: add documentation about subdev state
  media: subdev: increase V4L2_FRAME_DESC_ENTRY_MAX to 8
  media: add V4L2_SUBDEV_FL_MULTIPLEXED
  media: add V4L2_SUBDEV_CAP_MPLEXED
  media: subdev: add v4l2_subdev_has_route()
  media: subdev: add v4l2_subdev_set_routing helper()
  media: Documentation: add multiplexed streams documentation
  media: subdev: add stream based configuration
  media: subdev: use streams in v4l2_subdev_link_validate()
  media: subdev: add "opposite" stream helper funcs
  media: subdev: add v4l2_subdev_get_fmt() helper function
  media: subdev: add v4l2_subdev_set_routing_with_fmt() helper
  media: subdev: add v4l2_subdev_routing_validate_1_to_1 helper

 Documentation/driver-api/media/mc-core.rst    |  18 +-
 .../driver-api/media/v4l2-subdev.rst          |  36 +
 .../userspace-api/media/v4l/dev-subdev.rst    | 167 ++++
 .../userspace-api/media/v4l/user-func.rst     |   1 +
 .../v4l/vidioc-subdev-enum-frame-interval.rst |   5 +-
 .../v4l/vidioc-subdev-enum-frame-size.rst     |   5 +-
 .../v4l/vidioc-subdev-enum-mbus-code.rst      |   5 +-
 .../media/v4l/vidioc-subdev-g-crop.rst        |   5 +-
 .../media/v4l/vidioc-subdev-g-fmt.rst         |   5 +-
 .../v4l/vidioc-subdev-g-frame-interval.rst    |   5 +-
 .../media/v4l/vidioc-subdev-g-routing.rst     | 150 ++++
 .../media/v4l/vidioc-subdev-g-selection.rst   |   5 +-
 drivers/media/mc/mc-device.c                  |  13 +-
 drivers/media/mc/mc-entity.c                  | 257 +++---
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
 drivers/media/platform/rcar-vin/rcar-v4l2.c   |   5 +-
 .../platform/rockchip/rkisp1/rkisp1-capture.c |   6 +-
 .../media/platform/s3c-camif/camif-capture.c  |   6 +-
 drivers/media/platform/stm32/stm32-dcmi.c     |   6 +-
 .../platform/sunxi/sun4i-csi/sun4i_dma.c      |   6 +-
 .../platform/sunxi/sun6i-csi/sun6i_video.c    |   6 +-
 drivers/media/platform/ti-vpe/cal-video.c     |   6 +-
 drivers/media/platform/vsp1/vsp1_entity.c     |   6 +-
 drivers/media/platform/vsp1/vsp1_video.c      |  18 +-
 drivers/media/platform/xilinx/xilinx-dma.c    |  20 +-
 drivers/media/platform/xilinx/xilinx-dma.h    |   2 +-
 .../media/test-drivers/vimc/vimc-capture.c    |   6 +-
 drivers/media/usb/au0828/au0828-core.c        |   8 +-
 drivers/media/v4l2-core/v4l2-ioctl.c          |  25 +-
 drivers/media/v4l2-core/v4l2-mc.c             |  43 +-
 drivers/media/v4l2-core/v4l2-subdev.c         | 764 +++++++++++++++++-
 drivers/staging/media/imx/imx-media-utils.c   |   8 +-
 drivers/staging/media/ipu3/ipu3-v4l2.c        |   6 +-
 drivers/staging/media/omap4iss/iss.c          |   2 +-
 drivers/staging/media/omap4iss/iss_video.c    |  40 +-
 drivers/staging/media/omap4iss/iss_video.h    |   2 +-
 drivers/staging/media/tegra-video/tegra210.c  |   6 +-
 drivers/staging/media/tegra-video/vi.c        |   6 +-
 include/media/media-entity.h                  | 143 +++-
 include/media/v4l2-subdev.h                   | 394 ++++++++-
 include/uapi/linux/v4l2-subdev.h              |  88 +-
 52 files changed, 2048 insertions(+), 370 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst

-- 
2.25.1

