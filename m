Return-Path: <linux-media+bounces-51465-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMx4OUEidWmYBAEAu9opvQ
	(envelope-from <linux-media+bounces-51465-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 24 Jan 2026 20:49:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9F67EC2F
	for <lists+linux-media@lfdr.de>; Sat, 24 Jan 2026 20:49:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3FD73010DA9
	for <lists+linux-media@lfdr.de>; Sat, 24 Jan 2026 19:49:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DDEB244186;
	Sat, 24 Jan 2026 19:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="GVDgexQY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KEwkVLO8"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5761136358;
	Sat, 24 Jan 2026 19:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769284151; cv=none; b=iPMFJUg0Xa1e9h0h1U0HbaozXpnsVXOKVX8oph2c805mwIcj3hsrOSykmQTdMJO6Rtx8ir6LvUX8GF0f/y7tgvlrYPg8R7mR+lu8KM7YMmCaTlM7fS7R+ELR4idMzfmOpElyMm/kB/zq4ioeRkdebjO5NEnRryQG9l/Tv32pxiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769284151; c=relaxed/simple;
	bh=x7WwG/3ihx7PoxOksOo07gcSxI/NTsXjHNigFVN8r6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gXLEe+7ZV1nyCkm3HleMAISBCPw1ge2DZ44ZJpIdI8S6hDjubOGgxEy39IiUP7BYg4KR15xYVC+5PVpEdK3i6zwU86DIytlpMTIHaWXhF337e3fgDC3XgHqVNXq9w6RPh6osloH+bLuQV8p8pKH1lapLfIF02B0eUyQ0zwMYFQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=GVDgexQY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KEwkVLO8; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 853CC7A012D;
	Sat, 24 Jan 2026 14:49:08 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Sat, 24 Jan 2026 14:49:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1769284148;
	 x=1769370548; bh=Pru4e3WpxHeIlzGDEztAKa+9WVlRcoBazAmjcqbvjTA=; b=
	GVDgexQY77Ijfue5pzDI1dr8dkAfdi3GnEmsjrv2C9fieA6SEjpX1+ruvC+mlWYZ
	UB52fAuf4ZlhkrTsvOrvnjseDJtMa0DxeJ1NoAkz+juvZdd+y14haKURUZNeJ8U4
	k1km7GpikF15vB9o98x9vkG37taXUIBUOXCdYBlzkz9it7CINSOtk7OZ55wV11cS
	y3o/CdXhxLQTpsy+v0p+Pl2tVE74A+TH4QLvP7EPja5naJiPTiko0OG3z3ItQf9h
	oyTKu3jjxLYai2t28rFQ8E/0Itxx1kHQhLvJx1tybJQmpj96jRsDDgYtE7bv0WEi
	SImmUVVjDD5BIie9cGxhQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1769284148; x=
	1769370548; bh=Pru4e3WpxHeIlzGDEztAKa+9WVlRcoBazAmjcqbvjTA=; b=K
	EwkVLO8bchgI060T7ZBGFy2Fo3mSBFFYTdndTRqNMaR1oKKQGAw21OnVPXgI71PN
	dUTbSOC+3b0RX/JBrcy7BRHWcoge6rdAb9UNp9uSoaY3zcVKrGREFC/RI16mw07T
	DG8wWpo481vOVsOXa6gdWp7vuIey8jWh63Hs3BiajrUxzv2mDzNerEsktNLTpQtV
	Myxz4oxZhs9WIpSD6C0DpWJgNMXxnzvrkZTXLzCZjKkmmp0QZ6VINXdtojTtzX2R
	WHg6kjUADqvk3dZZH+K9rZGjn4qdxNS3euLPYgLa2BOzRaJ/j5zHcoDhshycVkVF
	WmqSWTp3dcAri8aQ/G/tQ==
X-ME-Sender: <xms:NCJ1ad16jHpELdlTQU2jtOmTz1ybZhKz-Bw2GWKBEXvA_JNtZQ92wg>
    <xme:NCJ1aaFV8Sb6l48dfMMwLMXmzgH37BMhJb6W6vIagAN0GbmuyVMXIiWa1u_j3dbZa
    zCKqHLVPcmNky-_8mVirtL_cJ3KaUWfxMqq9cvc0KLFpI2q6NGUng>
X-ME-Received: <xmr:NCJ1aYuE3ImZLbU3UEVneM3T0_Dq-WIlKmXzHGt8KJYwGWr3OIVmHk0v3IJs1A0EId3Avgv7gvTcy5xkfSrPLFiSNaBghVI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduhedvkedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrg
    htvggthhdrshgvqeenucggtffrrghtthgvrhhnpeevteegtddvvdfhtdekgefhfeefheet
    heekkeegfeejudeiudeuleegtdehkeekteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhn
    rghtvggthhdrshgvpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtohepthhomhhirdhvrghlkhgvihhnvghnodhrvghnvghsrghssehiuggvrghs
    ohhnsghorghrugdrtghomhdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhr
    tghpthhtohepmhgrghhnuhhsrdgurghmmhesghhmrghilhdrtghomhdprhgtphhtthhope
    hlrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhr
    tghpthhtohepkhhivghrrghnrdgsihhnghhhrghmodhrvghnvghsrghssehiuggvrghsoh
    hnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdr
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotg
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgv
    lhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:NCJ1adphj052dZ-d9DiO4FV1Y0uyjxfKyQucYKWROfues4-Kh0l_iQ>
    <xmx:NCJ1afVHaQ9TmOKTqjcoP-o2_3RfUfN54yl_qsSsqDR-6wEC_60dyw>
    <xmx:NCJ1aV1HzlTfltR39Ry59BOFXKO1oACNB50GFPo4hGSEIApnsOveqw>
    <xmx:NCJ1aUs0_Nb_-TA3IH71m17v9g5noJ9W4ZCOhp_4Z-VdlfBfGUPBfQ>
    <xmx:NCJ1aYylmg4xrlkSsRS0IL__kFNI7QZ5saF1EGsKhrqYAwkRwuSY8U8p>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 24 Jan 2026 14:49:07 -0500 (EST)
Date: Sat, 24 Jan 2026 20:49:05 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH 5/5] media: rcar-csi2: Optimize rcsi2_calc_mbps()
Message-ID: <20260124194905.GB3395783@ragnatech.se>
References: <20260115-rcar-streams-prep-1-v1-0-f87700926c11@ideasonboard.com>
 <20260115-rcar-streams-prep-1-v1-5-f87700926c11@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260115-rcar-streams-prep-1-v1-5-f87700926c11@ideasonboard.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm1,messagingengine.com:s=fm2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,ideasonboard.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51465-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,messagingengine.com:dkim,ragnatech.se:email,ragnatech.se:dkim,ragnatech.se:mid]
X-Rspamd-Queue-Id: 4E9F67EC2F
X-Rspamd-Action: no action

Hello Tomi,

Thanks for your patch.

On 2026-01-15 12:07:01 +0200, Tomi Valkeinen wrote:
> With modern drivers supporting link-freq, we don't need to do any
> calculations based on the bpp and number of lanes when figuring out the
> link frequency. However, the code currently always runs code to get the
> bpp and number of lanes.
> 
> Optimize the rcsi2_calc_mbps() so that we only do that when needed, i.e.
> when querying the link-freq is not supported by the upstream subdevice.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/renesas/rcar-csi2.c | 50 +++++++++++++++++-------------
>  1 file changed, 29 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> index a2a87c5bfd7c..7305cc4a04cb 100644
> --- a/drivers/media/platform/renesas/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-csi2.c
> @@ -1006,15 +1006,10 @@ static int rcsi2_get_active_lanes(struct rcar_csi2 *priv,
>  static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
>  			   struct v4l2_subdev_state *state)
>  {
> -	const struct rcar_csi2_format *format;
> -	struct v4l2_mbus_framefmt *fmt;
>  	struct media_pad *remote_pad;
>  	struct v4l2_subdev *source;
> -	unsigned int lanes;
> -	unsigned int bpp;
>  	s64 freq;
>  	u64 mbps;
> -	int ret;
>  
>  	if (!priv->remote)
>  		return -ENODEV;
> @@ -1022,28 +1017,41 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
>  	source = priv->remote;
>  	remote_pad = &source->entity.pads[priv->remote_pad];
>  
> -	ret = rcsi2_get_active_lanes(priv, &lanes);
> -	if (ret)
> -		return ret;
> +	/*
> +	 * First try to get the real link freq. If that fails, try the heuristic
> +	 * method with bpp and lanes (but that only works for one route).
> +	 */
> +	freq = v4l2_get_link_freq(remote_pad, 0, 0);
> +	if (freq < 0) {
> +		const struct rcar_csi2_format *format;
> +		const struct v4l2_mbus_framefmt *fmt;
> +		unsigned int lanes;
> +		unsigned int bpp;
> +		int ret;
>  
> -	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
> -	if (!fmt)
> -		return -EINVAL;
> +		ret = rcsi2_get_active_lanes(priv, &lanes);
> +		if (ret)
> +			return ret;
>  
> -	format = rcsi2_code_to_fmt(fmt->code);
> -	if (!format)
> -		return -EINVAL;
> +		fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
> +		if (!fmt)
> +			return -EINVAL;
>  
> -	bpp = format->bpp;
> +		format = rcsi2_code_to_fmt(fmt->code);
> +		if (!format)
> +			return -EINVAL;
>  
> -	freq = v4l2_get_link_freq(remote_pad, bpp, 2 * lanes);
> -	if (freq < 0) {
> -		int ret = (int)freq;
> +		bpp = format->bpp;
>  
> -		dev_err(priv->dev, "failed to get link freq for %s: %d\n",
> -			source->name, ret);
> +		freq = v4l2_get_link_freq(remote_pad, bpp, 2 * lanes);
> +		if (freq < 0) {
> +			int ret = (int)freq;
>  
> -		return ret;
> +			dev_err(priv->dev, "failed to get link freq for %s: %d\n",
> +				source->name, ret);
> +
> +			return ret;
> +		}
>  	}
>  
>  	mbps = div_u64(freq * 2, MEGA);
> 
> -- 
> 2.43.0
> 

-- 
Kind Regards,
Niklas Söderlund

