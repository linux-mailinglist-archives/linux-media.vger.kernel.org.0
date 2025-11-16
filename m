Return-Path: <linux-media+bounces-47181-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 13099C61BA2
	for <lists+linux-media@lfdr.de>; Sun, 16 Nov 2025 20:17:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE0573B73A7
	for <lists+linux-media@lfdr.de>; Sun, 16 Nov 2025 19:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87FF723EAAE;
	Sun, 16 Nov 2025 19:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="e85jyDUx";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ltZbAtzv"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A8B214A97;
	Sun, 16 Nov 2025 19:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763320414; cv=none; b=tzoRu/t42sK6dqsHQ40DrbwGZs/lOCko1t6X+3MPebVhvD9wS9/rOFAXH/U6UOBN8DLye6YmOXyd8Eu5SUHNniy/+ZdcofRZLWQ5YVCuQGO9usO1HHk0G9+vJI5e3XqCdx8N82bk4DtmHp+C2fSXxU81IwjT5hh2AO6UG1ThEhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763320414; c=relaxed/simple;
	bh=sMPf5kuERtyzwdQGqS0w86C0F0SVXeRayDzpcV4/voQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IbBQ0PLso2fJ944/rY4rP7xIV8OYOleRNyydKC7OPm03KtuQT9KTBlBAXAUbVhg5K0VUwLRDCbZOgKf2i0rEaxFB1Mvy47TsxKzsXKpBE/gkv1Dgz9RvUKEApZ2JfmqRfkD/YM5w9OefAy3f7mPVjXWVfpz9fNXeZhj2e4HbUx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=e85jyDUx; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ltZbAtzv; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id D93CB7A00A7;
	Sun, 16 Nov 2025 14:13:30 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Sun, 16 Nov 2025 14:13:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1763320410;
	 x=1763406810; bh=nTYAoRCtmU7oTbSo9qLVmIedoJRBZ4aBjEqdAwG3M38=; b=
	e85jyDUxKwOHHZ8TBbkRizscbMRSHhrnjxMbktXeQh0ZIMwk2NgHA9HKJ/hfeUcM
	wgtAIKuCaKX3H/c06F+Ct80AmaCTjP/PH4EUBJofZ3lsS6Fubwgr0tyFYslR6V9m
	A5VDMbR/MjqpnF0tgRvykyIAoYF9cZYYZaQhZkIdWPyv8Wek/CoudN5X5GATvsEP
	DznawIoEVIvqXEfY4uwR4YzNGhP1FNbty+tSnO8OWrKEZFphSjErBb2C4l27i4Pi
	G1hA4thZDiRPQFYR+IGuXxQpNOAXw+QpCQV/kx/uxZxnqnJVG/hzkbfmWpQVv6pf
	stoXro2zXhHwFAOhr+trEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1763320410; x=
	1763406810; bh=nTYAoRCtmU7oTbSo9qLVmIedoJRBZ4aBjEqdAwG3M38=; b=l
	tZbAtzv32UxQ5BkvjtjZ/EXbSLqrJ3IFN4hGag2DHeE2LaXNcSQFSywLNreW54hb
	b7lXJ+D5bzsYBBU2fW+y4L0k7lshKfWjtBcqHdYgzWfuLv1ANZhKpaOrZ0ybHpri
	sQZ9oLFks8CsNjS5nQWnOXHL5U/a4ov4Mp505tEpenQC/4a0tiMS4t2nRgQWPlN4
	4VGlINzJ0pbB8EdrOT2QIcsUvF5HOfo4eDM7a3PeboPbXTkADZ+Ib/pWJajDSO6L
	Wwog1bnsEcH9lBZVGRsxMToiDJ+bRZjhhJOFxW+Q0sHBBb403KD76WCz00YyWnvq
	JYDpasPF2zf8MIhUuJI1A==
X-ME-Sender: <xms:WiIaaVsVf-8zfwdx02BuzUk6bIRN3z9HR5KKfUx14x_r0VxIrs7Wog>
    <xme:WiIaaRjbpPAXU2-_CzrD2f6kXLeOOfnGDLhgRO1UQbcUDgxeqDhM576wN-zADs-g9
    DSJf-3njYil88UluJnlIpRKwFZW2CoLon8tgjm8uj52GPHdIYn04zw>
X-ME-Received: <xmr:WiIaaTaxRrmso05G13AyzmIcK4jCIBH-DOXjwYFJhwrs9Prat22iUggRZn6wdhGj5YH6s3wCHB9aeZO5IZvd4IAYSn_rwKk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvudeifeelucetufdoteggodetrf
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
X-ME-Proxy: <xmx:WiIaaYZvGnFgXTEQkfDER8HciUBdcLFGZP399zY0QddiVRi53WM8Uw>
    <xmx:WiIaaQxJvH8O-5KZDdmQq6wPtNdL07cLfFzRXKKaU3JDcBEtcNOtDA>
    <xmx:WiIaacfyTQ6QfMSrQUv7NF13BZC74c7Ljm7geWYhYlnGYg8Op6ufog>
    <xmx:WiIaad7qPQp7p_8FrXgL4nzoLXkbsFD6Avetvkj6teKdxSjmPZIPgQ>
    <xmx:WiIaaXOQVuJsk_8ximYsmSNdiYooZh3u25cVvQ_fFA-LPiyMRz-vKYWC>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Nov 2025 14:13:29 -0500 (EST)
Date: Sun, 16 Nov 2025 20:13:28 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Michael Tretter <m.tretter@pengutronix.de>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, kernel@pengutronix.de,
	Thorsten Schmelzer <tschmelzer@topcon.com>
Subject: Re: [PATCH 3/4] media: adv7180: implement g_register and s_register
Message-ID: <20251116191328.GG1759911@ragnatech.se>
References: <20251111-b4-adv7180-vpp-sub-device-v1-0-9877fe9f709b@pengutronix.de>
 <20251111-b4-adv7180-vpp-sub-device-v1-3-9877fe9f709b@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251111-b4-adv7180-vpp-sub-device-v1-3-9877fe9f709b@pengutronix.de>

Hi Michael and Thorsten,

Thanks for your work.

On 2025-11-11 15:36:16 +0100, Michael Tretter wrote:
> From: Thorsten Schmelzer <tschmelzer@topcon.com>
> 
> The g_register and s_register callbacks are useful for debugging the
> adv7180.
> 
> Implement the callbacks to expose the register debugging to userspace.
> 
> Signed-off-by: Thorsten Schmelzer <tschmelzer@topcon.com>
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/i2c/adv7180.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
> index 4152f2049a6d..d289cbc2eefd 100644
> --- a/drivers/media/i2c/adv7180.c
> +++ b/drivers/media/i2c/adv7180.c
> @@ -969,6 +969,32 @@ static int adv7180_subscribe_event(struct v4l2_subdev *sd,
>  	}
>  }
>  
> +#ifdef CONFIG_VIDEO_ADV_DEBUG
> +static int adv7180_g_register(struct v4l2_subdev *sd,
> +			      struct v4l2_dbg_register *reg)
> +{
> +	struct adv7180_state *state = to_state(sd);
> +	int ret;
> +
> +	ret = adv7180_read(state, reg->reg);
> +	if (ret < 0)
> +		return ret;
> +
> +	reg->val = ret;
> +	reg->size = 1;
> +
> +	return 0;
> +}
> +
> +static int adv7180_s_register(struct v4l2_subdev *sd,
> +			      const struct v4l2_dbg_register *reg)
> +{
> +	struct adv7180_state *state = to_state(sd);
> +
> +	return adv7180_write(state, reg->reg, reg->val);
> +}
> +#endif
> +
>  static const struct v4l2_subdev_video_ops adv7180_video_ops = {
>  	.s_std = adv7180_s_std,
>  	.g_std = adv7180_g_std,
> @@ -982,6 +1008,10 @@ static const struct v4l2_subdev_video_ops adv7180_video_ops = {
>  static const struct v4l2_subdev_core_ops adv7180_core_ops = {
>  	.subscribe_event = adv7180_subscribe_event,
>  	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
> +#ifdef CONFIG_VIDEO_ADV_DEBUG
> +	.g_register = adv7180_g_register,
> +	.s_register = adv7180_s_register,
> +#endif
>  };
>  
>  static const struct v4l2_subdev_pad_ops adv7180_pad_ops = {
> 
> -- 
> 2.47.3
> 

-- 
Kind Regards,
Niklas Söderlund

