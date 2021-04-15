Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A7213609F5
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 15:05:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233038AbhDONFe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 09:05:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233034AbhDONFd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 09:05:33 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 802B0C061574
        for <linux-media@vger.kernel.org>; Thu, 15 Apr 2021 06:05:10 -0700 (PDT)
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 14B4989A;
        Thu, 15 Apr 2021 15:05:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618491907;
        bh=eL4GyLTYDIFRXns1nEBuaJpYlMKTqwKLobXbqsNltOY=;
        h=From:To:Cc:Subject:Date:From;
        b=FaUYDTx/Bn5tEuXBHly8uoqxMA88OryLeYvDmUnXzXu9TqI2evoFXH71veMEeKvt7
         13JmCYmhdsLiudTCVgdTsTm6hfLpqNX74JXIQHZ6V/Wmvr4LlVRrjYuicSU7rOapYg
         gIXlsVV+39WhacYQ3zSDrXwf8E0NNc8c+7Tn0LvM=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v5 00/24] v4l: subdev internal routing
Date:   Thu, 15 Apr 2021 16:04:26 +0300
Message-Id: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

This is an RFC for subdev internal routing which is needed for
multiplexed streams support. I believe this is essentially a v5 of the
series, the v4 posted here:

https://lore.kernel.org/linux-media/20190328200608.9463-1-jacopo+renesas@jmondi.org/

Most of the patches are not changed (aside from fixing rebase issues
etc). The major changes in this version are:

1) Added 'which' field to the routing structs. It is currently not used,
as implementing it is not trivial. However, I think it's good to add it
to the uAPI now, and require the field to be set to
V4L2_SUBDEV_FORMAT_ACTIVE for now. See this RFC for an idea how this
could be implemented:

https://lore.kernel.org/linux-media/20210409133659.389544-1-tomi.valkeinen@ideasonboard.com/

2) No hardcoded maximum number of routes. Defining a maximum is not
possible, as there can be an arbitrary amount of routes per pad, and
there can be an arbitrary amount of pads per subdev. This series
allocates space for the routing table dynamically, which unfortunately
leads to not-just-a-few allocs and frees.

3) When searching for a format for a stream, the v4 looked for a
non-multiplexed pad only as far as the "other" side of the subdev. It
wouldn't work for a subdev which has multiplexed sink and source pads.
This series implements a "deep" get-format (v4l2_subdev_get_format_dir)
which follows a stream either towards the original source or the final
sink, while looking for a non-multiplexed pad with a format.

Some thoughts:

1) Link validation and v4l2_subdev_get_format_dir need to look at the
routing, and this leads to multiple allocs to get a copy of the routing
table. There might be a possibility here to keep a table allocated and
re-use it in consecutive get_routing calls.

Or even better, perhaps the kAPI could be changed so that allocs are not
needed. I thought about a kAPI where the subdev just returns a pointer
to its routing table, but then we hit the life-cycle problem: how to
ensure the table won't be freed or changed until the caller is done.

2) The routing uAPI is a bit vague. There is no way for the userspace to
figure out what kind of routing is allowed. Also, the existence of a
route in the routing table already indicates that the route is active,
but we also have V4L2_SUBDEV_ROUTE_FL_ACTIVE. I decided to keep
V4L2_SUBDEV_ROUTE_FL_ACTIVE for now, even if it doesn't really provide
any feature.

3) V4L2_FRAME_DESC_ENTRY_MAX is defined as 8 (I change it from 4 to 8 in
this series). This limits the number of streams per pad to 8. Preferably
the number of frame descs would be unlimited, but I didn't start
tackling this. I believe 8 is quite safe number (4 pixel streams and 4
embedded data stream).

4) Link validation ends up following the same routes multiple times, as
each stream in each subdev is validated separately.

 Tomi

Jacopo Mondi (2):
  media: entity: Add iterator helper for entity pads
  media: Documentation: Add GS_ROUTING documentation

Laurent Pinchart (4):
  media: entity: Add has_route entity operation
  media: entity: Add media_entity_has_route() function
  media: entity: Use routing information during graph traversal
  v4l: subdev: Add [GS]_ROUTING subdev ioctls and operations

Sakari Ailus (14):
  media: entity: Use pad as a starting point for graph walk
  media: entity: Use pads instead of entities in the media graph walk
    stack
  media: entity: Walk the graph based on pads
  v4l: mc: Start walk from a specific pad in use count calculation
  media: entity: Move the pipeline from entity to pads
  media: entity: Use pad as the starting point for a pipeline
  media: entity: Skip link validation for pads to which there is no
    route to
  media: entity: Add an iterator helper for connected pads
  media: entity: Add only connected pads to the pipeline
  media: entity: Add debug information in graph walk route check
  v4l: Add bus type to frame descriptors
  v4l: Add CSI-2 bus configuration to frame descriptors
  v4l: Add stream to frame descriptor
  v4l: mc: Add an S_ROUTING helper function for power state changes

Tomi Valkeinen (4):
  v4l: subdev: routing kernel helper functions
  v4l: subdev: add v4l2_subdev_get_format_dir()
  v4l: subdev: Take routing information into account in link validation
  v4l: subdev: increase V4L2_FRAME_DESC_ENTRY_MAX to 8

 Documentation/driver-api/media/mc-core.rst    |  15 +-
 .../userspace-api/media/v4l/dev-subdev.rst    |  92 +++++
 .../userspace-api/media/v4l/user-func.rst     |   1 +
 .../media/v4l/vidioc-subdev-g-routing.rst     | 143 +++++++
 drivers/media/mc/mc-device.c                  |  13 +-
 drivers/media/mc/mc-entity.c                  | 239 +++++++-----
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
 drivers/media/v4l2-core/v4l2-mc.c             |  77 ++--
 drivers/media/v4l2-core/v4l2-subdev.c         | 368 ++++++++++++++++++
 drivers/staging/media/imx/imx-media-utils.c   |   8 +-
 drivers/staging/media/ipu3/ipu3-v4l2.c        |   6 +-
 drivers/staging/media/omap4iss/iss.c          |   2 +-
 drivers/staging/media/omap4iss/iss_video.c    |  38 +-
 drivers/staging/media/omap4iss/iss_video.h    |   2 +-
 drivers/staging/media/tegra-video/tegra210.c  |   6 +-
 include/media/media-entity.h                  | 143 +++++--
 include/media/v4l2-mc.h                       |  22 ++
 include/media/v4l2-subdev.h                   |  93 ++++-
 include/uapi/linux/v4l2-subdev.h              |  44 +++
 42 files changed, 1241 insertions(+), 299 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst

-- 
2.25.1

