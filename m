Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A643346087
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 14:57:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231898AbhCWN5U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 09:57:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231876AbhCWN5M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 09:57:12 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFEF5C061574
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 06:57:11 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id z25so25711257lja.3
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 06:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=NaVsjN2sQ85OkPKPedWSaLLfTde+3AfW4LO/mYg+LRY=;
        b=A5Q3+JgKqUy/kigqBuBCZNyIFf9jxNfBA/HXRezH0NJK2TQbvIrq+/QMTetY4rRyIl
         UrLSXmNI2FqjtvQgcmVOjsYilFVJ59MEkmhhI9OxzM2Lj8PYgJIHFYabpr2yIr0OV9ma
         g749r76mf29VZ60QWpl32BAl6mE3fy+XFicsDOPAWtfxwb9uYFNVbYYaiuUY4JDui4SZ
         cISKeMl9iG5uWwcyIJjEskAUCxpJaIq13OHEQuhi2H7+mz9t+TrAXhl+kWuyLU7QLeRH
         vuOeXHeNI+OV+cNIwm3uNmU1tlE7qJodGpO1HQcMe6cyn31a7yNRcMn7ltKHm8To1mOW
         0ViA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=NaVsjN2sQ85OkPKPedWSaLLfTde+3AfW4LO/mYg+LRY=;
        b=B07zZPPdA/2LD/xkCrU2CYwfZay2J2GKwtOBNss7n4FNRkmAzHSfc2Yl9boEkswGtZ
         BqPiqq7WkuZm6VRqKw9bIzNLb4a9T5OjKKq9o9sHYqMNMbIp+uiCRdh4L7hxp4pT0voM
         2BHE9n6xVM6eXyW9tuyWBwKKZBik8U0KSLa/G7FnCz4NLunrEcr1dwFIBjIt1CHZxngA
         hKmoWNes4JaGJp70FtKSK/zZC19VkmXS9b8sBGz6PTdPuS+izATDYCNATBSQzwMnudCc
         QY5MZB98sy0NBx1LXMvsM1dea+WbvFNFLl4U/LXoGHGTs/WxQ3ZEGjWvbPl5/JsfwsIv
         9XDw==
X-Gm-Message-State: AOAM530TIqBg650fSoKallo4Lx3JLREpg87keLRwZ8x6kDJp42fjBh5/
        NvMdLW3Vyi1X7wKvJB4iPNOc5w==
X-Google-Smtp-Source: ABdhPJyVQSORyaoHKFhui84VizYoBkc/xQ1PPikVQzc3Pb72eHJiiRmr3jG+nGUi3CC7Px9R8RjOVg==
X-Received: by 2002:a2e:8002:: with SMTP id j2mr3368865ljg.31.1616507830224;
        Tue, 23 Mar 2021 06:57:10 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id u9sm2408767ljj.0.2021.03.23.06.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 06:57:06 -0700 (PDT)
Date:   Tue, 23 Mar 2021 14:57:05 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Andrey Konovalov <andrey.konovalov@linaro.org>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        mchehab@kernel.org, bparrot@ti.com, mickael.guene@st.com
Subject: Re: [RFC PATCH 1/4] media: rcar-vin: use v4l2_get_link_freq() to
 calculate phypll frequency
Message-ID: <YFnzsVjSoUsOtY/O@oden.dyn.berto.se>
References: <20210303180817.12285-1-andrey.konovalov@linaro.org>
 <20210303180817.12285-2-andrey.konovalov@linaro.org>
 <YEYqzMEWjtGedMnV@oden.dyn.berto.se>
 <20210323131041.GB3@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210323131041.GB3@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On 2021-03-23 15:10:41 +0200, Sakari Ailus wrote:
> Hi Niklas,
> 
> On Mon, Mar 08, 2021 at 02:46:52PM +0100, Niklas Söderlund wrote:
> > Hi Andrey,
> > 
> > Thanks for your patch.
> > 
> > On 2021-03-03 21:08:14 +0300, Andrey Konovalov wrote:
> > > To get the link frequency value, or to calculate a parameter depending on
> > > it the receiver driver should use V4L2_CID_LINK_FREQ. If V4L2_CID_LINK_FREQ
> > > control is not implemented in the remote subdevice, the link frequency
> > > can be calculated from V4L2_CID_PIXEL_RATE control value. But the latter
> > > may not give the correct link frequency, and should only be used as the
> > > last resort. v4l2_get_link_freq() does exactly that, so use it instead
> > > of reading V4L2_CID_PIXEL_RATE directly.
> > 
> > I like the direction this patch is taking, but I'm a bit concerned about 
> > that V4L2_CID_LINK_FREQ is not able to replace V4L2_CID_PIXEL_RATE as it 
> > is designed today. Maybe my concern is unfounded and only reflects my 
> > own misunderstanding of the API.
> > 
> > When I wrote this code I tried to first do it using V4L2_CID_LINK_FREQ 
> > but I found no way to be able to express the wide rang of values needed 
> > for my use-case given that V4L2_CID_LINK_FREQ is a menu control. I had 
> 
> I think we could make it alternatively a 64-bit integer control if that
> helps. The helper needs to be adjusted accordingly.

That would solve my concern.

> 
> > to use V4L2_CID_PIXEL_RATE as it allowed me to at runtime calculate and 
> > report the link speed based on input formats. The Use-cases I need to 
> > address are where CSI-2 transmitter themself are a bridge in the video 
> > pipeline, for example
> 
> Is the actual bus frequency changed based on this?

Yes

> 
> Depending on the system where this chip is being used, only certain
> frequencies may be allowed on that bus. It would be most straightforward to
> use only those, but on the other hand, if any frequency can be used and
> that is certain, then I have no objections to allowing that either. We
> simply would make the link-frequencies property optional.

The transmitter is a ADV748x and depending on the video input source 
(HDMI or CVBS) the output frequency changes. Failing to negotiate this 
of course results in the CSI-2 receiver never detecting LP-11.

> 
> > 
> > * Case 1 - HDMI video source
> > 
> > HDMI source -> ADV748x (HDMI-to-CSI-2) ->[CSI-2 bus]-> R-Car CSI-2 receiver
> > 
> > The R-Car CSI-2 receiver needs to know the CSI-2 link frequency and 
> > queries the ADV748x using V4L2_CID_PIXEL_RATE. The ADV748x reports the 
> > pixel rate based on the HDMI format detected on its sink pad.
> > 
> > This could be done using V4L2_CID_LINK_FREQ, but as it's a menu control 
> > it becomes rather tricky to populate it with all possible values, but I 
> > guess it could be doable?
> > 
> > * Case 2 - Multiple video streams over a CSI-2 bus (GMSL)
> > 
> > Camera 1 -|
> > Camera 2 -|
> > Camera 3 -|---> MAX9286 (GMSL-to CSI-2) ->[CSI-2 bus]-> R-Car CSI-2 receiver
> > Camera 4 -|
> > 
> > The MAX9286 has 4 sink pads each connected to an independent camera and 
> > a single CSI-2 source pad. When streaming starts the MAX9286 computes 
> > the total CSI-2 link speed as V4L2_CID_PIXEL_RATE based on the format on 
> > each of it's 4 sink pads.
> > 
> > As in case 1 this could be reported by V4L2_CID_LINK_FREQ but I don't 
> > see it as feasible to populate the menu control with all possible 
> > frequencies before hand.
> > 
> > Hopefully this is all easily solvable and I have only misunderstood how 
> > menu controls work. If not I think this needs to be considered as part 
> > of this series as otherwise it could leave the CSI-2 bridge drivers 
> > without a path forward.
> > 
> > > 
> > > Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> > 
> > I tested this and it works as expected. Also as expected it prints lots 
> > of warnings about the usage of V4L2_CID_PIXEL_RATE :-) Once I understand 
> > how I can fix the CSI-2 transmitters used as bridges in the R-Car boards 
> > I will be happy to add my tag to this series as well as fix the bridge 
> > drivers.
> > 
> > > ---
> > >  drivers/media/platform/rcar-vin/rcar-csi2.c | 18 +++++++-----------
> > >  1 file changed, 7 insertions(+), 11 deletions(-)
> > > 
> > > diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > > index e06cd512aba2..eec8f9dd9060 100644
> > > --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> > > +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > > @@ -455,29 +455,25 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
> > >  			   unsigned int lanes)
> > >  {
> > >  	struct v4l2_subdev *source;
> > > -	struct v4l2_ctrl *ctrl;
> > > -	u64 mbps;
> > > +	s64 mbps;
> > >  
> > >  	if (!priv->remote)
> > >  		return -ENODEV;
> > >  
> > >  	source = priv->remote;
> > >  
> > > -	/* Read the pixel rate control from remote. */
> > > -	ctrl = v4l2_ctrl_find(source->ctrl_handler, V4L2_CID_PIXEL_RATE);
> > > -	if (!ctrl) {
> > > -		dev_err(priv->dev, "no pixel rate control in subdev %s\n",
> > > +	/* Read the link frequency from the remote subdev. */
> > > +	mbps = v4l2_get_link_freq(source->ctrl_handler, bpp, 2 * lanes);
> > > +	if (mbps < 0) {
> > > +		dev_err(priv->dev, "failed to get link rate from subdev %s\n",
> > >  			source->name);
> > > -		return -EINVAL;
> > > +		return mbps;
> > >  	}
> > > -
> > >  	/*
> > >  	 * Calculate the phypll in mbps.
> > > -	 * link_freq = (pixel_rate * bits_per_sample) / (2 * nr_of_lanes)
> > >  	 * bps = link_freq * 2
> > >  	 */
> > > -	mbps = v4l2_ctrl_g_ctrl_int64(ctrl) * bpp;
> > > -	do_div(mbps, lanes * 1000000);
> > > +	do_div(mbps, 1000000 / 2);
> > >  
> > >  	return mbps;
> > >  }
> > > -- 
> > > 2.17.1
> > > 
> 
> -- 
> Kind regards,
> 
> Sakari Ailus

-- 
Regards,
Niklas Söderlund
