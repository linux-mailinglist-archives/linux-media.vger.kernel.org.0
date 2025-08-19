Return-Path: <linux-media+bounces-40220-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD91B2B8EE
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 07:48:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EB0AE7B32BB
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 05:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77CBE21D3DC;
	Tue, 19 Aug 2025 05:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="tNtpUCTt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NZZn9Per"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E933451C7
	for <linux-media@vger.kernel.org>; Tue, 19 Aug 2025 05:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755582492; cv=none; b=r/VgJOg+foWsFOSY2tsDRDjJ3eduSo6/Tj0GOGO3ntfgAvBpKKyfHJqzJFsIZv08neieL8HgHyI6ocYVLiIGBhN4DrQKLo3vxyhzKoWOVLT4Eb8XO5mKIiPHCztLv+U8h2H4dxaLWIWy87MDk+9b/I+lNxnnh9N2uxwh5WkGHV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755582492; c=relaxed/simple;
	bh=6Uumezd0h33XSNqCtk6ljBrg53jPf2kyuHtNwMOcp5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qtf5A3s9jsUj79fRu3X9cPlJvm7yTdkITyP548tagCxO++GYjVB90U1AIC/NE1SlEhHtimRHQNV1QeIvHzlfGSJ5BfijGUhLJIthFtjoTPDx5iUpv1F7N7chQvRWOqhYYGznzmDEMQX2yAWjogb4b2mV27sJ3onClHOYX4X6G9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=tNtpUCTt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NZZn9Per; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 4A7851D00225;
	Tue, 19 Aug 2025 01:48:08 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 19 Aug 2025 01:48:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1755582488;
	 x=1755668888; bh=IFAH4bCvwM5tWRHkLt4Ppio9mAP6ODN/DkaEcyUdQxU=; b=
	tNtpUCTtyA2Vquqr9hFUdgyfSIJ1JANY+c3xVia1e7WQ+hdy8IhYMxiWbipj8igb
	inrlQQTfGuYnAbN0LPYkL1hVrnS2YPbl/yGPN8MWfyHwjruiOVJKX735M8hc8KTT
	YCTnkxzNcru07/HlJfS/am5UCU0MK1TyWFrSez0ImXP6QN0OL9Jo3B2UHLdT3HNs
	Fj3Jx3tsiYcjAFoV4wsurQbnYSGe/P7wtlILp6n/zy+7Av0mIOa96mDtsIpd2Hmi
	qQYECgugfas8RBGgV0dBvhTjHw/F4lS5bJMz+gGSVfv4FEzdfyklunma8geNsEN3
	SGeJx5HWQhLQ/8a/c6MQ2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1755582488; x=
	1755668888; bh=IFAH4bCvwM5tWRHkLt4Ppio9mAP6ODN/DkaEcyUdQxU=; b=N
	ZZn9Per9Qe6CQ2rpJ967RuqyZ1ACcAT2BwJu2+lCj+mdT2IOePZ8X1itccmmGyrP
	ZVCwXKgsMW9X99GdvZbOjps3dwTkb6Y6KqPZWSWJZDKPr8xONoKbIjnZBsfmpyyw
	DPLCnD6bWtCU/lfdOGrkpx01iCKVX2xxmHyBchEWRDp673alGfNzlBfS64QNEYL5
	SSGH0M+MejDr0T2YhpB1EgMLyDGG3WpJ1qGRwILgTdir7UZSZg05PC/KyFJjGvrP
	1vyfsaGcM+bIBVOAYRDjpE5Og+cDvRVzqD/pKp4nyPZcHO6Gc3iVgVUnVUXjFZab
	sBm31673KOmNhL/XE/+dg==
X-ME-Sender: <xms:FxCkaJSjxHNA5oA-nSYsmDNxyVuXDuniczq3hnzynU8KS0CyGIau5Q>
    <xme:FxCkaAIH4a2oqf_ZwsKpqW9zOaddVlYdoDV87aumMIBePAaw2FnmMxeGlL1uP5ULK
    aNauAblV8xd9Ofceyw>
X-ME-Received: <xmr:FxCkaIXYZSkXp0M8LoDoDn7-6-VKfLLit_BEaeq2eYh2BVLTS0LWzxfePbioDi-UjsU4imXPPyRepnN6Oc4rIUWo3-wKY79TxA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduheegieelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefhffej
    gfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhope
    dutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshgrkhgrrhhirdgrihhluhhs
    sehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirg
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehkvghkvgdrlhhisegrmhhl
    ohhgihgtrdgtohhmpdhrtghpthhtohephhhvvghrkhhuihhlsehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehnihgtohhlrghsrdguuhhfrhgvshhnvgestgholhhlrggsohhrrgdr
    tghomhdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonh
    gsohgrrhgurdgtohhmpdhrtghpthhtohepthhomhhirdhvrghlkhgvihhnvghnsehiuggv
    rghsohhnsghorghrugdrtghomhdprhgtphhtthhopehjohhnrghssehkfihisghoohdrsh
    gvpdhrtghpthhtohepmhgvhhguihdrughjrghitheslhhinhhugidrihhnthgvlhdrtgho
    mh
X-ME-Proxy: <xmx:FxCkaMRw-5oYY2U5c3wROoXaRGfUY6d3JXNWAx90vxtQZSlNyfzi6w>
    <xmx:FxCkaIChhzOQbES0Mr_3r100zovQ_yX6GmHMUNzIwPdt_ImZ4a30QQ>
    <xmx:FxCkaDIHJ6XAcMxUOmx0ATlmsCLRIX-3A_J1s0uq8Ku6MFFSk1Na3A>
    <xmx:FxCkaDDPEVfXfce5Z-u3NgtZ9s6IeF4FOUz0tJHyCzH2aAEg68Hpng>
    <xmx:GBCkaF13nw-njjKae2KwTlxwn90duMAf9sc8Po1WrKMrE4wmEcwO-BIN>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 19 Aug 2025 01:48:07 -0400 (EDT)
Date: Tue, 19 Aug 2025 07:48:04 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Keke Li <keke.li@amlogic.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>
Subject: Re: [PATCH 2/2] media: v4l2-common: Drop the workaround from
 v4l2_get_link_freq()
Message-ID: <20250819054804.GC2197757@ragnatech.se>
References: <20250818141444.1160565-1-sakari.ailus@linux.intel.com>
 <20250818141444.1160565-3-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250818141444.1160565-3-sakari.ailus@linux.intel.com>

Hej Sakair,

Tack för ditt arbete.

On 2025-08-18 17:14:44 +0300, Sakari Ailus wrote:
> Remove the workaround and don't allow v4l2_get_link_freq() to be called on
> the control handler anymore.

nit: Maybe set out what the workaround was in the commit message?

> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

It is exciting to see things moving along! With, or without, the nit 
addressed,

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/v4l2-core/v4l2-common.c | 17 ++++++++---------
>  include/media/v4l2-common.h           | 14 ++------------
>  2 files changed, 10 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index 6e585bc76367..fb6e2b71f7c4 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -509,8 +509,9 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
>  }
>  EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt);
>  
> -s64 __v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
> -			      unsigned int mul, unsigned int div)
> +#ifdef CONFIG_MEDIA_CONTROLLER
> +static s64 v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
> +				   unsigned int mul, unsigned int div)
>  {
>  	struct v4l2_ctrl *ctrl;
>  	s64 freq;
> @@ -545,11 +546,9 @@ s64 __v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
>  
>  	return freq > 0 ? freq : -EINVAL;
>  }
> -EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_ctrl);
>  
> -#ifdef CONFIG_MEDIA_CONTROLLER
> -s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
> -			     unsigned int div)
> +s64 v4l2_get_link_freq(struct media_pad *pad, unsigned int mul,
> +		       unsigned int div)
>  {
>  	struct v4l2_mbus_config mbus_config = {};
>  	struct v4l2_subdev *sd;
> @@ -568,10 +567,10 @@ s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
>  	 * Fall back to using the link frequency control if the media bus config
>  	 * doesn't provide a link frequency.
>  	 */
> -	return __v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
> +	return v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
>  }
> -EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_pad);
> -#endif /* CONFIG_MEDIA_CONTROLLER */
> +EXPORT_SYMBOL_GPL(v4l2_get_link_freq);
> +#endif
>  
>  /*
>   * Simplify a fraction using a simple continued fraction decomposition. The
> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> index 0a43f56578bc..79aaa510dab7 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -577,19 +577,9 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
>   * * %-EINVAL: Invalid link frequency value
>   */
>  #ifdef CONFIG_MEDIA_CONTROLLER
> -#define v4l2_get_link_freq(pad, mul, div)				\
> -	_Generic(pad,							\
> -		 struct media_pad *: __v4l2_get_link_freq_pad,		\
> -		 struct v4l2_ctrl_handler *: __v4l2_get_link_freq_ctrl)	\
> -	(pad, mul, div)
> -s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
> -			     unsigned int div);
> -#else
> -#define v4l2_get_link_freq(handler, mul, div)		\
> -	__v4l2_get_link_freq_ctrl(handler, mul, div)
> +s64 v4l2_get_link_freq(struct media_pad *pad, unsigned int mul,
> +		       unsigned int div);
>  #endif
> -s64 __v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
> -			      unsigned int mul, unsigned int div);
>  
>  void v4l2_simplify_fraction(u32 *numerator, u32 *denominator,
>  		unsigned int n_terms, unsigned int threshold);
> -- 
> 2.39.5
> 

-- 
Kind Regards,
Niklas Söderlund

