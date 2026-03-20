Return-Path: <linux-media+bounces-56558-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGxcM1yIvWnQ+gIAu9opvQ
	(envelope-from <linux-media+bounces-56558-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 18:48:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B70BB2DEE51
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 18:48:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0D64A300DEDA
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 17:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A271C3033E8;
	Fri, 20 Mar 2026 17:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="zynVHsnG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD54283FC5
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 17:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774028884; cv=none; b=iJER/C+/gE7Z9ClGt8EMPeUkMuMyfNqlQTp7C/TVEQLC+J5wFRypCxiJnWOPyDRFqA67FRNz33fqcCusvNuS7NsNMP0ugcOjV5k3gM/pQxvttCtCYQDwMG+iGXBgU8rDT8zfshL1UFRegdJZs8JcQaIsW7UWt9dH2PL0pe0s2g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774028884; c=relaxed/simple;
	bh=ppq+woC9EgkhRjYSo1FqN2MHY1nF7CaPwY54og0DPeI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rJqohYawJWgrZUmLn+OtzniN+TmNv1Dm4ms8xweO3pm56zPTlS+aCiI39NAFmR+/pVnrwjrAvJYDS+9VwryAebPukUDxTi/xqOoydeNgPGYBzcvog3Cw+uU+caZzcSv5b4luUq2/xUdUNyu9QiXSxM3Tq1cgrYI5ZXW+71Ani6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=zynVHsnG; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8cfd44fa075so33875385a.0
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 10:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1774028880; x=1774633680; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=H3CCOGtwXJ4+/c4xKC51d2CLIBrX+gi1qbIE0AmJJek=;
        b=zynVHsnGGICsqohvhuI3aYPDbUWbEYQDBT9gcn85VcYAA7uKBQouoEAprXGin9Vesq
         jmFvF61rFz+Js+UgLMFYsWa6zSde4E6dEuLRzmue6iFFDiNUbFW0pbRAZcxyihmgNNn8
         a8/RDeY9L2MegP7qGIyyvUBZ8UFj4IYobhDlfGCg37BEFL76JZQMuT5D8fItu9jxM5hq
         coHSetnavTnfJoofZKJUBFFzvc8r5q7hZw/DBDszv3Db7AIMn3pwJfsBRDUGeDSq4+sG
         waFH7H4A9b7vMKePlCE2UHBaNornfW0GTdHqimbS6kE1DK/QjZzGBxtW+NAb/D598naH
         +oxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774028880; x=1774633680;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H3CCOGtwXJ4+/c4xKC51d2CLIBrX+gi1qbIE0AmJJek=;
        b=QfcDqoXLsm01jEgAuzFCgjZ/I2oU9nkWbqHymKCgYJKnNYiyMlCOWztEXAa3J8W5S6
         fY80yKggCsuHgp/14bMN7Mp0jl5Dq60V1OPYiE+r6tH6Orptlnj6IW9fMCZFhO3GDyP4
         ZzGb0GR/9O84ANzkX0M4hkboHEQIi2LUgsunrPLdaUsCVHLT4bXgbODnqvxsfS31ub75
         Clz0lIycd9rGxFN87bQ9bTeK9+beDEGaM3LNTuRvhfQ9QA6Fp5nRxgZh2omz5XPqxLL6
         e3XwTda634qdg6vsXS2Ma+Xjwn5XJVhnZcPTSvXSDGnh4ZPnCYkLsmb9DqlPheMHffcn
         /9Qw==
X-Gm-Message-State: AOJu0YzVMA+ZNBS02F/R0ufJeTwuh8weQ0o8R7P5ly0z2fqdA4M5rnyV
	t2vu+6HgjHg55r0ZID29peS9EToQomqPdEasfNGqh2m9xSzou2paK65VvaFGre5MUN4=
X-Gm-Gg: ATEYQzzVdOFn+H4PW/yGVpaK9odCMg0Am8PFwIvsflD2q8s9cbz+qW7hQCqDJvAmH4H
	WTN1pzVtlO94IGvzT2Qn4r5UzdQX2m9uyN+Tqoj7xB9Ydg1BQi19omt3J1DZpQysWT+wG39wElw
	CeB9nB7SWr0/A74Hpi8nShaphNS/yjzA7O2ar+WnjvmhF3K/EJgyFj1Y0PwTLeHIq8pDASkaXgZ
	Y6JziC75csdTxcp+uFOlxxWGEfTp5iPPSDCmSpzV5vhIceoLbDkt00g1y+oLoPSsEeTQW7GGLmF
	Kt1djK6PyhTbKn/Cvvb/A8ARd9EFjutofz5i/tZJAdTh0bauEeSO4g0SIOFMuiPMd3ntsi85lZQ
	dX3j+4gd9ybXcwV4e/+JG3M9FX+EEncDAsm1GT1Ua9LBozuTB4WA0h2rizOIQzzA4OOJwz1ic20
	pfYVDJzQBao8xjvP5cie6v5O/XolvghgGOVvpgt1c=
X-Received: by 2002:a05:620a:1a29:b0:8cd:982d:411d with SMTP id af79cd13be357-8cfc7f6c676mr563879485a.52.1774028879543;
        Fri, 20 Mar 2026 10:47:59 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c85214a43sm25647846d6.6.2026.03.20.10.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 10:47:58 -0700 (PDT)
Message-ID: <c154098ce7fd5d6bfcb44066b7c1f0cde07ff81d.camel@ndufresne.ca>
Subject: Re: [PATCH v3 11/27] media: rockchip: rga: avoid odd frame sizes
 for YUV formats
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
Date: Fri, 20 Mar 2026 13:47:57 -0400
In-Reply-To: <20260127-spu-rga3-v3-11-77b273067beb@pengutronix.de>
References: <20260127-spu-rga3-v3-0-77b273067beb@pengutronix.de>
	 <20260127-spu-rga3-v3-11-77b273067beb@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-aiCC/tPL3UyCTVFf/HVn"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.16 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56558-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[ndufresne-ca.20230601.gappssmtp.com:+];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ndufresne-ca.20230601.gappssmtp.com:dkim,ndufresne.ca:mid,pengutronix.de:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B70BB2DEE51
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-aiCC/tPL3UyCTVFf/HVn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 27 janvier 2026 =C3=A0 15:39 +0100, Sven P=C3=BCschel a =C3=A9crit=
=C2=A0:
> Avoid odd frame sizes for YUV formats, as they may cause undefined
> behavior. This is done in preparation for the RGA3, which hangs when the
> output format is set to 129x129 pixel YUV420 SP (NV12).
>=20
> This requirement is documented explicitly for the RGA3 in=C2=A0 section 5=
.6.3
> of the RK3588 TRM Part 2. For the RGA2 the RK3588 TRM Part 2
> (section 6.1.2) and RK3568 TRM Part 2 (section 14.2) only mentions the
> x/y offsets and stride aligning requirements. But the vendor driver for
> the RGA2 also contains checks for the width and height to be aligned to
> 2 bytes.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga.c | 19 ++++++++++++++-----
> =C2=A01 file changed, 14 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 21a3c6cd38dbc..4fa6adb10b7ee 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -337,6 +337,19 @@ static int vidioc_try_fmt(struct file *file, void *p=
riv, struct v4l2_format *f)
> =C2=A0	struct rga_ctx *ctx =3D file_to_rga_ctx(file);
> =C2=A0	const struct rga_hw *hw =3D ctx->rga->hw;
> =C2=A0	struct rga_fmt *fmt;
> +	struct v4l2_frmsize_stepwise frmsize =3D {
> +		.min_width =3D hw->min_width,
> +		.max_width =3D hw->max_width,
> +		.min_height =3D hw->min_height,
> +		.max_height =3D hw->max_height,
> +		.step_width =3D 1,
> +		.step_height =3D 1,
> +	};
> +
> +	if (v4l2_is_format_yuv(v4l2_format_info(pix_fmt->pixelformat))) {
> +		frmsize.step_width =3D 2;
> +		frmsize.step_height =3D 2;

For V4L2_PIX_FMT_YUV422P and NV16 this is 2/1. I believe you can generalize=
 this
with the format info, and skip this conditions:

		.step_with =3D info->vdiv,
		.step_height =3D info->hdiv

Though, I'm saying that from a pixel format perspective, if the HW needs 2/=
2 for
all YUV formats, let me know, I'll give my Rb.

Nicolas

> +	}
> =C2=A0
> =C2=A0	if (V4L2_TYPE_IS_CAPTURE(f->type)) {
> =C2=A0		const struct rga_frame *frm;
> @@ -358,11 +371,7 @@ static int vidioc_try_fmt(struct file *file, void *p=
riv, struct v4l2_format *f)
> =C2=A0	if (!fmt)
> =C2=A0		fmt =3D &hw->formats[0];
> =C2=A0
> -	pix_fmt->width =3D clamp(pix_fmt->width,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hw->min_width, hw->max_width);
> -	pix_fmt->height =3D clamp(pix_fmt->height,
> -				hw->min_height, hw->max_height);
> -
> +	v4l2_apply_frmsize_constraints(&pix_fmt->width, &pix_fmt->height, &frms=
ize);
> =C2=A0	v4l2_fill_pixfmt_mp(pix_fmt, fmt->fourcc, pix_fmt->width, pix_fmt-=
>height);
> =C2=A0	pix_fmt->field =3D V4L2_FIELD_NONE;
> =C2=A0

--=-aiCC/tPL3UyCTVFf/HVn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCab2ITQAKCRDZQZRRKWBy
9FnHAP9MXGaIWpolRasMrqQ7Y5bXCM/vLXshxf2/etb9oydBUwD+KLxgWdY37E/D
WBZ3ODJn/aS23VsB+5pnmZYe6avkqgI=
=XjGb
-----END PGP SIGNATURE-----

--=-aiCC/tPL3UyCTVFf/HVn--

