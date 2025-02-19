Return-Path: <linux-media+bounces-26392-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F9DA3C215
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 15:26:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02802188494E
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 14:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0CD21DFE25;
	Wed, 19 Feb 2025 14:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="DeRJqtv0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MAcanNsf"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8791EFFA1;
	Wed, 19 Feb 2025 14:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739975105; cv=none; b=roqOOk7czzUL9wLRREjuRmfoWCbfNRBvqVB2XvIOC7kBgND4+9C0OjLiQ1ghUd0kRG0fFT7maNeAvjo4Z88yjynTxVfhI+26kIeJg2wD1xfgm52o41wcDIIHBxXVOTayIoPNp3MCo4fzN7CA8935j4Jlu/3WXigfhPNo+YHSv+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739975105; c=relaxed/simple;
	bh=vQc9aAx8CcdK82FZkUz6HZQjjJMhvLybA0eSKC4QkKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZW1ZSD/5uYckCmXyWt41PIrqksfrWaYsno95eXTtdpVbksDMRYgdc0fmn+CXt80nb150py//LxwRbbZ23JI+KFe9he0RbXgf+ewzNr7FgmBEDHE6TYV9SLTsg+VQXMHjoD21jiAzmfBZx9Wl9LwGWoD47bm+nkFC3wmjOxQAC/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=DeRJqtv0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MAcanNsf; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 0FC95254019E;
	Wed, 19 Feb 2025 09:25:02 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Wed, 19 Feb 2025 09:25:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1739975101;
	 x=1740061501; bh=2FT/S7jmQJ86nFa5PyoiBPEHzmHzcMxWb1OSX8bVYD0=; b=
	DeRJqtv0dybEZdWYUQZK1kr98zo74tguhSSwPIuhfnoUI7yCj9MpPirPiN7EqlGV
	Z1okIQQJZ+x1tJqEK+UIcgEePQVDS61gfiiX/WYzVXuGiurMaHcD0NcahZKxjh93
	2Rkj9pjFPAD9YD19SSYTOfDsjBwOIszw7bFn/29yB5CIa3RQus7Q9VYoPAzLK19Q
	+Bu677MJt+kUyfevlEVh5XIXnaX9QZM02d9CJIUHd53LyOSW4esvAg1jg1rMl6aE
	ErxHLo7znqHcHxkDmsPoU880bGdBRd3c1AF7ti7oK/wRRlUc3dm/wslmNGwdqsXd
	j7VmNzrq8s1hmD6Ef4ZyYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739975101; x=
	1740061501; bh=2FT/S7jmQJ86nFa5PyoiBPEHzmHzcMxWb1OSX8bVYD0=; b=M
	AcanNsfZjEYNhM6YLpSKa+TYkhNHfIGIGLiD56lzHtpMNf4NKrTzlOmo25E9kK8v
	KeZs3hQQ543cSM07nDqqATIOQmXwnDYonri4/nR4bYW2LNnZORJWrPofrX6j3hQh
	vhmIPIXDtyY9/oEs5QOHcBF1ArmJLoisAvkXDDaY5+N3iF8JNF+6rlrXQyXlSLEL
	XXvSCYVDJ9bFQI6PH8NJTgfPV6GU5fLs1YFPOeUuaPfGx9bWg0J6sw6hJ9mhKEBG
	sggtL2RdHkpcOSKS1l9OW/pwL55okOa/JlN4sWQbyAkYSSNYhtQTey+/IpzzuvBD
	xrbN86WY3lQ/vheYQW4ZA==
X-ME-Sender: <xms:vem1Z74jn6PjbmOp1LJDMdHgSxFT71_RH8VYrauBpAO9dgWUN81tNQ>
    <xme:vem1Zw4I_aNs5sDSeqmGbIrhegNxYyWRumkfU5jiBq4z484n7pwXAa-SvJ0HhEgWS
    n_0eXOYvfnjdJvMm6M>
X-ME-Received: <xmr:vem1ZydaQbBW5UtCrHyizcR71oEaJF_Q_RTdqbXWcI5fkkU9uxC28gKdndZmrx1RBvjhOQAC2zFFc3SMWdtVdw4I4UOPkCXR7Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeigeegkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepveet
    gedtvddvhfdtkeeghfeffeehteehkeekgeefjeduieduueelgedtheekkeetnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhs
    ohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepledpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepthhomhhirdhvrghlkhgvihhnvghnodhr
    vghnvghsrghssehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehmtghhvg
    hhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrghkrghrihdrrghilhhushes
    lhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrse
    hvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgr
    shdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqd
    hkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehmtghhvghh
    rggsodhhuhgrfigviheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhgruhhrvghnth
    drphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehj
    rggtohhpohdrmhhonhguihesihguvggrshhonhgsohgrrhgurdgtohhm
X-ME-Proxy: <xmx:vem1Z8LYqfWUVO4lVSEobQcYX7rYwaQhfMuLnsPcmM0a1vhjVmKJIw>
    <xmx:vem1Z_JaK33J5Dlf9Ui2qwv860I8yHxLfA2bkaUMV6UTYswOnWjC6w>
    <xmx:vem1Z1zBKXMvckVJh-RYwN6UGvqsOPfTg4AhWOOL77i8E11cn-oaRg>
    <xmx:vem1Z7KN7QcVjNwf1IiyhRm3HopQfZKMb-NXx32dvP2qcnlLeLbNqw>
    <xmx:vem1ZwWuzsh7srGPUUS4H90AzVrHKKKWATgnrfG3wtj0XcoWWETJIh9n>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Feb 2025 09:25:01 -0500 (EST)
Date: Wed, 19 Feb 2025 15:24:59 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH 07/18] media: rcar-csi2: Fix typo
Message-ID: <20250219142459.GB512344@ragnatech.se>
References: <20250219-rcar-streams-v1-0-f1b93e370aab@ideasonboard.com>
 <20250219-rcar-streams-v1-7-f1b93e370aab@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250219-rcar-streams-v1-7-f1b93e370aab@ideasonboard.com>

Hi Tomi,

On 2025-02-19 15:49:01 +0200, Tomi Valkeinen wrote:
> Fix typo with variable name 'msps'.

FWIW, this is not a typo, C-PHY uses symbols per seconds, not bits per 
second.

> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/rcar-csi2.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> index 845fb3e155f1..92697ea3df01 100644
> --- a/drivers/media/platform/renesas/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-csi2.c
> @@ -1301,7 +1301,7 @@ static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
>  	const struct rcar_csi2_format *format;
>  	const struct v4l2_mbus_framefmt *fmt;
>  	unsigned int lanes;
> -	int msps;
> +	int mbps;
>  	int ret;
>  
>  	/* Use the format on the sink pad to compute the receiver config. */
> @@ -1314,9 +1314,9 @@ static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
>  	if (ret)
>  		return ret;
>  
> -	msps = rcsi2_calc_mbps(priv, format->bpp, lanes);
> -	if (msps < 0)
> -		return msps;
> +	mbps = rcsi2_calc_mbps(priv, format->bpp, lanes);
> +	if (mbps < 0)
> +		return mbps;
>  
>  	/* Reset LINK and PHY*/
>  	rcsi2_write(priv, V4H_CSI2_RESETN_REG, 0);
> @@ -1352,7 +1352,7 @@ static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
>  	rcsi2_write16(priv, V4H_PPI_RW_COMMON_CFG_REG, 0x0003);
>  
>  	/* C-PHY settings */
> -	ret = rcsi2_c_phy_setting_v4h(priv, msps);
> +	ret = rcsi2_c_phy_setting_v4h(priv, mbps);
>  	if (ret)
>  		return ret;
>  
> 
> -- 
> 2.43.0
> 

-- 
Kind Regards,
Niklas Söderlund

