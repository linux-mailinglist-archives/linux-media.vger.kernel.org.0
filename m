Return-Path: <linux-media+bounces-60412-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNeUAn7s+WkLFQMAu9opvQ
	(envelope-from <linux-media+bounces-60412-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 15:11:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 736964CE349
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 15:11:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F2CD1306FFC9
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 13:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB714477992;
	Tue,  5 May 2026 13:09:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D688447A0DE;
	Tue,  5 May 2026 13:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777986591; cv=none; b=AdJyTh+Sibqi7XU+PgfnTiTbIhPJPlb7ayvoLi7aLkSo3hvQ5Mxm2IDVJwt4lKdJviG1fKTU9R64ipdcwlaXL/AguX4uDDWVJ5fYyaWQEaq9oP1ocXyBPvSIcJ5QgE0lTfba2fh3DOcptTW1LIRikaKIcacIxS8radjMCA1EB/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777986591; c=relaxed/simple;
	bh=5ieFLJMSGOSPSZfYVl+lUg2WjCFI+Kug2GPWbar7ei4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IrHGt5yFeRI9S9ORuh+LCk5zJCses9kCbvC21Xl0EoxO5xphUpH5HnGpLnIqT3qi3cb++xVcW05VrjPKl9EAYZf6M1locUNul4p6oxnCIMNr34p5/M6wqBoVVm7qNnLlYSR3sJW61dlhRsFdNnnMgiZinXyyQsYm3yLQvas3QzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id A329B1F8005D;
	Tue,  5 May 2026 13:09:32 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id EDF06B40540; Tue,  5 May 2026 13:09:30 +0000 (UTC)
X-Spam-Level: 
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 72EE5B40540;
	Tue,  5 May 2026 13:09:29 +0000 (UTC)
Date: Tue, 5 May 2026 15:09:26 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: =?utf-8?B?67CV66qF7ZuI?= <mhun512@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Subject: Re: [PATCH v2] media: cedrus: clean up media device on probe failure
Message-ID: <afnsBu1nepWi8yy_@shepard>
References: <20260430142534.12928-1-pakmyeonghun@bagmyeonghun-ui-MacBookPro.local>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OKqRcrL7IoYtAh8b"
Content-Disposition: inline
In-Reply-To: <20260430142534.12928-1-pakmyeonghun@bagmyeonghun-ui-MacBookPro.local>
X-Rspamd-Queue-Id: 736964CE349
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.56 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60412-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[sys-base.io];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,gmail.com,sholland.org,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paulk@sys-base.io,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.984];
	TAGGED_RCPT(0.00)[linux-media];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,paulk.fr:url,sys-base.io:url,sys-base.io:email]


--OKqRcrL7IoYtAh8b
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu 30 Apr 26, 23:25, =EB=B0=95=EB=AA=85=ED=9B=88 wrote:
> From: Myeonghun Pak <mhun512@gmail.com>
>=20
> cedrus_probe() initializes the media device before registering the video
> device, the media controller, and the media device. If any of those later
> steps fails, probe returns without calling media_device_cleanup(), so the
> media device internals initialized by media_device_init() are left behind.
>=20
> Add a media-device cleanup label to the probe unwind path and route video
> registration failures through it as well.

The label should be named "err_media" instead of "err_media_cleanup" to be
consistent with the other labels. With that fixed:

Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>

Thanks for the fix!

Paul

> Fixes: 50e761516f2b8c ("media: platform: Add Cedrus VPU decoder driver")
> Cc: stable@vger.kernel.org
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---
> Changes in v2:
> - Drop the now-unused err_m2m label.
>=20
>  drivers/staging/media/sunxi/cedrus/cedrus.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.c
> index 6600245dff..2c25654640 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@ -507,7 +507,7 @@ static int cedrus_probe(struct platform_device *pdev)
>  	ret =3D video_register_device(vfd, VFL_TYPE_VIDEO, 0);
>  	if (ret) {
>  		v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
> -		goto err_m2m;
> +		goto err_media_cleanup;
>  	}
> =20
>  	v4l2_info(&dev->v4l2_dev,
> @@ -533,6 +533,7 @@ static int cedrus_probe(struct platform_device *pdev)
>  	v4l2_m2m_unregister_media_controller(dev->m2m_dev);
>  err_video:
>  	video_unregister_device(&dev->vfd);
> -err_m2m:
> +err_media_cleanup:
> +	media_device_cleanup(&dev->mdev);
>  	v4l2_m2m_release(dev->m2m_dev);
>  err_v4l2:
> --=20
> 2.50.1

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--OKqRcrL7IoYtAh8b
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmn57AYACgkQhP3B6o/u
lQxYTQ//Vg6dZ/FBGwVcZvEbR67CmVXDfwgz6zE8GeXVEXwu7GY40c3yev5F2pNn
0N2ec5Jj2a+nTeRv62lgSsUBy1K+YsRhcQ30RpCkrRGYXESPJ5WeFBU/+IYRJjmN
G6hW5bN7ZiOZN2jQ53swcwHOZq5cZcxdtpSG9OFDDB66E46fCs67UnfLuv6koUFH
wtGTgHJKOg5MkO4SjNpN2KEZmDcuPodnaHdvRo/BX1rkY+fS3GKIP5Dtd6W5xBVn
6ag9Wrwr24akqGWfjRTstDTFglqPIvUZtXJp1w4QVqYsik1o0d9UY+rLqe66DzQZ
KGNSe9DufKyB9WmeaaXlGFhCbMdLKqWr+LfiVKY0fmEkJlPJkjazs4eKm/c8VN2i
9TfeW8hlaWev8RrC/pLJxcnJOWNtJCo7pjp2d4zIXg629SAN2yIqn2hMi4cQtpOL
Ixc3c30xVlEAnSSVXXZgaMGCCgIoSY7JcuWq6JE4cxMmAnZe+zWZKNI8gyi7906r
mx/ZsKPA91CmsZn02R3/RnaAhHKRTxvRPI3oAnK4mLrzDkNy+1JurgxAr8IuKBQ8
BLzJr4XI0W1YIrXzo1vMn2PSdaLmroX8ok3TEXS/JAsoeCEjlTsBy2TS1Bliq/2t
+YNKoMFNF6OU34nh+74LO9nsvS/hlPFSixiBiIDOH8zl9AmemqU=
=PbbW
-----END PGP SIGNATURE-----

--OKqRcrL7IoYtAh8b--

