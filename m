Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AC62430838
	for <lists+linux-media@lfdr.de>; Sun, 17 Oct 2021 13:07:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245393AbhJQLKG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Oct 2021 07:10:06 -0400
Received: from comms.puri.sm ([159.203.221.185]:52880 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235960AbhJQLKF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Oct 2021 07:10:05 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id AEB44DFA1F;
        Sun, 17 Oct 2021 04:07:25 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id BdkqQhRX4NpW; Sun, 17 Oct 2021 04:07:24 -0700 (PDT)
Date:   Sun, 17 Oct 2021 13:07:13 +0200
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
Subject: Re: [PATCH] media: imx: Round line size to 4 bytes
Message-ID: <20211017130713.4668c616.dorota.czaplejewicz@puri.sm>
In-Reply-To: <1d8878e86b862ae8d551b6796e86c4fb1eb5d671.camel@pengutronix.de>
References: <20211006110207.256325-1-dorota.czaplejewicz@puri.sm>
        <7d61fdbd161fce40874766bde5f95c3b73f1a96d.camel@pengutronix.de>
        <20211013112636.6963344d.dorota.czaplejewicz@puri.sm>
        <1d8878e86b862ae8d551b6796e86c4fb1eb5d671.camel@pengutronix.de>
Organization: Purism
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3Pfy1EoRadhkVVrPdaPSq/H";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--Sig_/3Pfy1EoRadhkVVrPdaPSq/H
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, 14 Oct 2021 13:26:26 +0200
Philipp Zabel <p.zabel@pengutronix.de> wrote:

> Hi Dorota,
>=20
> On Wed, 2021-10-13 at 11:26 +0200, Dorota Czaplejewicz wrote:
> > On Fri, 08 Oct 2021 14:19:41 +0200 Philipp Zabel <p.zabel@pengutronix.d=
e> wrote: =20
> [...]
> > > I wonder: if you use 4-byte aligned width and odd height, does the CSI
> > > write over the end of the buffer? =20
> >=20
> > I tested this case, and found a glitch which suggests the last 4 bytes =
are ignored:
> >=20
> > https://source.puri.sm/Librem5/linux-next/uploads/cfb59e3832431aaa3a695=
49455502568/image.png =20
>=20
> Thank you for testing, so it appears that at least without FBUF_STRIDE
> the only requirement is that the whole image size must be a multiple of
> 8 bytes.
>=20
> > That would be taken care of rounding up towards a number decided at run=
time, like:
> >=20
> > divisor =3D 8 >> (mbus->height % 2); =20
>=20
> Which would then cause the CSI to write past the end of the buffer?
>=20
I'm not sure if you point out the mistake here (should be "4 <<"), or the f=
act that rounding is happening. If it's the latter, then it's of no concern=
: the values derived here are used to calculate buffer size.

I'm submitting a new series where this is fixed.

> I'd rather make sure that either the number of lines is even or the
> width is a multiple of 8 bytes.
>=20
> > > > Signed-off-by: Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
> > > > ---
> > > >=20
> > > > Hello,
> > > >=20
> > > > my previous patch identified something that was not a problem,
> > > > so I'm sending a different one.
> > > >=20
> > > > This has been tested on the Librem 5.
> > > >=20
> > > > Cheers,
> > > > Dorota
> > > >=20
> > > >  drivers/staging/media/imx/imx-media-utils.c | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >=20
> > > > diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/=
staging/media/imx/imx-media-utils.c
> > > > index 5128915a5d6f..a303003929e3 100644
> > > > --- a/drivers/staging/media/imx/imx-media-utils.c
> > > > +++ b/drivers/staging/media/imx/imx-media-utils.c
> > > > @@ -545,13 +545,13 @@ int imx_media_mbus_fmt_to_pix_fmt(struct v4l2=
_pix_format *pix,
> > > >  	}
> > > > =20
> > > >  	/* Round up width for minimum burst size */
> > > > -	width =3D round_up(mbus->width, 8);
> > > > +	width =3D round_up(mbus->width, 4);
> > > > =20
> > > >  	/* Round up stride for IDMAC line start address alignment */
> > > >  	if (cc->planar)
> > > >  		stride =3D round_up(width, 16);
> > > >  	else
> > > > -		stride =3D round_up((width * cc->bpp) >> 3, 8);
> > > > +		stride =3D round_up((width * cc->bpp) >> 3, 4);   =20
> > >=20
> > > Second, even if this works fine on the i.MX7/8M CSI, the alignment is
> > > still required for the i.MX5/6 IPU, for which this code and the comme=
nts
> > > were written. So we need a way to differentiate the two cases here.
> > >=20
> > > regards
> > > Philipp =20
> >=20
> > How best to go about this? I can see in the file imx-media-capture.c
> > that there the video device lives in struct capture_priv.vdev.vfd.
> > Would that be the right place to query about the underlying hardware?
> >=20
> > Then the following functions would gain a new "small_divisor" parameter:
> > - imx_media_mbus_fmt_to_pix_fmt (a GPL symbol)
> > - imx_media_mbus_fmt_to_ipu_image (a GPL symbol)
> > - __capture_try_fmt =20
>=20
> That sounds like it would work around the current code when it (at least
> part of imx_media_mbus_fmt_to_pix_fmt()) should be split between i.MX5/6
> and i.MX7/8 implementations. For example rounding up the stride is not
> useful on i.MX7/8, it just doesn't currently hurt because imx7-media-csi=
=20
> is not using bytesperline to set up FBUF_STRIDE. And certainly the
> comments don't apply.
>=20
> imx_media_mbus_fmt_to_ipu_image() is unused and should probably be
> dropped, same as imx_media_ipu_image_to_mbus_fmt().

Done in next series.
>=20
> > Those would have to extract the device type from struct capture_priv:
> > - __capture_legacy_try_fmt
> > - capture_try_fmt_vid_cap
> > - capture_s_fmt_vid_cap
> > - capture_init_format =20
>=20
> Maybe imx_media_mbus_fmt_to_pix_fmt should be moved into imx-media-
> capture.c be passed struct capture_priv to avoid duplicating the device
> type check?
>=20
I opted not to, in favor of passing the actual device type. It comes out to=
 the same thing, except a simple value is passed around instead of a device.

> imx_media_capture_device_init() could gain a new parameter (or maybe
> replace legacy_api) to set the device type.

Thanks, this is what I was missing.

Regards,
Dorota
>=20
> regards
> Philipp


--Sig_/3Pfy1EoRadhkVVrPdaPSq/H
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEExKRqtqfFqmh+lu1oADBpX4S8ZncFAmFsA+EACgkQADBpX4S8
ZncnvQ/+NEAYfdFoRmGgvfSL+jRzj/+XIvhViKP2W+CzU2lE4Y+YdG/4DQsAq4hv
K34krzBX8ZG8wdxP4kTCKRmqZfQ47sRDW594mpvcTG4fsovyLlhr8TnMW69AMzXB
nvaM5DSZhpz6msI9paaROyX6IXK7LRfehDlOLyCZO/U3u1Z3ujvKXyw45waM1LN/
6hCBqflMO+pGV4XhVHlRc+1DlXn5o2/7XTVvT2qtVCkiyBFy24WaDYjtCjCtI6o1
rIOGxdl5X6GiYL1Z5+Or3QOIQQxtbTaUhLxAzXyX5r/gb08BZQmJLJJHIEUSJfMf
tr5m6eiCZhQxqfG9IagFM6c43kv4cVuf8tf7UrEu3wrFAziaJKfNvfWSOE6NbrLv
JrP5XVNAigQNXss8NmQzyxSeHIJWH33+6oODC1SZ2q+8I1PrH6CvK+eFZQ1KAwUI
OLp+SCd7BeXrG2s1gqTmTFP8t7rgWZ0eZc86h3nt2mCdsIGFQdB3ZF0X7Y4AQM+N
nbcG1SyBAEX0Hdqm+2W5OnUjchi/5QZ6KyScPDO6ABolUd0kDzC8Cd3m4MOoqtXf
moat42ZqQBvtmPmaxeuxJeVjpoOnp5z9/wihbtAqMVC0du/wbb61zQaB2iP5reVL
VAOgMIzp141f8DPRf2954PcecPzjq+E5qZsFkUNafzk00f6BkG4=
=pJAi
-----END PGP SIGNATURE-----

--Sig_/3Pfy1EoRadhkVVrPdaPSq/H--
