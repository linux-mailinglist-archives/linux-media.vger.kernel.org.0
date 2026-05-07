Return-Path: <linux-media+bounces-60787-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ME2nCGR+/GnXQgAAu9opvQ
	(envelope-from <linux-media+bounces-60787-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 13:58:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C79A4E7DC1
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 13:58:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C18C30142BD
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 11:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C06C13ECBD0;
	Thu,  7 May 2026 11:58:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0389E3D6662
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 11:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778155102; cv=none; b=FFWF+ZZViOKeZZiWDof4NA1gY4PGqPpFSgCrxXFhCMdrigae/Xz6poPAhXJskB6KVMOqE7dHqz6ZMFk/vt6UkaDkGAqi5zwx8uQ8TlL5+PkXa6xUfXhpiyz2BlnFIWjT7/iJcqd+rrdzJ4YJnZgBjgvoN91oehGaVMIX0FmPYy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778155102; c=relaxed/simple;
	bh=CkbVF1+esi9muiFleKj/0IuhJzBTN176p2K0qwGp9qE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PvaAvcvzBQtkBDSNLY2lUVHh9FZy7zUVPrh1DKYp368xEO/qCYWdqBkKQUMtS1iSGh5h2W2tAZMilDOOEQPxQyE3O3rdpvZRciKylbW3/Reb61VGCKBAkJvaCKj1z38d81c7eo/5LQDg+u2ceKT26kpEV3708Cif1kh+T1ScTBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 321531F80044
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 11:58:15 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 28B07B405F6; Thu,  7 May 2026 11:58:11 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id B9334B405F0;
	Thu,  7 May 2026 11:58:10 +0000 (UTC)
Date: Thu, 7 May 2026 13:58:08 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Arash Golgol <arash.golgol@gmail.com>
Cc: linux-media@vger.kernel.org, yong.deng@magewell.com, mchehab@kernel.org,
	wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org,
	laurent.pinchart@ideasonboard.com, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v1 3/3] media: sun6i-csi: capture: Support MC-centric
 format enumeration
Message-ID: <afx-UNHAYcfqCOMQ@collins>
References: <20260217064050.18388-1-arash.golgol@gmail.com>
 <20260217064050.18388-4-arash.golgol@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dHf1RUyYbpLtv1hp"
Content-Disposition: inline
In-Reply-To: <20260217064050.18388-4-arash.golgol@gmail.com>
X-Rspamd-Queue-Id: 6C79A4E7DC1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.56 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,magewell.com,kernel.org,gmail.com,sholland.org,ideasonboard.com,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-60787-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[sys-base.io];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paulk@sys-base.io,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[paulk.fr:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sys-base.io:url]
X-Rspamd-Action: no action


--dHf1RUyYbpLtv1hp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Arash,

Le Tue 17 Feb 26, 10:10, Arash Golgol a =C3=A9crit :
> Extend vidioc_enum_fmt to support MC-centric enumeration by filtering
> pixel formats based on the provided mbus code. Advertise MC I/O support
> on the video device to reflect its intended usage within a media graph.
>=20
> Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
> ---
>  .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 38 +++++++++++++++++--
>  1 file changed, 35 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b=
/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> index dd06d4c116e0..f54d7a6397be 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> @@ -327,6 +327,21 @@ static bool sun6i_csi_capture_format_match(u32 pixel=
format, u32 mbus_code)
>  	return false;
>  }
> =20
> +static const u32 *sun6i_csi_capture_pixelformat_find(u32 mbus_code)

I am not a big fan of returning a pointer here. We can safely assume
that a valid pixel format will be non-zero (it's a fourcc), so I would
just return the pixelformat directly and 0 for invalid cases.

All the best,

Paul

> +{
> +	unsigned int i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(sun6i_csi_capture_format_matches); i++) {
> +		const struct sun6i_csi_capture_format_match *match =3D
> +			&sun6i_csi_capture_format_matches[i];
> +
> +		if (match->mbus_code =3D=3D mbus_code)
> +			return &match->pixelformat;
> +	}
> +
> +	return NULL;
> +}
> +
>  /* Capture */
> =20
>  static void
> @@ -729,11 +744,27 @@ static int sun6i_csi_capture_enum_fmt(struct file *=
file, void *priv,
>  				      struct v4l2_fmtdesc *fmtdesc)
>  {
>  	u32 index =3D fmtdesc->index;
> +	u32 mbus_code =3D fmtdesc->mbus_code;
> +	const u32 *pixelformat;
> +
> +	/* MC-centric or Video-node-centric */
> +	if (mbus_code) {
> +		/* There is only one pixelformat for a mbus_code. */
> +		if (index)
> +			return -EINVAL;
> +
> +		pixelformat =3D sun6i_csi_capture_pixelformat_find(mbus_code);
> +	} else {
> +		if (index >=3D ARRAY_SIZE(sun6i_csi_capture_formats))
> +			return -EINVAL;
> +
> +		pixelformat =3D &sun6i_csi_capture_formats[index].pixelformat;
> +	}
> =20
> -	if (index >=3D ARRAY_SIZE(sun6i_csi_capture_formats))
> +	if (!pixelformat)
>  		return -EINVAL;
> =20
> -	fmtdesc->pixelformat =3D sun6i_csi_capture_formats[index].pixelformat;
> +	fmtdesc->pixelformat =3D *pixelformat;
> =20
>  	return 0;
>  }
> @@ -1065,7 +1096,8 @@ int sun6i_csi_capture_setup(struct sun6i_csi_device=
 *csi_dev)
> =20
>  	strscpy(video_dev->name, SUN6I_CSI_CAPTURE_NAME,
>  		sizeof(video_dev->name));
> -	video_dev->device_caps =3D V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
> +	video_dev->device_caps =3D V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
> +				 V4L2_CAP_IO_MC;
>  	video_dev->vfl_dir =3D VFL_DIR_RX;
>  	video_dev->release =3D video_device_release_empty;
>  	video_dev->fops =3D &sun6i_csi_capture_fops;
> --=20
> 2.34.1
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--dHf1RUyYbpLtv1hp
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmn8flAACgkQhP3B6o/u
lQx4Hg/+JYRkS4fQgQQ//qg3sK18dsVicor2UO/xaE9IHNsPT76LwVBSs7jTm0nR
/iH391x2E/+000M9LiM0P/SRFRjKwHH6Bcdiy0HVec4L4OeDlFnMcsoB+pJR23BU
lJMdaGLPUsYrggpMHGzAnT4wXsmuf7aCfCjQr4xn11pf2uNLTafWcoeyoqspj4sU
wUe9Dp7/ogVHXvu7lz/oQlBbxx6omOynAAAYqa1Ou64rspB4qawXIrZT6cEuiF37
y9THuIgf+5V7yshG2j6VYWV6SGHTqqtuMNiUjVAj0r8j3Gyo6fn5zrgUjYTzCM8v
ZubWthrPybLWlPh1YZy5rAaP5GUck9aLGuMkIHkLHK0mRZwZXkRtDKF7T1Mti2Yt
hTlQL0NEh5yvSJVgiO5CJ5/Hn7EZ41XlfJOig4umcs/CWlyz/+bUTrzYVLjnL5ji
gD74Ufwti7MIRIbTiy9Zk+JenbgLojcmKARnDIdkyE4Ljy+ZpNmrc0zBsEmVEkrK
UD1M1j+sS/+eMQ7nfgC+FJsO5fEmTAQyxV9c/zboPwkwfRIwox61+xE3dvFNhG7C
VST/fIJ/0XY4WQBiKRpSILk+soPvBCm0aHlX0Vr3TWK3DQTVDMTGoS19Q4P4DUaq
6cMaw5qHcFYfZdo8Is6HaqAwP7tJ0fsSjK6TYo7ss2B2KJnLQ4Q=
=+cqd
-----END PGP SIGNATURE-----

--dHf1RUyYbpLtv1hp--

