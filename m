Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C61A582475
	for <lists+linux-media@lfdr.de>; Wed, 27 Jul 2022 12:37:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231607AbiG0KhC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jul 2022 06:37:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbiG0KhA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jul 2022 06:37:00 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A21FC422D8
        for <linux-media@vger.kernel.org>; Wed, 27 Jul 2022 03:36:59 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5ECCD835;
        Wed, 27 Jul 2022 12:36:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1658918216;
        bh=FmvaPbyH3XdTWbZH+lfl++qBf2Tbw6qhMTZt7iirmv8=;
        h=From:To:Cc:Subject:Date:From;
        b=FvZcXGGefz0EP1l60zpECzA6dYUGxOCSdHGYfoz1ug7so2QAoQ55Xuzl+pYvdz1J3
         5Pxg4Ow6biy29nrpwI9FotlDJHRZ2gekB92zGxhCQQ1dyhknnNLNwWM3rV48c91o8N
         XMwdjlpbwtQ4Yo00iBQdGm0t1l6yfrDw142FivxY=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v12 00/30] v4l: routing and streams support
Date:   Wed, 27 Jul 2022 13:36:09 +0300
Message-Id: <20220727103639.581567-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

This is v12 of the streams series. The v11 can be found from:

https://lore.kernel.org/all/20220301161156.1119557-1-tomi.valkeinen@ideasonboard.com/

My work branch with additional drivers can be found from:

git://git.kernel.org/pub/scm/linux/kernel/git/tomba/linux.git streams/work-v12

And there's also the v4l-utils series v2 to add support to v4l2-ctl and
media-ctl:

https://lore.kernel.org/all/20220714132116.132498-1-tomi.valkeinen@ideasonboard.com/

Changes in v12:

- Rebased on top of upstream (media graph walk changes, subdev active
  state changes)

- V4L2_SUBDEV_FL_MULTIPLEXED renamed to V4L2_SUBDEV_FL_STREAMS

- V4L2_SUBDEV_CAP_MPLEXED renamed to V4L2_SUBDEV_CAP_STREAMS

- Limit Stream ID number to max 63

- Added v4l2_subdev_state_get_stream_crop() and
  v4l2_subdev_state_get_stream_compose()

- Use BIT_ULL() instead of BIT() for 64bit masks.

- Some documentation improvements

- All the patches related to modifying the graph walk have been dropped
  and there is a new implementation of the pipeline construction in
  __media_pipeline_start.

- The change which made media_pipeline_start() take a pad instead of an
  entity has been dropped.

- New pipeline start/stop functions, media_pipeline_alloc_start() &
  media_pipeline_stop_free()

There are still open discussion items wrt. the uAPI. I will post a mail
in reply to this cover letter about those items.

 Tomi

Jacopo Mondi (3):
  media: mc: entity: Add iterator helper for entity pads
  media: Documentation: Add GS_ROUTING documentation
  media: subdev: Add for_each_active_route() macro

Laurent Pinchart (10):
  media: mc: entity: Merge media_entity_enum_init and
    __media_entity_enum_init
  media: mc: entity: Move media_entity_get_fwnode_pad() out of graph
    walk section
  media: mc: entity: Add media_entity_pipeline() to access the media
    pipeline
  media: mc: entity: Add has_route entity operation and
    media_entity_has_route() helper
  media: mc: entity: Rewrite media_pipeline_start() to support routes
  media: subdev: Add [GS]_ROUTING subdev ioctls and operations
  media: subdev: add v4l2_subdev_routing_validate() helper
  media: v4l2-subdev: Add v4l2_subdev_state_xlate_streams() helper
  media: v4l2-subdev: Add subdev .(enable|disable)_streams() operations
  media: v4l2-subdev: Add v4l2_subdev_s_stream_helper() function

Sakari Ailus (1):
  media: Add stream to frame descriptor

Tomi Valkeinen (16):
  media: Documentation: mc: add definitions for stream and pipeline
  media: mc: entity: Rename streaming_count -> start_count
  media: mc: entity: add media_pipeline_alloc_start &
    media_pipeline_stop_free
  media: add V4L2_SUBDEV_FL_STREAMS
  media: add V4L2_SUBDEV_CAP_MPLEXED
  media: subdev: add v4l2_subdev_has_route()
  media: subdev: add v4l2_subdev_set_routing helper()
  media: Documentation: add multiplexed streams documentation
  media: subdev: add stream based configuration
  media: subdev: use streams in v4l2_subdev_link_validate()
  media: subdev: add "opposite" stream helper funcs
  media: subdev: add streams to v4l2_subdev_get_fmt() helper function
  media: subdev: add v4l2_subdev_set_routing_with_fmt() helper
  media: subdev: use for_each_active_route() in
    v4l2_subdev_init_stream_configs()
  media: subdev: use for_each_active_route() in
    v4l2_link_validate_get_streams()
  media: subdev: increase V4L2_FRAME_DESC_ENTRY_MAX to 8

 .clang-format                                 |    1 +
 Documentation/driver-api/media/mc-core.rst    |   19 +-
 .../driver-api/media/v4l2-subdev.rst          |    8 +
 .../userspace-api/media/v4l/dev-subdev.rst    |  175 +++
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
 drivers/media/mc/mc-entity.c                  |  646 +++++++++--
 .../platform/renesas/rcar-vin/rcar-core.c     |    5 +-
 .../platform/renesas/rcar-vin/rcar-dma.c      |    2 +-
 .../platform/rockchip/rkisp1/rkisp1-capture.c |    4 +-
 drivers/media/platform/ti/omap3isp/isp.c      |    4 +-
 drivers/media/platform/ti/omap3isp/ispvideo.c |    3 +-
 drivers/media/platform/ti/omap3isp/ispvideo.h |   11 +-
 drivers/media/platform/xilinx/xilinx-dma.c    |    3 +-
 drivers/media/platform/xilinx/xilinx-dma.h    |    7 +-
 drivers/media/v4l2-core/v4l2-ioctl.c          |   25 +-
 drivers/media/v4l2-core/v4l2-subdev.c         | 1033 ++++++++++++++++-
 drivers/staging/media/imx/imx-media-utils.c   |    2 +-
 drivers/staging/media/omap4iss/iss.c          |    4 +-
 drivers/staging/media/omap4iss/iss_video.c    |    3 +-
 drivers/staging/media/omap4iss/iss_video.h    |   11 +-
 include/media/media-device.h                  |   15 -
 include/media/media-entity.h                  |  130 ++-
 include/media/v4l2-subdev.h                   |  381 +++++-
 include/uapi/linux/v4l2-subdev.h              |   88 +-
 33 files changed, 2559 insertions(+), 220 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst

-- 
2.34.1

