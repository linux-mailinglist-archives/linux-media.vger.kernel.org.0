Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 957C23FB430
	for <lists+linux-media@lfdr.de>; Mon, 30 Aug 2021 13:02:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236384AbhH3LDF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Aug 2021 07:03:05 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:43814 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235818AbhH3LDE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Aug 2021 07:03:04 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9A1665A7;
        Mon, 30 Aug 2021 13:02:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1630321330;
        bh=urmi9PkS0a7ILftojl5tCxLx2eGBSg3GvzL+16WJ4ls=;
        h=From:To:Cc:Subject:Date:From;
        b=TJB+rwJLGZohQZWAYyPj36tHv0AD0F5RW+dN/7vhQe8szonWMp91OOOblHTCUlne1
         iu7C0A9dENrTVBDdDdcKni/+Zbr3O3nG2Ny9+rJDsjrRMtwnmU6WBHiCpcZTmNmCCV
         mc6DXEoVaMm4tFMlkMU+aEwav0bUIXhW7TNkfS3s=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v8 00/36] v4l: subdev internal routing and streams
Date:   Mon, 30 Aug 2021 14:00:40 +0300
Message-Id: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

This is v8 of the multiplexed streams series. v7 can be found from:

https://lore.kernel.org/linux-media/20210524104408.599645-1-tomi.valkeinen@ideasonboard.com/

The main change in this version is the implementation and use of
centralized active state for subdevs.

I have pushed my work branch to:

git://git.kernel.org/pub/scm/linux/kernel/git/tomba/linux.git multistream/work-v8

which contains the patches in this series, along with subdev drivers
using multiplexed streams.

Both this series and the branch above are based on top of today's
git://linuxtv.org/media_tree.git master.

The documentation still needs improving, but I hope the docs in this
series, and the drivers in the work branch, are enough to give the
reviewers enough information to do a review.

As can be guessed from the work branch, I have been testing this series
with TI's FPDLink setup. I have also done a "backwards compatibility"
test by dropping all multiplexed streams patches from the CAL driver
(the CSI-2 RX on the TI SoC), and using the FPDLink drivers with
single-stream configuration.

 Tomi

Jacopo Mondi (2):
  media: entity: Add iterator helper for entity pads
  media: Documentation: Add GS_ROUTING documentation

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

Tomi Valkeinen (17):
  media: subdev: rename subdev-state alloc & free
  media: subdev: add active state to struct v4l2_subdev
  media: subdev: add 'which' to subdev state
  media: subdev: pass also the active state to subdevs from ioctls
  media: subdev: add subdev state locking
  media: subdev: Add v4l2_subdev_validate(_and_lock)_state()
  media: Documentation: add documentation about subdev state
  media: subdev: increase V4L2_FRAME_DESC_ENTRY_MAX to 8
  media: add V4L2_SUBDEV_FL_MULTIPLEXED
  media: subdev: add v4l2_subdev_has_route()
  media: subdev: add v4l2_subdev_set_routing helper()
  media: subdev: add stream based configuration
  media: subdev: use streams in v4l2_subdev_link_validate()
  media: subdev: add "opposite" stream helper funcs
  media: subdev: add v4l2_subdev_get_fmt() helper function
  media: subdev: add v4l2_subdev_set_routing_with_fmt() helper
  media: subdev: add v4l2_routing_simple_verify() helper

 Documentation/driver-api/media/mc-core.rst    |  18 +-
 .../driver-api/media/v4l2-subdev.rst          |  25 +
 .../userspace-api/media/v4l/dev-subdev.rst    |   2 +
 .../userspace-api/media/v4l/user-func.rst     |   1 +
 .../v4l/vidioc-subdev-enum-frame-interval.rst |   5 +-
 .../v4l/vidioc-subdev-enum-frame-size.rst     |   5 +-
 .../v4l/vidioc-subdev-enum-mbus-code.rst      |   5 +-
 .../media/v4l/vidioc-subdev-g-crop.rst        |   5 +-
 .../media/v4l/vidioc-subdev-g-fmt.rst         |   5 +-
 .../v4l/vidioc-subdev-g-frame-interval.rst    |   5 +-
 .../media/v4l/vidioc-subdev-g-routing.rst     | 146 ++++
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
 drivers/media/platform/rcar-vin/rcar-v4l2.c   |   4 +-
 .../platform/rockchip/rkisp1/rkisp1-capture.c |   6 +-
 .../media/platform/s3c-camif/camif-capture.c  |   6 +-
 drivers/media/platform/stm32/stm32-dcmi.c     |   6 +-
 .../platform/sunxi/sun4i-csi/sun4i_dma.c      |   6 +-
 .../platform/sunxi/sun6i-csi/sun6i_video.c    |   6 +-
 drivers/media/platform/ti-vpe/cal-video.c     |   6 +-
 drivers/media/platform/vsp1/vsp1_entity.c     |   4 +-
 drivers/media/platform/vsp1/vsp1_video.c      |  18 +-
 drivers/media/platform/xilinx/xilinx-dma.c    |  20 +-
 drivers/media/platform/xilinx/xilinx-dma.h    |   2 +-
 .../media/test-drivers/vimc/vimc-capture.c    |   6 +-
 drivers/media/usb/au0828/au0828-core.c        |   8 +-
 drivers/media/v4l2-core/v4l2-ioctl.c          |  25 +-
 drivers/media/v4l2-core/v4l2-mc.c             |  43 +-
 drivers/media/v4l2-core/v4l2-subdev.c         | 735 +++++++++++++++++-
 drivers/staging/media/imx/imx-media-utils.c   |   8 +-
 drivers/staging/media/ipu3/ipu3-v4l2.c        |   6 +-
 drivers/staging/media/omap4iss/iss.c          |   2 +-
 drivers/staging/media/omap4iss/iss_video.c    |  40 +-
 drivers/staging/media/omap4iss/iss_video.h    |   2 +-
 drivers/staging/media/tegra-video/tegra210.c  |   6 +-
 drivers/staging/media/tegra-video/vi.c        |   4 +-
 include/media/media-entity.h                  | 142 +++-
 include/media/v4l2-subdev.h                   | 371 ++++++++-
 include/uapi/linux/v4l2-subdev.h              |  85 +-
 52 files changed, 1808 insertions(+), 369 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst

-- 
2.25.1

