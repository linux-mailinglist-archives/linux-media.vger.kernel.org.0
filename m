Return-Path: <linux-media+bounces-67264-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lf0hKX7EUGol4wIAu9opvQ
	(envelope-from <linux-media+bounces-67264-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 12:07:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF1473974B
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 12:07:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=UiJ3mvEb;
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67264-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-67264-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3C71830418E6
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 09:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C23E3FBB7E;
	Fri, 10 Jul 2026 09:56:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBAE3FB7F2;
	Fri, 10 Jul 2026 09:56:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783677398; cv=none; b=dMHMD6O5h57oGWDeZV7Vz6y0bQIZ13/N2NiZL95oa+tnAlpHb34wPalQMBCuiMO/aZgpkHltc/k6h4SagzHAW27TX4RdXEFBDCPCIJMYiIX8JcSep76g6YhfNKWUqfGDzfnpz1emSuEPOlc7ChBPCVuB6ermoq5zJpGO1gu9Dxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783677398; c=relaxed/simple;
	bh=cUAYZzxr3znTTToR3UQeu5Ibb8WeFw+KkgCr8E8GNTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jOxXEHHeJ6TqSW3agrQpBfQ45fXgtnyX0df5Ccgg0l9LAzSJv1dc6csZUNm21opEQnH/q3Oe2RtzEjpnnBEYkYI1qHEx5Y1Q5zzFGC9/IpQNGv2Ej3SDk96QBUmfxei/f78bsBueKCD2tiClN+PEz7A0MBqErVEnZUkCv22lJwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UiJ3mvEb; arc=none smtp.client-ip=213.167.242.64
Received: from ideasonboard.com (mob-109-113-15-151.net.vodafone.it [109.113.15.151])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E5E9312F;
	Fri, 10 Jul 2026 11:55:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783677342;
	bh=cUAYZzxr3znTTToR3UQeu5Ibb8WeFw+KkgCr8E8GNTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UiJ3mvEbI5orMKvbU+g4bzqtgUp4mUtjCSPCqwmDCzKKfXpFJbyaJ2bP3c8+cFPkY
	 SggjMI2NX5Te9Dzh2aZSIPpB8ETDtkSnnKIKy6UGCr0lOzjQqnqJLbCXJGDhEf90Rt
	 DH7iKrm1QE91CMep9fzd/UE+PMlfkaZaHcrFvvUQ=
Date: Fri, 10 Jul 2026 11:56:29 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sven =?utf-8?Q?P=C3=BCschel?= <s.pueschel@pengutronix.de>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Isaac Scott <isaac.scott@ideasonboard.com>, 
	Paul Cercueil <paul@crapouillou.net>, Daniel Scally <dan.scally+renesas@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/4] media: v4l2-common: Add kernel-doc for
 v4l2_fill_pixfmt_mp_aligned()
Message-ID: <alC9xRYyzo6nRg58@zed>
References: <20260708161406.396183-1-tommaso.merciai.xr@bp.renesas.com>
 <20260708161406.396183-4-tommaso.merciai.xr@bp.renesas.com>
 <ak9r850ftuu830At@zed>
 <d4ee7cc1-fd04-480b-8543-46ca5c746107@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d4ee7cc1-fd04-480b-8543-46ca5c746107@pengutronix.de>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67264-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:s.pueschel@pengutronix.de,m:jacopo.mondi@ideasonboard.com,m:tommaso.merciai.xr@bp.renesas.com,m:tomm.merciai@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:nicolas.dufresne@collabora.com,m:sakari.ailus@linux.intel.com,m:laurent.pinchart@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:m.szyprowski@samsung.com,m:isaac.scott@ideasonboard.com,m:paul@crapouillou.net,m:dan.scally+renesas@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tommmerciai@gmail.com,m:hverkuil@kernel.org,m:dan.scally@ideasonboard.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[ideasonboard.com,bp.renesas.com,gmail.com,vger.kernel.org,kernel.org,collabora.com,linux.intel.com,samsung.com,crapouillou.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ideasonboard.com:from_mime,ideasonboard.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9CF1473974B

Hi Sven

On Fri, Jul 10, 2026 at 10:57:41AM +0200, Sven Püschel wrote:
> Hi Jacopo,
>
> On 7/9/26 11:51 AM, Jacopo Mondi wrote:
> > Hi Tommaso
> >
> > On Wed, Jul 08, 2026 at 06:14:04PM +0200, Tommaso Merciai wrote:
> > > Replace the bare placeholder comment with a full kernel-doc block
> > > documenting all parameters, the function behaviour for both single
> > > memory plane (mem_planes == 1) and multiple memory plane (mem_planes > 1)
> > > formats, and the return value.
> > >
> > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > ---
> > > v2->v3:
> > >   - Moved to PATCH 3/4
> > >   - Fixed documentation as suggested by Sven Püschel
> > >
> > > v1->v2:
> > >   - New patch
> > >
> > >   include/media/v4l2-common.h | 28 +++++++++++++++++++++++++++-
> > >   1 file changed, 27 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> > > index be4dd9762196..f2b0c336ac81 100644
> > > --- a/include/media/v4l2-common.h
> > > +++ b/include/media/v4l2-common.h
> > > @@ -591,7 +591,33 @@ static inline int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt,
> > >   	return v4l2_fill_pixfmt_aligned(pixfmt, pixelformat, width, height, 1);
> > >   }
> > >
> > > -/* @stride_alignment is a power of 2 value in bytes */
> > > +/**
> > > + * v4l2_fill_pixfmt_mp_aligned - Fill in a &struct v4l2_pix_format_mplane with
> > > + *	stride alignment requirements.
> > > + *
> > > + * @pixfmt: pointer to the &struct v4l2_pix_format_mplane to be filled
> > > + * @pixelformat: the V4L2 pixel format (V4L2_PIX_FMT_*)
> > > + * @width: image width in pixels
> > > + * @height: image height in pixels
> > > + * @stride_alignment: stride alignment in bytes; must be a power of 2
> > > + *
> > > + * Fills all fields of @pixfmt for the given pixel format, dimensions, and
> > > + * stride alignment.
> > > + *
> > > + * For formats stored in a single memory plane (mem_planes == 1), the
> > > + * behaviour matches v4l2_fill_pixfmt_aligned(): plane_fmt[0].bytesperline
> > > + * is set to the primary plane stride. The strides of all components are
> > > + * aligned to the @stride_alignment. To keep the chroma strides consistently
> > > + * derivable from the luma stride, strides may be aligned to a multiple of
> > > + * the @stride_alignment instead. plane_fmt[0].sizeimage covers all
> >
> > I guess this
> >
> > "To keep the chroma strides consistently derivable from the luma
> > stride, strides may be aligned to a multiple of the @stride_alignment
> > instead."
> >
> > comes from teh v4l2_format_plane_stride() implementation.
> >
> > I admit is not 100% clear to me why the chroma strides is multiplied
> > and to which format this applies. But this is not on this patch...
>
> When not using multi-planar formats, we only have the stride value for the Y
> component and the other stride values are derived from it. This is the cause
> of this whole scaling.
>
> E.g. for YUV420 4x2px picture, we have 4 bytes stride in the y plane and 2
> byte in the cb and cr plane. If we align the stride to 4 bytes (in all
> planes), we want both values to be a multiple of 4. As the cb/cr stride is
> derived from the y stride, we have to set the y stride to 8 bytes to get the
> desired 4 bytes stride in the cb/cr planes.
>
> The rare case for scaling the component stride is NV24/42 (at least this is
> the only one I currently know of), where we actually have 4:4:4 sub-sampling
> and have the cb/cr parts interleaved. So for a 1x2px picture we have 1 bytes
> in the y plane and 2 bytes in the c plane. To align to 4 bytes we need to
> set the c plane stride to 8 to be able to set the y plane stride to 4.

I see, I was probably confusing strides and strides -alignments-.

Thanks for the explanation.


>
>
> For multi-planar formats we have a separate stride for each component, so we
> just align all component strides to the given alignment.
>
>
> Sincerely
>     Sven
>
>

