Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3289542935F
	for <lists+linux-media@lfdr.de>; Mon, 11 Oct 2021 17:29:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237571AbhJKPbe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Oct 2021 11:31:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231951AbhJKPbd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Oct 2021 11:31:33 -0400
Received: from lb2-smtp-cloud8.xs4all.net (lb2-smtp-cloud8.xs4all.net [IPv6:2001:888:0:108::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 375A1C061570
        for <linux-media@vger.kernel.org>; Mon, 11 Oct 2021 08:29:32 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id ZxEymlitSx7rIZxF1mJKpg; Mon, 11 Oct 2021 17:29:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1633966169; bh=L4ZLGCZ40x/ogdBNyjadB9MbVye7e8Sbj2mpLbfE4eY=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=p2I74GAwxo4MmxrsR98Yv85jjiwiNGDALnX62oCX7E7nCKXRbQt9XVj330GB5HC0i
         YEMIPzZpLQwPWVJovdVyr9mys0Y07s4twLnPVinF+zDUr6DJufPryOgL2VlAcmMtF1
         GZsN7D4jFfOs5WpKZQX1wjZjSbzGPYlJcfNuzjSo/jrsUmePy+Bbm9pkVzZiPcgUfd
         OxystOlW5K7MxsMQfPPLKsJn7czaqr3ZCIksL0zuxKQXNRGphM5vs3NSHy0f6vRjdj
         z10e9nfZPIbCNvIZkrIncVO3DINL/0OkVxwWJOFpIwDQicBuvJUfbJkgkfbGMdk7qY
         S5wUC2R378pag==
Subject: Re: [PATCH v9 00/36] v4l: subdev internal routing and streams
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <6c1dfc4d-ec8a-6643-b768-5fe507da495d@xs4all.nl>
Date:   Mon, 11 Oct 2021 17:29:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfLpmLkTJaptHp7gtGIQFflrrkxtgRLugi+Thlzsk1txXNPjaT38hYGJVKA0bwoJzivkNihWRG3arsCbl35CALUrlupnmIR8WYNJNUotEFoSyDKfwW7uB
 +CMA0SLxGkipnMuoDAhkxgEncP/2AUZAo823qtDoTcsSnpUh8yOHnBgzEdmP9sdS8vaUstcLJj9FBhQJfW9oABj5NMMWDNtPleMy2onxW+ZbsLRWv3w+rgwS
 3Ho4vK+MQIVgPmMV6GYMz4fCKVzGTS4IiJPyGjMqk7sKmisDrC1t2CDWp7w6Ps2O3TIo66FouypHOFbE9euXRwX555tbMj+TwfUY1ujAZ0RdXVKnow1YyKEm
 05B2SXuDbSvmBlmbx3p1cQsByUS1ymkl7dKmVMEFIm4PFhalPWs0/Xw9prkqC+z1nd/rnI9TdsvdtZF5Nk4RS0tuABhAbml558I8ARF9yZ3t4be+Fjgxm44C
 H+/CiuZyKsSaWISy4FE0UkTKELhRtSaKBm6drw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On 05/10/2021 10:57, Tomi Valkeinen wrote:
> Hi,
> 
> This is v9 of the multiplexed streams series. v8 can be found from:
> 
> https://lore.kernel.org/all/20210830110116.488338-1-tomi.valkeinen@ideasonboard.com/
> 
> I have pushed my work branch to:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/tomba/linux.git multistream/work-v9
> 
> which contains the patches in this series, along with subdev drivers
> using multiplexed streams.
> 
> As can be guessed from the work branch, I have been testing this series
> with TI's FPDLink setup. I have also done a "backwards compatibility"
> test by dropping all multiplexed streams patches from the CAL driver
> (the CSI-2 RX on the TI SoC), and using the FPDLink drivers with
> single-stream configuration.

I hope to look at this series this week (fingers crossed), but I was asked to
give some input w.r.t. testing of this series:

I think before this can be merged we need:

1) libcamera tests. Since libcamera would probably be the most active user of this
API, and you have HW for it, it makes a lot of sense that there are decent tests
for the supported HW in libcamera. That takes care of the real-world tests.

2) obviously the existing utils in v4l-utils need to be adapted to understand any
new API elements.

3) compliance tests in v4l2-compliance for the new API. After I did a review of the
series we can see to what extent this is possible.

4) optionally (for now at least, I reserve the right to change my mind): it would
be very helpful if this can be added to vimc (or something similar), allowing for
testing the API without having real hardware, which is useful both for writing
the tests and for running regression tests regularly on a simple VM, without needing
special hardware.

Regards,

	Hans

> 
> The changes since v8:
> - Fixed the use of BIT() in uAPI header.
> - Documentation updates.
> - Added documentation about multiplexed streams to dev-subdev.rst (I had
>   this for v8, but missed it from the series...).
> - 'which' has been dropped from the subdev state. This affects the
>   subdev state allocation (no need to give the try/active parameter) and
>   set_routing() subdev op (need to pass 'which').
> - Dropped v4l2_subdev_validate_state(), as it's not needed.
> - Renamed v4l2_subdev_alloc_state() and v4l2_subdev_free_state() to
>   v4l2_subdev_init_finalize() and v4l2_subdev_cleanup(). I'm not super
>   happy with the names, but I think it's better to have general init &
>   cleanup functions, which can be used for other purposes too.
> - Renamed v4l2_alloc_subdev_state() and v4l2_free_subdev_state() to
>   __v4l2_subdev_state_alloc() and __v4l2_subdev_state_free() to give an
>   indication that they're not supposed to be used from the drivers.
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
>   media: subdev: Add [GS]_ROUTING subdev ioctls and operations
> 
> Sakari Ailus (13):
>   media: entity: Use pad as a starting point for graph walk
>   media: entity: Use pads instead of entities in the media graph walk
>     stack
>   media: entity: Walk the graph based on pads
>   media: mc: Start walk from a specific pad in use count calculation
>   media: entity: Move the pipeline from entity to pads
>   media: entity: Use pad as the starting point for a pipeline
>   media: entity: Skip link validation for pads to which there is no
>     route
>   media: entity: Add an iterator helper for connected pads
>   media: entity: Add only connected pads to the pipeline
>   media: entity: Add debug information in graph walk route check
>   media: Add bus type to frame descriptors
>   media: Add CSI-2 bus configuration to frame descriptors
>   media: Add stream to frame descriptor
> 
> Tomi Valkeinen (17):
>   media: subdev: rename subdev-state alloc & free
>   media: subdev: add active state to struct v4l2_subdev
>   media: subdev: pass also the active state to subdevs from ioctls
>   media: subdev: add subdev state locking
>   media: subdev: Add v4l2_subdev_validate_and_lock_state()
>   media: Documentation: add documentation about subdev state
>   media: subdev: increase V4L2_FRAME_DESC_ENTRY_MAX to 8
>   media: add V4L2_SUBDEV_FL_MULTIPLEXED
>   media: subdev: add v4l2_subdev_has_route()
>   media: subdev: add v4l2_subdev_set_routing helper()
>   media: Documentation: add multiplexed streams documentation
>   media: subdev: add stream based configuration
>   media: subdev: use streams in v4l2_subdev_link_validate()
>   media: subdev: add "opposite" stream helper funcs
>   media: subdev: add v4l2_subdev_get_fmt() helper function
>   media: subdev: add v4l2_subdev_set_routing_with_fmt() helper
>   media: subdev: add v4l2_routing_simple_verify() helper
> 
>  Documentation/driver-api/media/mc-core.rst    |  18 +-
>  .../driver-api/media/v4l2-subdev.rst          |  36 +
>  .../userspace-api/media/v4l/dev-subdev.rst    | 166 ++++
>  .../userspace-api/media/v4l/user-func.rst     |   1 +
>  .../v4l/vidioc-subdev-enum-frame-interval.rst |   5 +-
>  .../v4l/vidioc-subdev-enum-frame-size.rst     |   5 +-
>  .../v4l/vidioc-subdev-enum-mbus-code.rst      |   5 +-
>  .../media/v4l/vidioc-subdev-g-crop.rst        |   5 +-
>  .../media/v4l/vidioc-subdev-g-fmt.rst         |   5 +-
>  .../v4l/vidioc-subdev-g-frame-interval.rst    |   5 +-
>  .../media/v4l/vidioc-subdev-g-routing.rst     | 146 ++++
>  .../media/v4l/vidioc-subdev-g-selection.rst   |   5 +-
>  drivers/media/mc/mc-device.c                  |  13 +-
>  drivers/media/mc/mc-entity.c                  | 257 +++---
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
>  drivers/media/platform/rcar-vin/rcar-v4l2.c   |   5 +-
>  .../platform/rockchip/rkisp1/rkisp1-capture.c |   6 +-
>  .../media/platform/s3c-camif/camif-capture.c  |   6 +-
>  drivers/media/platform/stm32/stm32-dcmi.c     |   6 +-
>  .../platform/sunxi/sun4i-csi/sun4i_dma.c      |   6 +-
>  .../platform/sunxi/sun6i-csi/sun6i_video.c    |   6 +-
>  drivers/media/platform/ti-vpe/cal-video.c     |   6 +-
>  drivers/media/platform/vsp1/vsp1_entity.c     |   6 +-
>  drivers/media/platform/vsp1/vsp1_video.c      |  18 +-
>  drivers/media/platform/xilinx/xilinx-dma.c    |  20 +-
>  drivers/media/platform/xilinx/xilinx-dma.h    |   2 +-
>  .../media/test-drivers/vimc/vimc-capture.c    |   6 +-
>  drivers/media/usb/au0828/au0828-core.c        |   8 +-
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  25 +-
>  drivers/media/v4l2-core/v4l2-mc.c             |  43 +-
>  drivers/media/v4l2-core/v4l2-subdev.c         | 732 +++++++++++++++++-
>  drivers/staging/media/imx/imx-media-utils.c   |   8 +-
>  drivers/staging/media/ipu3/ipu3-v4l2.c        |   6 +-
>  drivers/staging/media/omap4iss/iss.c          |   2 +-
>  drivers/staging/media/omap4iss/iss_video.c    |  40 +-
>  drivers/staging/media/omap4iss/iss_video.h    |   2 +-
>  drivers/staging/media/tegra-video/tegra210.c  |   6 +-
>  drivers/staging/media/tegra-video/vi.c        |   6 +-
>  include/media/media-entity.h                  | 143 +++-
>  include/media/v4l2-subdev.h                   | 374 ++++++++-
>  include/uapi/linux/v4l2-subdev.h              |  85 +-
>  52 files changed, 1989 insertions(+), 369 deletions(-)
>  create mode 100644 Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> 

