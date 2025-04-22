Return-Path: <linux-media+bounces-30736-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB12A97651
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 21:58:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DD05171603
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 19:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A76929AAF0;
	Tue, 22 Apr 2025 19:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="K62lC8az"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5FF298CC8
	for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 19:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745351888; cv=none; b=WGciMANNZ0V+Tmcm5jQUMSP+xCYjLVyuiy+VYSP4JaGt8xd3Frc741sgJq5UTDCdvRg+wm5dcqZNZ72o+Nc46yFd0hO2y8UH4z4BPePY6w0tzghzKnoL+QIxs44mWY9X/3Bi3cBEC2SoRR3SradgsGCgfh2Zc46bVtzG3L8d3iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745351888; c=relaxed/simple;
	bh=UCc9IenOlRQt7veSnMNvgDmw1rTTzCVeI7tkZWg+g0g=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=U7ADTvFaKEypOwHvN1dxcUd0sUU1gb7vLzNyg/07/UMmLVa5e6j++z//R/BY5anggPPJWRpi7ph4FYXof2/UZFd7ue4pwGpvq5sCOmQdCP+NcCh9eMw2ZasKjiURGSVyyLciP8569H3BjSKs5hody1ee3+B8r6D7XvSEQP6S6Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=K62lC8az; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-477282401b3so62185231cf.1
        for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 12:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1745351885; x=1745956685; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wi0XCQ0wIgKNjQqJTUBlgswWdaLbIuH1pbfLDZVamA8=;
        b=K62lC8azJ9dU8MYX4L1lNETjpRr6r9ikSRLWKInE8I+n/HDK/BfKvpSm+hB61EO+9b
         ij89z9bQ6weItF5IFj1vYPdy+4u/lTQ5gl+7sBSsvrQG2XjPtCPhBQ1fr8c//U2E23re
         7XjRc5/gfJnvQyZEJlrW9TVIwxgQwM4cNi8TUdxwppHon0RT+eI4UPtrc5LO0kxTZoeG
         7ho4Qf3BiHuTVN7+ImE7o7XS8QflvyGmNlHiAqWMYL+IZaVIn+fRr95UQxJvSnTj2aYu
         zGtXVzVepKsKezfq6duCTpFoFAEGUt61kH9pcbIGRbh90UBju/g/rkk6wrmzMQqC58LZ
         vtlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745351885; x=1745956685;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wi0XCQ0wIgKNjQqJTUBlgswWdaLbIuH1pbfLDZVamA8=;
        b=PDh1fwbj9FJfLfxd8ue3hkY+ATroPLRlOvMNVndvo8g5uj9w0AUCQ4PvUQcXiqMgKL
         nua9dDwlLca+tVigJTRM25dPjBlGVONXEFcqu39+12CjBoti06TKOOgF16rWJZN7jlyG
         +3Gn70FmFX6pH2mfTAZCcRRV21eyPelmMQfWOl32Bze8kywdKwJOocWDxOeo7bIBVdLr
         xZldBtOO7z6FYsjUCPntc5N7DVlUXHThZ6aY09H9k87YZ4K1tKvKpf+dGoVZqiJ7YagF
         BeVRDgLhtFFgcuF6meuFbLpQOrwlSLM0cY2jFgdnDlsu10M/7UUvV2lp+VF7/IyAHOIj
         WCwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDoJxRK1XeI5C+TcHwojJoAvEIFUeTfyNVOhyx8ZEBAC8JS85+igotwvX8rOqhCCwXIG41jqjUnh5TxA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs7o8GhJndbO+okVDonQhXyuhpQOtD+bHGQuuU9fxDnVEEgk0v
	bXDDCB40SRHgBOYxxF9WHWtDOwI1JcqYS9KnqUUy0nICAGpbIlQjtPDZl47F/4I=
X-Gm-Gg: ASbGncuGxzj/RM1RC8gYrxYA99bQhYKUJbfU25fFzbYNUrHliV1Y7zXz/sNxhS2kPl1
	9lkvGrImvZy1D6tleZXHZWDw4sZHRsLiRq+vsyvvY3VyEOiE7ZAQbww1BnW3luXvYMLIGs08Nau
	ejE9wy+UuE53JSt6hH9WyWkAvuR9rTySQQRTeU6BoUrz768Ds1/0fjSKkvDxzNx35el7Wq4gf+7
	IX2RVv9meDwjy8y2t2w86cI8j8Xvk29QgXbs0FOochwTPSWSUrf6P8Wns9ygDLDUeLa3I3QIWO7
	RP8k1H8Jsq14xtHdt37XhFu8gD+UbgG99mp0oVTjvP6/TA==
X-Google-Smtp-Source: AGHT+IF7avo9uEX7A3mW4T8l6RGnGWjnOiUes3AEZlicK2QwGeYThk0IGDXmi5oRWeE+79xJPQKX3w==
X-Received: by 2002:a05:6214:19c8:b0:6e8:fad9:c688 with SMTP id 6a1803df08f44-6f2c4552a03mr278764626d6.16.1745351884909;
        Tue, 22 Apr 2025 12:58:04 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:9913::5ac? ([2606:6d00:15:9913::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2af1433sm61506056d6.19.2025.04.22.12.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 12:58:04 -0700 (PDT)
Message-ID: <529a9804d5b14322b2be78ea6f98677db9c23c33.camel@ndufresne.ca>
Subject: Re: [PATCH v3 3/3] media: verisilicon: postproc: 4K support
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Sebastian Fricke	
 <sebastian.fricke@collabora.com>, Ricardo Ribalda <ribalda@chromium.org>, 
 Erling Ljunggren <hljunggr@cisco.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart	 <laurent.pinchart@ideasonboard.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>,  Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>, Jean-Michel Hautbois
 <jeanmichel.hautbois@ideasonboard.com>,  Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Date: Tue, 22 Apr 2025 15:58:02 -0400
In-Reply-To: <20241121131904.261230-4-hugues.fruchet@foss.st.com>
References: <20241121131904.261230-1-hugues.fruchet@foss.st.com>
	 <20241121131904.261230-4-hugues.fruchet@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

Le jeudi 21 novembre 2024 =C3=A0 14:19 +0100, Hugues Fruchet a =C3=A9crit=
=C2=A0:
> Support input larger than 4096x2048 using extended input width/height
> fields of swreg92.
> This is needed to decode large WebP or JPEG pictures.
>=20
> Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/verisilicon/hantro.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 ++
> =C2=A0drivers/media/platform/verisilicon/hantro_g1_regs.h=C2=A0 | 2 +-
> =C2=A0drivers/media/platform/verisilicon/hantro_postproc.c | 6 +++++-
> =C2=A03 files changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/=
platform/verisilicon/hantro.h
> index 811260dc3c77..d1337f7742e4 100644
> --- a/drivers/media/platform/verisilicon/hantro.h
> +++ b/drivers/media/platform/verisilicon/hantro.h
> @@ -321,6 +321,8 @@ struct hantro_postproc_regs {
> =C2=A0	struct hantro_reg output_fmt;
> =C2=A0	struct hantro_reg orig_width;
> =C2=A0	struct hantro_reg display_width;
> +	struct hantro_reg input_width_ext;
> +	struct hantro_reg input_height_ext;
> =C2=A0};
> =C2=A0
> =C2=A0struct hantro_vp9_decoded_buffer_info {
> diff --git a/drivers/media/platform/verisilicon/hantro_g1_regs.h b/driver=
s/media/platform/verisilicon/hantro_g1_regs.h
> index e7d4db788e57..f6e5bbeb1914 100644
> --- a/drivers/media/platform/verisilicon/hantro_g1_regs.h
> +++ b/drivers/media/platform/verisilicon/hantro_g1_regs.h
> @@ -351,7 +351,7 @@
> =C2=A0#define=C2=A0=C2=A0=C2=A0=C2=A0 G1_REG_PP_CONTROL_OUT_WIDTH(v) (((v=
) << 4) & GENMASK(14, 4))
> =C2=A0#define G1_REG_PP_MASK1_ORIG_WIDTH	G1_SWREG(88)
> =C2=A0#define=C2=A0=C2=A0=C2=A0=C2=A0 G1_REG_PP_ORIG_WIDTH(v)	(((v) << 23=
) & GENMASK(31, 23))
> -#define G1_REG_PP_DISPLAY_WIDTH		G1_SWREG(92)
> +#define G1_REG_PP_DISPLAY_WIDTH_IN_EXT	G1_SWREG(92)
> =C2=A0#define G1_REG_PP_FUSE			G1_SWREG(99)
> =C2=A0
> =C2=A0#endif /* HANTRO_G1_REGS_H_ */
> diff --git a/drivers/media/platform/verisilicon/hantro_postproc.c b/drive=
rs/media/platform/verisilicon/hantro_postproc.c
> index 232c93eea7ee..84c8e287470d 100644
> --- a/drivers/media/platform/verisilicon/hantro_postproc.c
> +++ b/drivers/media/platform/verisilicon/hantro_postproc.c
> @@ -49,7 +49,9 @@ static const struct hantro_postproc_regs hantro_g1_post=
proc_regs =3D {
> =C2=A0	.input_fmt =3D {G1_REG_PP_CONTROL, 29, 0x7},
> =C2=A0	.output_fmt =3D {G1_REG_PP_CONTROL, 26, 0x7},
> =C2=A0	.orig_width =3D {G1_REG_PP_MASK1_ORIG_WIDTH, 23, 0x1ff},
> -	.display_width =3D {G1_REG_PP_DISPLAY_WIDTH, 0, 0xfff},
> +	.display_width =3D {G1_REG_PP_DISPLAY_WIDTH_IN_EXT, 0, 0xfff},
> +	.input_width_ext =3D {G1_REG_PP_DISPLAY_WIDTH_IN_EXT, 26, 0x7},
> +	.input_height_ext =3D {G1_REG_PP_DISPLAY_WIDTH_IN_EXT, 29, 0x7},
> =C2=A0};
> =C2=A0
> =C2=A0bool hantro_needs_postproc(const struct hantro_ctx *ctx,
> @@ -103,6 +105,8 @@ static void hantro_postproc_g1_enable(struct hantro_c=
tx *ctx)
> =C2=A0	HANTRO_PP_REG_WRITE(vpu, output_height, ctx->dst_fmt.heighat);
> =C2=A0	HANTRO_PP_REG_WRITE(vpu, orig_width, MB_WIDTH(ctx->dst_fmt.width))=
;
> =C2=A0	HANTRO_PP_REG_WRITE(vpu, display_width, ctx->dst_fmt.width);
> +	HANTRO_PP_REG_WRITE(vpu, input_width_ext, MB_WIDTH(ctx->dst_fmt.width) =
>> 9);
> +	HANTRO_PP_REG_WRITE(vpu, input_height_ext, MB_HEIGHT(ctx->dst_fmt.heigh=
t >> 8));
> =C2=A0}
> =C2=A0
> =C2=A0static int down_scale_factor(struct hantro_ctx *ctx)

