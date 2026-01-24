Return-Path: <linux-media+bounces-51464-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CdqFx8idWmYBAEAu9opvQ
	(envelope-from <linux-media+bounces-51464-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 24 Jan 2026 20:48:47 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1D67EC1F
	for <lists+linux-media@lfdr.de>; Sat, 24 Jan 2026 20:48:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2F373012C51
	for <lists+linux-media@lfdr.de>; Sat, 24 Jan 2026 19:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A180A244186;
	Sat, 24 Jan 2026 19:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="ei/22MAe";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WLvRo9AP"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67191400C;
	Sat, 24 Jan 2026 19:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769284113; cv=none; b=NE33/BypuPWuFN49fdKS0LddZBabguLWf/varoMyrAaG+X92v2VEsUaz6oU0za3zZZbh/9H4AsqgUvQBumZzo+oatIDfSkXi0npsWHlArjcoIg7b3jiQxF007/056btrASi87tQtXv1K/sRGll/+qUK/KGNZXNRRii8lCnsXOnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769284113; c=relaxed/simple;
	bh=4SUkpAZUG81QwT6ygsF9A+r4K1zrCy8hBU/DzGVJfVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GTGe7YM0+CJNKpLF3SYEd6Nz/2LpSK2U28yN8fWI1rqcGoPtKj4yofGFUvrVdEQLwY/QHardqdaWSC7xDWfxtN1bFLjmIsxFKmMCYxHi3G7L59SjeiMQzYSGhKnD25vq3LRPBXw57Qwy0WwyQsWobS2dVRaFQr7C/ME9TJvk5oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=ei/22MAe; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WLvRo9AP; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id BAB391D0015C;
	Sat, 24 Jan 2026 14:48:29 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Sat, 24 Jan 2026 14:48:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1769284109;
	 x=1769370509; bh=6Z9KZekhcIHngRJZiRo7Pl0gc3lR9dx/2JP7RuL4efc=; b=
	ei/22MAecVvlJUyeA1rQN1l+2PdknZhantHJlsjNYYOB+aZ0tTEghyapOMHzALmk
	4KKcw4IzkZqBBq9inb0FciMj70v9RcJ/84A01oFTm/FvXvFk/KJtgZnsqK7+o7iD
	LtENDrL3KxT/tVIEo7sm7w2FoUMhGv5Yt6GQcz8WVoKCrByS0juqjMNfDHGaosQV
	nS1EBYx34Nfj5r0169tsFdjm35SeS61sBODavmw+Mnphdra8UbUAVx30M9+TRYyJ
	DQmuKsX8RxJDK7073q8lD/X7J1TcidQ7G5FzS9NcQz6kZDrAcHsvIddFT6eRX+qB
	g+P+7rg8J25yJ/vQ8PQOfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1769284109; x=
	1769370509; bh=6Z9KZekhcIHngRJZiRo7Pl0gc3lR9dx/2JP7RuL4efc=; b=W
	LvRo9APO5CJLFdyMJPYtUGe5qVRZfROXd+JyFspipFVInKseTSXylUCLXFtlWKsW
	pkI6ZwWDX5bnayM1N4hABWvKtAiU41934+f/1pSrviJueb/zwMQlFI4/WEBi0LK1
	bI/G0VnB3mqYPk+fWX1WLx1IvFQBfHckl4Ofc8V1hiDJYkToMbX8LwQctxZZKJ/7
	5x+MTc41PsH5iGZq9zAZAteLkgvobfedNFc+gzjrKWcY12FCMr2baNnEV382bY+0
	rcyhkl6qouixGgb09J65rVj+is2M3a16KT2auPPHQy0p9I1nYszKB4NY5lVP7Bo5
	p6lEG1YfHL9ki3AB4/cGQ==
X-ME-Sender: <xms:DSJ1aXzsYKOoaaVtfSgzoWa0unmRdVy0iIJ9KbZetdX4IqtIkdBDPg>
    <xme:DSJ1afvOrUDVb30D8S23bAWNR4VX2uNMJ7IG4VR2Pow_VhYfzzh2QvIGzGL-m39Ux
    7oDo3cCL0HfNR9ZscyIrqJDmFEeJ5sqv8n5tc1SqgT4KlyJAreK8A>
X-ME-Received: <xmr:DSJ1aSCfYfSFQQE4xmPZAT7Cn9M23o9CShxHNCoghvzWU0DwLqqsFMjRN40FYyb0cGfji_Qe3WvpTVn6MxdZxr4_KH7q2vs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduhedvkedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrg
    htvggthhdrshgvqeenucggtffrrghtthgvrhhnpeevteegtddvvdfhtdekgefhfeefheet
    heekkeegfeejudeiudeuleegtdehkeekteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhn
    rghtvggthhdrshgvpdhnsggprhgtphhtthhopeelpdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhdorhgvnhgvshgrshesihguvggrshho
    nhgsohgrrhgurdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgt
    phhtthhopehmrghgnhhushdruggrmhhmsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplh
    gruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgt
    phhtthhopehkihgvrhgrnhdrsghinhhghhgrmhdorhgvnhgvshgrshesihguvggrshhonh
    gsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtse
    hvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghl
    sehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:DSJ1aZFn06tCR_UDHEr0sONbUTJOYVT0U3cD8cntKIVCsecedsTBHA>
    <xmx:DSJ1aaCXYcMotriuV0hH4j1QW4kaLGWLONuPS1JqJZl7KfgJlu9dyQ>
    <xmx:DSJ1aXlQvJa1vakPgHRWbGcLkke9ljqibMRuDGSjkpeVIZ4i1-sYrg>
    <xmx:DSJ1aYPRJNjzAqI2SdF9yZY4g4ngP1iV-HB9R3kjaFj9g_cRqFr3qQ>
    <xmx:DSJ1ac8ENaTqpNG8VmTWim28aKOksiW1ItA7vd92IHlnJVVtTdEhbPnJ>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 24 Jan 2026 14:48:28 -0500 (EST)
Date: Sat, 24 Jan 2026 20:48:27 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] media: rcar-csi2: Improve FLD_FLD_EN macros
Message-ID: <20260124194827.GA3395783@ragnatech.se>
References: <20260115-rcar-streams-prep-1-v1-0-f87700926c11@ideasonboard.com>
 <20260115-rcar-streams-prep-1-v1-2-f87700926c11@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260115-rcar-streams-prep-1-v1-2-f87700926c11@ideasonboard.com>
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
	TAGGED_FROM(0.00)[bounces-51464-lists,linux-media=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,ragnatech.se:email,ragnatech.se:dkim,ragnatech.se:mid,ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BF1D67EC1F
X-Rspamd-Action: no action

Hi Tomi,

Thanks for your work.

On 2026-01-15 12:06:58 +0200, Tomi Valkeinen wrote:
> Instead of having four macros for FLD_FLD_EN for different channels,
> have just one FLD_FLD_EN(ch).
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/renesas/rcar-csi2.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> index d1b31ab8b8c4..3cd35adb6803 100644
> --- a/drivers/media/platform/renesas/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-csi2.c
> @@ -71,10 +71,7 @@ struct rcar_csi2;
>  #define FLD_REG				0x1c
>  #define FLD_FLD_NUM(n)			(((n) & 0xff) << 16)
>  #define FLD_DET_SEL(n)			(((n) & 0x3) << 4)
> -#define FLD_FLD_EN4			BIT(3)
> -#define FLD_FLD_EN3			BIT(2)
> -#define FLD_FLD_EN2			BIT(1)
> -#define FLD_FLD_EN			BIT(0)
> +#define FLD_FLD_EN(ch)			BIT(ch)
>  
>  /* Automatic Standby Control */
>  #define ASTBY_REG			0x20
> @@ -1082,8 +1079,8 @@ static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv,
>  	}
>  
>  	if (fmt->field == V4L2_FIELD_ALTERNATE)
> -		fld = FLD_DET_SEL(1) | FLD_FLD_EN4 | FLD_FLD_EN3 | FLD_FLD_EN2
> -			| FLD_FLD_EN;
> +		fld = FLD_DET_SEL(1) | FLD_FLD_EN(3) | FLD_FLD_EN(2) |
> +		      FLD_FLD_EN(1) | FLD_FLD_EN(0);
>  
>  	/*
>  	 * Get the number of active data lanes inspecting the remote mbus
> 
> -- 
> 2.43.0
> 

-- 
Kind Regards,
Niklas Söderlund

