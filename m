Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB7D538E44D
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 12:44:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232584AbhEXKpw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 May 2021 06:45:52 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60804 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232422AbhEXKpw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 May 2021 06:45:52 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 054F0140C;
        Mon, 24 May 2021 12:44:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621853062;
        bh=SUizTomL128MIBXQoEsUKulMEASr8z9wEK5RNLlHBfM=;
        h=From:To:Cc:Subject:Date:From;
        b=rOcsokpj70YmOTIyE/JdG0QVrHc+7SkAlQ09OTzBinVP6C06ZXP+PtjfGIp0BCjwF
         GX7bV9J3lpt4vjvWGs0wpDj53SjSeiXVfdwehYvyA/N1/njwxZ3x9k7rXjC4VXVAGl
         bzFV5RMP1yuiclMEDiwGDp+u0WiOvZxd29v6afIM=
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
Subject: [PATCH v7 00/27] v4l: subdev internal routing and streams
Date:   Mon, 24 May 2021 13:43:41 +0300
Message-Id: <20210524104408.599645-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

This is v7 of the series, the previous one is:

https://lore.kernel.org/linux-media/20210427124523.990938-1-tomi.valkeinen@ideasonboard.com/

In this version I have changed the approach to multiplexed streams, and
I went with the approach described in the RFC I sent:

https://lore.kernel.org/linux-media/20210507123558.146948-1-tomi.valkeinen@ideasonboard.com/

The main change is that in this series each pad+stream combination can
have its own configuration, versus only pad having its own
configuration. In other words, a pad with 4 streams will contain 4
configurations.

The patches up to and including "v4l: Add stream to frame descriptor"
are the same as previously, except changes done according to the review
comments. After that, the new pad+stream approach is implemented.

This series is based on the subdev-wide state change:

https://lore.kernel.org/linux-media/20210519091558.562318-1-tomi.valkeinen@ideasonboard.com/

 Tomi

Jacopo Mondi (2):
  media: entity: Add iterator helper for entity pads
  media: Documentation: Add GS_ROUTING documentation

Laurent Pinchart (4):
  media: entity: Add has_route entity operation
  media: entity: Add media_entity_has_route() function
  media: entity: Use routing information during graph traversal
  v4l: subdev: Add [GS]_ROUTING subdev ioctls and operations

Sakari Ailus (13):
  media: entity: Use pad as a starting point for graph walk
  media: entity: Use pads instead of entities in the media graph walk
    stack
  media: entity: Walk the graph based on pads
  v4l: mc: Start walk from a specific pad in use count calculation
  media: entity: Move the pipeline from entity to pads
  media: entity: Use pad as the starting point for a pipeline
  media: entity: Skip link validation for pads to which there is no
    route
  media: entity: Add an iterator helper for connected pads
  media: entity: Add only connected pads to the pipeline
  media: entity: Add debug information in graph walk route check
  v4l: Add bus type to frame descriptors
  v4l: Add CSI-2 bus configuration to frame descriptors
  v4l: Add stream to frame descriptor

Tomi Valkeinen (8):
  v4l: subdev: add V4L2_SUBDEV_ROUTE_FL_SOURCE
  v4l: subdev: routing kernel helper functions
  v4l: subdev: add stream based configuration
  v4l: subdev: add 'stream' to subdev ioctls
  v4l: subdev: use streams in v4l2_subdev_link_validate()
  v4l: subdev: add routing & stream config to v4l2_subdev_state
  v4l: subdev: add V4L2_SUBDEV_FL_MULTIPLEXED
  v4l: subdev: increase V4L2_FRAME_DESC_ENTRY_MAX to 8

 Documentation/driver-api/media/mc-core.rst    |  15 +-
 .../userspace-api/media/v4l/dev-subdev.rst    | 128 ++++++
 .../userspace-api/media/v4l/user-func.rst     |   1 +
 .../v4l/vidioc-subdev-enum-frame-interval.rst |   5 +-
 .../v4l/vidioc-subdev-enum-frame-size.rst     |   5 +-
 .../v4l/vidioc-subdev-enum-mbus-code.rst      |   5 +-
 .../media/v4l/vidioc-subdev-g-crop.rst        |   5 +-
 .../media/v4l/vidioc-subdev-g-fmt.rst         |   5 +-
 .../v4l/vidioc-subdev-g-frame-interval.rst    |   5 +-
 .../media/v4l/vidioc-subdev-g-routing.rst     | 142 +++++++
 .../media/v4l/vidioc-subdev-g-selection.rst   |   5 +-
 drivers/media/mc/mc-device.c                  |  13 +-
 drivers/media/mc/mc-entity.c                  | 257 +++++++-----
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
 drivers/media/v4l2-core/v4l2-subdev.c         | 396 +++++++++++++++++-
 drivers/staging/media/imx/imx-media-utils.c   |   8 +-
 drivers/staging/media/ipu3/ipu3-v4l2.c        |   6 +-
 drivers/staging/media/omap4iss/iss.c          |   2 +-
 drivers/staging/media/omap4iss/iss_video.c    |  40 +-
 drivers/staging/media/omap4iss/iss_video.h    |   2 +-
 drivers/staging/media/tegra-video/tegra210.c  |   6 +-
 include/media/media-entity.h                  | 142 +++++--
 include/media/v4l2-subdev.h                   | 204 ++++++++-
 include/uapi/linux/v4l2-subdev.h              |  76 +++-
 48 files changed, 1410 insertions(+), 334 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst

-- 
2.25.1

