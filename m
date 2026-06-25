Return-Path: <linux-media+bounces-65624-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rWEoOmXsPGreuQgAu9opvQ
	(envelope-from <linux-media+bounces-65624-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 10:52:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 872706C3FA9
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 10:52:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=uXFPAEyg;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65624-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65624-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 12475302DF63
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 08:52:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80AA11F4C96;
	Thu, 25 Jun 2026 08:52:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E863038550E;
	Thu, 25 Jun 2026 08:52:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782377525; cv=none; b=tmw5xWh/K+gOhjwUifPqhrOHYujcPL8AscdvzfMSWetzorB4Ju1QAgVtZuQZSPGC/Yai+hT1RadzQrt82N2iwLCeZHyz/8XFKuqg1ZjUb9N7qjbrfNNu384HG4K6HiEx/VWK2l6ENyhkDwqDdhHI+IqqhPXLxruN1vkCOYCattQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782377525; c=relaxed/simple;
	bh=A+HoPmcn/s5mApgSVAt0cwt1dN5Car6vPmvn2IX+Qok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k9dhTUvIOqnKopeo+9BIuXQ+ENmGvTlmXrLZeacfxdUYEHG6cWSd+2808dSnvc42PdXZUmSO0anTAGxMkYOfya9CD/8mykaP7P9i6NjXVu82/4AfbgDDW7J4DRAj/VIZxQHt7CBmJWukFsAQl/lz1JcT6QGnyouvlHb/n687ZJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uXFPAEyg; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A106312F;
	Thu, 25 Jun 2026 10:51:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782377480;
	bh=A+HoPmcn/s5mApgSVAt0cwt1dN5Car6vPmvn2IX+Qok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uXFPAEygz20nRi7Hm4/Dy1fC2ZwFm8iP1/vEuMm+SeaQIjHwH/bQWGbYeei9oCO5c
	 BMJl8ggtrsjhXIHMOJ1Ht3tfXtNQT7MJlZ2Uu7SjLITJLvvf9RBNDPlFczD4Y8gHh9
	 3kd1y5IRzoEuO8PDTfpeDsuUGGWsdnYi/jg+GSPg=
Date: Thu, 25 Jun 2026 11:51:59 +0300
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
Subject: Re: [PATCH 1/2] media: v4l2-common: add v4l2_fill_pixfmt_aligned()
 helper
Message-ID: <20260625085159.GP851255@killaraus.ideasonboard.com>
References: <20260624104153.798953-1-tommaso.merciai.xr@bp.renesas.com>
 <20260624104153.798953-2-tommaso.merciai.xr@bp.renesas.com>
 <20260624192855.GH851255@killaraus.ideasonboard.com>
 <ajzjAVM8F8ZPMWcy@tom-desktop>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ajzjAVM8F8ZPMWcy@tom-desktop>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65624-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,ideasonboard.com:dkim,ideasonboard.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 872706C3FA9

On Thu, Jun 25, 2026 at 10:12:49AM +0200, Tommaso Merciai wrote:
> Hi Laurent,
> Thanks for your review.
> 
> On Wed, Jun 24, 2026 at 10:28:55PM +0300, Laurent Pinchart wrote:
> > Hi Tommaso,
> > 
> > Thank you for the patch.
> > 
> > On Wed, Jun 24, 2026 at 12:41:30PM +0200, Tommaso Merciai wrote:
> > > Add v4l2_fill_pixfmt_aligned(), a variant of v4l2_fill_pixfmt()
> > > that accepts a stride_alignment parameter, mirroring the existing
> > > v4l2_fill_pixfmt_mp() / v4l2_fill_pixfmt_mp_aligned() pair.
> > > 
> > > v4l2_fill_pixfmt() is refactored to call v4l2_fill_pixfmt_aligned()
> > > with stride_alignment=1, preserving its existing behaviour.
> > > 
> > > The new helper is needed by drivers whose DMA engine requires the
> > > line stride to be a multiple of a specific value, such as the
> > > Renesas RZ/G3E CRU which requires 128-byte alignment.
> > > 
> > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > ---
> > >  drivers/media/v4l2-core/v4l2-common.c | 17 +++++++++++++----
> > >  include/media/v4l2-common.h           |  3 +++
> > >  2 files changed, 16 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> > > index 65db7340ad38..1de246acc7ab 100644
> > > --- a/drivers/media/v4l2-core/v4l2-common.c
> > > +++ b/drivers/media/v4l2-core/v4l2-common.c
> > > @@ -545,8 +545,8 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
> > >  }
> > >  EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt_mp);
> > >  
> > > -int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
> > > -		     u32 width, u32 height)
> > > +int v4l2_fill_pixfmt_aligned(struct v4l2_pix_format *pixfmt, u32 pixelformat,
> > > +			     u32 width, u32 height, u8 stride_alignment)
> > >  {
> > >  	const struct v4l2_format_info *info;
> > >  	int i;
> > > @@ -562,14 +562,23 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
> > >  	pixfmt->width = width;
> > >  	pixfmt->height = height;
> > >  	pixfmt->pixelformat = pixelformat;
> > > -	pixfmt->bytesperline = v4l2_format_plane_stride(info, 0, width, 1);
> > > +	pixfmt->bytesperline = v4l2_format_plane_stride(info, 0, width,
> > > +							stride_alignment);
> > >  	pixfmt->sizeimage = 0;
> > >  
> > >  	for (i = 0; i < info->comp_planes; i++)
> > >  		pixfmt->sizeimage +=
> > > -			v4l2_format_plane_size(info, i, width, height, 1);
> > > +			v4l2_format_plane_size(info, i, width, height,
> > > +					       stride_alignment);
> > >  	return 0;
> > >  }
> > > +EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt_aligned);
> > > +
> > > +int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
> > > +		     u32 width, u32 height)
> > > +{
> > > +	return v4l2_fill_pixfmt_aligned(pixfmt, pixelformat, width, height, 1);
> > > +}
> > 
> > This could be an inline wrapper in include/media/v4l2-common.h, it would
> > be more efficient.
> 
> Ok, thanks.
> I guess we want the same for v4l2_fill_pixfmt_mp() ?

That would be nice, as a separate patch, if you have time.

> > >  EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt);
> > >  
> > >  #ifdef CONFIG_MEDIA_CONTROLLER
> > > diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> > > index edd416178c33..718a0f47f36b 100644
> > > --- a/include/media/v4l2-common.h
> > > +++ b/include/media/v4l2-common.h
> > > @@ -556,6 +556,9 @@ void v4l2_apply_frmsize_constraints(u32 *width, u32 *height,
> > >  				    const struct v4l2_frmsize_stepwise *frmsize);
> > >  int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
> > >  		     u32 width, u32 height);
> > > +/* @stride_alignment is a power of 2 value in bytes */
> > > +int v4l2_fill_pixfmt_aligned(struct v4l2_pix_format *pixfmt, u32 pixelformat,
> > > +			     u32 width, u32 height, u8 stride_alignment);
> > 
> > I know the existing functions lack documentation, but it's not a reason
> > to continue with that bad habit :-)
> 
> Ouch :)
> 
> > One point that needs to be clearly documented is how the stride
> > alignment is handled for different planes.
> 
> Thanks, I will add documentation in v2.
> 
> > >  int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
> > >  			u32 width, u32 height);
> > >  /* @stride_alignment is a power of 2 value in bytes */

-- 
Regards,

Laurent Pinchart

