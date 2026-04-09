Return-Path: <linux-media+bounces-58325-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8C0LIoCl12lfQwgAu9opvQ
	(envelope-from <linux-media+bounces-58325-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 15:11:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CC23CAD56
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 15:11:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 646903017C24
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 13:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AE8C3CF689;
	Thu,  9 Apr 2026 13:11:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F358D38A72E;
	Thu,  9 Apr 2026 13:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775740260; cv=none; b=c64XlTQjXtV2i+amkiGV9h9VSfU/7X6tkep66r4Y0SdPtXAQY4vYoGEv/cr2EbNt5m0jW/pXJ6mdaGiOTwq8Kmrc8kYqRHrsol2r7wO6RxwFN/br5WiiCJN5i+RpArKXwPzc2VzhUCQMzazBBNNcwrsLZhdFpyG5W8vG+6idwMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775740260; c=relaxed/simple;
	bh=2SKAmzu7EGe/irWntGBPTUJUQkdIT5VL6qvPDEu/TSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=COmM/WYToW8QAGRLfhfpwf4bR2hyXtE3pyTjskjjJ9qyllOtKdDPHpE8bvwm9bneMzW3WqOdT0b+fmIUJ6GPCiKDU/qdDdd6+QX1HN+S6Qx4f0X5k0wd/GjEHjY12HbYm+Yf360acs1Cu4pLm0+kzyooA4jgu498zA22ErNnwIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id ED30E1F8004F;
	Thu,  9 Apr 2026 13:10:47 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id C7EADB401A6; Thu,  9 Apr 2026 13:10:46 +0000 (UTC)
X-Spam-Level: 
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 4DBC4B401A1;
	Thu,  9 Apr 2026 13:10:45 +0000 (UTC)
Date: Thu, 9 Apr 2026 15:10:42 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Cc: Dan Carpenter <error27@gmail.com>, Maxime Ripard <mripard@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: cedrus: Fix failure to clean up hardware on
 probe failure
Message-ID: <adelUpXGbXH17VQ_@shepard>
References: <20260406221440.3721863-1-andrej.skvortzov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Itf9xyoJaakxzDN8"
Content-Disposition: inline
In-Reply-To: <20260406221440.3721863-1-andrej.skvortzov@gmail.com>
X-Spamd-Result: default: False [-1.56 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58325-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,sholland.org,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[sys-base.io];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paulk@sys-base.io,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	R_DKIM_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D8CC23CAD56
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--Itf9xyoJaakxzDN8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue 07 Apr 26, 01:14, Andrey Skvortsov wrote:
> From: Samuel Holland <samuel@sholland.org>
>=20
> If V4L2 device fails to register, then SRAM still be claimed and as a
> result driver will not be able to probe again.
>=20
>  cedrus 1c0e000.video-codec: Failed to claim SRAM
>  cedrus 1c0e000.video-codec: Failed to probe hardware
>  cedrus 1c0e000.video-codec: probe with driver cedrus failed with error -=
16
>=20
> cedrus_hw_remove undoes everything that was previously done by
> cedrus_hw_probe, such as disabling runtime power management and
> releasing the claimed SRAM and reserved memory region.

Good catch, thanks for the patch!

Acked-by: Paul Kocialkowski <paulk@sys-base.io>

Note that I (still) plan to rework the architecture of this driver in the
future but such fixes are definitely welcome in the meantime.

All the best,

Paul

> Signed-off-by: Samuel Holland <samuel@sholland.org>
> Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
> Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
> ---
>=20
> Changes in v2:
>  - remove duplicate 'in-body' From: record
>  - add more technical details to commit message
>=20
>  drivers/staging/media/sunxi/cedrus/cedrus.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.c
> index 1d2130f35fffc..ee0e286add67d 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@ -477,7 +477,7 @@ static int cedrus_probe(struct platform_device *pdev)
>  	ret =3D v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
>  	if (ret) {
>  		dev_err(&pdev->dev, "Failed to register V4L2 device\n");
> -		return ret;
> +		goto err_hw;
>  	}
> =20
>  	vfd =3D &dev->vfd;
> @@ -538,6 +538,8 @@ static int cedrus_probe(struct platform_device *pdev)
>  	v4l2_m2m_release(dev->m2m_dev);
>  err_v4l2:
>  	v4l2_device_unregister(&dev->v4l2_dev);
> +err_hw:
> +	cedrus_hw_remove(dev);
> =20
>  	return ret;
>  }
> --=20
> 2.51.0
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--Itf9xyoJaakxzDN8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmnXpVIACgkQhP3B6o/u
lQxUvQ/+KnGDOZekoylgaxf6pnjfN26pBbZnr+cFKKJG68xgu6GWkXQzhOjkASXT
W3P46lFZ2yzEu+RSy2vFORvHTWxwXTzskwwNPGWhgQxMHrdD/7WQN/VGkaH+ghVQ
sih9knsZCokRVojSGcIhxUPaiKiNDocQGAZWTGIJeTbys8GANWU+jkAuxjihbsnO
qO28kp9EQsqzyFCgpu/xtxC0QewsUKj/4jr66kVeysZYBLKAYU52orfvEb3o4kOk
yZSDrzoNq5gCllSI4Odq0Hb7SSgnjOEnoUJNTdm492QhTrMAsABeqTvUFVUhW71b
KQNqJ7Yo025qvWYt0IP2+NMsqhMvSlevf/sXatiN6pwoIpD1bflAvF+C6PG8dBia
Qeu4AerVQmrM8wiokTAY9kaqA0VOdFTU/Bs+rzyLOOIzGFTC2Ykj8b8wQI7rtw/P
NB/0IvumoLxCST1pzYUits2OE7Klo39X61Ie5zzvlfC7cpCYseIUV9NIvTR2SuSP
TavZVrHW+aVrhPd0/fx/IMxp1L4Ut1cfx0C5pT4Ifi0vMwFt73g115PFm1gUBsrT
E1uCGJf+P643l/l/3FlaYJph5LZ87mcOHAPX6LWDw4WtsECvJk5m0YThk9RIowQm
naVGrtzZ3zISp7qAOFkJwpFFd1m8KGGe09FldmINLJ4n5W8jB4M=
=Smsv
-----END PGP SIGNATURE-----

--Itf9xyoJaakxzDN8--

