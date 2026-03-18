Return-Path: <linux-media+bounces-56242-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCNjMoAGu2kgeQIAu9opvQ
	(envelope-from <linux-media+bounces-56242-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 21:09:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 436652C25E4
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 21:09:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02CF931E1660
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 20:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB9ED3F787C;
	Wed, 18 Mar 2026 20:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="G/9VBvIQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AF23644BC;
	Wed, 18 Mar 2026 20:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773864274; cv=none; b=HiSSQHRmrbFtexYTbdL4WFaPyZ1bWunuFG7jY0ySjH69xNDQeP0QfPaPBgX74hqfryeE7jXeTDjDN9Fg3Trl8lT8g8CMIkX70HYbvU6PLy4LkB9puwahLC5jruNE/kjRZw1iTgGlLeA5O5BZ4XZmi4SmVjaP5ufzznWQkZH8r0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773864274; c=relaxed/simple;
	bh=gGt+9as0jFUNNuynaB+wRPumFBiE35FKn6H1Lm7f7pw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K4H8F8N9rwludG0I13EvycqCc9hFLpQq8NfZQ57TETzpilgilMPQ66iAXU5Dxcd6vU8puBaRWMP4haYnMD+OXzGy+x2Jk1aqijPhqeRJMVUGHsTMmnR8DM4LxVlc/Gu2A6xKHyt2Y9EIO3/8z/68lmB4M74YaEGOEXtt9iWIAfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=G/9VBvIQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E4984308;
	Wed, 18 Mar 2026 21:03:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773864198;
	bh=gGt+9as0jFUNNuynaB+wRPumFBiE35FKn6H1Lm7f7pw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G/9VBvIQ0SVBYjL7Vv4ZKTPdzgzyN4IYCBF/ENygL+g/iiQF7O2iFh5Dw3VTN3vuo
	 mWAL+xwU9xjthLt8CTXzIW6QOhldws7OptY0zvAuuSP4XmPddic+L4e2in80s/YFh7
	 FMv5hhxbpg6RbhECPyNF2E7QR8XA3mwMqBDpBUmM=
Date: Wed, 18 Mar 2026 22:04:29 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: renesas: vin: Fix RAW8 (again)
Message-ID: <20260318200429.GA716464@killaraus.ideasonboard.com>
References: <20260127-rcar-fix-raw8-again-v1-1-642283bc0fa4@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260127-rcar-fix-raw8-again-v1-1-642283bc0fa4@ideasonboard.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[ragnatech.se,kernel.org,glider.be,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-56242-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[killaraus.ideasonboard.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email]
X-Rspamd-Queue-Id: 436652C25E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Tomi,

Thank you for the patch.

On Tue, Jan 27, 2026 at 10:56:12AM +0200, Tomi Valkeinen wrote:
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

Isn't it "16 pixels" ? The code seems correct.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

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

-- 
Regards,

Laurent Pinchart

