Return-Path: <linux-media+bounces-49508-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3EBCDD0DD
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 20:45:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2DBE53026A97
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 19:45:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9847B2DCF74;
	Wed, 24 Dec 2025 19:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="AiQSZUOB"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF28B7262F;
	Wed, 24 Dec 2025 19:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766605517; cv=none; b=XxVcqQEqwP3+dQOKFyeAqPVx332H9d1n23u7wfj1dKK6zGLHxWeZ4SIrSDTrUiXrd/uWAhd66w3xaJq+aoPUUk4TDDZRSEUiJLXCejfDLryKq9cnUg+tYHh/d/1OinHBaQPdK5VAqcSNwmDyZF0S9nvUpVINIdLsRHbm7GC03+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766605517; c=relaxed/simple;
	bh=b+G+0yiBIxd9dM8ozJEr/KvT0qpvPfrm8yvO7rpogQo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LDY/7672f+WdWQEjSQI3oMKQ7oA0ixUp1eYasqHnmTVFXagzeFAnvmKuO8ZjnN505HEZxnaTLr6n41nRh+ukmmiBAtMjj7USGA0W4CvBNiAc7q3U+APTxFaj0RdurLWBQbIoN6N4mF3nOu6ATKsPgDjYLVlU7TcGaOt1wrTVKuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=AiQSZUOB; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1766605511;
	bh=b+G+0yiBIxd9dM8ozJEr/KvT0qpvPfrm8yvO7rpogQo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=AiQSZUOB52Pc+L8pvvNs23jDfyZWkTuZI0qG51MMnrOTOXmQyCg0Zq9GH4jTTp2ve
	 EtqFmBPN8i2PjLpdyWsiZObrlVr3LZZrvzIj7j3odQHOIimIjdY+dJs2DvjzXqUUHX
	 ckdFSzZowQY5r5OYC8W4HUjVJsh9rX05iSCilij7aAx+QEHRWDQ3/0SpjJNsxjElf0
	 hcwDtdqsoEeSfWCkkZzbDLbVaYcXpVuctkOuBzu6/A4pnfBULn+jVBeBaPjGbQfT2k
	 5fQ9c/w6JyHoyFf9uUeBtvBqaYK8Ng66rBBqITriUQblIbQzo4W0aF00W+BOW6kifM
	 fsz0wVXXSGF/Q==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 28CAC17E0451;
	Wed, 24 Dec 2025 20:45:09 +0100 (CET)
Message-ID: <75e51a60acd161884c623c991ba87827259f7731.camel@collabora.com>
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
Date: Wed, 24 Dec 2025 14:45:06 -0500
In-Reply-To: <bf4a8049f49b8d6d8a39faecee025dce51d59db3.camel@collabora.com>
References: <20251218232829.337811-15-detlev.casanova@collabora.com>
		 <20251220164604.10052-1-liujianfeng1994@gmail.com>
	 <bf4a8049f49b8d6d8a39faecee025dce51d59db3.camel@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-gur3ft8B/U8bNC0tn3BS"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-gur3ft8B/U8bNC0tn3BS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Detlev,

Le lundi 22 d=C3=A9cembre 2025 =C3=A0 08:19 -0500, Nicolas Dufresne a =C3=
=A9crit=C2=A0:
> Hi,
>=20
> Le dimanche 21 d=C3=A9cembre 2025 =C3=A0 00:46 +0800, Jianfeng Liu a =C3=
=A9crit=C2=A0:
> > Hi,
> >=20
> > On Thu, 18 Dec 2025 18:28:24 -0500, Detlev Casanova wrote:
> > > +static int rkvdec_h264_start(struct rkvdec_ctx *ctx)
> > > +{
> > > +	struct rkvdec_dev *rkvdec =3D ctx->dev;
> > > +	struct rkvdec_h264_priv_tbl *priv_tbl;
> > > +	struct rkvdec_h264_ctx *h264_ctx;
> > > +	struct v4l2_ctrl *ctrl;
> > > +	int ret;
> > > +
> > > +	ctrl =3D v4l2_ctrl_find(&ctx->ctrl_hdl,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_STATELESS_H264_SPS);
> > > +	if (!ctrl)
> > > +		return -EINVAL;
> > > +
> > > +	h264_ctx =3D kzalloc(sizeof(*h264_ctx), GFP_KERNEL);
> > > +	if (!h264_ctx)
> > > +		return -ENOMEM;
> >=20
> > I can see the sps validation is removed:
> >=20
> > 	ret =3D rkvdec_h264_validate_sps(ctx, ctrl->p_new.p_h264_sps);
> > 	if (ret)
> > 		return ret;
> >=20
> > This should fix decoding issue with chromium when minimum size of h264
> > decoder is lower than 32. While I find this issue is caused by chromium
> > not following v4l2 stateless spec, and I think checking sps at start
> > should be still necessary.
>=20
> One of the missing part of rkvdec is that once you set the OUTPUT format =
we only
> reset the capture format, but we should also reset the SPS control to a m=
atching
> default, matching the resolution and resetting the depth. In fact, I don'=
t even
> see code that verify the bit depth against already allocated memory, and =
the is
> not capable of converting.
>=20
> I tend to agree with Jianfeng, that we should leave that un-modified unti=
l we
> have time to fully address and test this situation.

I digged more, and by removing this check, userspace would endup doing:

- S_FMT(OUT, 800x600)
- S_CTRL(SPS, 800x600)
- S_FMT(OUT, 640x480)

And still succeed streamon with that SPS. Since the SPS rarely changes, and
there is no requirement to send it again, a frame decode can be requested, =
and
this miss-match can trigger the hardware to possibly overrun.

For this reason, I cannot take v7.

Nicolas

>=20
> Nicolas
>=20
> >=20
> > I have sent a fix to chromium[1] and it should get merged later.
> >=20
> > [1] https://chromium-review.googlesource.com/c/chromium/src/+/7274555
> >=20
> > Best regards,
> > Jianfeng

--=-gur3ft8B/U8bNC0tn3BS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUxCwwAKCRDZQZRRKWBy
9G6FAQCcudgu0v4em8zmhWRxJNMcDV+NXLp0e8u+fid1pFGqoAD9FbimiTkezVcu
ieRvLC19cECxdlHVj8K245sDJeldSQw=
=xKB6
-----END PGP SIGNATURE-----

--=-gur3ft8B/U8bNC0tn3BS--

