Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBDD2345F12
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 14:11:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231301AbhCWNLN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 09:11:13 -0400
Received: from mga07.intel.com ([134.134.136.100]:44141 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231400AbhCWNKr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 09:10:47 -0400
IronPort-SDR: kzlhR2THY7/yGG9I04qcCLttpkCGb+aReoEVu4EnGQJLV7XVikr7foF0TsWkBjLMlazj0TVqEt
 I0bcPSFdz2NA==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="254469670"
X-IronPort-AV: E=Sophos;i="5.81,271,1610438400"; 
   d="scan'208";a="254469670"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2021 06:10:45 -0700
IronPort-SDR: TB0pjpsGyaSNhSZt7Stjo644GHuA4e/ocG0v8kANZw8HKrEXyHmPvPCcgLpdwf2xv1qFfKELpU
 +5O515dUS5jQ==
X-IronPort-AV: E=Sophos;i="5.81,271,1610438400"; 
   d="scan'208";a="374234642"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2021 06:10:43 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id AFC8C202B7;
        Tue, 23 Mar 2021 15:10:41 +0200 (EET)
Date:   Tue, 23 Mar 2021 15:10:41 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
Cc:     Andrey Konovalov <andrey.konovalov@linaro.org>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        mchehab@kernel.org, bparrot@ti.com, mickael.guene@st.com
Subject: Re: [RFC PATCH 1/4] media: rcar-vin: use v4l2_get_link_freq() to
 calculate phypll frequency
Message-ID: <20210323131041.GB3@paasikivi.fi.intel.com>
References: <20210303180817.12285-1-andrey.konovalov@linaro.org>
 <20210303180817.12285-2-andrey.konovalov@linaro.org>
 <YEYqzMEWjtGedMnV@oden.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YEYqzMEWjtGedMnV@oden.dyn.berto.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Mon, Mar 08, 2021 at 02:46:52PM +0100, Niklas Söderlund wrote:
> Hi Andrey,
> 
> Thanks for your patch.
> 
> On 2021-03-03 21:08:14 +0300, Andrey Konovalov wrote:
> > To get the link frequency value, or to calculate a parameter depending on
> > it the receiver driver should use V4L2_CID_LINK_FREQ. If V4L2_CID_LINK_FREQ
> > control is not implemented in the remote subdevice, the link frequency
> > can be calculated from V4L2_CID_PIXEL_RATE control value. But the latter
> > may not give the correct link frequency, and should only be used as the
> > last resort. v4l2_get_link_freq() does exactly that, so use it instead
> > of reading V4L2_CID_PIXEL_RATE directly.
> 
> I like the direction this patch is taking, but I'm a bit concerned about 
> that V4L2_CID_LINK_FREQ is not able to replace V4L2_CID_PIXEL_RATE as it 
> is designed today. Maybe my concern is unfounded and only reflects my 
> own misunderstanding of the API.
> 
> When I wrote this code I tried to first do it using V4L2_CID_LINK_FREQ 
> but I found no way to be able to express the wide rang of values needed 
> for my use-case given that V4L2_CID_LINK_FREQ is a menu control. I had 

I think we could make it alternatively a 64-bit integer control if that
helps. The helper needs to be adjusted accordingly.

> to use V4L2_CID_PIXEL_RATE as it allowed me to at runtime calculate and 
> report the link speed based on input formats. The Use-cases I need to 
> address are where CSI-2 transmitter themself are a bridge in the video 
> pipeline, for example

Is the actual bus frequency changed based on this?

Depending on the system where this chip is being used, only certain
frequencies may be allowed on that bus. It would be most straightforward to
use only those, but on the other hand, if any frequency can be used and
that is certain, then I have no objections to allowing that either. We
simply would make the link-frequencies property optional.

> 
> * Case 1 - HDMI video source
> 
> HDMI source -> ADV748x (HDMI-to-CSI-2) ->[CSI-2 bus]-> R-Car CSI-2 receiver
> 
> The R-Car CSI-2 receiver needs to know the CSI-2 link frequency and 
> queries the ADV748x using V4L2_CID_PIXEL_RATE. The ADV748x reports the 
> pixel rate based on the HDMI format detected on its sink pad.
> 
> This could be done using V4L2_CID_LINK_FREQ, but as it's a menu control 
> it becomes rather tricky to populate it with all possible values, but I 
> guess it could be doable?
> 
> * Case 2 - Multiple video streams over a CSI-2 bus (GMSL)
> 
> Camera 1 -|
> Camera 2 -|
> Camera 3 -|---> MAX9286 (GMSL-to CSI-2) ->[CSI-2 bus]-> R-Car CSI-2 receiver
> Camera 4 -|
> 
> The MAX9286 has 4 sink pads each connected to an independent camera and 
> a single CSI-2 source pad. When streaming starts the MAX9286 computes 
> the total CSI-2 link speed as V4L2_CID_PIXEL_RATE based on the format on 
> each of it's 4 sink pads.
> 
> As in case 1 this could be reported by V4L2_CID_LINK_FREQ but I don't 
> see it as feasible to populate the menu control with all possible 
> frequencies before hand.
> 
> Hopefully this is all easily solvable and I have only misunderstood how 
> menu controls work. If not I think this needs to be considered as part 
> of this series as otherwise it could leave the CSI-2 bridge drivers 
> without a path forward.
> 
> > 
> > Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> 
> I tested this and it works as expected. Also as expected it prints lots 
> of warnings about the usage of V4L2_CID_PIXEL_RATE :-) Once I understand 
> how I can fix the CSI-2 transmitters used as bridges in the R-Car boards 
> I will be happy to add my tag to this series as well as fix the bridge 
> drivers.
> 
> > ---
> >  drivers/media/platform/rcar-vin/rcar-csi2.c | 18 +++++++-----------
> >  1 file changed, 7 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > index e06cd512aba2..eec8f9dd9060 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > @@ -455,29 +455,25 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
> >  			   unsigned int lanes)
> >  {
> >  	struct v4l2_subdev *source;
> > -	struct v4l2_ctrl *ctrl;
> > -	u64 mbps;
> > +	s64 mbps;
> >  
> >  	if (!priv->remote)
> >  		return -ENODEV;
> >  
> >  	source = priv->remote;
> >  
> > -	/* Read the pixel rate control from remote. */
> > -	ctrl = v4l2_ctrl_find(source->ctrl_handler, V4L2_CID_PIXEL_RATE);
> > -	if (!ctrl) {
> > -		dev_err(priv->dev, "no pixel rate control in subdev %s\n",
> > +	/* Read the link frequency from the remote subdev. */
> > +	mbps = v4l2_get_link_freq(source->ctrl_handler, bpp, 2 * lanes);
> > +	if (mbps < 0) {
> > +		dev_err(priv->dev, "failed to get link rate from subdev %s\n",
> >  			source->name);
> > -		return -EINVAL;
> > +		return mbps;
> >  	}
> > -
> >  	/*
> >  	 * Calculate the phypll in mbps.
> > -	 * link_freq = (pixel_rate * bits_per_sample) / (2 * nr_of_lanes)
> >  	 * bps = link_freq * 2
> >  	 */
> > -	mbps = v4l2_ctrl_g_ctrl_int64(ctrl) * bpp;
> > -	do_div(mbps, lanes * 1000000);
> > +	do_div(mbps, 1000000 / 2);
> >  
> >  	return mbps;
> >  }
> > -- 
> > 2.17.1
> > 

-- 
Kind regards,

Sakari Ailus
