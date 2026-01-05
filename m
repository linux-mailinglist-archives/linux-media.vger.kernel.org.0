Return-Path: <linux-media+bounces-49943-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 516C3CF5479
	for <lists+linux-media@lfdr.de>; Mon, 05 Jan 2026 19:58:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ABBB030ACE04
	for <lists+linux-media@lfdr.de>; Mon,  5 Jan 2026 18:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C91A4341056;
	Mon,  5 Jan 2026 18:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="LjYeIb9Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFE0309EF0
	for <linux-media@vger.kernel.org>; Mon,  5 Jan 2026 18:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767639511; cv=none; b=TUE9IRcKcVo3zMdE+z4M0QXRajMCJjO0SZDqTPdrA4G6uZhQGUraBaRMTT6MrPS3j+xl0+DKbEOW+X05vXJh93Nw9g5wl0xRARXvW9OKpY74QRehzDfGb5yMNEig2MKOX6Xi/bn9CApnEHiuHp503BGP3mOcsDDBFGbYsHAKKAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767639511; c=relaxed/simple;
	bh=SwpKAmSXi/uJN8fTk9rOAx7RoyPtJuxnZ9taWHO9zCM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lRXNTedj8ZLnLJWo9OrU9A5X1B4FvxP6Jdh2CklfV3VtAdikPbfSiN0Trm2pPk5839m3lpdBpxC8jYPDP2kj9rukEMJ6GkpLMS7efJS4pnqwYjBLIDzHBzyYbfLc1iwM3bmuSxGykRnL+JsXz4ZEId8gcXxudKXzf/P71OxdT1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=LjYeIb9Y; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8c305b7c472so15947085a.0
        for <linux-media@vger.kernel.org>; Mon, 05 Jan 2026 10:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1767639507; x=1768244307; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2eLR4Jn8IvEw6HYwJSDlFWNO0gy18XuH20AL9xoEkXY=;
        b=LjYeIb9YppJncZRwpGHEPJ2xo0kqC80nzUcnwkX2+4asqdd8vsYkD1A1I/qywalTNp
         5QOQk/OVuE/fZgnkXh3Pcw0zuLLp2N9MuH1OuKQSLeAv9QQx/xWAbHq7lTI5kxJGBnlT
         VyP71tL21vr8RVQiHAEb6BZva3y7YgdIQtsRRd8/D1AF6C1Yfqnqraj0dliRM/aHTYa4
         4K3AsXKzCrtqpg2UOpGkI1z8OXiRZUXFRJ9MR6aU9LBQ7UoeMiI1CNUwpHqGXcoYxCYX
         HnJMZJYXYoYBHR+5fKJTsMM/FCICJdlrFW/uc15VfCqIpVD0aqbPffrt07WJbFAacphx
         R7sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767639507; x=1768244307;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2eLR4Jn8IvEw6HYwJSDlFWNO0gy18XuH20AL9xoEkXY=;
        b=uoQs2LRwvveWWHR6fx7Q/snJSypUr/Sm1IPbTAyxMusPazBk6FMqwV0N+B8YbMc0U9
         2ipiTSPYr3iPc+b/zWWX2qEb1ZgqA8c4LBwpJt7gN2+KnGJWg+638lqJODDYyfeRPIMB
         lpsJnrBxde4HZ4/ZziF/jyVCTV1dL5kDEV3HQRnIkGilwGdcahKhmmRuOLpOT7Hq/wcE
         Ag7JFHLkb+nf1TTF6r8wEcGpKb4sKkEdPbQd5lglhAq3/H/K6nZTaPO7+Z6uFehAQWSi
         Kna8yF9IoT1OfeXtLO9QOdfXoYr9zP2KI+ivh4l8CeY4F+wdiYMBJSj+ZJDxe2YofakR
         dL4g==
X-Gm-Message-State: AOJu0YwygO8kj6eotMy6ifzf7qoCw3eOcmBudr2estu9vfZTFR/N/sbm
	3fBrJjT2TEVAePhY0TGXdJpfDv0gP4T6PV5QSLxkTjkBCnaVN9RfA6WciZHOlfknTzw=
X-Gm-Gg: AY/fxX5Xo0IF8OLTyXB0H+BRvtxRwMxare1JaaN2t8gpX63sQvlF2HJQGIvkplK21T2
	nEga/QZ457JwF1XcRilNKfgDkjeE+D1j4izDVzgGRB4RTlsbqEWr9Oe1YbXalFiQswCH7w8UG12
	+NOW5PoSlCi0PFDgBq4UH2mbcVNaRfDljavX6cvHhVjkWWnZWhg/OQqHhniA5LYlVl+d0G/Hy2d
	iKPdGK+2sL/4weZ3k5K3FJI2OCm971jQwcn/BT/ZVgq0d8ETv+KuGGGDV6AWeP2ddk351kOA/1q
	a/0X/9Q/a5BE0TLdyF4DPYz9dv17E+LvJIXgxorozyMu88zWfvp7vHG/xALaZK0zHiOB1e68B+g
	xS/0vqmVw5Z5cQcdQXqwnttO+9uDe12W562ojtXgYISstR6pyR7KuT7SzaPVrQ52ThbRSlgqPzN
	3FQOvxHXxiBZ9ypftkvMUftInc+LI=
X-Google-Smtp-Source: AGHT+IH0CWw1Eo/NEBDrSraH6rycdWhAUUZp1t0qx8zosmDzYYvXqx+OvxlHqe2b1crFt+6kbVLflw==
X-Received: by 2002:a05:622a:2597:b0:4ee:2984:7d95 with SMTP id d75a77b69052e-4ffa76a1fa9mr9050641cf.13.1767639507381;
        Mon, 05 Jan 2026 10:58:27 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890753cbed6sm4745536d6.5.2026.01.05.10.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 10:58:26 -0800 (PST)
Message-ID: <f4e0b1f13ee54d88d1035828af548f5cf3a25c16.camel@ndufresne.ca>
Subject: Re: [PATCH 2/4] media: dw100: Implement dynamic vertex map update
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Stefan Klug <stefan.klug@ideasonboard.com>, Xavier Roumegue	
 <xavier.roumegue@oss.nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sebastian Andrzej Siewior	 <bigeasy@linutronix.de>, Clark Williams
 <clrkwllms@kernel.org>, Steven Rostedt	 <rostedt@goodmis.org>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev
Date: Mon, 05 Jan 2026 13:58:25 -0500
In-Reply-To: <20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-2-65af34d04fd8@ideasonboard.com>
References: 
	<20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-0-65af34d04fd8@ideasonboard.com>
	 <20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-2-65af34d04fd8@ideasonboard.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-iAJ4DSQUYHfRrGI7Vgdf"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-iAJ4DSQUYHfRrGI7Vgdf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 05 janvier 2026 =C3=A0 12:35 +0100, Stefan Klug a =C3=A9crit=C2=A0=
:
> Implement dynamic vertex map updates by handling the
> V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP control during streaming. This
> allows to implement features like dynamic zoom, pan, rotate and dewarp.
>=20
> To stay compatible with the old version, updates of
> V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP are ignored during streaming
> when requests are not used. Print a corresponding warning once.
>=20
> Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
> ---
> =C2=A0drivers/media/platform/nxp/dw100/dw100.c | 27 +++++++++++++++++++++=
------
> =C2=A01 file changed, 21 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/pla=
tform/nxp/dw100/dw100.c
> index 7f14b82c15a071605c124dbb868f8003856c4fc0..8a421059a1c9b55f514a29d3c=
2c5a6ffb76e0a64 100644
> --- a/drivers/media/platform/nxp/dw100/dw100.c
> +++ b/drivers/media/platform/nxp/dw100/dw100.c
> @@ -98,6 +98,8 @@ struct dw100_ctx {
> =C2=A0	unsigned int			map_width;
> =C2=A0	unsigned int			map_height;
> =C2=A0	bool				user_map_is_set;
> +	bool				user_map_needs_update;
> +	bool				warned_dynamic_update;
> =C2=A0
> =C2=A0	/* Source and destination queue data */
> =C2=A0	struct dw100_q_data		q_data[2];
> @@ -293,11 +295,15 @@ static u32 dw100_map_format_coordinates(u16 xq, u16=
 yq)
> =C2=A0	return (u32)((yq << 16) | xq);
> =C2=A0}
> =C2=A0
> -static u32 *dw100_get_user_map(struct dw100_ctx *ctx)
> +static void dw100_update_mapping(struct dw100_ctx *ctx)
> =C2=A0{
> =C2=A0	struct v4l2_ctrl *ctrl =3D ctx->ctrls[DW100_CTRL_DEWARPING_MAP];
> =C2=A0
> -	return ctrl->p_cur.p_u32;
> +	if (!ctx->user_map_needs_update)
> +		return;
> +
> +	memcpy(ctx->map, ctrl->p_cur.p_u32, ctx->map_size);
> +	ctx->user_map_needs_update =3D false;
> =C2=A0}
> =C2=A0
> =C2=A0/*
> @@ -306,8 +312,6 @@ static u32 *dw100_get_user_map(struct dw100_ctx *ctx)
> =C2=A0 */
> =C2=A0static int dw100_create_mapping(struct dw100_ctx *ctx)
> =C2=A0{
> -	u32 *user_map;
> -
> =C2=A0	if (ctx->map)
> =C2=A0		dma_free_coherent(&ctx->dw_dev->pdev->dev, ctx->map_size,
> =C2=A0				=C2=A0 ctx->map, ctx->map_dma);
> @@ -318,8 +322,8 @@ static int dw100_create_mapping(struct dw100_ctx *ctx=
)
> =C2=A0	if (!ctx->map)
> =C2=A0		return -ENOMEM;
> =C2=A0
> -	user_map =3D dw100_get_user_map(ctx);
> -	memcpy(ctx->map, user_map, ctx->map_size);
> +	ctx->user_map_needs_update =3D true;
> +	dw100_update_mapping(ctx);
> =C2=A0
> =C2=A0	dev_dbg(&ctx->dw_dev->pdev->dev,
> =C2=A0		"%ux%u %s mapping created (d:%pad-c:%p) for stream %ux%u->%ux%u\n=
",
> @@ -351,6 +355,7 @@ static int dw100_s_ctrl(struct v4l2_ctrl *ctrl)
> =C2=A0	switch (ctrl->id) {
> =C2=A0	case V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP:
> =C2=A0		ctx->user_map_is_set =3D true;
> +		ctx->user_map_needs_update =3D true;

This will be called before the new mapping is applied by
v4l2_ctrl_request_complete(), and then may be cleared too soon if you queue
depth is high enough.

Instead, you should check in the request for the presence of
V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP to optimize the updates. Yo may s=
till
set this to true if if there is no request, in the case you also wanted to
change the original behaviour of only updating that vertex on streamon, but=
 I
don't see much point though.

> =C2=A0		break;
> =C2=A0	}
> =C2=A0
> @@ -405,6 +410,7 @@ static void dw100_ctrl_dewarping_map_init(const struc=
t v4l2_ctrl *ctrl,
> =C2=A0	}
> =C2=A0
> =C2=A0	ctx->user_map_is_set =3D false;
> +	ctx->user_map_needs_update =3D true;
> =C2=A0}
> =C2=A0
> =C2=A0static const struct v4l2_ctrl_type_ops dw100_ctrl_type_ops =3D {
> @@ -1482,6 +1488,15 @@ static void dw100_device_run(void *priv)
> =C2=A0	v4l2_ctrl_request_setup(src_buf->vb2_buf.req_obj.req,
> =C2=A0				&ctx->hdl);
> =C2=A0
> +	if (src_buf->vb2_buf.req_obj.req) {
> +		dw100_update_mapping(ctx);
> +	} else if (ctx->user_map_needs_update && !ctx->warned_dynamic_update) {
> +		ctx->warned_dynamic_update =3D true;
> +		dev_warn(&ctx->dw_dev->pdev->dev,
> +			"V4L2 requests are required to update the vertex map dynamically"

Do you know about dev_warn_once() ? That being said, the driver is usable
without requests and a static vertex (and must stay this way to not break t=
he
ABI). I don't think you should warn here at all.

Nicolas

> +		);
> +	}
> +
> =C2=A0	v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req,
> =C2=A0				=C2=A0=C2=A0 &ctx->hdl);
> =C2=A0

--=-iAJ4DSQUYHfRrGI7Vgdf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaVwJ0QAKCRDZQZRRKWBy
9AbBAP9pwKF8JeCk+43gtcvJv6l//q9PfmuNJwIAUg+I6XuzDwEAua3UXJ1ygmLE
A9PS5L9hHFHCa+lm+bAHM094+oRplQk=
=lAg9
-----END PGP SIGNATURE-----

--=-iAJ4DSQUYHfRrGI7Vgdf--

