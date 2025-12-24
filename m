Return-Path: <linux-media+bounces-49487-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BC8CDCA08
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 16:06:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4308300942E
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 15:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61F8D344053;
	Wed, 24 Dec 2025 15:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="r3kXzz5N"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2477D27B4FB
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 15:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766588763; cv=none; b=F4VwLSNGytNBgFLhMc/U950DCZqnLGbRRuVR5kTLI6vUVkT9q7m2/QsaztcOSnnxfIn0zeiTd67mlahC9aAqHttHU6UATZOe6Vfd5l7XNHovUAEp2mQL2bhYbiLmEwRe8sjhOf8jeBJ33YQ1xC9d5ke4RKZ6M8n3o4B0QHhRMrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766588763; c=relaxed/simple;
	bh=3yU1n9eIyN3B3Aq4V79jmgq1icTynfJn8OFcolLCJts=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=de8GVR6PNMXgXQpHpfacuPv1IU1nySYxSjMCGvKYWdC2R8m5WrYCfwkLfVmwbkw5kZ7WYrJQ1WurpBK7mSwq93cBfu7RTrApDN9QCL/ZrBKnsxhsqH+O7xp9+7ASMBFyF8bgme1/9+9nv4V6HJ9b4KYLBkmOr+W9es2tF1NZydM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=r3kXzz5N; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4edb6e678ddso86404431cf.2
        for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 07:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1766588759; x=1767193559; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/sj1HHExKGWlQ/Xby6VMx9FFovM/8nIk9CS7FFzB9X8=;
        b=r3kXzz5N6qdN4wwtaDLVXe/RpJ3jLnWE2nDkWylwaFSRWVppY0EdqA9S0kYcemkXQY
         K01iMcUfR1VNcIQB588d5GmmxgHwu5skI6paKwYdsARs3g261IA8IOm62fT50+MfaKtx
         rn4UWP+OmXUyMlkouIm50eI+RCUl3j2Nq+FskGIGSSKYyuwMz6BmJAWsOdU5AyL3hsek
         zxShq/qmVCl+Xtrq3VYPWe2sNO04F5XqcHVtb8CPRzoAwAvFVaFPkzbY3XzpqCIJIzNK
         UaIdb10D2v/YZyDrnhCN+grqDXNkdo1rJjqW3aKbyFhdZogOufXOypnOzTvbk+FoxSEI
         a8Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766588759; x=1767193559;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/sj1HHExKGWlQ/Xby6VMx9FFovM/8nIk9CS7FFzB9X8=;
        b=mOl/Nz63UtCgnUJDjZzjTE0AOfg50oi3Clbg6ZOYD86ZX3N6P3hONXi64G2XdFMFWL
         orT2H+jb3ar5AEOzGs98Azh957zoPb0H3nlpkGeHQ5j2yiGGW267ADMuyIayS/cjre5Q
         +MRFNGd0rdLrjvd85xRLPOpigWuGa1NuOEYxIHYQdvHQQlu20U5xieRL6InkXnUmiHpD
         21KjhfCaV/lrc5IoAiXTgrMu4CpLSmIMmW8loHcIIEciC7ThgtLujNyXm76HkMRWrRY/
         5Z7ALOCkurs0ErVrGwfCOXzrkhzdhMttsPBxj7kGC26HZhC0xAP/ASsU2h5imFxlmrgX
         5bAA==
X-Gm-Message-State: AOJu0YyLbCpBOm1QfgIo/7IbXLEAQbv1L8e8pCgGOKYla9OkUMTC1nFC
	YjXr7oLkaWr9hziQJsnxGQVj38WVGY60kidV6FKyqyMY4sEacJZn+qPPWyTahEang74=
X-Gm-Gg: AY/fxX61VBiydFLs727J6sDcgW2nyq/ILc8Sh86gvqKKc/wuIv49Gb5Ij/4f0n8LzXu
	ciqUZIEUE9GTtF1VJImmJUhGyTw/kieuB5l1JD/kB0G/kmEzShCvLLYYsKhaYcy5IvrQsePJfhE
	/C9c3xgymowUkFPMlToIaYxMV0/e+QKasCD0wkpw78KydoVFmglTv0roFyQGGRvHTJnmrMBrk1d
	MxurRH75csvNbRL5ZjEEamGaPqU7uYKME9oNEE3+O7TEncXu2fltdlMuNvgSTjV1nrTVny7ykfG
	xhktfqbw+lXZ0S+Lakx7rF/P4qcqeNbLlFYN9pm2+YVQTycdM4SvcrTtlE5tBLcJCTDRLX5LDY2
	Df7MYP30EzeR+pRphCChALf+cZeufk5usFd5C8pqnp6sZhsyN3ywWKgCWp+TgfwSg9XAPSpmb0H
	BV6oCR56UcZED9ZiCj
X-Google-Smtp-Source: AGHT+IETvBu+Guk12OJYgN5ssBD4uU83lBcS6wq53EZP7h8ORV81/fvJfk/oT/mQb3cIMhQp0AxXLg==
X-Received: by 2002:a05:622a:1345:b0:4ee:1db1:a605 with SMTP id d75a77b69052e-4f4abcd8b3fmr302509791cf.20.1766588758799;
        Wed, 24 Dec 2025 07:05:58 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac62d53dsm126478521cf.19.2025.12.24.07.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 07:05:58 -0800 (PST)
Message-ID: <be6c72090cdbf79d86dab5cc75a05db81cd1585c.camel@ndufresne.ca>
Subject: Re: [PATCH v2 07/22] media: rockchip: rga: move hw specific parts
 to a dedicated struct
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
Date: Wed, 24 Dec 2025 10:05:57 -0500
In-Reply-To: <20251203-spu-rga3-v2-7-989a67947f71@pengutronix.de>
References: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
	 <20251203-spu-rga3-v2-7-989a67947f71@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-awLPo3pA3zArYr6dvmmF"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-awLPo3pA3zArYr6dvmmF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 03 d=C3=A9cembre 2025 =C3=A0 16:52 +0100, Sven P=C3=BCschel a =
=C3=A9crit=C2=A0:
> In preparation for the RGA3 unit, move RGA2 specific parts from rga.c
> to rga-hw.c and create a struct to reference the RGA2 specific functions
> and formats. This also allows to remove the rga-hw.h reference from the
> include list of the rga driver.
>=20
> Also document the command finish interrupt with a dedicated define.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga-hw.c | 183 ++++++++++++++++=
++++-
> =C2=A0drivers/media/platform/rockchip/rga/rga-hw.h |=C2=A0=C2=A0 5 +-
> =C2=A0drivers/media/platform/rockchip/rga/rga.c=C2=A0=C2=A0=C2=A0 | 228 +=
++++----------------------
> =C2=A0drivers/media/platform/rockchip/rga/rga.h=C2=A0=C2=A0=C2=A0 |=C2=A0=
 23 ++-
> =C2=A04 files changed, 245 insertions(+), 194 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media=
/platform/rockchip/rga/rga-hw.c
> index f1d5237472941..7419784efc693 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> @@ -437,8 +437,8 @@ static void rga_cmd_set(struct rga_ctx *ctx,
> =C2=A0		PAGE_SIZE, DMA_BIDIRECTIONAL);
> =C2=A0}
> =C2=A0
> -void rga_hw_start(struct rockchip_rga *rga,
> -		=C2=A0 struct rga_vb_buffer *src, struct rga_vb_buffer *dst)
> +static void rga_hw_start(struct rockchip_rga *rga,
> +			 struct rga_vb_buffer *src,=C2=A0 struct rga_vb_buffer *dst)
> =C2=A0{
> =C2=A0	struct rga_ctx *ctx =3D rga->curr;
> =C2=A0
> @@ -452,3 +452,182 @@ void rga_hw_start(struct rockchip_rga *rga,
> =C2=A0
> =C2=A0	rga_write(rga, RGA_CMD_CTRL, 0x1);
> =C2=A0}
> +
> +static bool rga_handle_irq(struct rockchip_rga *rga)
> +{
> +	int intr;
> +
> +	intr =3D rga_read(rga, RGA_INT) & 0xf;
> +
> +	rga_mod(rga, RGA_INT, intr << 4, 0xf << 4);
> +
> +	return intr & RGA_INT_COMMAND_FINISHED;
> +}
> +
> +static void rga_get_version(struct rockchip_rga *rga)
> +{
> +	rga->version.major =3D (rga_read(rga, RGA_VERSION_INFO) >> 24) & 0xFF;
> +	rga->version.minor =3D (rga_read(rga, RGA_VERSION_INFO) >> 20) & 0x0F;
> +}
> +
> +static struct rga_fmt formats[] =3D {
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_ARGB32,
> +		.color_swap =3D RGA_COLOR_ALPHA_SWAP,
> +		.hw_format =3D RGA_COLOR_FMT_ABGR8888,
> +		.depth =3D 32,
> +		.uv_factor =3D 1,
> +		.y_div =3D 1,
> +		.x_div =3D 1,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_ABGR32,
> +		.color_swap =3D RGA_COLOR_RB_SWAP,
> +		.hw_format =3D RGA_COLOR_FMT_ABGR8888,
> +		.depth =3D 32,
> +		.uv_factor =3D 1,
> +		.y_div =3D 1,
> +		.x_div =3D 1,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_XBGR32,
> +		.color_swap =3D RGA_COLOR_RB_SWAP,
> +		.hw_format =3D RGA_COLOR_FMT_XBGR8888,
> +		.depth =3D 32,
> +		.uv_factor =3D 1,
> +		.y_div =3D 1,
> +		.x_div =3D 1,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_RGB24,
> +		.color_swap =3D RGA_COLOR_NONE_SWAP,
> +		.hw_format =3D RGA_COLOR_FMT_RGB888,
> +		.depth =3D 24,
> +		.uv_factor =3D 1,
> +		.y_div =3D 1,
> +		.x_div =3D 1,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_BGR24,
> +		.color_swap =3D RGA_COLOR_RB_SWAP,
> +		.hw_format =3D RGA_COLOR_FMT_RGB888,
> +		.depth =3D 24,
> +		.uv_factor =3D 1,
> +		.y_div =3D 1,
> +		.x_div =3D 1,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_ARGB444,
> +		.color_swap =3D RGA_COLOR_RB_SWAP,
> +		.hw_format =3D RGA_COLOR_FMT_ABGR4444,
> +		.depth =3D 16,
> +		.uv_factor =3D 1,
> +		.y_div =3D 1,
> +		.x_div =3D 1,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_ARGB555,
> +		.color_swap =3D RGA_COLOR_RB_SWAP,
> +		.hw_format =3D RGA_COLOR_FMT_ABGR1555,
> +		.depth =3D 16,
> +		.uv_factor =3D 1,
> +		.y_div =3D 1,
> +		.x_div =3D 1,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_RGB565,
> +		.color_swap =3D RGA_COLOR_RB_SWAP,
> +		.hw_format =3D RGA_COLOR_FMT_BGR565,
> +		.depth =3D 16,
> +		.uv_factor =3D 1,
> +		.y_div =3D 1,
> +		.x_div =3D 1,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_NV21,
> +		.color_swap =3D RGA_COLOR_UV_SWAP,
> +		.hw_format =3D RGA_COLOR_FMT_YUV420SP,
> +		.depth =3D 12,
> +		.uv_factor =3D 4,
> +		.y_div =3D 2,
> +		.x_div =3D 1,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_NV61,
> +		.color_swap =3D RGA_COLOR_UV_SWAP,
> +		.hw_format =3D RGA_COLOR_FMT_YUV422SP,
> +		.depth =3D 16,
> +		.uv_factor =3D 2,
> +		.y_div =3D 1,
> +		.x_div =3D 1,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_NV12,
> +		.color_swap =3D RGA_COLOR_NONE_SWAP,
> +		.hw_format =3D RGA_COLOR_FMT_YUV420SP,
> +		.depth =3D 12,
> +		.uv_factor =3D 4,
> +		.y_div =3D 2,
> +		.x_div =3D 1,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_NV12M,
> +		.color_swap =3D RGA_COLOR_NONE_SWAP,
> +		.hw_format =3D RGA_COLOR_FMT_YUV420SP,
> +		.depth =3D 12,
> +		.uv_factor =3D 4,
> +		.y_div =3D 2,
> +		.x_div =3D 1,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_NV16,
> +		.color_swap =3D RGA_COLOR_NONE_SWAP,
> +		.hw_format =3D RGA_COLOR_FMT_YUV422SP,
> +		.depth =3D 16,
> +		.uv_factor =3D 2,
> +		.y_div =3D 1,
> +		.x_div =3D 1,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_YUV420,
> +		.color_swap =3D RGA_COLOR_NONE_SWAP,
> +		.hw_format =3D RGA_COLOR_FMT_YUV420P,
> +		.depth =3D 12,
> +		.uv_factor =3D 4,
> +		.y_div =3D 2,
> +		.x_div =3D 2,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_YUV422P,
> +		.color_swap =3D RGA_COLOR_NONE_SWAP,
> +		.hw_format =3D RGA_COLOR_FMT_YUV422P,
> +
> +		.depth =3D 16,
> +		.uv_factor =3D 2,
> +		.y_div =3D 1,
> +		.x_div =3D 2,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_YVU420,
> +		.color_swap =3D RGA_COLOR_UV_SWAP,
> +		.hw_format =3D RGA_COLOR_FMT_YUV420P,
> +		.depth =3D 12,
> +		.uv_factor =3D 4,
> +		.y_div =3D 2,
> +		.x_div =3D 2,
> +	},
> +};
> +
> +const struct rga_hw rga2_hw =3D {
> +	.formats =3D formats,
> +	.num_formats =3D ARRAY_SIZE(formats),
> +	.cmdbuf_size =3D RGA_CMDBUF_SIZE,
> +	.min_width =3D MIN_WIDTH,
> +	.max_width =3D MAX_WIDTH,
> +	.min_height =3D MIN_HEIGHT,
> +	.max_height =3D MAX_HEIGHT,
> +
> +	.start =3D rga_hw_start,
> +	.handle_irq =3D rga_handle_irq,
> +	.get_version =3D rga_get_version,
> +};
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.h b/drivers/media=
/platform/rockchip/rga/rga-hw.h
> index cc6bd7f5b0300..f4752aa823051 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.h
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.h
> @@ -15,9 +15,6 @@
> =C2=A0#define MIN_WIDTH 34
> =C2=A0#define MIN_HEIGHT 34
> =C2=A0
> -#define DEFAULT_WIDTH 100
> -#define DEFAULT_HEIGHT 100
> -
> =C2=A0#define RGA_TIMEOUT 500
> =C2=A0
> =C2=A0/* Registers address */
> @@ -178,6 +175,8 @@
> =C2=A0#define RGA_ALPHA_COLOR_NORMAL 0
> =C2=A0#define RGA_ALPHA_COLOR_MULTIPLY_CAL 1
> =C2=A0
> +#define RGA_INT_COMMAND_FINISHED 4
> +
> =C2=A0/* Registers union */
> =C2=A0union rga_mode_ctrl {
> =C2=A0	unsigned int val;
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index f50fbbab0645e..d8b14c2d9f6a4 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -25,7 +25,6 @@
> =C2=A0#include <media/videobuf2-dma-sg.h>
> =C2=A0#include <media/videobuf2-v4l2.h>
> =C2=A0
> -#include "rga-hw.h"
> =C2=A0#include "rga.h"
> =C2=A0
> =C2=A0static int debug;
> @@ -47,7 +46,7 @@ static void device_run(void *prv)
> =C2=A0
> =C2=A0	dst =3D v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> =C2=A0
> -	rga_hw_start(rga, vb_to_rga(src), vb_to_rga(dst));
> +	rga->hw->start(rga, vb_to_rga(src), vb_to_rga(dst));
> =C2=A0
> =C2=A0	spin_unlock_irqrestore(&rga->ctrl_lock, flags);
> =C2=A0}
> @@ -55,13 +54,8 @@ static void device_run(void *prv)
> =C2=A0static irqreturn_t rga_isr(int irq, void *prv)
> =C2=A0{
> =C2=A0	struct rockchip_rga *rga =3D prv;
> -	int intr;
> =C2=A0
> -	intr =3D rga_read(rga, RGA_INT) & 0xf;
> -
> -	rga_mod(rga, RGA_INT, intr << 4, 0xf << 4);
> -
> -	if (intr & 0x04) {
> +	if (rga->hw->handle_irq(rga)) {
> =C2=A0		struct vb2_v4l2_buffer *src, *dst;
> =C2=A0		struct rga_ctx *ctx =3D rga->curr;
> =C2=A0
> @@ -184,174 +178,17 @@ static int rga_setup_ctrls(struct rga_ctx *ctx)
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> -static struct rga_fmt formats[] =3D {
> -	{
> -		.fourcc =3D V4L2_PIX_FMT_ARGB32,
> -		.color_swap =3D RGA_COLOR_ALPHA_SWAP,
> -		.hw_format =3D RGA_COLOR_FMT_ABGR8888,
> -		.depth =3D 32,
> -		.uv_factor =3D 1,
> -		.y_div =3D 1,
> -		.x_div =3D 1,
> -	},
> -	{
> -		.fourcc =3D V4L2_PIX_FMT_ABGR32,
> -		.color_swap =3D RGA_COLOR_RB_SWAP,
> -		.hw_format =3D RGA_COLOR_FMT_ABGR8888,
> -		.depth =3D 32,
> -		.uv_factor =3D 1,
> -		.y_div =3D 1,
> -		.x_div =3D 1,
> -	},
> -	{
> -		.fourcc =3D V4L2_PIX_FMT_XBGR32,
> -		.color_swap =3D RGA_COLOR_RB_SWAP,
> -		.hw_format =3D RGA_COLOR_FMT_XBGR8888,
> -		.depth =3D 32,
> -		.uv_factor =3D 1,
> -		.y_div =3D 1,
> -		.x_div =3D 1,
> -	},
> -	{
> -		.fourcc =3D V4L2_PIX_FMT_RGB24,
> -		.color_swap =3D RGA_COLOR_NONE_SWAP,
> -		.hw_format =3D RGA_COLOR_FMT_RGB888,
> -		.depth =3D 24,
> -		.uv_factor =3D 1,
> -		.y_div =3D 1,
> -		.x_div =3D 1,
> -	},
> -	{
> -		.fourcc =3D V4L2_PIX_FMT_BGR24,
> -		.color_swap =3D RGA_COLOR_RB_SWAP,
> -		.hw_format =3D RGA_COLOR_FMT_RGB888,
> -		.depth =3D 24,
> -		.uv_factor =3D 1,
> -		.y_div =3D 1,
> -		.x_div =3D 1,
> -	},
> -	{
> -		.fourcc =3D V4L2_PIX_FMT_ARGB444,
> -		.color_swap =3D RGA_COLOR_RB_SWAP,
> -		.hw_format =3D RGA_COLOR_FMT_ABGR4444,
> -		.depth =3D 16,
> -		.uv_factor =3D 1,
> -		.y_div =3D 1,
> -		.x_div =3D 1,
> -	},
> -	{
> -		.fourcc =3D V4L2_PIX_FMT_ARGB555,
> -		.color_swap =3D RGA_COLOR_RB_SWAP,
> -		.hw_format =3D RGA_COLOR_FMT_ABGR1555,
> -		.depth =3D 16,
> -		.uv_factor =3D 1,
> -		.y_div =3D 1,
> -		.x_div =3D 1,
> -	},
> -	{
> -		.fourcc =3D V4L2_PIX_FMT_RGB565,
> -		.color_swap =3D RGA_COLOR_RB_SWAP,
> -		.hw_format =3D RGA_COLOR_FMT_BGR565,
> -		.depth =3D 16,
> -		.uv_factor =3D 1,
> -		.y_div =3D 1,
> -		.x_div =3D 1,
> -	},
> -	{
> -		.fourcc =3D V4L2_PIX_FMT_NV21,
> -		.color_swap =3D RGA_COLOR_UV_SWAP,
> -		.hw_format =3D RGA_COLOR_FMT_YUV420SP,
> -		.depth =3D 12,
> -		.uv_factor =3D 4,
> -		.y_div =3D 2,
> -		.x_div =3D 1,
> -	},
> -	{
> -		.fourcc =3D V4L2_PIX_FMT_NV61,
> -		.color_swap =3D RGA_COLOR_UV_SWAP,
> -		.hw_format =3D RGA_COLOR_FMT_YUV422SP,
> -		.depth =3D 16,
> -		.uv_factor =3D 2,
> -		.y_div =3D 1,
> -		.x_div =3D 1,
> -	},
> -	{
> -		.fourcc =3D V4L2_PIX_FMT_NV12,
> -		.color_swap =3D RGA_COLOR_NONE_SWAP,
> -		.hw_format =3D RGA_COLOR_FMT_YUV420SP,
> -		.depth =3D 12,
> -		.uv_factor =3D 4,
> -		.y_div =3D 2,
> -		.x_div =3D 1,
> -	},
> -	{
> -		.fourcc =3D V4L2_PIX_FMT_NV12M,
> -		.color_swap =3D RGA_COLOR_NONE_SWAP,
> -		.hw_format =3D RGA_COLOR_FMT_YUV420SP,
> -		.depth =3D 12,
> -		.uv_factor =3D 4,
> -		.y_div =3D 2,
> -		.x_div =3D 1,
> -	},
> -	{
> -		.fourcc =3D V4L2_PIX_FMT_NV16,
> -		.color_swap =3D RGA_COLOR_NONE_SWAP,
> -		.hw_format =3D RGA_COLOR_FMT_YUV422SP,
> -		.depth =3D 16,
> -		.uv_factor =3D 2,
> -		.y_div =3D 1,
> -		.x_div =3D 1,
> -	},
> -	{
> -		.fourcc =3D V4L2_PIX_FMT_YUV420,
> -		.color_swap =3D RGA_COLOR_NONE_SWAP,
> -		.hw_format =3D RGA_COLOR_FMT_YUV420P,
> -		.depth =3D 12,
> -		.uv_factor =3D 4,
> -		.y_div =3D 2,
> -		.x_div =3D 2,
> -	},
> -	{
> -		.fourcc =3D V4L2_PIX_FMT_YUV422P,
> -		.color_swap =3D RGA_COLOR_NONE_SWAP,
> -		.hw_format =3D RGA_COLOR_FMT_YUV422P,
> -		.depth =3D 16,
> -		.uv_factor =3D 2,
> -		.y_div =3D 1,
> -		.x_div =3D 2,
> -	},
> -	{
> -		.fourcc =3D V4L2_PIX_FMT_YVU420,
> -		.color_swap =3D RGA_COLOR_UV_SWAP,
> -		.hw_format =3D RGA_COLOR_FMT_YUV420P,
> -		.depth =3D 12,
> -		.uv_factor =3D 4,
> -		.y_div =3D 2,
> -		.x_div =3D 2,
> -	},
> -};
> -
> -#define NUM_FORMATS ARRAY_SIZE(formats)
> -
> -static struct rga_fmt *rga_fmt_find(u32 pixelformat)
> +static struct rga_fmt *rga_fmt_find(struct rockchip_rga *rga, u32 pixelf=
ormat)
> =C2=A0{
> =C2=A0	unsigned int i;
> =C2=A0
> -	for (i =3D 0; i < NUM_FORMATS; i++) {
> -		if (formats[i].fourcc =3D=3D pixelformat)
> -			return &formats[i];
> +	for (i =3D 0; i < rga->hw->num_formats; i++) {
> +		if (rga->hw->formats[i].fourcc =3D=3D pixelformat)
> +			return &rga->hw->formats[i];
> =C2=A0	}
> =C2=A0	return NULL;
> =C2=A0}
> =C2=A0
> -static struct rga_frame def_frame =3D {
> -	.crop.left =3D 0,
> -	.crop.top =3D 0,
> -	.crop.width =3D DEFAULT_WIDTH,
> -	.crop.height =3D DEFAULT_HEIGHT,
> -	.fmt =3D &formats[0],
> -};
> -
> =C2=A0struct rga_frame *rga_get_frame(struct rga_ctx *ctx, enum v4l2_buf_=
type type)
> =C2=A0{
> =C2=A0	if (V4L2_TYPE_IS_OUTPUT(type))
> @@ -366,6 +203,18 @@ static int rga_open(struct file *file)
> =C2=A0	struct rockchip_rga *rga =3D video_drvdata(file);
> =C2=A0	struct rga_ctx *ctx =3D NULL;
> =C2=A0	int ret =3D 0;
> +	u32 def_width =3D clamp(DEFAULT_WIDTH, rga->hw->min_width, rga->hw->max=
_width);
> +	u32 def_height =3D clamp(DEFAULT_HEIGHT, rga->hw->min_height, rga->hw->=
max_height);
> +	struct rga_frame def_frame =3D {
> +		.crop.left =3D 0,
> +		.crop.top =3D 0,
> +		.crop.width =3D def_width,
> +		.crop.height =3D def_height,
> +		.fmt =3D &rga->hw->formats[0],
> +	};
> +
> +	def_frame.stride =3D (def_width * def_frame.fmt->depth) >> 3;
> +	def_frame.size =3D def_frame.stride * def_height;
> =C2=A0
> =C2=A0	ctx =3D kzalloc(sizeof(*ctx), GFP_KERNEL);
> =C2=A0	if (!ctx)
> @@ -376,9 +225,9 @@ static int rga_open(struct file *file)
> =C2=A0	ctx->out =3D def_frame;
> =C2=A0
> =C2=A0	v4l2_fill_pixfmt_mp(&ctx->in.pix,
> -			=C2=A0=C2=A0=C2=A0 ctx->in.fmt->fourcc, DEFAULT_WIDTH, DEFAULT_HEIGHT=
);
> +			=C2=A0=C2=A0=C2=A0 ctx->in.fmt->fourcc, def_width, def_height);
> =C2=A0	v4l2_fill_pixfmt_mp(&ctx->out.pix,
> -			=C2=A0=C2=A0=C2=A0 ctx->out.fmt->fourcc, DEFAULT_WIDTH, DEFAULT_HEIGH=
T);
> +			=C2=A0=C2=A0=C2=A0 ctx->out.fmt->fourcc, def_width, def_height);
> =C2=A0
> =C2=A0	if (mutex_lock_interruptible(&rga->mutex)) {
> =C2=A0		kfree(ctx);
> @@ -445,12 +294,13 @@ vidioc_querycap(struct file *file, void *priv, stru=
ct v4l2_capability *cap)
> =C2=A0
> =C2=A0static int vidioc_enum_fmt(struct file *file, void *priv, struct v4=
l2_fmtdesc *f)
> =C2=A0{
> +	struct rockchip_rga *rga =3D video_drvdata(file);
> =C2=A0	struct rga_fmt *fmt;
> =C2=A0
> -	if (f->index >=3D NUM_FORMATS)
> +	if (f->index >=3D rga->hw->num_formats)
> =C2=A0		return -EINVAL;
> =C2=A0
> -	fmt =3D &formats[f->index];
> +	fmt =3D &rga->hw->formats[f->index];
> =C2=A0	f->pixelformat =3D fmt->fourcc;
> =C2=A0
> =C2=A0	return 0;
> @@ -475,16 +325,18 @@ static int vidioc_g_fmt(struct file *file, void *pr=
iv, struct v4l2_format *f)
> =C2=A0static int vidioc_try_fmt(struct file *file, void *priv, struct v4l=
2_format *f)
> =C2=A0{
> =C2=A0	struct v4l2_pix_format_mplane *pix_fmt =3D &f->fmt.pix_mp;
> +	struct rockchip_rga *rga =3D video_drvdata(file);
> +	const struct rga_hw *hw =3D rga->hw;
> =C2=A0	struct rga_fmt *fmt;
> =C2=A0
> -	fmt =3D rga_fmt_find(pix_fmt->pixelformat);
> +	fmt =3D rga_fmt_find(rga, pix_fmt->pixelformat);
> =C2=A0	if (!fmt)
> -		fmt =3D &formats[0];
> +		fmt =3D &hw->formats[0];
> =C2=A0
> =C2=A0	pix_fmt->width =3D clamp(pix_fmt->width,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (u32)MIN_WIDTH, (u32)MAX_WIDTH);
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hw->min_width, hw->max_width);
> =C2=A0	pix_fmt->height =3D clamp(pix_fmt->height,
> -				(u32)MIN_HEIGHT, (u32)MAX_HEIGHT);
> +				hw->min_height, hw->max_height);
> =C2=A0
> =C2=A0	v4l2_fill_pixfmt_mp(pix_fmt, fmt->fourcc, pix_fmt->width, pix_fmt-=
>height);
> =C2=A0	pix_fmt->field =3D V4L2_FIELD_NONE;
> @@ -519,7 +371,7 @@ static int vidioc_s_fmt(struct file *file, void *priv=
, struct v4l2_format *f)
> =C2=A0	frm->size =3D 0;
> =C2=A0	for (i =3D 0; i < pix_fmt->num_planes; i++)
> =C2=A0		frm->size +=3D pix_fmt->plane_fmt[i].sizeimage;
> -	frm->fmt =3D rga_fmt_find(pix_fmt->pixelformat);
> +	frm->fmt =3D rga_fmt_find(rga, pix_fmt->pixelformat);
> =C2=A0	frm->stride =3D pix_fmt->plane_fmt[0].bytesperline;
> =C2=A0
> =C2=A0	/* Reset crop settings */
> @@ -639,7 +491,7 @@ static int vidioc_s_selection(struct file *file, void=
 *priv,
> =C2=A0
> =C2=A0	if (s->r.left + s->r.width > f->pix.width ||
> =C2=A0	=C2=A0=C2=A0=C2=A0 s->r.top + s->r.height > f->pix.height ||
> -	=C2=A0=C2=A0=C2=A0 s->r.width < MIN_WIDTH || s->r.height < MIN_HEIGHT) =
{
> +	=C2=A0=C2=A0=C2=A0 s->r.width < rga->hw->min_width || s->r.height < rga=
->hw->min_height) {
> =C2=A0		v4l2_dbg(debug, 1, &rga->v4l2_dev, "unsupported crop value.\n");
> =C2=A0		return -EINVAL;
> =C2=A0	}
> @@ -748,6 +600,10 @@ static int rga_probe(struct platform_device *pdev)
> =C2=A0	if (!rga)
> =C2=A0		return -ENOMEM;
> =C2=A0
> +	rga->hw =3D of_device_get_match_data(&pdev->dev);
> +	if (!rga->hw)
> +		return dev_err_probe(&pdev->dev, -ENODEV, "failed to get match data\n"=
);
> +
> =C2=A0	rga->dev =3D &pdev->dev;
> =C2=A0	spin_lock_init(&rga->ctrl_lock);
> =C2=A0	mutex_init(&rga->mutex);
> @@ -811,8 +667,7 @@ static int rga_probe(struct platform_device *pdev)
> =C2=A0	if (ret < 0)
> =C2=A0		goto rel_m2m;
> =C2=A0
> -	rga->version.major =3D (rga_read(rga, RGA_VERSION_INFO) >> 24) & 0xFF;
> -	rga->version.minor =3D (rga_read(rga, RGA_VERSION_INFO) >> 20) & 0x0F;
> +	rga->hw->get_version(rga);
> =C2=A0
> =C2=A0	v4l2_info(&rga->v4l2_dev, "HW Version: 0x%02x.%02x\n",
> =C2=A0		=C2=A0 rga->version.major, rga->version.minor);
> @@ -820,7 +675,7 @@ static int rga_probe(struct platform_device *pdev)
> =C2=A0	pm_runtime_put(rga->dev);
> =C2=A0
> =C2=A0	/* Create CMD buffer */
> -	rga->cmdbuf_virt =3D dma_alloc_attrs(rga->dev, RGA_CMDBUF_SIZE,
> +	rga->cmdbuf_virt =3D dma_alloc_attrs(rga->dev, rga->hw->cmdbuf_size,
> =C2=A0					=C2=A0=C2=A0 &rga->cmdbuf_phy, GFP_KERNEL,
> =C2=A0					=C2=A0=C2=A0 DMA_ATTR_WRITE_COMBINE);
> =C2=A0	if (!rga->cmdbuf_virt) {
> @@ -828,9 +683,6 @@ static int rga_probe(struct platform_device *pdev)
> =C2=A0		goto rel_m2m;
> =C2=A0	}
> =C2=A0
> -	def_frame.stride =3D (DEFAULT_WIDTH * def_frame.fmt->depth) >> 3;
> -	def_frame.size =3D def_frame.stride * DEFAULT_HEIGHT;
> -
> =C2=A0	ret =3D video_register_device(vfd, VFL_TYPE_VIDEO, -1);
> =C2=A0	if (ret) {
> =C2=A0		v4l2_err(&rga->v4l2_dev, "Failed to register video device\n");
> @@ -843,7 +695,7 @@ static int rga_probe(struct platform_device *pdev)
> =C2=A0	return 0;
> =C2=A0
> =C2=A0free_dma:
> -	dma_free_attrs(rga->dev, RGA_CMDBUF_SIZE, rga->cmdbuf_virt,
> +	dma_free_attrs(rga->dev, rga->hw->cmdbuf_size, rga->cmdbuf_virt,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rga->cmdbuf_phy, DMA_ATTR_WR=
ITE_COMBINE);
> =C2=A0rel_m2m:
> =C2=A0	v4l2_m2m_release(rga->m2m_dev);
> @@ -861,7 +713,7 @@ static void rga_remove(struct platform_device *pdev)
> =C2=A0{
> =C2=A0	struct rockchip_rga *rga =3D platform_get_drvdata(pdev);
> =C2=A0
> -	dma_free_attrs(rga->dev, RGA_CMDBUF_SIZE, rga->cmdbuf_virt,
> +	dma_free_attrs(rga->dev, rga->hw->cmdbuf_size, rga->cmdbuf_virt,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rga->cmdbuf_phy, DMA_ATTR_WR=
ITE_COMBINE);
> =C2=A0
> =C2=A0	v4l2_info(&rga->v4l2_dev, "Removing\n");
> @@ -897,9 +749,11 @@ static const struct dev_pm_ops rga_pm =3D {
> =C2=A0static const struct of_device_id rockchip_rga_match[] =3D {
> =C2=A0	{
> =C2=A0		.compatible =3D "rockchip,rk3288-rga",
> +		.data =3D &rga2_hw,
> =C2=A0	},
> =C2=A0	{
> =C2=A0		.compatible =3D "rockchip,rk3399-rga",
> +		.data =3D &rga2_hw,
> =C2=A0	},
> =C2=A0	{},
> =C2=A0};
> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/pl=
atform/rockchip/rga/rga.h
> index 7ec1fcc03ed32..98635ddd50d7c 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -14,6 +14,9 @@
> =C2=A0
> =C2=A0#define RGA_NAME "rockchip-rga"
> =C2=A0
> +#define DEFAULT_WIDTH 100
> +#define DEFAULT_HEIGHT 100
> +
> =C2=A0struct rga_fmt {
> =C2=A0	u32 fourcc;
> =C2=A0	int depth;
> @@ -69,6 +72,8 @@ static inline struct rga_ctx *file_to_rga_ctx(struct fi=
le *filp)
> =C2=A0	return container_of(file_to_v4l2_fh(filp), struct rga_ctx, fh);
> =C2=A0}
> =C2=A0
> +struct rga_hw;
> +
> =C2=A0struct rockchip_rga {
> =C2=A0	struct v4l2_device v4l2_dev;
> =C2=A0	struct v4l2_m2m_dev *m2m_dev;
> @@ -88,6 +93,8 @@ struct rockchip_rga {
> =C2=A0	struct rga_ctx *curr;
> =C2=A0	dma_addr_t cmdbuf_phy;
> =C2=A0	void *cmdbuf_virt;
> +
> +	const struct rga_hw *hw;
> =C2=A0};
> =C2=A0
> =C2=A0struct rga_addr_offset {
> @@ -138,7 +145,19 @@ static inline void rga_mod(struct rockchip_rga *rga,=
 u32 reg, u32 val, u32 mask)
> =C2=A0	rga_write(rga, reg, temp);
> =C2=A0};
> =C2=A0
> -void rga_hw_start(struct rockchip_rga *rga,
> -		=C2=A0 struct rga_vb_buffer *src, struct rga_vb_buffer *dst);
> +struct rga_hw {
> +	struct rga_fmt *formats;
> +	u32 num_formats;
> +	size_t cmdbuf_size;
> +	u32 min_width, min_height;
> +	u32 max_width, max_height;
> +
> +	void (*start)(struct rockchip_rga *rga,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct rga_vb_buffer *src, struct rga_v=
b_buffer *dst);
> +	bool (*handle_irq)(struct rockchip_rga *rga);
> +	void (*get_version)(struct rockchip_rga *rga);
> +};
> +
> +extern const struct rga_hw rga2_hw;
> =C2=A0
> =C2=A0#endif

--=-awLPo3pA3zArYr6dvmmF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUwBVQAKCRDZQZRRKWBy
9EhfAP9NFN5Gi9iSlGoayoestjhwQjvne6kf9ylqAav2YZMMZAEA1vK9QTuK0wzf
+eOOLadRyOphXELA/ZHF8GxcJghZbAM=
=ru5T
-----END PGP SIGNATURE-----

--=-awLPo3pA3zArYr6dvmmF--

