Return-Path: <linux-media+bounces-51921-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PdvHO9cf2m0owIAu9opvQ
	(envelope-from <linux-media+bounces-51921-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Feb 2026 15:02:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1EAC6175
	for <lists+linux-media@lfdr.de>; Sun, 01 Feb 2026 15:02:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3EA86300335C
	for <lists+linux-media@lfdr.de>; Sun,  1 Feb 2026 14:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1AF53469FA;
	Sun,  1 Feb 2026 14:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="QrUjaVLG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="wy0ADGn8"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E831212550;
	Sun,  1 Feb 2026 14:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769954536; cv=none; b=PDTJ8LK639ZdwjBeVG4XDAncuahg3EqqsxCxChVfZuch4mNp+7jna8ANbDWvRHq3+21HwYCsGomGM0qDQWmRi8sYSNgy0MChTD86JQOIG9drcdwAUnUq3GnRS187H5UFn6l1jpUV7UDh2vboTIO6kO1ltXUSynaQ+6r5R4zeuFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769954536; c=relaxed/simple;
	bh=/aSD5aGePbT3jN3MMddfP1oapsmych/W+T6mYT7R6Eg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aGCmOtrAAYVto53R0lMsyuIv+PX+fxt/TPpAt3KUE/hAQ9hui9vSxCZ/bJ9Uco4FITO4Q8rm06sR3UNiijoDQyhdq67CBm+TEwHuit1yLUdS3JEtykR36XP5JG41R7lEffv2s4+E+yySmMnbbO/oz6nKiPamXGV9dF0qn6y9ong=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=QrUjaVLG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=wy0ADGn8; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4D89B140001A;
	Sun,  1 Feb 2026 09:02:13 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sun, 01 Feb 2026 09:02:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1769954533;
	 x=1770040933; bh=HRZ9VEbvyR2vBkjhqcOgyYPSk648YO7Db05Swru5oA4=; b=
	QrUjaVLG5+hDyiHnyWdGdh9PfQYiLGkuBes9NytOM8lCnu9o8Xref7wlEByWq5Ei
	YOTEQk+7QwrjGME8mCoF7/t7v/xgVZkGoEvZmn6Wr0bcpMZw+s0kz3oFxcVQyLWG
	Bu3ewdfSkbrvDnXADmsBcptwYLgY5HrshBqqRFAJi+66mmWqf0czX05dTkkznlps
	wS4Hdkd4zdGsXhyfrjGSaIVR8J4XaTdLXdTYHZo8rOf0tU/OP0DeVM4yY7+RluhA
	guwU/887xii5FTJrcrbZSBXodhPAOFOewUH+ijpfYRMOUNIYg1fMM950PFUFiSeW
	DhBrdOOQkuE9vRzh8rGL3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1769954533; x=
	1770040933; bh=HRZ9VEbvyR2vBkjhqcOgyYPSk648YO7Db05Swru5oA4=; b=w
	y0ADGn8yCYV2u+CPJ1MGHp2OvZ2AxHrtAzAsRWZCk0W6FJCGNq7s+G3pOejaVf6l
	J7HKGPqWpA5PhvjF02LT1tZrlUO16ZYOq6O112//Wz18un8Bx9cd5ebmsWQDCYom
	SUiAfAs+F234l7Us3ROepHaAUm0IzWIteHngcQl2VYMTdalUGBIEi3L0KFy4auWF
	N1Zt3RJJ7iDO8+y0gmZZ7RId+dOlLVDSEp87ffPSVBqOSoj8syba3AzegyOOT8Wd
	2437M4GZ2UftfemY/XYaqxDgzlcns6mchsttIfAr4vV27VazV5fPL68Xj/GhddP+
	CkEL89aTQ57gYlrxGo6yg==
X-ME-Sender: <xms:5Vx_aZJhAxCsmgn-pRU0qkgkoBk9WqQnj3OTFgXIOW1dnZ4_RLjZLg>
    <xme:5Vx_aVltU3v2qL6C26ylACduxmjp3fYhtjinr1vL-Abrsu7sRuPsP6S4fqRL8XbhE
    mv1NZoaHcP0XoDco6M6H5Cb2CFx6GzYv1tfxR_FxTGYbs5k3BggxOY>
X-ME-Received: <xmr:5Vx_aSaB1jsKxLmw-hZWSH9sGZwOiv1Ce4xw2qZcIcC1DjriiaDrctQ5WJsaqg0fCAcJZyxMImsR7BHmxn2jvEKE0bqb63A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddujeegleejucetufdoteggodetrf
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
    gruhhrvghnthdrphhinhgthhgrrhhtodhrvghnvghsrghssehiuggvrghsohhnsghorghr
    ugdrtghomhdprhgtphhtthhopehhvhgvrhhkuhhilheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrd
    horhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghl
    rdhorhhg
X-ME-Proxy: <xmx:5Vx_aR8IMa3dtwSS9y2y4BAFLch_yEa39EaX3CmVhZXV00RW9EZ-vA>
    <xmx:5Vx_aRaIZp25kagqQg_JHOKHpH9rtmaOug0TqOgy-b_rAUyK1x_uwg>
    <xmx:5Vx_abe2qNsoz3GSvMg2JZWUeEeUBmnTFTsZ0FbB8AErDEcuyI0Yjg>
    <xmx:5Vx_aekN0JnO_roat8bMcO8iTdwAfO3SEQ3mI0CxHhnn24oqJkLQ7w>
    <xmx:5Vx_ad3B-7DsbrWoyHagl0xE3qrxKlvz1iT5YOpQ-iqvOYIIJZTvRjYw>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 1 Feb 2026 09:02:12 -0500 (EST)
Date: Sun, 1 Feb 2026 15:02:11 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: renesas: vin: Fix RAW8 (again)
Message-ID: <20260201140211.GC1964634@ragnatech.se>
References: <20260127-rcar-fix-raw8-again-v1-1-642283bc0fa4@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260127-rcar-fix-raw8-again-v1-1-642283bc0fa4@ideasonboard.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm2,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,ideasonboard.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51921-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,messagingengine.com:dkim]
X-Rspamd-Queue-Id: 1A1EAC6175
X-Rspamd-Action: no action

Hi Tomi,

Thanks for really gorking this and making sens of the datasheet, nice 
work!

On 2026-01-27 10:56:12 +0200, Tomi Valkeinen wrote:
> Commit e7376745ad5c ("media: rcar-vin: Fix stride setting for RAW8
> formats") removed dividing the stride by two for RAW8 formats. It is
> unclear how this was tested, but in any of the recent tests this does
> not seem to work and produces quite distorted images.
> 
> However, reverting the patch fixes the issues only partially. VNIS_REG
> requires alignment to 16 bytes, and when dividing the stride by 2, in
> some cases we end up with a non-aligned stride, producing a tilted
> image. This issue has to be fixed in rvin_format_bytesperline() where we
> do the alignment for bytesperline.
> 
> Adding back the stride division and increasing the alignment for RAW8
> formats to 0x20 fixes the problems related to RAW8.
> 
> Fixes: e7376745ad5c ("media: rcar-vin: Fix stride setting for RAW8 formats")
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/renesas/rcar-vin/rcar-dma.c | 22 ++++++++++++++++++++++
>  .../media/platform/renesas/rcar-vin/rcar-v4l2.c    | 12 ++++++++++++
>  2 files changed, 34 insertions(+)
> 
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> index b619d1436a41..f9af9177e02f 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> @@ -676,8 +676,30 @@ void rvin_crop_scale_comp(struct rvin_dev *vin)
>  	if (vin->scaler)
>  		vin->scaler(vin);
>  
> +	/*
> +	 * VNIS_REG has four lowest bits always 0, i.e. the stride has to be
> +	 * aligned to 16 bytes. This is done in rvin_format_bytesperline().
> +	 */
> +
>  	fmt = rvin_format_from_pixel(vin, vin->format.pixelformat);
>  	stride = vin->format.bytesperline / fmt->bpp;
> +
> +	/*
> +	 * RAW8 format bpp is 1, but the hardware process RAW8 format in 2 pixel
> +	 * units, so we need to divide the stride by 2.
> +	 */
> +	switch (vin->format.pixelformat) {
> +	case V4L2_PIX_FMT_SBGGR8:
> +	case V4L2_PIX_FMT_SGBRG8:
> +	case V4L2_PIX_FMT_SGRBG8:
> +	case V4L2_PIX_FMT_SRGGB8:
> +	case V4L2_PIX_FMT_GREY:
> +		stride /= 2;
> +		break;
> +	default:
> +		break;
> +	}
> +
>  	rvin_write(vin, stride, VNIS_REG);
>  }
>  
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
> index 079dbaf016c2..9d45e11898c1 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
> @@ -155,6 +155,18 @@ static u32 rvin_format_bytesperline(struct rvin_dev *vin,
>  	case V4L2_PIX_FMT_NV16:
>  		align = 0x20;
>  		break;
> +	case V4L2_PIX_FMT_SBGGR8:
> +	case V4L2_PIX_FMT_SGBRG8:
> +	case V4L2_PIX_FMT_SGRBG8:
> +	case V4L2_PIX_FMT_SRGGB8:
> +	case V4L2_PIX_FMT_GREY:
> +		/*
> +		 * RAW8 format bpp is 1, but the hardware process RAW8 format in
> +		 * 2 pixel units, and we need to align to 32 bytes. See
> +		 * rvin_crop_scale_comp().
> +		 */
> +		align = 0x20;
> +		break;
>  	default:
>  		align = 0x10;
>  		break;
> 
> ---
> base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
> change-id: 20260127-rcar-fix-raw8-again-9dacab87ad33
> 
> Best regards,
> -- 
> Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 

-- 
Kind Regards,
Niklas Söderlund

