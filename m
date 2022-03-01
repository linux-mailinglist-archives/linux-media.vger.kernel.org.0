Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 183964C8FBE
	for <lists+linux-media@lfdr.de>; Tue,  1 Mar 2022 17:12:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235987AbiCAQNI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Mar 2022 11:13:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232844AbiCAQNG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Mar 2022 11:13:06 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90F12381AB
        for <linux-media@vger.kernel.org>; Tue,  1 Mar 2022 08:12:24 -0800 (PST)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 89AD4A67;
        Tue,  1 Mar 2022 17:12:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646151141;
        bh=wn5udhlbk6oC98SEAf6WInicSwnBk59LK1h1Fpww6cs=;
        h=From:To:Cc:Subject:Date:From;
        b=gzbCLyzDCD3pgXJxHYJNuOeHVz9mF+zO4QVPqkU6LKSyzzjYkwYYbPevsvAajWySP
         ceD3Iyd18W6+Q8vvBbTJ3jbw4hG4pGVpcDUGh3jNp1n8O4kepEZq+mQF+AIqsY96LQ
         W3Tr5qfD2RRrOkStHZFV6LJw7NRDnOZxA1p6oAFc=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v11 00/36] v4l: routing and streams support
Date:   Tue,  1 Mar 2022 18:11:20 +0200
Message-Id: <20220301161156.1119557-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Here's v11 of the streams series (used to be "multiplexed streams").

v10 can be found from:

https://lore.kernel.org/all/20211130141536.891878-1-tomi.valkeinen@ideasonboard.com/

This series is based on the v5 of the subdev active state:

https://lore.kernel.org/all/20220301105548.305191-1-tomi.valkeinen@ideasonboard.com/

My work branch with additional drivers can be found from:

git://git.kernel.org/pub/scm/linux/kernel/git/tomba/linux.git streams/work-v11

And there's also the v4l-utils series to add support to v4l2-ctl and
media-ctl:

https://lore.kernel.org/all/20211130141815.892354-1-tomi.valkeinen@ideasonboard.com/

The main changes compared to v10:

- Rebased on the v5 of the active state series, which has different
  locking system than what we had in v10 of this series.
- Moved code around in v4l2-subdev.[ch] so that the functions are inside
  the correct ifdefs
- A better route validation helper v4l2_subdev_routing_validate
- Subdev enable/disable_streams ops (see "media: v4l2-subdev: Add subdev
  .(enable|disable)_streams() operations")

There are still some comments I haven't addressed from the v10 review,
and I'd like to change the route flags a bit. We've also thought about
adding more support for drivers that don't need multiple streams but
would still use the new streams APIs to simplify the drivers.

However, as the v10 is already quite old, and I posted the v5 for the
active state, I thought it's better to also post the current version of
the streams series.

 Tomi

Jacopo Mondi (3):
  media: entity: Add iterator helper for entity pads
  media: Documentation: Add GS_ROUTING documentation
  media: subdev: Add for_each_active_route() macro

Laurent Pinchart (9):
  media: entity: Add has_route entity operation
  media: entity: Add media_entity_has_route() function
  media: entity: Use routing information during graph traversal
  media: subdev: Add [GS]_ROUTING subdev ioctls and operations
  media: subdev: Fallback to pad config in v4l2_subdev_get_fmt()
  media: subdev: add v4l2_subdev_routing_validate() helper
  media: v4l2-subdev: Add v4l2_subdev_state_xlate_streams() helper
  media: v4l2-subdev: Add subdev .(enable|disable)_streams() operations
  media: v4l2-subdev: Add v4l2_subdev_s_stream_helper() function

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

Tomi Valkeinen (11):
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

 .clang-format                                 |    1 +
 Documentation/driver-api/media/mc-core.rst    |   18 +-
 .../driver-api/media/v4l2-subdev.rst          |    8 +
 .../userspace-api/media/v4l/dev-subdev.rst    |  167 +++
 .../userspace-api/media/v4l/user-func.rst     |    1 +
 .../v4l/vidioc-subdev-enum-frame-interval.rst |    5 +-
 .../v4l/vidioc-subdev-enum-frame-size.rst     |    5 +-
 .../v4l/vidioc-subdev-enum-mbus-code.rst      |    5 +-
 .../media/v4l/vidioc-subdev-g-crop.rst        |    5 +-
 .../media/v4l/vidioc-subdev-g-fmt.rst         |    5 +-
 .../v4l/vidioc-subdev-g-frame-interval.rst    |    5 +-
 .../media/v4l/vidioc-subdev-g-routing.rst     |  150 +++
 .../media/v4l/vidioc-subdev-g-selection.rst   |    5 +-
 drivers/media/mc/mc-device.c                  |   13 +-
 drivers/media/mc/mc-entity.c                  |  270 +++--
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |    6 +-
 .../media/platform/exynos4-is/fimc-capture.c  |    8 +-
 .../platform/exynos4-is/fimc-isp-video.c      |    8 +-
 drivers/media/platform/exynos4-is/fimc-isp.c  |    2 +-
 drivers/media/platform/exynos4-is/fimc-lite.c |   10 +-
 drivers/media/platform/exynos4-is/media-dev.c |   20 +-
 drivers/media/platform/omap3isp/isp.c         |    2 +-
 drivers/media/platform/omap3isp/ispvideo.c    |   25 +-
 drivers/media/platform/omap3isp/ispvideo.h    |    2 +-
 .../media/platform/qcom/camss/camss-video.c   |    6 +-
 drivers/media/platform/rcar-vin/rcar-core.c   |   16 +-
 drivers/media/platform/rcar-vin/rcar-dma.c    |    8 +-
 .../platform/rockchip/rkisp1/rkisp1-capture.c |    6 +-
 .../media/platform/s3c-camif/camif-capture.c  |    6 +-
 drivers/media/platform/stm32/stm32-dcmi.c     |    6 +-
 .../platform/sunxi/sun4i-csi/sun4i_dma.c      |    6 +-
 .../platform/sunxi/sun6i-csi/sun6i_video.c    |    6 +-
 drivers/media/platform/ti-vpe/cal-video.c     |    6 +-
 drivers/media/platform/vsp1/vsp1_video.c      |   18 +-
 drivers/media/platform/xilinx/xilinx-dma.c    |   20 +-
 drivers/media/platform/xilinx/xilinx-dma.h    |    2 +-
 .../media/test-drivers/vimc/vimc-capture.c    |    6 +-
 drivers/media/usb/au0828/au0828-core.c        |    8 +-
 drivers/media/v4l2-core/v4l2-ioctl.c          |   25 +-
 drivers/media/v4l2-core/v4l2-mc.c             |   43 +-
 drivers/media/v4l2-core/v4l2-subdev.c         | 1002 ++++++++++++++++-
 drivers/staging/media/imx/imx-media-utils.c   |    8 +-
 drivers/staging/media/ipu3/ipu3-v4l2.c        |    6 +-
 drivers/staging/media/omap4iss/iss.c          |    2 +-
 drivers/staging/media/omap4iss/iss_video.c    |   40 +-
 drivers/staging/media/omap4iss/iss_video.h    |    2 +-
 drivers/staging/media/tegra-video/tegra210.c  |    6 +-
 include/media/media-entity.h                  |  125 +-
 include/media/v4l2-subdev.h                   |  403 ++++++-
 include/uapi/linux/v4l2-subdev.h              |   88 +-
 50 files changed, 2273 insertions(+), 343 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst

-- 
2.25.1

