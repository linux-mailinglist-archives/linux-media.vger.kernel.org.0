Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2B4A3C26AF
	for <lists+linux-media@lfdr.de>; Fri,  9 Jul 2021 17:17:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232140AbhGIPUU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jul 2021 11:20:20 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:46705 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232053AbhGIPUT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jul 2021 11:20:19 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 54469C0006;
        Fri,  9 Jul 2021 15:17:32 +0000 (UTC)
Date:   Fri, 9 Jul 2021 17:18:21 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: Re: [PATCH v7 00/27] v4l: subdev internal routing and streams
Message-ID: <20210709151821.ogra3s2ulnsvkyqa@uno.localdomain>
References: <20210524104408.599645-1-tomi.valkeinen@ideasonboard.com>
 <YLwReuwLm7S/4hgz@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YLwReuwLm7S/4hgz@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi, Laurent,

On Sun, Jun 06, 2021 at 03:06:18AM +0300, Laurent Pinchart wrote:
> Hi Hans, Sakari,
>
> We need your feedback on this series, at least on the general approach.
> There are quite a few issues to be addressed, and it makes no sense to
> invest time in this if you don't think this is a good direction.
>
> If anyone else wants to give feedback, speak now or forever hold your
> peace :-)

Since you ask...

Having been involved a bit as the n-th person that tried to bring this
to completion I spent a bit of time trying to recollect how the
previous approach worked and how it compares to this one. Sorry if
this goes in length.

I share Tomi's concern on one part of the previous version:

- The resulting device topology gets complicated in a non-trivial way.

  The typical example of having to model one image sensor that sends
  embedded data and images with three sub-devices speaks for itself, I
  presume.

  However in one way, I feel like this is somehow correct and provides
  a more accurate representation of the actual sensor architecture.
  Splitting a sensor into components would allow to better handle
  devices which supports multiple buses (typically CSI-2 and
  parallel) through the internal routing tables, and allows
  better control of the components of the image sensor. [1]

- Multiplexed source pads do not accept a format or any other configuration
  like crop/composing. Again this might seem odd, and it might be
  worth considering if those pads shouldn't be made 'special' somehow,
  but I again think it models a multiplexed bus quite accurately,
  doesn't it ? It's weird that the format of, in example, a CSI-2
  receiver source pad has to be propagated from the image sensor
  entity sink pad, crossing two entities, two routes and one
  media link. This makes rather complex to automate format propagation along
  pipelines, not only when done by abusing media-ctl like most people do,
  but also when done programmatically the task is not easy (I know I'm
  contradicting my [1] point here :)

  Also link validation is of course a bit more complex as shown by
  731facccc987 ("v4l: subdev: Take routing information into account in link validation")
  which was part of the previous series, but it's totally up to the
  core..

Moving everything to the pads by adding a 'stream' field basically
makes all pads potentially multiplexed, reducing the problem of format
configuration/validation to a 1-to-1 {pad, stream} pair validation
which allows to collapse the topology and maintain the current one.

Apart from the concerns expressed by Laurent (which I share but only
partially understand, as the implications of bulk moving the
v4l2-subdev configuration API to be stream-aware are not totally clear
to me yet) what I'm not convinced of is that now cross-entities
"routes" (or "streams") on a multiplexed bus do require a format
assigned, effectively exposing them to userspace, with the consequence
that the format configuration influences the routes setup up to the
point the two have to be kept consistent. The concept
could even be extended to inter-entities routes, as you suggested the
routing tables could even be dropped completely in this case, but I
feel mixing routing and format setup is a bit a layer violation and
forbids, in example, routing two streams to the same endpoint, which I
feel will be required to perform DT multiplexing on the same virtual
channel. The previous version had the multiplexed link configuration
completely hidden from userspace and controlled solely by the routing API,
which seems a tad more linear and offers more flexibility for drivers.

I'm not strongly pushing for one solution over the other, the only use
case I can reason on at the moment is a simple single-stream VC
multiplexing and both solutions works equally fine for that. This one
is certainly simpler regarding the required device topology.

Btw Tomi, do you have examples of drivers ported to your new proposal ?

Just my 2 cents, and sorry for the wall of text :)
    j

[1]
  The counter-argument about the additional complexity doesn't apply
  to drivers if not marginally but impacts userspace in a non
  negligeable way. To be honest, I do think this is only marginally an
  issue. As long as the single V4L2 apis (and v4l2-ctrls) were
  enough to be able to capture anything from the camera system the
  argument of the additional complexity held: a generic
  camera application could have worked with any (most) kind of devices and the
  platform specificities were abstracted away enough for such generic
  applications to exists. Honestly, with the introduction of the
  media-controller API and the v4l2-subdev APIs, I think we're well
  past that point. Userspace that controls complex devices
  has to be specialized to a point that an additional IOCTL and a more
  detailed knowledge of the topology is a rather small burden compared
  to the quantum leap the subsystem went through with the introduction
  of complex devices support.

>
> On Mon, May 24, 2021 at 01:43:41PM +0300, Tomi Valkeinen wrote:
> > Hi,
> >
> > This is v7 of the series, the previous one is:
> >
> > https://lore.kernel.org/linux-media/20210427124523.990938-1-tomi.valkeinen@ideasonboard.com/
> >
> > In this version I have changed the approach to multiplexed streams, and
> > I went with the approach described in the RFC I sent:
> >
> > https://lore.kernel.org/linux-media/20210507123558.146948-1-tomi.valkeinen@ideasonboard.com/
> >
> > The main change is that in this series each pad+stream combination can
> > have its own configuration, versus only pad having its own
> > configuration. In other words, a pad with 4 streams will contain 4
> > configurations.
> >
> > The patches up to and including "v4l: Add stream to frame descriptor"
> > are the same as previously, except changes done according to the review
> > comments. After that, the new pad+stream approach is implemented.
> >
> > This series is based on the subdev-wide state change:
> >
> > https://lore.kernel.org/linux-media/20210519091558.562318-1-tomi.valkeinen@ideasonboard.com/
> >
> >  Tomi
> >
> > Jacopo Mondi (2):
> >   media: entity: Add iterator helper for entity pads
> >   media: Documentation: Add GS_ROUTING documentation
> >
> > Laurent Pinchart (4):
> >   media: entity: Add has_route entity operation
> >   media: entity: Add media_entity_has_route() function
> >   media: entity: Use routing information during graph traversal
> >   v4l: subdev: Add [GS]_ROUTING subdev ioctls and operations
> >
> > Sakari Ailus (13):
> >   media: entity: Use pad as a starting point for graph walk
> >   media: entity: Use pads instead of entities in the media graph walk
> >     stack
> >   media: entity: Walk the graph based on pads
> >   v4l: mc: Start walk from a specific pad in use count calculation
> >   media: entity: Move the pipeline from entity to pads
> >   media: entity: Use pad as the starting point for a pipeline
> >   media: entity: Skip link validation for pads to which there is no
> >     route
> >   media: entity: Add an iterator helper for connected pads
> >   media: entity: Add only connected pads to the pipeline
> >   media: entity: Add debug information in graph walk route check
> >   v4l: Add bus type to frame descriptors
> >   v4l: Add CSI-2 bus configuration to frame descriptors
> >   v4l: Add stream to frame descriptor
> >
> > Tomi Valkeinen (8):
> >   v4l: subdev: add V4L2_SUBDEV_ROUTE_FL_SOURCE
> >   v4l: subdev: routing kernel helper functions
> >   v4l: subdev: add stream based configuration
> >   v4l: subdev: add 'stream' to subdev ioctls
> >   v4l: subdev: use streams in v4l2_subdev_link_validate()
> >   v4l: subdev: add routing & stream config to v4l2_subdev_state
> >   v4l: subdev: add V4L2_SUBDEV_FL_MULTIPLEXED
> >   v4l: subdev: increase V4L2_FRAME_DESC_ENTRY_MAX to 8
> >
> >  Documentation/driver-api/media/mc-core.rst    |  15 +-
> >  .../userspace-api/media/v4l/dev-subdev.rst    | 128 ++++++
> >  .../userspace-api/media/v4l/user-func.rst     |   1 +
> >  .../v4l/vidioc-subdev-enum-frame-interval.rst |   5 +-
> >  .../v4l/vidioc-subdev-enum-frame-size.rst     |   5 +-
> >  .../v4l/vidioc-subdev-enum-mbus-code.rst      |   5 +-
> >  .../media/v4l/vidioc-subdev-g-crop.rst        |   5 +-
> >  .../media/v4l/vidioc-subdev-g-fmt.rst         |   5 +-
> >  .../v4l/vidioc-subdev-g-frame-interval.rst    |   5 +-
> >  .../media/v4l/vidioc-subdev-g-routing.rst     | 142 +++++++
> >  .../media/v4l/vidioc-subdev-g-selection.rst   |   5 +-
> >  drivers/media/mc/mc-device.c                  |  13 +-
> >  drivers/media/mc/mc-entity.c                  | 257 +++++++-----
> >  drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |   6 +-
> >  .../media/platform/exynos4-is/fimc-capture.c  |   8 +-
> >  .../platform/exynos4-is/fimc-isp-video.c      |   8 +-
> >  drivers/media/platform/exynos4-is/fimc-isp.c  |   2 +-
> >  drivers/media/platform/exynos4-is/fimc-lite.c |  10 +-
> >  drivers/media/platform/exynos4-is/media-dev.c |  20 +-
> >  drivers/media/platform/omap3isp/isp.c         |   2 +-
> >  drivers/media/platform/omap3isp/ispvideo.c    |  25 +-
> >  drivers/media/platform/omap3isp/ispvideo.h    |   2 +-
> >  .../media/platform/qcom/camss/camss-video.c   |   6 +-
> >  drivers/media/platform/rcar-vin/rcar-core.c   |  16 +-
> >  drivers/media/platform/rcar-vin/rcar-dma.c    |   8 +-
> >  .../platform/rockchip/rkisp1/rkisp1-capture.c |   6 +-
> >  .../media/platform/s3c-camif/camif-capture.c  |   6 +-
> >  drivers/media/platform/stm32/stm32-dcmi.c     |   6 +-
> >  .../platform/sunxi/sun4i-csi/sun4i_dma.c      |   6 +-
> >  .../platform/sunxi/sun6i-csi/sun6i_video.c    |   6 +-
> >  drivers/media/platform/ti-vpe/cal-video.c     |   6 +-
> >  drivers/media/platform/vsp1/vsp1_video.c      |  18 +-
> >  drivers/media/platform/xilinx/xilinx-dma.c    |  20 +-
> >  drivers/media/platform/xilinx/xilinx-dma.h    |   2 +-
> >  .../media/test-drivers/vimc/vimc-capture.c    |   6 +-
> >  drivers/media/usb/au0828/au0828-core.c        |   8 +-
> >  drivers/media/v4l2-core/v4l2-ioctl.c          |  25 +-
> >  drivers/media/v4l2-core/v4l2-mc.c             |  43 +-
> >  drivers/media/v4l2-core/v4l2-subdev.c         | 396 +++++++++++++++++-
> >  drivers/staging/media/imx/imx-media-utils.c   |   8 +-
> >  drivers/staging/media/ipu3/ipu3-v4l2.c        |   6 +-
> >  drivers/staging/media/omap4iss/iss.c          |   2 +-
> >  drivers/staging/media/omap4iss/iss_video.c    |  40 +-
> >  drivers/staging/media/omap4iss/iss_video.h    |   2 +-
> >  drivers/staging/media/tegra-video/tegra210.c  |   6 +-
> >  include/media/media-entity.h                  | 142 +++++--
> >  include/media/v4l2-subdev.h                   | 204 ++++++++-
> >  include/uapi/linux/v4l2-subdev.h              |  76 +++-
> >  48 files changed, 1410 insertions(+), 334 deletions(-)
> >  create mode 100644 Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
>
> --
> Regards,
>
> Laurent Pinchart
