Return-Path: <linux-media+bounces-49496-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D92CDCC35
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 16:51:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1F9C300F304
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 15:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DA9F327200;
	Wed, 24 Dec 2025 15:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="RDssSKy/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006B51A3165
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 15:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766591447; cv=none; b=mzvq9r7iNmDayAkwcu39gWIus4L71AcBuVTB62kveRkm7snDDw2d5+p9mzBm6TxyYCOeybymH7MyaHIgbC+ktCgK8a2DDKpcynfHcZhXBXMLU0IeHyLCN0AXpkiToWpPeIvhAFm3lLh45dChCJxiDmaOi3nQiZNpPPj0b9sz2wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766591447; c=relaxed/simple;
	bh=/Ea/rB3LN0HquXeha074nkqVsH9FSf9jy6TvycaFmXw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qNpZzkFJMF3bqZJ4vz7jeg38XkQtjvCV7qUvCik9IEcoP+b8mD7nXGkI1fVG7nmjs4DbEvUXSa+59IIKkApHeJCl8rk2xJ7SWq9d10g3GmQGspOgXl4l5Fv2PwVUKC3oRW8R+jGQpWckyxu/BxUPefB/ZlVmlEfRIXvanQz4jEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=RDssSKy/; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4ee19b1fe5dso65794261cf.0
        for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 07:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1766591445; x=1767196245; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QSdmNzll22GS36dUZyYftlYEWLa006on7/6Z+DJM0ag=;
        b=RDssSKy/kYmRqnScBofubBXEBWJJj8L+z1l+lE8b2gOFS7cJhQt6lDCKlDpkj4RR6T
         Fe3ururyLgTIo3HDz2Y8oaSAPWa36OL0RfwWy/w2AsGzSHlpQtdLmGHxu8YCOV/91HH9
         iu2oZgzqe52V5ZW4D5ZW/zklcS9jFEfZpGMGjBvxmQ6XwWIhGgcrKhUouOD1wTBWqOTC
         2FsfYZMh7N+oOpE7b/fzdIdY/MmVsYAY6flRi/6njE80aYieVG2arObQWEhImjxhf0Ry
         g8Y3cXg6vAukk69x02st0+aKmcgYj2VYavqjwKPV3DkDTXHr0CysIHcuvaa/+uzlvWK3
         Q6Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766591445; x=1767196245;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QSdmNzll22GS36dUZyYftlYEWLa006on7/6Z+DJM0ag=;
        b=lgmllQ6TL00nN7bCZMQyh/K025d4Q3lXyHUdSV07R+/KTD3fufAIIva9s5G2zZJ8qB
         9L6SFwthr3mcV5VY/SwAh7Pr5DhC4oZzz6pY9i+11t2JZWkNZcHmNkRbom1IbvtvI35u
         xwgBc5Ruo4tBOZtXO92L5RbsH6nftc3VnpFAIp4D/YhXXmJTvrC6GajtMvYTP/yb/fN4
         +OhEQXTO/Df3UfsKJ4tkKtkcPBI9XSafpSC1ENCqHPMnBN8STnkpnYDyluCECXlJtCP6
         4bw9h4qCFWTv9WFxjUEmIiMB7F1Y4b+wEcEafLSFcV9NHchk3ZscKLH8mMenjnhwyPph
         e1nw==
X-Gm-Message-State: AOJu0YxZrOYLuM2hZDllx8Z9EL1InThxnq9jrpDK1dUGmtZM3IAfoo7S
	EuFTDw0sJjR038ZZwG9OpcRhLN6V1VnVJZf8AjaNko6iJmy6uaw7QosEngb/4+Gyib4=
X-Gm-Gg: AY/fxX60SOQdzB6Odv8do7R3OM96kIDRnfqyJm/zNdCkXJhenNT0lJETxSs61lwWiQT
	G3ssR4bHh1GME4imZYClzTsWoN0QYQA3cX3yfDAJPgblN1lq862DZH1eJp1l0v2l95A66Y0SskH
	Yq0BCcrXJwtCpzmH+S5e2uWn7xXS6sPNlOJevG1nNv8owDWv7dx2N3HYg/fxh8xnZIWSf4RgwAV
	XR6mf4z304fPeeiwNsX8GlX/bEGS2J/m1+SkJH6eNlhll9fW2Z3vtoSjykXzPyFw/dMCgDkEti3
	rWRhG3IwBwjFI8RGTwlRwk8j/jWeK0Y5DCHSo3mm4KKnJ0cl+uhl5mbPLaETS6XUawQlz9Ih8F9
	rQBlbX3KIMvcYTZ3uDhAggdE5hgncvYbrRXORkTqKf14eBG0QVKu6evHPeTJybMzb/3aARBxyyp
	hDZKDXF6sWyVLa/5Aj
X-Google-Smtp-Source: AGHT+IHFpvl7atlI/XfDElSp1cFHnazASDvVJwr4LLKxB3XCrMdiPROiP2O9X2LigLf12PzE9tOSRw==
X-Received: by 2002:a05:622a:4013:b0:4ee:4a8b:d9ed with SMTP id d75a77b69052e-4f4abda9f56mr233284001cf.58.1766591444898;
        Wed, 24 Dec 2025 07:50:44 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac62d53dsm127169351cf.19.2025.12.24.07.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 07:50:44 -0800 (PST)
Message-ID: <d09691bfde08f80e4cb47cc365d86bd53d0aaa7c.camel@ndufresne.ca>
Subject: Re: [PATCH v2 15/22] media: rockchip: rga: share the interrupt when
 an external iommu is used
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, Jacob Chen
	 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@pengutronix.de, Michael Olbrich
	 <m.olbrich@pengutronix.de>
Date: Wed, 24 Dec 2025 10:50:42 -0500
In-Reply-To: <20251203-spu-rga3-v2-15-989a67947f71@pengutronix.de>
References: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
	 <20251203-spu-rga3-v2-15-989a67947f71@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-6E1pOz363AUSc4hyqasF"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-6E1pOz363AUSc4hyqasF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 03 d=C3=A9cembre 2025 =C3=A0 16:52 +0100, Sven P=C3=BCschel a =
=C3=A9crit=C2=A0:
> From: Michael Olbrich <m.olbrich@pengutronix.de>
>=20
> The RGA3 and the corresponding iommu share the interrupt. So in that
> case, request a shared interrupt so that the iommu driver can request
> it as well.
>=20
> Signed-off-by: Michael Olbrich <m.olbrich@pengutronix.de>
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga.c | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga.c
> b/drivers/media/platform/rockchip/rga/rga.c
> index f28ec88c186fa..1bfc4021f4a7b 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -718,7 +718,8 @@ static int rga_probe(struct platform_device *pdev)
> =C2=A0		goto err_put_clk;
> =C2=A0	}
> =C2=A0
> -	ret =3D devm_request_irq(rga->dev, irq, rga_isr, 0,
> +	ret =3D devm_request_irq(rga->dev, irq, rga_isr,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rga_has_internal_iommu(rga) ? 0 =
: IRQF_SHARED,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_name(rga->dev), rga);
> =C2=A0	if (ret < 0) {
> =C2=A0		dev_err(rga->dev, "failed to request irq\n");

--=-6E1pOz363AUSc4hyqasF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUwL0gAKCRDZQZRRKWBy
9LU3APkBQSKkig2rWR6l9nTBHBKlDlfrlSgOBpfmOmasl3/xlwD/f5YFD3P7hHgs
8Jh8k6G/iOd6tWyXItvEbDbD2Trhzgs=
=KLzg
-----END PGP SIGNATURE-----

--=-6E1pOz363AUSc4hyqasF--

