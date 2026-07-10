Return-Path: <linux-media+bounces-67290-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aWL5NT/jUGp77wIAu9opvQ
	(envelope-from <linux-media+bounces-67290-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 14:19:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D9673AB0E
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 14:19:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=hKCn4Ixr;
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67290-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67290-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D0171303A714
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 12:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08C4A4218AA;
	Fri, 10 Jul 2026 12:15:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331DB413240;
	Fri, 10 Jul 2026 12:15:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783685739; cv=none; b=sEI8o4xpPFHsYQ/F4u3lxHNlCoBgrS3f8VjDv1gS3e0yvQFHbKcvsEK6LHVduARlJysUJxkVrY/7xMZScKn0GkWa1CLZQYqhyeiVCQ37E+SWdUbXsiRv7WsyhVzLha67l3w1a6VjgM/W7h3YEGv5pqsthwp1lSsdymtxMqFHjJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783685739; c=relaxed/simple;
	bh=Z/Rs/qraqvHesKDAc0IRdGMSTgEPPxdrv8Fjzo5dznE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j1ehtXg76WZX0oieAWJFD35MoNSOu7ZJ0pW2bptb1JUdIPesVdzziEkujImA/k7Pf+y6Pnyic6/zTZw9qVBexkzyV4lVV23Ke5lWAJ8TuUC04GXF5m/Xi2fAlewi/zN2JGAfYz1vPdmU1s4PVBGVNgTEhTmcM52i+cFZwepMu0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hKCn4Ixr; arc=none smtp.client-ip=213.167.242.64
Received: from ideasonboard.com (mob-109-113-15-151.net.vodafone.it [109.113.15.151])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2F1E0324;
	Fri, 10 Jul 2026 14:14:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783685682;
	bh=Z/Rs/qraqvHesKDAc0IRdGMSTgEPPxdrv8Fjzo5dznE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hKCn4Ixrx3R9hs7Ta2vjZKUiFSFVQVc06RYrNlMKa459/T7YApoUjRvrtgGuOnL9V
	 B6NlhQFmtutKVPev9FlV3EDYQfnFOe19MlJhN+4MCxcX5Ldv3qO+29QVlkwuJ3RlK4
	 fOAVHHHEOFfNafJyEn8GH8EeRU+PWgdwPHoenO1U=
Date: Fri, 10 Jul 2026 14:15:30 +0200
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
Subject: Re: [PATCH v3 2/4] media: v4l2-common: Add
 v4l2_fill_pixfmt_aligned() helper
Message-ID: <alDgNTv9M2_aVV7U@zed>
References: <20260708161406.396183-1-tommaso.merciai.xr@bp.renesas.com>
 <20260708161406.396183-3-tommaso.merciai.xr@bp.renesas.com>
 <ak9pPzjABetdgUiq@zed>
 <210aa2ee-8931-4dd2-a51f-eeb0c205d647@pengutronix.de>
 <alC6DDFZ23q5h33W@zed>
 <00b18307-f982-44bc-bbab-4a640753d8fc@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <00b18307-f982-44bc-bbab-4a640753d8fc@pengutronix.de>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67290-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[zed:mid,ideasonboard.com:from_mime,ideasonboard.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 42D9673AB0E

Hi Sven

On Fri, Jul 10, 2026 at 01:54:06PM +0200, Sven Püschel wrote:
> Hi Jacopo,
>
> On 7/10/26 11:38 AM, Jacopo Mondi wrote:
> > > This is due to the fact, that while we have a hdiv of 2 we also interleave
> > > the cb and cr parts in a single plane, which results in the stride being the
> > > same number of bytes as for the y plane (and vdiv isn't relevant for the
> > > stride).
> > >
> > > Therefore the stride scaling also respects the bits per plane (bpp) value to
> > > determine the scaling.
> > >
> > > @Tommaso : While the sentence looks ok, the NV12 example is misguided. The
> > I guess the usage of NV12 was as example of a "formats that store
> > multiple component planes in a single memory"
> >
> > NV24/42 works the same, but being 444 it needs the chroma plane stride to
> > be a multiple of the fist plane stride and might prove as a better
> > example ?
> >
> My potential concern is that NV as an example misguides the reader into one
> of the following:
>
> - It's only for formats which interleave cb/cr into one plane (whereas
> YUV420 also gets scaled)
> - NV24 in the example being though of including the NV24M variant (whereas
> latter won't be affected)

>

M variants are not supported by the single-planar APIs
https://docs.kernel.org/userspace-api/media/v4l/pixfmt-yuv-planar.html

Some planar formats allow planes to be placed in independent memory
locations. They are identified by an ‘M’ suffix in their name (such as
in V4L2_PIX_FMT_NV12M). Those formats are intended to be used only in
drivers and applications that support the multi-planar API,

And here we're dealing with single-planar API only if I'm not mistaken


> Maybe smth. like YUV420 but not YUV420M is a better example (could also be
> NV24 but not NV24M)?
>
> Sincerely
>     Sven
>

