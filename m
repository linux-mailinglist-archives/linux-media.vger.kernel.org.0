Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5A0326A8B9
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 17:24:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727444AbgIOPYC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 11:24:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727429AbgIOPWw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 11:22:52 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F896C061222
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2020 06:28:36 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id a9so3485766wmm.2
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2020 06:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rOv5WGVGsgyNn6urbOebccg434eenXBMmtPhsBKwi6M=;
        b=qPEJL5WK5rgIP50M1Rri2kkuOOi7uJdtddgDg4HjudktmboL7nN/T1P3gsTsgOyH/B
         B11wuJrMln3gmZ86V76cz0hDmJoS0HBJTcEpnbfgyCVTtGapX7QWTSdSUXzovewq1TH1
         Fb+b6vgGbKxEOBZotxEekapD6lXM9w+eFxB3eQiUVhfXtDRcfbBOc/PMl7/8PJHm4kug
         Z8z6LNseyzfS7Gzya2A1CwAylI5x3RYc3yObXTmBXcTDPjYej4KVCRnHClWj19wvjUuv
         lWwie+kq2aYVgFJ096LbinnXwj6T7WdtiXLZDwGJUYYx//AvVKf3szCY0DGL5bB5Qt7q
         gQeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rOv5WGVGsgyNn6urbOebccg434eenXBMmtPhsBKwi6M=;
        b=s7oI0QIoe36uEWe8AJ/d/uiQp9t8Se+DWbLxfszs+UUAZSK6SGnUx5D4rMHvdAULUU
         mPjV/HwTmTjx1GCPIV21J/FxPx2Gl7Z1NfsjQP0AFfCVRUHtww2Tm7hakJGq628bH8x0
         h9v6VePVj6c+CEeEFiQKfKgSIsIq1wUR0W/jFQQWDhexKAHyPkzd31e3QCWTYnC2Jzgt
         XmmSsKdRD8nALClk8frFFSOcHhgSPK8KnkIN2L1Vkm2jLk5qGLrb0wnW5I3rtY4l1MIJ
         qVeNcAwqQ+HucH98TpPaX8a2p+4bWG3P7DG4eAcbILLkptzGg+91y4KkbdkdjjVJ6nIK
         6qAA==
X-Gm-Message-State: AOAM533vSsI865EzR5bjo8SVrKy8OyRnxv52REc7DjM/4hOtoVM5LQt2
        CiZj+/oZyJKD4oOYJacuQkx6qkheo+jaWzvy9ZylVQ==
X-Google-Smtp-Source: ABdhPJzptpXzL0JtsYDEv5htyH79Xq0s6UkdwQ6cHX2hOWtyJOhaEqgiJB5h71UVlB5V9YCaSNW39hT/sFN//yFn4As=
X-Received: by 2002:a1c:1d52:: with SMTP id d79mr5072815wmd.82.1600176514962;
 Tue, 15 Sep 2020 06:28:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
 <20200504092611.9798-5-laurent.pinchart@ideasonboard.com> <20200915070326.GI834@valkosipuli.retiisi.org.uk>
 <20200915093235.GC13260@pendragon.ideasonboard.com>
In-Reply-To: <20200915093235.GC13260@pendragon.ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 15 Sep 2020 14:28:16 +0100
Message-ID: <CAPY8ntBpmm6mvqVQeVCfpTZD58LNBs6+EuL8y4ihwmP8vzt5BA@mail.gmail.com>
Subject: Re: [PATCH v2 04/34] media: bcm2835-unicam: Driver for CCP2/CSI2
 camera interface
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari & Laurent

On Tue, 15 Sep 2020 at 10:33, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Sakari,
>
> (With a question for Dave below)
>
> I'm replying to the two main points of your review. All the other
> comments look fine at a glance, Jacopo is having a more detailed look
> and will incorporate them in v3.
>
> On Tue, Sep 15, 2020 at 10:03:26AM +0300, Sakari Ailus wrote:
> > Hi Laurent,
> >
> > Thanks for the patch, and my apologies for the late review. Please do cc me
> > for v3.
> >
> > After a quick look I can already say this is the cleanest Unicam driver
> > I've ever seen. But please also see my detailed comments below.
> >
> > On Mon, May 04, 2020 at 12:25:41PM +0300, Laurent Pinchart wrote:
> > > From: Naushir Patuck <naush@raspberrypi.com>
> > >
> > > Add a driver for the Unicam camera receiver block on BCM283x processors.
> > > Compared to the bcm2835-camera driver present in staging, this driver
> > > handles the Unicam block only (CSI-2 receiver), and doesn't depend on
> > > the VC4 firmware running on the VPU.
> > >
> > > The commit is made up of a series of changes cherry-picked from the
> > > rpi-5.4.y branch of https://github.com/raspberrypi/linux/ with
> > > additional enhancements, forward-ported to the mainline kernel.
> > >
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > > Changes since v1:
> > >
> > > - Re-fetch mbus code from subdev on a g_fmt call
> > > - Group all ioctl disabling together
> > > - Fix reference counting in unicam_open
> > > - Add support for VIDIOC_[S|G]_SELECTION
> > > ---
> > >  MAINTAINERS                                   |    7 +
> > >  drivers/media/platform/Kconfig                |    1 +
> > >  drivers/media/platform/Makefile               |    2 +
> > >  drivers/media/platform/bcm2835/Kconfig        |   15 +
> > >  drivers/media/platform/bcm2835/Makefile       |    3 +
> > >  .../media/platform/bcm2835/bcm2835-unicam.c   | 2825 +++++++++++++++++
> > >  .../media/platform/bcm2835/vc4-regs-unicam.h  |  253 ++
> > >  7 files changed, 3106 insertions(+)
> > >  create mode 100644 drivers/media/platform/bcm2835/Kconfig
> > >  create mode 100644 drivers/media/platform/bcm2835/Makefile
> > >  create mode 100644 drivers/media/platform/bcm2835/bcm2835-unicam.c
> > >  create mode 100644 drivers/media/platform/bcm2835/vc4-regs-unicam.h
>
> [snip]
>
> > > diff --git a/drivers/media/platform/bcm2835/bcm2835-unicam.c b/drivers/media/platform/bcm2835/bcm2835-unicam.c
> > > new file mode 100644
> > > index 000000000000..2e9387cbc1e0
> > > --- /dev/null
> > > +++ b/drivers/media/platform/bcm2835/bcm2835-unicam.c
> > > @@ -0,0 +1,2825 @@
>
> [snip]
>
> > > +static int unicam_enum_frameintervals(struct file *file, void *priv,
> > > +                                 struct v4l2_frmivalenum *fival)
> > > +{
> > > +   struct unicam_node *node = video_drvdata(file);
> > > +   struct unicam_device *dev = node->dev;
> > > +   const struct unicam_fmt *fmt;
> > > +   struct v4l2_subdev_frame_interval_enum fie = {
> > > +           .index = fival->index,
> > > +           .width = fival->width,
> > > +           .height = fival->height,
> > > +           .which = V4L2_SUBDEV_FORMAT_ACTIVE,
> > > +   };
> > > +   int ret;
> > > +
> > > +   fmt = find_format_by_pix(dev, fival->pixel_format);
> > > +   if (!fmt)
> > > +           return -EINVAL;
> > > +
> > > +   fie.code = fmt->code;
> > > +   ret = v4l2_subdev_call(dev->sensor, pad, enum_frame_interval,
> > > +                          NULL, &fie);
> >
> > You're adding a new CSI-2 receiver driver but your driver appears to be
> > video node centric and does not use MC / V4L2 subdev uAPIs for pipeline
> > configuration.
> >
> > This is effectively needed if you want to be able to capture embedded data.
> >
> > I'd also recommend it since this way the driver will be compliant with all
> > camera sensor drivers, not just those that expose a single sub-device.
> > There are no good ways to change this once your driver is in upstream
> > kernel.
> >
> > This is also why e.g. ipu3-cio2 driver is MC-centric.
>
> I've had lengthy discussions with Dave on this topic. While I agree with
> you in principle, Dave had good arguments for keeping this
> video-node-centric. We all agreed it wasn't a perfect solution, but it
> could still be a pragmatic one.
>
> If I remember correctly the discussion was in private e-mails though.
> Dave, I'm pretty sure you're tired of repeating the same thing, but
> Sakari can't be expected to know all we've talked about. I can try to
> summarize your points, but I may not do a very good job at defending
> your point of view given that I wish you would be wrong :-) Would you
> like to summarize your position, or should I give it a go ?

One previous thread was on libcamera-devel -
https://lists.libcamera.org/pipermail/libcamera-devel/2020-February/006789.html

The main stumbling point is the lack of userspace support for MC in
the normal applications like GStreamer and FFmpeg? Or even in simpler
apps like fswebcam or qv4l2?
AFACIT None of them can set the resolution via MC. Surely that's one
of the most fundamental operations.

The main devices I've got working are:
- ov5647 (5MPix Bayer)
- imx219 (8MPix Bayer)
- imx477 (12MPix Bayer)
- imx290/327 (1080p global shutter Bayer or mono)
- ov9281 (1MPix global shutter Bayer or mono)
- ov7251 (0.31MPix global shutter)
- tc358743 (HDMI to CSI-2 bridge)
- adv7282m (analogue video to CSI2 bridge)

None need MC for any of their functionality, and I've yet to really
see a driver that does (perhaps I've just missed them).

tc358743 & adv7282 are slightly odd in that setting the timing or
standard sets the capture resolution. Conveying that configuration
path to users is bad enough, and it isn't brilliantly supported by
apps.

For the sensor modules from a user's perspective having to invoke
media-ctl to set the resolution before starting GStreamer or FFmpeg
sucks. Why are we forcing them down that route?
If video-node-centric then a GStreamer pipeline along the lines of
gst-launch-1.0 -e v4l2src ! "video/x-raw,width=W,height=H,format=Y10P"
! v4l2convert ! "video/x-raw,width=W,height=H,format=I420" ! <some
sink>
just works and can set everything up. Same with FFmpeg.
There isn't an equivalent one-line pipeline in an MC-centric world
that can set the resolution.

libcamera starts to address that restriction, but isn't applicable for
tc358743 or adv7282, and potentially only limited use for mono sensors
(eg users want low latency to some machine vision library).
So, unless I've missed something, if we adopt MC it makes libcamera
practically mandatory for all Bayer sensors, and we force users of
those other devices into an additional API with manual configuration
as none of the apps support it.

Unicam doesn't have any significant processing stages hidden within
it, only unpacking raw formats to 16bpp which is handled via pixel
formats. Otherwise it purely takes the data from the CSI2/CCP2 bus and
writes it to SDRAM.
MC is there for the complex pipelines, but we have a simple one!


Can you be the sales-person for MC here and tell me what problem it
actually solves for the user in my case? I've had this driver kicking
around in our tree for a while, so to make the change to MC means I
need to justify it to users, and provide them the tools to do the same
as they currently can. At present I can't do that.
A quick look at the docs says the MC API has been finalised since
around 4.8 by the looks of it, so nearly 4 years. IMHO For none of the
main userspace apps to handle it says a huge amount. Sorry.


If there was a clear way of implementing sufficient MC support within
GStreamer and FFmpeg and there was someone willing to take on the
work, then I could see if I can get my bosses to pay to subcontract
the work and get it upstreamed (we don't want to be maintaining
patches to those apps). Of course that still leaves a million and one
other apps out there which won't work.

(Thinking out loud. If there is only one link in the graph that
terminates in the appropriate /dev/video node, then try setting the
resolution on that? Would that cover it? Does it cover it for the
simple cases on other hardware? Would it be acceptable to GStreamer
and FFmpeg? Have we just introduced the mapping table between MBUS
formats and V4L2_PIX_FMT_xxx into both apps? All these questions!)

> > > +   if (ret)
> > > +           return ret;
> > > +
> > > +   fival->type = V4L2_FRMIVAL_TYPE_DISCRETE;
> > > +   fival->discrete = fie.interval;
> > > +
> > > +   return 0;
> > > +}
>
> [snip]
>
> > > +static int register_node(struct unicam_device *unicam, struct unicam_node *node,
> > > +                    enum v4l2_buf_type type, int pad_id)
> > > +{
>
> [snip]
>
> > > +   if (pad_id != METADATA_PAD || unicam->sensor_embedded_data) {
> > > +           ret = media_create_pad_link(&unicam->sensor->entity, pad_id,
> > > +                                       &node->video_dev.entity, 0,
> > > +                                       MEDIA_LNK_FL_ENABLED |
> > > +                                       MEDIA_LNK_FL_IMMUTABLE);
> >
> > This does create two links between the sensor and the CSI-2 receiver,
> > doesn't it?
> >
> > The links in Media controller represent physical links, not logical flows
> > of data. At the time the API was added, it wasn't thought there would be a
> > need to separate the two.
> >
> > There is an effort to add the concept of data flow to V4L2, but it's been
> > complicated and we haven't had patches for the CSI-2 receiver driver to
> > support it. Perhaps Unicam could be the first one to do that?
>
> I agree that this is the right approach. The V4L2 multiplexed streams
> support seems to be one of these cursed series, where bad things happen
> to anyone who touches it. I was about to actively start working on it
> again back in June for a different project, which then got frozen at the
> last minute :-S
>
> Would you like to give it a try ? :-) I'd be more than happy to provide
> you hardware as a present.

If you want hardware then we can provide it and save Laurent's wallet.
Email me an address and phone number (our couriers now insist on it)
and I can get some sorted.

> > Alternatively support for embedded data could be removed in the meantime.

If that's what it takes, then OK, but using embedded data removes the
guesswork from knowing the gain and exposures actually used, and so
avoids oscillations. Some sensors don't support embedded data so you
have to guess, but it's a shame if it is available and it can't be
used.

I'm between a rock and a hard place:
- Libcamera wants platforms to be supported on mainline kernels (or at
least submitted to the list)
- But there isn't a framework available to let us do what is needed,
and I don't know enough of the history and use cases to really work on
it directly.
How to satisfy everyone? :-/

Alternatively I end up with a driver that has a flag to switch between
MC-centric and video-device-centric modes (I would say a DT flag, but
would it get past the DT maintainers as it isn't describing the
hardware?)
- If you want libcamera and embedded data then go MC and you have to
jump through hoops to set up resolution.
- If you don't want libcamera or embedded data then go video-centric
and use all the tools you're used to.
Possible, but there are going to be so many conditionals dotted around
it would get ugly.

Enough rambling from me. Thanks for your time in reviewing this lot -
hopefully we can find a way forward.

   Dave

> > The latest patchset is here I believe:
> >
> > <URL:https://patchwork.kernel.org/project/linux-media/list/?series=98277>
> >
> > > +           if (ret)
> > > +                   unicam_err(unicam, "Unable to create pad link for %s\n",
> > > +                              vdev->name);
> > > +   }
> > > +
> > > +   return ret;
> > > +}
>
> --
> Regards,
>
> Laurent Pinchart
