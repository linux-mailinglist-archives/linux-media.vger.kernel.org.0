Return-Path: <linux-media+bounces-10618-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2218B9C4E
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 16:32:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8FF61F213EC
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 14:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C63151534F1;
	Thu,  2 May 2024 14:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="i9U5/m8Y";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PA1je1YW"
X-Original-To: linux-media@vger.kernel.org
Received: from wfout2-smtp.messagingengine.com (wfout2-smtp.messagingengine.com [64.147.123.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A21837147;
	Thu,  2 May 2024 14:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714660358; cv=none; b=Qx8LkV+jA+co8G4nYQPeeHM4Srt54dTAY1cn3qxslKfUzP7/tE/VU8YspiFhwC0oPdN8BrKuU40JakJGxuJVNeQ+0M8PTQqOiPbHvU+80n5XkcbQONKs6LDfr4esg3xpJYW3WKKCoKb+uYSgWmEDNdzscQhXgA547hx9UcWq3BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714660358; c=relaxed/simple;
	bh=RqAnSx+KzYh6ZEOpOWgdHS7xtq5H39cCwtWzX8vo99Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=brp8JvMAN3juTJq1eNhOTkMaO1xg5gRi/cDLc+lgRa8qq2S5UQy5TJRz9QGwU+N3VrzzV9Aj9bY8mNbX91eaXiMIADAikt1kr0F49QVVWZtiC189NmodfaH4ywITVt+y0zs/lVbc82LZhIAL1USaRhf0p9+Zle9Na9qCQQ89M9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=i9U5/m8Y; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PA1je1YW; arc=none smtp.client-ip=64.147.123.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.west.internal (Postfix) with ESMTP id 161911C000F7;
	Thu,  2 May 2024 10:32:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 02 May 2024 10:32:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1714660354;
	 x=1714746754; bh=Pu18m+7ZT3rJnyWEQflaohmTeVn0k6CGMJZ/j8EXybQ=; b=
	i9U5/m8Y9jXt5cT8QuWbEa9mbCBQfIVfKDI87g4yxieRFXQEg7qVD/MlULTNMAdg
	J3/fFEBWLaFPIck+yKvP15GnLdpDsjsUo3lp7kvdVtOMnhKbx2TsP7FLpiT/Kma+
	dSGGFVXet2FrkoqTBIx3yxUGIvR+9TVU7K1FA92y49rKiB8MUlieXGvI3D95RdIt
	hG4Gc4fMMDdshz0eWoytE1xfBuxf0BofPwspsHRF/QPj2ChiGlmT3mlWTrtCwI2n
	A1VCF1/h8N8b/rQtLaDFHI0Hhj31PmOGVa1S5JCHgAb7kzNfXw03JaC2cT+2Afll
	vP0pmCBowp8uSasuvMxoCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1714660354; x=
	1714746754; bh=Pu18m+7ZT3rJnyWEQflaohmTeVn0k6CGMJZ/j8EXybQ=; b=P
	A1je1YWQ5jx9VryPoQyog6yiAXh1mKgoImr+ZO18X+A0mxZSJrLjCE20kUDITIAd
	UuBLzVBkI5Tg4TXZqpGMG43VM3L3OroH8ei9zZ/vbP0OtiYd5iwJWJGxxgnuz6i9
	UTZ94J1nLclPfmrzpNEU2j/gVmRoPM06ZZIbToqzGMjWPon2WY89NuOvzKbnvhPP
	dUuWTDFSYywmodGPj3u69g5GmWE1Mogy2f2pjckrdUt3SdY1T/qt4FzOqUB9SnRx
	6bNQygamVaTylgjrGtc2KycfY4o7zjmXSOH8oUfzpxEF2+RpB9Fq84Nd0rTVn537
	B9FCgH0a+2FE5dXxW8mWw==
X-ME-Sender: <xms:AqQzZu920Xjjwqj662C9QU50Sm9jNrkhszgJ1eHyt8hLqQrhSULHwA>
    <xme:AqQzZut5VNDdAf9_yp8F4k7bFeVNkPf49aym5c8kSHt0tMWACzBPCKUCRkzT35Q9b
    YmTiAUluDKKyd1bDTI>
X-ME-Received: <xmr:AqQzZkBjhb8c7iOC4SXxBQy8krWH-CG0eLsMjnSkzM3iyPCKmqJ8QNPAatKpcbIS5Y_Y5B71_tVQfpU-X1T0saCTr0BS5Qs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddukedgjeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefh
    ffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:AqQzZmcu2qZlj1R4U5L7XdTATYZIJI25UIdcuJ9SfRAeVeJ0Iyu0wg>
    <xmx:AqQzZjMQzmVIovjGRkhWj8EmrEcilaXL1rv2-3jCXqDn4GSeuEG94Q>
    <xmx:AqQzZglUNSUTaN_MzW6BhgkF_mWrayhyTOA6zf2fSwJTEH7H9wzrvQ>
    <xmx:AqQzZltvHnrPrAxVQhrsXbpjKDYyHXavTZ-LHcjKfCUL0pudNusvTA>
    <xmx:AqQzZudUTN-Yj4YXjWtlIOWBSpTYz3cN0YWPVEM5bTDl2PHbBD1ibuxz>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 May 2024 10:32:33 -0400 (EDT)
Date: Thu, 2 May 2024 16:32:32 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 17/19] media: rcar-csi2: Store format in the subdev state
Message-ID: <20240502143232.GC3927860@ragnatech.se>
References: <20240430103956.60190-1-jacopo.mondi@ideasonboard.com>
 <20240430103956.60190-18-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240430103956.60190-18-jacopo.mondi@ideasonboard.com>

Hi Jacpop,

Thanks for your work.

On 2024-04-30 12:39:53 +0200, Jacopo Mondi wrote:
> Store the format in the subdevice state. Disallow setting format
> on the source pads, as formats are set on the sink pad streams and
> propagated to the source streams.
> 
> Now that the driver doesn't store the active format in the
> driver-specific structure, also remove the mutex and use the lock
> associated with the state.

Can't this whole patch be broken out to an independent patch and 
upstreamed already independent from the streams work?

> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/rcar-csi2.c | 54 +++++++---------------
>  1 file changed, 16 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> index ffb73272543b..ed818a6fa655 100644
> --- a/drivers/media/platform/renesas/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-csi2.c
> @@ -621,8 +621,6 @@ struct rcar_csi2 {
>  
>  	int channel_vc[4];
>  
> -	struct mutex lock; /* Protects mf and stream_count. */
> -	struct v4l2_mbus_framefmt mf;
>  	int stream_count;
>  
>  	bool cphy;
> @@ -1263,43 +1261,28 @@ static int rcsi2_s_stream(struct v4l2_subdev *sd, int enable)
>  }
>  
>  static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
> -				struct v4l2_subdev_state *sd_state,
> +				struct v4l2_subdev_state *state,
>  				struct v4l2_subdev_format *format)
>  {
> -	struct rcar_csi2 *priv = sd_to_csi2(sd);
> -	struct v4l2_mbus_framefmt *framefmt;
> +	struct v4l2_mbus_framefmt *fmt;
>  
> -	mutex_lock(&priv->lock);
> +	/*
> +	 * Format is propagated from sink streams to source streams, so
> +	 * disallow setting format on the source pads.
> +	 */
> +	if (format->pad > RCAR_CSI2_SINK)
> +		return -EINVAL;
>  
>  	if (!rcsi2_code_to_fmt(format->format.code))
>  		format->format.code = rcar_csi2_formats[0].code;
>  
> -	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> -		priv->mf = format->format;
> -	} else {
> -		framefmt = v4l2_subdev_state_get_format(sd_state, 0);
> -		*framefmt = format->format;
> -	}
>  
> -	mutex_unlock(&priv->lock);
> +	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
> +	*fmt = format->format;
>  
> -	return 0;
> -}
> -
> -static int rcsi2_get_pad_format(struct v4l2_subdev *sd,
> -				struct v4l2_subdev_state *sd_state,
> -				struct v4l2_subdev_format *format)
> -{
> -	struct rcar_csi2 *priv = sd_to_csi2(sd);
> -
> -	mutex_lock(&priv->lock);
> -
> -	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
> -		format->format = priv->mf;
> -	else
> -		format->format = *v4l2_subdev_state_get_format(sd_state, 0);
> -
> -	mutex_unlock(&priv->lock);
> +	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
> +							   format->stream);
> +	*fmt = format->format;
>  
>  	return 0;
>  }
> @@ -1310,7 +1293,7 @@ static const struct v4l2_subdev_video_ops rcar_csi2_video_ops = {
>  
>  static const struct v4l2_subdev_pad_ops rcar_csi2_pad_ops = {
>  	.set_fmt = rcsi2_set_pad_format,
> -	.get_fmt = rcsi2_get_pad_format,
> +	.get_fmt = v4l2_subdev_get_fmt,
>  };
>  
>  static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {
> @@ -2031,20 +2014,19 @@ static int rcsi2_probe(struct platform_device *pdev)
>  
>  	priv->dev = &pdev->dev;
>  
> -	mutex_init(&priv->lock);
>  	priv->stream_count = 0;
>  
>  	ret = rcsi2_probe_resources(priv, pdev);
>  	if (ret) {
>  		dev_err(priv->dev, "Failed to get resources\n");
> -		goto error_mutex;
> +		return ret;
>  	}
>  
>  	platform_set_drvdata(pdev, priv);
>  
>  	ret = rcsi2_parse_dt(priv);
>  	if (ret)
> -		goto error_mutex;
> +		return ret;
>  
>  	priv->subdev.owner = THIS_MODULE;
>  	priv->subdev.dev = &pdev->dev;
> @@ -2094,8 +2076,6 @@ static int rcsi2_probe(struct platform_device *pdev)
>  error_async:
>  	v4l2_async_nf_unregister(&priv->notifier);
>  	v4l2_async_nf_cleanup(&priv->notifier);
> -error_mutex:
> -	mutex_destroy(&priv->lock);
>  
>  	return ret;
>  }
> @@ -2110,8 +2090,6 @@ static void rcsi2_remove(struct platform_device *pdev)
>  	v4l2_subdev_cleanup(&priv->subdev);
>  
>  	pm_runtime_disable(&pdev->dev);
> -
> -	mutex_destroy(&priv->lock);
>  }
>  
>  static struct platform_driver rcar_csi2_pdrv = {
> -- 
> 2.44.0
> 

-- 
Kind Regards,
Niklas Söderlund

