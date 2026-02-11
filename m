Return-Path: <linux-media+bounces-52594-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIX1LHpbjGnelgAAu9opvQ
	(envelope-from <linux-media+bounces-52594-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 11:35:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC9C12371F
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 11:35:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7FB8A30065E6
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 10:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9944536920F;
	Wed, 11 Feb 2026 10:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="liMcn/g1"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA5D331A5C;
	Wed, 11 Feb 2026 10:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770806135; cv=none; b=CotIBcDBiv8eSmTaJq5Hp8SiluVoiK4XgLnioKVNx5WtBIEsjOUI2yqMF6kZes+UNzJ9pkxkIth8zEiN65N2fMA4+Ua6H1j2omT5dfsycRl6R0Wc/WIcqi+dOU5zQaQiUpRXivk6sTVxeJUKhJgq/PIji/HPeuDhD48mc/DgvvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770806135; c=relaxed/simple;
	bh=W/A4c5A3CBHMKHElaLrV7mHA1dJF7pIZ7gvbLanV/T8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h1dOOBtn0o2H5byMVgKXKrdEYi99p3AJbhsX9ORs01LiWxVaIRIqFlVOIA0CbiOAP1wLxz2sfU2w1Sgny4VYpsKDfIHh5FDVk9uOUqxmsNNrr59VktWl1b9duLT2s7BYWFteHpaMMAzm2lNxrDbKSe2pEpszGQffL43h1S11tH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=liMcn/g1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DF70C19421;
	Wed, 11 Feb 2026 10:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770806134;
	bh=W/A4c5A3CBHMKHElaLrV7mHA1dJF7pIZ7gvbLanV/T8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=liMcn/g1ikfnZGIcERXbW/W225AMIDyySQOnqE8xs1ql1i+EJNGkajBt20i9HBaI/
	 +4tgZyv07dpZhSbdE5eLQ+0sEJIl7qxv+kExU+1YXbhymILdR5E+pm3hNQOCOH1KrM
	 aCcbYdTJBPmE5skTChRcuhvbsC6DLQFf5EKQbV6iCdPWU8pm2UigtVK2aJ2yDMwmDA
	 l30cnkMsJpzm8RhNoAXxqbj70AgIev3yMYaDF+p7o28VHGA5t+s7Rt8GGcsRvDF1tv
	 Oov7tZWkx7KUoIePDNQnkmjaiZBC1Wty5lfwIKT271sP79XXlsaL/7GS9gcR8JUigL
	 i253UxqdU3hQQ==
Date: Wed, 11 Feb 2026 11:35:32 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v5 2/2] media: bcm2835-unicam: Fix RGB format / mbus code
 association
Message-ID: <20260211-truthful-wine-starling-fcc470@houat>
References: <20260209-csi-bgr-rgb-v5-0-e7af3cd6cde6@redhat.com>
 <20260209-csi-bgr-rgb-v5-2-e7af3cd6cde6@redhat.com>
 <20260209224436.GE2405149@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="dz6ceefkoxoi6xlg"
Content-Disposition: inline
In-Reply-To: <20260209224436.GE2405149@killaraus.ideasonboard.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52594-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3FC9C12371F
X-Rspamd-Action: no action


--dz6ceefkoxoi6xlg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 2/2] media: bcm2835-unicam: Fix RGB format / mbus code
 association
MIME-Version: 1.0

Hi Laurent,

On Tue, Feb 10, 2026 at 12:44:36AM +0200, Laurent Pinchart wrote:
> On Mon, Feb 09, 2026 at 04:03:17PM +0100, Maxime Ripard wrote:
> > From: Maxime Ripard <mripard@redhat.com>
> >=20
> > The Unicam driver is a MIPI-CSI2 Receiver, that can capture RGB 4:4:4,
> > YCbCr 4:2:2, and raw formats.
> >=20
> > RGB 4:4:4 is converted to the MIPI-CSI2 RGB888 video format, and
> > associated to the MEDIA_BUS_FMT_RGB888_1X24 media bus code.
> >=20
> > However, V4L2_PIX_FMT_RGB24 is defined as having its color components in
> > the R, G and B order, from left to right. MIPI-CSI2 however defines the
> > RGB888 format with blue first, and that's what MEDIA_BUS_FMT_RGB888_1X24
> > defines too.
> >=20
> > This essentially means that the R and B will be swapped compared to what
> > V4L2_PIX_FMT_RGB24 defines. The same situation occurs with
> > V4L2_PIX_FMT_BGR24 being associated to MEDIA_BUS_FMT_BGR888_1X24.
> >=20
> > In order to fix the swapped components, we need to change the
> > association of V4L2_PIX_FMT_BGR24 to MEDIA_BUS_FMT_RGB888_1X24, and of
> > V4L2_PIX_FMT_RGB24 to MEDIA_BUS_FMT_BGR888_1X24.
> >=20
> > Since the media bus code is exposed to userspace, and validated by
> > unicam's link_validate implementation, we need to explicitly accept (and
> > warn) the old association still to preserve backward compatibility.
> >=20
> > Signed-off-by: Maxime Ripard <mripard@redhat.com>
> > ---
> >  drivers/media/platform/broadcom/bcm2835-unicam.c | 36 ++++++++++++++++=
+++++---
> >  1 file changed, 32 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers=
/media/platform/broadcom/bcm2835-unicam.c
> > index f10064107d543caf867249d0566a0f42d6d8c4c6..5e4850831c931d346146aa8=
e22c53f0655e462c9 100644
> > --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> > +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > @@ -340,16 +340,16 @@ static const struct unicam_format_info unicam_ima=
ge_formats[] =3D {
> >  		.code		=3D MEDIA_BUS_FMT_RGB565_1X16,
> >  		.depth		=3D 16,
> >  		.csi_dt		=3D MIPI_CSI2_DT_RGB565,
> >  	}, {
> >  		.fourcc		=3D V4L2_PIX_FMT_RGB24, /* rgb */
> > -		.code		=3D MEDIA_BUS_FMT_RGB888_1X24,
> > +		.code		=3D MEDIA_BUS_FMT_BGR888_1X24,
> >  		.depth		=3D 24,
> >  		.csi_dt		=3D MIPI_CSI2_DT_RGB888,
> >  	}, {
> >  		.fourcc		=3D V4L2_PIX_FMT_BGR24, /* bgr */
> > -		.code		=3D MEDIA_BUS_FMT_BGR888_1X24,
> > +		.code		=3D MEDIA_BUS_FMT_RGB888_1X24,
> >  		.depth		=3D 24,
> >  		.csi_dt		=3D MIPI_CSI2_DT_RGB888,
> >  	}, {
> >  	/* Bayer Formats */
> >  		.fourcc		=3D V4L2_PIX_FMT_SBGGR8,
> > @@ -2153,12 +2153,40 @@ static int unicam_video_link_validate(struct me=
dia_link *link)
> >  		if (WARN_ON(!fmtinfo)) {
> >  			ret =3D -EPIPE;
> >  			goto out;
> >  		}
> > =20
> > -		if (fmtinfo->code !=3D format->code ||
> > -		    fmt->height !=3D format->height ||
> > +		/*
> > +		 * Unicam initially associated BGR24 to BGR888_1X24 and
> > +		 * RGB24 to RGB888_1X24.
> > +		 *
> > +		 * In order to allow the applications using the old
> > +		 * behaviour to run, let's accept the old combination,
> > +		 * but warn about it.
> > +		 */
> > +		if (fmtinfo->code !=3D format->code) {
> > +			if (fmtinfo->fourcc =3D=3D V4L2_PIX_FMT_BGR24 &&
> > +			    format->code =3D=3D MEDIA_BUS_FMT_BGR888_1X24) {
> > +				dev_warn_once(node->dev->dev,
> > +					      "MIPI-CSI media bus code for RGB88 is RGB888_1X24. The appl=
ication must be fixed.");
>=20
> s/RGB88/RGB888/
>=20
> But I find this confusing, the message doesn't make it clear if RGB888 +
> RGB888_1X24 is expected or is an error. I think the following would be
> clearer.
>=20
> 				dev_warn_once(node->dev->dev,
> 					      "Incorrect pixel format BGR24 for BGR888_1X24. Fix your applic=
ation to use RGB24.");
>=20
> > +			} else if (fmtinfo->fourcc =3D=3D V4L2_PIX_FMT_RGB24 &&
> > +				   format->code =3D=3D MEDIA_BUS_FMT_RGB888_1X24) {
> > +				dev_warn_once(node->dev->dev,
> > +					      "MIPI-CSI media bus code for BGR888 is BGR888_1X24. The app=
lication must be fixed.");
>=20
> 				dev_warn_once(node->dev->dev,
> 					      "Incorrect pixel format RGB24 for RGB888_1X24. Fix your applic=
ation to use BGR24.");
>=20
> Or you could combine those two (untested):
>=20
> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/m=
edia/platform/broadcom/bcm2835-unicam.c
> index f10064107d54..e9f191536765 100644
> --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> @@ -2148,22 +2148,38 @@ static int unicam_video_link_validate(struct medi=
a_link *link)
>  		const struct v4l2_pix_format *fmt =3D &node->fmt.fmt.pix;
>  		const struct unicam_format_info *fmtinfo;
>=20
> -		fmtinfo =3D unicam_find_format_by_fourcc(fmt->pixelformat,
> -						       UNICAM_SD_PAD_SOURCE_IMAGE);
> +		fmtinfo =3D unicam_find_format_by_code(format->code,
> +						     UNICAM_SD_PAD_SOURCE_IMAGE);
>  		if (WARN_ON(!fmtinfo)) {
>  			ret =3D -EPIPE;
>  			goto out;
>  		}
>=20
> -		if (fmtinfo->code !=3D format->code ||
> -		    fmt->height !=3D format->height ||
> +		if (fmtinfo->fourcc !=3D fmt->pixelformat) {

I gave it a try, and fmtinfo->fourcc would always be equal to
fmt->pixelformat, so we never enter that branch and don't warn.

I kept the old lookup and condition...

> +			if ((fmtinfo->fourcc =3D=3D V4L2_PIX_FMT_BGR24 &&
> +			     format->code =3D=3D MEDIA_BUS_FMT_BGR888_1X24) ||
> +			    (fmtinfo->fourcc =3D=3D V4L2_PIX_FMT_RGB24 &&
> +			     format->code =3D=3D MEDIA_BUS_FMT_RGB888_1X24)) {
> +                                dev_warn_once(node->dev->dev,
> +                                              "Incorrect pixel format %p=
4CC for 0x%04x. Fix your application to use %p4CC.\n",
> +                                              &fmt->pixelformat, format-=
>code, &fmtinfo->fourcc);

=2E.. Added a call to unicam_find_format_by_code() here to print what we sh=
ould do ...

> +			} else {
> +				dev_dbg(node->dev->dev,
> +					"image: format mismatch: 0x%04x <=3D> %p4CCx\n",
> +					format->code, &fmt->pixelformat);
> +				ret =3D -EPIPE
> +				goto out;
> +			}
> +		}
> +
> +		if (fmt->height !=3D format->height ||
>  		    fmt->width !=3D format->width ||
>  		    fmt->field !=3D format->field) {
>  			dev_dbg(node->dev->dev,
> -				"image: (%u x %u) 0x%08x %s !=3D (%u x %u) 0x%08x %s\n",
> -				fmt->width, fmt->height, fmtinfo->code,
> +				"image: (%u x %u) %s !=3D (%u x %u) %s\n",
> +				fmt->width, fmt->height,
>  				v4l2_field_names[fmt->field],
> -				format->width, format->height, format->code,
> +				format->width, format->height,
>  				v4l2_field_names[format->field]);
>  			ret =3D -EPIPE;
>  		}
>=20
> > +			} else {
> > +				dev_dbg(node->dev->dev,
> > +					"image: (%u x %u) 0x%08x %s !=3D (%u x %u) 0x%08x %s\n",
> > +					fmt->width, fmt->height, fmtinfo->code,
> > +					v4l2_field_names[fmt->field],
> > +					format->width, format->height, format->code,
> > +					v4l2_field_names[format->field]);
>=20
> As this message is printed specifically due to a format mismatch, I
> would drop the size and field information:
>=20
> 				dev_dbg(node->dev->dev,
> 					"image: format mismatch: 0x%04x <=3D> %p4CC\n",
> 					format->code, &fmt->pixelformat);
>=20
> > +				ret =3D -EPIPE;
> > +				goto out;
> > +			}
> > +		}
> > +
> > +		if (fmt->height !=3D format->height ||
> >  		    fmt->width !=3D format->width ||
> >  		    fmt->field !=3D format->field) {
> >  			dev_dbg(node->dev->dev,
> >  				"image: (%u x %u) 0x%08x %s !=3D (%u x %u) 0x%08x %s\n",
> >  				fmt->width, fmt->height, fmtinfo->code,
>=20
> And here you can drop the format.
>=20
> I like the approach in this v5. As far as I can see, it won't break
> userspace, will warn of incorrect format usage, and implements the
> backward compatibility in the driver that initially got it wrong,
> unicam. I'm happy with it.

And the rest works fine. I'll send a new version by the end of the week
unless some other review comes up. Thanks!

Maxime

--dz6ceefkoxoi6xlg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaYxbbAAKCRAnX84Zoj2+
dt1pAXwKfM/PMOT/r4xQ0zO488l7P0GhG8q7Hunx/1qOnUZIEyxaoGXTS64N8r8F
nK91j70BgKuk1p97Z9c1eZjo0sBEnaP62Y8PwH/YT8a5aeFJkRYmuL+FRl8wPFdq
6Cj9/63LxQ==
=a/qD
-----END PGP SIGNATURE-----

--dz6ceefkoxoi6xlg--

