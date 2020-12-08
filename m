Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 253042D29EF
	for <lists+linux-media@lfdr.de>; Tue,  8 Dec 2020 12:48:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726367AbgLHLsU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Dec 2020 06:48:20 -0500
Received: from mga06.intel.com ([134.134.136.31]:5209 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725803AbgLHLsU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 8 Dec 2020 06:48:20 -0500
IronPort-SDR: Vmv+w7brHiNnQaP6FMIROCiG/1bUCPCt8gnlmDa0nb7sn4C/6/aabpMN/llcJLnX+zKdULkH2c
 7miJQXaYrqYw==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="235474273"
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; 
   d="scan'208";a="235474273"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2020 03:46:34 -0800
IronPort-SDR: y50sgX8V9j6WfxdCbqGrlAT1KVafYtiI0OrcgdSCQLqbve5Q8Gn/9bJ6JmxUd3opfMa6BNFk6n
 9MNNnYG5KXfw==
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; 
   d="scan'208";a="347865782"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2020 03:46:32 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id A1C8820473; Tue,  8 Dec 2020 13:46:00 +0200 (EET)
Date:   Tue, 8 Dec 2020 13:46:00 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        "Eugen.Hristev@microchip.com" <Eugen.Hristev@microchip.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Luca Ceresoli <luca@lucaceresoli.net>
Subject: Re: [PATCH] imx274: remove composition support, add
 V4L2_SEL_TGT_CROP_DEFAULT
Message-ID: <20201208114600.GD25763@paasikivi.fi.intel.com>
References: <7940b65c-b5d8-0167-3262-4282f10e873c@xs4all.nl>
 <20201207124655.GY852@paasikivi.fi.intel.com>
 <a61e6644-cb94-6ec9-f0e0-1c256bedb0ed@xs4all.nl>
 <20201207134258.GB852@paasikivi.fi.intel.com>
 <20201207145313.GC852@paasikivi.fi.intel.com>
 <692d3668-03b3-9b45-52ca-a1c05e2a6e1a@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <692d3668-03b3-9b45-52ca-a1c05e2a6e1a@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Dec 08, 2020 at 10:47:29AM +0100, Hans Verkuil wrote:
> On 07/12/2020 15:53, Sakari Ailus wrote:
> > On Mon, Dec 07, 2020 at 03:42:58PM +0200, Sakari Ailus wrote:
> >> Hi Hans,
> >>
> >> On Mon, Dec 07, 2020 at 02:16:39PM +0100, Hans Verkuil wrote:
> >>> On 07/12/2020 13:46, Sakari Ailus wrote:
> >>>> Hi Hans,
> >>>>
> >>>> Thanks for the patch.
> >>>>
> >>>> On Mon, Dec 07, 2020 at 12:18:55PM +0100, Hans Verkuil wrote:
> >>>>> This driver does not support composition, only cropping.
> >>>>> Composition means that the sensor can output e.g. 1920x1080,
> >>>>> but can compose a cropped 1280x720 image in the middle of the
> >>>>> 1920x1080 canvas, filling in the unused area with a background
> >>>>> color.
> >>>>
> >>>> That's how this would work on V4L2 video nodes...
> >>>>
> >>>>>
> >>>>> That's not supported at all. So drop the bogus composition support.
> >>>>
> >>>> But this is a sub-device driver. On sub-devices the COMPOSE target is used
> >>>> for configuring scaling, binning and sub-sampling. I don't know about the
> >>>> capabilities of this particular driver but the code
> >>>> (__imx274_change_compose function in particular) looks very much such that
> >>>> it does support binning.
> >>>>
> >>>
> >>> That should be done via set_fmt. There you select the output width and height.
> >>>
> >>> So if set_fmt sets 1920x1080, and the crop is 960x540, then you scale (or
> >>> do binning/sub-sampling). Compose means composing the image into a larger
> >>> canvas. For this driver the compose rectangle is always equal to the
> >>> format, so set_selection(COMPOSE) is identical to set_fmt().
> >>>
> >>> If it was real composition, then there would have to be a try_compose as
> >>> well, just as there is a try_crop. Instead set_selection(COMPOSE) fills in
> >>
> >> On sub-devices there's a try context that's file handle specific.
> 
> I know, but that isn't used here.

What exactly are you referring to? The imx274 driver does at least appear
to do just that.

> 
> >>
> >>> try_fmt. Clearly wrong.
> >>
> >> Not more than using set_fmt if you look at the documentation:
> >>
> >> <URL:https://hverkuil.home.xs4all.nl/spec/userspace-api/v4l/dev-subdev.html#order-of-configuration-and-format-propagation>
> >>
> >> In this case it's just on the sink pad, as the sub-device exports no source
> >> pads. I think there are probably a few such drivers around.
> 
> Which example are you referring to? 4.5 or 4.6?
> 
> 4.5 is closest to what a sensor is, except you won't have a sink pad. Here you crop
> from the sensor image, and to scale it up/down to the source media bus format
> width and height (if the hardware supports that, of course).
> 
> There is no composition. If composition was supported, then the crop rectangle
> would be scaled up/down to the composition rectangle, which would be a rectangle

I'm not claiming there is composition, but the COMPOSE targets are also
used when the device supports scaling, not composition. This has been so
from the very beginning, and cannot (and should not) be changed at this
point.

> inside the source media bus format. Any pixels outside of that composition rectangle
> would have to be filled with some background color. A video device would use composition
> to write to a rectangle inside a memory buffer, a subdev device would use composition
> in the same way, except it would just generate background pixels for anything outside
> of the composition rectangle on the source pad.
> 
> It is very, very rare for sensors or video receivers that support composition. They
> typically support crop and they may support scaling of some sort, and that's it.
> 
> This imx274 driver certainly does not support composition. It's plain wrong. And if
> you look at the code carefully you'll see that the 'composition' just sets the source
> media bus format.
> 
> There are (besides imx274) only two sensor drivers that claim to support composition:
> ccs and s5k5baf. The latter might actually be real since it has an embedded SoC ISP.
> It is lacking a control to set the background color, though.
> 
> CCS is a pipeline with scalers, binners, etc., but I am not so sure it actually supports
> composition: can it compose the image inside a larger image that will go out on a source
> pad?
> 
> BTW, how do you test CCS? Do you run v4l2-compliance? I see no support for the
> CROP/COMPOSE_DEFAULT selection, which suggests to me that v4l2-compliance will likely
> protest. In order to implement the old VIDIOC_CROPCAP ioctl using the new selection
> API you need both _BOUNDS and _DEFAULT selection targets. v4l2-compliance checks for
> that.

The selection targets are documented in the spec but none has been
mandatory. Some dependencies would be reasonable, for instance to require
CROP_BOUNDS when CROP is supported. But these are not in the spec now, and
v4l2-compliance shouldn't require them unless this is documented so in the
spec.

> 
> >>
> >> Which sub-device drivers configure scaling based on set_fmt? I'm only aware
> >> of omap3isp which pre-dates the selection API.
> > 
> > That said, there are a lot of drivers that pick the entire configuration
> > (cropping (digital and analogue), binning, scaling and sub-samplink) just
> > based on set_fmt. It's what drivers to as there are no good solutions for
> > the current API, but for the user it's pretty awful.
> > 
> 
> No, that's nothing to do with composition. The CCS driver creates a chain of
> subdevs, one for each step (scaling, binning), and so you can control it precisely.
> But I am pretty sure that each step will be like the 4.5 example: you receive
> an image on the sink pad, you can optionally crop that, and the result is scaled
> up/down to the source media bus format. There is no composition taking place.

Again, that's not how it works.

I also want to stress this is how it has always worked: the sub-device
selection support was merged with the CCS driver that was the first user.
There's simply no way to re-purpose interfaces now, after a decade of use
in the mainline kernel.

> Or in other words, the composition rectangle always matches the source media bus
> format. But there is no point exposing that, it would just be confusing to userspace.
> 
> The only possible use-case that I can see is similar to example 4.6 (except with
> one source pad, not two): there you scale from the sink crop to the sink compose
> rectangle, then do a source crop and output that to the source pad. But that only
> makes sense if you can actually do a source crop in the hardware. If you can't, then
> it again reduces to just a sink crop and scaling to the source media bus format.
> 
> In any case, imx274 definitely doesn't do composition, so that should be removed.

-- 
Kind regards,

Sakari Ailus
