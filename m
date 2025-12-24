Return-Path: <linux-media+bounces-49493-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCFACDCBBA
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 16:40:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C98513007E51
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 15:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 903202E0914;
	Wed, 24 Dec 2025 15:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="WvPfh77s"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AA12DF12E
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 15:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766590829; cv=none; b=uH5l4IjhUQVzx+z4LEwOGEE/Slq638fWBULdOx8ZD+jdBLMeCU1RvrfZNrwyXyX8rn8BvKdaH3DWxy0JxrEfUscntOV64yeQYyZZ69Lj4HS8rUO08yq7hy/x/f5Zn+S0P2BslAXnRAbJznwEhQCx3ztIhsmt4jXM0sqt/oDRHrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766590829; c=relaxed/simple;
	bh=TyodQTCUrGkN41GOV+M80fLmYD+Zd8hzUbujOcZoOLg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kuilsB2RoOUvCfkrcPr5Min+Z9gNrJMUjtd6xDtvGPgKEyD0YmUz8rHrcL03gqhCmaNAZYR4YsSbt9J3lnyTyI9FTeyewHW7WkKK31YExNppeKQyEYRzj5edcqE6c1BgI0TFdvY8H+XV8/iewYn2ZkdmZB9WeQMdDCvgAW0Qy/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=WvPfh77s; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4f4c89f8cc6so33541651cf.1
        for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 07:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1766590826; x=1767195626; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pAmfkVw/Atrc5NO3olNtAEeap9hF5Cv5ikmx5qoCtMA=;
        b=WvPfh77sgyKbxOQ+EgVERSM5FJcBz4LFTK5sGWxp+q+bqfkS0/WOMYaatbqJN14pOH
         H0JXtO36p6pM4Yte1aWdR9ien1j/fISysYsubvfqKoXPM0ZRB5Vz0xm8mo7QKoZUIrxa
         vnBb/apj6E3EgW++fJa0KZc0xASTxKyTBI/qI9h3hwQ/c78VPMcEmVz84jMVI5p69iUZ
         kmYvIKkdqfr9ehs24/Y6wM/H9lylQn9sBiM/4zUq+HJT9dXryM+FuJKhDIdRln/uYQVv
         d1dcbZeLhE6gbHMOTEWUJQ8mvd1s8t4wsO7uanXLMrHOKAlkCCyNcZhTHv2aeihuyW8O
         8Dcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766590826; x=1767195626;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pAmfkVw/Atrc5NO3olNtAEeap9hF5Cv5ikmx5qoCtMA=;
        b=Lg+Rihkfr8OWJMxBrQ6ClZjhrPO/kq3puv2UM6gl6kPbw/IVfJBzrfUAWRztUce/HN
         gwEyVgXHD04fiDmqJFDd71oLJyaFqOB0RC57tEqBFAI7JFIsPeXgkUSo4f8OB0urXi3q
         phV8l2nl9gXwN84Ku9yQD+fErQD3+OA2zA3IH8aVSg5x6IvPCgi8qgmeUi0dM93ql+rW
         07squWVc2+Sx6T0JMnXvrRc4PiBYTED2TyZkJKSyf0XaERKBI6VxC5bQh8aYGhX1kPCK
         Iq1IVJp9YZryyBtwk27GCKuTwxxxy2F38qkwj8SUcsnV8yvCHkJpYhGnQmRcMMPgeEn7
         jBuw==
X-Gm-Message-State: AOJu0Yz/VLIpU+dySAd/q4YunFF52zmnwkrQ1VK2XdLBbxL4ktbIi6ZP
	UA7JONfE5XgiH0qg2uCCIIRsD9YJefJFl6nZwjnPR/dSJiBtATuWGc8J1YcrKqp2E2o=
X-Gm-Gg: AY/fxX5UDaX4vsvidbSPW9mx+0rRwFN80/zosoKNEL98bF3xC+lGJldyROSsRTSHPg8
	+9/NJH224wVvV2S4RLz2uZIJHxQlWcvYn9w5kpEIP7WsCjsF2afPniTIoRDUk0mkc+kSApVbEP+
	awnF+Cx7y/mnI5DJcblDYx6XuKNXR81fK+6/NWQABvlWGeTtIQMOfElkf+XfSzANDiRUCw99TEu
	n9j6GMmEg8utoVUaEndpMsbvDpsydrh/g+tc1KywhRCWQdhPmBXoU27HM0LTl5yvHhSKaNG31h7
	fUfKhVh5mnCuJ5uQPXqZmPANt3pOhE8vrmJ1+5hLjWVbreiyni1oa2s9k4789+EiBNLqQ487zWp
	HqMRvywVSMLKy5iSaFW200WGwlwOnYZGOd9jH6kE/kPg2K5/CWp54ceFMbaFZ9txMCZuJsDwkK9
	p3D6NeMYEoNYsyB/g5Wfh9hTD7Zdc=
X-Google-Smtp-Source: AGHT+IFVTDqo5NImuh8dJflj1u+j/C11vEMKbGl2sIOtRl+G9xzRhCF4eVp8IhKaJjVBWMPJWs768g==
X-Received: by 2002:a05:622a:64b:b0:4f1:ca48:cd3 with SMTP id d75a77b69052e-4f4abdca4dbmr280365181cf.80.1766590826197;
        Wed, 24 Dec 2025 07:40:26 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4d5f042a7sm54571791cf.27.2025.12.24.07.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 07:40:25 -0800 (PST)
Message-ID: <76ed32b0827b59a8e5c27f5aed0acad25b7346ee.camel@ndufresne.ca>
Subject: Re: [PATCH v2 12/22] media: rockchip: rga: use card type to specify
 rga type
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
Date: Wed, 24 Dec 2025 10:40:24 -0500
In-Reply-To: <20251203-spu-rga3-v2-12-989a67947f71@pengutronix.de>
References: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
	 <20251203-spu-rga3-v2-12-989a67947f71@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-iSVsm9iaJru3TcFBKLaq"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-iSVsm9iaJru3TcFBKLaq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 03 d=C3=A9cembre 2025 =C3=A0 16:52 +0100, Sven P=C3=BCschel a =
=C3=A9crit=C2=A0:
> In preparation of the RGA3 support add a filed to the rga_hw struct
> to specify the desired card type value. This allows the user to
> differentiate the RGA2 and RGA3 video device nodes.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga-hw.c | 1 +
> =C2=A0drivers/media/platform/rockchip/rga/rga.c=C2=A0=C2=A0=C2=A0 | 4 +++=
-
> =C2=A0drivers/media/platform/rockchip/rga/rga.h=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A03 files changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media=
/platform/rockchip/rga/rga-hw.c
> index 2ed4f22a999d5..8953960d33bc5 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> @@ -617,6 +617,7 @@ static struct rga_fmt formats[] =3D {
> =C2=A0};
> =C2=A0
> =C2=A0const struct rga_hw rga2_hw =3D {
> +	.card_type =3D "rga2",
> =C2=A0	.formats =3D formats,
> =C2=A0	.num_formats =3D ARRAY_SIZE(formats),
> =C2=A0	.cmdbuf_size =3D RGA_CMDBUF_SIZE,
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 46dc94db6f85e..c9719c7bcfc1c 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -306,8 +306,10 @@ static const struct v4l2_file_operations rga_fops =
=3D {
> =C2=A0static int
> =C2=A0vidioc_querycap(struct file *file, void *priv, struct v4l2_capabili=
ty *cap)
> =C2=A0{
> +	struct rockchip_rga *rga =3D video_drvdata(file);
> +
> =C2=A0	strscpy(cap->driver, RGA_NAME, sizeof(cap->driver));
> -	strscpy(cap->card, "rockchip-rga", sizeof(cap->card));
> +	strscpy(cap->card, rga->hw->card_type, sizeof(cap->card));
> =C2=A0	strscpy(cap->bus_info, "platform:rga", sizeof(cap->bus_info));
> =C2=A0
> =C2=A0	return 0;
> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/pl=
atform/rockchip/rga/rga.h
> index d02d5730b4e3b..ee50f7f3ed601 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -147,6 +147,7 @@ static inline void rga_mod(struct rockchip_rga *rga, =
u32 reg, u32 val, u32 mask)
> =C2=A0};
> =C2=A0
> =C2=A0struct rga_hw {
> +	const char *card_type;
> =C2=A0	struct rga_fmt *formats;
> =C2=A0	u32 num_formats;
> =C2=A0	size_t cmdbuf_size;

--=-iSVsm9iaJru3TcFBKLaq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUwJaAAKCRDZQZRRKWBy
9DfUAP4tGGTGdSumiiCEC5Pd1HfzW6ZpmXvcn4g9LgwJOuZ0LQD+L7bR5JiX40dz
k2R88GKReR7xGFeWdJ5PrYqiYPyTrw8=
=JUrc
-----END PGP SIGNATURE-----

--=-iSVsm9iaJru3TcFBKLaq--

