Return-Path: <linux-media+bounces-11257-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 063AC8C198A
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 00:42:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D9141C21AEE
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 22:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 898FD12D1F6;
	Thu,  9 May 2024 22:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="XwR2m+i+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NoKA++8Y"
X-Original-To: linux-media@vger.kernel.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8DC770E0;
	Thu,  9 May 2024 22:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715294547; cv=none; b=rETgwULOAUsFo/gdwKjO9XKKKIiKeaQWXTzr8zlTfe7kZs6fVyGITOsQtIGwFPbNY2TBkyp9F1Y43nfNQAZwYG5twWg+umYpBpMVGia1JYJuqH9EVIpWeuu+bTBfdzk9VHr1LMuanR7Rl6ZbEogF5zho9AfDh15bcUxj7x2j7pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715294547; c=relaxed/simple;
	bh=SJjvQ6MgCLY6xSbYnnRouloxy33T1dJZcZdAOA0GeN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m48LABMju6fA9Fp79x9JCARY1Xai5Ol+wThPJ5o0/Fr2u5k0E7ELXflaC3XpL+/HgSR3SQv+mShPdrVB7MKFdhJjU1BkWYKp1qTBFwycMwJ3f0xVtlofHsHAgPAOrTF0SHcsvro+TglTQm/mEPZwXQzMc4ZleI8lTy0wK+b2ZHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=XwR2m+i+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NoKA++8Y; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfout.nyi.internal (Postfix) with ESMTP id D987C1380E5A;
	Thu,  9 May 2024 18:42:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Thu, 09 May 2024 18:42:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1715294543;
	 x=1715380943; bh=9HvRFMpvUUEM4wRwjImHIB9DA55GsP9CgJOPKl3b39U=; b=
	XwR2m+i+wqvayRpbXLMJKAGCkoysi13uJxC5D3HfjbX7hyXsuSac0aHGpjEY9ExV
	PrOLTcqV7GJ9XrXKlu2gAHsUP8mXLJxAmaFQq/bkj5lWsVSht8W+CDlQLg5PkJi6
	kaK0d1TRUsQmLSubMdxEhScknaKEV50YQNLofnx5iGVeStA0GR1fnI2YdL5UMew7
	+3KNx/kKA8SkMwBseAYGlxP/cH1uEubnk3X1ZZiaVmrPTkDqLDoO9nX0PAmmV+ei
	jKeQRVCdQs9TGJeWBrVELKuE12l1xM7fQNzY5VFC2ZEEvCALHHh1hANbaXYJhM6+
	7XUjl+1VN47ewKwTD0N/0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715294543; x=
	1715380943; bh=9HvRFMpvUUEM4wRwjImHIB9DA55GsP9CgJOPKl3b39U=; b=N
	oKA++8YfXbgmyNKbpy8PcUSfqIhxDNtM8GMLbmHDLv3e5R+Cf6/3QmThjVB7B3Ma
	Th+Pux8OaE6eoN/yvAypcnbBAm1wAtWO/QB80lq18z4NI3zzxQgXn6hGtDz88/U1
	im8H7okIeLrdpdp5Bpd70Te7LtzTlSau5OvLsSNy21lAa5ucH1PYm+Wuy7IelC+c
	CGcg0zriIPqxTZ0APrrTgeEOy1ewZTiOLQV3VodTFLBqfbR82KM8xahusEaSIfpD
	XcBdR0WbRBKn1Let+mwSes0BaviyAKZLUfGVkCEgxybFi1BOKe+zzCpGMb+8YwBy
	YmLZPqAbowwTfBe5cVu6A==
X-ME-Sender: <xms:T1E9ZhISCSIfuu7FgA8cj16p1LZjUksqa4SeMnG8aaHHlqJRh6wckw>
    <xme:T1E9ZtL5pjAhpVmqcbd6Tnu7o5mOEdCyLLfoYThRbS3iMikzG-pK7xAF4v9B5Qy2V
    yTzIFkT78XhkFXvICE>
X-ME-Received: <xmr:T1E9Zptigxy8SNiGZvOqQtUhDWV9Bu2QsRw48YskFVSXgEjlqwzIrY9EszuZch_gJYQ3kxymJWCPqYu0DpRiciqc0RTzrdo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeffedgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefh
    ffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:T1E9ZiaqT8RRrKO0Uynh1NwTIIIwC3Yb3FVuBhDgLBrMyl_1ejzkCA>
    <xmx:T1E9ZoZaFTT2TY2NEjFfmL4isobqBftKP8f2MC9qzMzoLEvgtHBNOw>
    <xmx:T1E9ZmCL2oRfsEx946YAwx-iQh2zGKIfhdpPP55eunIrBjgGcQ8KgA>
    <xmx:T1E9ZmYpYxmKwS33IMlIMTJ2vZzH70KT9ETQ1q-Kar8ayVyHa4RbTQ>
    <xmx:T1E9Zo6c6o3UV_OCJG6FkYKf6CAj4hldX1VvWRup11mALtDd71qf8hAb>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 May 2024 18:42:23 -0400 (EDT)
Date: Fri, 10 May 2024 00:42:21 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 06/11] media: adv748x-csi2: Validate the image format
Message-ID: <20240509224221.GS1385281@ragnatech.se>
References: <20240509161403.111789-1-jacopo.mondi@ideasonboard.com>
 <20240509161403.111789-7-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240509161403.111789-7-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thanks for your work.

On 2024-05-09 18:13:56 +0200, Jacopo Mondi wrote:
> The adv748x-csi2 driver configures the CSI-2 transmitter to
> automatically infer the image stream format from the connected
> frontend (HDMI or AFE).
> 
> Setting a new format on the subdevice hence does not actually control
> the CSI-2 output format, but it's only there for the purpose of
> pipeline validation.
> 
> However, there is currently no validation that the supplied media bus
> code is valid and supported by the device.
> 
> With the introduction of enum_mbus_codes a list of supported format is
> now available, use it to validate that the supplied format is correct
> and use the default UYVY8 one if that's not the case.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

With the reordering of patches to avoid breaking bisect talked about in 
patch 8/11 fixed.

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/i2c/adv748x/adv748x-csi2.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
> index 29b18b6c8b0e..0cdb397d9e0a 100644
> --- a/drivers/media/i2c/adv748x/adv748x-csi2.c
> +++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
> @@ -218,6 +218,22 @@ static int adv748x_csi2_get_format(struct v4l2_subdev *sd,
>  	return 0;
>  }
> 
> +static bool adv748x_csi2_is_fmt_supported(struct adv748x_csi2 *tx, u32 code)
> +{
> +	const unsigned int *codes = is_txa(tx) ?
> +				    adv748x_csi2_txa_fmts :
> +				    adv748x_csi2_txb_fmts;
> +	size_t num_fmts = is_txa(tx) ? ARRAY_SIZE(adv748x_csi2_txa_fmts)
> +				     : ARRAY_SIZE(adv748x_csi2_txb_fmts);
> +
> +	for (unsigned int i = 0; i < num_fmts; i++) {
> +		if (codes[i] == code)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
>  static int adv748x_csi2_set_format(struct v4l2_subdev *sd,
>  				   struct v4l2_subdev_state *sd_state,
>  				   struct v4l2_subdev_format *sdformat)
> @@ -227,6 +243,13 @@ static int adv748x_csi2_set_format(struct v4l2_subdev *sd,
>  	struct v4l2_mbus_framefmt *mbusformat;
>  	int ret = 0;
> 
> +	/*
> +	 * Make sure the format is supported, if not default it to
> +	 * UYVY8 as it's supported by both TXes.
> +	 */
> +	if (!adv748x_csi2_is_fmt_supported(tx, sdformat->format.code))
> +		sdformat->format.code = MEDIA_BUS_FMT_UYVY8_1X16;
> +
>  	mbusformat = adv748x_csi2_get_pad_format(sd, sd_state, sdformat->pad,
>  						 sdformat->which);
>  	if (!mbusformat)
> --
> 2.44.0
> 

-- 
Kind Regards,
Niklas Söderlund

