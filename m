Return-Path: <linux-media+bounces-61584-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6D4iEUiNBWo5YQIAu9opvQ
	(envelope-from <linux-media+bounces-61584-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 10:52:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C7453F7ED
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 10:52:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9FE6E30477EE
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 08:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D99C3DDDCA;
	Thu, 14 May 2026 08:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TvxV7P1u"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9966C175A83;
	Thu, 14 May 2026 08:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778748701; cv=none; b=jPkm19D7DJrIJAErTNg+tawwAsdcDPRYtfNN278rmXQ5bOOYcTKKOy/PnsQ0g0hVjeHCzC9PG9Sw63ug6OFlQ43uCp373zEGbxCiQJSbwS+ZV6HlzifHoSoYBrmoVyNgNl2MsasBloDfalN9fCkIYHHrbYiqmD9MAKX9l1i5d8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778748701; c=relaxed/simple;
	bh=CFTCz0VdeDze74VAdZEnsjmrEoStxuZcl+cGp1bv8mo=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=F4/RjHwCPqwuVxa6M5+mcavwIjtJlhAMhfifmxdx0VVgvsX8jT9ivvsQgyYD+m+ojaWs4VXoyFxZ+0VjPwS1aKWhQe6cDXXjoX9UlLUB5fVsViWhvvHVXFYZs4iu1VmPZwvK4bvmWZVgbgsparehXRGkOQUgUEZibCEomNAXnEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TvxV7P1u; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 57AC4454;
	Thu, 14 May 2026 10:51:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778748690;
	bh=CFTCz0VdeDze74VAdZEnsjmrEoStxuZcl+cGp1bv8mo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=TvxV7P1uZztdKgwkwdGP3e1gpxOhS5YLa1E8QlMuJo4xDsZitX2b8tpl/J3hpe0uI
	 Ocm7RvmtwnG0CJzhuiHdEBccSoxjdlnlpSK8lKARhAT2jIani/W2QFCBbV3idAAizp
	 hpz6SxkqBBpkt9CT//gQwhh1Mij10v4VmAApmd6g=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <agWKjDSvuDTEmV8n@zed>
References: <20260501-ov5640_cleanup-v1-0-0869a7802a33@ideasonboard.com> <20260501-ov5640_cleanup-v1-11-0869a7802a33@ideasonboard.com> <agWKjDSvuDTEmV8n@zed>
Subject: Re: [PATCH 11/11] media: i2c: ov5640: Split out format mux registers
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Steve Longerbeam <slongerbeam@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 14 May 2026 09:51:36 +0100
Message-ID: <177874869662.2082999.14035943195719886774@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1
X-Rspamd-Queue-Id: A0C7453F7ED
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61584-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,gmail.com,kernel.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kieran.bingham@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,ideasonboard.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ping.linuxembedded.co.uk:mid]
X-Rspamd-Action: no action

Quoting Jacopo Mondi (2026-05-14 09:41:02)
>=20
> On Fri, May 01, 2026 at 04:39:13PM +0100, Kieran Bingham wrote:
> > The init_setting table configures format control and mux to default for
> > YUV420 output.  These are later determined by the users format
> > selection, and so are candidates for removal from the init table.
>=20
> Can we remove them then :) ?

Maybe indeed! I'll double check this when I next spin the series.
--
Kieran


>=20
> >
> > Split the additions out from the register block and document them.
> >
> > Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> > ---
> >  drivers/media/i2c/ov5640.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> > index f63d81640f54..477f6a3ddbf6 100644
> > --- a/drivers/media/i2c/ov5640.c
> > +++ b/drivers/media/i2c/ov5640.c
> > @@ -615,8 +615,13 @@ static const struct reg_value ov5640_init_setting[=
] =3D {
> >       {0x3a0d, 0x04, 0, 0}, {0x3a14, 0x03, 0, 0}, {0x3a15, 0xd8, 0, 0},
> >       {0x4001, 0x02, 0, 0}, {0x4004, 0x02, 0, 0}, {0x3000, 0x00, 0, 0},
> >       {0x3002, 0x1c, 0, 0}, {0x3004, 0xff, 0, 0}, {0x3006, 0xc3, 0, 0},
> > -     {0x302e, 0x08, 0, 0}, {0x4300, 0x3f, 0, 0},
> > -     {0x501f, 0x00, 0, 0}, {0x440e, 0x00, 0, 0}, {0x4837, 0x0a, 0, 0},
> > +     {0x302e, 0x08, 0, 0},
> > +
> > +     /* Format control, Mux control */
> > +     {0x4300, 0x3f, 0, 0}, /* YUV420 YYYY... / UYVY... */
> > +     {0x501f, 0x00, 0, 0}, /* ISP YUV422 */
> > +
> > +     {0x440e, 0x00, 0, 0}, {0x4837, 0x0a, 0, 0},
> >
> >       /* ISP Control */
> >       {OV5640_REG_ISP_CTRL00, OV5640_ISP_00_LENC_ENABLE | OV5640_ISP_00=
_GMA_ENABLE |
> >
> > --
> > 2.52.0
> >
> >

