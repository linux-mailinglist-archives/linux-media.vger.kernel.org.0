Return-Path: <linux-media+bounces-49507-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5B7CDD0C5
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 20:35:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E842B30285B9
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 19:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DC462D3A60;
	Wed, 24 Dec 2025 19:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="gRT1npSX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7092848BA
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 19:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766604864; cv=none; b=ZCk75CkxHCE3xx+qAxj1fYm8vgS27Cu8Jmvy9BoHBOOkRbhsKrpe3Wt+lI6Dslu5HwxVtMpmL+mEYnncRZKCW0f5M2Nj6uv6I3W5dCDoLKl/+SAkm1rJnYK9ig8nk1ZZpKqZXBSkVOfSOu+9BrN1rhDcQoGen6Q2PJXw9+uKvGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766604864; c=relaxed/simple;
	bh=PluAjAtb7lK7v49qmWgxOxuvH4IrNDDqPtgMaVNWaBo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iLbTpfPRtTmBZg3LX9Jv7vcKnHLCEMrUImvNOwtSUHbKoZTRyDirMiqmg8IBUnBgclSrpC4qxGSbQyLDz6+2aGc1lGRs1lqvXxqt7VH85h+Inuxm0iAOzy+IlocOfpAimgu8DMVXHCFlNP3x47Yx21QcoGyQWDlSS7ITVYgjkbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=gRT1npSX; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4ee2014c228so37802271cf.2
        for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 11:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1766604861; x=1767209661; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=x6e16gv7fkGlDB1AoJnkIFe8dWDnsL2zpf8dEOQ9gVg=;
        b=gRT1npSXX2LaP5gWEHTmO9J3dw+hpmudpZGrqF68BC4pmMeDygREOINBxhEnRrlqYh
         DWwA66ufxh/jlBqFoAWkdOay+BZ/agBnwnhA74U3kyivnIBqDCW29vAGIVavHpkC4AyL
         VumPpJmWN5VFgy2iSO6e7n4uytQ6TaGA3VTzhQAmgtD/BwCwZYCDpmyIlOI+AeWfFPHJ
         k4ViTpvK3MzwPvQIWd2yWVaF1ibpxF5cVH58YtcfpKYfEyCNzLByZvDqJmreG3sAc12r
         QSqQC11RLfocWYNgpke+fogRNyBcYo4fqor6dTR0x0xaXs7/GZ7efbKaucZBIKxmExNP
         +18A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766604861; x=1767209661;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x6e16gv7fkGlDB1AoJnkIFe8dWDnsL2zpf8dEOQ9gVg=;
        b=JaYuAr9W3ygesVMKM11l4zIu/3QFtnnuaeiuePiDt0/wNUgHLRIGBb5ggQAvYeelaW
         MEdUzWm7JoZ/VlVZEU76+m6WdxyZTCdc23W7a4UzZJkFKONK0dDWzmo2fly+TcYB/djl
         2aqhc2yoNsaKWvmdq4Xpl9Cl2wd8g/lfucGQReUKVUdVAUgK7dvtf1WcuZ0U3ELGb048
         aGyMbpDn7lCM1UHkqYwzedz2wrXWanIugJLwcTHf5Ia9r7e0s5Nz2CTrLHYLWxdt0UFu
         w9KAVLmH7Z8tRbBXuGoQiYVnhZ++JjztJGcLFOlcEl7cut/WoTvaQWG+dEL/ctb+mDNM
         C6mg==
X-Forwarded-Encrypted: i=1; AJvYcCXUve6yG83gmD+L83TtRHb36pIarYIt4eJvAwmAsZqk+a7I4CfRftpwIgx3hXv04pLsTZxwTIelyy89ug==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9UBIN7+IAZ10RN8TShX8/VduAg17gZyzi4z5WqlwiSlng53A2
	RkwxZel7Tw5HVFmsu07ERSWLjPmr8UtqiBTHFUhfHYnX/ABANqSNGuuiabQiOKaVi34=
X-Gm-Gg: AY/fxX5jaai2AScYdGBgWpkODL/TTcCh5PyF20dcv5/XSNXjpCvpVRG0dHSukkl5aqm
	O2JCzPMzaYO+VYFqPlCqbNkYRCNL/hZ4VzPLPvDjVl22NRYWtdaabd+CvbQRGIPHZ7rmJgyTbwZ
	NcuiIdwC2ETpJ/MSd+8BtUZpLlx0lG+3eb+z7rdyXwda0t4F1pv5wyQOGV8YHqpJ1Xk28yCgIlY
	b2+yAVQj9Qy0IAoH/SVZutMI/MyZkaWMy8a5eZir+zkL/zUQXWdFW6EFluRuaCR2e/TFOHvbuk1
	45liVWSiGzWcsNiL/QvZ8qLG3UVDMHbTA+R+PbI4PyoKXnjed5DKYLpNkw6+wgfss3SKF+tkOi9
	YmdBINRrJhUlM4NUCPqJhVsyAOK4EMLiRObcNT//rKYi5Skahviqc8iq+ut3Xn8OGD8QQ4OO+/L
	bqrb823x2yppPGUzBDWKI5TrRAvko=
X-Google-Smtp-Source: AGHT+IE5c0d9pz9gNJn0vh5jGGkS4wNXyintuchpyEm5t5iJ8jOJyL4PkY5GG2wEQBxudRt+jOfljw==
X-Received: by 2002:a05:622a:6a8e:b0:4f4:c10e:fa3e with SMTP id d75a77b69052e-4f4c10efd3fmr133639501cf.3.1766604861041;
        Wed, 24 Dec 2025 11:34:21 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d997aedafsm132331276d6.31.2025.12.24.11.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 11:34:20 -0800 (PST)
Message-ID: <2974614b2440ed828f49ff7819ca7935d7bb8109.camel@ndufresne.ca>
Subject: Re: [PATCH v2 4/4] media: mediatek: jpeg: add compatible for MT8189
 SoC
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Jianhua Lin <jianhua.lin@mediatek.com>, mchehab@kernel.org,
 robh@kernel.org, 	krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, 	angelogioacchino.delregno@collabora.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com,
 sirius.wang@mediatek.com, 	vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
Date: Wed, 24 Dec 2025 14:34:19 -0500
In-Reply-To: <20251224031721.9942-5-jianhua.lin@mediatek.com>
References: <20251224031721.9942-1-jianhua.lin@mediatek.com>
	 <20251224031721.9942-5-jianhua.lin@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-qqvl0ztmS4O0H5gavPMm"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-qqvl0ztmS4O0H5gavPMm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 24 d=C3=A9cembre 2025 =C3=A0 11:17 +0800, Jianhua Lin a =C3=A9c=
rit=C2=A0:
> Compared to the previous generation IC, the MT8189 uses 34-bit iova
> address-space (16GB) and requires a single clock configuration.
> Therefore, add new compatible to support the JPEG encoder and decoder
> of MT8189 SoC.
>=20
> Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

I'll have to wait for some ack on the bindings, which looks otherwise fine =
to
me. But due to holiday, that might be delayed a little bit.

cheers,
Nicolas

> ---
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_core.c=C2=A0=C2=A0=C2=A0 | 44 +=
++++++++++++++++++
> =C2=A01 file changed, 44 insertions(+)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index d08fe365cbb2..9ea8d8f56e9b 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1866,6 +1866,10 @@ static struct clk_bulk_data mt8173_jpeg_dec_clocks=
[] =3D
> {
> =C2=A0	{ .id =3D "jpgdec" },
> =C2=A0};
> =C2=A0
> +static struct clk_bulk_data mtk_jpeg_dec_clocks[] =3D {
> +	{ .id =3D "jpgdec" },
> +};
> +
> =C2=A0static const struct mtk_jpeg_variant mt8173_jpeg_drvdata =3D {
> =C2=A0	.clks =3D mt8173_jpeg_dec_clocks,
> =C2=A0	.num_clks =3D ARRAY_SIZE(mt8173_jpeg_dec_clocks),
> @@ -1897,6 +1901,38 @@ static const struct mtk_jpeg_variant mtk_jpeg_drvd=
ata =3D
> {
> =C2=A0	.multi_core =3D false,
> =C2=A0};
> =C2=A0
> +static const struct mtk_jpeg_variant mtk8189_jpegenc_drvdata =3D {
> +	.clks =3D mtk_jpeg_clocks,
> +	.num_clks =3D ARRAY_SIZE(mtk_jpeg_clocks),
> +	.formats =3D mtk_jpeg_enc_formats,
> +	.num_formats =3D MTK_JPEG_ENC_NUM_FORMATS,
> +	.qops =3D &mtk_jpeg_enc_qops,
> +	.irq_handler =3D mtk_jpeg_enc_irq,
> +	.hw_reset =3D mtk_jpeg_enc_reset,
> +	.m2m_ops =3D &mtk_jpeg_enc_m2m_ops,
> +	.dev_name =3D "mtk-jpeg-enc",
> +	.ioctl_ops =3D &mtk_jpeg_enc_ioctl_ops,
> +	.out_q_default_fourcc =3D V4L2_PIX_FMT_YUYV,
> +	.cap_q_default_fourcc =3D V4L2_PIX_FMT_JPEG,
> +	.support_34bit =3D true,
> +};
> +
> +static const struct mtk_jpeg_variant mtk8189_jpegdec_drvdata =3D {
> +	.clks =3D mtk_jpeg_dec_clocks,
> +	.num_clks =3D ARRAY_SIZE(mtk_jpeg_dec_clocks),
> +	.formats =3D mtk_jpeg_dec_formats,
> +	.num_formats =3D MTK_JPEG_DEC_NUM_FORMATS,
> +	.qops =3D &mtk_jpeg_dec_qops,
> +	.irq_handler =3D mtk_jpeg_dec_irq,
> +	.hw_reset =3D mtk_jpeg_dec_reset,
> +	.m2m_ops =3D &mtk_jpeg_dec_m2m_ops,
> +	.dev_name =3D "mtk-jpeg-dec",
> +	.ioctl_ops =3D &mtk_jpeg_dec_ioctl_ops,
> +	.out_q_default_fourcc =3D V4L2_PIX_FMT_JPEG,
> +	.cap_q_default_fourcc =3D V4L2_PIX_FMT_YUV420M,
> +	.support_34bit =3D true,
> +};
> +
> =C2=A0static struct mtk_jpeg_variant mtk8195_jpegenc_drvdata =3D {
> =C2=A0	.formats =3D mtk_jpeg_enc_formats,
> =C2=A0	.num_formats =3D MTK_JPEG_ENC_NUM_FORMATS,
> @@ -1936,6 +1972,14 @@ static const struct of_device_id mtk_jpeg_match[] =
=3D {
> =C2=A0		.compatible =3D "mediatek,mtk-jpgenc",
> =C2=A0		.data =3D &mtk_jpeg_drvdata,
> =C2=A0	},
> +	{
> +		.compatible =3D "mediatek,mt8189-jpgenc",
> +		.data =3D &mtk8189_jpegenc_drvdata,
> +	},
> +	{
> +		.compatible =3D "mediatek,mt8189-jpgdec",
> +		.data =3D &mtk8189_jpegdec_drvdata,
> +	},
> =C2=A0	{
> =C2=A0		.compatible =3D "mediatek,mt8195-jpgenc",
> =C2=A0		.data =3D &mtk8195_jpegenc_drvdata,

--=-qqvl0ztmS4O0H5gavPMm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUxAOwAKCRDZQZRRKWBy
9JqBAP9i7M2YbOEYsWIhtcAH9zQcvXYutrHtuKt+PmEgNW4g5AD9ECawAwyRxWOa
fdGbfG5KGblydDkiwIRY9o3Ya2p6XQQ=
=ZDB6
-----END PGP SIGNATURE-----

--=-qqvl0ztmS4O0H5gavPMm--

