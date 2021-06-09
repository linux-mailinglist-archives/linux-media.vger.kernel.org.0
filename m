Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0604B3A1511
	for <lists+linux-media@lfdr.de>; Wed,  9 Jun 2021 15:03:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233894AbhFINFD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Jun 2021 09:05:03 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:56507 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230176AbhFINFA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Jun 2021 09:05:00 -0400
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id C3CE61C001D;
        Wed,  9 Jun 2021 13:03:02 +0000 (UTC)
Date:   Wed, 9 Jun 2021 15:03:02 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Sebastian Reichel <sre@kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 1/2] media: v4l2-subdev: Fix documentation of the
 subdev_notifier member
Message-ID: <YMC8BgVmcpAk3o3h@aptenodytes>
References: <20210609115457.822085-1-paul.kocialkowski@bootlin.com>
 <20210609123003.GF3@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="8ict/VnrDmy6dFMo"
Content-Disposition: inline
In-Reply-To: <20210609123003.GF3@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--8ict/VnrDmy6dFMo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

On Wed 09 Jun 21, 15:30, Sakari Ailus wrote:
> Hi Paul,
>=20
> On Wed, Jun 09, 2021 at 01:54:56PM +0200, Paul Kocialkowski wrote:
> > Fix the name of the function that registers the subdev_notifier member
> > of the v4l2_subdev structure.
> >=20
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > ---
> >  include/media/v4l2-subdev.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > index d0e9a5bdb08b..f3b657dfe304 100644
> > --- a/include/media/v4l2-subdev.h
> > +++ b/include/media/v4l2-subdev.h
> > @@ -854,7 +854,7 @@ struct v4l2_subdev_platform_data {
> >   * @asd: Pointer to respective &struct v4l2_async_subdev.
> >   * @notifier: Pointer to the managing notifier.
> >   * @subdev_notifier: A sub-device notifier implicitly registered for t=
he sub-
> > - *		     device using v4l2_device_register_sensor_subdev().
> > + *		     device using v4l2_async_register_subdev_sensor_common().
>=20
> I agree in principle, but the function is nowadays called
> v4l2_async_register_subdev_sensor().
>=20
> I can fix this while applying.

Looks like I missed the rename when rebasing my patch on media/master!
Of course, feel free to update with the new name.

Thanks,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--8ict/VnrDmy6dFMo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmDAvAYACgkQ3cLmz3+f
v9Fv6Qf9HId8bGavXs06BYDx3THrx29O6HEbuNvrhcARHyLprUcpNZd7aeySbd+I
yPE4c6WLGt+l4w2C7W1PfVySyIR/fzDu5iSpo6q2cBePntxNRD3i2KjskTvG8R+r
WCXnuaxzLFs0Y0yMp3Urn7jLUg3oFmoipxKnpa+WA/Fsx3yByd9+Vj+K2jvDSa4n
oZRMxuL03TcPZI+gePjt7mY/pRrOqTEWf19wnvkZW8ZOQu2ukcXJ9Zw4UtQBXaxu
/u1JDvm50C59tncroDr4K+Tmnre9TK7PFUwtssWinhHq9HsZtcb843uiTJ0Ero6M
aqZpxv8yKTtQ1Ae3OjOY2phTCTez7g==
=AyNo
-----END PGP SIGNATURE-----

--8ict/VnrDmy6dFMo--
