Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7264239CBCC
	for <lists+linux-media@lfdr.de>; Sun,  6 Jun 2021 02:06:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230091AbhFFAIV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Jun 2021 20:08:21 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:50048 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230050AbhFFAIV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 5 Jun 2021 20:08:21 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C010A3E7;
        Sun,  6 Jun 2021 02:06:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1622937991;
        bh=z2sU8xCkB4qccDAQtlcutbrkZmRNCusqgbIqpnCsS7Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uuFO/lKfYm81ArOqhWhi0J5/tbVjgIiPNXpnOTs62++/YTghLIfeGcX83Skdyba3A
         t6XJpOXIxeM/GciLBmvnWNve+K8BMbVxuKG4AQvfiuUGIpiTKoAjlPUugLfMEI3SLe
         O6uYd3unMPNJ4dx96X7Ap6M2iJIWSET1XEsD0wiA=
Date:   Sun, 6 Jun 2021 03:06:18 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: Re: [PATCH v7 00/27] v4l: subdev internal routing and streams
Message-ID: <YLwReuwLm7S/4hgz@pendragon.ideasonboard.com>
References: <20210524104408.599645-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210524104408.599645-1-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans, Sakari,

We need your feedback on this series, at least on the general approach.
There are quite a few issues to be addressed, and it makes no sense to
invest time in this if you don't think this is a good direction.

If anyone else wants to give feedback, speak now or forever hold your
peace :-)

On Mon, May 24, 2021 at 01:43:41PM +0300, Tomi Valkeinen wrote:
> Hi,
> 
> This is v7 of the series, the previous one is:
> 
> https://lore.kernel.org/linux-media/20210427124523.990938-1-tomi.valkeinen@ideasonboard.com/
> 
> In this version I have changed the approach to multiplexed streams, and
> I went with the approach described in the RFC I sent:
> 
> https://lore.kernel.org/linux-media/20210507123558.146948-1-tomi.valkeinen@ideasonboard.com/
> 
> The main change is that in this series each pad+stream combination can
> have its own configuration, versus only pad having its own
> configuration. In other words, a pad with 4 streams will contain 4
> configurations.
> 
> The patches up to and including "v4l: Add stream to frame descriptor"
> are the same as previously, except changes done according to the review
> comments. After that, the new pad+stream approach is implemented.
> 
> This series is based on the subdev-wide state change:
> 
> https://lore.kernel.org/linux-media/20210519091558.562318-1-tomi.valkeinen@ideasonboard.com/
> 
>  Tomi
> 
> Jacopo Mondi (2):
>   media: entity: Add iterator helper for entity pads
>   media: Documentation: Add GS_ROUTING documentation
> 
> Laurent Pinchart (4):
>   media: entity: Add has_route entity operation
>   media: entity: Add media_entity_has_route() function
>   media: entity: Use routing information during graph traversal
>   v4l: subdev: Add [GS]_ROUTING subdev ioctls and operations
> 
> Sakari Ailus (13):
>   media: entity: Use pad as a starting point for graph walk
>   media: entity: Use pads instead of entities in the media graph walk
>     stack
>   media: entity: Walk the graph based on pads
>   v4l: mc: Start walk from a specific pad in use count calculation
>   media: entity: Move the pipeline from entity to pads
>   media: entity: Use pad as the starting point for a pipeline
>   media: entity: Skip link validation for pads to which there is no
>     route
>   media: entity: Add an iterator helper for connected pads
>   media: entity: Add only connected pads to the pipeline
>   media: entity: Add debug information in graph walk route check
>   v4l: Add bus type to frame descriptors
>   v4l: Add CSI-2 bus configuration to frame descriptors
>   v4l: Add stream to frame descriptor
> 
> Tomi Valkeinen (8):
>   v4l: subdev: add V4L2_SUBDEV_ROUTE_FL_SOURCE
>   v4l: subdev: routing kernel helper functions
>   v4l: subdev: add stream based configuration
>   v4l: subdev: add 'stream' to subdev ioctls
>   v4l: subdev: use streams in v4l2_subdev_link_validate()
>   v4l: subdev: add routing & stream config to v4l2_subdev_state
>   v4l: subdev: add V4L2_SUBDEV_FL_MULTIPLEXED
>   v4l: subdev: increase V4L2_FRAME_DESC_ENTRY_MAX to 8
> 
>  Documentation/driver-api/media/mc-core.rst    |  15 +-
>  .../userspace-api/media/v4l/dev-subdev.rst    | 128 ++++++
>  .../userspace-api/media/v4l/user-func.rst     |   1 +
>  .../v4l/vidioc-subdev-enum-frame-interval.rst |   5 +-
>  .../v4l/vidioc-subdev-enum-frame-size.rst     |   5 +-
>  .../v4l/vidioc-subdev-enum-mbus-code.rst      |   5 +-
>  .../media/v4l/vidioc-subdev-g-crop.rst        |   5 +-
>  .../media/v4l/vidioc-subdev-g-fmt.rst         |   5 +-
>  .../v4l/vidioc-subdev-g-frame-interval.rst    |   5 +-
>  .../media/v4l/vidioc-subdev-g-routing.rst     | 142 +++++++
>  .../media/v4l/vidioc-subdev-g-selection.rst   |   5 +-
>  drivers/media/mc/mc-device.c                  |  13 +-
>  drivers/media/mc/mc-entity.c                  | 257 +++++++-----
>  drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |   6 +-
>  .../media/platform/exynos4-is/fimc-capture.c  |   8 +-
>  .../platform/exynos4-is/fimc-isp-video.c      |   8 +-
>  drivers/media/platform/exynos4-is/fimc-isp.c  |   2 +-
>  drivers/media/platform/exynos4-is/fimc-lite.c |  10 +-
>  drivers/media/platform/exynos4-is/media-dev.c |  20 +-
>  drivers/media/platform/omap3isp/isp.c         |   2 +-
>  drivers/media/platform/omap3isp/ispvideo.c    |  25 +-
>  drivers/media/platform/omap3isp/ispvideo.h    |   2 +-
>  .../media/platform/qcom/camss/camss-video.c   |   6 +-
>  drivers/media/platform/rcar-vin/rcar-core.c   |  16 +-
>  drivers/media/platform/rcar-vin/rcar-dma.c    |   8 +-
>  .../platform/rockchip/rkisp1/rkisp1-capture.c |   6 +-
>  .../media/platform/s3c-camif/camif-capture.c  |   6 +-
>  drivers/media/platform/stm32/stm32-dcmi.c     |   6 +-
>  .../platform/sunxi/sun4i-csi/sun4i_dma.c      |   6 +-
>  .../platform/sunxi/sun6i-csi/sun6i_video.c    |   6 +-
>  drivers/media/platform/ti-vpe/cal-video.c     |   6 +-
>  drivers/media/platform/vsp1/vsp1_video.c      |  18 +-
>  drivers/media/platform/xilinx/xilinx-dma.c    |  20 +-
>  drivers/media/platform/xilinx/xilinx-dma.h    |   2 +-
>  .../media/test-drivers/vimc/vimc-capture.c    |   6 +-
>  drivers/media/usb/au0828/au0828-core.c        |   8 +-
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  25 +-
>  drivers/media/v4l2-core/v4l2-mc.c             |  43 +-
>  drivers/media/v4l2-core/v4l2-subdev.c         | 396 +++++++++++++++++-
>  drivers/staging/media/imx/imx-media-utils.c   |   8 +-
>  drivers/staging/media/ipu3/ipu3-v4l2.c        |   6 +-
>  drivers/staging/media/omap4iss/iss.c          |   2 +-
>  drivers/staging/media/omap4iss/iss_video.c    |  40 +-
>  drivers/staging/media/omap4iss/iss_video.h    |   2 +-
>  drivers/staging/media/tegra-video/tegra210.c  |   6 +-
>  include/media/media-entity.h                  | 142 +++++--
>  include/media/v4l2-subdev.h                   | 204 ++++++++-
>  include/uapi/linux/v4l2-subdev.h              |  76 +++-
>  48 files changed, 1410 insertions(+), 334 deletions(-)
>  create mode 100644 Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst

-- 
Regards,

Laurent Pinchart
