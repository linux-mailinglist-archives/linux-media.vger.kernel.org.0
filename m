Return-Path: <linux-media+bounces-15042-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B07059322E9
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2024 11:33:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D368C1C2233F
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2024 09:33:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2324D196C7C;
	Tue, 16 Jul 2024 09:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="LrNR3q4c"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1786FB8;
	Tue, 16 Jul 2024 09:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721122418; cv=none; b=ienI3liR3B+ptd3DkNxQhoszvygQjVTYX7z/9Mbz+g+zRw/HLCCqAOWwCKlSD6U2e4gifu4SBnIhKkcJuYRDu5TF3y6SAIFsRzVyMujHG2jNmaVrzrF0C9Oassry1aUkEgEnkRZ4EjQ7uSsPnyT21S9euBqHWtR2tPxDQAAjYko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721122418; c=relaxed/simple;
	bh=6n+18LC9gX1oMnHDlZ2QF5g8jBA3Sw4Skznqp+veRyY=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m8/arN7INPTc4jUg9tbBVuVOBRZeZfFVjGVFgoIWOTlWKHb/ww3Tlzr2QHcDFaU5YZdiI8B2jJwHA1SDAWtmjaklf1HVIu8rNoRZQ1v7vvqvY4jaouxcDE4kjkuYMZDqGL1pJXGzZw14O4bWa2O3j08iO6uTDSOBTsguN2U9eCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=LrNR3q4c; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46G9XNjR065180;
	Tue, 16 Jul 2024 04:33:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721122403;
	bh=1Y/xsdx03aZ9PT6e2w1NEKA2i9aokmog2udtLJJwSw4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=LrNR3q4ch7doJRIpHobBH1Ok+IfvbVE6bFV/8TP3yfM2mI/YIvujOSGktVc1pg2qH
	 N1DgkOPwOWGf+Vs66mkxLCCrF3dvep211GiFepIHXAr74Gi0IhEbWNg4tyo+oVQFNL
	 3xpTxyQxPJUBn4v75u/GLO3DRwQX68AByid0gl+g=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46G9XN3S040150
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 Jul 2024 04:33:23 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 16
 Jul 2024 04:33:22 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 16 Jul 2024 04:33:22 -0500
Received: from localhost (jluthra.dhcp.ti.com [172.24.227.116])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46G9XLhA080065;
	Tue, 16 Jul 2024 04:33:22 -0500
Date: Tue, 16 Jul 2024 15:03:21 +0530
From: Jai Luthra <j-luthra@ti.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
CC: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans
 Verkuil <hverkuil-cisco@xs4all.nl>,
        Vaishnav Achath <vaishnav.a@ti.com>,
        Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
        Aradhya
 Bhatia <a-bhatia1@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
        Changhuang
 Liang <changhuang.liang@starfivetech.com>,
        Jack Zhu
	<jack.zhu@starfivetech.com>,
        Julien Massot <julien.massot@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: Re: [PATCH v2 08/13] media: cadence: csi2rx: add get_frame_desc
 wrapper
Message-ID: <6ypoiwie7yzjftm3h5liahpoqejc7zu6cjw3oenrfob3ia5hoy@isbqhhbge2w4>
References: <20240627-multistream-v2-0-6ae96c54c1c3@ti.com>
 <20240627-multistream-v2-8-6ae96c54c1c3@ti.com>
 <4bufylsl7jladoygnd5pjnvy2wcacl6x6o7hdy6eilh2phcjxv@275gpkmavpm3>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="f63yt5wtwoku7var"
Content-Disposition: inline
In-Reply-To: <4bufylsl7jladoygnd5pjnvy2wcacl6x6o7hdy6eilh2phcjxv@275gpkmavpm3>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

--f63yt5wtwoku7var
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul 12, 2024 at 16:48:28 +0200, Jacopo Mondi wrote:
> Hi Jai
>=20
> On Thu, Jun 27, 2024 at 06:40:03PM GMT, Jai Luthra wrote:
> > From: Pratyush Yadav <p.yadav@ti.com>
> >
> > J721E wrapper CSI2RX driver needs to get the frame descriptor from the
> > source to find out info about virtual channel. This driver itself does
> > not touch the routing or virtual channels in any way. So simply pass the
> > descriptor through from the source.
> >
> > Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> > Signed-off-by: Jai Luthra <j-luthra@ti.com>
> > ---
> >  drivers/media/platform/cadence/cdns-csi2rx.c | 24 ++++++++++++++++++++=
++++
> >  1 file changed, 24 insertions(+)
> >
> > diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/med=
ia/platform/cadence/cdns-csi2rx.c
> > index 751eadbe61ef..b6054d62c799 100644
> > --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> > +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> > @@ -135,6 +135,21 @@ static const struct csi2rx_fmt *csi2rx_get_fmt_by_=
code(u32 code)
> >  	return NULL;
> >  }
> >
> > +static int csi2rx_get_frame_desc_from_source(struct csi2rx_priv *csi2r=
x,
> > +					     struct v4l2_mbus_frame_desc *fd)
> > +{
> > +	struct media_pad *remote_pad;
> > +
> > +	remote_pad =3D media_entity_remote_source_pad_unique(&csi2rx->subdev.=
entity);
> > +	if (!remote_pad) {
> > +		dev_err(csi2rx->dev, "No remote pad found for sink\n");
> > +		return -ENODEV;
> > +	}
> > +
> > +	return v4l2_subdev_call(csi2rx->source_subdev, pad, get_frame_desc,
> > +				remote_pad->index, fd);
> > +}
> > +
> >  static inline
> >  struct csi2rx_priv *v4l2_subdev_to_csi2rx(struct v4l2_subdev *subdev)
> >  {
> > @@ -466,10 +481,19 @@ static int csi2rx_init_state(struct v4l2_subdev *=
subdev,
> >  	return csi2rx_set_fmt(subdev, state, &format);
> >  }
> >
> > +static int csi2rx_get_frame_desc(struct v4l2_subdev *subdev, unsigned =
int pad,
> > +				 struct v4l2_mbus_frame_desc *fd)
> > +{
> > +	struct csi2rx_priv *csi2rx =3D v4l2_subdev_to_csi2rx(subdev);
> > +
> > +	return csi2rx_get_frame_desc_from_source(csi2rx, fd);
> > +}
> > +
> >  static const struct v4l2_subdev_pad_ops csi2rx_pad_ops =3D {
> >  	.enum_mbus_code	=3D csi2rx_enum_mbus_code,
> >  	.get_fmt	=3D v4l2_subdev_get_fmt,
> >  	.set_fmt	=3D csi2rx_set_fmt,
> > +	.get_frame_desc =3D csi2rx_get_frame_desc,
>=20
> The previous entries are indented with a tab

Ah thanks, will fix.

>=20
> With this fixed
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>=20
> Thanks
>   j
>=20
> >  };
> >
> >  static const struct v4l2_subdev_video_ops csi2rx_video_ops =3D {
> >
> > --
> > 2.43.0
> >
> >

--=20
Thanks,
Jai

GPG Fingerprint: 4DE0 D818 E5D5 75E8 D45A AFC5 43DE 91F9 249A 7145

--f63yt5wtwoku7var
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmaWPmAACgkQQ96R+SSa
cUW1jw//Xs7ZsVhckvkq/3NwRxNLNAj6w5xUEOEb86k5yB2LNRmpMFlEfKEKwztY
cWWnwxrzHLnuW3h81vSPqNcv0ZGGAjHiE0BfE3rACYIx1Od2zdCHjAQ1WhWWMMIW
lIICp1dyooh0KteaOiX4D4yWDJSEXmfj+4kweTgoCsEaW6TzvqCZncLEpvnPaeRS
wUjYY8xTSD94EgvEAL1zuTBfWIgK0YO1PmTvTqtvfWw1B6fwPzXlI0IJ0S5tlty/
GWOPTqUsAbU7PMRjIQpmBd8em/KQ+nkvbCvBP66RNOyS/g980TNAJtxa594nU7T3
uOcMtdav+DFQo9HWzFOm2d65/atZhDuyh5+FiCGEXQx0cgxEVQ91OTrrbW4T1bRm
4kKx4MOPKxwvG93BArVixTOc5z9D2G8bd6kaYv+ZDWynM0MHL6tMjeSAD25n+X+U
YkZ/S7r6BB0YXUhl0tJDlTHTeKeIMceSC+nyYdzJFKffwRxmdvBKFJ0QC5mOAHOh
+my0TC6STi2VAzehLvbNb9OM2w2h8MIBDqWsKbF+Dp+/j3ZFnxvyZmrdic+2/9tY
6yJ82ZahGtD50LJuI6js39hysjnPlpHso02GeZV/BTM1k0nBcVG1z0OfiYh+A2QD
fMAC5VCbNZQXxTIew5JlKmmBNTGyNUGQDV7MrcZ1/Q1VZI7bnc0=
=2Ixs
-----END PGP SIGNATURE-----

--f63yt5wtwoku7var--

