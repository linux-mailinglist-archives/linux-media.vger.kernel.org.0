Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE2D1330FE3
	for <lists+linux-media@lfdr.de>; Mon,  8 Mar 2021 14:47:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbhCHNr1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Mar 2021 08:47:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbhCHNqz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Mar 2021 08:46:55 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60F05C06174A
        for <linux-media@vger.kernel.org>; Mon,  8 Mar 2021 05:46:55 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id n16so21089231lfb.4
        for <linux-media@vger.kernel.org>; Mon, 08 Mar 2021 05:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=5Dm+bzTJ9FTKXxsnAclWWyq8mNkQEA1UpscC0ZlsddI=;
        b=bISbu241TtSOIjeJCQm8irOIw8V3pQbwyCXfDdYQaTysPWTYMMnbLzYTYN6mM4wo2g
         +E9Xo0FetYL7vpUJ8Xee5eb1N+ovLorLNrS0wyooZRwJrpChndhZDEMXxIyyi1oCttnh
         lPXhgKe49Ne8/cO3uyKbAxDS51/+1YSG7newd8VH0CvJFuYsGqLf/Fwpm+om81er+k5x
         RnjXFpOWvPWIodkZDLjWo49ZBoO/NSxrQ9Y6er7P09i7Y4owXXU5Oex5JEMDZCtazM2b
         q8crAK2pIXi4GZFjTeYrKRkONeT/4FSuAI46oxPtc7/ECtq1WqUH+sdjUE3Fv1ZTE4II
         rLYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=5Dm+bzTJ9FTKXxsnAclWWyq8mNkQEA1UpscC0ZlsddI=;
        b=fs5xq9enTDitZ1Pfrd138jEBZ8HDYBq1LuDR3VN2/c5Wql8EYFdhRLLsiQStUQfNO0
         yZHLertgGj0sM10kmHl92TCY/zWsy/FWXO1CzOw8d2B2i69WAsTHM1ifCtYX1xSlNsy1
         lEZJX9pctz8nlt8lH2xTiuIOTb4TlDxucQDpyfjjP4Em8q5KkZGXgNQPFcfemg7ZWFuH
         6+KSJszJRtitkNk6Pz7JiBRfqDELWs1XHFEskrzyq6Yc4UcZiGEzmtt0q+05X3wQr2IH
         +hx3ewlLPMJ9uITcMcbBoftlumlmP3wodptdW+dOA2koiAZwmR+N8bjVxQvQq/7drFX1
         ql8g==
X-Gm-Message-State: AOAM532cb13SWLZFkXt5CfvVu33QaRNnrYuC/1Ce6y0F2xbx8sIuezUl
        xDIzbQOpD+ZiXFifKU74SIQTcGNO5p2i1w==
X-Google-Smtp-Source: ABdhPJzhyhUr43mBp/rWitsNBRcoEYJbcujcgUIKbiJorvNVotZufwvvxSViyfx27YZICLMp+xbHgw==
X-Received: by 2002:a19:81d0:: with SMTP id c199mr13991575lfd.62.1615211213934;
        Mon, 08 Mar 2021 05:46:53 -0800 (PST)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id z9sm1499194lji.139.2021.03.08.05.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 05:46:52 -0800 (PST)
Date:   Mon, 8 Mar 2021 14:46:52 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     sakari.ailus@linux.intel.com, linux-media@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        bparrot@ti.com, mickael.guene@st.com
Subject: Re: [RFC PATCH 1/4] media: rcar-vin: use v4l2_get_link_freq() to
 calculate phypll frequency
Message-ID: <YEYqzMEWjtGedMnV@oden.dyn.berto.se>
References: <20210303180817.12285-1-andrey.konovalov@linaro.org>
 <20210303180817.12285-2-andrey.konovalov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210303180817.12285-2-andrey.konovalov@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andrey,

Thanks for your patch.

On 2021-03-03 21:08:14 +0300, Andrey Konovalov wrote:
> To get the link frequency value, or to calculate a parameter depending on
> it the receiver driver should use V4L2_CID_LINK_FREQ. If V4L2_CID_LINK_FREQ
> control is not implemented in the remote subdevice, the link frequency
> can be calculated from V4L2_CID_PIXEL_RATE control value. But the latter
> may not give the correct link frequency, and should only be used as the
> last resort. v4l2_get_link_freq() does exactly that, so use it instead
> of reading V4L2_CID_PIXEL_RATE directly.

I like the direction this patch is taking, but I'm a bit concerned about 
that V4L2_CID_LINK_FREQ is not able to replace V4L2_CID_PIXEL_RATE as it 
is designed today. Maybe my concern is unfounded and only reflects my 
own misunderstanding of the API.

When I wrote this code I tried to first do it using V4L2_CID_LINK_FREQ 
but I found no way to be able to express the wide rang of values needed 
for my use-case given that V4L2_CID_LINK_FREQ is a menu control. I had 
to use V4L2_CID_PIXEL_RATE as it allowed me to at runtime calculate and 
report the link speed based on input formats. The Use-cases I need to 
address are where CSI-2 transmitter themself are a bridge in the video 
pipeline, for example

* Case 1 - HDMI video source

HDMI source -> ADV748x (HDMI-to-CSI-2) ->[CSI-2 bus]-> R-Car CSI-2 receiver

The R-Car CSI-2 receiver needs to know the CSI-2 link frequency and 
queries the ADV748x using V4L2_CID_PIXEL_RATE. The ADV748x reports the 
pixel rate based on the HDMI format detected on its sink pad.

This could be done using V4L2_CID_LINK_FREQ, but as it's a menu control 
it becomes rather tricky to populate it with all possible values, but I 
guess it could be doable?

* Case 2 - Multiple video streams over a CSI-2 bus (GMSL)

Camera 1 -|
Camera 2 -|
Camera 3 -|---> MAX9286 (GMSL-to CSI-2) ->[CSI-2 bus]-> R-Car CSI-2 receiver
Camera 4 -|

The MAX9286 has 4 sink pads each connected to an independent camera and 
a single CSI-2 source pad. When streaming starts the MAX9286 computes 
the total CSI-2 link speed as V4L2_CID_PIXEL_RATE based on the format on 
each of it's 4 sink pads.

As in case 1 this could be reported by V4L2_CID_LINK_FREQ but I don't 
see it as feasible to populate the menu control with all possible 
frequencies before hand.

Hopefully this is all easily solvable and I have only misunderstood how 
menu controls work. If not I think this needs to be considered as part 
of this series as otherwise it could leave the CSI-2 bridge drivers 
without a path forward.

> 
> Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>

I tested this and it works as expected. Also as expected it prints lots 
of warnings about the usage of V4L2_CID_PIXEL_RATE :-) Once I understand 
how I can fix the CSI-2 transmitters used as bridges in the R-Car boards 
I will be happy to add my tag to this series as well as fix the bridge 
drivers.

> ---
>  drivers/media/platform/rcar-vin/rcar-csi2.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> index e06cd512aba2..eec8f9dd9060 100644
> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> @@ -455,29 +455,25 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
>  			   unsigned int lanes)
>  {
>  	struct v4l2_subdev *source;
> -	struct v4l2_ctrl *ctrl;
> -	u64 mbps;
> +	s64 mbps;
>  
>  	if (!priv->remote)
>  		return -ENODEV;
>  
>  	source = priv->remote;
>  
> -	/* Read the pixel rate control from remote. */
> -	ctrl = v4l2_ctrl_find(source->ctrl_handler, V4L2_CID_PIXEL_RATE);
> -	if (!ctrl) {
> -		dev_err(priv->dev, "no pixel rate control in subdev %s\n",
> +	/* Read the link frequency from the remote subdev. */
> +	mbps = v4l2_get_link_freq(source->ctrl_handler, bpp, 2 * lanes);
> +	if (mbps < 0) {
> +		dev_err(priv->dev, "failed to get link rate from subdev %s\n",
>  			source->name);
> -		return -EINVAL;
> +		return mbps;
>  	}
> -
>  	/*
>  	 * Calculate the phypll in mbps.
> -	 * link_freq = (pixel_rate * bits_per_sample) / (2 * nr_of_lanes)
>  	 * bps = link_freq * 2
>  	 */
> -	mbps = v4l2_ctrl_g_ctrl_int64(ctrl) * bpp;
> -	do_div(mbps, lanes * 1000000);
> +	do_div(mbps, 1000000 / 2);
>  
>  	return mbps;
>  }
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
