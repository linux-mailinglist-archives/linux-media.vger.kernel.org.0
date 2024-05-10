Return-Path: <linux-media+bounces-11301-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A70978C200B
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 10:50:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C66091C2162F
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 08:50:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ACD915F41D;
	Fri, 10 May 2024 08:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ReQpeFur"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B34149C78
	for <linux-media@vger.kernel.org>; Fri, 10 May 2024 08:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715331047; cv=none; b=RrWE5Xal6IGYm0D586FwN74Qeg/N0JBRPAVGgA2zN6SzqGjcsEzKLI48F7Vrw8MVpDcmgv2XKsKffmW3A8yNQuvBt40rt6KM866dqxVoMnMHMRecIkYwqpFGRSOUVgmdTbiOUJJKNRxznCxdHkFVi5GpHuIf5r9v9DF1UQzR3H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715331047; c=relaxed/simple;
	bh=fUYFMJTn/xwLDtzOO8LGAkAPbJhIkNihSEEy3mUjT/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MctCSHmawMpO0oLhU9Lbp+s9W4I6Q6uEbULYDyURmOt2IRe08J7S7Sg9PvO5oAHI7fRz+35jAo/pLYCK+hTwdJeEQxEss2RV4UfRYxv7rfjRnLjOHAOdT5RsUDBUMzb9vHun6fsbzq50S8XZj58v4MRAEkcDfR+V9XSMCwOzWSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ReQpeFur; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2e2b468ea12so15421511fa.1
        for <linux-media@vger.kernel.org>; Fri, 10 May 2024 01:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715331042; x=1715935842; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4H4zSaH1+2LfQXPbu6vq5YgIN9MeKhusXvXCXm1EKAo=;
        b=ReQpeFurEepn7/fteGWq4lmVc7Bd0PAHauSKmndm/jBgZdMEMmywgr3knkswX4dF+H
         WUhlhAQc8aSeH4PRJpFvGGTYcf0vA8bcq880SewEcJ0u1RyAyMy5ketomIz5FGTLX/y0
         Wl2AqRV74Gp1LGcUzXJ8wnvUbCgHCag1mp5Rk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715331042; x=1715935842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4H4zSaH1+2LfQXPbu6vq5YgIN9MeKhusXvXCXm1EKAo=;
        b=K/AQf3+lpfhwLcMUbiF+j/nwZ+vRJCTw8v0xfjUI5ZdnamJyz2hQ0CJuLyCZpb6YN/
         3h3+168zr88/c/oLC/sjyrOvRdoA45KAspPqC56z3Rcykaz5rY6fFoLionIbwOhWwBda
         hO2+gKL6Uo+u0tbfhGB5dQtl0OgLOQsd+CPzE/zGwAKm3McdW3vbAShK3+FToKx4xnD8
         UGd54p7FUgCG4MUXbRdfcaj9rkRknVqovJieswa+CRYSMv8NzDwPJsrEVXpRI9yQh3aA
         PU0NC8MYxz6hmwk2EkAYte58OMkt8yXgxX42eVuR959Xoo+atL16R1+IQahFoh69PY7h
         djZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWycZAeQGxVtqKamSMksdIavc9eo406SxiWJYKrvfW+HuNWOjoFUt1iU+BM+hf6jyiIjVIKejjC26vF5RFL46+0e6ToglIXuMCCnP4=
X-Gm-Message-State: AOJu0YyUE/aO51idfqJfDemtWqPfH00LKqT64wU75dGZgxA8vu6g2+VX
	O8h4y9EDrjbXdpq1ARgwF0z4jqcAetEJaG3tH11+HNzVRpDbato5ed6b2VLJnZ6OdpiTdVTVaDh
	emAH35MR0oIXnqtN8YBiEZSmR6EyiZ+pvs2/J
X-Google-Smtp-Source: AGHT+IHoqXPYriqoOjzwKba9mnAyqCjY4tEq1xZu6FGMe9IQm/CXombW/wNWaZZgnXyDpDVvRkpUNWA0vcpy1+Zj2TY=
X-Received: by 2002:a2e:e09:0:b0:2e2:ab69:d0fa with SMTP id
 38308e7fff4ca-2e51a84e200mr6593961fa.5.1715331042430; Fri, 10 May 2024
 01:50:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240510083549.1279670-1-devarsht@ti.com>
In-Reply-To: <20240510083549.1279670-1-devarsht@ti.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 10 May 2024 16:50:31 +0800
Message-ID: <CAGXv+5Ggm=fXH=SBjROM_=kHsy-YW8CWeR8dYpPS4Y=VU6J4cA@mail.gmail.com>
Subject: Re: [PATCH RESEND v7 5/8] media: verisilcon : Use exported tables
 from v4l2-jpeg for hantro codec
To: Devarsh Thakkar <devarsht@ti.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, benjamin.gaignard@collabora.com, 
	sebastian.fricke@collabora.com, ezequiel@vanguardiasur.com.ar, 
	p.zabel@pengutronix.de, linux-rockchip@lists.infradead.org, 
	laurent.pinchart@ideasonboard.com, praneeth@ti.com, nm@ti.com, 
	vigneshr@ti.com, a-bhatia1@ti.com, j-luthra@ti.com, b-brnich@ti.com, 
	detheridge@ti.com, p-mantena@ti.com, vijayp@ti.com, andrzej.p@collabora.com, 
	nicolas@ndufresne.ca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 10, 2024 at 4:36=E2=80=AFPM Devarsh Thakkar <devarsht@ti.com> w=
rote:
>
> Use v4l2-jpeg core API to import reference quantization and huffman table=
s
> used for JPEG Encoding.
>
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Code looks OK. This was probably very overdue.

> ---
> V1->V6 (No change, patch introduced in V7)
> ---
>  .../media/platform/verisilicon/hantro_jpeg.c  | 128 ++----------------
>  1 file changed, 14 insertions(+), 114 deletions(-)
>
> diff --git a/drivers/media/platform/verisilicon/hantro_jpeg.c b/drivers/m=
edia/platform/verisilicon/hantro_jpeg.c
> index d07b1b449b61..fa4e8ee92c05 100644
> --- a/drivers/media/platform/verisilicon/hantro_jpeg.c
> +++ b/drivers/media/platform/verisilicon/hantro_jpeg.c
> @@ -11,6 +11,7 @@
>  #include <linux/build_bug.h>
>  #include <linux/kernel.h>
>  #include <linux/string.h>
> +#include <media/v4l2-jpeg.h>
>  #include "hantro_jpeg.h"
>  #include "hantro.h"
>
> @@ -24,42 +25,6 @@
>  #define HUFF_CHROMA_DC_OFF     394
>  #define HUFF_CHROMA_AC_OFF     427
>
> -/* Default tables from JPEG ITU-T.81
> - * (ISO/IEC 10918-1) Annex K, tables K.1 and K.2
> - */
> -static const unsigned char luma_q_table[] =3D {
> -       0x10, 0x0b, 0x0a, 0x10, 0x18, 0x28, 0x33, 0x3d,
> -       0x0c, 0x0c, 0x0e, 0x13, 0x1a, 0x3a, 0x3c, 0x37,
> -       0x0e, 0x0d, 0x10, 0x18, 0x28, 0x39, 0x45, 0x38,
> -       0x0e, 0x11, 0x16, 0x1d, 0x33, 0x57, 0x50, 0x3e,
> -       0x12, 0x16, 0x25, 0x38, 0x44, 0x6d, 0x67, 0x4d,
> -       0x18, 0x23, 0x37, 0x40, 0x51, 0x68, 0x71, 0x5c,
> -       0x31, 0x40, 0x4e, 0x57, 0x67, 0x79, 0x78, 0x65,
> -       0x48, 0x5c, 0x5f, 0x62, 0x70, 0x64, 0x67, 0x63
> -};
> -
> -static const unsigned char chroma_q_table[] =3D {
> -       0x11, 0x12, 0x18, 0x2f, 0x63, 0x63, 0x63, 0x63,
> -       0x12, 0x15, 0x1a, 0x42, 0x63, 0x63, 0x63, 0x63,
> -       0x18, 0x1a, 0x38, 0x63, 0x63, 0x63, 0x63, 0x63,
> -       0x2f, 0x42, 0x63, 0x63, 0x63, 0x63, 0x63, 0x63,
> -       0x63, 0x63, 0x63, 0x63, 0x63, 0x63, 0x63, 0x63,
> -       0x63, 0x63, 0x63, 0x63, 0x63, 0x63, 0x63, 0x63,
> -       0x63, 0x63, 0x63, 0x63, 0x63, 0x63, 0x63, 0x63,
> -       0x63, 0x63, 0x63, 0x63, 0x63, 0x63, 0x63, 0x63
> -};
> -
> -static const unsigned char zigzag[] =3D {
> -        0,  1,  8, 16,  9,  2,  3, 10,
> -       17, 24, 32, 25, 18, 11,  4,  5,
> -       12, 19, 26, 33, 40, 48, 41, 34,
> -       27, 20, 13,  6,  7, 14, 21, 28,
> -       35, 42, 49, 56, 57, 50, 43, 36,
> -       29, 22, 15, 23, 30, 37, 44, 51,
> -       58, 59, 52, 45, 38, 31, 39, 46,
> -       53, 60, 61, 54, 47, 55, 62, 63
> -};
> -
>  static const u32 hw_reorder[] =3D {
>          0,  8, 16, 24,  1,  9, 17, 25,
>         32, 40, 48, 56, 33, 41, 49, 57,
> @@ -71,73 +36,6 @@ static const u32 hw_reorder[] =3D {
>         38, 46, 54, 62, 39, 47, 55, 63
>  };
>
> -/* Huffman tables are shared with CODA */
> -static const unsigned char luma_dc_table[] =3D {
> -       0x00, 0x01, 0x05, 0x01, 0x01, 0x01, 0x01, 0x01,
> -       0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -       0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
> -       0x08, 0x09, 0x0a, 0x0b,
> -};
> -
> -static const unsigned char chroma_dc_table[] =3D {
> -       0x00, 0x03, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
> -       0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,
> -       0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
> -       0x08, 0x09, 0x0a, 0x0b,
> -};
> -
> -static const unsigned char luma_ac_table[] =3D {
> -       0x00, 0x02, 0x01, 0x03, 0x03, 0x02, 0x04, 0x03,
> -       0x05, 0x05, 0x04, 0x04, 0x00, 0x00, 0x01, 0x7d,
> -       0x01, 0x02, 0x03, 0x00, 0x04, 0x11, 0x05, 0x12,
> -       0x21, 0x31, 0x41, 0x06, 0x13, 0x51, 0x61, 0x07,
> -       0x22, 0x71, 0x14, 0x32, 0x81, 0x91, 0xa1, 0x08,
> -       0x23, 0x42, 0xb1, 0xc1, 0x15, 0x52, 0xd1, 0xf0,
> -       0x24, 0x33, 0x62, 0x72, 0x82, 0x09, 0x0a, 0x16,
> -       0x17, 0x18, 0x19, 0x1a, 0x25, 0x26, 0x27, 0x28,
> -       0x29, 0x2a, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39,
> -       0x3a, 0x43, 0x44, 0x45, 0x46, 0x47, 0x48, 0x49,
> -       0x4a, 0x53, 0x54, 0x55, 0x56, 0x57, 0x58, 0x59,
> -       0x5a, 0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69,
> -       0x6a, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78, 0x79,
> -       0x7a, 0x83, 0x84, 0x85, 0x86, 0x87, 0x88, 0x89,
> -       0x8a, 0x92, 0x93, 0x94, 0x95, 0x96, 0x97, 0x98,
> -       0x99, 0x9a, 0xa2, 0xa3, 0xa4, 0xa5, 0xa6, 0xa7,
> -       0xa8, 0xa9, 0xaa, 0xb2, 0xb3, 0xb4, 0xb5, 0xb6,
> -       0xb7, 0xb8, 0xb9, 0xba, 0xc2, 0xc3, 0xc4, 0xc5,
> -       0xc6, 0xc7, 0xc8, 0xc9, 0xca, 0xd2, 0xd3, 0xd4,
> -       0xd5, 0xd6, 0xd7, 0xd8, 0xd9, 0xda, 0xe1, 0xe2,
> -       0xe3, 0xe4, 0xe5, 0xe6, 0xe7, 0xe8, 0xe9, 0xea,
> -       0xf1, 0xf2, 0xf3, 0xf4, 0xf5, 0xf6, 0xf7, 0xf8,
> -       0xf9, 0xfa,
> -};
> -
> -static const unsigned char chroma_ac_table[] =3D {
> -       0x00, 0x02, 0x01, 0x02, 0x04, 0x04, 0x03, 0x04,
> -       0x07, 0x05, 0x04, 0x04, 0x00, 0x01, 0x02, 0x77,
> -       0x00, 0x01, 0x02, 0x03, 0x11, 0x04, 0x05, 0x21,
> -       0x31, 0x06, 0x12, 0x41, 0x51, 0x07, 0x61, 0x71,
> -       0x13, 0x22, 0x32, 0x81, 0x08, 0x14, 0x42, 0x91,
> -       0xa1, 0xb1, 0xc1, 0x09, 0x23, 0x33, 0x52, 0xf0,
> -       0x15, 0x62, 0x72, 0xd1, 0x0a, 0x16, 0x24, 0x34,
> -       0xe1, 0x25, 0xf1, 0x17, 0x18, 0x19, 0x1a, 0x26,
> -       0x27, 0x28, 0x29, 0x2a, 0x35, 0x36, 0x37, 0x38,
> -       0x39, 0x3a, 0x43, 0x44, 0x45, 0x46, 0x47, 0x48,
> -       0x49, 0x4a, 0x53, 0x54, 0x55, 0x56, 0x57, 0x58,
> -       0x59, 0x5a, 0x63, 0x64, 0x65, 0x66, 0x67, 0x68,
> -       0x69, 0x6a, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78,
> -       0x79, 0x7a, 0x82, 0x83, 0x84, 0x85, 0x86, 0x87,
> -       0x88, 0x89, 0x8a, 0x92, 0x93, 0x94, 0x95, 0x96,
> -       0x97, 0x98, 0x99, 0x9a, 0xa2, 0xa3, 0xa4, 0xa5,
> -       0xa6, 0xa7, 0xa8, 0xa9, 0xaa, 0xb2, 0xb3, 0xb4,
> -       0xb5, 0xb6, 0xb7, 0xb8, 0xb9, 0xba, 0xc2, 0xc3,
> -       0xc4, 0xc5, 0xc6, 0xc7, 0xc8, 0xc9, 0xca, 0xd2,
> -       0xd3, 0xd4, 0xd5, 0xd6, 0xd7, 0xd8, 0xd9, 0xda,
> -       0xe2, 0xe3, 0xe4, 0xe5, 0xe6, 0xe7, 0xe8, 0xe9,
> -       0xea, 0xf2, 0xf3, 0xf4, 0xf5, 0xf6, 0xf7, 0xf8,
> -       0xf9, 0xfa,
> -};
> -
>  /* For simplicity, we keep a pre-formatted JPEG header,
>   * and we'll use fixed offsets to change the width, height
>   * quantization tables, etc.
> @@ -291,10 +189,11 @@ jpeg_scale_quant_table(unsigned char *file_q_tab,
>                        const unsigned char *tab, int scale)
>  {
>         int i;
> +       const u8 *zigzag;
>
> -       BUILD_BUG_ON(ARRAY_SIZE(zigzag) !=3D JPEG_QUANT_SIZE);
>         BUILD_BUG_ON(ARRAY_SIZE(hw_reorder) !=3D JPEG_QUANT_SIZE);
>
> +       v4l2_jpeg_get_zig_zag_scan(&zigzag);
>         for (i =3D 0; i < JPEG_QUANT_SIZE; i++) {
>                 file_q_tab[i] =3D jpeg_scale_qp(tab[zigzag[i]], scale);
>                 reordered_q_tab[i] =3D jpeg_scale_qp(tab[hw_reorder[i]], =
scale);
> @@ -304,6 +203,7 @@ jpeg_scale_quant_table(unsigned char *file_q_tab,
>  static void jpeg_set_quality(struct hantro_jpeg_ctx *ctx)
>  {
>         int scale;
> +       const u8 *luma_q_table, *chroma_q_table;
>
>         /*
>          * Non-linear scaling factor:
> @@ -314,21 +214,23 @@ static void jpeg_set_quality(struct hantro_jpeg_ctx=
 *ctx)
>         else
>                 scale =3D 200 - 2 * ctx->quality;
>
> -       BUILD_BUG_ON(ARRAY_SIZE(luma_q_table) !=3D JPEG_QUANT_SIZE);
> -       BUILD_BUG_ON(ARRAY_SIZE(chroma_q_table) !=3D JPEG_QUANT_SIZE);
>         BUILD_BUG_ON(ARRAY_SIZE(ctx->hw_luma_qtable) !=3D JPEG_QUANT_SIZE=
);
>         BUILD_BUG_ON(ARRAY_SIZE(ctx->hw_chroma_qtable) !=3D JPEG_QUANT_SI=
ZE);
>
> +       v4l2_jpeg_get_reference_quantization_tables(&luma_q_table, &chrom=
a_q_table);
>         jpeg_scale_quant_table(ctx->buffer + LUMA_QUANT_OFF,
> -                              ctx->hw_luma_qtable, luma_q_table, scale);
> +                              ctx->hw_luma_qtable, (const unsigned char =
*)luma_q_table, scale);
>         jpeg_scale_quant_table(ctx->buffer + CHROMA_QUANT_OFF,
> -                              ctx->hw_chroma_qtable, chroma_q_table, sca=
le);
> +                              ctx->hw_chroma_qtable, (const unsigned cha=
r *)chroma_q_table, scale);
>  }
>
>  void hantro_jpeg_header_assemble(struct hantro_jpeg_ctx *ctx)
>  {
>         char *buf =3D ctx->buffer;
> +       const u8 *luma_dc_table, *chroma_dc_table, *luma_ac_table, *chrom=
a_ac_table;
>
> +       v4l2_jpeg_get_reference_huffman_tables(&luma_dc_table,  &luma_ac_=
table, &chroma_dc_table,
> +                                              &chroma_ac_table);
>         memcpy(buf, hantro_jpeg_header,
>                sizeof(hantro_jpeg_header));
>
> @@ -337,12 +239,10 @@ void hantro_jpeg_header_assemble(struct hantro_jpeg=
_ctx *ctx)
>         buf[WIDTH_OFF + 0] =3D ctx->width >> 8;
>         buf[WIDTH_OFF + 1] =3D ctx->width;
>
> -       memcpy(buf + HUFF_LUMA_DC_OFF, luma_dc_table, sizeof(luma_dc_tabl=
e));
> -       memcpy(buf + HUFF_LUMA_AC_OFF, luma_ac_table, sizeof(luma_ac_tabl=
e));
> -       memcpy(buf + HUFF_CHROMA_DC_OFF, chroma_dc_table,
> -              sizeof(chroma_dc_table));
> -       memcpy(buf + HUFF_CHROMA_AC_OFF, chroma_ac_table,
> -              sizeof(chroma_ac_table));
> +       memcpy(buf + HUFF_LUMA_DC_OFF, luma_dc_table, V4L2_JPEG_REF_HT_DC=
_LEN);
> +       memcpy(buf + HUFF_LUMA_AC_OFF, luma_ac_table, V4L2_JPEG_REF_HT_AC=
_LEN);
> +       memcpy(buf + HUFF_CHROMA_DC_OFF, chroma_dc_table, V4L2_JPEG_REF_H=
T_DC_LEN);
> +       memcpy(buf + HUFF_CHROMA_AC_OFF, chroma_ac_table, V4L2_JPEG_REF_H=
T_AC_LEN);
>
>         jpeg_set_quality(ctx);
>  }
> --
> 2.39.1
>
>

