Return-Path: <linux-media+bounces-65584-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id L671D8Y1PGo9lQgAu9opvQ
	(envelope-from <linux-media+bounces-65584-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 21:53:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5226C11BD
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 21:53:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=GRe4TZ8N;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65584-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65584-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DBF7F30237D3
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 19:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9857F3CD8BF;
	Wed, 24 Jun 2026 19:53:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC434305E28;
	Wed, 24 Jun 2026 19:53:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782330819; cv=none; b=TVynh0wg6tlWLqLCyBUuJyRNwKs8WUBAO0ZhIlFYXBVy72oe+iP87D/jNILkPUjhAG37WFTGpmrK5uewmWjTMyE7hqpUwVPpADZcRiTyfK7xe7YiHuUzkjnBnr+llB2+x82RJ4UxQaqu6iuFA8RD5w2fAXcubiG5YOEgVGVNk/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782330819; c=relaxed/simple;
	bh=cxbUUaDcYce+Sy/JjrFoeYU+Tta5D7rxoHkkJ3rlVXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mHEFbuxNbn44zBCLZQv+P25aq3uuLCzL+02DrxKBTbeyVRcjypY825zwjnKnFPkbCdJlsXkGfInwMMgXGpS49hlsWvV3/eKxM3wWMoeh+bMh4IprWMLInxQcBWrIUHLB258NgTI2pYcW0vm6NrPCgFWYuU0O4aDrFZ7xAeIO19Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GRe4TZ8N; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5144B227;
	Wed, 24 Jun 2026 21:52:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782330776;
	bh=cxbUUaDcYce+Sy/JjrFoeYU+Tta5D7rxoHkkJ3rlVXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GRe4TZ8NlgAWIR5zdg/kF+3tOzHLFtfhjiMqjdKSStbc0ngG7gYGIb8tri2xSZ/Rc
	 XA/+tg1EjWG9GPr5pCMyVEca6BPTN6plwWkCiFitX9oCwpVys6FdQP0doLya613kV5
	 cdHGGA38zMMkEO0drfEk5h2PkaJDBGmtEEs4p8uU=
Date: Wed, 24 Jun 2026 22:53:34 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com, jacopo.mondi@ideasonboard.com,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sven =?utf-8?Q?P=C3=BCschel?= <s.pueschel@pengutronix.de>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: rzg2l-cru: Align bytesperline to hardware DMA
 stride requirement
Message-ID: <20260624195334.GI851255@killaraus.ideasonboard.com>
References: <20260624104153.798953-1-tommaso.merciai.xr@bp.renesas.com>
 <20260624104153.798953-3-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260624104153.798953-3-tommaso.merciai.xr@bp.renesas.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65584-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:tommaso.merciai.xr@bp.renesas.com,m:tomm.merciai@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:jacopo.mondi@ideasonboard.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:nicolas.dufresne@collabora.com,m:sakari.ailus@linux.intel.com,m:s.pueschel@pengutronix.de,m:mehdi.djait@linux.intel.com,m:paul@crapouillou.net,m:isaac.scott@ideasonboard.com,m:dan.scally+renesas@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tommmerciai@gmail.com,m:hverkuil@kernel.org,m:dan.scally@ideasonboard.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,bp.renesas.com,ideasonboard.com,kernel.org,collabora.com,linux.intel.com,pengutronix.de,crapouillou.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DD5226C11BD

On Wed, Jun 24, 2026 at 12:41:31PM +0200, Tommaso Merciai wrote:
> The RZ/G3E CRU programs the line stride via the AMnIS register, whose
> IS field encodes the value in units of 128 bytes. If bytesperline is
> not a multiple of 128, the division truncates and the hardware uses a
> wrong stride, causing horizontal banding.
> 
> commit ace92ccef0c9 ("media: platform: rzg2l-cru: Use v4l2_fill_pixfmt()")

s/commit/Commit/

> replaced the open-coded aligned calculation with v4l2_fill_pixfmt(),
> which sets no alignment, reintroducing the issue.

I wonder how I missed that. Sorry.

> Switch to v4l2_fill_pixfmt_aligned() with RZG2L_CRU_STRIDE_ALIGN when
> info->has_stride is set. RZ/G2L has no AMnIS register and keeps using
> v4l2_fill_pixfmt() unchanged.
> 
> Fixes: ace92ccef0c9 ("media: platform: rzg2l-cru: Use v4l2_fill_pixfmt()")
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 69346a585f9f..478264f26466 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -860,7 +860,8 @@ static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
>  	v4l_bound_align_image(&pix->width, 320, info->max_width, 1,
>  			      &pix->height, 240, info->max_height, 0, 0);
>  
> -	v4l2_fill_pixfmt(pix, pix->pixelformat, pix->width, pix->height);
> +	v4l2_fill_pixfmt_aligned(pix, pix->pixelformat, pix->width, pix->height,
> +				 info->has_stride ? RZG2L_CRU_STRIDE_ALIGN : 1);

The documentation states that, for RGB888, the stride has to be a
multiple of 384 (3*128). Shouldn't you take that into account here ?

Also, for semi-planar YUV 4:2:0, the hardware seems to use a stride
equal to AMnIS*2, which leaves blank lines after every U/V line. That's
something userspace doesn't expect.

>  
>  	dev_dbg(cru->dev, "Format %ux%u bpl: %u size: %u\n",
>  		pix->width, pix->height, pix->bytesperline, pix->sizeimage);

-- 
Regards,

Laurent Pinchart

