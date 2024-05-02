Return-Path: <linux-media+bounces-10616-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B668B9C37
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 16:23:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EEE63B21A7D
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 14:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 910F313C808;
	Thu,  2 May 2024 14:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Dvtqpbbq";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UvH6PHiu"
X-Original-To: linux-media@vger.kernel.org
Received: from wfout2-smtp.messagingengine.com (wfout2-smtp.messagingengine.com [64.147.123.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7B1152788;
	Thu,  2 May 2024 14:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714659805; cv=none; b=POhFEn827/U6p56ZG/ZWm8Z36G1kuMkowOzWSeMJEnYAVNrh6Uj7cHC8hkYGY3wzTn/ZvrAYaEiPFMXM6J0ub+JXjVvrXA7ztGLNbb8jS4FnmrZiujh0ETh8Rb/HZIQnapt17oxXbXQPXvnQxBLj38WxRKvI9i0vOlCUiyj3v7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714659805; c=relaxed/simple;
	bh=GJ3uN5JdspbkXMmokDlcqY/7zUWnAcNI8gGtinNh/RY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AXuJAxEaRV+f+tWw84hRoS4wa1PsgOUEvjRtODExmQPLG0FUnTxuTLUSoV9kYaX4XgAEYUIN3APi70/fm97l1L7C81k1FztZqcTYIDficEr2qBGeE5TkIJwUvrsg3OehfX4w4RNRhbySkV+J6h9hYijdU23pP14cW4Wi76CbCnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Dvtqpbbq; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UvH6PHiu; arc=none smtp.client-ip=64.147.123.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfout.west.internal (Postfix) with ESMTP id 7420D1C0010C;
	Thu,  2 May 2024 10:23:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Thu, 02 May 2024 10:23:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1714659800;
	 x=1714746200; bh=46OECL4cVd5CVboF0xSpknDu8QvTJTtAWcYdSMM6aQ4=; b=
	DvtqpbbqpIDXVtr2djKWefmylidjmu7sfsO3Wybu8R7R3cE1D1hC1g5ckOyWsCf+
	JUVhgFcYkWl3t9hpqvmAzzdJM8oFxpAD3gJXj65URud3VzQV+rq+cedvZiKq8O0l
	JuhzMq9CrlNFwXbGi0mzJGPE7F+THxVqiWdle56ntEK3w6NzHO/C3RKc5j+gfn9R
	3Dpk4ei3pn8BHYWtFuSqZXBPKX1BAjtH9g6KwAC23Qx0bpph7YwQ7mtoloIpmkGT
	Xmf5Yp5Zq9wa7HH0OgdYajtcHLuVnPFeMbbSZbAj/PX2EkN0Hv+huyYLuD64SJsI
	ZVKXxk3wfjwqBfhkl3EKNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1714659800; x=
	1714746200; bh=46OECL4cVd5CVboF0xSpknDu8QvTJTtAWcYdSMM6aQ4=; b=U
	vH6PHiuY2/c3MNYOktEAbEupcmTmAYONZZl9AvwxILynolf4GRssncKtA5pyjMik
	qZiLpizeNmyUE4q5d5g8PDQhGIw7DQ/txix7nesQ0a6N/CDgI6yZ2y5E9bgNwjxP
	3dVCW2OoyBwRH2z8FA3ERXmnounrX6dSJvABZKIOSq35QSJ5mDCHJxNWTyrO1IwQ
	48ktYQrR3CbrrFZE4RONJinPDWuQq+0Hd+xawClpAsv+eyAHrhS9B6Cxi8+gIkN7
	ycqChCqk/7umSCBQuIw4M4Zj8YnMvy1d7+2rrlAkkJCXc6zuovbvdGr5m0+mXqAx
	mAao5fp12ssFsuiSg1REw==
X-ME-Sender: <xms:16EzZrHvaP6YoPl5Y-3wAAn2btqaCRp8JE0YlVArQ7UsbOVfDacghw>
    <xme:16EzZoUwKVeWcfQLeXYll55K0AtHYh993lzG1K64F9zgHeVRho8nJ7oTEt83vsY1U
    b6KhSzQ2Xbtmxy2Mj4>
X-ME-Received: <xmr:16EzZtJ-HSYUuJ4EAjDS2UsGx0RZb5qq9AS9iW0jko75RM5sJqbWdRHwEMFnem1LHNQk448nDnk8nybpqFBMQ_tfIpNcWlU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddukedgjeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefh
    ffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:16EzZpEX-wQO7mUgQxOnsW7v8SrfjOqPQOtVDRVdqK9PyUnHlNrBZw>
    <xmx:16EzZhUTBWqjjp6hX9WFufS5XaPfzZobvVqJILzI1mmBqQ66HXbB5w>
    <xmx:16EzZkOakAGL1x7YXiXHB7LhU71aUN2uuK7ICmue--St-8_qfUXxJg>
    <xmx:16EzZg1yi1cNDiZ_m2XbCZ-u_ypUuFbfxVN9otgQ09swx1r9dBY0FQ>
    <xmx:2KEzZgHmg0JAgRyTnAvH-dEq6ZTzRoSUS4LO4E8chgZjehqD_ijZbRHR>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 May 2024 10:23:19 -0400 (EDT)
Date: Thu, 2 May 2024 16:23:16 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 15/19] media: rcar-csi2: Add support for multiplexed
 streams
Message-ID: <20240502142316.GA3927860@ragnatech.se>
References: <20240430103956.60190-1-jacopo.mondi@ideasonboard.com>
 <20240430103956.60190-16-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240430103956.60190-16-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thanks for your work.

On 2024-04-30 12:39:51 +0200, Jacopo Mondi wrote:
> Create and initialize the v4l2_subdev_state for the R-Car CSI-2 receiver
> in order to prepare to support multiplexed transmitters.
> 
> Create the subdevice state with v4l2_subdev_init_finalize() and
> implement the init_state() operation to guarantee the state is initialized.
> 
> The routing table within the R-Car CSI-2 receiver is fixed, streams
> received on source_stream X will be directed to pad (X + 1) by default.
> Initialize a static routing table with such routes set as active.
> 
> While at it, disable runtime_pm() in the probe() function error path.

Can we break this out in a separate patch? As the multiplexed stream 
work will not be ready for v6.10 if I understood the tendencies 
correctly (?), we can at least fix this issue before that.

> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/rcar-csi2.c | 74 +++++++++++++++++++++-
>  1 file changed, 72 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> index 582d5e35db0e..82dc0b92b8d3 100644
> --- a/drivers/media/platform/renesas/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-csi2.c
> @@ -1226,6 +1226,65 @@ static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {
>  	.pad	= &rcar_csi2_pad_ops,
>  };
>  
> +static int rcsi2_init_state(struct v4l2_subdev *sd,
> +			    struct v4l2_subdev_state *state)
> +{
> +	/*
> +	 * Routing is fixed for this device: streams sent on sink_stream X
> +	 * are directed to pad (X + 1). Which streams goes to the next
> +	 * processing block (VIN) is controlled by link enablement between the
> +	 * CSI-2 and the VIN itself and not by the CSI-2 routing table.
> +	 *
> +	 * The routing table is then fixed, as stream X will be directed to
> +	 * csi:(X + 1)/0 and will be transmitted to VINs the on media link
> +	 * csi2:(x + 1)->vin:0.
> +	 *
> +	 * For example, to route stream #3 to VIN #1 : "csi2:4/0 -> vin1:0" and
> +	 * to route stream #2 to VIN #4 : "csi2:3/0 -> vin4:0".
> +	 */
> +	struct v4l2_subdev_route routes[] = {
> +		{
> +			.sink_pad = RCAR_CSI2_SINK,
> +			.sink_stream = 0,
> +			.source_pad = RCAR_CSI2_SOURCE_VC0,
> +			.source_stream = 0,
> +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> +		},
> +		{
> +			.sink_pad = RCAR_CSI2_SINK,
> +			.sink_stream = 1,
> +			.source_pad = RCAR_CSI2_SOURCE_VC1,
> +			.source_stream = 0,
> +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> +		},
> +		{
> +			.sink_pad = RCAR_CSI2_SINK,
> +			.sink_stream = 2,
> +			.source_pad = RCAR_CSI2_SOURCE_VC2,
> +			.source_stream = 0,
> +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> +		},
> +		{
> +			.sink_pad = RCAR_CSI2_SINK,
> +			.sink_stream = 3,
> +			.source_pad = RCAR_CSI2_SOURCE_VC3,
> +			.source_stream = 0,
> +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> +		},
> +	};
> +
> +	struct v4l2_subdev_krouting routing = {
> +		.num_routes = ARRAY_SIZE(routes),
> +		.routes = routes,
> +	};

Should not the two structs above be static const as you return a pointer 
to them?

> +
> +	return v4l2_subdev_set_routing(sd, state, &routing);
> +}
> +
> +static const struct v4l2_subdev_internal_ops rcar_csi2_internal_ops = {
> +	.init_state = rcsi2_init_state,
> +};
> +
>  static irqreturn_t rcsi2_irq(int irq, void *data)
>  {
>  	struct rcar_csi2 *priv = data;
> @@ -1887,11 +1946,13 @@ static int rcsi2_probe(struct platform_device *pdev)
>  
>  	priv->subdev.owner = THIS_MODULE;
>  	priv->subdev.dev = &pdev->dev;
> +	priv->subdev.internal_ops = &rcar_csi2_internal_ops;
>  	v4l2_subdev_init(&priv->subdev, &rcar_csi2_subdev_ops);
>  	v4l2_set_subdevdata(&priv->subdev, &pdev->dev);
>  	snprintf(priv->subdev.name, sizeof(priv->subdev.name), "%s %s",
>  		 KBUILD_MODNAME, dev_name(&pdev->dev));
> -	priv->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	priv->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE |
> +			     V4L2_SUBDEV_FL_STREAMS;
>  
>  	priv->subdev.entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
>  	priv->subdev.entity.ops = &rcar_csi2_entity_ops;
> @@ -1912,14 +1973,22 @@ static int rcsi2_probe(struct platform_device *pdev)
>  
>  	pm_runtime_enable(&pdev->dev);
>  
> +	ret = v4l2_subdev_init_finalize(&priv->subdev);
> +	if (ret)
> +		goto error_pm_runtime;
> +
>  	ret = v4l2_async_register_subdev(&priv->subdev);
>  	if (ret < 0)
> -		goto error_async;
> +		goto error_subdev;
>  
>  	dev_info(priv->dev, "%d lanes found\n", priv->lanes);
>  
>  	return 0;
>  
> +error_subdev:
> +	v4l2_subdev_cleanup(&priv->subdev);
> +error_pm_runtime:
> +	pm_runtime_disable(&pdev->dev);
>  error_async:
>  	v4l2_async_nf_unregister(&priv->notifier);
>  	v4l2_async_nf_cleanup(&priv->notifier);
> @@ -1936,6 +2005,7 @@ static void rcsi2_remove(struct platform_device *pdev)
>  	v4l2_async_nf_unregister(&priv->notifier);
>  	v4l2_async_nf_cleanup(&priv->notifier);
>  	v4l2_async_unregister_subdev(&priv->subdev);
> +	v4l2_subdev_cleanup(&priv->subdev);
>  
>  	pm_runtime_disable(&pdev->dev);
>  
> -- 
> 2.44.0
> 

-- 
Kind Regards,
Niklas Söderlund

