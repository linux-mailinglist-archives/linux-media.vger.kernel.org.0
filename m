Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 772A758EBAB
	for <lists+linux-media@lfdr.de>; Wed, 10 Aug 2022 14:11:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231174AbiHJMLn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Aug 2022 08:11:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiHJMLm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Aug 2022 08:11:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 949256AA08
        for <linux-media@vger.kernel.org>; Wed, 10 Aug 2022 05:11:39 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 68B1E3F1;
        Wed, 10 Aug 2022 14:11:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1660133496;
        bh=jwLRosMHp9jeuCns2qYRkicfS0X83Hn356hzw8/P1EM=;
        h=From:To:Cc:Subject:Date:From;
        b=IiXxhSWq3gZI4tw8vyvt3YfBBicLWv0LxTlbQhhkHP+zNgqpGodYJ0qC4NNzI6Z+t
         PHd8leU3EwGbqgfMA7L5oW0w5DCriTEGzje3dFOqllZqh5xta70cgjlBMqz9OxVfq8
         yKLfJZ3+BqpRWMZcI9uCfwomLT41uGFrGtpo9ZFs=
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
Subject: [PATCH v13 00/34] v4l: routing and streams support
Date:   Wed, 10 Aug 2022 15:10:48 +0300
Message-Id: <20220810121122.3149086-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
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

This is v13 of the streams series. The v12 can be found from:

https://lore.kernel.org/all/20220727103639.581567-1-tomi.valkeinen@ideasonboard.com/

My work branch with additional drivers can be found from:

git://git.kernel.org/pub/scm/linux/kernel/git/tomba/linux.git streams/work-v13

And there's also the v4l-utils series v2 to add support to v4l2-ctl and
media-ctl:

https://lore.kernel.org/all/20220714132116.132498-1-tomi.valkeinen@ideasonboard.com/

Changes in v13 to v12

* media_pipeline_alloc_start: handle no mem error
* Automatically free the allocated pipeline in media_pipeline_stop()
* sanity checks for media_entity_pipeline
* improve v4l2_link_validate_get_streams (drop 'is_source')
* indent Add iterator helper for entity pads
* v4l2_subdev_set_routing: leave the current routing untouched in case of error
* v4l2_subdev_init_stream_configs: leave the current routing untouched in case of error
* Drop V4L2_SUBDEV_ROUTE_FL_IMMUTABLE
* In subdev ioctls, check that stream == 0 if subdev doesn't support streams
* Squash for_each_active_route() uses
* Add media_pad_pipeline()
* Add video device pipeline helpers and use them in the drivers
* Rename has_route to has_pad_interdep

 Tomi

Jacopo Mondi (3):
  media: mc: entity: Add iterator helper for entity pads
  media: Documentation: Add GS_ROUTING documentation
  media: subdev: Add for_each_active_route() macro

Laurent Pinchart (9):
  media: mc: entity: Merge media_entity_enum_init and
    __media_entity_enum_init
  media: mc: entity: Move media_entity_get_fwnode_pad() out of graph
    walk section
  media: mc: entity: Add media_entity_pipeline() to access the media
    pipeline
  media: mc: entity: Rewrite media_pipeline_start()
  media: subdev: Add [GS]_ROUTING subdev ioctls and operations
  media: subdev: add v4l2_subdev_routing_validate() helper
  media: v4l2-subdev: Add v4l2_subdev_state_xlate_streams() helper
  media: v4l2-subdev: Add subdev .(enable|disable)_streams() operations
  media: v4l2-subdev: Add v4l2_subdev_s_stream_helper() function

Sakari Ailus (1):
  media: Add stream to frame descriptor

Tomi Valkeinen (21):
  media: Documentation: mc: add definitions for stream and pipeline
  media: media-entity.h: add include for min()
  media: subdev: increase V4L2_FRAME_DESC_ENTRY_MAX to 8
  media: mc: entity: Rename streaming_count -> start_count
  media: v4l2-dev: Add videodev wrappers for media pipelines
  media: drivers: use video device pipeline start/stop
  media: drivers: use video_device_pipeline()
  media: mc: entity: add alloc variant of pipeline_start
  media: drivers: use video_device_pipeline_alloc_start()
  media: mc: entity: Add has_pad_interdep entity operation
  media: mc: convert pipeline funcs to take media_pad
  media: add V4L2_SUBDEV_FL_STREAMS
  media: add V4L2_SUBDEV_CAP_STREAMS
  media: subdev: add v4l2_subdev_has_pad_interdep()
  media: subdev: add v4l2_subdev_set_routing helper()
  media: Documentation: add multiplexed streams documentation
  media: subdev: add stream based configuration
  media: subdev: use streams in v4l2_subdev_link_validate()
  media: subdev: add "opposite" stream helper funcs
  media: subdev: add streams to v4l2_subdev_get_fmt() helper function
  media: subdev: add v4l2_subdev_set_routing_with_fmt() helper

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
 drivers/media/mc/mc-entity.c                  |  657 +++++++++--
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |    6 +-
 .../media/platform/qcom/camss/camss-video.c   |    6 +-
 .../platform/renesas/rcar-vin/rcar-core.c     |    5 +-
 .../platform/renesas/rcar-vin/rcar-dma.c      |   18 +-
 .../media/platform/renesas/vsp1/vsp1_video.c  |    6 +-
 .../platform/rockchip/rkisp1/rkisp1-capture.c |   14 +-
 .../samsung/exynos4-is/fimc-capture.c         |    9 +-
 .../samsung/exynos4-is/fimc-isp-video.c       |    9 +-
 .../platform/samsung/exynos4-is/fimc-lite.c   |    9 +-
 .../samsung/s3c-camif/camif-capture.c         |    6 +-
 drivers/media/platform/st/stm32/stm32-dcmi.c  |    6 +-
 .../platform/sunxi/sun4i-csi/sun4i_dma.c      |    6 +-
 .../platform/sunxi/sun6i-csi/sun6i_video.c    |    6 +-
 drivers/media/platform/ti/cal/cal-video.c     |    6 +-
 drivers/media/platform/ti/cal/cal.h           |    1 -
 drivers/media/platform/ti/omap3isp/isp.c      |    4 +-
 drivers/media/platform/ti/omap3isp/ispvideo.c |    9 +-
 drivers/media/platform/ti/omap3isp/ispvideo.h |   11 +-
 drivers/media/platform/xilinx/xilinx-dma.c    |   11 +-
 drivers/media/platform/xilinx/xilinx-dma.h    |    9 +-
 .../media/test-drivers/vimc/vimc-capture.c    |    7 +-
 drivers/media/usb/au0828/au0828-core.c        |    8 +-
 drivers/media/v4l2-core/v4l2-dev.c            |   72 ++
 drivers/media/v4l2-core/v4l2-ioctl.c          |   25 +-
 drivers/media/v4l2-core/v4l2-subdev.c         | 1038 ++++++++++++++++-
 drivers/staging/media/imx/imx-media-utils.c   |    8 +-
 drivers/staging/media/ipu3/ipu3-v4l2.c        |    6 +-
 drivers/staging/media/omap4iss/iss.c          |    4 +-
 drivers/staging/media/omap4iss/iss_video.c    |    9 +-
 drivers/staging/media/omap4iss/iss_video.h    |   11 +-
 drivers/staging/media/tegra-video/tegra210.c  |    6 +-
 include/media/media-device.h                  |   15 -
 include/media/media-entity.h                  |  162 ++-
 include/media/v4l2-dev.h                      |  104 ++
 include/media/v4l2-subdev.h                   |  382 +++++-
 include/uapi/linux/v4l2-subdev.h              |   82 +-
 51 files changed, 2827 insertions(+), 328 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst

-- 
2.34.1

