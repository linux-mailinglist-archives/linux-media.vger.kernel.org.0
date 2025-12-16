Return-Path: <linux-media+bounces-48930-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF24BCC53BB
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 22:39:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1DF223060F0F
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 21:37:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2837933DEE9;
	Tue, 16 Dec 2025 21:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="G/NSuGhJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBFC33D6DA
	for <linux-media@vger.kernel.org>; Tue, 16 Dec 2025 21:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765921033; cv=none; b=HMbnYBlEE079PiVdttbOgIYFl7gSS+T4Gd8Ty+OYp6WXGwyrsUREFEP0UBH1oZ+RemWUj6EfK6ZHHtyfpQLeiaT4gOfuFKl3vxrKVBTeQmz8V6orACZKjAz8sjeWzZGkO4BVSs471gekcx0U8tAJxCKkWgdSE1b2X9bsXEwtbZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765921033; c=relaxed/simple;
	bh=VjEEBpGuVJN8HQFfW+MiQlIFwnhhxHDposRRmn6ivWo=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SIHljFZmavjCZK7h5W71I7TWax2Wx5/92UDBORPXdFtcsXg1ma1ZL4ZzST1lxSVw+M5OIGx2ijklqIqviHmPpIeCiHh/ju7ncuZwAP0azu8E2SmmcVsc8zFMeL4yZwnitlnq0916XEGWJ7GhtV9Dkdydy3zgwPZEFc2Z4CfRvM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=G/NSuGhJ; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8b2d32b9777so747540185a.2
        for <linux-media@vger.kernel.org>; Tue, 16 Dec 2025 13:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1765921027; x=1766525827; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GtO3mBnlJngwwd/+oPp34lwyxlbeQ/BrynEuE59imH0=;
        b=G/NSuGhJGjipDD6mO/70lr614ES6sTws7S/kMcnQcX+ShWZUx9E56fPHAxj4cKkrP1
         wd4LPiPsjFS9nAdxeovQpnWfh67JlEFAWvHzXQ2LTlquh+5Xqjage6dgreTjUNfdeeOj
         9M++DI4zjBMUBdzV8N4cVFPhEyI5I04+6L1fAH0yBO/cpolRXvJydQMymm99zEy4dls3
         rSggWChWNyvHcCLp9Vh7RzdKZ1qFqDI9gHmOaXJbK8b0m0CrExpUOLuhWOmwY70h+95w
         SYjiW7SV3ENCDA1hqwDwCHsqEO0/41bqip0GQgJhI3unE3dwSk6IzShNbXJRXV93cjF0
         px9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765921027; x=1766525827;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GtO3mBnlJngwwd/+oPp34lwyxlbeQ/BrynEuE59imH0=;
        b=T5GZGeZxzRAjgs+MhWckvXWt9sPODSVX8uzlQxaNeUEmStkoeZi4uHSS/JaEJw/lKx
         7/oEaPRotwN9fi/pEvDPOrBiWiRRjykXu3hTiyWewawSJUcvkZUM/pP2aZcunB66RFJf
         3WNsm7X2F3m3spZJ1T4UtngnzVtbkDmDJisul6qKY80hCJkMYzwW30G3BIBcOykwCR48
         NHDsulaJJ93Nh/sdL/KXGegwj6bN3yQgtLZVZ+9bcSEuMOa5I0oUi0HqETOeCoigs/3H
         jiwM5TKUxNKiE7EWfGtdoVuku1iEf/HR4TjiG+XXc0GB9o1R3On61CavUYUTKy1Ei8SI
         KYkA==
X-Forwarded-Encrypted: i=1; AJvYcCW71U3E6YAc/DGIupxxSs6DqSnGKUr2GJK+qJ34yDfi9EK8r/R+ve1afdoQqI8LVnHxeaN1Fjaz3Kzlyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvCWYYbc6pnQJNBm6/uVZKjTYobrut+v+z9mnFitJp9kJBVwYK
	x36KbM6ojO35HAGz0BZh33/2z+Fs0Hqu6TaA1k7wmUrQ/ZUBExmATEkeEAl7VvWbEQU=
X-Gm-Gg: AY/fxX7RMZMye79Mljdn471njM/66Md2se8X0UktiQyUBZoPR9zgC7KO3Uww/OXIE1A
	CglMxBr1HnjXK3SRc5c4KUfBaMt5E1noeklcgu89M7MBBpoQE1yI/rlzzmQuMEaRat61ElmLwmi
	JfNxdp6GqqJIktDv9QJ9rWYujD711FwhCSYCfBVzorrE6X4BXrmRmxA2ZmIICunQAr2WamF3RcL
	DIoq5HRLVaR6vWbfoEok/eJh4SkC3CmpGDE4RQbwe1qWDxoc6z1SWuUvyjJskTuSOKUh0qkY2fY
	JktRTcCJofY/xKEtVOQUxxxyk7fzi6gwhVi8M0VHf7x2jZmWgHb9li+p2Fc9LVQgyO8fqZkFXic
	VzaiObw8MmvGSJyhGWncWkVRk2nJosSVlFyYpQBdQ/5wcBZTcBBYBMBsoUOSgMu5GR7IB41cOlB
	fErc23K3pgZLAowMPv
X-Google-Smtp-Source: AGHT+IFZ5TNFfy7xbJTH9G96PLJ3apFSZllZ5dKBvddlWXLy4lM0DJZEKU1hmri8DCWd/YG4FoqsFw==
X-Received: by 2002:a05:620a:4002:b0:84a:5f9d:a30c with SMTP id af79cd13be357-8bb3a37660emr2397868585a.63.1765921027539;
        Tue, 16 Dec 2025 13:37:07 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8be30c91bfasm265781385a.12.2025.12.16.13.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 13:37:06 -0800 (PST)
Message-ID: <043630a657ff5403b74202f6a856ff4bcfc6a192.camel@ndufresne.ca>
Subject: Re: [PATCH v11 06/12] media: mediatek: jpeg: fix decoding buffer
 number setting timing issue
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Tue, 16 Dec 2025 16:37:05 -0500
In-Reply-To: <20251202094800.6140-7-kyrie.wu@mediatek.com>
References: <20251202094800.6140-1-kyrie.wu@mediatek.com>
	 <20251202094800.6140-7-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-LOhQi3igSxhC90HVoS+h"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-LOhQi3igSxhC90HVoS+h
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 02 d=C3=A9cembre 2025 =C3=A0 17:47 +0800, Kyrie Wu a =C3=A9crit=C2=
=A0:
> move decoding buffer increase code into spinlock
> protecting aera for multi-core

I don't understand this text, please rework.

>=20
> Fixes: dedc21500334 ("media: mtk-jpegdec: add jpeg decode worker interfac=
e")
>=20

Drop that blank line.

> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> ---
> =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c=C2=A0=C2=A0 | =
9 +++------
> =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c | 1 +
> =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c | 1 +
> =C2=A03 files changed, 5 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index e45d7e82b8a0..5ffaee4dcd19 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1746,7 +1746,6 @@ static void mtk_jpegdec_worker(struct work_struct *=
work)
> =C2=A0
> =C2=A0	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
> =C2=A0	jpeg_src_buf =3D mtk_jpeg_vb2_to_srcbuf(&src_buf->vb2_buf);
> -	jpeg_dst_buf =3D mtk_jpeg_vb2_to_srcbuf(&dst_buf->vb2_buf);
> =C2=A0
> =C2=A0	if (mtk_jpeg_check_resolution_change(ctx,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0 &jpeg_src_buf->dec_param)) {
> @@ -1755,11 +1754,6 @@ static void mtk_jpegdec_worker(struct work_struct =
*work)
> =C2=A0		goto getbuf_fail;
> =C2=A0	}
> =C2=A0
> -	jpeg_src_buf->curr_ctx =3D ctx;
> -	jpeg_src_buf->frame_num =3D ctx->total_frame_num;
> -	jpeg_dst_buf->curr_ctx =3D ctx;
> -	jpeg_dst_buf->frame_num =3D ctx->total_frame_num;
> -
> =C2=A0	mtk_jpegdec_set_hw_param(ctx, hw_id, src_buf, dst_buf);
> =C2=A0	ret =3D pm_runtime_resume_and_get(comp_jpeg[hw_id]->dev);
> =C2=A0	if (ret < 0) {
> @@ -1784,6 +1778,9 @@ static void mtk_jpegdec_worker(struct work_struct *=
work)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(MTK_JPEG_HW_TIME=
OUT_MSEC));
> =C2=A0
> =C2=A0	spin_lock_irqsave(&comp_jpeg[hw_id]->hw_lock, flags);
> +	jpeg_dst_buf =3D mtk_jpeg_vb2_to_srcbuf(&dst_buf->vb2_buf);
> +	jpeg_dst_buf->curr_ctx =3D ctx;
> +	jpeg_dst_buf->frame_num =3D ctx->total_frame_num;
> =C2=A0	ctx->total_frame_num++;
> =C2=A0	mtk_jpeg_dec_reset(comp_jpeg[hw_id]->reg_base);
> =C2=A0	mtk_jpeg_dec_set_config(comp_jpeg[hw_id]->reg_base,
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> index 5f1557dafad6..b3142dc9be85 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> @@ -513,6 +513,7 @@ static void mtk_jpegdec_put_buf(struct mtk_jpegdec_co=
mp_dev *jpeg)
> =C2=A0				v4l2_m2m_buf_done(&tmp_dst_done_buf->b,
> =C2=A0						=C2=A0 VB2_BUF_STATE_DONE);
> =C2=A0				ctx->last_done_frame_num++;
> +				break;
> =C2=A0			}
> =C2=A0		}
> =C2=A0	}
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> index 785db5ba4770..82c971936c4d 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> @@ -242,6 +242,7 @@ static void mtk_jpegenc_put_buf(struct mtk_jpegenc_co=
mp_dev *jpeg)
> =C2=A0				v4l2_m2m_buf_done(&tmp_dst_done_buf->b,
> =C2=A0						=C2=A0 VB2_BUF_STATE_DONE);
> =C2=A0				ctx->last_done_frame_num++;
> +				break;
> =C2=A0			}
> =C2=A0		}
> =C2=A0	}

Normally I'd seek for the context in the code. But I think I'll wait for a
proper commit message, and do a proper review then.

Nicolas

--=-LOhQi3igSxhC90HVoS+h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUHRAQAKCRDZQZRRKWBy
9CkJAQDFF2fMiQe1Z/KUSsnqSHOjrR++9jQ8kibQtTJ7ib9yMQEAoTpMq+Kmn3Lu
aOyRrlUky49dw8xZ9yef7ZluPkVGWg4=
=7UUl
-----END PGP SIGNATURE-----

--=-LOhQi3igSxhC90HVoS+h--

