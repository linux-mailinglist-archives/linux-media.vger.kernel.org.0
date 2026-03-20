Return-Path: <linux-media+bounces-56563-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKseBZyMvWnY+wIAu9opvQ
	(envelope-from <linux-media+bounces-56563-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 19:06:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A79B52DF282
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 19:06:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C922331A0842
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 18:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32EC33112A1;
	Fri, 20 Mar 2026 18:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="1vo1y7yl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6944030C343
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 18:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774029631; cv=none; b=D2VM00E9qzcp3vDw4FXAqwEusKpZoqtq5wBP+G38LEXA1RY4hin88vOOhWeaiUIllPYNmtfmV3XPq+PuZfE7yS/huBmqVDEJU+nv1byE54y25CXb5ofZ56IqModb/QQ5J6yGiGX+7x+lmG+PDMmEBJHtV7wrmjTWHlmAUympCVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774029631; c=relaxed/simple;
	bh=ZitGcPlEJUiIAHTkGp4M1gZKz2opABrhvIeGHWQTFZ4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rXcTJGQbDANj12LWdxavQTgt29ZUwU0uCpmZemrqTc5CY7HUu6H63HVUtnTtrtY8TTuI37JCiBhqpVxpN5QqwajfVA0WscNUTFs2MxGgviNsZry1WQwV9X0WFbnAeyJYkNhPQwWxJe43jJqR4948WGvVVi5xu8JHY+OteIZJg3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=1vo1y7yl; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-89c4468686dso23978536d6.3
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 11:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1774029629; x=1774634429; darn=vger.kernel.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dOImJrUkUKlV54kYlUoWr0DMizxiC/9V3pmZXpcZjrc=;
        b=1vo1y7ylmaHKozDG/MZlHzh+Qb2eXOWXQtlV15/XUWYrxyEnixg5jOYX+KsF7ygaE3
         H6o0SILtOcSa31zyYW8EHAa1aDLt5F4p6gmEcJrIpOb9t9e/CTmm8ZtLPdIXRCOomSRy
         z2POQWRQrYNVD3XldIUp0SqltVD5hs+Zx2tkviIEqv/GkJbNVR7JkeXAnZl3x7OgQDI/
         PlR23/yqK7uXcyHed8TfC+Ipfiz6uQeCGiTplY5X7cbrPHGtuaDp308i1pVwpXGleCN1
         YJebeBhUDgUR1G/fgydYCdNsUg+1ZKVu9Usni3BC0PiIVf4xdljnf3X2bQN5jwmFXwGl
         WQ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774029629; x=1774634429;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dOImJrUkUKlV54kYlUoWr0DMizxiC/9V3pmZXpcZjrc=;
        b=Q6RvHI4++8pCx05m8WDHJR+i8U5ZcTmbjdfTP99keW2Zk4IT/+20krDzQJoNtew7Aa
         kJG4MU7hpMQYzZwvGdZoeTnLE35I8qbaDbJfYXjPJh+9diyagbm0/vQjpJSIg1ZR9lTe
         F4kb2gNldtnGpu/SlX4k2GnK3F0UW3ejPYfAG271XPoGU0VxaaeVHI23Inuqcdgfx48l
         Gh1242GM9uly/U+epFWNH4CC6LhdZbhpDvOgJ1i7o9mEC+jcjCIE9yAS37JblmszdfyI
         Edq1hsgy4oNolQk/mIAAdwnaU79wOj2tPzf5LlC9d6hdXixcmBUkByQwhXXv9ouFMzFs
         DrAg==
X-Gm-Message-State: AOJu0YyxdNjmWxllclmp3i3ntY7E2ZrV9g+Xfp2wysdJ2hr/pKhPrICa
	ZtVsr4Ai/1J+jev7H6z2xKzwyYlauRQXEK5vCbrlAaTgJAp+UPnONTkuJRPMpB8VnOM=
X-Gm-Gg: ATEYQzwqVzQvPJ6ox/v6ZfuGNQnQI17uNjueXaZj6NqrkPit+rI30WK+ae0IroV+ioJ
	pcJB+O7cT5dXiXhkEuhPwWwgkSrzbc9zbJ84YIzgM8+vxSUgJoygsByU+sElluB/WxiX5//g2VE
	9JtQ9ATFGaZFPC/6eUI7KP53RDZf8vtqBfptEDkL1s1BUtgD46fxL+uGrAadd3neLSSRDCSYZHe
	F4/WSY9yPx8hfcSYZCsXHXpS4NBFdZfO2DR4f+aAmunte/bTtSF6W65cuh+dGvEL3g3p8aLTnia
	k0USRNWln7+mx8x7/rZuXQfaPUGN8cIAKetANw1wNChd9ZS6DlrzQ28nhey9shggNlZy94JebqY
	lO0Ytx3IQ+zo1AwA4PZKxQ8gbmlvVcK41laO37l/3McJkDr+Zx/3zM7R0KiKlyix1PgUQUsJoMu
	6P8ylfDALla6KL4QY8GRZWPAvoHRnU2Ib/EKjx5bQ=
X-Received: by 2002:a05:6214:4901:b0:89c:637a:6c6 with SMTP id 6a1803df08f44-89c859cbd8emr55207966d6.1.1774029629014;
        Fri, 20 Mar 2026 11:00:29 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c850f5fe4sm26026506d6.0.2026.03.20.11.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 11:00:28 -0700 (PDT)
Message-ID: <ec72d63c642542dc7a8689c429b497f72c68d000.camel@ndufresne.ca>
Subject: Re: [PATCH v3 21/27] media: rockchip: rga: remove size from
 rga_frame
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
Date: Fri, 20 Mar 2026 14:00:25 -0400
In-Reply-To: <20260127-spu-rga3-v3-21-77b273067beb@pengutronix.de>
References: <20260127-spu-rga3-v3-0-77b273067beb@pengutronix.de>
	 <20260127-spu-rga3-v3-21-77b273067beb@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-GDTWC7SvKf3bxqpQNbJL"
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56563-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ndufresne-ca.20230601.gappssmtp.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: A79B52DF282
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-GDTWC7SvKf3bxqpQNbJL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 27 janvier 2026 =C3=A0 15:39 +0100, Sven P=C3=BCschel a =C3=A9crit=
=C2=A0:
> The size member is only used for the mmu page table mapping.
> Therefore avoid storing the value and instead only calculate it
> in place. This also avoids the calculation entirely when an external
> iommu is used.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga-buf.c | 6 +++++-
> =C2=A0drivers/media/platform/rockchip/rga/rga.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
 8 ++------
> =C2=A0drivers/media/platform/rockchip/rga/rga.h=C2=A0=C2=A0=C2=A0=C2=A0 |=
 1 -
> =C2=A03 files changed, 7 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/medi=
a/platform/rockchip/rga/rga-buf.c
> index 4e82ca1a5e8d9..c0cc885ba58a8 100644
> --- a/drivers/media/platform/rockchip/rga/rga-buf.c
> +++ b/drivers/media/platform/rockchip/rga/rga-buf.c
> @@ -79,6 +79,8 @@ static int rga_buf_init(struct vb2_buffer *vb)
> =C2=A0	struct rockchip_rga *rga =3D ctx->rga;
> =C2=A0	struct rga_frame *f =3D rga_get_frame(ctx, vb->vb2_queue->type);
> =C2=A0	size_t n_desc =3D 0;
> +	u32 size =3D 0;
> +	u8 i;
> =C2=A0
> =C2=A0	if (IS_ERR(f))
> =C2=A0		return PTR_ERR(f);
> @@ -86,7 +88,9 @@ static int rga_buf_init(struct vb2_buffer *vb)
> =C2=A0	if (!rga_has_internal_iommu(rga))
> =C2=A0		return 0;
> =C2=A0
> -	n_desc =3D DIV_ROUND_UP(f->size, PAGE_SIZE);
> +	for (i =3D 0; i < f->pix.num_planes; i++)
> +		size +=3D f->pix.plane_fmt[i].sizeimage;
> +	n_desc =3D DIV_ROUND_UP(size, PAGE_SIZE);
> =C2=A0
> =C2=A0	rbuf->n_desc =3D n_desc;
> =C2=A0	rbuf->dma_desc =3D dma_alloc_coherent(rga->dev,
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index b2ee59235d1e3..59463c7f26b6f 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -221,7 +221,6 @@ static int rga_open(struct file *file)
> =C2=A0	};
> =C2=A0
> =C2=A0	def_frame.stride =3D (def_width * def_frame.fmt->depth) >> 3;
> -	def_frame.size =3D def_frame.stride * def_height;
> =C2=A0
> =C2=A0	ctx =3D kzalloc(sizeof(*ctx), GFP_KERNEL);
> =C2=A0	if (!ctx)
> @@ -459,9 +458,6 @@ static int vidioc_s_fmt(struct file *file, void *priv=
, struct v4l2_format *f)
> =C2=A0	frm =3D rga_get_frame(ctx, f->type);
> =C2=A0	if (IS_ERR(frm))
> =C2=A0		return PTR_ERR(frm);
> -	frm->size =3D 0;
> -	for (i =3D 0; i < pix_fmt->num_planes; i++)
> -		frm->size +=3D pix_fmt->plane_fmt[i].sizeimage;
> =C2=A0	frm->fmt =3D rga_fmt_find(rga, pix_fmt->pixelformat);
> =C2=A0	frm->stride =3D pix_fmt->plane_fmt[0].bytesperline;
> =C2=A0
> @@ -485,10 +481,10 @@ static int vidioc_s_fmt(struct file *file, void *pr=
iv, struct v4l2_format *f)
> =C2=A0	frm->pix =3D *pix_fmt;
> =C2=A0
> =C2=A0	v4l2_dbg(debug, 1, &rga->v4l2_dev,
> -		 "[%s] fmt - %p4cc %dx%d (stride %d, sizeimage %d)\n",
> +		 "[%s] fmt - %p4cc %dx%d (stride %d)\n",
> =C2=A0		=C2=A0 V4L2_TYPE_IS_OUTPUT(f->type) ? "OUTPUT" : "CAPTURE",
> =C2=A0		=C2=A0 &frm->fmt->fourcc, pix_fmt->width, pix_fmt->height,
> -		=C2=A0 frm->stride, frm->size);
> +		=C2=A0 frm->stride);
> =C2=A0
> =C2=A0	for (i =3D 0; i < pix_fmt->num_planes; i++) {
> =C2=A0		v4l2_dbg(debug, 1, &rga->v4l2_dev,
> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/pl=
atform/rockchip/rga/rga.h
> index 95fa7fd1c509a..2838fc7785f72 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -34,7 +34,6 @@ struct rga_frame {
> =C2=A0
> =C2=A0	/* Variables that can calculated once and reused */
> =C2=A0	u32 stride;
> -	u32 size;
> =C2=A0};
> =C2=A0
> =C2=A0struct rga_dma_desc {

--=-GDTWC7SvKf3bxqpQNbJL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCab2LOQAKCRDZQZRRKWBy
9F3LAPwI3WnRibEc84bDS/7rFozW7TiB3JyYqH0VfP/vvwfGhQD/WMZ6ofBluvak
WKPGIwexm/UWVC6O9rorql75w7VrVgk=
=y8bZ
-----END PGP SIGNATURE-----

--=-GDTWC7SvKf3bxqpQNbJL--

