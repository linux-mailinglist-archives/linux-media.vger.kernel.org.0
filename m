Return-Path: <linux-media+bounces-48718-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75413CB97D7
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 18:56:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FC4330B6AC9
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 17:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B872F2F5324;
	Fri, 12 Dec 2025 17:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="pwg7RUlX"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB022F39C7;
	Fri, 12 Dec 2025 17:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765562041; cv=none; b=aYIGM0VobVVw7AkCr9LenaZyy0QvpLVnz6MRp14Zt8KW5mHsUmPhVrj0V7yZBBpa5bBl9C+ev7jfbnWBkNJAX1V0RatWFLHc6reI/4tqO6bbvDDvGmmg2LyeM1ASSe5snGaXhyoKSXWLgzbpiJnatSw57CJ/fmWjaWihpIIf/BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765562041; c=relaxed/simple;
	bh=gtkyj6GVsnbIOX5ifyV1wXuJ94FHbpTY0m8F56kuYVE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cqJGIeiTsyYeY5oVmZzq++Wn+2iniLSDP8xOJ3fQE79+s/H+6lNjeOWxJoT1MlnP+M5L9SdY98E8hqQ39vIrHBqx9wWrZpXirGoyJ7wW+cH4ndbe2kgh57Z9RfnQqpDd9+Xk6gvx2IY9PseLL3W2E+p8YjT4Y5dyf/G2YNqrTig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=pwg7RUlX; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765562037;
	bh=gtkyj6GVsnbIOX5ifyV1wXuJ94FHbpTY0m8F56kuYVE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=pwg7RUlXd6jlDI3QCZAwaCZFvUfjhLVxRXyz7uodRpiNmbgZc7meqjmjra/RetixY
	 j9sO8NEsFXlZcMLZV6QVMSZzgAfu/6ZkupsmOz8dwomQl7msb7x0P9X3ENiKsRC0cb
	 7iXbqe4h3yYtqu0FcHWAO1FL57yumqE2k8A4Q0V3jrjRl+IC+6H8qA9Eqv3WHt4oCd
	 qrBlk6U7oBJd1FpQETRNIWilRymtHspUmEDW8qWxIN8c2bQ1rswI6f6Nmh35OK26vj
	 yy9GMT6gbBb0tZTUGKuRKcMDj2znEe2B6vuFpNOK46xVNj7yW9OMirtIQgQyDMbth1
	 aMoVJ8Fr84HpA==
Received: from [IPv6:2606:6d00:17:7b4b::5ac] (unknown [IPv6:2606:6d00:17:7b4b::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E2F3C17E110C;
	Fri, 12 Dec 2025 18:53:55 +0100 (CET)
Message-ID: <8f24c8204984a46bad7d0bb24b78c8115906f748.camel@collabora.com>
Subject: Re: [PATCH] media: rkvdec: set ctx->image_fmt in
 rkvdec_s_capture_fmt
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jianfeng Liu <liujianfeng1994@gmail.com>, 
	linux-rockchip@lists.infradead.org
Cc: Jonas Karlman <jonas@kwiboo.se>, Detlev Casanova	
 <detlev.casanova@collabora.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>,  Hans Verkuil <hverkuil@kernel.org>, Heiko
 Stuebner <heiko@sntech.de>, Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, 	linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Date: Fri, 12 Dec 2025 12:53:53 -0500
In-Reply-To: <20251212154138.3042300-1-liujianfeng1994@gmail.com>
References: <20251212154138.3042300-1-liujianfeng1994@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-KGnTfVc2/BqU11O39I7Y"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-KGnTfVc2/BqU11O39I7Y
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 12 d=C3=A9cembre 2025 =C3=A0 23:41 +0800, Jianfeng Liu a =C3=A9=
crit=C2=A0:
> ctx->image_fmt is initialized as RKVDEC_IMG_FMT_ANY at
> rkvdec_s_output_fmt, and get set at rkvdec_s_ctrl when userspace sends
> SPS info via VIDIOC_S_EXT_CTRLS. This works fine with gstreamer because
> it sends SPS info to kernel driver before requesting capture queue bufs.
>=20
> But chromium requests capture queue bufs first and then sends SPS info
> to kernel, then rkvdec_s_ctrl will return -EBUSY, and the video is
> displayed green.
>=20
> Chromium calls VIDIOC_S_FMT to capture queue instead before requesting
> capture queue bufs, so setting ctx->image_fmt in rkvdec_s_capture_fmt
> will make rkvdec_s_ctrl return 0 when the first SPS info sent to driver.

I'm reading you here, and reading the spec again [0], and you are saying th=
e
Chromium isn't following the initialization process. That means, it should =
be
impossible to allocate 10bit capture buffer, since the SPS in place specify=
 the
color depth. Other parameters in other codec can influence the reference bu=
ffer
size, so you could endup with the wrong allocation.


[0] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-stat=
eless-decoder.html#initialization


>=20
> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
> Fixes: d35c64eccf3b1 ("media: rkvdec: Add get_image_fmt ops")
> ---
>=20
> =C2=A0drivers/media/platform/rockchip/rkvdec/rkvdec.c | 12 ++++++++++++
> =C2=A01 file changed, 12 insertions(+)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> index 5af9aa5ab353..e7939d604f64 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -537,6 +537,18 @@ static int rkvdec_s_capture_fmt(struct file *file, v=
oid
> *priv,
> =C2=A0		return ret;
> =C2=A0
> =C2=A0	ctx->decoded_fmt =3D *f;
> +
> +	u32 fourcc =3D f->fmt.pix_mp.pixelformat;
> +
> +	if (fourcc =3D=3D V4L2_PIX_FMT_NV12)
> +		ctx->image_fmt =3D RKVDEC_IMG_FMT_420_8BIT;
> +	else if (fourcc =3D=3D V4L2_PIX_FMT_NV15)
> +		ctx->image_fmt =3D RKVDEC_IMG_FMT_420_10BIT;
> +	else if (fourcc =3D=3D V4L2_PIX_FMT_NV16)
> +		ctx->image_fmt =3D RKVDEC_IMG_FMT_422_8BIT;
> +	else if (fourcc =3D=3D V4L2_PIX_FMT_NV20)
> +		ctx->image_fmt =3D RKVDEC_IMG_FMT_422_10BIT;

You cannot accept a format that falls against the color depth in the SPS
control, and rkvdec does not do color conversion implicitly. This can other=
wise
lead to letting the HW overrun the buffer (forcing 8bit with 10bit content)=
. Can
you check with Chromium dev if they can perhaps adhere to the spec instead =
?
This is all news to me, but I probably never had to test 10bit playback in
Chromium outside of MTK (which might not be less strict, hopefully done the
right way).

regards,
Nicolas

> +
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0

--=-KGnTfVc2/BqU11O39I7Y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTxWsQAKCRDZQZRRKWBy
9MH3AQDUhY3sqERSYtPJTOv2OrLvOyQdReWs2GtPrwGsJMqh2QD+PVv2MeM6/3Va
0A0tGbG6GO39dojfMxGwmdL9Ady4ggs=
=sO55
-----END PGP SIGNATURE-----

--=-KGnTfVc2/BqU11O39I7Y--

