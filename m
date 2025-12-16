Return-Path: <linux-media+bounces-48934-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FE3CC5439
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 22:51:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D84F3024135
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 21:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B674833F36D;
	Tue, 16 Dec 2025 21:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="Ok+VH11p"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214F329BD88
	for <linux-media@vger.kernel.org>; Tue, 16 Dec 2025 21:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765921769; cv=none; b=OBvfsIOm9szYnJ/VFm83zXBLbKUJNiGdMcncfICsJfGHG4yNApoASByvNCja6punkQ3KUy88tiGe6nKwLNRi5wr9hj+srsL+0qFHqzpHudwcTIXLaEDnrAgd1/elDCoIzOlDmmRoRkxXa4SpTYpuyCSti+as8RE26VAZECl1q2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765921769; c=relaxed/simple;
	bh=0cUnh1ytMEJ3rhuOOXREEv1h4is++HjDibXCnmqcCfI=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eevJ2fA/jG78Vbyic+exIPGmTmnbBeYQmwyn24E7mvBSTiLV0fvH8w0PE2j1aBJhUuXemWXSen1RREi6MqCDuBJl86Vdkvn7+6F7RbfJ17ZOIRB3l/Utv0Mwi2evyImEBXNo/vsepbRZkMvd3dbvyHXjGNXubHPgXJyDqWKVVl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=Ok+VH11p; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4f1ab2ea5c1so64160131cf.3
        for <linux-media@vger.kernel.org>; Tue, 16 Dec 2025 13:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1765921754; x=1766526554; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bdCldys7nQSDy6vXu7JlMpmSPr3k8VWJix7kbyw58m8=;
        b=Ok+VH11p0NeMP9kW4E3Hg++N+hDUDPSPfSHmSJzT+znoAlyaboyveqaL19gCjyHa7N
         MCX+17a5w0TXPcrUsXUoG3mrUuJJHJ2LA07Uz0M9Z9Nm+09XRKNSem+RDoxQb0f87wIf
         YHWdcFHmkRCWGBWStLPry4xlKPW+GcecOdh6HswIuxIZkWLECm2S5QY1F6EPZxdfc97C
         Vds/TzX7DZiwEZHjzZfG1JJnNyYW0inrA8ZXZDY4zJ9avQLTGPtgm0jo4CY3/nGt9/zf
         7ktVSc3vB6zqx23HbRkp7NIV0liEhPkAgVdj0B0VvjD1OhWtFmgTI8wfFxrl9/FJo9xU
         pqng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765921754; x=1766526554;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bdCldys7nQSDy6vXu7JlMpmSPr3k8VWJix7kbyw58m8=;
        b=Q0zUu4DOEbrrOBl0/TbV8gImCSsTzUEjDabIXvM7wljdV9NLdxtONW355xyAhozt9U
         Q+aO4o38F7SGe/xBBwOGhySsFd5kWvXEm7QBFHT29MtLx6maTy6PB9JnbmdkVgKOeqn+
         /Al1ouF+pNHcqvtI/o0jSfvpqLEhjJ7xRTGLf/EJRViRWg2VRoi3IOR9KhV9yuVPmn5Y
         vAoJ1kzGdrBpHR5gX+Ktl2spvO6kpY8y5UGxkUrC0TcVA2mgodJu3gKSweIFmE18RQLt
         EkoIv0gafyG53VfCDiB6uy1X5qVlev10TBLDnd0NFoqOPzNGr2kMG7f+yYvy9sea/9AO
         1tHg==
X-Forwarded-Encrypted: i=1; AJvYcCWg8WX4VijtNtD5Faud0f5DMaAZmKxFV0gkvOgOzMmnXrLZRi3dO0ihP3WlscVUX+z+m1VyiGHDvulPuw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+Jj7mYhHIDD9J0CDF3OODTRwci2VKLh/WZPU8d4DtCxtka/Ky
	XBBQ6ql8BJhlRI723p2dU+/QpcD5x5huLKy0MtqqOoHPgaJjXbEkWHplgtwCT3y3Vf0=
X-Gm-Gg: AY/fxX5MgLO7neAlGZSmqg/y6ptiMDtHt8XYNTTHoQ8Q9f/M97MoMnL2mWIRtIsD2hx
	K4KAPKtpigj7zDn9F+OO/V67eDB02yd9f7qiK/cYfQAQngdjYoP7NIyy5RB1T6LLTT5DCkhcjl7
	JImLIOY+K0LGWsfg1RQwqz0mK9FoJAgdb60I715PucuNyKvha0Y1YjaGDyY8XSLSbLsjSalsfN6
	LqjyLkXzHGbDd4+6M5+9YgH3L2osv5GN92SuACpR4l+Han0oFdvO/Pli4PyU0zaiakFRPM86P0n
	kKG8io6AGyA/g4IA+McsSvHN245sKAqnepWmvSb57fkHOai38nM1ogc25siqd1K8ibpxMdS3ZOg
	zIZcn8yca82jG/pKLjNVszTNICjSNnV9+vkl+KioFKR2kM+Fr/V5pN6/fN2QK/qWqqEKDi4GlMf
	o+G+E4hyvcWxUkaJ+V
X-Google-Smtp-Source: AGHT+IH+V/Mr5+CqGLcI3EzYLOmPSV6tSlboBRvR5DbANVmIdH9NhazPVg8f1thYKYgGBLLqtCy2dA==
X-Received: by 2002:a05:622a:1b88:b0:4ec:f073:4239 with SMTP id d75a77b69052e-4f1d04787c8mr198004211cf.6.1765921754277;
        Tue, 16 Dec 2025 13:49:14 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f345c7dfbfsm21515751cf.31.2025.12.16.13.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 13:49:13 -0800 (PST)
Message-ID: <3dd2c364f84725a68823f13a9f2b1f0499abaed5.camel@ndufresne.ca>
Subject: Re: [PATCH v11 11/12] media: mediatek: jpeg: add jpeg compatible
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Tue, 16 Dec 2025 16:49:12 -0500
In-Reply-To: <20251202094800.6140-12-kyrie.wu@mediatek.com>
References: <20251202094800.6140-1-kyrie.wu@mediatek.com>
	 <20251202094800.6140-12-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-YBjB4a/FKYc454GerwhG"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-YBjB4a/FKYc454GerwhG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 02 d=C3=A9cembre 2025 =C3=A0 17:47 +0800, Kyrie Wu a =C3=A9crit=C2=
=A0:
> Add jpeg dec and enc compatible for mt8196
>=20
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_core.c=C2=A0=C2=A0=C2=A0 | 34 +=
++++++++++++++++++
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c=C2=A0 |=C2=A0 3 ++
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c=C2=A0 |=C2=A0 3 ++
> =C2=A03 files changed, 40 insertions(+)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index da1ca494ed4b..10a588b92e76 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1932,6 +1932,19 @@ static struct mtk_jpeg_variant mtk8195_jpegenc_drv=
data
> =3D {
> =C2=A0	.jpeg_worker =3D mtk_jpegenc_worker,
> =C2=A0};
> =C2=A0
> +static struct mtk_jpeg_variant mtk8196_jpegenc_drvdata =3D {
> +	.formats =3D mtk_jpeg_enc_formats,
> +	.num_formats =3D MTK_JPEG_ENC_NUM_FORMATS,
> +	.qops =3D &mtk_jpeg_enc_qops,
> +	.m2m_ops =3D &mtk_jpeg_multicore_enc_m2m_ops,
> +	.dev_name =3D "mtk-jpeg-enc",
> +	.ioctl_ops =3D &mtk_jpeg_enc_ioctl_ops,
> +	.out_q_default_fourcc =3D V4L2_PIX_FMT_YUYV,
> +	.cap_q_default_fourcc =3D V4L2_PIX_FMT_JPEG,
> +	.multi_core =3D true,
> +	.jpeg_worker =3D mtk_jpegenc_worker,
> +};
> +
> =C2=A0static const struct mtk_jpeg_variant mtk8195_jpegdec_drvdata =3D {
> =C2=A0	.formats =3D mtk_jpeg_dec_formats,
> =C2=A0	.num_formats =3D MTK_JPEG_DEC_NUM_FORMATS,
> @@ -1945,6 +1958,19 @@ static const struct mtk_jpeg_variant
> mtk8195_jpegdec_drvdata =3D {
> =C2=A0	.jpeg_worker =3D mtk_jpegdec_worker,
> =C2=A0};
> =C2=A0
> +static const struct mtk_jpeg_variant mtk8196_jpegdec_drvdata =3D {
> +	.formats =3D mtk_jpeg_dec_formats,
> +	.num_formats =3D MTK_JPEG_DEC_NUM_FORMATS,
> +	.qops =3D &mtk_jpeg_dec_qops,
> +	.m2m_ops =3D &mtk_jpeg_multicore_dec_m2m_ops,
> +	.dev_name =3D "mtk-jpeg-dec",
> +	.ioctl_ops =3D &mtk_jpeg_dec_ioctl_ops,
> +	.out_q_default_fourcc =3D V4L2_PIX_FMT_JPEG,
> +	.cap_q_default_fourcc =3D V4L2_PIX_FMT_YUV420M,
> +	.multi_core =3D true,
> +	.jpeg_worker =3D mtk_jpegdec_worker,
> +};
> +
> =C2=A0static const struct of_device_id mtk_jpeg_match[] =3D {
> =C2=A0	{
> =C2=A0		.compatible =3D "mediatek,mt8173-jpgdec",
> @@ -1966,6 +1992,14 @@ static const struct of_device_id mtk_jpeg_match[] =
=3D {
> =C2=A0		.compatible =3D "mediatek,mt8195-jpgdec",
> =C2=A0		.data =3D &mtk8195_jpegdec_drvdata,
> =C2=A0	},
> +	{
> +		.compatible =3D "mediatek,mt8196-jpgenc",
> +		.data =3D &mtk8196_jpegenc_drvdata,
> +	},
> +	{
> +		.compatible =3D "mediatek,mt8196-jpgdec",
> +		.data =3D &mtk8196_jpegdec_drvdata,
> +	},
> =C2=A0	{},
> =C2=A0};
> =C2=A0
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> index b3142dc9be85..e453a1634f33 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> @@ -45,6 +45,9 @@ static const struct of_device_id mtk_jpegdec_hw_ids[] =
=3D {
> =C2=A0	{
> =C2=A0		.compatible =3D "mediatek,mt8195-jpgdec-hw",
> =C2=A0	},
> +	{
> +		.compatible =3D "mediatek,mt8196-jpgdec-hw",
> +	},
> =C2=A0	{},
> =C2=A0};
> =C2=A0MODULE_DEVICE_TABLE(of, mtk_jpegdec_hw_ids);
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> index 82c971936c4d..b30c728c3712 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> @@ -52,6 +52,9 @@ static const struct of_device_id mtk_jpegenc_drv_ids[] =
=3D {
> =C2=A0	{
> =C2=A0		.compatible =3D "mediatek,mt8195-jpgenc-hw",
> =C2=A0	},
> +	{
> +		.compatible =3D "mediatek,mt8196-jpgenc-hw",
> +	},
> =C2=A0	{},
> =C2=A0};
> =C2=A0MODULE_DEVICE_TABLE(of, mtk_jpegenc_drv_ids);

--=-YBjB4a/FKYc454GerwhG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUHT2AAKCRDZQZRRKWBy
9IZqAPkBoSLa+bFdlDtR1FQo5Uc5A2dt+rMGU51H/CGtt205EAEAqnmGw/ine3cr
vP6MeovY8uQj7THLju96VbvCAKmDCQY=
=jQmg
-----END PGP SIGNATURE-----

--=-YBjB4a/FKYc454GerwhG--

