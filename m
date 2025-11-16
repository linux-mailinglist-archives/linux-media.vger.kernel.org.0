Return-Path: <linux-media+bounces-47182-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E8BC61BB0
	for <lists+linux-media@lfdr.de>; Sun, 16 Nov 2025 20:24:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7DBBE4E3F96
	for <lists+linux-media@lfdr.de>; Sun, 16 Nov 2025 19:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8293923EAB0;
	Sun, 16 Nov 2025 19:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Dr9NSpEW";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GYIHwbHS"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127A7E55A;
	Sun, 16 Nov 2025 19:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763321061; cv=none; b=EnfEJneSEuGGo6ZPS0D70zEu0Gr0kOzFkfjOVX6BWPwD9grVSxOpD8NW/l5qO72+ATtGf3ML+rt/a/A0ZtC6Ac+4AeWIddFXqtYflmQJaBLy/tC6ycPjk2L8Gu11bdSJ9/0nhV1XcG53GIV1/+mMaV69w2kzC7dTAsWKVQI8hjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763321061; c=relaxed/simple;
	bh=KfCSgdHXM/DLu8kJkdQ1fcsGkt/rTqMsRFvN4NFR7jk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PRsdtYRRH59VVtyeeh0svbEAmLJS7mCrMosOuNvXxB/hZQCjJkuhF4+26GYGT97zMsyTegNM4k3kYgP2DhvaquIntX+7RdkoT0yWVGrsZrvXf1NDfYufzfh30nnwSSOUvTjMWsqcUkY++1vIypGmKLqjFVLU15q58k9T1Qzqad4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Dr9NSpEW; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GYIHwbHS; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 191397A00E2;
	Sun, 16 Nov 2025 14:24:19 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Sun, 16 Nov 2025 14:24:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1763321058;
	 x=1763407458; bh=HVjozl/X/DY4FZam42Ixr6Ica6xuoqZWKkmyPMDgiAY=; b=
	Dr9NSpEW5jtY/usdUJyzwP+l0rr0lu2E6Gc3kBr4lntNoJzIBS4qoyJYUAP1iLGZ
	8xwPrqMfKDz6eo3udOkLor65mDmX0EX6Q6UfBtptRH29l1VFi3aLXP8mP+ar2cf/
	k/f8hMf3PFo2F772HldvFlAcfEUYA0Z5Fz8zH4Ooeza2mejOQLA3MkAeco032zKW
	t2hIvx1aVisqOLYSVxtY6gbyto3AYXLTLlFCXzchfSpfPQ7UZp8o7XSqdQn5IJ3d
	rbLjgvAF4gBKaBxcQbJg7viJgie4xxsuoVoNaJYDXxgALFk1Iaviw+xn6R2VYUVG
	iizpLshfJ8OrL8uZj2BElQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1763321058; x=
	1763407458; bh=HVjozl/X/DY4FZam42Ixr6Ica6xuoqZWKkmyPMDgiAY=; b=G
	YIHwbHSC3x5BWLk6z/Y1BNz6AWEK55p96cbFBbqsKoS3426bsDHfj9zPz1WX0WV7
	YVqvE+0r+GYIvh6uKn8qoc5PrXWJhhwTKYQ8CI+BH/2pV2YiTwMev+BFpIanNPgm
	ms5eNjKkbUWd1r7uoYTkGmpRgCs0aCXNhIsbffiXJRnd2KaFXvG/fiuic+cRsl2v
	SaM8Blc7G/TI6B90oipxJa9FoPw4O+5LRBpg9drxoEw1m3abgvxSlRyEroABaqyr
	e76RIsrr45UGLrEAQv7ppGYcRfMimerUlhlMQ5zihWatRbKy/xVF72K1KMJ470Sv
	Xs/mL70yvEv3a8UF84/TA==
X-ME-Sender: <xms:4iQaaWfcNu11KCS2HTfvHzTrDyaRJ4Cul4RaN47MSr7aKPB3CHQtTw>
    <xme:4iQaaTRjyfsScV9KgEajqgfUUdcFl6C0O6V33aR1uZXAaXtN9wiVZ0J7AlapweyAp
    MPo3TkZBovdW5cECYev6ei3FWN7s9U6-0Y5Me8CvlvmnlJrRCKF-gkP>
X-ME-Received: <xmr:4iQaaSLN7Qs3h07vDBcOa9mI3mwwGcF_3ttCTByB5Frxqi3zTNjXGjQ7-f4kgnSCGCs14bmKMurdQiJB_n3cQn3Ldguqd-M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvudeigeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefhffej
    gfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhope
    dutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhdrthhrvghtthgvrhesphgv
    nhhguhhtrhhonhhigidruggvpdhrtghpthhtoheplhgrrhhssehmvghtrghfohhordguvg
    dprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehr
    ohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvg
X-ME-Proxy: <xmx:4iQaaQJb5yqWUEAU5Np1Z7cxB9kUGNyHxUnQ1AgEBj7NHXv5ZCQ-tg>
    <xmx:4iQaadj03VVb-NU7eMjSBT7yatcq0uKvPd0KjUNKFwLzJ0yAri_vBg>
    <xmx:4iQaaaNgDcPqzWJp0dWWYFMor8OdiUXn3OJZ0RqLAiIbO-8PMXSpUQ>
    <xmx:4iQaaYpZQwsph6n7Bl9bIKJher6Ppuf6YJwhyx2s35QmbvFDtNBjEg>
    <xmx:4iQaaUmfvBC-D6hA0mMa2Weci3Yc1gLjsQHoRf2O_uBKbUgxe0zKHp-s>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Nov 2025 14:24:18 -0500 (EST)
Date: Sun, 16 Nov 2025 20:24:16 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Michael Tretter <m.tretter@pengutronix.de>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, kernel@pengutronix.de,
	Thorsten Schmelzer <tschmelzer@topcon.com>
Subject: Re: [PATCH 4/4] media: adv7180: fix frame interval in progressive
 mode
Message-ID: <20251116192416.GH1759911@ragnatech.se>
References: <20251111-b4-adv7180-vpp-sub-device-v1-0-9877fe9f709b@pengutronix.de>
 <20251111-b4-adv7180-vpp-sub-device-v1-4-9877fe9f709b@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251111-b4-adv7180-vpp-sub-device-v1-4-9877fe9f709b@pengutronix.de>

Hi Michael and Thorsten,

Thanks for your patch.

On 2025-11-11 15:36:17 +0100, Michael Tretter wrote:
> From: Thorsten Schmelzer <tschmelzer@topcon.com>
> 
> The ADV7280-M may internally convert interlaced video input to
> progressive video. If this mode is enabled, the ADV7280-M delivers
> progressive video at the full refresh rate of 50 FPS (PAL) or 60 FPS
> (NTSC).
> 
> Fix the reported frame interval if progressive video is enabled.
> 
> Signed-off-by: Thorsten Schmelzer <tschmelzer@topcon.com>
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
>  drivers/media/i2c/adv7180.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
> index d289cbc2eefd..3a5a0818bc5f 100644
> --- a/drivers/media/i2c/adv7180.c
> +++ b/drivers/media/i2c/adv7180.c
> @@ -491,6 +491,7 @@ static int adv7180_get_frame_interval(struct v4l2_subdev *sd,
>  				      struct v4l2_subdev_frame_interval *fi)
>  {
>  	struct adv7180_state *state = to_state(sd);
> +	bool progressive;
>  
>  	/*
>  	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
> @@ -499,12 +500,14 @@ static int adv7180_get_frame_interval(struct v4l2_subdev *sd,
>  	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
>  		return -EINVAL;
>  
> +	progressive = (state->field == V4L2_FIELD_NONE);

No need for ( ) here.

> +
>  	if (state->curr_norm & V4L2_STD_525_60) {
>  		fi->interval.numerator = 1001;
> -		fi->interval.denominator = 30000;
> +		fi->interval.denominator = progressive ? 60000 : 30000;
>  	} else {
>  		fi->interval.numerator = 1;
> -		fi->interval.denominator = 25;
> +		fi->interval.denominator = progressive ? 50 : 25;
>  	}

I wonder if it make sens to instead of the above do?

    /* Interlaced video have half the frame interval period. */
    if (state->field == V4L2_FIELD_NONE)
        fi->interval.denominator *= 2;


>  
>  	return 0;
> 
> -- 
> 2.47.3
> 

-- 
Kind Regards,
Niklas Söderlund

