Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B70F417572
	for <lists+linux-media@lfdr.de>; Fri, 24 Sep 2021 15:21:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345841AbhIXNXY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Sep 2021 09:23:24 -0400
Received: from comms.puri.sm ([159.203.221.185]:44344 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1346807AbhIXNWv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Sep 2021 09:22:51 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 65F87E11F4;
        Fri, 24 Sep 2021 06:20:47 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id nlTwa3QsPStJ; Fri, 24 Sep 2021 06:20:46 -0700 (PDT)
Date:   Fri, 24 Sep 2021 15:20:34 +0200
From:   Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@puri.sm, phone-devel@vger.kernel.org
Subject: Re: [PATCH] media: imx: Fix rounding
Message-ID: <20210924152008.1ebbfeaf.dorota.czaplejewicz@puri.sm>
In-Reply-To: <20210924114615.GA21343@pengutronix.de>
References: <20210924120631.7060da0f.dorota.czaplejewicz@puri.sm>
        <20210924114615.GA21343@pengutronix.de>
Organization: Purism
Content-Type: multipart/signed; boundary="Sig_/eC6gTd.RJwEHyTcCWa9bY8w";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--Sig_/eC6gTd.RJwEHyTcCWa9bY8w
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, 24 Sep 2021 13:46:15 +0200
Philipp Zabel <p.zabel@pengutronix.de> wrote:

> Hi Dorota,
>=20
> On Fri, Sep 24, 2021 at 12:06:31PM +0200, Dorota Czaplejewicz wrote:
> > Change rounding to the minimal burst size from 2^n to n.
> >=20
> > This fixes images with sizes that are a multiple of 8 pixels. =20
>=20
> Could you elaborate on what is currently wrong with images that are a
> multiple of 8 pixels wide? Or are you rather trying to add support
> for images that are not a multiple of 8 pixels wide?
>=20
> >=20
> > See section 13.7.6.13 CSI Image Parameter Register of the
> > i.MX 8M Quad Applications Processors Reference Manual.
> >=20
> > Fixes: 451a7b7815d0b ("media: imx: lift CSI and PRP ENC/VF width
> > alignment restriction")
> > Signed-off-by: Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
> > ---
> > Hi,
> >=20
> > I tested this patch on the Librem 5 with the main camera.
> >=20
> > --Dorota
> >  drivers/staging/media/imx/imx-media-utils.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/stag=
ing/media/imx/imx-media-utils.c
> > index 5128915a5d6f..a2d8fab32a39 100644
> > --- a/drivers/staging/media/imx/imx-media-utils.c
> > +++ b/drivers/staging/media/imx/imx-media-utils.c
> > @@ -545,13 +545,13 @@ int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix=
_format *pix,
> >  	}
> > =20
> >  	/* Round up width for minimum burst size */
> > -	width =3D round_up(mbus->width, 8);
> > +	width =3D round_up(mbus->width, 3); =20
>=20
> That is not a valid use of the round_up() macro anymore.
> The second parameter must be a power of 2.
>=20
> regards
> Philipp

Thanks for catching that. It turns out I was fixing an image that was a mul=
tiple of 4, but not a multiple of 8.

The problem that occurred has to do with an image of size 1052x780, which c=
overs the entire sensor in use at 1/4 scale.

The sensor was configured to emit 1052*780 8-bit pixels, whereas the CSI po=
rtion here rounded up the image, expecting 1056*780. As a result, the users=
pace received a buffer sized according to the latter, each frame padded wit=
h some pixels from the next. As a result, each frame was composed of two or=
 more, with a broken TV effect.

The data sheet says that the width parameter "should" be a multiple of 8:

> If the input data from the sensor is 8-bit/pixel format, the IMAGE_WIDTH =
should be a multiple of 8 pixels.

Nevertheless, I double-tested this, and changing the relevant rounding from=
 "8" to "4" works flawlessly here. Lower divisors were tested previously an=
d did not work.

Does it make sense to accept 4 as a valid divisor, given that rounding is l=
ikely not going to help but result in an invalid image anyway (as it did fo=
r me)?

Cheers,
Dorota

--Sig_/eC6gTd.RJwEHyTcCWa9bY8w
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEExKRqtqfFqmh+lu1oADBpX4S8ZncFAmFN0KIACgkQADBpX4S8
Znf0ZQ/9H/SvIabIKm5F2Uq1iw3CEpedFG3edL5TaIZksEygftXOVr1txsfwPda6
5wxljjkTmZSyehRFGz1kVuhHukau4jjlhFk05zhBl/EshGCLsDRL4YNTCDeYMGNB
vXBElaGkSFFF+wqGiMKjC3SaH4LMhFj1ZWKV3Ha4ZUgTXzRHZ7U7pFAgOTDpvvK0
FlJ+3iKTWuspwP1uFiCVD5RITqTf5xUDtOFMzA71rmIxsbV5a9TDDpi2xVSY2eHv
nIjQmMoPcO9wsvCjdm91gEV4wFl7TV814G0VC9G7K7fe2wBhWmILwcHQavQ53YzQ
JIFcDrg+7+smuYZJW7z09wocycVzmWkv7Zf+jVJsW9H9SJOiEeWOJ79NzHMCIiRj
gccaEdTLopLwKmJiDCH7LU+A1qWltP0zZQlaPjyDEcdRxEUKe4FYJEgc0VcMgz5c
Dl5pXp2zB/RFIzAXOm23fA8hya2ZfjXIuWpv4bAxMIA2mzeTUNU7+sKsEUE+8lPn
1oRZosOlm2zuve0QiZEVBYjHHj9kBZ1Je2/xo07653IIwlUAW1zsitwHLQIQToPF
we79uJcRQOt676szBJtEAK2XRN3bs71lkeQV1s0fxBda5L5fPnPCJsfWY/JcTkdF
V97TEpmd7YJ+qWqiRdboEJdAhx5B2/2kSHGrcY9wW4srC9+Yk6o=
=u92W
-----END PGP SIGNATURE-----

--Sig_/eC6gTd.RJwEHyTcCWa9bY8w--
