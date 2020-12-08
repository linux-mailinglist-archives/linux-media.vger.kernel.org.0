Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8796C2D2FC2
	for <lists+linux-media@lfdr.de>; Tue,  8 Dec 2020 17:34:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730385AbgLHQeL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Dec 2020 11:34:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728602AbgLHQeL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Dec 2020 11:34:11 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF367C061793
        for <linux-media@vger.kernel.org>; Tue,  8 Dec 2020 08:33:30 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D2752335;
        Tue,  8 Dec 2020 17:33:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1607445208;
        bh=xtcEqt9f0TDBN30yHVDgwlxOYwIBZWXiCW+sndVHygQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DoOETZIDr3I2YqRmvxhDkrtw4h80vytbcDqxIfaYl3GDEx8jw9J4NmbUe+RKBXGm2
         oTeJZRegdT1Jy/DZLcylpbQxeI9/a3pOxhyGUXetho0jVtPC1YVpn3dGlTlt+5i7br
         ns+0NaI8en/YbCl314OdyEjDN1G0mXHNbfwL0/bs=
Date:   Tue, 8 Dec 2020 18:33:24 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "Eugen.Hristev@microchip.com" <Eugen.Hristev@microchip.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Luca Ceresoli <luca@lucaceresoli.net>
Subject: Re: [PATCH] imx274: remove composition support, add
 V4L2_SEL_TGT_CROP_DEFAULT
Message-ID: <X8+q1EgvwAsHMTKJ@pendragon.ideasonboard.com>
References: <7940b65c-b5d8-0167-3262-4282f10e873c@xs4all.nl>
 <20201207124655.GY852@paasikivi.fi.intel.com>
 <a61e6644-cb94-6ec9-f0e0-1c256bedb0ed@xs4all.nl>
 <20201207134258.GB852@paasikivi.fi.intel.com>
 <20201207145313.GC852@paasikivi.fi.intel.com>
 <692d3668-03b3-9b45-52ca-a1c05e2a6e1a@xs4all.nl>
 <20201208114600.GD25763@paasikivi.fi.intel.com>
 <fb4481e8-7a67-352c-3424-847ff3e1ee39@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fb4481e8-7a67-352c-3424-847ff3e1ee39@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Tue, Dec 08, 2020 at 01:44:59PM +0100, Hans Verkuil wrote:
> On 08/12/2020 12:46, Sakari Ailus wrote:
> > On Tue, Dec 08, 2020 at 10:47:29AM +0100, Hans Verkuil wrote:
> >> On 07/12/2020 15:53, Sakari Ailus wrote:
> >>> On Mon, Dec 07, 2020 at 03:42:58PM +0200, Sakari Ailus wrote:
> >>>> Hi Hans,
> >>>>
> >>>> On Mon, Dec 07, 2020 at 02:16:39PM +0100, Hans Verkuil wrote:
> >>>>> On 07/12/2020 13:46, Sakari Ailus wrote:
> >>>>>> Hi Hans,
> >>>>>>
> >>>>>> Thanks for the patch.
> >>>>>>
> >>>>>> On Mon, Dec 07, 2020 at 12:18:55PM +0100, Hans Verkuil wrote:
> >>>>>>> This driver does not support composition, only cropping.
> >>>>>>> Composition means that the sensor can output e.g. 1920x1080,
> >>>>>>> but can compose a cropped 1280x720 image in the middle of the
> >>>>>>> 1920x1080 canvas, filling in the unused area with a background
> >>>>>>> color.
> >>>>>>
> >>>>>> That's how this would work on V4L2 video nodes...
> >>>>>>
> >>>>>>>
> >>>>>>> That's not supported at all. So drop the bogus composition support.
> >>>>>>
> >>>>>> But this is a sub-device driver. On sub-devices the COMPOSE target is used
> >>>>>> for configuring scaling, binning and sub-sampling. I don't know about the
> >>>>>> capabilities of this particular driver but the code
> >>>>>> (__imx274_change_compose function in particular) looks very much such that
> >>>>>> it does support binning.
> >>>>>>
> >>>>>
> >>>>> That should be done via set_fmt. There you select the output width and height.
> >>>>>
> >>>>> So if set_fmt sets 1920x1080, and the crop is 960x540, then you scale (or
> >>>>> do binning/sub-sampling). Compose means composing the image into a larger
> >>>>> canvas. For this driver the compose rectangle is always equal to the
> >>>>> format, so set_selection(COMPOSE) is identical to set_fmt().
> >>>>>
> >>>>> If it was real composition, then there would have to be a try_compose as
> >>>>> well, just as there is a try_crop. Instead set_selection(COMPOSE) fills in
> >>>>
> >>>> On sub-devices there's a try context that's file handle specific.
> >>
> >> I know, but that isn't used here.
> > 
> > What exactly are you referring to? The imx274 driver does at least appear
> > to do just that.
> 
> No, it doesn't. Just grep for try_compose, you won't find it. Only try_fmt and
> try_crop.
> 
> >>>>> try_fmt. Clearly wrong.
> >>>>
> >>>> Not more than using set_fmt if you look at the documentation:
> >>>>
> >>>> <URL:https://hverkuil.home.xs4all.nl/spec/userspace-api/v4l/dev-subdev.html#order-of-configuration-and-format-propagation>
> >>>>
> >>>> In this case it's just on the sink pad, as the sub-device exports no source
> >>>> pads. I think there are probably a few such drivers around.
> >>
> >> Which example are you referring to? 4.5 or 4.6?
> >>
> >> 4.5 is closest to what a sensor is, except you won't have a sink pad. Here you crop
> >> from the sensor image, and to scale it up/down to the source media bus format
> >> width and height (if the hardware supports that, of course).
> >>
> >> There is no composition. If composition was supported, then the crop rectangle
> >> would be scaled up/down to the composition rectangle, which would be a rectangle
> > 
> > I'm not claiming there is composition, but the COMPOSE targets are also
> > used when the device supports scaling, not composition. This has been so
> > from the very beginning, and cannot (and should not) be changed at this
> > point.
> 
> No, that's not true.
> 
> If that were true, then lots of sensor drivers would all support TGT_COMPOSE, but
> they don't.

Lots of sensor drivers simply don't support any scaling, either because
the hardware doesn't, or because the driver doesn't implement it.

> Without true composition then the scaling is just between the crop rectangle (if any)
> and the mediabus format. I.e. try_crop and try_fmt.
> 
> Otherwise it would be very confusing since that would allow userspace to set both
> the format size and the compose rectangle to different sizes, and which will then
> be picked? Without true composition one would have to override the other, which
> makes no sense.
> 
> >> inside the source media bus format. Any pixels outside of that composition rectangle
> >> would have to be filled with some background color. A video device would use composition
> >> to write to a rectangle inside a memory buffer, a subdev device would use composition
> >> in the same way, except it would just generate background pixels for anything outside
> >> of the composition rectangle on the source pad.
> >>
> >> It is very, very rare for sensors or video receivers that support composition. They
> >> typically support crop and they may support scaling of some sort, and that's it.
> >>
> >> This imx274 driver certainly does not support composition. It's plain wrong. And if
> >> you look at the code carefully you'll see that the 'composition' just sets the source
> >> media bus format.
> >>
> >> There are (besides imx274) only two sensor drivers that claim to support composition:
> >> ccs and s5k5baf. The latter might actually be real since it has an embedded SoC ISP.
> >> It is lacking a control to set the background color, though.
> >>
> >> CCS is a pipeline with scalers, binners, etc., but I am not so sure it actually supports
> >> composition: can it compose the image inside a larger image that will go out on a source
> >> pad?
> >>
> >> BTW, how do you test CCS? Do you run v4l2-compliance? I see no support for the
> >> CROP/COMPOSE_DEFAULT selection, which suggests to me that v4l2-compliance will likely
> >> protest. In order to implement the old VIDIOC_CROPCAP ioctl using the new selection
> >> API you need both _BOUNDS and _DEFAULT selection targets. v4l2-compliance checks for
> >> that.
> > 
> > The selection targets are documented in the spec but none has been
> > mandatory. Some dependencies would be reasonable, for instance to require
> > CROP_BOUNDS when CROP is supported. But these are not in the spec now, and
> > v4l2-compliance shouldn't require them unless this is documented so in the
> > spec.
> 
> CROPCAP returns the bound and default rectangles. It can only do that if the
> selection API can return those rectangles. CROPCAP is required if cropping is
> supported, see:
> 
> https://hverkuil.home.xs4all.nl/spec/userspace-api/v4l/vidioc-cropcap.html
> 
> "This ioctl must be implemented for video capture or output devices that support
>  cropping and/or scaling and/or have non-square pixels, and for overlay devices."
> 
> So this IS in the spec. It is trivial to implement since in almost all cases
> DEFAULT and BOUNDS are identical. Drivers do not implement cropcap directly
> anymore, but the cropcap implementation in v4l2-ioctl.c just requests the
> BOUNDS and DEFAULT selection targets. Video drivers typically just pass that
> request on to the subdev driver.
> 
> It is how I found that issue: v4l2-compliance fails on that with the imx274
> since it doesn't implement the CROP_DEFAULT target.
> 
> >>>> Which sub-device drivers configure scaling based on set_fmt? I'm only aware
> >>>> of omap3isp which pre-dates the selection API.
> >>>
> >>> That said, there are a lot of drivers that pick the entire configuration
> >>> (cropping (digital and analogue), binning, scaling and sub-samplink) just
> >>> based on set_fmt. It's what drivers to as there are no good solutions for
> >>> the current API, but for the user it's pretty awful.
> >>>
> >>
> >> No, that's nothing to do with composition. The CCS driver creates a chain of
> >> subdevs, one for each step (scaling, binning), and so you can control it precisely.
> >> But I am pretty sure that each step will be like the 4.5 example: you receive
> >> an image on the sink pad, you can optionally crop that, and the result is scaled
> >> up/down to the source media bus format. There is no composition taking place.
> > 
> > Again, that's not how it works.
> > 
> > I also want to stress this is how it has always worked: the sub-device
> > selection support was merged with the CCS driver that was the first user.
> > There's simply no way to re-purpose interfaces now, after a decade of use
> > in the mainline kernel.
> 
> So if I set the composition rectangle to 1280x720 and with (top, left) at
> (128,128), and I set the media bus format to 1920x1080, and then try to
> validate the pipeline, what will happen?

The subdev driver will modify the format on the source pad to 1280x720
in the .set_fmt() handler. This is how subdevs operate, they propagate
changes internally (but not across links), and update requested
selection rectangles and formats based on the configuration of the
previous elements of the subdev.

> Anyway, I'm talking about the imx274 driver, not the ccs driver. I believe
> the ccs driver is wrong, but it has been wrong since the beginning, so there
> is a reason to keep it.
> 
> In the imx274 this composition support was added in commit 39dd23dc9d4c in July
> 2018, so if you prefer to keep it to prevent breakage, then that is a valid
> reason. In that case I'll rework the patch to just add support for CROP_DEFAULT.
> But it is hopelessly wrong: both SUBDEV_S_FMT and S_SELECTION(COMPOSE) set
> try_fmt for V4L2_SUBDEV_FORMAT_TRY. I.e., they do the same thing.
> 
> Basically this is a degenerate case where the composition rectangle must always
> remain the same as the format width/height, and changing one will change the other.
> This makes S_SELECTION(COMPOSE) pointless. Worse, it suggests to userspace that
> the driver supports true composition, when it really doesn't.

Changing the composition rectangle will change the format, but changing
the format won't modify the composition rectangle, the change to the
format will instead be adjusted based on the composition rectangle.

We have, in mainline, different drivers that use different mechanism to
configure scaling. Some use the compose rectangle, and some use the
output format. If we want to repurpose the compose selection rectangle,
it has to be done in the context of an overhaul of the scaling API,
taking the whole issue into account (considering all of binning,
skipping and scaling), and figuring out how to handle existing userspace
without any breakage. Note that this doesn't only apply to sensors, but
also to scalers in other components (such as ISPs), so these must be
taken into account as well.

> >> Or in other words, the composition rectangle always matches the source media bus
> >> format. But there is no point exposing that, it would just be confusing to userspace.
> >>
> >> The only possible use-case that I can see is similar to example 4.6 (except with
> >> one source pad, not two): there you scale from the sink crop to the sink compose
> >> rectangle, then do a source crop and output that to the source pad. But that only
> >> makes sense if you can actually do a source crop in the hardware. If you can't, then
> >> it again reduces to just a sink crop and scaling to the source media bus format.
> >>
> >> In any case, imx274 definitely doesn't do composition, so that should be removed.

-- 
Regards,

Laurent Pinchart
