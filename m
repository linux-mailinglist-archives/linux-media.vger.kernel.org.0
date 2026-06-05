Return-Path: <linux-media+bounces-63873-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id taf4M75/ImqzYwEAu9opvQ
	(envelope-from <linux-media+bounces-63873-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 09:50:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D632864623B
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 09:50:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=nDzH0DvR;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63873-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-63873-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DCA053050B4F
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 07:33:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4A8D47D92E;
	Fri,  5 Jun 2026 07:33:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3445146AF06;
	Fri,  5 Jun 2026 07:33:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780644823; cv=none; b=a/tDvxvQVwvREZlxv4mnfZwYd0umD0FjwKWVAuMBVmYxWleWT0CLfn3EDyb7DBbBIV7AMVCrwwKLEzsAtsGfUzrnOz7Z60iBLaGJ6IHjt7kQ+WfEnnZxdT8/LdbIPZ5jCjgsq6m4DQ4GBQmsFccADT1PNnK3qAjf0nU27SL1OFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780644823; c=relaxed/simple;
	bh=5/fpLbJSpPToneEtCwS+llClYrMv3FbGhdphcd2nqN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pe3avjLiTGvZxy/UIUHY0PaxKXXFGK6Lg1fjA7zxDqolfz1DN85/mmKuxl0OLUd2q38QHahpMnJO8zjWFzZ7hbt38VBoVJv9M9HNUOcZ2GId/AzwJ7XS9cBiZqndykKfHtixzxAZComENvAXx6/jLQO8iZu9CSO2MPBgMsQ+eE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nDzH0DvR; arc=none smtp.client-ip=213.167.242.64
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B7FD38E0;
	Fri,  5 Jun 2026 09:33:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780644793;
	bh=5/fpLbJSpPToneEtCwS+llClYrMv3FbGhdphcd2nqN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nDzH0DvR/S9k8XaPfwmR2HOR5XzagqyffE18hRvV/6WEA1FnVvdyJvY86X1rrInY+
	 Nij73PGhkaVu1Jzgt7HjNy00ZNq2IbSMndum7uds0IreGquA+wu5Gx4eRUoZZ4yNPg
	 1hs8CtNpKsocJK3uxSOjaYsthkxXb0Kj1JvoO7GY=
Date: Fri, 5 Jun 2026 09:33:35 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: Re: [PATCH] media: rzg2l-cru: Remove height alignment restriction
Message-ID: <aiJ4b9Js8XjWvl6P@zed>
References: <20260521131911.92845-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260521131911.92845-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63873-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.csengg@gmail.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jacopo.mondi@ideasonboard.com,m:mchehab@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:from_mime,ideasonboard.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,zed:mid,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D632864623B

Hello Prabhakar

On Thu, May 21, 2026 at 02:19:11PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The CRU hardware found on RZ/G2L and RZ/G3E SoCs does not impose any
> height alignment requirement, so enforcing power-of-two alignment on
> the frame height is unnecessary.
>
> Remove the power-of-two height alignment restriction in the call to
> v4l_bound_align_image() by changing the height alignment argument
> from 2 to 0.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 1ab4b4c1745e..8d8103c51f29 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -843,7 +843,7 @@ static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
>
>  	/* Limit to CRU capabilities */
>  	v4l_bound_align_image(&pix->width, 320, info->max_width, 1,
> -			      &pix->height, 240, info->max_height, 2, 0);
> +			      &pix->height, 240, info->max_height, 0, 0);

Where does this setting ends up being written to which register ? I
had a quick look and I couldn't find it o_o

To be honest I didn't even find any register where the expected frame
dimensions have to be programmed, so I assume we only set the memory
destination address and the stride and the rest is handled
automatically ?

The peripheral supports image clipping which is currently not
implemented as far as I can see. How do we expect to control it ?
Through the TGT_CROP rectangle ? Just as a note, the V2H EPPrC
register reports:

"If an odd number is specified, the CRU operates as if an even number
(the specified number + 1) is specified."

But as far as I understand, clipping is not controlled by the image
format.

btw I think the halign parameter of v4l_bound_align_image() should be
set to 1 and not 0

>
>  	v4l2_fill_pixfmt(pix, pix->pixelformat, pix->width, pix->height);
>
> --
> 2.54.0
>
>

