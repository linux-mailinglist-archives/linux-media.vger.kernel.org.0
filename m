Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ABDF1B1019
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 17:29:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726984AbgDTP3q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Apr 2020 11:29:46 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:58587 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725989AbgDTP3p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Apr 2020 11:29:45 -0400
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id B7571100016;
        Mon, 20 Apr 2020 15:29:41 +0000 (UTC)
Date:   Mon, 20 Apr 2020 17:29:41 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com, Hans Verkuil <hverkuil@xs4all.nl>,
        Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH] cedrus: Drop unneeded CONFIG_OF dependency
Message-ID: <20200420152941.GA610656@aptenodytes>
References: <20200402194653.13535-1-ezequiel@collabora.com>
 <20200403082206.GA626942@aptenodytes>
 <a36a825bc048821b4b7088feea71bd31e9e17211.camel@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Content-Disposition: inline
In-Reply-To: <a36a825bc048821b4b7088feea71bd31e9e17211.camel@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ezequiel,

On Fri 03 Apr 20, 09:21, Ezequiel Garcia wrote:
> On Fri, 2020-04-03 at 10:22 +0200, Paul Kocialkowski wrote:
> > Hi Ezequiel,
> >=20
> > On Thu 02 Apr 20, 16:46, Ezequiel Garcia wrote:
> > > The driver is perfectly capable of being built without CONFIG_OF.
> > > Remove this dependency, which is useful for compile-only tests.
> >=20
> > Thanks for the patch!
> >=20
> > Alas, the driver won't do anything useful without OF enabled, so it see=
ms
> > useful to keep that dependency.
>=20
> I'm not convinced about this argument, I like to have
> dependencies on things the driver needs to compile
> (except the machine option, see below).

Is there a general kernel-wide policy about that?

I must admit that I never really understood if Kconfig depends are supposed=
 to
strictly reflect build dependencies or dependencies that must reasonably be
expected for the driver to be useful. The arch dependency (which is farily
common) seems to suggest the latter.

Maxime, any thought about that?

> > I would suggest making this a: depends on OF || COMPILE_TEST
> > instead. What do you think?
>=20
> Although there are a handful, I don't see many drivers doing that.
> To be honest, I don't like this much.
>=20
> Also, if you want to make sure this driver can only be selected
> where it makes sense, you consider having a ARCH_SUNXI || COMPILE_TEST.

Fair enough, that would be the consistent choice with OF || COMPILE_TEST.

> IMO, the dependency on OF should be dropped as well.
>
> Cheers,
> Eze
>=20
> > Cheers,
> >=20
> > Paul
> >=20
> > > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > > ---
> > >  drivers/staging/media/sunxi/cedrus/Kconfig | 1 -
> > >  1 file changed, 1 deletion(-)
> > >=20
> > > diff --git a/drivers/staging/media/sunxi/cedrus/Kconfig b/drivers/sta=
ging/media/sunxi/cedrus/Kconfig
> > > index 17733e9a088f..59b8d1b29865 100644
> > > --- a/drivers/staging/media/sunxi/cedrus/Kconfig
> > > +++ b/drivers/staging/media/sunxi/cedrus/Kconfig
> > > @@ -3,7 +3,6 @@ config VIDEO_SUNXI_CEDRUS
> > >  	tristate "Allwinner Cedrus VPU driver"
> > >  	depends on VIDEO_DEV && VIDEO_V4L2 && MEDIA_CONTROLLER
> > >  	depends on HAS_DMA
> > > -	depends on OF
> > >  	depends on MEDIA_CONTROLLER_REQUEST_API
> > >  	select SUNXI_SRAM
> > >  	select VIDEOBUF2_DMA_CONTIG
> > > --=20
> > > 2.26.0.rc2
> > >=20
>=20
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl6dv+UACgkQ3cLmz3+f
v9F/ZggAlAIvNxnteZI11ryM9PMa8354QX9Kdf3nGN/QAGCeK48282o2GYPmUmk+
GHehBW01rTvo9bS/oa0ltcSO06xEvuwusxc3rNA8ldanB16wT/zK9/nPsVFtvd17
/lhIvSMODSvBYD6HnFOeC058vCcGeFupgTHJyAfatcSYDeYc1ZomT3RMWkuIynMv
10SqKNWVGH+4cyFw7/Yxth1cHtUNqNtdNwPhW9LBVLm5C3/Sz4SKggUoNhVcHsqA
gSM4bRnpGudU2e/o++NKJuwxPZQmEjsh9epni8p98Gs6PXAQxvQSurzMY90fYHFT
h2hgdOrKxzTyH9x3eoaHbxtywqWOxg==
=KW81
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--
