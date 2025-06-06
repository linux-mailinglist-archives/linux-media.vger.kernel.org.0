Return-Path: <linux-media+bounces-34235-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED240AD01FA
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 14:12:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0CFBD174A57
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 12:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52026288521;
	Fri,  6 Jun 2025 12:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Q0ItGubo";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OY3NIpiQ"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5A0286D50;
	Fri,  6 Jun 2025 12:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749211849; cv=none; b=HgLqrpBI3zlIDln2+hlvRum+oSZf93JArm9DCFEHp/+tsyzOYUTONPWpObY/jGUfzRd3uwtza+/PTFJfc8ZJMb5qPakOGKER4WIQIGLxDKZ47kA+jgDI7qnRensQQnZ2X3KlR1tI29Vr68PaVivNQpfwa1fL72QTwriS7uW0Ux8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749211849; c=relaxed/simple;
	bh=94KB+HcYMpVi/wawb67zOdido85ReHZmMuc6et4mXYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DvKv0HGOv9dh9ZWKPdYP6+Lunc8v1qd99IEUaYwmbSFLzqzEnvfa9boWX47ki4SFnAWFKHHdrkKLjFt8CI6qTTrWFjFChxgtoRdudsaf9Dr56lBa7wrejRp/XR73+XD6r5LMebb/yc7fzJIhwPK5F2ZR5dJu+kbdt/4fhCZAzrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Q0ItGubo; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OY3NIpiQ; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id F308C1380364;
	Fri,  6 Jun 2025 08:10:46 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 06 Jun 2025 08:10:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749211846;
	 x=1749298246; bh=srmFHO4uL8kW5asVRGGF3E5jltaHcp9O7yYYE2vQeo0=; b=
	Q0ItGubonJBMIcUZmcFsS0agDZJNRA47lQuRNL5EcDCaTvV/b8P/IB2bYkvoWr7Y
	lM5ArBw3mrOk3At7RK/3ehjLXJJn5vhJClK2KdJr1Jj+kU3J0tXK/pNGDzD1403T
	y3vOulwpzCggLVDLh9V0oC9c/SEGtC9GuOLJ6I85MBsTHWGqoWj7hgzoX0L6OezJ
	2sIw6OlQXaSSeAt+meTOaHZV/Z9aaEMS9QtAJwv+2d4w559NsYIzvVSK309EeLta
	B7F8OHoR6DBYGS8ACoZ4Iv8qzkjtxUKb9aiQu0hKdXGBFpkp4bs6Zd7zOMRYFTjF
	On1xT6aSfnMKqgrcuPGh4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749211846; x=
	1749298246; bh=srmFHO4uL8kW5asVRGGF3E5jltaHcp9O7yYYE2vQeo0=; b=O
	Y3NIpiQ8LJuVteNrxXwF1OocK10zs6hJtDv+icH+maxBUbCZKQq8t0ZoURor5Lyi
	UiXfbJznwe2MFSfc33Bl+LLstv2iC+GsOC09E1QaUH6/ONrb2z0Y8DOX6Tm/0/vz
	6NejvNv8L2Noajjch1rlsGLil+ffRKOKD4vmK8idPow2/6HvQb2WTc4/dBZ78VKP
	NFFGAPH/cVVBbxku/tTLZy2vMae1p3oY8TxgsRsOB6bKVtnm7V27b3LnRpvsE6mt
	KMDaqRTfFDeSWaIRQR44Upne9A39lwIk81nWy2xK06njDVNgCAQmJobbHVczhp7m
	ciVV6qdS1p2uThw+huaQw==
X-ME-Sender: <xms:xtpCaHGL9PGvmVn42yhgPKlAg13tl4iIqY7YT3mpBQbI3sXIAXi2lQ>
    <xme:xtpCaEUBiYzBZyiAlPjIG2XlnVs1T4zDQUzpILKzPc7XsGVg_e58XswhysSbB0LFC
    p2lQc4fYDa01Htiokw>
X-ME-Received: <xmr:xtpCaJLgdeaXH8lcKR5bC-X_dVfyhJCWoekZ2Qbg_YlWQ5ggY6cpxfOnO7I2qDk1bklspXrs3WxxFEtpZK9vUHBk_XPAMZCjUQ>
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
X-ME-Proxy: <xmx:xtpCaFE2b--U_-bZj1the4yFUFB3ebzaA0E6KeFHdioHa6aEk0LzJQ>
    <xmx:xtpCaNWqFmqOFcgDjKZnnQnL7cFZOnAP8yq172DLlO56UXBFa5mL6Q>
    <xmx:xtpCaAO3ZDxj_2KvB1UCb2VwCAwPif_I1SANtwl1zEy0o_j8d2zBzA>
    <xmx:xtpCaM0vsPZjwx-_7UwJJIlc12llYuQLHr-xlXW5Ev3NfrqxL57oMg>
    <xmx:xtpCaOsDyyhOtNkW-DvqJeGCtffgl2MuWECCXGgR06KsQwrB3t3UniSo>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Jun 2025 08:10:46 -0400 (EDT)
Date: Fri, 6 Jun 2025 14:10:45 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v3 09/15] media: rcar-isp: Switch to Streams API
Message-ID: <20250606121045.GF2770609@ragnatech.se>
References: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
 <20250530-rcar-streams-v3-9-026655df7138@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250530-rcar-streams-v3-9-026655df7138@ideasonboard.com>

Hi Tomi,

Thanks for your work.

On 2025-05-30 16:50:38 +0300, Tomi Valkeinen wrote:
> Switch to Streams API with a single hardcoded route. This breaks any
> existing userspace which depended on the custom rcar streams
> implementation, but a single camera use case should continue to work.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/renesas/rcar-isp/csisp.c | 62 ++++++++++++++++++++++---
>  1 file changed, 55 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
> index 2337c5d44c40..a04cbf96b809 100644
> --- a/drivers/media/platform/renesas/rcar-isp/csisp.c
> +++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
> @@ -124,6 +124,17 @@ static const struct rcar_isp_format rcar_isp_formats[] = {
>  	},
>  };
>  
> +static const struct v4l2_mbus_framefmt risp_default_fmt = {
> +	.width = 1920,
> +	.height = 1080,
> +	.code = MEDIA_BUS_FMT_RGB888_1X24,
> +	.colorspace = V4L2_COLORSPACE_SRGB,
> +	.field = V4L2_FIELD_NONE,
> +	.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT,
> +	.quantization = V4L2_QUANTIZATION_DEFAULT,
> +	.xfer_func = V4L2_XFER_FUNC_DEFAULT,
> +};
> +
>  static const struct rcar_isp_format *risp_code_to_fmt(unsigned int code)
>  {
>  	unsigned int i;
> @@ -222,7 +233,7 @@ static int risp_start(struct rcar_isp *isp, struct v4l2_subdev_state *state)
>  	u32 sel_csi = 0;
>  	int ret;
>  
> -	fmt = v4l2_subdev_state_get_format(state, RCAR_ISP_SINK);
> +	fmt = v4l2_subdev_state_get_format(state, RCAR_ISP_SINK, 0);
>  	if (!fmt)
>  		return -EINVAL;
>  
> @@ -336,7 +347,7 @@ static int risp_set_pad_format(struct v4l2_subdev *sd,
>  			       struct v4l2_subdev_state *state,
>  			       struct v4l2_subdev_format *format)
>  {
> -	struct v4l2_mbus_framefmt *framefmt;
> +	struct v4l2_mbus_framefmt *fmt;
>  
>  	if (format->pad > RCAR_ISP_SINK)
>  		return v4l2_subdev_get_fmt(sd, state, format);
> @@ -344,10 +355,20 @@ static int risp_set_pad_format(struct v4l2_subdev *sd,
>  	if (!risp_code_to_fmt(format->format.code))
>  		format->format.code = rcar_isp_formats[0].code;
>  
> -	for (unsigned int i = 0; i < RCAR_ISP_NUM_PADS; i++) {
> -		framefmt = v4l2_subdev_state_get_format(state, i);
> -		*framefmt = format->format;
> -	}
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
> +
> +	*fmt = format->format;
>  
>  	return 0;
>  }
> @@ -364,6 +385,32 @@ static const struct v4l2_subdev_ops rcar_isp_subdev_ops = {
>  	.pad	= &risp_pad_ops,
>  };
>  
> +static int risp_init_state(struct v4l2_subdev *sd,
> +			   struct v4l2_subdev_state *state)
> +{
> +	static struct v4l2_subdev_route routes[] = {
> +		{
> +			.sink_pad = RCAR_ISP_SINK,
> +			.sink_stream = 0,
> +			.source_pad = RCAR_ISP_PORT0,
> +			.source_stream = 0,
> +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> +		},
> +	};
> +
> +	static const struct v4l2_subdev_krouting routing = {
> +		.num_routes = ARRAY_SIZE(routes),
> +		.routes = routes,
> +	};
> +
> +	return v4l2_subdev_set_routing_with_fmt(sd, state, &routing,
> +						&risp_default_fmt);
> +}
> +
> +static const struct v4l2_subdev_internal_ops risp_internal_ops = {
> +	.init_state = risp_init_state,
> +};
> +
>  /* -----------------------------------------------------------------------------
>   * Async handling and registration of subdevices and links
>   */
> @@ -521,11 +568,12 @@ static int risp_probe(struct platform_device *pdev)
>  
>  	isp->subdev.owner = THIS_MODULE;
>  	isp->subdev.dev = &pdev->dev;
> +	isp->subdev.internal_ops = &risp_internal_ops;
>  	v4l2_subdev_init(&isp->subdev, &rcar_isp_subdev_ops);
>  	v4l2_set_subdevdata(&isp->subdev, &pdev->dev);
>  	snprintf(isp->subdev.name, sizeof(isp->subdev.name), "%s %s",
>  		 KBUILD_MODNAME, dev_name(&pdev->dev));
> -	isp->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	isp->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
>  
>  	isp->subdev.entity.function = MEDIA_ENT_F_VID_MUX;
>  	isp->subdev.entity.ops = &risp_entity_ops;
> 
> -- 
> 2.43.0
> 

-- 
Kind Regards,
Niklas Söderlund

