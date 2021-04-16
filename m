Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCC2E361BDE
	for <lists+linux-media@lfdr.de>; Fri, 16 Apr 2021 11:00:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235252AbhDPIjI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Apr 2021 04:39:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232442AbhDPIjH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Apr 2021 04:39:07 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74E89C061574
        for <linux-media@vger.kernel.org>; Fri, 16 Apr 2021 01:38:42 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id r128so16545637lff.4
        for <linux-media@vger.kernel.org>; Fri, 16 Apr 2021 01:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=UNA1T6PrEaErBuNVdlU0+7uVqtMql6t6JHNtLXLfvVY=;
        b=jCu4OrpF4ET/urv5urLQTQ/CFAKMbQ/wPXWTuR//jZVoZXtFm3UTtbzSQ1MynZee3I
         hnd1Mv2LLKAAby/DaWwIzZAXPt4Pq0ZlTqmzVSqP1K7LMTDAwvQxv3noa1DcDn11soWc
         WVgMAk5q+oefn0EONUfr+Xf32NsLizmQ46IjqAlQLcpxnwnOBxR93OpGZA+TYqjKTEX1
         BnMdQePgVHaEdbIpN/fVlM5Bop6rgFEV3JvXaA2ytjAbmmOku0g0KvISXUTmnyNBw76M
         UL9q41P8TyIY3mqSyvB5u4OxeQZktnT9MKDBgugqk/2Yg+Psd5lLH8DeWJxlqoOy8vBm
         uSgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=UNA1T6PrEaErBuNVdlU0+7uVqtMql6t6JHNtLXLfvVY=;
        b=j9oPZkKALbqEKA4Mgz0S2xpGByqmXwEkkU0jeco8gek5/nOQpF7exnQ/aKnlx8RVpT
         jXztAHuGuCsMmBAkzGuuJjwovzz9UXhUp8DVIHBeCSNnMwfBmTYTYAPy/aS0zmXR1asP
         +5TpYYpFtYkfz34aZ9Q8a+MeIqYTGBcKU+uCqMnnOOeaKMw7+cluUMnRq48jkJ0p0kQV
         XxovMfmDZhNPBGLrB7QMfNUH/dIFRYmHEweqJYKPAJxHNvtndVu372Q4Prtq6N4mgRdU
         abg8C5u9/W/Vrciv3b/Izugv6g9ob2ySGHhcvTzkpS5/qFhJw8GfLGxUhsGkO+748v41
         HROQ==
X-Gm-Message-State: AOAM533MQ39gfg6a7xxBEWwY2QCDBRQfb4vjAhN1/aKfzhP88dgR7y3v
        NgwLTVwip2JtOWgXTnGGig7zRw==
X-Google-Smtp-Source: ABdhPJylR8TBpCW0wUfUUFIQnVXI+wPQzYMkQc5i0DDsv14dvhYURw8bOgQAgRiv8h5cYy6qPfypXQ==
X-Received: by 2002:a05:6512:3f2a:: with SMTP id y42mr2191034lfa.234.1618562320943;
        Fri, 16 Apr 2021 01:38:40 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id d25sm870320ljg.96.2021.04.16.01.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 01:38:40 -0700 (PDT)
Date:   Fri, 16 Apr 2021 10:38:39 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v5 00/24] v4l: subdev internal routing
Message-ID: <YHlND8NhEs+lkDZB@oden.dyn.berto.se>
References: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

I'm very happy to see this being worked on again!

Is there code somewhere that demonstrates the v5 API in use? I still 
have old branches of this series and it would be nice to see how the API 
have evolved for drivers.

Likewise are there some user-space code around that can be used to test 
the API? For v2 and v3 I had some hack patches [1], do they still work?  
More likely they have gone stale by now :-)

1. git://git.ragnatech.se/v4l-utils routing

On 2021-04-15 16:04:26 +0300, Tomi Valkeinen wrote:
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
> 
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
> 
> 2) The routing uAPI is a bit vague. There is no way for the userspace to
> figure out what kind of routing is allowed. Also, the existence of a
> route in the routing table already indicates that the route is active,
> but we also have V4L2_SUBDEV_ROUTE_FL_ACTIVE. I decided to keep
> V4L2_SUBDEV_ROUTE_FL_ACTIVE for now, even if it doesn't really provide
> any feature.
> 
> 3) V4L2_FRAME_DESC_ENTRY_MAX is defined as 8 (I change it from 4 to 8 in
> this series). This limits the number of streams per pad to 8. Preferably
> the number of frame descs would be unlimited, but I didn't start
> tackling this. I believe 8 is quite safe number (4 pixel streams and 4
> embedded data stream).
> 
> 4) Link validation ends up following the same routes multiple times, as
> each stream in each subdev is validated separately.
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
> 
> -- 
> 2.25.1
> 

-- 
Regards,
Niklas Söderlund
