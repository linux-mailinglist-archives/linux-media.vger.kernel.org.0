Return-Path: <linux-media+bounces-49489-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AC9CDCAA2
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 16:21:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 781D530184CB
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 15:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BF5033D6CB;
	Wed, 24 Dec 2025 15:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="McgxQBp/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E0A1E572F
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 15:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766589675; cv=none; b=WwED05BgfLOZe7TJary9xxicm5TEp0DuwswgEAE0Iyro7BlEGZRod3w9dM4SCEP8oSF1upqb8qWYM0EPR3dO0xuYvRGMvOFnZUA2WtLo9KwuMaE60cu6rHeMuxh8wMEpfuEmGyqDbAabCWvzoF2y/n34hNodXb/VhtXfmPEi17M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766589675; c=relaxed/simple;
	bh=rqcu7bITYvPe1yKiChXWziqauaEKOwG3yTnFWZOXTXU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NRgPM9znwQHoF6ywPQTI75TF7PBAwOXJDaDe51T/JmmVkMQbHB6LLjPwnVRtBTkUJYHnirWpWteU5uJ7epRNM+9YNoQ4u8yJHkKQAZAQFzFFbDARsVUPADF8KSc7T8ZxDinmi4J3jwCq5a3Ur8cji4bX2DLrlG6bDNAqbrPdOxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=McgxQBp/; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4ee1fca7a16so49877081cf.3
        for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 07:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1766589673; x=1767194473; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6glIL6eKp+kKBjZvK5n8WItuloB18dl6WGJ3uf/Wmj0=;
        b=McgxQBp/8ff7veIc/B+bf/DWMga0c4f6IGCUsCceBfSvOiJnQokmAbhKy10pOToyie
         /bWj3zFYTdm0K/BAhBVn2ck8Fswik2wirtAhddSvgHwlkrAMhMgabqd2zaJDwfrKgn2E
         C0qQj8STiKyg16jlpUoUz5QPUwzhCxDfvvA4YDn7C4deAX/iEqDhHlPyS6MTMdjV+3wP
         awd/oqACRZXJDqUxo25YqkpEvi+mpNni+RJRxmrPW9htD6ugRSXdtzED7a389y9EQntG
         vvSJTSWTD2vfRBJjDIReu5FvYC+LeOuWjF/awJ2ryPMy6vzuU2ffOTtK8DGjRLwFTSWm
         IoWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766589673; x=1767194473;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6glIL6eKp+kKBjZvK5n8WItuloB18dl6WGJ3uf/Wmj0=;
        b=T3wuhihuogPkeW+v6x/7G+yorPW7hhJblWXOJ03JbwcXjbzbgEgcfGjaQxwvkjXe/e
         tFaqctx7RAurpN6XVm1B5T3BQwETdOyVK7yG6jq10gjnYSPd4VJ6Ydx5aXmpqPTTST/b
         QJYrJaQ14lbrmZ/yXwo6cwoSm467z84w/+tpl55Z9BHcvyCQT8MmHN6vSNZ0TXLvl8e1
         jsbJnNet+FsN+8607a+XqAORbprclvO3/MvVYephT1nZe+oWdWkUGuYq4psnSiEiTyll
         WxJlsCk3OK30eu9JNQqu54IhieiqDBRgfzG9v8nWrRdhl+8ZPZqNF+PjNBMciSfvq0nt
         +Pnw==
X-Gm-Message-State: AOJu0YyrwVN2a311ujZUy3pxwpPawa1q+/+x+G+xBp1WLvsf1Afzk4KW
	R1MCMqUt9gr110fNyW1cfbICh/cfiL+cClkwFMmBiZI+eZs6IRH4gKASMtLpGzqqLXQ=
X-Gm-Gg: AY/fxX6ogY6FBH2GIWVyDPZn4nLEkwKIKLzMmuo8bFE+2MGjqrmd7c4bQa8q1nLk5tO
	fZCCLyX9+cgh7yWCpHdfB0NonLlihw6Zp3ZmgV+F5YTM4dnBX3HqyN4pOg+yjz15PpkywUthKqM
	Rht8CXUtFm+S+4pbcwvTFxbxY4cCoubd1D6HLr8xAR8wwiGtGo4vF5zOISTVDcabttpJg7AIZo8
	Lgj49L5D3zGGaMSThAptJb1davOFWx9JT9R6bdyd2rHIee7DmTo8YW6LAjz4GH9SZ0E52BUNtCK
	0S6qetfveiNz8tIFBw7CAga4YT+2HybituEeo6kuojgY27Y1/ch5j65J7msy0sPCXkYMJeUbmOp
	xr0jOL1zfYDnF6bpqqFXTvvMiESJ4YxRnhk9ecCMkYGBw4ezeSzPAto11g0p2GMOa3WndQeIxtw
	n1QE75A2vxdLxE9ZxMu8xrdX8FO3o=
X-Google-Smtp-Source: AGHT+IGnRKP+s7rGYiia4Dsfwen4EGHTYTBBqUpeqJ9Opguixy4B6Hh0+XAtrq5sDUYlC0VBSQ/LPA==
X-Received: by 2002:a05:622a:4813:b0:4f1:bacc:151 with SMTP id d75a77b69052e-4f4abdb66c2mr291705921cf.60.1766589672690;
        Wed, 24 Dec 2025 07:21:12 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac64e43asm122304191cf.26.2025.12.24.07.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 07:21:12 -0800 (PST)
Message-ID: <b8dac5e182ed5142506ac730911c4158daeb4fd4.camel@ndufresne.ca>
Subject: Re: [PATCH v2 08/22] media: rockchip: rga: move cmdbuf to rga_ctx
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
Date: Wed, 24 Dec 2025 10:21:10 -0500
In-Reply-To: <20251203-spu-rga3-v2-8-989a67947f71@pengutronix.de>
References: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
	 <20251203-spu-rga3-v2-8-989a67947f71@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-Nrb1QznaERS51PvTN0N7"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-Nrb1QznaERS51PvTN0N7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 03 d=C3=A9cembre 2025 =C3=A0 16:52 +0100, Sven P=C3=BCschel a =
=C3=A9crit=C2=A0:
> Move the command buffer to the rga_ctx struct in preparation to reuse
> an already prepared command buffer. Having a command buffer per context
> allows to reuse the command buffer for other frames even when
> multiple applications are using the RGA in at the same time.

So the command buffer is only holding commands for a single render, and its=
 not
possible to append to it right ? It has no sync point or anything that woul=
d let
us program it live ?

In this context, that sounds about right. Though please rework the commit
message, I find it a little miss-leading, since in the code you still progr=
am it
in device_run(), which is during the idle portion of the hardware.

To really benefit, you would have to program and flush it on the context qb=
uf,
so that once device_run() is call, you just have to set the command buf for=
 the
context and trigger. Basically, no performance is gained from this patch I
believe.

>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

With a clear commit message:

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga-hw.c | 28 +++++++---------
> =C2=A0drivers/media/platform/rockchip/rga/rga.c=C2=A0=C2=A0=C2=A0 | 48 ++=
++++++++++++++-----------
> -
> =C2=A0drivers/media/platform/rockchip/rga/rga.h=C2=A0=C2=A0=C2=A0 |=C2=A0=
 5 +--
> =C2=A03 files changed, 41 insertions(+), 40 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c
> b/drivers/media/platform/rockchip/rga/rga-hw.c
> index 7419784efc693..79bf911e74779 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> @@ -113,8 +113,7 @@ static struct rga_addr_offset *rga_lookup_draw_pos(st=
ruct
> =C2=A0
> =C2=A0static void rga_cmd_set_src_addr(struct rga_ctx *ctx, dma_addr_t dm=
a_addr)
> =C2=A0{
> -	struct rockchip_rga *rga =3D ctx->rga;
> -	u32 *dest =3D rga->cmdbuf_virt;
> +	u32 *dest =3D ctx->cmdbuf_virt;
> =C2=A0	unsigned int reg;
> =C2=A0
> =C2=A0	reg =3D RGA_MMU_SRC_BASE - RGA_MODE_BASE_REG;
> @@ -126,8 +125,7 @@ static void rga_cmd_set_src_addr(struct rga_ctx *ctx,
> dma_addr_t dma_addr)
> =C2=A0
> =C2=A0static void rga_cmd_set_src1_addr(struct rga_ctx *ctx, dma_addr_t d=
ma_addr)
> =C2=A0{
> -	struct rockchip_rga *rga =3D ctx->rga;
> -	u32 *dest =3D rga->cmdbuf_virt;
> +	u32 *dest =3D ctx->cmdbuf_virt;
> =C2=A0	unsigned int reg;
> =C2=A0
> =C2=A0	reg =3D RGA_MMU_SRC1_BASE - RGA_MODE_BASE_REG;
> @@ -139,8 +137,7 @@ static void rga_cmd_set_src1_addr(struct rga_ctx *ctx=
,
> dma_addr_t dma_addr)
> =C2=A0
> =C2=A0static void rga_cmd_set_dst_addr(struct rga_ctx *ctx, dma_addr_t dm=
a_addr)
> =C2=A0{
> -	struct rockchip_rga *rga =3D ctx->rga;
> -	u32 *dest =3D rga->cmdbuf_virt;
> +	u32 *dest =3D ctx->cmdbuf_virt;
> =C2=A0	unsigned int reg;
> =C2=A0
> =C2=A0	reg =3D RGA_MMU_DST_BASE - RGA_MODE_BASE_REG;
> @@ -153,7 +150,7 @@ static void rga_cmd_set_dst_addr(struct rga_ctx *ctx,
> dma_addr_t dma_addr)
> =C2=A0static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
> =C2=A0{
> =C2=A0	struct rockchip_rga *rga =3D ctx->rga;
> -	u32 *dest =3D rga->cmdbuf_virt;
> +	u32 *dest =3D ctx->cmdbuf_virt;
> =C2=A0	unsigned int scale_dst_w, scale_dst_h;
> =C2=A0	unsigned int src_h, src_w, dst_h, dst_w;
> =C2=A0	union rga_src_info src_info;
> @@ -313,8 +310,7 @@ static void rga_cmd_set_src_info(struct rga_ctx *ctx,
> =C2=A0				 struct rga_addr_offset *offset)
> =C2=A0{
> =C2=A0	struct rga_corners_addr_offset src_offsets;
> -	struct rockchip_rga *rga =3D ctx->rga;
> -	u32 *dest =3D rga->cmdbuf_virt;
> +	u32 *dest =3D ctx->cmdbuf_virt;
> =C2=A0	unsigned int src_h, src_w, src_x, src_y;
> =C2=A0
> =C2=A0	src_h =3D ctx->in.crop.height;
> @@ -341,8 +337,7 @@ static void rga_cmd_set_dst_info(struct rga_ctx *ctx,
> =C2=A0{
> =C2=A0	struct rga_addr_offset *dst_offset;
> =C2=A0	struct rga_corners_addr_offset offsets;
> -	struct rockchip_rga *rga =3D ctx->rga;
> -	u32 *dest =3D rga->cmdbuf_virt;
> +	u32 *dest =3D ctx->cmdbuf_virt;
> =C2=A0	unsigned int dst_h, dst_w, dst_x, dst_y;
> =C2=A0	unsigned int mir_mode =3D 0;
> =C2=A0	unsigned int rot_mode =3D 0;
> @@ -388,8 +383,7 @@ static void rga_cmd_set_dst_info(struct rga_ctx *ctx,
> =C2=A0
> =C2=A0static void rga_cmd_set_mode(struct rga_ctx *ctx)
> =C2=A0{
> -	struct rockchip_rga *rga =3D ctx->rga;
> -	u32 *dest =3D rga->cmdbuf_virt;
> +	u32 *dest =3D ctx->cmdbuf_virt;
> =C2=A0	union rga_mode_ctrl mode;
> =C2=A0	union rga_alpha_ctrl0 alpha_ctrl0;
> =C2=A0	union rga_alpha_ctrl1 alpha_ctrl1;
> @@ -414,7 +408,7 @@ static void rga_cmd_set(struct rga_ctx *ctx,
> =C2=A0{
> =C2=A0	struct rockchip_rga *rga =3D ctx->rga;
> =C2=A0
> -	memset(rga->cmdbuf_virt, 0, RGA_CMDBUF_SIZE * 4);
> +	memset(ctx->cmdbuf_virt, 0, RGA_CMDBUF_SIZE * 4);
> =C2=A0
> =C2=A0	rga_cmd_set_src_addr(ctx, src->dma_desc_pa);
> =C2=A0	/*
> @@ -430,11 +424,11 @@ static void rga_cmd_set(struct rga_ctx *ctx,
> =C2=A0	rga_cmd_set_dst_info(ctx, &dst->offset);
> =C2=A0	rga_cmd_set_trans_info(ctx);
> =C2=A0
> -	rga_write(rga, RGA_CMD_BASE, rga->cmdbuf_phy);
> +	rga_write(rga, RGA_CMD_BASE, ctx->cmdbuf_phy);
> =C2=A0
> =C2=A0	/* sync CMD buf for RGA */
> -	dma_sync_single_for_device(rga->dev, rga->cmdbuf_phy,
> -		PAGE_SIZE, DMA_BIDIRECTIONAL);
> +	dma_sync_single_for_device(rga->dev, ctx->cmdbuf_phy,
> +				=C2=A0=C2=A0 PAGE_SIZE, DMA_BIDIRECTIONAL);
> =C2=A0}
> =C2=A0
> =C2=A0static void rga_hw_start(struct rockchip_rga *rga,
> diff --git a/drivers/media/platform/rockchip/rga/rga.c
> b/drivers/media/platform/rockchip/rga/rga.c
> index d8b14c2d9f6a4..74d94c7fe31ff 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -219,6 +219,16 @@ static int rga_open(struct file *file)
> =C2=A0	ctx =3D kzalloc(sizeof(*ctx), GFP_KERNEL);
> =C2=A0	if (!ctx)
> =C2=A0		return -ENOMEM;
> +
> +	/* Create CMD buffer */
> +	ctx->cmdbuf_virt =3D dma_alloc_attrs(rga->dev, rga->hw->cmdbuf_size,
> +					=C2=A0=C2=A0 &ctx->cmdbuf_phy, GFP_KERNEL,
> +					=C2=A0=C2=A0 DMA_ATTR_WRITE_COMBINE);
> +	if (!ctx->cmdbuf_virt) {
> +		ret =3D -ENOMEM;
> +		goto rel_ctx;
> +	}
> +
> =C2=A0	ctx->rga =3D rga;
> =C2=A0	/* Set default formats */
> =C2=A0	ctx->in =3D def_frame;
> @@ -230,15 +240,13 @@ static int rga_open(struct file *file)
> =C2=A0			=C2=A0=C2=A0=C2=A0 ctx->out.fmt->fourcc, def_width, def_height);
> =C2=A0
> =C2=A0	if (mutex_lock_interruptible(&rga->mutex)) {
> -		kfree(ctx);
> -		return -ERESTARTSYS;
> +		ret =3D -ERESTARTSYS;
> +		goto rel_cmdbuf;
> =C2=A0	}
> =C2=A0	ctx->fh.m2m_ctx =3D v4l2_m2m_ctx_init(rga->m2m_dev, ctx, &queue_in=
it);
> =C2=A0	if (IS_ERR(ctx->fh.m2m_ctx)) {
> =C2=A0		ret =3D PTR_ERR(ctx->fh.m2m_ctx);
> -		mutex_unlock(&rga->mutex);
> -		kfree(ctx);
> -		return ret;
> +		goto unlock_mutex;
> =C2=A0	}
> =C2=A0	v4l2_fh_init(&ctx->fh, video_devdata(file));
> =C2=A0	v4l2_fh_add(&ctx->fh, file);
> @@ -252,6 +260,15 @@ static int rga_open(struct file *file)
> =C2=A0	mutex_unlock(&rga->mutex);
> =C2=A0
> =C2=A0	return 0;
> +
> +unlock_mutex:
> +	mutex_unlock(&rga->mutex);
> +rel_cmdbuf:
> +	dma_free_attrs(rga->dev, rga->hw->cmdbuf_size, ctx->cmdbuf_virt,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ctx->cmdbuf_phy, DMA_ATTR_WRITE_C=
OMBINE);
> +rel_ctx:
> +	kfree(ctx);
> +	return ret;
> =C2=A0}
> =C2=A0
> =C2=A0static int rga_release(struct file *file)
> @@ -266,6 +283,10 @@ static int rga_release(struct file *file)
> =C2=A0	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
> =C2=A0	v4l2_fh_del(&ctx->fh, file);
> =C2=A0	v4l2_fh_exit(&ctx->fh);
> +
> +	dma_free_attrs(rga->dev, rga->hw->cmdbuf_size, ctx->cmdbuf_virt,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ctx->cmdbuf_phy, DMA_ATTR_WRITE_C=
OMBINE);
> +
> =C2=A0	kfree(ctx);
> =C2=A0
> =C2=A0	mutex_unlock(&rga->mutex);
> @@ -674,19 +695,10 @@ static int rga_probe(struct platform_device *pdev)
> =C2=A0
> =C2=A0	pm_runtime_put(rga->dev);
> =C2=A0
> -	/* Create CMD buffer */
> -	rga->cmdbuf_virt =3D dma_alloc_attrs(rga->dev, rga->hw->cmdbuf_size,
> -					=C2=A0=C2=A0 &rga->cmdbuf_phy, GFP_KERNEL,
> -					=C2=A0=C2=A0 DMA_ATTR_WRITE_COMBINE);
> -	if (!rga->cmdbuf_virt) {
> -		ret =3D -ENOMEM;
> -		goto rel_m2m;
> -	}
> -
> =C2=A0	ret =3D video_register_device(vfd, VFL_TYPE_VIDEO, -1);
> =C2=A0	if (ret) {
> =C2=A0		v4l2_err(&rga->v4l2_dev, "Failed to register video
> device\n");
> -		goto free_dma;
> +		goto rel_m2m;
> =C2=A0	}
> =C2=A0
> =C2=A0	v4l2_info(&rga->v4l2_dev, "Registered %s as /dev/%s\n",
> @@ -694,9 +706,6 @@ static int rga_probe(struct platform_device *pdev)
> =C2=A0
> =C2=A0	return 0;
> =C2=A0
> -free_dma:
> -	dma_free_attrs(rga->dev, rga->hw->cmdbuf_size, rga->cmdbuf_virt,
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rga->cmdbuf_phy, DMA_ATTR_WRITE_C=
OMBINE);
> =C2=A0rel_m2m:
> =C2=A0	v4l2_m2m_release(rga->m2m_dev);
> =C2=A0rel_vdev:
> @@ -713,9 +722,6 @@ static void rga_remove(struct platform_device *pdev)
> =C2=A0{
> =C2=A0	struct rockchip_rga *rga =3D platform_get_drvdata(pdev);
> =C2=A0
> -	dma_free_attrs(rga->dev, rga->hw->cmdbuf_size, rga->cmdbuf_virt,
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rga->cmdbuf_phy, DMA_ATTR_WRITE_C=
OMBINE);
> -
> =C2=A0	v4l2_info(&rga->v4l2_dev, "Removing\n");
> =C2=A0
> =C2=A0	v4l2_m2m_release(rga->m2m_dev);
> diff --git a/drivers/media/platform/rockchip/rga/rga.h
> b/drivers/media/platform/rockchip/rga/rga.h
> index 98635ddd50d7c..f8c932fdec21a 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -56,6 +56,9 @@ struct rga_ctx {
> =C2=A0	struct rga_frame out;
> =C2=A0	struct v4l2_ctrl_handler ctrl_handler;
> =C2=A0
> +	void *cmdbuf_virt;
> +	dma_addr_t cmdbuf_phy;
> +
> =C2=A0	int osequence;
> =C2=A0	int csequence;
> =C2=A0
> @@ -91,8 +94,6 @@ struct rockchip_rga {
> =C2=A0	spinlock_t ctrl_lock;
> =C2=A0
> =C2=A0	struct rga_ctx *curr;
> -	dma_addr_t cmdbuf_phy;
> -	void *cmdbuf_virt;
> =C2=A0
> =C2=A0	const struct rga_hw *hw;
> =C2=A0};

--=-Nrb1QznaERS51PvTN0N7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUwE5gAKCRDZQZRRKWBy
9C9uAP9miq59sr/4j3qDWKc9/Ke2pvtoDrTF57xX00GfHHVmYgEA1wVhsn7Yp5xi
QSyuOdd0uR2bq8rAKFW/dRx9gAReywY=
=fSqW
-----END PGP SIGNATURE-----

--=-Nrb1QznaERS51PvTN0N7--

