Return-Path: <linux-media+bounces-61869-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOjJIaw3CmoLxwQAu9opvQ
	(envelope-from <linux-media+bounces-61869-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 23:48:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE42564135
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 23:48:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C1D403003628
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 21:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 674A2326941;
	Sun, 17 May 2026 21:48:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCF11F4176
	for <linux-media@vger.kernel.org>; Sun, 17 May 2026 21:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779054504; cv=none; b=hhjSwPUfMhiR/3kgiQ2jNiRk7cRU+RngUCks0vCBLYGzMuqI4vd1iB9VyF6fdWlsYql8mhUpycKu+37pvjoHKV7nPo1kxMdOLxWzA8/4dV6IsrLYQerfxRRCvxWYBNmaAYWP58aorTSlC/48DudKTtIwfLOuArqdyQsh0zl7ZmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779054504; c=relaxed/simple;
	bh=RdPEl6zewfd8ErLkXEfTyuQEy9D5/dHuwaY6TkDYow8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CuU5VcPPwG7BUJEfDRM90i8N3indvOuzfsMI94XXGDHJzxvQBmV5TGD0w1k6p4squ57l5ipBAyVHR9l7axvnwhOB/22mkBXqf9TyrK59Q0hrUUuOMMwK2ZWh8cxMZrPosk1X7eVsXTPgriS4ubDAEiQnwTKq98FhqfajM+E3hoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id C703F1F8005D
	for <linux-media@vger.kernel.org>; Sun, 17 May 2026 21:48:14 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id C043FB407B0; Sun, 17 May 2026 21:48:12 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id A490AB4079E;
	Sun, 17 May 2026 21:48:10 +0000 (UTC)
Date: Sun, 17 May 2026 23:48:08 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Arash Golgol <arash.golgol@gmail.com>
Cc: linux-media@vger.kernel.org, yong.deng@magewell.com, mchehab@kernel.org,
	wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com
Subject: Re: [PATCH v3 3/3] media: sun6i-csi: capture: Support MC-centric
 format enumeration
Message-ID: <ago3mOxf1adhogFW@collins>
References: <20260509050921.22158-1-arash.golgol@gmail.com>
 <20260509050921.22158-4-arash.golgol@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yC5mSo+r2Ck9CJ8n"
Content-Disposition: inline
In-Reply-To: <20260509050921.22158-4-arash.golgol@gmail.com>
X-Rspamd-Queue-Id: 1CE42564135
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.56 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,magewell.com,kernel.org,gmail.com,sholland.org,lists.infradead.org,lists.linux.dev,ideasonboard.com,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-61869-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,sys-base.io:url]
X-Rspamd-Action: no action


--yC5mSo+r2Ck9CJ8n
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Arash,

Le Sat 09 May 26, 08:39, Arash Golgol a =C3=A9crit :
> Extend vidioc_enum_fmt to support MC-centric enumeration by filtering
> pixel formats based on the provided mbus code. Advertise MC I/O support
> on the video device to reflect its intended usage within a media graph.

There is one (important) thing I overlooked last time: the list of
direct matches between mbus code and pixelformat only covers some of the
formats that the driver supports, but not all of them.

This is reflected in sun6i_csi_capture_link_validate, where we check
that a given mbus format set on the bridge is compatible with the
pixelformat set on the capture side.

I think we essentially have to extract that validation logic into a new
helper and then use it against all supported pixel formats for a given
mbus code to find out if that pixel format should be returned or not.
So it also means that multiple pixel formats can be supported for a given
mbus format.

A typical example of this would be MEDIA_BUS_FMT_YUYV8_2X8 than can be
stored to either YUYV (raw mode), NV16/YUV422 (YUV mode, no resampling) or
NV12/YUV420 (YUV mode, 422 -> 420 resampling).

You're welcome to give it a try if you'd like or I could take a look at
this myself.

Also the first comment after the sun6i_csi_capture_format_matches
declaration should be "YUV422", not "YUV420" (would be good to fix it
while touching these parts).

All the best,

Paul

> Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes in v3:
>  - No change
>  - Link to v2: https://patchwork.kernel.org/project/linux-media/patch/202=
60508161721.94285-4-arash.golgol@gmail.com/
>=20
> Changes in v2:
>  - Return pixelformat directly instead of a pointer
>  - Link to v1: https://patchwork.kernel.org/project/linux-media/patch/202=
60217064050.18388-4-arash.golgol@gmail.com/
>=20
>  .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 39 +++++++++++++++++--
>  1 file changed, 36 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b=
/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> index f788b4234673..5737ebaa7297 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> @@ -327,6 +327,22 @@ static bool sun6i_csi_capture_format_match(u32 pixel=
format, u32 mbus_code)
>  	return false;
>  }
> =20
> +static u32 sun6i_csi_capture_pixelformat_find(u32 mbus_code)
> +{
> +	unsigned int i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(sun6i_csi_capture_format_matches); i++) {
> +		const struct sun6i_csi_capture_format_match *match =3D
> +			&sun6i_csi_capture_format_matches[i];
> +
> +		if (match->mbus_code =3D=3D mbus_code)
> +			return match->pixelformat;
> +	}
> +
> +	/* Valid fourcc is non-zero. */
> +	return 0;
> +}
> +
>  /* Capture */
> =20
>  static void
> @@ -729,11 +745,27 @@ static int sun6i_csi_capture_enum_fmt(struct file *=
file, void *priv,
>  				      struct v4l2_fmtdesc *fmtdesc)
>  {
>  	u32 index =3D fmtdesc->index;
> +	u32 mbus_code =3D fmtdesc->mbus_code;
> +	u32 pixelformat;
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
> +		pixelformat =3D sun6i_csi_capture_formats[index].pixelformat;
> +	}
> =20
> -	if (index >=3D ARRAY_SIZE(sun6i_csi_capture_formats))
> +	if (!pixelformat)
>  		return -EINVAL;
> =20
> -	fmtdesc->pixelformat =3D sun6i_csi_capture_formats[index].pixelformat;
> +	fmtdesc->pixelformat =3D pixelformat;
> =20
>  	return 0;
>  }
> @@ -1065,7 +1097,8 @@ int sun6i_csi_capture_setup(struct sun6i_csi_device=
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

--yC5mSo+r2Ck9CJ8n
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmoKN5gACgkQhP3B6o/u
lQxjFQ/9ElbgKI3F/VxE16ifDGEGHAuxRHku9cp2Mp9t9Vvc//lpAWOPDKwk+8nr
giitJevUYjpBW6EWcvre964byYHBI6Ep+GwHbryHbQ0Whhcfs7auaIXV0aGikY+w
NqZx7Uh5rd3ZCofFxa903cW3Oiz5aPYr9th5iVoXJum/bf7YRDsp3//nQOkHbPBr
i3ZIYVFCc/R9o8O1KGVd3GNGkYjduH9H5Jpxs210Ti0sxngQjYz4NHtzI9HQ+SO8
n1N7lxdchE9B6zROCvhPLTPnR680J9aDFsn39LLFRLG/r0iUbQmlmwby1MjDCxyY
7Xz6xZBKRcLXI6jg3gXVdnH7+q0SPHu4iScZE/55glACRR5ffDIJo1dE+Ons4t++
c1RW8DzzWkRLwLxA8rKxfDU1GYSHzzlKznl27jjIERAo8ZDFYYeVn3Iu/eKWhnKw
tD6OgnRP57iCDO0TkE/twbGkIrdxJlbADjiMYaWDhQ2uqDi+UBzQF0TA+SSOAJSF
GFDeyqkKt/yKdnwmiwNOwnmUICwGHtV7pH7ORyRp2kgYsL+9oV1N8QEeyPBLDeNV
7wnItI4HfPegIQBUzs7RHVev86QaACxuQFqOTgPGhCbWl24/K7BPg5B8bPOmotid
kb9ciJP+8S5Z0vRdm6b63p9RYd1kbQEIlVCB9ss1n3rd1DZCqw0=
=EjDr
-----END PGP SIGNATURE-----

--yC5mSo+r2Ck9CJ8n--

