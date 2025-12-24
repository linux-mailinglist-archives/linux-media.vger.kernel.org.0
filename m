Return-Path: <linux-media+bounces-49497-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E88ACCDCC5C
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 16:54:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DB5F30142C5
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 15:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EBB63271FA;
	Wed, 24 Dec 2025 15:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="ypMVMXSq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F0D30BBA9
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 15:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766591680; cv=none; b=DXrQYapZF5tDv1+XvRbFLavTU2SqrtlqiQMUA8kQBdiFaR3Tw9/Wf4HRwRuf9L2Q9rQlFaht29OZftE5lGBvPqGG4yXKVaY0CEBA1lU5VKwrYjy0xfPW2Mm/QFj3c76qFk/t8tXWupGzbRzJYuOkCgwXkaOjZm388mb35RJAnz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766591680; c=relaxed/simple;
	bh=VaAv7avYoqWNR9PCwmRPNOmtzgKxUFJ2ZZIHW9mO/po=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rTujofqTnjo6zdZlVmzZIuIBAFpdhtHFq8TaKr1wEu9Wn060DExV0lrazk8LyUOmLTS0nAtm4NJiYo6zZ4uOQ231H4hVi265usGjd2Yjy/wlMA0ALC11+TgkPUq3hPd0NMoCJxTzCa5PUwx+aTMeTK2Ww1gJto1QuAyXBwk8xQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=ypMVMXSq; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-88a347c424aso79031636d6.0
        for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 07:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1766591678; x=1767196478; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2psI/aP141t9WJvg+/Adc2m4sAlYqZvtnAn83waLW1A=;
        b=ypMVMXSqkRa8NhtHXe5z020Xy9R1cTsEFOGWeuC7BiALCxPLwf7mvIOWd6a5tqfR9J
         KbTo44hDKK0LfmTWQtZEHUcJqDS7rBeK1wKJD8+S8gPSIkAP5fNHbCvmceS2ifxH+3LF
         hmKvWvXrz0hu8cHXaH99kjNAKD3LMrOalHVD4R83AihhbQgCuNblovwY2cd/Do2caSyV
         dXIz4Axh4A4YxlIPu2I7upU0Yq5xgWcByeunGYbQdDDNg3yFZa/ao5bsxwgZuJp2fdM+
         0yroCxk1kvoQrvnBmcwUQbMtNtS3KG+ngatKnMSF8CCtu5a/fgOVZGcilb+5WOCEClbv
         LSFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766591678; x=1767196478;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2psI/aP141t9WJvg+/Adc2m4sAlYqZvtnAn83waLW1A=;
        b=JUru0Lz4qGCp9EgUwTe3/1c//EnPPiDYucbVI0MpPxNBffmnopoB9jkyZeX7QqTsT3
         id9JnJf12N+VfX5MGpI9HiCTk1Lee/+TB2ZKyDBlOJdVETYi1G0BcJSyPvbKsQnMcBuh
         0XH2ION3l2NfcJzFESnXzua04y0ibafL2LPuWmTQPJVQAb2Cn6EdhmpKXie6ozrtxBYl
         y9e6YoQ1fJaH0bQMPW1Dz/xu5ioEqS4C+8uj0f/cJ4fH0wP5W4Fcy2hy0/6MQBnBmjHF
         NuJsblUAdml9PeAEXaeuJrxYPVdQzxgYAdJ0titUqZWxXvZRw/mAZZ13PWTOdrVGdgU2
         Xhww==
X-Gm-Message-State: AOJu0YyJe7AEU2cJrbyWUWZTVepwMm04U5uDsCE8w/XNA1/N9hzHjOIy
	oO+4gMSFHbYcZkywPXOlqSsyqDQ/f0TejhhfNUCxBOBSXN2fCjC8yz2IO+KURSuooko=
X-Gm-Gg: AY/fxX6ih+JbjIIgFGfNJ4g88Mtdht9mlpZlbr9j2IqNeqJR2vd2LHdkv+ruaduqksU
	44J5pKhSiB6TeQnRHNuwobCt/42p3Vv2uvTvUqavpNj9mqlUMmV0iWUywxT8Uv7TyiewFY2NxbE
	uY8OA7EKgdR7uD6o3f6e+bRAdbIizSSzxNbfcE2VnDWL7WWtHhEjEbpQITpQe2gUIC5J9w1R/yk
	0Xx4tpFAFjufKyeTQTs+gtgsvAL584q2/32cOqdhyLcoEXGV6r+b6sW5141A37c2UlskH/TiwBz
	8H8vyKPpKGdt75x9wMd32TPsE6GHybs8KQGFTazhUSMj1+y7GXfyi69qiZ5ctDCn329WK4ilVmo
	t3d3GmrU4oy5EBPmw8ewIwNqTf/ey5Ec0tUzFooNXYGzeTDOFxJRErplDhTGuCokP0SagzIgfkE
	Y1to+V9yxotmKR7y6v
X-Google-Smtp-Source: AGHT+IFedl+Q8MBCrfyVIi5r/7wpFkhmE319oxOmZ6vllizWd7jQjQ9oQPtTNc+Zn0Eoas5UOmjdHQ==
X-Received: by 2002:a05:6214:240f:b0:88a:449d:73d7 with SMTP id 6a1803df08f44-88d82339423mr299817076d6.28.1766591678130;
        Wed, 24 Dec 2025 07:54:38 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d9759f164sm128316756d6.24.2025.12.24.07.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 07:54:37 -0800 (PST)
Message-ID: <7c25b77adbadf5f325ce15996ff609c893a1e7b8.camel@ndufresne.ca>
Subject: Re: [PATCH v2 16/22] media: rockchip: rga: remove size from
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
Date: Wed, 24 Dec 2025 10:54:36 -0500
In-Reply-To: <20251203-spu-rga3-v2-16-989a67947f71@pengutronix.de>
References: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
	 <20251203-spu-rga3-v2-16-989a67947f71@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-iHp+SZRXdImhT9S7j5MC"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-iHp+SZRXdImhT9S7j5MC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 03 d=C3=A9cembre 2025 =C3=A0 16:52 +0100, Sven P=C3=BCschel a =
=C3=A9crit=C2=A0:
> The size member is only used for the mmu page table mapping.
> Therefore avoid storing the value and instead only calculate it
> in place. This also avoids the calculation entirely when an external
> iommu is used.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
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
> index e8d1e2e579140..8de6b9c3fd615 100644
> --- a/drivers/media/platform/rockchip/rga/rga-buf.c
> +++ b/drivers/media/platform/rockchip/rga/rga-buf.c
> @@ -79,9 +79,13 @@ static int rga_buf_init(struct vb2_buffer *vb)
> =C2=A0	struct rockchip_rga *rga =3D ctx->rga;
> =C2=A0	struct rga_frame *f =3D rga_get_frame(ctx, vb->vb2_queue->type);
> =C2=A0	size_t n_desc =3D 0;
> +	u32 size =3D 0;
> +	u8 i;

Move in it the scope it is being used.

> =C2=A0
> =C2=A0	if (rga_has_internal_iommu(rga)) {

though, after looking more attentively, this function is a no-op when the i=
s an
external iommu. Using an early return would make this so much clearer, and =
you
can then drop the indent.

	if (rga_has_internal_iommu(rga))
		return 0;

Perhaps a comment to be applied on patch 14 though.

> -		n_desc =3D DIV_ROUND_UP(f->size, PAGE_SIZE);
> +		for (i =3D 0; i < f->pix.num_planes; i++)
> +			size +=3D f->pix.plane_fmt[i].sizeimage;
> +		n_desc =3D DIV_ROUND_UP(size, PAGE_SIZE);
> =C2=A0
> =C2=A0		rbuf->n_desc =3D n_desc;
> =C2=A0		rbuf->dma_desc =3D dma_alloc_coherent(rga->dev,
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 1bfc4021f4a7b..0d7b0bcac950e 100644
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
> @@ -428,9 +427,6 @@ static int vidioc_s_fmt(struct file *file, void *priv=
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
> @@ -443,10 +439,10 @@ static int vidioc_s_fmt(struct file *file, void *pr=
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
> index fc81bc5562792..466d568b9e614 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -37,7 +37,6 @@ struct rga_frame {
> =C2=A0
> =C2=A0	/* Variables that can calculated once and reused */
> =C2=A0	u32 stride;
> -	u32 size;
> =C2=A0};
> =C2=A0
> =C2=A0struct rga_dma_desc {

--=-iHp+SZRXdImhT9S7j5MC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUwMvAAKCRDZQZRRKWBy
9MazAP9SPSZieUXA48LDd5tOkCfcSw+tIQ3exEWQZqU4r0gOYQD+NnIkcgsXCMtT
DnOj2pkPBBxXjYYajH29kpn5EGDkJwM=
=AGpj
-----END PGP SIGNATURE-----

--=-iHp+SZRXdImhT9S7j5MC--

