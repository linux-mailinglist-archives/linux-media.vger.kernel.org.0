Return-Path: <linux-media+bounces-11452-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DF88C5C14
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2024 22:14:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B9872813CF
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2024 20:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A69E2181335;
	Tue, 14 May 2024 20:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="cs3FrPcY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0DB43AA3
	for <linux-media@vger.kernel.org>; Tue, 14 May 2024 20:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715717683; cv=none; b=buiIVKUqFWIDhujaJ/IIGpfI2Gcq5bouOui1mfFLqRasEmhMGclt8AIIt+eTIL91fVIs08ok9BFYYE+922ZUD/f8Lj5ZJ0/3JE85J9989+DrjoqPQiCP8+bY5PJWz2K9mv4JD5D2UKC+efxMv4nGkYCYvTobCes3X7Urtx1o+JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715717683; c=relaxed/simple;
	bh=A49pzGtPWFCRqyS/HWfv9u2MVPL9vWH1dhGC15Txd0g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ttkPCpXGHCTreXTA7o7T7Wkbv/cYqNQwvS+qM3cjPVGG0nWVTDa/POX/t8NHVeTirlazWRDevsCOnnyNsW83E7DrpUlmupcQ4gAhbXbXZ4RvO/qDctMcAZfZO64AGji8b6AELQh4rGDX8lHpUoOQdS1IBqSDZ/R5EheR6/60iXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=cs3FrPcY; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-622e32414ffso30385307b3.1
        for <linux-media@vger.kernel.org>; Tue, 14 May 2024 13:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1715717679; x=1716322479; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Eb8q6td+vx7O+r97rvgcDorn3omTK57+hJyU/qoQnpU=;
        b=cs3FrPcYxXmzt9MqSW9lrY7o4P2PUUh1cG4jkjEo5JRQ/UsfMRaZcTD2yfQF09QO/N
         bEYxwyNdod4l4HMmWXJJKG3eHFZWgeQCQuBwzvmDaYpD2HTjfp8IvSdx3xfsVJbay61R
         ax66Nz2NjWWYCPhuA7sLrittE5UPVMGerg4ubkTWRr4K84A9Dm3bFPD3dqSPCuiQazVZ
         aSxrissRpW7ASAatNtf3e1LtAEBgtTbQx6pxD1O/h4YVR5+86jjbiEZh/JdfNbBWTpyj
         /tUolxeRhkolrRLO/Abv0IQxOHUKpPJUTn7QccW1+KUu1wIjisqfuEthDDJZal7gpkKY
         yAxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715717679; x=1716322479;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Eb8q6td+vx7O+r97rvgcDorn3omTK57+hJyU/qoQnpU=;
        b=aQ4GhhX8HnfwIN4JZDlcZa5S3pUrJnRe0rDIU0UZxeVeTgeLuVerjW3jCMoljGCtiJ
         l7J0OvFhPRHlNDdtZQsJbc7HmsLNnUewcsty2BGA/aSlGTj6ZOWyveB/IkuTi1XJRJjO
         nV7ZPsXkmqB2rJsC/cs5QRCcAeizfkF4gxpbz+bPh0sfj4X6crugzsUVq4U+4ttntwMS
         n6nX1Zmol+x2UeEGTMBiPhiDTzOOtw72YNfR6N/Jvb4FodLZf3xeg9Qz0FxE2fCzUkrH
         QXqQzug60X94tEDuXr+Gdk0PQtvsnm1jmD1YSRpPaOfXrZHMG3VRcOgdXyhJxdp3h4yn
         sQnw==
X-Forwarded-Encrypted: i=1; AJvYcCV4yGciXDXR6kwBQAh62RoPV2DQiJtBOAfeKDHqernqtBEvDBRx3I6lvqj1OHxuwn+tA1icm2G49Sl043bt4JM4YURJbG3wPKjvChk=
X-Gm-Message-State: AOJu0YztVEZ6G61jQDOGL671tY+txFZpLUfp0S8DYd9HBnIImqDSa+2l
	B97BNk2ABNQKqbRALJvHc9xKbtQxBD0mcR1bZhlsKGHksp/k7KkYBhuT3oWAbh8=
X-Google-Smtp-Source: AGHT+IGG0YGCLreWezvB23zXjwCjccV8bcU/L03kVuZlV1TaQf2ugr9ugn5BaAt130rFkIJRysmWZg==
X-Received: by 2002:a05:690c:706:b0:615:4e88:c02d with SMTP id 00721157ae682-622affa86d6mr170025787b3.23.1715717679537;
        Tue, 14 May 2024 13:14:39 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:17:6448::7a9])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43e0d56dce5sm44286631cf.58.2024.05.14.13.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 13:14:39 -0700 (PDT)
Message-ID: <085e61c58330453ca05b7e1d69d333da54fa7bfa.camel@ndufresne.ca>
Subject: Re: [PATCH v7 5/8] media: verisilcon : Use exported tables from
 v4l2-jpeg for hantro codec
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Devarsh Thakkar <devarsht@ti.com>, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, benjamin.gaignard@collabora.com, 
	sebastian.fricke@collabora.com, ezequiel@vanguardiasur.com.ar, 
	p.zabel@pengutronix.de, linux-rockchip@lists.infradead.org
Cc: laurent.pinchart@ideasonboard.com, praneeth@ti.com, nm@ti.com, 
	vigneshr@ti.com, a-bhatia1@ti.com, j-luthra@ti.com, b-brnich@ti.com, 
	detheridge@ti.com, p-mantena@ti.com, vijayp@ti.com, andrzej.p@collabora.com
Date: Tue, 14 May 2024 16:14:38 -0400
In-Reply-To: <20240509183946.4063905-1-devarsht@ti.com>
References: <20240509183946.4063905-1-devarsht@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le vendredi 10 mai 2024 =C3=A0 00:09 +0530, Devarsh Thakkar a =C3=A9crit=C2=
=A0:
> Use v4l2-jpeg core API to import reference quantization and huffman table=
s
> used for JPEG Encoding.
>=20
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>

Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> V1->V6 (No change, patch introduced in V7)
> ---
>  .../media/platform/verisilicon/hantro_jpeg.c  | 128 ++----------------
>  1 file changed, 14 insertions(+), 114 deletions(-)
>=20
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
> =20
> @@ -24,42 +25,6 @@
>  #define HUFF_CHROMA_DC_OFF	394
>  #define HUFF_CHROMA_AC_OFF	427
> =20
> -/* Default tables from JPEG ITU-T.81
> - * (ISO/IEC 10918-1) Annex K, tables K.1 and K.2
> - */
> -static const unsigned char luma_q_table[] =3D {
> -	0x10, 0x0b, 0x0a, 0x10, 0x18, 0x28, 0x33, 0x3d,
> -	0x0c, 0x0c, 0x0e, 0x13, 0x1a, 0x3a, 0x3c, 0x37,
> -	0x0e, 0x0d, 0x10, 0x18, 0x28, 0x39, 0x45, 0x38,
> -	0x0e, 0x11, 0x16, 0x1d, 0x33, 0x57, 0x50, 0x3e,
> -	0x12, 0x16, 0x25, 0x38, 0x44, 0x6d, 0x67, 0x4d,
> -	0x18, 0x23, 0x37, 0x40, 0x51, 0x68, 0x71, 0x5c,
> -	0x31, 0x40, 0x4e, 0x57, 0x67, 0x79, 0x78, 0x65,
> -	0x48, 0x5c, 0x5f, 0x62, 0x70, 0x64, 0x67, 0x63
> -};
> -
> -static const unsigned char chroma_q_table[] =3D {
> -	0x11, 0x12, 0x18, 0x2f, 0x63, 0x63, 0x63, 0x63,
> -	0x12, 0x15, 0x1a, 0x42, 0x63, 0x63, 0x63, 0x63,
> -	0x18, 0x1a, 0x38, 0x63, 0x63, 0x63, 0x63, 0x63,
> -	0x2f, 0x42, 0x63, 0x63, 0x63, 0x63, 0x63, 0x63,
> -	0x63, 0x63, 0x63, 0x63, 0x63, 0x63, 0x63, 0x63,
> -	0x63, 0x63, 0x63, 0x63, 0x63, 0x63, 0x63, 0x63,
> -	0x63, 0x63, 0x63, 0x63, 0x63, 0x63, 0x63, 0x63,
> -	0x63, 0x63, 0x63, 0x63, 0x63, 0x63, 0x63, 0x63
> -};
> -
> -static const unsigned char zigzag[] =3D {
> -	 0,  1,  8, 16,  9,  2,  3, 10,
> -	17, 24, 32, 25, 18, 11,  4,  5,
> -	12, 19, 26, 33, 40, 48, 41, 34,
> -	27, 20, 13,  6,  7, 14, 21, 28,
> -	35, 42, 49, 56, 57, 50, 43, 36,
> -	29, 22, 15, 23, 30, 37, 44, 51,
> -	58, 59, 52, 45, 38, 31, 39, 46,
> -	53, 60, 61, 54, 47, 55, 62, 63
> -};
> -
>  static const u32 hw_reorder[] =3D {
>  	 0,  8, 16, 24,  1,  9, 17, 25,
>  	32, 40, 48, 56, 33, 41, 49, 57,
> @@ -71,73 +36,6 @@ static const u32 hw_reorder[] =3D {
>  	38, 46, 54, 62, 39, 47, 55, 63
>  };
> =20
> -/* Huffman tables are shared with CODA */
> -static const unsigned char luma_dc_table[] =3D {
> -	0x00, 0x01, 0x05, 0x01, 0x01, 0x01, 0x01, 0x01,
> -	0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
> -	0x08, 0x09, 0x0a, 0x0b,
> -};
> -
> -static const unsigned char chroma_dc_table[] =3D {
> -	0x00, 0x03, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
> -	0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
> -	0x08, 0x09, 0x0a, 0x0b,
> -};
> -
> -static const unsigned char luma_ac_table[] =3D {
> -	0x00, 0x02, 0x01, 0x03, 0x03, 0x02, 0x04, 0x03,
> -	0x05, 0x05, 0x04, 0x04, 0x00, 0x00, 0x01, 0x7d,
> -	0x01, 0x02, 0x03, 0x00, 0x04, 0x11, 0x05, 0x12,
> -	0x21, 0x31, 0x41, 0x06, 0x13, 0x51, 0x61, 0x07,
> -	0x22, 0x71, 0x14, 0x32, 0x81, 0x91, 0xa1, 0x08,
> -	0x23, 0x42, 0xb1, 0xc1, 0x15, 0x52, 0xd1, 0xf0,
> -	0x24, 0x33, 0x62, 0x72, 0x82, 0x09, 0x0a, 0x16,
> -	0x17, 0x18, 0x19, 0x1a, 0x25, 0x26, 0x27, 0x28,
> -	0x29, 0x2a, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39,
> -	0x3a, 0x43, 0x44, 0x45, 0x46, 0x47, 0x48, 0x49,
> -	0x4a, 0x53, 0x54, 0x55, 0x56, 0x57, 0x58, 0x59,
> -	0x5a, 0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69,
> -	0x6a, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78, 0x79,
> -	0x7a, 0x83, 0x84, 0x85, 0x86, 0x87, 0x88, 0x89,
> -	0x8a, 0x92, 0x93, 0x94, 0x95, 0x96, 0x97, 0x98,
> -	0x99, 0x9a, 0xa2, 0xa3, 0xa4, 0xa5, 0xa6, 0xa7,
> -	0xa8, 0xa9, 0xaa, 0xb2, 0xb3, 0xb4, 0xb5, 0xb6,
> -	0xb7, 0xb8, 0xb9, 0xba, 0xc2, 0xc3, 0xc4, 0xc5,
> -	0xc6, 0xc7, 0xc8, 0xc9, 0xca, 0xd2, 0xd3, 0xd4,
> -	0xd5, 0xd6, 0xd7, 0xd8, 0xd9, 0xda, 0xe1, 0xe2,
> -	0xe3, 0xe4, 0xe5, 0xe6, 0xe7, 0xe8, 0xe9, 0xea,
> -	0xf1, 0xf2, 0xf3, 0xf4, 0xf5, 0xf6, 0xf7, 0xf8,
> -	0xf9, 0xfa,
> -};
> -
> -static const unsigned char chroma_ac_table[] =3D {
> -	0x00, 0x02, 0x01, 0x02, 0x04, 0x04, 0x03, 0x04,
> -	0x07, 0x05, 0x04, 0x04, 0x00, 0x01, 0x02, 0x77,
> -	0x00, 0x01, 0x02, 0x03, 0x11, 0x04, 0x05, 0x21,
> -	0x31, 0x06, 0x12, 0x41, 0x51, 0x07, 0x61, 0x71,
> -	0x13, 0x22, 0x32, 0x81, 0x08, 0x14, 0x42, 0x91,
> -	0xa1, 0xb1, 0xc1, 0x09, 0x23, 0x33, 0x52, 0xf0,
> -	0x15, 0x62, 0x72, 0xd1, 0x0a, 0x16, 0x24, 0x34,
> -	0xe1, 0x25, 0xf1, 0x17, 0x18, 0x19, 0x1a, 0x26,
> -	0x27, 0x28, 0x29, 0x2a, 0x35, 0x36, 0x37, 0x38,
> -	0x39, 0x3a, 0x43, 0x44, 0x45, 0x46, 0x47, 0x48,
> -	0x49, 0x4a, 0x53, 0x54, 0x55, 0x56, 0x57, 0x58,
> -	0x59, 0x5a, 0x63, 0x64, 0x65, 0x66, 0x67, 0x68,
> -	0x69, 0x6a, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78,
> -	0x79, 0x7a, 0x82, 0x83, 0x84, 0x85, 0x86, 0x87,
> -	0x88, 0x89, 0x8a, 0x92, 0x93, 0x94, 0x95, 0x96,
> -	0x97, 0x98, 0x99, 0x9a, 0xa2, 0xa3, 0xa4, 0xa5,
> -	0xa6, 0xa7, 0xa8, 0xa9, 0xaa, 0xb2, 0xb3, 0xb4,
> -	0xb5, 0xb6, 0xb7, 0xb8, 0xb9, 0xba, 0xc2, 0xc3,
> -	0xc4, 0xc5, 0xc6, 0xc7, 0xc8, 0xc9, 0xca, 0xd2,
> -	0xd3, 0xd4, 0xd5, 0xd6, 0xd7, 0xd8, 0xd9, 0xda,
> -	0xe2, 0xe3, 0xe4, 0xe5, 0xe6, 0xe7, 0xe8, 0xe9,
> -	0xea, 0xf2, 0xf3, 0xf4, 0xf5, 0xf6, 0xf7, 0xf8,
> -	0xf9, 0xfa,
> -};
> -
>  /* For simplicity, we keep a pre-formatted JPEG header,
>   * and we'll use fixed offsets to change the width, height
>   * quantization tables, etc.
> @@ -291,10 +189,11 @@ jpeg_scale_quant_table(unsigned char *file_q_tab,
>  		       const unsigned char *tab, int scale)
>  {
>  	int i;
> +	const u8 *zigzag;
> =20
> -	BUILD_BUG_ON(ARRAY_SIZE(zigzag) !=3D JPEG_QUANT_SIZE);
>  	BUILD_BUG_ON(ARRAY_SIZE(hw_reorder) !=3D JPEG_QUANT_SIZE);
> =20
> +	v4l2_jpeg_get_zig_zag_scan(&zigzag);
>  	for (i =3D 0; i < JPEG_QUANT_SIZE; i++) {
>  		file_q_tab[i] =3D jpeg_scale_qp(tab[zigzag[i]], scale);
>  		reordered_q_tab[i] =3D jpeg_scale_qp(tab[hw_reorder[i]], scale);
> @@ -304,6 +203,7 @@ jpeg_scale_quant_table(unsigned char *file_q_tab,
>  static void jpeg_set_quality(struct hantro_jpeg_ctx *ctx)
>  {
>  	int scale;
> +	const u8 *luma_q_table, *chroma_q_table;
> =20
>  	/*
>  	 * Non-linear scaling factor:
> @@ -314,21 +214,23 @@ static void jpeg_set_quality(struct hantro_jpeg_ctx=
 *ctx)
>  	else
>  		scale =3D 200 - 2 * ctx->quality;
> =20
> -	BUILD_BUG_ON(ARRAY_SIZE(luma_q_table) !=3D JPEG_QUANT_SIZE);
> -	BUILD_BUG_ON(ARRAY_SIZE(chroma_q_table) !=3D JPEG_QUANT_SIZE);
>  	BUILD_BUG_ON(ARRAY_SIZE(ctx->hw_luma_qtable) !=3D JPEG_QUANT_SIZE);
>  	BUILD_BUG_ON(ARRAY_SIZE(ctx->hw_chroma_qtable) !=3D JPEG_QUANT_SIZE);
> =20
> +	v4l2_jpeg_get_reference_quantization_tables(&luma_q_table, &chroma_q_ta=
ble);
>  	jpeg_scale_quant_table(ctx->buffer + LUMA_QUANT_OFF,
> -			       ctx->hw_luma_qtable, luma_q_table, scale);
> +			       ctx->hw_luma_qtable, (const unsigned char *)luma_q_table, scal=
e);
>  	jpeg_scale_quant_table(ctx->buffer + CHROMA_QUANT_OFF,
> -			       ctx->hw_chroma_qtable, chroma_q_table, scale);
> +			       ctx->hw_chroma_qtable, (const unsigned char *)chroma_q_table, =
scale);
>  }
> =20
>  void hantro_jpeg_header_assemble(struct hantro_jpeg_ctx *ctx)
>  {
>  	char *buf =3D ctx->buffer;
> +	const u8 *luma_dc_table, *chroma_dc_table, *luma_ac_table, *chroma_ac_t=
able;
> =20
> +	v4l2_jpeg_get_reference_huffman_tables(&luma_dc_table,  &luma_ac_table,=
 &chroma_dc_table,
> +					       &chroma_ac_table);
>  	memcpy(buf, hantro_jpeg_header,
>  	       sizeof(hantro_jpeg_header));
> =20
> @@ -337,12 +239,10 @@ void hantro_jpeg_header_assemble(struct hantro_jpeg=
_ctx *ctx)
>  	buf[WIDTH_OFF + 0] =3D ctx->width >> 8;
>  	buf[WIDTH_OFF + 1] =3D ctx->width;
> =20
> -	memcpy(buf + HUFF_LUMA_DC_OFF, luma_dc_table, sizeof(luma_dc_table));
> -	memcpy(buf + HUFF_LUMA_AC_OFF, luma_ac_table, sizeof(luma_ac_table));
> -	memcpy(buf + HUFF_CHROMA_DC_OFF, chroma_dc_table,
> -	       sizeof(chroma_dc_table));
> -	memcpy(buf + HUFF_CHROMA_AC_OFF, chroma_ac_table,
> -	       sizeof(chroma_ac_table));
> +	memcpy(buf + HUFF_LUMA_DC_OFF, luma_dc_table, V4L2_JPEG_REF_HT_DC_LEN);
> +	memcpy(buf + HUFF_LUMA_AC_OFF, luma_ac_table, V4L2_JPEG_REF_HT_AC_LEN);
> +	memcpy(buf + HUFF_CHROMA_DC_OFF, chroma_dc_table, V4L2_JPEG_REF_HT_DC_L=
EN);
> +	memcpy(buf + HUFF_CHROMA_AC_OFF, chroma_ac_table, V4L2_JPEG_REF_HT_AC_L=
EN);
> =20
>  	jpeg_set_quality(ctx);
>  }


