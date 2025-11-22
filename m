Return-Path: <linux-media+bounces-47612-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A772CC7CFC4
	for <lists+linux-media@lfdr.de>; Sat, 22 Nov 2025 13:35:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60A763A8DEF
	for <lists+linux-media@lfdr.de>; Sat, 22 Nov 2025 12:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 037D726ED2B;
	Sat, 22 Nov 2025 12:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="eKyEoFof";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ysQrlLgI"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650D51C695;
	Sat, 22 Nov 2025 12:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763814943; cv=none; b=LUqSpYqBtBpD1Y+aLxCzRPDWWhgL57P0Lnx5xBgsIyQa5VWSPuvAepgId6kbv4pOIVTxr1KsWujZqvLbToAGwUR/jaNPKGnZDbe18Z0+rLp2nD7dGMmc/uWMvrSDyHI1YHwCN29gbYNimJLlkHLJ8NUnnKxw+c62wvaavfgdNCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763814943; c=relaxed/simple;
	bh=XDr/N739gOpO7BYXaKKUzE2qBARN5+9zpX19YZgqgqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FC16AkR+y1Yj23bPtImimNRz+khcA2r9lXGkpOII/WHpIgGiN6cBL0z5W02C1RuEOB8Ht9prQqieF0oyuWNKIiJONINBeNwFcaBrLXtpy4Pj/kDW2yOxIssCHSmHJH0kNYBWJc/a83swCCbPupJzP2881b80w6pWdWs4utDTKkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=eKyEoFof; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ysQrlLgI; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 0C6391D0013B;
	Sat, 22 Nov 2025 07:35:40 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Sat, 22 Nov 2025 07:35:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1763814939;
	 x=1763901339; bh=ElDJVjFIr0ZqCqJwcQweoSpOYPZE4AzT6FtQoJ2Z/7U=; b=
	eKyEoFof2s8BNCdnTlAdkqYxVkc8RL9wFwKY3G8xFtXOk+FNv3FEsjb8b1BVShUu
	/QtX3uvRKohvKlkVk7c3sTlZ3RZF/J34mDPquVgtSN3Ac4lKuFzPvLowiw/MAV2O
	nEiAEVk02LF64QOPyFkX+7OX/AAyhf70oCUi/b+TsaPCh25Qd7m/8hBq9/2QuUEZ
	sTVizxpgJmh1CeyylEF3vgpTHVbXa5d8tIktxY+BjTW9aYmCtvej/gDufG1kD/57
	NXWjR7fHt2eXOlORLNLVX8QZ/WpdUWrerFXPQAlhh0Lzl2DnQKa7Wgm0lvqG47u3
	gb1bcRUxtcy+fTNmuAu65g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1763814939; x=
	1763901339; bh=ElDJVjFIr0ZqCqJwcQweoSpOYPZE4AzT6FtQoJ2Z/7U=; b=y
	sQrlLgIASdxG/rwCGeb+8jrf+fZF31BEJZ7IfgTbTWBsrR2H5EyFDmJBxgWUiVUJ
	ZLEE/8Mr7wB3H/lG+g9oz252uH42qx0VSo1gKsjIJ1YPHY/5pWJlV67PA+In72Rf
	1j3qlibxDM8i26REUzrMfhzRk7t0GP47R8otUL5JpzvQYNAZ1nCjLuSFLMkuFqlZ
	jafQxHC6kgAUvCq+Z71n238XvZyLtu11xGG/GLnIIA1l3QtEgGsHWBZp8YcExbeH
	w/LUemaOe+PNIFKM8ktSpvdjOa1333w/lbKKEF+klPsmFBsLlrNJ73HUEKr6w29i
	4TtGjzPV/2zeT0IvTRUmg==
X-ME-Sender: <xms:G64haU178HyFhd9ALtlkGt58WwJ0LLONjjjtKEvfIA_R_XKxo6p_Tw>
    <xme:G64haSKvnOKuZ5ogVBxyQ_Fs8Ouz0kGbAlRCySBp0J_g_43a3cbO14HgHJjzvPXVl
    R1U-G7H8D73hv-lG6xxrFp9I9sqbfnPg4dtcQwHuW7qD9OqpgLR0A>
X-ME-Received: <xmr:G64haXj1hI1rynjSkmQ31xUiBNiHPbIzLlympFD1K3wfwzv_BAcGhzVDNY7fcx3WQOwz1A3ubLQNlL5sSOkzP-lIk3t_Z0I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvfedvkeeiucetufdoteggodetrf
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
X-ME-Proxy: <xmx:G64haaDLyOmF3OV7qqYieQy1eKXfbUEGyE5cPi_VffehL0FtyGRCEQ>
    <xmx:G64haR7csPxe61hOJYABULaZENZ87U0idyREhXfrtYaxpZ_rrVAijg>
    <xmx:G64haXG9Ki-N3V2_FJUIZSrMXXuZh_YK1cI8nDDVuqJWEwX0P_dwPA>
    <xmx:G64haUDxDKd0WBXc6WUQ-DxEIThDCoXDYIAk5mUmua7P8uSGtVpQJA>
    <xmx:G64haQXuSAVgA-qZiS9zUj-8eEsZuY2HvJ3CxO3MIYy5mspnLjGqKEm7>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 22 Nov 2025 07:35:38 -0500 (EST)
Date: Sat, 22 Nov 2025 13:35:36 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Michael Tretter <m.tretter@pengutronix.de>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, kernel@pengutronix.de,
	Thorsten Schmelzer <tschmelzer@topcon.com>
Subject: Re: [PATCH v3 4/4] media: adv7180: fix frame interval in progressive
 mode
Message-ID: <20251122123536.GC991773@ragnatech.se>
References: <20251120-b4-adv7180-vpp-sub-device-v3-0-c9d80661e7d9@pengutronix.de>
 <20251120-b4-adv7180-vpp-sub-device-v3-4-c9d80661e7d9@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251120-b4-adv7180-vpp-sub-device-v3-4-c9d80661e7d9@pengutronix.de>

Hi Michael,

Thanks for your work.

On 2025-11-20 15:22:56 +0100, Michael Tretter wrote:
> From: Thorsten Schmelzer <tschmelzer@topcon.com>
> 
> The ADV7280-M may internally convert interlaced video input to
> progressive video. If this mode is enabled, the ADV7280-M delivers
> progressive video frames at the field rate of 50 fields per second (PAL)
> or 60 fields per second (NTSC).
> 
> Fix the reported frame interval if progressive video is enabled.
> 
> Signed-off-by: Thorsten Schmelzer <tschmelzer@topcon.com>
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> Changes in v3:
> - None
> Changes in v2:
> - Simplify and document calculation of frame interval
> ---
>  drivers/media/i2c/adv7180.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
> index d289cbc2eefd..669b0b3165b1 100644
> --- a/drivers/media/i2c/adv7180.c
> +++ b/drivers/media/i2c/adv7180.c
> @@ -507,6 +507,13 @@ static int adv7180_get_frame_interval(struct v4l2_subdev *sd,
>  		fi->interval.denominator = 25;
>  	}
>  
> +	/*
> +	 * If the de-interlacer is active, the chip produces full video frames
> +	 * at the field rate.
> +	 */
> +	if (state->field == V4L2_FIELD_NONE)
> +		fi->interval.denominator *= 2;
> +
>  	return 0;
>  }
>  
> 
> -- 
> 2.47.3
> 

-- 
Kind Regards,
Niklas Söderlund

