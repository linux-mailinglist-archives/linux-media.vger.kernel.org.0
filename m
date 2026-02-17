Return-Path: <linux-media+bounces-52961-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PB2KpgolGk9AQIAu9opvQ
	(envelope-from <linux-media+bounces-52961-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 09:36:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9C714A052
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 09:36:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F35F73042FDC
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 08:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B6342EA172;
	Tue, 17 Feb 2026 08:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u3m4fHr8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1075933993;
	Tue, 17 Feb 2026 08:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771317298; cv=none; b=cUmRhyvCc2LkPmRNJ/Pg2KmGjhvSWjte+kjAVU5rZkR3JF0xiYa64lq21vJzVj7KooVp1mlIfVAjcMpjo8sidwlzNqBuKVmw+UG2lIBD281a6z4NyxZKszQCaDy2iWr5VOJsOAwKgnl8v7fk5iF4gG59eFTDI3uetIbK0Z/W6lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771317298; c=relaxed/simple;
	bh=/d2LUl3lan2b/oBZH2ACaEwx0D7znDuXdixvFi7qrI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Czj++iviX9D9Dv4ZMNeJABkOVoVYbUsfh8sd7qn+GMTMXnVXu/ywozv9rnBLYXLFd2uk1pOVoxt5TcnhzxZ+fp92p6/Gx7w+prIt1pVWU7gQ/nWNNVifT5y0lfXC/AbMJZloV1+Xy6mzT3Zm0ikjIkMYn6bDcJzSTWNs3DH2s44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u3m4fHr8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 950CBC4CEF7;
	Tue, 17 Feb 2026 08:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771317297;
	bh=/d2LUl3lan2b/oBZH2ACaEwx0D7znDuXdixvFi7qrI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u3m4fHr8KeH4aSJOkYTRYvIR/93ezPrZAczcrLugdlzIBePdXxhzLDiNkPSxMHgeT
	 oHBFZ/56YuHBGh70sWxlLJtK9f0C1WoiyE3IoDlmhhcFAWYDv/rwBXtlZAOiBeblKN
	 AUBSQR5hXTKOF6FtZInq/iEBariLiOAOXb6bVtDXvoNhAMwm0k1ZNbu4JyC7Qb54jM
	 cyja7WrsnixjL9K3loFkm+O/Qoqq8LpqRhm5w6puSmXjRKh9t/e2PF4gskPN2B1Okf
	 NU4daZO3ssKJfb7y6TIVAi0sqL8xeHWr04mrNLftwMRsE38sLtARDGcL/5bc8jO3E9
	 caIHowdDj6T/Q==
Date: Tue, 17 Feb 2026 09:34:55 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v5 2/2] media: bcm2835-unicam: Fix RGB format / mbus code
 association
Message-ID: <20260217-married-sloppy-binturong-a21f3e@houat>
References: <20260209-csi-bgr-rgb-v5-0-e7af3cd6cde6@redhat.com>
 <20260209-csi-bgr-rgb-v5-2-e7af3cd6cde6@redhat.com>
 <20260209224436.GE2405149@killaraus.ideasonboard.com>
 <20260211-truthful-wine-starling-fcc470@houat>
 <20260212091843.GB2631855@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="a2f3sroqwqfzfflf"
Content-Disposition: inline
In-Reply-To: <20260212091843.GB2631855@killaraus.ideasonboard.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52961-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5C9C714A052
X-Rspamd-Action: no action


--a2f3sroqwqfzfflf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 2/2] media: bcm2835-unicam: Fix RGB format / mbus code
 association
MIME-Version: 1.0

On Thu, Feb 12, 2026 at 11:18:43AM +0200, Laurent Pinchart wrote:
> On Wed, Feb 11, 2026 at 11:35:32AM +0100, Maxime Ripard wrote:
> > On Tue, Feb 10, 2026 at 12:44:36AM +0200, Laurent Pinchart wrote:
> > > On Mon, Feb 09, 2026 at 04:03:17PM +0100, Maxime Ripard wrote:
> > > > From: Maxime Ripard <mripard@redhat.com>
> > > >=20
> > > > The Unicam driver is a MIPI-CSI2 Receiver, that can capture RGB 4:4=
:4,
> > > > YCbCr 4:2:2, and raw formats.
> > > >=20
> > > > RGB 4:4:4 is converted to the MIPI-CSI2 RGB888 video format, and
> > > > associated to the MEDIA_BUS_FMT_RGB888_1X24 media bus code.
> > > >=20
> > > > However, V4L2_PIX_FMT_RGB24 is defined as having its color componen=
ts in
> > > > the R, G and B order, from left to right. MIPI-CSI2 however defines=
 the
> > > > RGB888 format with blue first, and that's what MEDIA_BUS_FMT_RGB888=
_1X24
> > > > defines too.
> > > >=20
> > > > This essentially means that the R and B will be swapped compared to=
 what
> > > > V4L2_PIX_FMT_RGB24 defines. The same situation occurs with
> > > > V4L2_PIX_FMT_BGR24 being associated to MEDIA_BUS_FMT_BGR888_1X24.
> > > >=20
> > > > In order to fix the swapped components, we need to change the
> > > > association of V4L2_PIX_FMT_BGR24 to MEDIA_BUS_FMT_RGB888_1X24, and=
 of
> > > > V4L2_PIX_FMT_RGB24 to MEDIA_BUS_FMT_BGR888_1X24.
> > > >=20
> > > > Since the media bus code is exposed to userspace, and validated by
> > > > unicam's link_validate implementation, we need to explicitly accept=
 (and
> > > > warn) the old association still to preserve backward compatibility.
> > > >=20
> > > > Signed-off-by: Maxime Ripard <mripard@redhat.com>
> > > > ---
> > > >  drivers/media/platform/broadcom/bcm2835-unicam.c | 36 ++++++++++++=
+++++++++---
> > > >  1 file changed, 32 insertions(+), 4 deletions(-)
> > > >=20
> > > > diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/dri=
vers/media/platform/broadcom/bcm2835-unicam.c
> > > > index f10064107d543caf867249d0566a0f42d6d8c4c6..5e4850831c931d34614=
6aa8e22c53f0655e462c9 100644
> > > > --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > > +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > > @@ -340,16 +340,16 @@ static const struct unicam_format_info unicam=
_image_formats[] =3D {
> > > >  		.code		=3D MEDIA_BUS_FMT_RGB565_1X16,
> > > >  		.depth		=3D 16,
> > > >  		.csi_dt		=3D MIPI_CSI2_DT_RGB565,
> > > >  	}, {
> > > >  		.fourcc		=3D V4L2_PIX_FMT_RGB24, /* rgb */
> > > > -		.code		=3D MEDIA_BUS_FMT_RGB888_1X24,
> > > > +		.code		=3D MEDIA_BUS_FMT_BGR888_1X24,
> > > >  		.depth		=3D 24,
> > > >  		.csi_dt		=3D MIPI_CSI2_DT_RGB888,
> > > >  	}, {
> > > >  		.fourcc		=3D V4L2_PIX_FMT_BGR24, /* bgr */
> > > > -		.code		=3D MEDIA_BUS_FMT_BGR888_1X24,
> > > > +		.code		=3D MEDIA_BUS_FMT_RGB888_1X24,
> > > >  		.depth		=3D 24,
> > > >  		.csi_dt		=3D MIPI_CSI2_DT_RGB888,
> > > >  	}, {
> > > >  	/* Bayer Formats */
> > > >  		.fourcc		=3D V4L2_PIX_FMT_SBGGR8,
> > > > @@ -2153,12 +2153,40 @@ static int unicam_video_link_validate(struc=
t media_link *link)
> > > >  		if (WARN_ON(!fmtinfo)) {
> > > >  			ret =3D -EPIPE;
> > > >  			goto out;
> > > >  		}
> > > > =20
> > > > -		if (fmtinfo->code !=3D format->code ||
> > > > -		    fmt->height !=3D format->height ||
> > > > +		/*
> > > > +		 * Unicam initially associated BGR24 to BGR888_1X24 and
> > > > +		 * RGB24 to RGB888_1X24.
> > > > +		 *
> > > > +		 * In order to allow the applications using the old
> > > > +		 * behaviour to run, let's accept the old combination,
> > > > +		 * but warn about it.
> > > > +		 */
> > > > +		if (fmtinfo->code !=3D format->code) {
> > > > +			if (fmtinfo->fourcc =3D=3D V4L2_PIX_FMT_BGR24 &&
> > > > +			    format->code =3D=3D MEDIA_BUS_FMT_BGR888_1X24) {
> > > > +				dev_warn_once(node->dev->dev,
> > > > +					      "MIPI-CSI media bus code for RGB88 is RGB888_1X24. The =
application must be fixed.");
> > >=20
> > > s/RGB88/RGB888/
> > >=20
> > > But I find this confusing, the message doesn't make it clear if RGB88=
8 +
> > > RGB888_1X24 is expected or is an error. I think the following would be
> > > clearer.
> > >=20
> > > 				dev_warn_once(node->dev->dev,
> > > 					      "Incorrect pixel format BGR24 for BGR888_1X24. Fix your ap=
plication to use RGB24.");
> > >=20
> > > > +			} else if (fmtinfo->fourcc =3D=3D V4L2_PIX_FMT_RGB24 &&
> > > > +				   format->code =3D=3D MEDIA_BUS_FMT_RGB888_1X24) {
> > > > +				dev_warn_once(node->dev->dev,
> > > > +					      "MIPI-CSI media bus code for BGR888 is BGR888_1X24. The=
 application must be fixed.");
> > >=20
> > > 				dev_warn_once(node->dev->dev,
> > > 					      "Incorrect pixel format RGB24 for RGB888_1X24. Fix your ap=
plication to use BGR24.");
> > >=20
> > > Or you could combine those two (untested):
> > >=20
> > > diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drive=
rs/media/platform/broadcom/bcm2835-unicam.c
> > > index f10064107d54..e9f191536765 100644
> > > --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > @@ -2148,22 +2148,38 @@ static int unicam_video_link_validate(struct =
media_link *link)
> > >  		const struct v4l2_pix_format *fmt =3D &node->fmt.fmt.pix;
> > >  		const struct unicam_format_info *fmtinfo;
> > >=20
> > > -		fmtinfo =3D unicam_find_format_by_fourcc(fmt->pixelformat,
> > > -						       UNICAM_SD_PAD_SOURCE_IMAGE);
> > > +		fmtinfo =3D unicam_find_format_by_code(format->code,
> > > +						     UNICAM_SD_PAD_SOURCE_IMAGE);
> > >  		if (WARN_ON(!fmtinfo)) {
> > >  			ret =3D -EPIPE;
> > >  			goto out;
> > >  		}
> > >=20
> > > -		if (fmtinfo->code !=3D format->code ||
> > > -		    fmt->height !=3D format->height ||
> > > +		if (fmtinfo->fourcc !=3D fmt->pixelformat) {
> >=20
> > I gave it a try, and fmtinfo->fourcc would always be equal to
> > fmt->pixelformat, so we never enter that branch and don't warn.
>=20
> I'm puzzled by this.

Sorry, I was thinking about an earlier case where I missed a condition.
It's still not working though, see below

> Let's consider the incorrect case where the media
> bus format on the subdev pad (format->code) is BGR888_1X24 and the pixel
> format (fmt->pixelformat) BGR24.
>=20
> The unicam_find_format_by_code() function iterates over
> unicam_image_formats and finds the entry that has been patched to
>=20
>  	}, {
>  		.fourcc		=3D V4L2_PIX_FMT_RGB24, /* rgb */
> -		.code		=3D MEDIA_BUS_FMT_RGB888_1X24,
> +		.code		=3D MEDIA_BUS_FMT_BGR888_1X24,
>  		.depth		=3D 24,
>  		.csi_dt		=3D MIPI_CSI2_DT_RGB888,
>  	}, {
>=20
> fmtinfo->fourcc is V4L2_PIX_FMT_RGB24, which is not equal to
> fmt->pixelformat (BGR24). What am I missing ?
>
> > I kept the old lookup and condition...
> >=20
> > > +			if ((fmtinfo->fourcc =3D=3D V4L2_PIX_FMT_BGR24 &&
> > > +			     format->code =3D=3D MEDIA_BUS_FMT_BGR888_1X24) ||
> > > +			    (fmtinfo->fourcc =3D=3D V4L2_PIX_FMT_RGB24 &&
> > > +			     format->code =3D=3D MEDIA_BUS_FMT_RGB888_1X24)) {

The application I tested this with was using RGB24 /
MEDIA_BUS_FMT_RGB888_1X24 to get the right pixel order.

So, with the changes in those patches, the lookup by mbus code will now
return the BGR24 fmtinfo, but fmt->pixelformat is RGB24.

I've changed it to test fmt->pixelformat instead of fmtinfo->fourcc, and
it works fine now.

Maxime

--a2f3sroqwqfzfflf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaZQoKgAKCRAnX84Zoj2+
djtwAYCL1zk7UKTBdfOIWyB3IcV8cYiemFVvG2u2B/cUBMgaWB9vJzbrccWBiuWV
lld5fSIBeQEh35uafF03pbYLAK/46hXadiDpdMc8JulngjKFmtccriQ4ya56TA4i
QhwIGWw1bQ==
=pzpX
-----END PGP SIGNATURE-----

--a2f3sroqwqfzfflf--

