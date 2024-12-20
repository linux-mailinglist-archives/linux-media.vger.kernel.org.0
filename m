Return-Path: <linux-media+bounces-23859-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFBC9F90C1
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 11:55:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 816231660B3
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 10:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D26141C07D8;
	Fri, 20 Dec 2024 10:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="lCVWNiHL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="aw1xkFxX"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4A3172BD5;
	Fri, 20 Dec 2024 10:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734692126; cv=none; b=VTY6XXIAQswd/LgDu7s06uq0c2nxqwf+RODbDkGF95XATbR3EN77SwPupvPH4FVZSheNpYuOv3WxOohPyxvOA55RDJXVf/X8gbEXdLA8SlD6B0up7Xd/5Zi2wFLMracWnYVlJ4N+csktevRl+55cbO0WUXedb3aNthjz82iIrE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734692126; c=relaxed/simple;
	bh=FM6H5r5/1Fq9sZywFLDERopehjmWZOm3gZBnWCVm/cE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OPIV2IgiYxPPAXNj15hW7zmPvf2YzNf2txTOrsH7fIZVw/4Sl+pymbJBGb/B+4SjxUcO63x7Yzf1q/b2Ly83wCX5ok55Y9sUXjAcgsMlOdHGJqkvql+ZVfc83SIAsPoPmHODLOEfL83g2dXEjYe8DINFwDBdw7KWEfzNTWJanas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=lCVWNiHL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=aw1xkFxX; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.stl.internal (Postfix) with ESMTP id 60ABE11401B3;
	Fri, 20 Dec 2024 05:55:23 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Fri, 20 Dec 2024 05:55:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1734692123;
	 x=1734778523; bh=UV983xr3Fb9qU4OGykgmse7yIehLqW0ty4jbU/OEht8=; b=
	lCVWNiHLGffDRzdRDb3gSKD+ppZaYvHVOraXBhy3sN4eJqlCyIwGKsVNqpul/zQM
	sm/eMkblkl9v0z3REDPdwASfoksGmulW+2QakZRWEBtwJQYjR6eaoK//3QdVVMde
	ndN1hxPMb9Sm3XSTJqbuCtOYt6v5iHnttlRCAooZtRzXx/XZnT/5fdGg4xNZDpp7
	syZ9bUEf4Z9OPH4fKdMR8ELLz9cUYOYMqWSINZygbkGmGiwBAXqBc9yLj/MvUvdG
	duCn2C7lbI+m9MqE1c1FVfNtcNfd/rA5DsJs/d0xqUZVMMuR29m26dSK9/fAGKQN
	tfiaymAoxB0Gl/aURQy9IQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1734692123; x=
	1734778523; bh=UV983xr3Fb9qU4OGykgmse7yIehLqW0ty4jbU/OEht8=; b=a
	w1xkFxXRfc713wOtxXKeqcO52UaFuqwx+A5AN5NqAKxhO7RssxDYeoXgMzM2EGYv
	HOpGK5I+jrP2QRK4GpifCNG4XkCGZgiDEtehMgjdh4XpwgB1fI9dWikrBsj0c5cW
	64prZx/BXyaIm9S14xcQnbcsCHKwGafjsptK0Fe3/fQ9zgcZ4G8t25UiTwIwiyuv
	eCQONmlSUSwg65kMO6aqEekzzXwkPzL18Utm2mAdu6pCbuqd8hE+Xh+4+fSRgLxY
	JeD97dajU7Sjq1KTCOpfse2FnNcqqJ4L6hc7LDG9zXg/L7FcHxK3fZkaOGlnvYUb
	sEmUSjELKj883zcxtXxTA==
X-ME-Sender: <xms:Gk1lZ6UFDNwNW5ys0VrumSeMyCjkShDcVS0Zmda-QrprZz6N8obXNw>
    <xme:Gk1lZ2nBQhBZlz07TTwxgkyxECSVprtjSrbdA2-n2Xj-lCkYbT8CzFsFc62U8glOR
    b9ZPOxcLqIHl-88Uy0>
X-ME-Received: <xmr:Gk1lZ-YHXThYsw8OLPq1hSNMGcZLaR04L8prqWXq-xVd12-9YRo-XgecjtfME80nXs-8YR5FjdWrIP1n2Zk8aNnHCeEv3TlIrA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddtvddgudelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpedtgfeu
    gfdtfedvkeffvdevheeuteffvefgvedvieduueegheetgffhvdfhtdeggfenucffohhmrg
    hinheprghnrghlohhgrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtg
    hhrdhsvgdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    oheplhgruhhrvghnthhiuhdrphgrlhgtuhesohhsshdrnhigphdrtghomhdprhgtphhtth
    hopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrhgvghhkhhes
    lhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvg
    hrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhm
    vgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqsh
    htrghgihhngheslhhishhtshdrlhhinhhugidruggvvh
X-ME-Proxy: <xmx:Gk1lZxVtoJWrVWA2IkXPldrfTBzOWn8kd1AShdN6Csl0vW3zaVKoVA>
    <xmx:Gk1lZ0kU79hbXnh7dARXBQVRbcNWownENon1eHehNUK8mAuxEwS1ZA>
    <xmx:Gk1lZ2fVN6zj16ogn8TDzR_4bFTjcbxw7mNCRdZUIsgkZXyD_fofTQ>
    <xmx:Gk1lZ2H4Ef1tHkXnkNxYSYBalz3JK-TVbNaa7Rc__xXquXcOWLDw5w>
    <xmx:G01lZyYeShEjB-x6Dc9XkZJ8WgoVXmQwZLVxsT77pTflNn-RZbPFwJOY>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Dec 2024 05:55:22 -0500 (EST)
Date: Fri, 20 Dec 2024 11:55:19 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 2/3] staging: media: max96712: remove extra debug
 register flag
Message-ID: <20241220105519.GA3634024@ragnatech.se>
References: <20241220104939.503547-1-laurentiu.palcu@oss.nxp.com>
 <20241220104939.503547-3-laurentiu.palcu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241220104939.503547-3-laurentiu.palcu@oss.nxp.com>

Hi Laurentiu,

Thanks for your work.

On 2024-12-20 12:49:37 +0200, Laurentiu Palcu wrote:
> The current implementation has the register disabled since it is not
> documented in the MAX96724 RM. However, in the chip's user's guide [1],
> in the Video Pattern Generator section, the register is documented and
> it appears to work just fine. Before the change I was experiencing
> approx 10fps when streaming, after: 30.3fps.
> 
> Hence, since both max96712 and max96724 have the register, we can remove
> the flag.
> 
> [1] https://www.analog.com/media/en/technical-documentation/user-guides/max96724fr-user-guide.pdf
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> v2:
>  * addressed Niklas' comments and removed the extra debug register flag;
> 
>  drivers/staging/media/max96712/max96712.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
> index 5228f9ec60859..ed4d5db1ff8d1 100644
> --- a/drivers/staging/media/max96712/max96712.c
> +++ b/drivers/staging/media/max96712/max96712.c
> @@ -27,7 +27,6 @@ enum max96712_pattern {
>  
>  struct max96712_info {
>  	unsigned int dpllfreq;
> -	bool have_debug_extra;
>  };
>  
>  struct max96712_priv {
> @@ -174,9 +173,7 @@ static void max96712_pattern_enable(struct max96712_priv *priv, bool enable)
>  		return;
>  	}
>  
> -	/* Set PCLK to 75MHz if device have DEBUG_EXTRA register. */
> -	if (priv->info->have_debug_extra)
> -		max96712_write(priv, DEBUG_EXTRA_REG, DEBUG_EXTRA_PCLK_75MHZ);
> +	max96712_write(priv, DEBUG_EXTRA_REG, DEBUG_EXTRA_PCLK_75MHZ);
>  
>  	/* Configure Video Timing Generator for 1920x1080 @ 30 fps. */
>  	max96712_write_bulk_value(priv, 0x1052, 0, 3);
> @@ -457,7 +454,6 @@ static void max96712_remove(struct i2c_client *client)
>  
>  static const struct max96712_info max96712_info_max96712 = {
>  	.dpllfreq = 1000,
> -	.have_debug_extra = true,
>  };
>  
>  static const struct max96712_info max96712_info_max96724 = {
> -- 
> 2.34.1
> 

-- 
Kind Regards,
Niklas Söderlund

