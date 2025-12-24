Return-Path: <linux-media+bounces-49491-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DCDCDCB4A
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 16:30:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7ABD53020C4D
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 15:29:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A568A34CFCC;
	Wed, 24 Dec 2025 15:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="W0TrsQV/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A187334D4C6
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 15:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766590190; cv=none; b=IezJDX4XpvWcwrF/G4Htd4MrDkENAunYm3hmrv7KjvY37CVaMuSJ//0giv7SMwTjbUzd8mPmjrDmYqsqagwBXIL/xu5GFgq7h1VlfqYuLP9q3isesNKNgw1ti675GjKLV5U/hq5QZx7BPXML1EvMdUyZRUbk99dagleXfUg27EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766590190; c=relaxed/simple;
	bh=0/Yd8o5IAdXD822IxpRMHQuXWwrqJuAv5y9d+H3o9Uw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mpmUOs38287RkABftm0zYtgew4CLVni3eNgQYpUrlgjHCB0hs2PVfT6yx9FPXQAnj4EIWrDFr6BeVCFZHe4X/ZlA65JtzgLJSD3/NGAL6tHUV8ywyyTr8n8VolM3uBWjq4b+eaXGZ3c0UJY+AZ5mZIL4HGmOOIwqm4nCwNBedb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=W0TrsQV/; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4f4cd02f915so18614791cf.1
        for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 07:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1766590182; x=1767194982; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TwkJIIAOyC+iGrxHsI9snh+xrQsvtUQwuewCKc8KNUQ=;
        b=W0TrsQV/E+mIT3UL/HNsE7KwV3y/nfafCYLUNhWlMk0kf7WuZta43DGlwJNCoF2pSk
         VgTr+13jGgpvm1cbf/XAcS6oXlXp4E3CMDsjphwXtltacaomG7EOANtCzgSmh5LaX6Z0
         GmG7nAyU5OoGPYX4VmfMfioogonaK/x0FnnVtW/EVmzVpTYgz4l5bXl/OnWQhE2nvRWH
         nXJK0Y8ZBW36inB3Mxdd1aM8vfZANPgui4i9T0PwY/ypfbawU6Gd1XjIdJXDWRwGg0oi
         lWN6MNqCZ1Ai3sIIW5bsSrxOvHlsSMR3/gIiAvQiW7eCbHBud1/OHhiZS3XGbnSUl5jU
         QcvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766590182; x=1767194982;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TwkJIIAOyC+iGrxHsI9snh+xrQsvtUQwuewCKc8KNUQ=;
        b=dpqPLeHgF+abK/8Ha6LSyCJQFeIbkoB/9Ho1hHDpqOKFYCR7K1IqYAJda2kMmPFYmO
         mD3AakrB82mJv5hilr07qL9ur/xziZ+d56iM4l9pftiFcrt10NnQdy874FeMdK646JDZ
         cUPPxNkrQeBtIGqLsOwzbKZSzVuEPwZquQAY4BGy9Z+WwVAWlc9gHf3ctSdhWddAqvHR
         rgqS5arzUN7VAMlH2TBJjwdnKEyS3JqPg1n7AiKwbRAr07Dxn2gIM39TjLI6t19fTXZ6
         +XhIVIDNGPBsbwCzDNw/sLhXOAtPu17xPA+KZ+I7KHkpQx3TcHe7jQ1p9FR+1g420/Nj
         OG2w==
X-Gm-Message-State: AOJu0YyoQrHt5NT+rKbFTzCNWtvzdnKvv31gP8FaboSfozJIE2B24zKb
	8UO9rti+DiLn+wHJ9tqWbRBRqdXi9p2zZ8JhD+j3ZNJqEJTn/aK4X1tz9G5JPyC4qAs=
X-Gm-Gg: AY/fxX6DeKEREs1pAQXuY9Tu7YoPX+POYJHcR5HIUo5s3X/KI3BjjH+SWQdatGXn5Cm
	XOcwce7qofUS9J4FWWVPMBG0a8lnIasdKskcMZDea6hNKZLE/CFWUURqcT5MhDIrFHBNKl3H9bT
	pi3575+LvJSDvrb2uv/RTzG0i1DfxEFoQgQe1w6m6RRVFUWcPqQ8NgYf97RGsjOgnoqLzp1e4AS
	7gvsvDUhPVGZLfajfguf80VCwywErMlf71yEyBjNFvgyY0EpUd8Vyf//m86WqGOELo+eoSZWz+s
	AIbCTTwjlFIxORl5+s7SYZw2+Gi0SWHrmKMHqXlVCg5X2Nl2ljuiaCAD+tebzhdtgrYo8xc6yKz
	NXzCTo35B09ffTNiaLsGLe/QHtDygSot+id00KxOdLQrOfqfWS2LoVj2ogR2XBFe+Ek5+2Gu/eo
	yZure9XoYqkTvBLEVy
X-Google-Smtp-Source: AGHT+IFurORRUJNULnlbX94R2za/XCt3vvaDyHm+KjHk3sOKh4CoRdkgBOx3YgO3VJabdA7p5qCnbw==
X-Received: by 2002:a05:622a:4d93:b0:4e8:96ed:2e65 with SMTP id d75a77b69052e-4f4abcc50e0mr263126051cf.22.1766590182533;
        Wed, 24 Dec 2025 07:29:42 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac66841bsm120154681cf.30.2025.12.24.07.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 07:29:41 -0800 (PST)
Message-ID: <8c3a3299036dd1bab158bdcd589abd027d2864b6.camel@ndufresne.ca>
Subject: Re: [PATCH v2 10/22] media: rockchip: rga: prepare cmdbuf on
 streamon
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
Date: Wed, 24 Dec 2025 10:29:41 -0500
In-Reply-To: <20251203-spu-rga3-v2-10-989a67947f71@pengutronix.de>
References: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
	 <20251203-spu-rga3-v2-10-989a67947f71@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-wgUFX3W9vJo/GeY1uEul"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-wgUFX3W9vJo/GeY1uEul
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 03 d=C3=A9cembre 2025 =C3=A0 16:52 +0100, Sven P=C3=BCschel a =
=C3=A9crit=C2=A0:
> Prepare the command buffer on streamon to reuse it's contents instead of
> completely writing it for every frame. Due to the stream settings being
> fixed after a streamon we only need to replace the source and destination
> addresses for each frame. This reduces the amount of CPU and memory
> operations done in each frame.

My speculation is that flushing to device is usually more expensive then th=
is,
but I didn't check closely if you have enabled the caches. That being said,=
 this
is good change. It highlight the inflexible nature of V4L2 imho, which in t=
his
case can be used to optimize.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga-hw.c | 13 +++++++++----
> =C2=A0drivers/media/platform/rockchip/rga/rga.c=C2=A0=C2=A0=C2=A0 | 13 ++=
++++++++++-
> =C2=A0drivers/media/platform/rockchip/rga/rga.h=C2=A0=C2=A0=C2=A0 |=C2=A0=
 1 +
> =C2=A03 files changed, 22 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media=
/platform/rockchip/rga/rga-hw.c
> index 56a2558539bfb..8cdfe089fd636 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> @@ -408,8 +408,6 @@ static void rga_cmd_set(struct rga_ctx *ctx,
> =C2=A0{
> =C2=A0	struct rockchip_rga *rga =3D ctx->rga;
> =C2=A0
> -	memset(ctx->cmdbuf_virt, 0, RGA_CMDBUF_SIZE * 4);
> -
> =C2=A0	rga_cmd_set_src_addr(ctx, src->dma_desc_pa);
> =C2=A0	/*
> =C2=A0	 * Due to hardware bug,
> @@ -418,11 +416,9 @@ static void rga_cmd_set(struct rga_ctx *ctx,
> =C2=A0	rga_cmd_set_src1_addr(ctx, dst->dma_desc_pa);
> =C2=A0
> =C2=A0	rga_cmd_set_dst_addr(ctx, dst->dma_desc_pa);
> -	rga_cmd_set_mode(ctx);
> =C2=A0
> =C2=A0	rga_cmd_set_src_info(ctx, &src->offset);
> =C2=A0	rga_cmd_set_dst_info(ctx, &dst->offset);
> -	rga_cmd_set_trans_info(ctx);
> =C2=A0
> =C2=A0	rga_write(rga, RGA_CMD_BASE, ctx->cmdbuf_phy);
> =C2=A0
> @@ -431,6 +427,14 @@ static void rga_cmd_set(struct rga_ctx *ctx,
> =C2=A0				=C2=A0=C2=A0 PAGE_SIZE, DMA_BIDIRECTIONAL);
> =C2=A0}
> =C2=A0
> +static void rga_hw_setup_cmdbuf(struct rga_ctx *ctx)
> +{
> +	memset(ctx->cmdbuf_virt, 0, RGA_CMDBUF_SIZE * 4);
> +
> +	rga_cmd_set_mode(ctx);
> +	rga_cmd_set_trans_info(ctx);
> +}
> +
> =C2=A0static void rga_hw_start(struct rockchip_rga *rga,
> =C2=A0			 struct rga_vb_buffer *src,=C2=A0 struct rga_vb_buffer *dst)
> =C2=A0{
> @@ -622,6 +626,7 @@ const struct rga_hw rga2_hw =3D {
> =C2=A0	.max_height =3D MAX_HEIGHT,
> =C2=A0	.stride_alignment =3D 4,
> =C2=A0
> +	.setup_cmdbuf =3D rga_hw_setup_cmdbuf,
> =C2=A0	.start =3D rga_hw_start,
> =C2=A0	.handle_irq =3D rga_handle_irq,
> =C2=A0	.get_version =3D rga_get_version,
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 592c977a07cf3..f02ae02de26ca 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -523,6 +523,17 @@ static int vidioc_s_selection(struct file *file, voi=
d *priv,
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0
> +static int vidioc_streamon(struct file *file, void *priv,
> +			=C2=A0=C2=A0 enum v4l2_buf_type type)
> +{
> +	struct rga_ctx *ctx =3D file_to_rga_ctx(file);
> +	const struct rga_hw *hw =3D ctx->rga->hw;
> +
> +	hw->setup_cmdbuf(ctx);
> +
> +	return v4l2_m2m_streamon(file, ctx->fh.m2m_ctx, type);
> +}
> +
> =C2=A0static const struct v4l2_ioctl_ops rga_ioctl_ops =3D {
> =C2=A0	.vidioc_querycap =3D vidioc_querycap,
> =C2=A0
> @@ -547,7 +558,7 @@ static const struct v4l2_ioctl_ops rga_ioctl_ops =3D =
{
> =C2=A0	.vidioc_subscribe_event =3D v4l2_ctrl_subscribe_event,
> =C2=A0	.vidioc_unsubscribe_event =3D v4l2_event_unsubscribe,
> =C2=A0
> -	.vidioc_streamon =3D v4l2_m2m_ioctl_streamon,
> +	.vidioc_streamon =3D vidioc_streamon,
> =C2=A0	.vidioc_streamoff =3D v4l2_m2m_ioctl_streamoff,
> =C2=A0
> =C2=A0	.vidioc_g_selection =3D vidioc_g_selection,
> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/pl=
atform/rockchip/rga/rga.h
> index 0aef348dddb95..93162b118d069 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -154,6 +154,7 @@ struct rga_hw {
> =C2=A0	u32 max_width, max_height;
> =C2=A0	u8 stride_alignment;
> =C2=A0
> +	void (*setup_cmdbuf)(struct rga_ctx *ctx);
> =C2=A0	void (*start)(struct rockchip_rga *rga,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct rga_vb_buffer *src, struct =
rga_vb_buffer *dst);
> =C2=A0	bool (*handle_irq)(struct rockchip_rga *rga);

--=-wgUFX3W9vJo/GeY1uEul
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUwG5QAKCRDZQZRRKWBy
9O4FAP9E2aNeLRZt1zQcbEal6Ub+hRLjCwZuHvx4d6mo+exV+gD8D3fEU7lK1Rbl
U4jgUBplP0NBwSIZ6m7R2BXkERRjOQA=
=EAR/
-----END PGP SIGNATURE-----

--=-wgUFX3W9vJo/GeY1uEul--

