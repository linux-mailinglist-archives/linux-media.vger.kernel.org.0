Return-Path: <linux-media+bounces-34233-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C98AD01FC
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 14:12:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 454B6189C186
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 12:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E282F288C81;
	Fri,  6 Jun 2025 12:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="K0PmOV9t";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UzYpSCpl"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBAA288C06;
	Fri,  6 Jun 2025 12:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749211751; cv=none; b=smDw4pzpCnQSGsEXqgacCG8yUpwtOIOlplOS9tSwW7tkY57Na+eU31JVh5od0VhjW9Fp9/MokCRtwyUxt5xw++k0Db+lJJNTVUOtf0IPMG09kQe0dZzswHOITj2mRYr9DCtQuni7iBLPXMvU2UJCrcQ8amHhotd3wUIzK6EfKUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749211751; c=relaxed/simple;
	bh=zFRIM27wwxZXbKsRpeEfDaAcjX+vBobijyI5KCPtNxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IXvMm4ymG19AmcsZlzB7OrF+dmngHo8qKc/cZJfF30A9K6MCepOrSCSGY0vFt6/x4fdLtA8Fdzo0FHsm9JUpuVKu6XKfak4i/R/pGXZuwzHPO3DcJb+0cMBcrSfDSU9yFGbeRYVuWA8uFru5H81HsWrdZ6L1QTFEP2D1DJc0xWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=K0PmOV9t; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UzYpSCpl; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4F2641140120;
	Fri,  6 Jun 2025 08:09:08 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 06 Jun 2025 08:09:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749211748;
	 x=1749298148; bh=0U0W8fQoerOuoS9FHPhIiq60Nao0pTqP3T4WtFIsQpY=; b=
	K0PmOV9tNdxIsWGIyxihC15g+9IgrDmfdVgQkRhAVLuZEwjscsa813bHo+M7Rebe
	jEKiNa+GjH9x7bAnwiHKjE1IwP5IR7v02ZHrONVRaMD+Q5oEj8hjXxWYyp9tLtaz
	sjovJC3yPvgxAt71kNoY/ugH5/8obnm7Y9PDFITXBBwInnD8ry3iVjheONw4uZXU
	D9st8OfnirB0RnW/LsVObiPeeIn9PdbOUXeMyAlZGIGJgruFytseHXNFdzXeB/PG
	g0+Y9hI+TE7PetFPsJgkwUYko57/pl2NJfQwPiUNSzcGb7w800NbSYI3UtlEdOdf
	iM00uQVsQTp6hWsz3WwklA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749211748; x=
	1749298148; bh=0U0W8fQoerOuoS9FHPhIiq60Nao0pTqP3T4WtFIsQpY=; b=U
	zYpSCplOu3QcvtyMmprNCmKsAoVfLA8KnbWZM8ZJSBY4jf8yTQH1YGtP3VYphyMf
	v76clgyE0IzF7cf5Xu0J2HJWxWwqWwF4jdXYy7PCxOM4hw2XhVuurRmaxPGaE2gz
	TThhdrqf7L3b1b723g4qIAesCetyxggQjqQOGsABHoqjIFfRsBeomzAAHDsF5tUg
	UJwc5HlMgQPUet4nA0A581p/PshbWkdIBB3fQWrD1fYTAAvVnlZKV63Ikp3mpU/2
	nZBD/8qzW1Lzne3utpt9pea0GSyKQJLdR69me8onJNdUF302NO6pXuu0RMx035UF
	x+ExTBMe4xkxSUtQccuYw==
X-ME-Sender: <xms:ZNpCaOPtRu7yd81IFAx_S81EcdHu614FKZq8KlLzCjqHnzNwixauZg>
    <xme:ZNpCaM9XJ507sDmZlMLZ-GE3rZmDACrExMxCZhKOgB_uF5GWMAek54B4F4Yqx5ZtW
    -j86rVNmW-AXKE7U10>
X-ME-Received: <xmr:ZNpCaFS12K4bHfrVdchooYVq4vYxG0sttUn2bfmyd189I9620-IMveSaqhBpZp1sBxdByDX3Eq7Tq1YtrUcvYgRPcnwgfhn5FA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdehtdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeevteeg
    tddvvdfhtdekgefhfeefheetheekkeegfeejudeiudeuleegtdehkeekteenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshho
    uggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeelpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhdorhgv
    nhgvshgrshesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepmhgthhgvhh
    grsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshgrkhgrrhhirdgrihhluhhssehl
    ihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvh
    hgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghs
    qdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkh
    gvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgthhgvhhgr
    sgdohhhurgifvghisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlrghurhgvnhhtrd
    hpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepjhgr
    tghophhordhmohhnughisehiuggvrghsohhnsghorghrugdrtghomh
X-ME-Proxy: <xmx:ZNpCaOsYgmtyjzMBprCGFIgV0-ePQr4GFNxgJH5W23wy0aMj1rt9SQ>
    <xmx:ZNpCaGeCr6c5IT9o_SAYPqJanplCfW5Jj7ltrDRAPlB1cU7fhOVsTg>
    <xmx:ZNpCaC2svR4meb4DU-PVy9XxHIrd_tgPk0eRzk7FQdo9fh1fv8Kihw>
    <xmx:ZNpCaK9OjLGtU_4uM7C-gZtPDSXmicdAH41T_MIlvBOw8IC0RuPMgA>
    <xmx:ZNpCaDXVKtbTQP_ZxRpTiniUxdv1W0CAYBYoHv6RW58W2021fczH7x2l>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Jun 2025 08:09:07 -0400 (EDT)
Date: Fri, 6 Jun 2025 14:09:06 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v3 08/15] media: rcar-csi2: Switch to Streams API
Message-ID: <20250606120906.GE2770609@ragnatech.se>
References: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
 <20250530-rcar-streams-v3-8-026655df7138@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250530-rcar-streams-v3-8-026655df7138@ideasonboard.com>

Hi Tomi,

Thanks for your patch.

On 2025-05-30 16:50:37 +0300, Tomi Valkeinen wrote:
> Switch to Streams API with a single hardcoded route. This breaks any
> existing userspace which depended on the custom rcar streams
> implementation, but a single camera use case should continue to work.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/renesas/rcar-csi2.c | 47 +++++++++++++++++++++---------
>  1 file changed, 33 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> index e0a0fd96459b..20bd44274bd2 100644
> --- a/drivers/media/platform/renesas/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-csi2.c
> @@ -1028,7 +1028,7 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
>  		if (ret)
>  			return ret;
>  
> -		fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
> +		fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK, 0);
>  		if (!fmt)
>  			return -EINVAL;
>  
> @@ -1069,7 +1069,7 @@ static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv,
>  	int mbps, ret;
>  
>  	/* Use the format on the sink pad to compute the receiver config. */
> -	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
> +	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK, 0);
>  
>  	dev_dbg(priv->dev, "Input size (%ux%u%c)\n",
>  		fmt->width, fmt->height,
> @@ -1650,8 +1650,7 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
>  				struct v4l2_subdev_state *state,
>  				struct v4l2_subdev_format *format)
>  {
> -	struct rcar_csi2 *priv = sd_to_csi2(sd);
> -	unsigned int num_pads = rcsi2_num_pads(priv);
> +	struct v4l2_mbus_framefmt *fmt;
>  
>  	if (format->pad > RCAR_CSI2_SINK)
>  		return v4l2_subdev_get_fmt(sd, state, format);
> @@ -1659,11 +1658,20 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
>  	if (!rcsi2_code_to_fmt(format->format.code))
>  		format->format.code = rcar_csi2_formats[0].code;
>  
> -	*v4l2_subdev_state_get_format(state, format->pad) = format->format;
> +	/* Set sink format */
> +	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
> +	if (!fmt)
> +		return -EINVAL;
> +
> +	*fmt = format->format;
> +
> +	/* Propagate to source format */
> +	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
> +							   format->stream);
> +	if (!fmt)
> +		return -EINVAL;
>  
> -	/* Propagate the format to the source pads. */
> -	for (unsigned int i = RCAR_CSI2_SOURCE_VC0; i < num_pads; i++)
> -		*v4l2_subdev_state_get_format(state, i) = format->format;
> +	*fmt = format->format;
>  
>  	return 0;
>  }
> @@ -1683,8 +1691,15 @@ static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {
>  static int rcsi2_init_state(struct v4l2_subdev *sd,
>  			    struct v4l2_subdev_state *state)
>  {
> -	struct rcar_csi2 *priv = sd_to_csi2(sd);
> -	unsigned int num_pads = rcsi2_num_pads(priv);
> +	static struct v4l2_subdev_route routes[] = {
> +		{
> +			.sink_pad = RCAR_CSI2_SINK,
> +			.sink_stream = 0,
> +			.source_pad = RCAR_CSI2_SOURCE_VC0,
> +			.source_stream = 0,
> +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> +		},
> +	};
>  
>  	static const struct v4l2_mbus_framefmt rcar_csi2_default_fmt = {
>  		.width		= 1920,
> @@ -1697,10 +1712,13 @@ static int rcsi2_init_state(struct v4l2_subdev *sd,
>  		.xfer_func	= V4L2_XFER_FUNC_DEFAULT,
>  	};
>  
> -	for (unsigned int i = RCAR_CSI2_SINK; i < num_pads; i++)
> -		*v4l2_subdev_state_get_format(state, i) = rcar_csi2_default_fmt;
> +	static const struct v4l2_subdev_krouting routing = {
> +		.num_routes = ARRAY_SIZE(routes),
> +		.routes = routes,
> +	};
>  
> -	return 0;
> +	return v4l2_subdev_set_routing_with_fmt(sd, state, &routing,
> +						&rcar_csi2_default_fmt);
>  }
>  
>  static const struct v4l2_subdev_internal_ops rcar_csi2_internal_ops = {
> @@ -2356,7 +2374,8 @@ static int rcsi2_probe(struct platform_device *pdev)
>  	v4l2_set_subdevdata(&priv->subdev, &pdev->dev);
>  	snprintf(priv->subdev.name, sizeof(priv->subdev.name), "%s %s",
>  		 KBUILD_MODNAME, dev_name(&pdev->dev));
> -	priv->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	priv->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE |
> +			     V4L2_SUBDEV_FL_STREAMS;
>  
>  	priv->subdev.entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
>  	priv->subdev.entity.ops = &rcar_csi2_entity_ops;
> 
> -- 
> 2.43.0
> 

-- 
Kind Regards,
Niklas Söderlund

