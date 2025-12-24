Return-Path: <linux-media+bounces-49486-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEBFCDC9F3
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 16:04:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C904303CF4B
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 15:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72B5833EB0C;
	Wed, 24 Dec 2025 15:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="sp7ryszJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E87D41C72
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 15:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766588595; cv=none; b=aq3kK+YnQ17usnvuTdjzXZWMpf/jVwzqwyeYI8ZCIVO9Y+DyjpVBCeC2iKeUAnHjxoafNUfjUohi8pu19TQCkMxnYeENt2M+MaBubDfhyBe/z+8ZNx4lRKr/PBG/dUCrOFE/kybwX5oVnTiU6faKu33572urZXV0vXkW3Fz6yqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766588595; c=relaxed/simple;
	bh=D9Hekprm5PQRaLdYIzVuVl/HmCkKrZgoEGPjiQ2iKbQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mSjAM7q/tqX/2lfp2x75pkBHL2NpRAdDIsYw9ZWBiKJFuuUbTi205qjgjobSKLk8HFFIgv99HLsgN5siTiuok5g5mbZ9j8zqYspshY6DJjtFty/+i09NwcDVf+0+Cdo9grxz71a1DwQtAJIF8pqX7n3LKVWzgGsKxmTMutjrgsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=sp7ryszJ; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8888a444300so64633326d6.1
        for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 07:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1766588593; x=1767193393; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=w64xTWyuKcyjwlXtEdhivm1+7YRXLmiG7pc3O8NKLas=;
        b=sp7ryszJNTFdgqnNdhbcT5KyLtXa6Xhvrm5XHzBWNRbfNjRi8tcdDGxZhyxnrmL2RD
         Lv8YmGGebcG8WA56LCtlnfkTiP6WJg/dKHENhccneJZFDcDMHhGnRA7KLAc//cgCJvEL
         LSypPg3yQaro6Eis/84Ps2RMMJtquSEVZvJ1rRiIG6PCtTh5TqIhXd7mKEK/WzQsaZb8
         bAlQpkVGn6Ae+mdYClNYVW8mUosPKsz0+QO6Z/j9xVrZs46KTiCWY7ecfAjK9U5KqeF0
         3uSJC0T2j+MaqHEnE4zrNh+LIjCT87Lve/EXr7QIlxRXYU1I8EUcMmmStBOd8H7brQmE
         AMGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766588593; x=1767193393;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w64xTWyuKcyjwlXtEdhivm1+7YRXLmiG7pc3O8NKLas=;
        b=cnb0PzdlOF+WlhDQ1bZMawPke1658EBFBu2bEZMC5j23t5bdolI6YJ7YTwYgQlDlGc
         MhiOK9XEQw4Tcs8oMxkkHr73W84Hm/GOcjkBKA3YUagFDHOFBTH3JvZQXE99Twr5W7WM
         hujNhQfohRfqAJ0rKlyvjy1DImZ/u+E3jGuvKAkjoXBkmjskBSW00u1Hzx3Re1b5mbhw
         //sXst8W73oliWj4sAoV9goDxOXJxsp8UbluOUVvUDHGwVzVcPmPJ0BN1U0Zi5M2n3TB
         8MB9pwX8ccvAmFIZh6xvUUcQHsqdrIxgnkd+RGohCf4isLiMF8iffsKm76yZ7J7QkDrP
         HCqg==
X-Gm-Message-State: AOJu0YxN2U7t2Jv2KpMTEzLegFenHzhaZLULlJNOHt5et2xUOBtFP0x6
	SWg46bG3FGhJiVtdEu/yTy21buw5yjEbTLko3PImJe9YIuZuIQlJZ8aFZVceCnEmlVI=
X-Gm-Gg: AY/fxX6UzlXWnxOnprdYy8KqSpOLyHt12kzQgTL6DH58elJTrgFn79vDYSpFDNm7LC+
	UXfurZcjNFUoexuz4K85ijO5GUTk1LQbjag4/qE/zDE+QfKcZC5M6s07u3IXvd1O0gFXkxTJtbO
	Ti8GTh2gkJ+bRiahOzW7Mr9HaCFxSO0wath2n6gReepHKmSs1c+COeINVr83K2gWBG/DeesDbin
	ZN2MZ+HTizw5jDiKEKz+JAPU/ezOGe+WrCnTaxjsKLrhA7cJ5Ybarj2FuRwL/AZv8RTMTQcZZa3
	pexkBOSb81/Kwg0d2hvAOT4NE3Y6jFICIbypnNz/xIK04CXWLco7U5ylAfLQyxXTzhluG/4E8qN
	LvqL3aVfKVcLcDQURFglhQBf+AHG+HmkU3Uw5D1ZDi0h9jXkUhXd028efrMe1uL3gsj7BxxLc9E
	IJeZf1ytzg9eA0LKcf
X-Google-Smtp-Source: AGHT+IG13tCOi+/wPYw3H8H+1kJrJic8pKz8a1mR2iPpKvfOI1YIO+tJgGI/sjTl+Zvh3EOTI/q99A==
X-Received: by 2002:a05:6214:4685:b0:87d:fde1:f88b with SMTP id 6a1803df08f44-88d8203ebe8mr257400426d6.4.1766588592827;
        Wed, 24 Dec 2025 07:03:12 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d9a83f6f3sm132079966d6.55.2025.12.24.07.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 07:03:11 -0800 (PST)
Message-ID: <2e84355c399fbce499d86e2b35b88d406460d6b1.camel@ndufresne.ca>
Subject: Re: [PATCH v2 06/22] media: rockchip: rga: remove redundant
 rga_frame variables
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
Date: Wed, 24 Dec 2025 10:03:10 -0500
In-Reply-To: <20251203-spu-rga3-v2-6-989a67947f71@pengutronix.de>
References: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
	 <20251203-spu-rga3-v2-6-989a67947f71@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-78I1Q0OO2YaNMqG0/1Yc"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-78I1Q0OO2YaNMqG0/1Yc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 03 d=C3=A9cembre 2025 =C3=A0 16:52 +0100, Sven P=C3=BCschel a =
=C3=A9crit=C2=A0:
> Remove the redundant rga_frame variables width, height and color space.
> The value of these variables is already contained in the pix member
> of rga_frame. The code also keeps these values in sync. Therefore drop
> them in favor of the existing pix member.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga-buf.c |=C2=A0 6 ++---
> =C2=A0drivers/media/platform/rockchip/rga/rga-hw.c=C2=A0 |=C2=A0 6 ++---
> =C2=A0drivers/media/platform/rockchip/rga/rga.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
 32 ++++++++++-----------------
> =C2=A0drivers/media/platform/rockchip/rga/rga.h=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 5 -----
> =C2=A04 files changed, 18 insertions(+), 31 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/medi=
a/platform/rockchip/rga/rga-buf.c
> index b5e6b1b527ca8..0c59a4d330888 100644
> --- a/drivers/media/platform/rockchip/rga/rga-buf.c
> +++ b/drivers/media/platform/rockchip/rga/rga-buf.c
> @@ -100,10 +100,10 @@ static int get_plane_offset(struct rga_frame *f,
> =C2=A0	if (plane =3D=3D 0)
> =C2=A0		return 0;
> =C2=A0	if (plane =3D=3D 1)
> -		return stride * f->height;
> +		return stride * f->pix.height;
> =C2=A0	if (plane =3D=3D 2)
> -		return stride * f->height +
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (stride * f->height / info->hdiv =
/ info->vdiv);
> +		return stride * f->pix.height +
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (stride * f->pix.height / info->h=
div / info->vdiv);
> =C2=A0
> =C2=A0	return -EINVAL;
> =C2=A0}
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media=
/platform/rockchip/rga/rga-hw.c
> index 43ed742a16492..f1d5237472941 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> @@ -53,7 +53,7 @@ rga_get_addr_offset(struct rga_frame *frm, struct rga_a=
ddr_offset *offset,
> =C2=A0	x_div =3D frm->fmt->x_div;
> =C2=A0	y_div =3D frm->fmt->y_div;
> =C2=A0	uv_stride =3D frm->stride / x_div;
> -	pixel_width =3D frm->stride / frm->width;
> +	pixel_width =3D frm->stride / frm->pix.width;
> =C2=A0
> =C2=A0	lt->y_off =3D offset->y_off + y * frm->stride + x * pixel_width;
> =C2=A0	lt->u_off =3D offset->u_off + (y / y_div) * uv_stride + x / x_div;
> @@ -191,7 +191,7 @@ static void rga_cmd_set_trans_info(struct rga_ctx *ct=
x)
> =C2=A0
> =C2=A0	if (RGA_COLOR_FMT_IS_YUV(ctx->in.fmt->hw_format) &&
> =C2=A0	=C2=A0=C2=A0=C2=A0 RGA_COLOR_FMT_IS_RGB(ctx->out.fmt->hw_format)) =
{
> -		switch (ctx->in.colorspace) {
> +		switch (ctx->in.pix.colorspace) {
> =C2=A0		case V4L2_COLORSPACE_REC709:
> =C2=A0			src_info.data.csc_mode =3D RGA_SRC_CSC_MODE_BT709_R0;
> =C2=A0			break;
> @@ -203,7 +203,7 @@ static void rga_cmd_set_trans_info(struct rga_ctx *ct=
x)
> =C2=A0
> =C2=A0	if (RGA_COLOR_FMT_IS_RGB(ctx->in.fmt->hw_format) &&
> =C2=A0	=C2=A0=C2=A0=C2=A0 RGA_COLOR_FMT_IS_YUV(ctx->out.fmt->hw_format)) =
{
> -		switch (ctx->out.colorspace) {
> +		switch (ctx->out.pix.colorspace) {
> =C2=A0		case V4L2_COLORSPACE_REC709:
> =C2=A0			dst_info.data.csc_mode =3D RGA_SRC_CSC_MODE_BT709_R0;
> =C2=A0			break;
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index ef568b3758380..f50fbbab0645e 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -345,9 +345,6 @@ static struct rga_fmt *rga_fmt_find(u32 pixelformat)
> =C2=A0}
> =C2=A0
> =C2=A0static struct rga_frame def_frame =3D {
> -	.width =3D DEFAULT_WIDTH,
> -	.height =3D DEFAULT_HEIGHT,
> -	.colorspace =3D V4L2_COLORSPACE_DEFAULT,
> =C2=A0	.crop.left =3D 0,
> =C2=A0	.crop.top =3D 0,
> =C2=A0	.crop.width =3D DEFAULT_WIDTH,
> @@ -379,9 +376,9 @@ static int rga_open(struct file *file)
> =C2=A0	ctx->out =3D def_frame;
> =C2=A0
> =C2=A0	v4l2_fill_pixfmt_mp(&ctx->in.pix,
> -			=C2=A0=C2=A0=C2=A0 ctx->in.fmt->fourcc, ctx->out.width, ctx->out.heig=
ht);
> +			=C2=A0=C2=A0=C2=A0 ctx->in.fmt->fourcc, DEFAULT_WIDTH, DEFAULT_HEIGHT=
);
> =C2=A0	v4l2_fill_pixfmt_mp(&ctx->out.pix,
> -			=C2=A0=C2=A0=C2=A0 ctx->out.fmt->fourcc, ctx->out.width, ctx->out.hei=
ght);
> +			=C2=A0=C2=A0=C2=A0 ctx->out.fmt->fourcc, DEFAULT_WIDTH, DEFAULT_HEIGH=
T);
> =C2=A0
> =C2=A0	if (mutex_lock_interruptible(&rga->mutex)) {
> =C2=A0		kfree(ctx);
> @@ -469,10 +466,8 @@ static int vidioc_g_fmt(struct file *file, void *pri=
v, struct v4l2_format *f)
> =C2=A0	if (IS_ERR(frm))
> =C2=A0		return PTR_ERR(frm);
> =C2=A0
> -	v4l2_fill_pixfmt_mp(pix_fmt, frm->fmt->fourcc, frm->width, frm->height)=
;
> -
> +	*pix_fmt =3D frm->pix;
> =C2=A0	pix_fmt->field =3D V4L2_FIELD_NONE;
> -	pix_fmt->colorspace =3D frm->colorspace;
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}
> @@ -521,27 +516,24 @@ static int vidioc_s_fmt(struct file *file, void *pr=
iv, struct v4l2_format *f)
> =C2=A0	frm =3D rga_get_frame(ctx, f->type);
> =C2=A0	if (IS_ERR(frm))
> =C2=A0		return PTR_ERR(frm);
> -	frm->width =3D pix_fmt->width;
> -	frm->height =3D pix_fmt->height;
> =C2=A0	frm->size =3D 0;
> =C2=A0	for (i =3D 0; i < pix_fmt->num_planes; i++)
> =C2=A0		frm->size +=3D pix_fmt->plane_fmt[i].sizeimage;
> =C2=A0	frm->fmt =3D rga_fmt_find(pix_fmt->pixelformat);
> =C2=A0	frm->stride =3D pix_fmt->plane_fmt[0].bytesperline;
> -	frm->colorspace =3D pix_fmt->colorspace;
> =C2=A0
> =C2=A0	/* Reset crop settings */
> =C2=A0	frm->crop.left =3D 0;
> =C2=A0	frm->crop.top =3D 0;
> -	frm->crop.width =3D frm->width;
> -	frm->crop.height =3D frm->height;
> +	frm->crop.width =3D pix_fmt->width;
> +	frm->crop.height =3D pix_fmt->height;
> =C2=A0
> =C2=A0	frm->pix =3D *pix_fmt;
> =C2=A0
> =C2=A0	v4l2_dbg(debug, 1, &rga->v4l2_dev,
> =C2=A0		 "[%s] fmt - %p4cc %dx%d (stride %d, sizeimage %d)\n",
> =C2=A0		=C2=A0 V4L2_TYPE_IS_OUTPUT(f->type) ? "OUTPUT" : "CAPTURE",
> -		=C2=A0 &frm->fmt->fourcc, frm->width, frm->height,
> +		=C2=A0 &frm->fmt->fourcc, pix_fmt->width, pix_fmt->height,
> =C2=A0		=C2=A0 frm->stride, frm->size);
> =C2=A0
> =C2=A0	for (i =3D 0; i < pix_fmt->num_planes; i++) {
> @@ -595,8 +587,8 @@ static int vidioc_g_selection(struct file *file, void=
 *priv,
> =C2=A0	} else {
> =C2=A0		s->r.left =3D 0;
> =C2=A0		s->r.top =3D 0;
> -		s->r.width =3D f->width;
> -		s->r.height =3D f->height;
> +		s->r.width =3D f->pix.width;
> +		s->r.height =3D f->pix.height;
> =C2=A0	}
> =C2=A0
> =C2=A0	return 0;
> @@ -645,8 +637,8 @@ static int vidioc_s_selection(struct file *file, void=
 *priv,
> =C2=A0		return -EINVAL;
> =C2=A0	}
> =C2=A0
> -	if (s->r.left + s->r.width > f->width ||
> -	=C2=A0=C2=A0=C2=A0 s->r.top + s->r.height > f->height ||
> +	if (s->r.left + s->r.width > f->pix.width ||
> +	=C2=A0=C2=A0=C2=A0 s->r.top + s->r.height > f->pix.height ||
> =C2=A0	=C2=A0=C2=A0=C2=A0 s->r.width < MIN_WIDTH || s->r.height < MIN_HEI=
GHT) {
> =C2=A0		v4l2_dbg(debug, 1, &rga->v4l2_dev, "unsupported crop value.\n");
> =C2=A0		return -EINVAL;
> @@ -836,8 +828,8 @@ static int rga_probe(struct platform_device *pdev)
> =C2=A0		goto rel_m2m;
> =C2=A0	}
> =C2=A0
> -	def_frame.stride =3D (def_frame.width * def_frame.fmt->depth) >> 3;
> -	def_frame.size =3D def_frame.stride * def_frame.height;
> +	def_frame.stride =3D (DEFAULT_WIDTH * def_frame.fmt->depth) >> 3;
> +	def_frame.size =3D def_frame.stride * DEFAULT_HEIGHT;
> =C2=A0
> =C2=A0	ret =3D video_register_device(vfd, VFL_TYPE_VIDEO, -1);
> =C2=A0	if (ret) {
> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/pl=
atform/rockchip/rga/rga.h
> index a922fac0c01a3..7ec1fcc03ed32 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -25,11 +25,6 @@ struct rga_fmt {
> =C2=A0};
> =C2=A0
> =C2=A0struct rga_frame {
> -	/* Original dimensions */
> -	u32 width;
> -	u32 height;
> -	u32 colorspace;
> -
> =C2=A0	/* Crop */
> =C2=A0	struct v4l2_rect crop;
> =C2=A0

--=-78I1Q0OO2YaNMqG0/1Yc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUwArgAKCRDZQZRRKWBy
9A0yAQCCdNmpE/3ZXrpqQp5jF0piH9kcLZVkaDc3dtv3fykfjgEAtgDBc0HKjKfr
xlZVSDKGRX+5p6SCLET0zHTumbpqnQg=
=wPCe
-----END PGP SIGNATURE-----

--=-78I1Q0OO2YaNMqG0/1Yc--

