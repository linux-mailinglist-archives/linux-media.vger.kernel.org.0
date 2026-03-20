Return-Path: <linux-media+bounces-56560-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LnCAiuKvWnQ+gIAu9opvQ
	(envelope-from <linux-media+bounces-56560-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 18:55:55 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7182DEFDA
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 18:55:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2CF4307A6F6
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 17:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ECCC3054C7;
	Fri, 20 Mar 2026 17:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="CBIO2dFS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A833D0900
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 17:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774029167; cv=none; b=OCt7GcfmZgPtRgxcAtRySg7B1f7ivhDSWiy2PZoa6VCkXO8rCzVOXt9HVzOvl5BERe/tZASL3cbFCEF6y+AjQ0LqptnNa2ajexIcjw4+HnSMlFHxWfw7x70sp3GnY6L570YeoWM1Vy3YgkLdu7Pyhwu/qot9VS3CxOJBjTm7uoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774029167; c=relaxed/simple;
	bh=2XKMNPMRgggOa6Jtg12vV0GqA7xjLsqYG7uM16X4Fe0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OKUJkUVK5tYuTPclLXvAAYFkrQSzXYwt/cfus1crGjn/FYfMkbMqc4IkW+zZp8GDbmYGps451JDJTV8/mdIreQTZZyaNdMVxR5zl1WgFM6U4mwIzBM+8ex4fR8HY1xf8XELHGUGxwozScHirSID2vRcizIXUBTbh24QdDNzcSt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=CBIO2dFS; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-50b392f1846so12283821cf.3
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 10:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1774029163; x=1774633963; darn=vger.kernel.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qSyQfSfJLUM1m6GIB6OZuhr10E00mTg3LMvm+W8lDOs=;
        b=CBIO2dFS3P6eZfHrkGvRpoHbQZZw9UEtl/RE3CbEZyfbwahdagSneZ72QiQcs2GNFv
         GpHtXwpPddMEDk9Snr5jBf59nLcQxhXkm95tWg0qmZ3AGg7USd39wtniXC6KP6h8NCb9
         e/07AnPIROHRKkiuPZYQ9M18+P1LY5XcDJ49KcXzyrp9xPgKavZ8YBrfJKpq7ykB4nVK
         K4BXPTW8Fa5cvun//Nb4kNEILamoNU1aevw4Zz+sDXQTBozZxUYZCZuPFXWN26unbQz+
         xDJu9240FDyozhA/Gwf9anQHcUXQpAPmlmmX/xXMHGhJazJMDZsAsfb5tdddaRoCJ0FA
         ljnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774029163; x=1774633963;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qSyQfSfJLUM1m6GIB6OZuhr10E00mTg3LMvm+W8lDOs=;
        b=NQbxvM/lfY3WbhmlUgEoFWvOFnQfFkihL9Yd/sArqsdrjBrvAg5v9gUgMrc9DvV3bL
         /PXow5QPrKAE89rdYeq2/wpRuY+MP1BwHxYOmtgRJLKm6oLa5gskBnWAaXAKD88xJpcS
         l3UMgTPHb6c3axEBBbpDL66/chc0Os7OCEv8cMj1Yuv0ZjKX8P8h7ufbBP1IhUOQAZk/
         tgCOQzc6xVB6BVnw4VKSqphutXKk91nSgFdGBMInrMK3dpZLIBLoeKwnu0qj9J+ftc0G
         q2CpOhCDmQvSYc45PTjM9+haW93S/RCqQBv36EsOKtmc3nX3DzHUlUWCD0Cia+Pzj2Q/
         w1lA==
X-Gm-Message-State: AOJu0YzqnBTqQWPqoDGgEU2OcbX66w0xmvghmUd5jrplRre54Q0ytfJz
	oGu8+MMzcpHxICuxK7whQaE85PI7FhgVuv+d+Gau9WrF9CNbuH+uJf/iNzxrEYkrMQY=
X-Gm-Gg: ATEYQzxYTUfwD8YH4sqX6y1VLydEXcl9SGDuAc/cbAvTeIbAilOdKWEj8WsVZjt0/S1
	c9Fb03mtXBlNReb7f+77qz2jxT6prWy77LjzYZ1oOPu6Gw7b/0opaWkK61/g6U+wFhpXIZJQwUr
	SVbRcUAF/250Rtl3fDynmhdsNY/VHDMOtgpgxRLqiPyor/Gz9OdhgfTAxDF6LA5/0eX/G44TMcN
	ZHPp0hIO+oEGR3CCxEFGbHUNKqDCKFFRG8SERUAk/YbnZRJQjOhdW4Qp6bCfcXDsPPnDLwxnQEZ
	jiLAPca+fN+G2ubMGaqQR/QQauQFIj8aFTgI8DlcrUpoZD3cmZMkjssNPSYFfXCOJcnJYeSIWY0
	HqESrh63jdEgPUPByiWW3RVK57iqufoleKSy9PMsElkiWM2O8RdlhzKk9gMhn85akHFCteGmWmv
	qGqI0RT0VvGR6SbNfOVDkr0cnY0Dmc
X-Received: by 2002:a05:622a:354:b0:506:9bea:3229 with SMTP id d75a77b69052e-50b375d6367mr54273481cf.69.1774029163156;
        Fri, 20 Mar 2026 10:52:43 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36d07d87sm24300111cf.12.2026.03.20.10.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 10:52:42 -0700 (PDT)
Message-ID: <b258faaf3bd1d105392dad009b7a90a135a04ad6.camel@ndufresne.ca>
Subject: Re: [PATCH v3 14/27] media: rockchip: rga: align stride to 4 bytes
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, Jacob Chen
	 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@pengutronix.de
Date: Fri, 20 Mar 2026 13:52:40 -0400
In-Reply-To: <20260127-spu-rga3-v3-14-77b273067beb@pengutronix.de>
References: <20260127-spu-rga3-v3-0-77b273067beb@pengutronix.de>
	 <20260127-spu-rga3-v3-14-77b273067beb@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-93/oSoScL+hduou17nI9"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.16 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56560-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[ndufresne-ca.20230601.gappssmtp.com:+];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,ndufresne-ca.20230601.gappssmtp.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ndufresne.ca:mid,pengutronix.de:email]
X-Rspamd-Queue-Id: 5F7182DEFDA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-93/oSoScL+hduou17nI9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 27 janvier 2026 =C3=A0 15:39 +0100, Sven P=C3=BCschel a =C3=A9crit=
=C2=A0:
> Add an alignment setting to rga_hw to set the desired stride alignment.
> As the RGA2 register for the stride counts in word units, the code
> already divides the bytesperline value by 4 when writing it into the
> register. Therefore fix the alignment to a multiple of 4 to avoid
> potential off by one errors due from the division.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga-hw.c |=C2=A0 1 +
> =C2=A0drivers/media/platform/rockchip/rga/rga.c=C2=A0=C2=A0=C2=A0 | 11 ++=
++++-----
> =C2=A0drivers/media/platform/rockchip/rga/rga.h=C2=A0=C2=A0=C2=A0 |=C2=A0=
 1 +
> =C2=A03 files changed, 8 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c
> b/drivers/media/platform/rockchip/rga/rga-hw.c
> index caf2424962351..16380be598e4a 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> @@ -580,6 +580,7 @@ const struct rga_hw rga2_hw =3D {
> =C2=A0	.max_width =3D MAX_WIDTH,
> =C2=A0	.min_height =3D MIN_HEIGHT,
> =C2=A0	.max_height =3D MAX_HEIGHT,
> +	.stride_alignment =3D 4,
> =C2=A0
> =C2=A0	.start =3D rga_hw_start,
> =C2=A0	.handle_irq =3D rga_handle_irq,
> diff --git a/drivers/media/platform/rockchip/rga/rga.c
> b/drivers/media/platform/rockchip/rga/rga.c
> index ac42e905a88cd..2920efe65082a 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -234,10 +234,10 @@ static int rga_open(struct file *file)
> =C2=A0	ctx->in =3D def_frame;
> =C2=A0	ctx->out =3D def_frame;
> =C2=A0
> -	v4l2_fill_pixfmt_mp(&ctx->in.pix,
> -			=C2=A0=C2=A0=C2=A0 ctx->in.fmt->fourcc, def_width, def_height);
> -	v4l2_fill_pixfmt_mp(&ctx->out.pix,
> -			=C2=A0=C2=A0=C2=A0 ctx->out.fmt->fourcc, def_width, def_height);
> +	v4l2_fill_pixfmt_mp_aligned(&ctx->in.pix, ctx->in.fmt->fourcc,
> +				=C2=A0=C2=A0=C2=A0 def_width, def_height, rga->hw-
> >stride_alignment);
> +	v4l2_fill_pixfmt_mp_aligned(&ctx->out.pix, ctx->out.fmt->fourcc,
> +				=C2=A0=C2=A0=C2=A0 def_width, def_height, rga->hw-
> >stride_alignment);
> =C2=A0
> =C2=A0	if (mutex_lock_interruptible(&rga->mutex)) {
> =C2=A0		ret =3D -ERESTARTSYS;
> @@ -393,7 +393,8 @@ static int vidioc_try_fmt(struct file *file, void *pr=
iv,
> struct v4l2_format *f)
> =C2=A0		fmt =3D &hw->formats[0];
> =C2=A0
> =C2=A0	v4l2_apply_frmsize_constraints(&pix_fmt->width, &pix_fmt->height,
> &frmsize);
> -	v4l2_fill_pixfmt_mp(pix_fmt, fmt->fourcc, pix_fmt->width, pix_fmt-
> >height);
> +	v4l2_fill_pixfmt_mp_aligned(pix_fmt, pix_fmt->pixelformat,
> +				=C2=A0=C2=A0=C2=A0 pix_fmt->width, pix_fmt->height, hw-
> >stride_alignment);
> =C2=A0	pix_fmt->field =3D V4L2_FIELD_NONE;
> =C2=A0
> =C2=A0	return 0;
> diff --git a/drivers/media/platform/rockchip/rga/rga.h
> b/drivers/media/platform/rockchip/rga/rga.h
> index 04aeb7b429523..38518146910a6 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -150,6 +150,7 @@ struct rga_hw {
> =C2=A0	size_t cmdbuf_size;
> =C2=A0	u32 min_width, min_height;
> =C2=A0	u32 max_width, max_height;
> +	u8 stride_alignment;
> =C2=A0
> =C2=A0	void (*start)(struct rockchip_rga *rga,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct rga_vb_buffer *src, struct =
rga_vb_buffer *dst);

--=-93/oSoScL+hduou17nI9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCab2JaQAKCRDZQZRRKWBy
9H8xAP4ji1uPU6SE7iMSdNHZu8eGZY3VyZKoBhLFSX+IwNq3VAEAvKVWq1bPjoO7
EuZSodlv8pmIQjBM1Zwsfw6U8R7Exg4=
=SFI0
-----END PGP SIGNATURE-----

--=-93/oSoScL+hduou17nI9--

