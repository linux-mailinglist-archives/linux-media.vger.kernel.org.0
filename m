Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0CB8346B07
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 22:26:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233583AbhCWVZd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 17:25:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233444AbhCWVZ0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 17:25:26 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E45E7C061574
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 14:25:24 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1172BB1D;
        Tue, 23 Mar 2021 22:25:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616534722;
        bh=KSkiZ1GIxPl09NbzpPhmE+greGwz5sRMd3QjegEv9Ho=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hlLS3hLUvJXO0g31XzAsNSLkIBS4iQBHTGDS/h7SEdvAxIGmJGTZd82snRPAmG876
         oAd0nJaTr7q81YJWcdjJ2dx3xlCJiBe3prU7pmPbyWduNiEiGJZHZUMY1OgrM5CgXV
         UtGAaCDBWl1lIBEbDkRRi2gSuWzmYzMafuJcRywQ=
Date:   Tue, 23 Mar 2021 23:24:40 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        linux-media@vger.kernel.org, mchehab@kernel.org, bparrot@ti.com,
        mickael.guene@st.com
Subject: Re: [RFC PATCH 1/4] media: rcar-vin: use v4l2_get_link_freq() to
 calculate phypll frequency
Message-ID: <YFpcmES87wcY78Xy@pendragon.ideasonboard.com>
References: <20210303180817.12285-1-andrey.konovalov@linaro.org>
 <20210303180817.12285-2-andrey.konovalov@linaro.org>
 <YEYqzMEWjtGedMnV@oden.dyn.berto.se>
 <20210323131041.GB3@paasikivi.fi.intel.com>
 <YFnzsVjSoUsOtY/O@oden.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YFnzsVjSoUsOtY/O@oden.dyn.berto.se>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Tue, Mar 23, 2021 at 02:57:05PM +0100, Niklas Söderlund wrote:
> On 2021-03-23 15:10:41 +0200, Sakari Ailus wrote:
> > On Mon, Mar 08, 2021 at 02:46:52PM +0100, Niklas Söderlund wrote:
> > > On 2021-03-03 21:08:14 +0300, Andrey Konovalov wrote:
> > > > To get the link frequency value, or to calculate a parameter depending on
> > > > it the receiver driver should use V4L2_CID_LINK_FREQ. If V4L2_CID_LINK_FREQ
> > > > control is not implemented in the remote subdevice, the link frequency
> > > > can be calculated from V4L2_CID_PIXEL_RATE control value. But the latter
> > > > may not give the correct link frequency, and should only be used as the
> > > > last resort. v4l2_get_link_freq() does exactly that, so use it instead
> > > > of reading V4L2_CID_PIXEL_RATE directly.
> > > 
> > > I like the direction this patch is taking, but I'm a bit concerned about 
> > > that V4L2_CID_LINK_FREQ is not able to replace V4L2_CID_PIXEL_RATE as it 
> > > is designed today. Maybe my concern is unfounded and only reflects my 
> > > own misunderstanding of the API.
> > > 
> > > When I wrote this code I tried to first do it using V4L2_CID_LINK_FREQ 
> > > but I found no way to be able to express the wide rang of values needed 
> > > for my use-case given that V4L2_CID_LINK_FREQ is a menu control. I had 
> > 
> > I think we could make it alternatively a 64-bit integer control if that
> > helps. The helper needs to be adjusted accordingly.
> 
> That would solve my concern.
> 
> > > to use V4L2_CID_PIXEL_RATE as it allowed me to at runtime calculate and 
> > > report the link speed based on input formats. The Use-cases I need to 
> > > address are where CSI-2 transmitter themself are a bridge in the video 
> > > pipeline, for example
> > 
> > Is the actual bus frequency changed based on this?
> 
> Yes
> 
> > Depending on the system where this chip is being used, only certain
> > frequencies may be allowed on that bus. It would be most straightforward to
> > use only those, but on the other hand, if any frequency can be used and
> > that is certain, then I have no objections to allowing that either. We
> > simply would make the link-frequencies property optional.
> 
> The transmitter is a ADV748x and depending on the video input source 
> (HDMI or CVBS) the output frequency changes. Failing to negotiate this 
> of course results in the CSI-2 receiver never detecting LP-11.
>
> > > * Case 1 - HDMI video source
> > > 
> > > HDMI source -> ADV748x (HDMI-to-CSI-2) ->[CSI-2 bus]-> R-Car CSI-2 receiver
> > > 
> > > The R-Car CSI-2 receiver needs to know the CSI-2 link frequency and 
> > > queries the ADV748x using V4L2_CID_PIXEL_RATE. The ADV748x reports the 
> > > pixel rate based on the HDMI format detected on its sink pad.
> > > 
> > > This could be done using V4L2_CID_LINK_FREQ, but as it's a menu control 
> > > it becomes rather tricky to populate it with all possible values, but I 
> > > guess it could be doable?

There are, generally speaking, two different uses for this information
on the receiver side. We need to configure the DPHY timings that depend
on the link frequency, and we need to configure the functional clock of
the receiver and downstream IP cores to ensure they have enough
bandwidth to absorb all pixels. Those are two fundamentally different
issues:

- The DPHY timings depend on the link frequency, which is a well-defined
  physical concept. We currently compute it from the pixel rate, which
  is a more loosely defined concept (see below). Assuming the
  V4L2_CID_LINK_FREQ control can be made to report the actual link
  frequency (and given that this is the control's purpose, there's no
  other option than making it work, otherwise the control would be
  entirely pointless), possibly by turning it into an INT64 control,
  then that's the right control to use for this purpose.

- The functional clock of the video pipeline need to be able to absord
  the incoming pixels. If the clock is configurable, it means that it
  differs from the CSI-2 receiver clock (derived from the bus), which
  normally implies a FIFO between the CSI-2 receiver and the downstream
  blocks. The main constraint is that the FIFO shouldn't overflow, which
  in practice means that the effective average pixel rate per line on
  the input needs to be smaller or equal than on the output. This
  however doesn't mean that the input clock needs to be higher than the
  output clock, given that not only input and output bus widths can be
  different, but horizontal blanking can also be used to perform timing
  adjustements. For instance, if the input video stream has 1000 active
  and 3000 blanking pixels per line, assuming identical bus widths on
  the input and output side of the FIFO, we could have an output clock
  frequency equal to half of the input clock frequency, as long as the
  FIFO depth is at least 500 pixels. The output side would have a
  horizontal blanking of 1000 pixels. The same applies on the
  transmitter side, as there's often a FIFO between the pixel source
  (the pixel array for a sensor for instance, with a sampling clock
  rate) and the CSI-2 transmitter (running at the bus rate). The pixel
  rate is thus a much more fuzzy concept, isn't well-defined in V4L2,
  and can lead to all kind of interoperability issues. It should only be
  used along with blanking information, in order to perform rate
  adaptation calculations.

> > > * Case 2 - Multiple video streams over a CSI-2 bus (GMSL)
> > > 
> > > Camera 1 -|
> > > Camera 2 -|
> > > Camera 3 -|---> MAX9286 (GMSL-to CSI-2) ->[CSI-2 bus]-> R-Car CSI-2 receiver
> > > Camera 4 -|
> > > 
> > > The MAX9286 has 4 sink pads each connected to an independent camera and 
> > > a single CSI-2 source pad. When streaming starts the MAX9286 computes 
> > > the total CSI-2 link speed as V4L2_CID_PIXEL_RATE based on the format on 
> > > each of it's 4 sink pads.
> > > 
> > > As in case 1 this could be reported by V4L2_CID_LINK_FREQ but I don't 
> > > see it as feasible to populate the menu control with all possible 
> > > frequencies before hand.

As explained above, the CSI-2 frequency doesn't have to match the pixel
rate of the sensor(s). I haven't checked exactly how the MAX9286 handles
clock domains, but in general there source rate and the bus rate can be
different. That's why the link frequency is often a menu control with a
limited set of values (carefully selected by the system designer to
accommodate EMC constraints), while the source rate can vary more
freely. As long as the link frequency provides enough bandwidth, it
doesn't have to be tightly coupled with the pixel rate. For source
devices that have a single clock domain, and adjust the link frequency
to follow the source rate, then turning the link frequency control into
an INT64 would make sense.

> > > Hopefully this is all easily solvable and I have only misunderstood how 
> > > menu controls work. If not I think this needs to be considered as part 
> > > of this series as otherwise it could leave the CSI-2 bridge drivers 
> > > without a path forward.
> > > 
> > > > Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> > > 
> > > I tested this and it works as expected. Also as expected it prints lots 
> > > of warnings about the usage of V4L2_CID_PIXEL_RATE :-) Once I understand 
> > > how I can fix the CSI-2 transmitters used as bridges in the R-Car boards 
> > > I will be happy to add my tag to this series as well as fix the bridge 
> > > drivers.
> > > 
> > > > ---
> > > >  drivers/media/platform/rcar-vin/rcar-csi2.c | 18 +++++++-----------
> > > >  1 file changed, 7 insertions(+), 11 deletions(-)
> > > > 
> > > > diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > > > index e06cd512aba2..eec8f9dd9060 100644
> > > > --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> > > > +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > > > @@ -455,29 +455,25 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
> > > >  			   unsigned int lanes)
> > > >  {
> > > >  	struct v4l2_subdev *source;
> > > > -	struct v4l2_ctrl *ctrl;
> > > > -	u64 mbps;
> > > > +	s64 mbps;
> > > >  
> > > >  	if (!priv->remote)
> > > >  		return -ENODEV;
> > > >  
> > > >  	source = priv->remote;
> > > >  
> > > > -	/* Read the pixel rate control from remote. */
> > > > -	ctrl = v4l2_ctrl_find(source->ctrl_handler, V4L2_CID_PIXEL_RATE);
> > > > -	if (!ctrl) {
> > > > -		dev_err(priv->dev, "no pixel rate control in subdev %s\n",
> > > > +	/* Read the link frequency from the remote subdev. */
> > > > +	mbps = v4l2_get_link_freq(source->ctrl_handler, bpp, 2 * lanes);
> > > > +	if (mbps < 0) {
> > > > +		dev_err(priv->dev, "failed to get link rate from subdev %s\n",
> > > >  			source->name);
> > > > -		return -EINVAL;
> > > > +		return mbps;
> > > >  	}
> > > > -
> > > >  	/*
> > > >  	 * Calculate the phypll in mbps.
> > > > -	 * link_freq = (pixel_rate * bits_per_sample) / (2 * nr_of_lanes)
> > > >  	 * bps = link_freq * 2
> > > >  	 */
> > > > -	mbps = v4l2_ctrl_g_ctrl_int64(ctrl) * bpp;
> > > > -	do_div(mbps, lanes * 1000000);
> > > > +	do_div(mbps, 1000000 / 2);
> > > >  
> > > >  	return mbps;
> > > >  }

-- 
Regards,

Laurent Pinchart
