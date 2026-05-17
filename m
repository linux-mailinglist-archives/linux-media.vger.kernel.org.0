Return-Path: <linux-media+bounces-61870-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uURVBw06CmqBxwQAu9opvQ
	(envelope-from <linux-media+bounces-61870-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 23:58:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E7E56415C
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 23:58:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9ED913002930
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 21:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC63B32AABA;
	Sun, 17 May 2026 21:58:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9B8302140
	for <linux-media@vger.kernel.org>; Sun, 17 May 2026 21:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779055107; cv=none; b=Tx7I7CKonJo4r+ku9MFRdhvpnGGvbV0ymtJwOUISGQURJzGz0Ax8x1XvyByqbpRxdBXftCQqu5/g8HVVpR9I911L0LTeTAZNt3FMriGa2fPIhbUIJo7SIeLZOSeDg6W7kz8D+NKJcPMoLf3aeqexsaXBcR574Xi4eVs2JsklGbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779055107; c=relaxed/simple;
	bh=0lld+aB37+oNjLWgoZn8gLjUJNEB4Rwq1VXZfc58oUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=biZk8hzI5srPItEt1gTUzBwYUY56LBex58QRt3PMVQMqSgiuDqjleIqfLpZcBmClcGW9r+0xPeMmaH2d47M91VsvkW039im+njCSDHm9/wiOISHwdBP+b20job1tQj6Dc7Pho6Js6XxBLypW3nlST96D4GP725KDFhkSv1QwxUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 30EC31F80041
	for <linux-media@vger.kernel.org>; Sun, 17 May 2026 21:58:19 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 79854B407B2; Sun, 17 May 2026 21:58:17 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id E06DAB4079E;
	Sun, 17 May 2026 21:58:15 +0000 (UTC)
Date: Sun, 17 May 2026 23:58:13 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Arash Golgol <arash.golgol@gmail.com>
Cc: linux-media@vger.kernel.org, yong.deng@magewell.com, mchehab@kernel.org,
	wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com
Subject: Re: [PATCH v3 3/3] media: sun6i-csi: capture: Support MC-centric
 format enumeration
Message-ID: <ago59fn0CJaN5309@collins>
References: <20260509050921.22158-1-arash.golgol@gmail.com>
 <20260509050921.22158-4-arash.golgol@gmail.com>
 <ago3mOxf1adhogFW@collins>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+lPBCRAKF88mfx7A"
Content-Disposition: inline
In-Reply-To: <ago3mOxf1adhogFW@collins>
X-Rspamd-Queue-Id: 12E7E56415C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.56 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,magewell.com,kernel.org,gmail.com,sholland.org,lists.infradead.org,lists.linux.dev,ideasonboard.com,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-61870-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,paulk.fr:url]
X-Rspamd-Action: no action


--+lPBCRAKF88mfx7A
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi again,

Le Sun 17 May 26, 23:48, Paul Kocialkowski a =C3=A9crit :
> Hi Arash,
>=20
> Le Sat 09 May 26, 08:39, Arash Golgol a =C3=A9crit :
> > Extend vidioc_enum_fmt to support MC-centric enumeration by filtering
> > pixel formats based on the provided mbus code. Advertise MC I/O support
> > on the video device to reflect its intended usage within a media graph.
>=20
> There is one (important) thing I overlooked last time: the list of
> direct matches between mbus code and pixelformat only covers some of the
> formats that the driver supports, but not all of them.
>=20
> This is reflected in sun6i_csi_capture_link_validate, where we check
> that a given mbus format set on the bridge is compatible with the
> pixelformat set on the capture side.
>=20
> I think we essentially have to extract that validation logic into a new
> helper and then use it against all supported pixel formats for a given
> mbus code to find out if that pixel format should be returned or not.
> So it also means that multiple pixel formats can be supported for a given
> mbus format.
>=20
> A typical example of this would be MEDIA_BUS_FMT_YUYV8_2X8 than can be
> stored to either YUYV (raw mode), NV16/YUV422 (YUV mode, no resampling) or
> NV12/YUV420 (YUV mode, 422 -> 420 resampling).
>=20
> You're welcome to give it a try if you'd like or I could take a look at
> this myself.

I just found this old series I never follow-up on which does pretty much
exactly that, along with additions to v4l2_format_info.

https://patchwork.kernel.org/project/linux-media/list/?series=3D733589&arch=
ive=3Dboth

If you don't mind I will just pick up this work based on my earlier
series directly.

All the best,

Paul

> Also the first comment after the sun6i_csi_capture_format_matches
> declaration should be "YUV422", not "YUV420" (would be good to fix it
> while touching these parts).
>=20
> All the best,
>=20
> Paul
>=20
> > Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > Changes in v3:
> >  - No change
> >  - Link to v2: https://patchwork.kernel.org/project/linux-media/patch/2=
0260508161721.94285-4-arash.golgol@gmail.com/
> >=20
> > Changes in v2:
> >  - Return pixelformat directly instead of a pointer
> >  - Link to v1: https://patchwork.kernel.org/project/linux-media/patch/2=
0260217064050.18388-4-arash.golgol@gmail.com/
> >=20
> >  .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 39 +++++++++++++++++--
> >  1 file changed, 36 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c=
 b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> > index f788b4234673..5737ebaa7297 100644
> > --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> > +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> > @@ -327,6 +327,22 @@ static bool sun6i_csi_capture_format_match(u32 pix=
elformat, u32 mbus_code)
> >  	return false;
> >  }
> > =20
> > +static u32 sun6i_csi_capture_pixelformat_find(u32 mbus_code)
> > +{
> > +	unsigned int i;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(sun6i_csi_capture_format_matches); i++) {
> > +		const struct sun6i_csi_capture_format_match *match =3D
> > +			&sun6i_csi_capture_format_matches[i];
> > +
> > +		if (match->mbus_code =3D=3D mbus_code)
> > +			return match->pixelformat;
> > +	}
> > +
> > +	/* Valid fourcc is non-zero. */
> > +	return 0;
> > +}
> > +
> >  /* Capture */
> > =20
> >  static void
> > @@ -729,11 +745,27 @@ static int sun6i_csi_capture_enum_fmt(struct file=
 *file, void *priv,
> >  				      struct v4l2_fmtdesc *fmtdesc)
> >  {
> >  	u32 index =3D fmtdesc->index;
> > +	u32 mbus_code =3D fmtdesc->mbus_code;
> > +	u32 pixelformat;
> > +
> > +	/* MC-centric or Video-node-centric */
> > +	if (mbus_code) {
> > +		/* There is only one pixelformat for a mbus_code. */
> > +		if (index)
> > +			return -EINVAL;
> > +
> > +		pixelformat =3D sun6i_csi_capture_pixelformat_find(mbus_code);
> > +	} else {
> > +		if (index >=3D ARRAY_SIZE(sun6i_csi_capture_formats))
> > +			return -EINVAL;
> > +
> > +		pixelformat =3D sun6i_csi_capture_formats[index].pixelformat;
> > +	}
> > =20
> > -	if (index >=3D ARRAY_SIZE(sun6i_csi_capture_formats))
> > +	if (!pixelformat)
> >  		return -EINVAL;
> > =20
> > -	fmtdesc->pixelformat =3D sun6i_csi_capture_formats[index].pixelformat;
> > +	fmtdesc->pixelformat =3D pixelformat;
> > =20
> >  	return 0;
> >  }
> > @@ -1065,7 +1097,8 @@ int sun6i_csi_capture_setup(struct sun6i_csi_devi=
ce *csi_dev)
> > =20
> >  	strscpy(video_dev->name, SUN6I_CSI_CAPTURE_NAME,
> >  		sizeof(video_dev->name));
> > -	video_dev->device_caps =3D V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMIN=
G;
> > +	video_dev->device_caps =3D V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMIN=
G |
> > +				 V4L2_CAP_IO_MC;
> >  	video_dev->vfl_dir =3D VFL_DIR_RX;
> >  	video_dev->release =3D video_device_release_empty;
> >  	video_dev->fops =3D &sun6i_csi_capture_fops;
> > --=20
> > 2.34.1
> >=20
>=20
> --=20
> Paul Kocialkowski,
>=20
> Independent contractor - sys-base - https://www.sys-base.io/
> Free software developer - https://www.paulk.fr/
>=20
> Expert in multimedia, graphics and embedded hardware support with Linux.



--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--+lPBCRAKF88mfx7A
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmoKOfUACgkQhP3B6o/u
lQyLrw/9GtTO/jWPOJMHb1iOQL6mwfoU8M7I0xJ19ViEhji949UAC5DA8JTl8Gi/
9YGBIRTWQ1nvjzNuc5XHfo4JdyGaRaCcv2xtWfap8cvHvduCHlAHpo4c7W2utr3Q
UKij3LgJtLEKj+J769ILuNQRR/KeWYRj2/imjjf0nPX+yF5b89k8HXicLSI1rnks
YZGoyZmLIw1dapVQfrVivHZkGYYJ0/kcvct2QiyxZHrS0l+nlSw3pjpHGZqo+pH9
S7kYX9GDl3PZ1SipGj2gsLJ+qCyJzs8khk7mEJbnczH7MMp3kk91PB79xz9y+ari
tA79YJlonsHcPBYtbTlDarzJBV4UDHTVU3HpZhtPmN6clLv1oqKxrmGyFGvsTpcv
RiwV5zBl2PICOHFQzFgzochujyhNyoHFgGDd1ONF4JNKK+bd1w+HzZB0aEfUu/nw
f1T7EPcVrQwq6Tp6KgaMXPH4uLmyoHTIqWUWfylFbQVl9KF8j9bMhfBCfqRGvpq7
IKZE7fX895khZaFPTEtczh3Wup/496fG58Sb4A2qrb+ZiGEohwZeh1WMDp4QetHM
sH33nCsZjfqvfffvSbAXofzD19shRHzQCw1Ia7CzG6GWDPss0GWaQ23yEDHoo4TE
roQqlEiVzmkUhbJnb5cd/UlSswZlxJO9TV4GW/+V2RwaWYTtQYY=
=P/ft
-----END PGP SIGNATURE-----

--+lPBCRAKF88mfx7A--

