Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEBE3363701
	for <lists+linux-media@lfdr.de>; Sun, 18 Apr 2021 19:32:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230028AbhDRRdH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Apr 2021 13:33:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229783AbhDRRdG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Apr 2021 13:33:06 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31BC0C06174A
        for <linux-media@vger.kernel.org>; Sun, 18 Apr 2021 10:32:38 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9C5944AB;
        Sun, 18 Apr 2021 19:32:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618767154;
        bh=GlUSOpDWJXIsh8C2OOUBbjeRg2h6L8762+3D1Nngdok=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=upMcDaDcmoTrCns9lu/3vzFBnR5g82xsbhSpc2z9bePAsLE+GSSjwAVbgJe9HKhP7
         Fcu1/V4cx887nQ96cggyk7tbDT+4WNIm0g4duShGnZ7OZ0bUO3YIFprsHueYxVshxO
         u3fWNHSO2Fjt2n4irA7tw9ESyFhQb3FVEGNIfx+I=
Date:   Sun, 18 Apr 2021 20:32:31 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v5 00/24] v4l: subdev internal routing
Message-ID: <YHxtL6CM+AaV9+AG@pendragon.ideasonboard.com>
References: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Nice to see a v5 of this plagued patch series :-)

On Thu, Apr 15, 2021 at 04:04:26PM +0300, Tomi Valkeinen wrote:
> Hi,
> 
> This is an RFC for subdev internal routing which is needed for
> multiplexed streams support. I believe this is essentially a v5 of the
> series, the v4 posted here:
> 
> https://lore.kernel.org/linux-media/20190328200608.9463-1-jacopo+renesas@jmondi.org/
> 
> Most of the patches are not changed (aside from fixing rebase issues
> etc). The major changes in this version are:
> 
> 1) Added 'which' field to the routing structs. It is currently not used,
> as implementing it is not trivial. However, I think it's good to add it
> to the uAPI now, and require the field to be set to
> V4L2_SUBDEV_FORMAT_ACTIVE for now. See this RFC for an idea how this
> could be implemented:
> 
> https://lore.kernel.org/linux-media/20210409133659.389544-1-tomi.valkeinen@ideasonboard.com/

I've reviewed that, and I like it, but it's not straightforward to
understand from that patch how you envision TRY to be implemented.

> 2) No hardcoded maximum number of routes. Defining a maximum is not
> possible, as there can be an arbitrary amount of routes per pad, and
> there can be an arbitrary amount of pads per subdev. This series
> allocates space for the routing table dynamically, which unfortunately
> leads to not-just-a-few allocs and frees.
> 
> 3) When searching for a format for a stream, the v4 looked for a
> non-multiplexed pad only as far as the "other" side of the subdev. It
> wouldn't work for a subdev which has multiplexed sink and source pads.
> This series implements a "deep" get-format (v4l2_subdev_get_format_dir)
> which follows a stream either towards the original source or the final
> sink, while looking for a non-multiplexed pad with a format.
> 
> Some thoughts:
> 
> 1) Link validation and v4l2_subdev_get_format_dir need to look at the
> routing, and this leads to multiple allocs to get a copy of the routing
> table. There might be a possibility here to keep a table allocated and
> re-use it in consecutive get_routing calls.
> 
> Or even better, perhaps the kAPI could be changed so that allocs are not
> needed. I thought about a kAPI where the subdev just returns a pointer
> to its routing table, but then we hit the life-cycle problem: how to
> ensure the table won't be freed or changed until the caller is done.

Storing the routing table in the v4l2_subdev_config (or
v4l2_subdev_state) would be one way to do so, and I'd like to explore
that direction. State lifetime is indeed an issue, and one simple option
would be to just take the graph lock to modify the routing.

> 2) The routing uAPI is a bit vague. There is no way for the userspace to
> figure out what kind of routing is allowed. Also, the existence of a
> route in the routing table already indicates that the route is active,
> but we also have V4L2_SUBDEV_ROUTE_FL_ACTIVE. I decided to keep
> V4L2_SUBDEV_ROUTE_FL_ACTIVE for now, even if it doesn't really provide
> any feature.

We can't report all possible routes if we take streams into account, but
maybe we could report all possible routes between pads ? This could go
through a separate ioctl.

> 3) V4L2_FRAME_DESC_ENTRY_MAX is defined as 8 (I change it from 4 to 8 in
> this series). This limits the number of streams per pad to 8. Preferably
> the number of frame descs would be unlimited, but I didn't start
> tackling this. I believe 8 is quite safe number (4 pixel streams and 4
> embedded data stream).

A more dynamic solution would be nice, but if this is internal to the
kernel, I suppose we can stored with a fixed limit.

> 4) Link validation ends up following the same routes multiple times, as
> each stream in each subdev is validated separately.

Caching routes would likely be too much trouble for too little gain. If
we can avoid the allocation of routing tables every time, then I think
this is an acceptable limitation.

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
> Sakari Ailus (14):
>   media: entity: Use pad as a starting point for graph walk
>   media: entity: Use pads instead of entities in the media graph walk
>     stack
>   media: entity: Walk the graph based on pads
>   v4l: mc: Start walk from a specific pad in use count calculation
>   media: entity: Move the pipeline from entity to pads
>   media: entity: Use pad as the starting point for a pipeline
>   media: entity: Skip link validation for pads to which there is no
>     route to
>   media: entity: Add an iterator helper for connected pads
>   media: entity: Add only connected pads to the pipeline
>   media: entity: Add debug information in graph walk route check
>   v4l: Add bus type to frame descriptors
>   v4l: Add CSI-2 bus configuration to frame descriptors
>   v4l: Add stream to frame descriptor
>   v4l: mc: Add an S_ROUTING helper function for power state changes
> 
> Tomi Valkeinen (4):
>   v4l: subdev: routing kernel helper functions
>   v4l: subdev: add v4l2_subdev_get_format_dir()
>   v4l: subdev: Take routing information into account in link validation
>   v4l: subdev: increase V4L2_FRAME_DESC_ENTRY_MAX to 8
> 
>  Documentation/driver-api/media/mc-core.rst    |  15 +-
>  .../userspace-api/media/v4l/dev-subdev.rst    |  92 +++++
>  .../userspace-api/media/v4l/user-func.rst     |   1 +
>  .../media/v4l/vidioc-subdev-g-routing.rst     | 143 +++++++
>  drivers/media/mc/mc-device.c                  |  13 +-
>  drivers/media/mc/mc-entity.c                  | 239 +++++++-----
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
>  drivers/media/v4l2-core/v4l2-mc.c             |  77 ++--
>  drivers/media/v4l2-core/v4l2-subdev.c         | 368 ++++++++++++++++++
>  drivers/staging/media/imx/imx-media-utils.c   |   8 +-
>  drivers/staging/media/ipu3/ipu3-v4l2.c        |   6 +-
>  drivers/staging/media/omap4iss/iss.c          |   2 +-
>  drivers/staging/media/omap4iss/iss_video.c    |  38 +-
>  drivers/staging/media/omap4iss/iss_video.h    |   2 +-
>  drivers/staging/media/tegra-video/tegra210.c  |   6 +-
>  include/media/media-entity.h                  | 143 +++++--
>  include/media/v4l2-mc.h                       |  22 ++
>  include/media/v4l2-subdev.h                   |  93 ++++-
>  include/uapi/linux/v4l2-subdev.h              |  44 +++
>  42 files changed, 1241 insertions(+), 299 deletions(-)
>  create mode 100644 Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst

-- 
Regards,

Laurent Pinchart
