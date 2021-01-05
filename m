Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41BB52EABF3
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 14:31:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727433AbhAENbA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 08:31:00 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:35552 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726059AbhAENbA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 08:31:00 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 95DD63D7;
        Tue,  5 Jan 2021 14:30:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609853416;
        bh=0B99Bq4Rv01Xwq15QAc0X7URBdudNNBYhSkV95TVehI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=s2Z8BTIziHwhOQ6I8KcrUQx3xQJFQy3CP9xdgtMy4FJ1q0E9EeS2ewAUrQoptV2PU
         v5tV4c6xSCTMghgsGHp5Jm4rLpZPuZ3LB++hnn3rn/Z+7gz5t/0tURayq0YVmu1/82
         49owbKtFoM5s8TCDHYC20hIwEeRnUUVPFdx/kD60=
Date:   Tue, 5 Jan 2021 15:30:04 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Naushir Patuck <naush@raspberrypi.com>,
        "cc: Kieran Bingham" <kieran.bingham@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        mchehab+huawei@kernel.org
Subject: Re: [PATCH v4 5/5] media: bcm2835-unicam: Add TODO file
Message-ID: <X/Rp3KUGPd3ZKXm0@pendragon.ideasonboard.com>
References: <20201110174036.220883-1-jacopo@jmondi.org>
 <20201110174036.220883-6-jacopo@jmondi.org>
 <20201202220635.GC4351@valkosipuli.retiisi.org.uk>
 <CAPY8ntC42KJ-8SB2JbG=bbHKOD7u7qs8kqTJZ7unz63nxpXtZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntC42KJ-8SB2JbG=bbHKOD7u7qs8kqTJZ7unz63nxpXtZQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave and Sakari,

On Thu, Dec 03, 2020 at 11:42:38AM +0000, Dave Stevenson wrote:
> On Wed, 2 Dec 2020 at 22:07, Sakari Ailus <sakari.ailus@iki.fi> wrote:
> > On Tue, Nov 10, 2020 at 06:40:36PM +0100, Jacopo Mondi wrote:
> > > The bcm2835-unicam driver is currently in staging mainly for
> > > two reasons:
> > > - Handling of CSI-2 embedded data
> > > - Usage of both media controller API and subdev kAPI
> > >
> > > Provide a more detailed description of the currently on-going design
> > > discussions in the associated TODO file.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > ---
> > >  drivers/staging/media/bcm2835-unicam/TODO | 37 +++++++++++++++++++++++
> > >  1 file changed, 37 insertions(+)
> > >  create mode 100644 drivers/staging/media/bcm2835-unicam/TODO
> > >
> > > diff --git a/drivers/staging/media/bcm2835-unicam/TODO b/drivers/staging/media/bcm2835-unicam/TODO
> > > new file mode 100644
> > > index 0000000000000..c7840872eea4c
> > > --- /dev/null
> > > +++ b/drivers/staging/media/bcm2835-unicam/TODO
> > > @@ -0,0 +1,37 @@
> > > +BCM2835 Unicam driver TODO list
> > > +===============================
> > > +
> > > +The unicam driver could be considered ready to be moved out of the staging
> > > +directory in terms of code quality and expected functionalities.
> > > +
> > > +However there currently are two design issues that suggest the driver is
> > > +better kept in staging for the time being.
> > > +
> > > +CSI-2 Embedded data support:
> > > +----------------------------
> > > +
> > > +The RaspberryPi camera stack and camera applications rely on the availability of
> > > +the sensor produced CSI-2 embedded data, whose support is currently not
> > > +finalized in mainline Linux.
> > > +
> > > +The driver conditionally registers an additional video device node
> > > +'unicam-embedded' with a single sink pad which connects to the sensor
> > > +sub-device source pad #1 to expose ancillary data.
> > > +
> > > +Currently none of the mainline sensor drivers register more than a single pad,
> > > +and consequentially no embedded data from the sensor are exposed to userspace.
> > > +
> > > +The current implementation is then subject to changes depending on how support
> > > +for CSI-2 embedded data gets finalized in Linux.
> >
> > Are you looking to use out-of-tree sensor drivers that have two pads? I'd
> > rather see sensor drivers merged to mainline proper.
> >
> > But as noted in the other e-mail, we need VC / stream support so this needs
> > to be addressed for reasons not related to Unicam.
> 
> There's a downstream patch for imx219 that adds the second pad [1].
> The imx477 driver that is currently only out-of-tree also supports it,
> and should be upstreamed once this first wave of patches have got
> somewhere.
> 
> [1] https://github.com/raspberrypi/linux/commit/fa8131cb1399f2c22de3f29e08ec1658db76552b
> It's on the rpi-5.10.y branch too, but that is still being frequently
> rebased so no stable commit hashes
> 
> > > +
> > > +Media controller support:
> > > +-------------------------
> > > +
> > > +Due to compatibility reasons with the existing RaspberryPi software ecosystem
> > > +the unicam driver implements the media controller interface to allow the
> > > +enumeration of the connected entities but handles the configuration of the
> > > +sensor sub-device using the v4l2-subdev kAPI instead of delegating that to
> > > +user-space.
> > > +
> > > +Discussions are on-going on how this should be better handled (driver option,
> > > +KConfig option etc etc).
> >
> > That's a fair use case. There are two ways to handle it, either in the
> > kernel where the choice affects how the user space looks like. You have an
> > option of module parameter or Kconfig option there, and both are true
> > annoyances.
> >
> > Another option is to work around it in the user space, wrapping the IOCTL
> > calls. This way no kernel build or module load time parameters would be
> > needed to switch between the two sets of user space programs.
> >
> > We probably can't decide it now, but could an MC-only driver + user space
> > compatibility layer be an option here?
> 
> Iff the user-space compatibility layer worked with all standard users
> (eg v4l2-ctl, FFmpeg and Gstreamer), then it's plausible, but is that
> realistic?

We have a compatibility layer in libcamera, implemented with a
best-effort approach (as the gap between a V4L2 video node and a complex
camera is larger to bridge than between a video node and an MC-based
device with a simple linear capture pipeline). It works, but has its
share of issues as LD_PRELOAD'ing a library isn't always a practical
option.

I believe the wrapper that Sakari envisions is feasible to implement as
the problem space is smaller (in a way the code already exists in kernel
space in the unicam driver, it bridges between the video node and the
input subdev). The tricky part will be to make it nice to use.

> The non-MC approach is mainly for things like the TC358743 HDMI->CSI
> bridge and ADV728x-M chips where MC adds nothing, and they do just
> work with the likes of FFmpeg and Gstreamer.

There are of devices that won't benefit much from an MC-based approach,
but note that in the non-camera use cases, you could have chips such as
the ADV748x which has one HDMI input, 8 analog inputs and two CSI-2
outputs with configurable routing in-between.

> Image sensors are generally going to be used under libcamera umbrella,
> so there MC works.
> 
> Kconfig isn't an option for us as one kernel build needs to support
> all potential source devices via DT / runtime changes alone.
>
> I haven't looked in detail at what the previous VC / stream patches
> proposed as the API for passing the configuration. We only need MC for
> the more complex use cases, so if that VC/stream API usage can be
> detected at probe then we can switch to MC. It doesn't seem
> unreasonable to expect any sensor drivers to be upgraded to correctly
> use the new API even if they don't actually produce embedded data.

I'm not sure that would be the case, support for multiplexed streams
would be on top of the V4L2 subdev in-kernel API, and I don't expect
changes in camera sensors that don't support multiple streams.

> We also want MC for ADV748x HDMI&analog->CSI bridges that expose

There we go :-)

> multiple subdevs, but there we can look at the upstream endpoint and
> see if it has any sink pads. Sink pads mean MC is needed. (I now have
> a board with an ADV7482 on, so when time allows I'm intending to have
> an experiment with it).

Note that we will likely, in the future, introduce media entities for
connectors, which means that a device such as the TC358743 would have a
sink pad connected to an HDMI connector entity.

> Use a module parameter as a last resort should the detection fail, or
> I guess if you want to override the detected setting for some reason
> (a simple sensor being used outside of libcamera for example).

-- 
Regards,

Laurent Pinchart
