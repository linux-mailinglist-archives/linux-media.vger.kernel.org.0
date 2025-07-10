Return-Path: <linux-media+bounces-37296-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 334BCB002D3
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 15:02:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75B3716F2E5
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 13:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A039826B096;
	Thu, 10 Jul 2025 13:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="XilTcTD3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dHyQd+5r"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D366223DF1;
	Thu, 10 Jul 2025 13:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752152568; cv=none; b=q1saf42JEN1DCKB5lR7KPNTpTxkalmwYLmNXgKBjwDTFvRGP1k0ySY+m5yKbY0f7NYdRiHi71O9qd345YHXjE5cnFMtF/n0MOKxNqsMXbmt/BeNRc0ZDvizZON6f5jgHJZYF20RfJZO0Iga6NBGujS/ImVt0IGfI8DpB6mBSUiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752152568; c=relaxed/simple;
	bh=otW4eD02Ff2uw6Y0Ma+nPka12y/IKMTdo67VnHlOwAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JQN/RzB/EOdR7SrKx/FstM7OLql8zU+BfCId2PqxThZMmcREIdZ/75wDcMoF1WN7Ft9zYV2qJs5gNp2jW58RsXBR2BPi4Vz/NHgto2a319MlPbCDMsE/6XH4pBirfD2+x05zsJ5qlyAdiNhs0mBzd46B52DP0prv9gXgQQDd8dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=XilTcTD3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dHyQd+5r; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 91D321400149;
	Thu, 10 Jul 2025 09:02:46 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Thu, 10 Jul 2025 09:02:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1752152566;
	 x=1752238966; bh=uEDFnG10IwOmsA3sMnJhNyN+J/4e0yh71HbEMyAJMpI=; b=
	XilTcTD3av0k4HbZkwN94lGT21cEU1xtFNcbOvTCL9O+2N5m7nWUpnGGbP6ZX8Gh
	6fjqv6jC2rwIr1hO8XG/xAiL/QdN0POWca7DZTvPDL25MkF177LDqlw/j4CyNVdZ
	G1mu4D4OFzFZ13lDDFa5KjVqQUp8/Mr5gQonXhLA3EEksrakeD8Ak2MiRkJebbXw
	aMOwEuenx873VTiTf0YEKXLfSGNXJXK2hRTUTlUdKx3ktojhvEmuIqxeNsaJX6F9
	dCWjbGI9alrfX41nvVX7E2KMsufszk+3GSDi2+MPGRrHsj97rxEM6fX335Uva0ei
	cSqNqFGNctCyEfNJPJBQVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1752152566; x=
	1752238966; bh=uEDFnG10IwOmsA3sMnJhNyN+J/4e0yh71HbEMyAJMpI=; b=d
	HyQd+5rnpSm0ZjqndsxBtqMalgYRqUjpNFHP0/igLhg1BrYutqkj354Hm28yr83L
	kLY95j23Z2jklahQ/ziiMyiGrav7Xu5rhsk1zynt6CwtLln93zbFsR98toiSLPRw
	B2hbbsWm1K3g4hFGZ/TjWpbPMIb+KGFQD1HrbJUHulmc51O14mwWw3ZrCOAMrDv2
	Mg3X394zNWq+10Bey8IjYI54JzXpYLe553d41Be5Jn6dFLBj/4ZnQXbIbn0mOg5n
	MVE3GpVTPx4nY/QgwCh19pRtPyLgap41emIlXfdd/I6egzxZpcLCHjO5nWSzJ3II
	YwtW7utRHMi/DuCrQHH/Q==
X-ME-Sender: <xms:9blvaE2yQ3alJhRjFrBtuxW0XQqNvR7hLkn_lvf-pX42kc6byntwTw>
    <xme:9blvaLEWuDIy1flGqAvnYHwbzkeQOADhLpqJBadaHL9p_L1nJsTIscHc2bbcBBi7R
    1wC5Uk8lJnwjfYynQo>
X-ME-Received: <xmr:9blvaPH_s-iEH4yROJp9UEfWSW8VhDjwdlPsVh7BiTELKCKi0UCZI5H1aubX8U4IQ-rmQkcPgkBiSXFpcy5_b8I5I8dS_0BwJg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegtdehudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrth
    gvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepveetgedtvddvhfdtkeeghfeffeehteeh
    keekgeefjeduieduueelgedtheekkeetnecuvehluhhsthgvrhfuihiivgepudenucfrrg
    hrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgr
    thgvtghhrdhsvgdpnhgspghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthho
    pehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehfrggsrhhiiihioh
    drtggrshhtrhhordhjiiesrhgvnhgvshgrshdrtghomhdprhgtphhtthhopehkihgvrhgr
    nhdrsghinhhghhgrmhdorhgvnhgvshgrshesihguvggrshhonhgsohgrrhgurdgtohhmpd
    hrtghpthhtohepjhgrtghophhosehjmhhonhguihdrohhrghdprhgtphhtthhopehlrghu
    rhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpth
    htoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphht
    thhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorh
    hg
X-ME-Proxy: <xmx:9blvaO5fdu8kKK7KZAZdsNeP5yvqZJtSy6RKhna6hc7Ccl6CDRCAgw>
    <xmx:9blvaEyBHKo-uM_-RmO_PwUzt0YI8SEH2t_dWM0axUTG5piGGj8rhg>
    <xmx:9blvaNMK6jEKs6AJ5sTyI26dR5Wnh6AwTf7YPrGStJsQup02OjG_Vg>
    <xmx:9blvaKldZPyhaIybX3EIOoAPYW9A1binv8EmcTOwJeFFsH3nNc2xXw>
    <xmx:9rlvaLbmfTOpjgjqFW2-BVRA0nr2ocTwIuF9PQwePdXGqBFM8JGOgJSO>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Jul 2025 09:02:45 -0400 (EDT)
Date: Thu, 10 Jul 2025 15:02:44 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/5] media: renesas: rcar-vin: Convert to
 DEFINE_SIMPLE_DEV_PM_OPS()
Message-ID: <20250710130244.GE2234326@ragnatech.se>
References: <cover.1752088108.git.geert+renesas@glider.be>
 <21c38e1fc0c8383d8d723b61f00f37d4003e0de9.1752088108.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <21c38e1fc0c8383d8d723b61f00f37d4003e0de9.1752088108.git.geert+renesas@glider.be>

Hi Geert,

Thanks for your work.

On 2025-07-09 21:16:08 +0200, Geert Uytterhoeven wrote:
> Convert the Renesas R-Car Video Input driver from SIMPLE_DEV_PM_OPS() to
> DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr().  This lets us drop the
> __maybe_unused annotations from its suspend and resume callbacks, and
> reduces kernel size in case CONFIG_PM or CONFIG_PM_SLEEP is disabled.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/renesas/rcar-vin/rcar-core.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> index f73729f59671be20..100105b620e31e58 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> @@ -849,7 +849,7 @@ static int rvin_isp_init(struct rvin_dev *vin)
>   * Suspend / Resume
>   */
>  
> -static int __maybe_unused rvin_suspend(struct device *dev)
> +static int rvin_suspend(struct device *dev)
>  {
>  	struct rvin_dev *vin = dev_get_drvdata(dev);
>  
> @@ -861,7 +861,7 @@ static int __maybe_unused rvin_suspend(struct device *dev)
>  	return 0;
>  }
>  
> -static int __maybe_unused rvin_resume(struct device *dev)
> +static int rvin_resume(struct device *dev)
>  {
>  	struct rvin_dev *vin = dev_get_drvdata(dev);
>  
> @@ -1276,13 +1276,13 @@ static void rcar_vin_remove(struct platform_device *pdev)
>  	rvin_dma_unregister(vin);
>  }
>  
> -static SIMPLE_DEV_PM_OPS(rvin_pm_ops, rvin_suspend, rvin_resume);
> +static DEFINE_SIMPLE_DEV_PM_OPS(rvin_pm_ops, rvin_suspend, rvin_resume);
>  
>  static struct platform_driver rcar_vin_driver = {
>  	.driver = {
>  		.name = "rcar-vin",
>  		.suppress_bind_attrs = true,
> -		.pm = &rvin_pm_ops,
> +		.pm = pm_sleep_ptr(&rvin_pm_ops),
>  		.of_match_table = rvin_of_id_table,
>  	},
>  	.probe = rcar_vin_probe,
> -- 
> 2.43.0
> 

-- 
Kind Regards,
Niklas Söderlund

