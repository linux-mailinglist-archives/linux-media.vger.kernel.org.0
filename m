Return-Path: <linux-media+bounces-49492-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF20CDCBC3
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 16:41:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29E30303DD3F
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 15:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B242E2E8B6B;
	Wed, 24 Dec 2025 15:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="bZfAdtnT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E932DF136
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 15:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766590778; cv=none; b=YDw6kdUxYy5I7Ky+59liEQF4rT3ClVQ3DnInyQdUyOvkny82jeUoA9HrZc3LNfw05GxmF7LUv1cYNBvbTZm3ceh6UOPjBogLtarpCYt/Pn3EjmoOJOrz+q6aFj6rS7wlPXN1+O8u+rV5Qy4vGDRNWQLkyhBgsrtPgNCx1vBnJlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766590778; c=relaxed/simple;
	bh=GLuTcjZWp0Ij5QX5aDuaL+5EPijsaro/9GuUwlpSQN4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XaAmbny3HgoxBIRUOMGabudatLqWFDkAtFSbxTOPoyfVua3npWrZNz5lvjNZT5aaF3wrajezyeDidGoftCoOWaVFtNYLSz/GvWLniMxSMEg5W7/1/z5xhtHOG/WntA2HVZAfTGxmvFFlcib1ApllWq1fSE9iY3iA7SOIdDMIsek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=bZfAdtnT; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8b5c81bd953so729750885a.1
        for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 07:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1766590775; x=1767195575; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mNUTI3pZWA5T6KtDOWHIYgHw3tgiAFK7a4NWHyZgANA=;
        b=bZfAdtnT0mU3gcG5719WjfQe11tuU2QY5b5roFgheNNRUWkdramE3LWrcWqAyPWuYI
         aWCnazEGbGL51f70Yey2BE5Mi03+PoPyvMhERdb+AYPMwjgw3qRkhnzW9LNJhdagmxX9
         Y/elJORDuXY3gn0VIeSZPC8rfsFJRcxC7htFOD7MRV6ZsaHriWZRUYDevaeXanH9I19y
         CDZAIJ45Ji/3Hca/BUxyRkpQ6U/0jq/y9zy40O7PDFGPNjQ3SW1i2n0gEZOVIurX0yjH
         Qv3Klcv9AVDbEfUbRozi/g4+OugFVKSxXl+5PGEbCdBx5MEN105FuT9seVyqm6JfRqy/
         O8og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766590775; x=1767195575;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mNUTI3pZWA5T6KtDOWHIYgHw3tgiAFK7a4NWHyZgANA=;
        b=h8LIkxttvAL/nz79Uznd7p/tl7FRc4wy1fLYUO6X7QS4XskLqb46Wwi1cX9UKJKsIb
         0GHKCjiQRTjSf7gA+Y9wnCXnh4FvZNyYFTrWukIxtP/3c3tl3WWm8dszMupW8DAa5ix+
         gMZQ9JPwYoot9GymZiCnPmEm1p9LoZPE7bvI/KRNzCJUz9eFV+rj//6VfR64XEF/V9Gh
         BChbNx58n6ZPT+RT8qS0dOwy5MUWRr3uvIaDFAYQuH3dYA2p4Kyble1dN5JI3ba07dNT
         QKxFLIJTNGIa2JVqdogZ4pxBjyzAg2Q9Ap+cI4QdITrt1+QfF/0+n9i4FMVfVHfqNi0C
         X5xQ==
X-Gm-Message-State: AOJu0Yz21oCBGFWDcE3gvwqe+XMcaRHtTEI02csA8YXQturY3BYeevJs
	u2OxH6OThxHOdpjMFINge2ViRwlr7e18yLceBiotn/w9pcL7rK05uJTcy7RuwC4m0hVQSDeb0A6
	S3gFdhHA=
X-Gm-Gg: AY/fxX4P4ZcgqOWZ5RYlTDQKs+1MD/Ps2q67UyZYW07Ec9nKHCoqxbStdPwSQdhI3XD
	r0E38paYL7JwHiuynLPtrjPTT3nCyGhC3ao+98l8oh6nRhjrncFRQqQU7aDpIlic07rqb8Qlf65
	FbY8/ytPesoe8M0esv70fdPDHYLsbZkSY0PeAd3EUdoNrR2qUJVZGrBSsuozGGxPnC3FkDZ74nG
	lRkl0bJ036LJd3zzMklzLjFyub4H+l9IMyYM1ymlnWwfsTp81Sw/gdIKo5WnVjC2CKc2F88jJ7q
	KiPmlCUl3YzEnjmVuuyM3WBAaynt+B6pWuQrc2vIgmdwxfK7k6aYvqEIfFVNbBsbUSAzGJzWW3Z
	/pEV4pc8GdEV3UM//GP+e5jCrdrWLgz8E48cgqsrnkT+EijfZceKuQRaq5PFX6zYWkMaNNjQHB6
	apLjm6HN7UwglWwS4g
X-Google-Smtp-Source: AGHT+IFSQVZMcGV29sXDZH0xqe15IWvPTvLFEpBUAAJe4SAiUdACFbB2oBIQEWvMB6YCLNhKIB22Vw==
X-Received: by 2002:a05:620a:40c2:b0:890:1cd0:efde with SMTP id af79cd13be357-8c08fd32f46mr2872904385a.64.1766590775335;
        Wed, 24 Dec 2025 07:39:35 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0970f5fcdsm1308533385a.29.2025.12.24.07.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 07:39:34 -0800 (PST)
Message-ID: <02ac025c0ecf17354377c7f2c2fc83b40a3a41e1.camel@ndufresne.ca>
Subject: Re: [PATCH v2 11/22] media: rockchip: rga: check scaling factor
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
Date: Wed, 24 Dec 2025 10:39:33 -0500
In-Reply-To: <20251203-spu-rga3-v2-11-989a67947f71@pengutronix.de>
References: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
	 <20251203-spu-rga3-v2-11-989a67947f71@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-3yrJZ//37+CI7GA0IAKw"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-3yrJZ//37+CI7GA0IAKw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 03 d=C3=A9cembre 2025 =C3=A0 16:52 +0100, Sven P=C3=BCschel a =
=C3=A9crit=C2=A0:
> Check the scaling factor to avoid potential problems. This is relevant
> for the upcoming RGA3 support, as it can hang when the scaling factor
> is exceeded.
>=20
> There are two relevant scenarios that have to be considered to protect
> against invalid scaling values:
>=20
> When the output or capture is already streaming, setting the format on
> the other side should consider the max scaling factor and clamp it
> accordingly. This is only done in the streaming case, as it otherwise
> may unintentionally clamp the value when the application sets the first
> format (due to a default format on the other side).
>=20
> When the format is set on both sides first, then the format won't be
> corrected by above means. Therefore the second streamon call has to
> check the scaling factor and fail otherwise.

In codec specifications, we resolve this issue by resetting the capture for=
mat
every-time the output format is set. But without specification for color
transforms, its impossible to say if this is right or wrong, and I don't ex=
pect
perfect interroperability between drivers until someone make the effort to
specify this type of hardware.

What you describe is fine of course, but its a bit off nature of the way fo=
rmat
is normally being fixed by the driver to stay valid.

>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga-hw.c |=C2=A0 1 +
> =C2=A0drivers/media/platform/rockchip/rga/rga-hw.h |=C2=A0 1 +
> =C2=A0drivers/media/platform/rockchip/rga/rga.c=C2=A0=C2=A0=C2=A0 | 60 ++=
+++++++++++++++++++++++---
> =C2=A0drivers/media/platform/rockchip/rga/rga.h=C2=A0=C2=A0=C2=A0 |=C2=A0=
 1 +
> =C2=A04 files changed, 58 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media=
/platform/rockchip/rga/rga-hw.c
> index 8cdfe089fd636..2ed4f22a999d5 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> @@ -624,6 +624,7 @@ const struct rga_hw rga2_hw =3D {
> =C2=A0	.max_width =3D MAX_WIDTH,
> =C2=A0	.min_height =3D MIN_HEIGHT,
> =C2=A0	.max_height =3D MAX_HEIGHT,
> +	.max_scaling_factor =3D MAX_SCALING_FACTOR,
> =C2=A0	.stride_alignment =3D 4,
> =C2=A0
> =C2=A0	.setup_cmdbuf =3D rga_hw_setup_cmdbuf,
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.h b/drivers/media=
/platform/rockchip/rga/rga-hw.h
> index f4752aa823051..fffcab0131225 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.h
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.h
> @@ -14,6 +14,7 @@
> =C2=A0
> =C2=A0#define MIN_WIDTH 34
> =C2=A0#define MIN_HEIGHT 34
> +#define MAX_SCALING_FACTOR 16
> =C2=A0
> =C2=A0#define RGA_TIMEOUT 500
> =C2=A0
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index f02ae02de26ca..46dc94db6f85e 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -346,18 +346,47 @@ static int vidioc_g_fmt(struct file *file, void *pr=
iv, struct v4l2_format *f)
> =C2=A0static int vidioc_try_fmt(struct file *file, void *priv, struct v4l=
2_format *f)
> =C2=A0{
> =C2=A0	struct v4l2_pix_format_mplane *pix_fmt =3D &f->fmt.pix_mp;
> -	struct rockchip_rga *rga =3D video_drvdata(file);
> +	struct rga_ctx *ctx =3D file_to_rga_ctx(file);
> +	struct rockchip_rga *rga =3D ctx->rga;
> =C2=A0	const struct rga_hw *hw =3D rga->hw;
> =C2=A0	struct rga_fmt *fmt;
> +	u32 min_width =3D hw->min_width;
> +	u32 max_width =3D hw->max_width;
> +	u32 min_height =3D hw->min_height;
> +	u32 max_height =3D hw->max_height;
> =C2=A0
> =C2=A0	fmt =3D rga_fmt_find(rga, pix_fmt->pixelformat);
> =C2=A0	if (!fmt)
> =C2=A0		fmt =3D &hw->formats[0];
> =C2=A0
> -	pix_fmt->width =3D clamp(pix_fmt->width,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hw->min_width, hw->max_width);
> -	pix_fmt->height =3D clamp(pix_fmt->height,
> -				hw->min_height, hw->max_height);
> +	if (V4L2_TYPE_IS_OUTPUT(f->type) &&
> +	=C2=A0=C2=A0=C2=A0 v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx)->streaming) {

What if userspace wanted to get the buffer size computed, so it can allocat=
e
externally before it calls streamoff ? Hans did mention recently that try
function should only be state aware if specified.

I'd like other reviewers feedback on what should be done here, of course wr=
iting
a spec would be ideal.

Nicolas

> +		min_width =3D
> +			MAX(min_width, DIV_ROUND_UP(ctx->out.pix.width,
> +						=C2=A0=C2=A0=C2=A0 hw->max_scaling_factor));
> +		max_width =3D MIN(max_width,
> +				ctx->out.pix.width * hw->max_scaling_factor);
> +		min_height =3D
> +			MAX(min_height, DIV_ROUND_UP(ctx->out.pix.height,
> +						=C2=A0=C2=A0=C2=A0=C2=A0 hw->max_scaling_factor));
> +		max_height =3D MIN(max_height,
> +				 ctx->out.pix.height * hw->max_scaling_factor);
> +	} else if (V4L2_TYPE_IS_CAPTURE(f->type) &&
> +		=C2=A0=C2=A0 v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx)->streaming) {
> +		min_width =3D
> +			MAX(min_width, DIV_ROUND_UP(ctx->in.pix.width,
> +						=C2=A0=C2=A0=C2=A0 hw->max_scaling_factor));
> +		max_width =3D MIN(max_width,
> +				ctx->in.pix.width * hw->max_scaling_factor);
> +		min_height =3D
> +			MAX(min_height, DIV_ROUND_UP(ctx->in.pix.height,
> +						=C2=A0=C2=A0=C2=A0=C2=A0 hw->max_scaling_factor));
> +		max_height =3D MIN(max_height,
> +				 ctx->in.pix.height * hw->max_scaling_factor);
> +	}
> +
> +	pix_fmt->width =3D clamp(pix_fmt->width, min_width, max_width);
> +	pix_fmt->height =3D clamp(pix_fmt->height, min_height, max_height);
> =C2=A0
> =C2=A0	v4l2_fill_pixfmt_mp_aligned(pix_fmt, pix_fmt->pixelformat,
> =C2=A0				=C2=A0=C2=A0=C2=A0 pix_fmt->width, pix_fmt->height, hw->stride_=
alignment);
> @@ -523,12 +552,33 @@ static int vidioc_s_selection(struct file *file, vo=
id *priv,
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0
> +static bool check_scaling(const struct rga_hw *hw, u32 src_size, u32 dst=
_size)
> +{
> +	if (src_size < dst_size)
> +		return src_size * hw->max_scaling_factor >=3D dst_size;
> +	else
> +		return dst_size * hw->max_scaling_factor >=3D src_size;
> +}
> +
> =C2=A0static int vidioc_streamon(struct file *file, void *priv,
> =C2=A0			=C2=A0=C2=A0 enum v4l2_buf_type type)
> =C2=A0{
> =C2=A0	struct rga_ctx *ctx =3D file_to_rga_ctx(file);
> =C2=A0	const struct rga_hw *hw =3D ctx->rga->hw;
> =C2=A0
> +	if ((V4L2_TYPE_IS_OUTPUT(type) &&
> +	=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx)->streamin=
g) ||
> +	=C2=A0=C2=A0=C2=A0 (V4L2_TYPE_IS_CAPTURE(type) &&
> +	=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx)->streamin=
g)) {
> +		/*
> +		 * As the other side is already streaming,
> +		 * check that the max scaling factor isn't exceeded.
> +		 */
> +		if (!check_scaling(hw, ctx->in.pix.width, ctx->out.pix.width) ||
> +		=C2=A0=C2=A0=C2=A0 !check_scaling(hw, ctx->in.pix.height, ctx->out.pix=
.height))
> +			return -EINVAL;
> +	}
> +
> =C2=A0	hw->setup_cmdbuf(ctx);
> =C2=A0
> =C2=A0	return v4l2_m2m_streamon(file, ctx->fh.m2m_ctx, type);
> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/pl=
atform/rockchip/rga/rga.h
> index 93162b118d069..d02d5730b4e3b 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -152,6 +152,7 @@ struct rga_hw {
> =C2=A0	size_t cmdbuf_size;
> =C2=A0	u32 min_width, min_height;
> =C2=A0	u32 max_width, max_height;
> +	u8 max_scaling_factor;
> =C2=A0	u8 stride_alignment;
> =C2=A0
> =C2=A0	void (*setup_cmdbuf)(struct rga_ctx *ctx);

--=-3yrJZ//37+CI7GA0IAKw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUwJNQAKCRDZQZRRKWBy
9It9AQCB0y2l7f5a6te5CTy3NSkJUT9TKJwDwpPMj6Jv9IBbFQEAv5SvNGpL5MSD
LnCfcbIUIQkFc1BIIdG6Tp36lWNu0g4=
=i83f
-----END PGP SIGNATURE-----

--=-3yrJZ//37+CI7GA0IAKw--

