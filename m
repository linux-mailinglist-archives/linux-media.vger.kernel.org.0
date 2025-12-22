Return-Path: <linux-media+bounces-49351-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15372CD61EF
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 14:19:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 631B4300BDA7
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 13:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE2172DE1E0;
	Mon, 22 Dec 2025 13:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="PDs8sfWH"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA342DAFCA;
	Mon, 22 Dec 2025 13:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766409565; cv=none; b=lCvm1/YDDKmgb8rFeSA07C6XiEIA6Y9T0j8Slw986QirYXifBR/EsDpqVAc+ZTYrn66aMPK4yBj2fJ5mSvWossFjWDslU/grZrTWpVqaHEbUJGnOqItmFImi+uCKd5x7ohu67sqy+h9cnLg6bc7oRtQFh8cj5icOsNtSMUXyp/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766409565; c=relaxed/simple;
	bh=emf1dXBuOWxpY82o+aXIdtYDx7+Dc4rLBq1gNe0BeaA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AnxuGjkS+soNje3mV+p/xbGDxeS3fYPzlpgHV3LgRE0J7BLUICX9xnwwLCwzp9TKZHvKDcjOpI0KbijSV/VFQljb2sG10N6rYdh96sNnrmDG7CUv7TOp5g8oXSldpC5+pPZjel72/qTmiwHrp0pF2uMcJ/ela3FYyFHhOo8voSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=PDs8sfWH; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1766409561;
	bh=emf1dXBuOWxpY82o+aXIdtYDx7+Dc4rLBq1gNe0BeaA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=PDs8sfWH303jVH3FYT7qAPoxcIRfz0+IgFx6zHCXn4+Mf+M5N7dJP2TR8zfYb72hC
	 +eARnuGWKyPheREfWo8QbLXsVUQP5iSsohy86uw/iPPGbREIzLj/DvMNVovHpSiG6q
	 aUiS7HXqSaELs9ZANYxwrIGddIT0vZmxrGxn9nti5vxJ+4ewjkQIxwgOlobWiq591i
	 fD0A9HqFYC7pbNuuiDgv1AGzHNdvMwd9DCxpuQ1E/28yb6Y7fjJUoRMMno9U8aGvB6
	 zGuaJFycpjK4eXZAbUQHhqCeHOmrukYO7YlPyIpFgKT6wh9YAXhvC5tpTzrjX6lF6Q
	 8qLSv6xCyka/A==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EF08A17E0125;
	Mon, 22 Dec 2025 14:19:18 +0100 (CET)
Message-ID: <bf4a8049f49b8d6d8a39faecee025dce51d59db3.camel@collabora.com>
Subject: Re: [PATCH v7 14/17] media: rkvdec: Add H264 support for the
 VDPU381 variant
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jianfeng Liu <liujianfeng1994@gmail.com>, detlev.casanova@collabora.com
Cc: corbet@lwn.net, daniel.almeida@collabora.com, didi.debian@cknow.org, 
	ezequiel@vanguardiasur.com.ar, hansg@kernel.org, heiko@sntech.de, 
	hverkuil@kernel.org, james.cowgill@blaize.com, jonas@kwiboo.se, 
	kernel@collabora.com, laurent.pinchart@ideasonboard.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	mchehab@kernel.org, opensource206@gmail.com, ribalda@chromium.org, 
	sakari.ailus@linux.intel.com, yunkec@google.com
Date: Mon, 22 Dec 2025 08:19:16 -0500
In-Reply-To: <20251220164604.10052-1-liujianfeng1994@gmail.com>
References: <20251218232829.337811-15-detlev.casanova@collabora.com>
	 <20251220164604.10052-1-liujianfeng1994@gmail.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
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
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-x0PCQHDfMIfaKLpNVYF3"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-x0PCQHDfMIfaKLpNVYF3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le dimanche 21 d=C3=A9cembre 2025 =C3=A0 00:46 +0800, Jianfeng Liu a =C3=A9=
crit=C2=A0:
> Hi,
>=20
> On Thu, 18 Dec 2025 18:28:24 -0500, Detlev Casanova wrote:
> > +static int rkvdec_h264_start(struct rkvdec_ctx *ctx)
> > +{
> > +	struct rkvdec_dev *rkvdec =3D ctx->dev;
> > +	struct rkvdec_h264_priv_tbl *priv_tbl;
> > +	struct rkvdec_h264_ctx *h264_ctx;
> > +	struct v4l2_ctrl *ctrl;
> > +	int ret;
> > +
> > +	ctrl =3D v4l2_ctrl_find(&ctx->ctrl_hdl,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_STATELESS_H264_SPS);
> > +	if (!ctrl)
> > +		return -EINVAL;
> > +
> > +	h264_ctx =3D kzalloc(sizeof(*h264_ctx), GFP_KERNEL);
> > +	if (!h264_ctx)
> > +		return -ENOMEM;
>=20
> I can see the sps validation is removed:
>=20
> 	ret =3D rkvdec_h264_validate_sps(ctx, ctrl->p_new.p_h264_sps);
> 	if (ret)
> 		return ret;
>=20
> This should fix decoding issue with chromium when minimum size of h264
> decoder is lower than 32. While I find this issue is caused by chromium
> not following v4l2 stateless spec, and I think checking sps at start
> should be still necessary.

One of the missing part of rkvdec is that once you set the OUTPUT format we=
 only
reset the capture format, but we should also reset the SPS control to a mat=
ching
default, matching the resolution and resetting the depth. In fact, I don't =
even
see code that verify the bit depth against already allocated memory, and th=
e is
not capable of converting.

I tend to agree with Jianfeng, that we should leave that un-modified until =
we
have time to fully address and test this situation.

Nicolas

>=20
> I have sent a fix to chromium[1] and it should get merged later.
>=20
> [1] https://chromium-review.googlesource.com/c/chromium/src/+/7274555
>=20
> Best regards,
> Jianfeng

--=-x0PCQHDfMIfaKLpNVYF3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUlFVAAKCRDZQZRRKWBy
9KYSAQCyLydUKeXmCMqZ6Lz6eQ45ZV3TgM87Bo4WJW/g+M1IKQD+LiW5IG8MDVmP
l6tBtIFnYSztPPgjaZjO29BF1siDCgg=
=XJKL
-----END PGP SIGNATURE-----

--=-x0PCQHDfMIfaKLpNVYF3--

