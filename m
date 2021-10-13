Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADBC342BB81
	for <lists+linux-media@lfdr.de>; Wed, 13 Oct 2021 11:27:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236858AbhJMJ3f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 05:29:35 -0400
Received: from comms.puri.sm ([159.203.221.185]:58508 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237194AbhJMJ30 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 05:29:26 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id EE175DF6D2;
        Wed, 13 Oct 2021 02:26:52 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 7tBAZzFwpWvF; Wed, 13 Oct 2021 02:26:52 -0700 (PDT)
Date:   Wed, 13 Oct 2021 11:26:36 +0200
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
Message-ID: <20211013112636.6963344d.dorota.czaplejewicz@puri.sm>
In-Reply-To: <7d61fdbd161fce40874766bde5f95c3b73f1a96d.camel@pengutronix.de>
References: <20211006110207.256325-1-dorota.czaplejewicz@puri.sm>
        <7d61fdbd161fce40874766bde5f95c3b73f1a96d.camel@pengutronix.de>
Organization: Purism
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Lb+aKW2dEDTyBgr2xwG1woU";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--Sig_/Lb+aKW2dEDTyBgr2xwG1woU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, 08 Oct 2021 14:19:41 +0200
Philipp Zabel <p.zabel@pengutronix.de> wrote:

> Hi Dorota,
>=20
> On Wed, 2021-10-06 at 13:05 +0200, Dorota Czaplejewicz wrote:
> > Section 13.7.6.13 "CSI Image Parameter Register" of the
> > i.MX 8M Quad Applications Processors Reference Manual
> > states that the line size should be divisible by 8 bytes.
> > However, the hardware also accepts sizes divisible by 4 bytes.
> >=20
> > This patch accepts line sizes divisible 4-bytes in non-planar mode. =20
>=20
> Thank you, this makes it much clearer. I see two issues with this,
> though, one small and one a bit bigger:
>=20
> First, I'd be wary of disregarding the reference manual - unless we know
> better, and then it should be well documented in the code. It might be
> that the 8-byte alignment requirement stems from the fact that the FIFO
> operates in double-word units, which might cause the CSI to write over
> the end of the buffer if the line width is odd (in 32-bit words).
> Or maybe it's just that the FBUF_STRIDE conflicts with this, I'm unclear
> on whether that is only given in units of dwords (although the driver
> currently doesn't support this anyway).
>=20
> I wonder: if you use 4-byte aligned width and odd height, does the CSI
> write over the end of the buffer?

I tested this case, and found a glitch which suggests the last 4 bytes are =
ignored:

https://source.puri.sm/Librem5/linux-next/uploads/cfb59e3832431aaa3a6954945=
5502568/image.png

That would be taken care of rounding up towards a number decided at runtime=
, like:

divisor =3D 8 >> (mbus->height % 2);
>=20
> > Signed-off-by: Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
> > ---
> >=20
> > Hello,
> >=20
> > my previous patch identified something that was not a problem,
> > so I'm sending a different one.
> >=20
> > This has been tested on the Librem 5.
> >=20
> > Cheers,
> > Dorota
> >=20
> >  drivers/staging/media/imx/imx-media-utils.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/stag=
ing/media/imx/imx-media-utils.c
> > index 5128915a5d6f..a303003929e3 100644
> > --- a/drivers/staging/media/imx/imx-media-utils.c
> > +++ b/drivers/staging/media/imx/imx-media-utils.c
> > @@ -545,13 +545,13 @@ int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix=
_format *pix,
> >  	}
> > =20
> >  	/* Round up width for minimum burst size */
> > -	width =3D round_up(mbus->width, 8);
> > +	width =3D round_up(mbus->width, 4);
> > =20
> >  	/* Round up stride for IDMAC line start address alignment */
> >  	if (cc->planar)
> >  		stride =3D round_up(width, 16);
> >  	else
> > -		stride =3D round_up((width * cc->bpp) >> 3, 8);
> > +		stride =3D round_up((width * cc->bpp) >> 3, 4); =20
>=20
> Second, even if this works fine on the i.MX7/8M CSI, the alignment is
> still required for the i.MX5/6 IPU, for which this code and the comments
> were written. So we need a way to differentiate the two cases here.
>=20
> regards
> Philipp

How best to go about this? I can see in the file imx-media-capture.c that t=
here the video device lives in struct capture_priv.vdev.vfd. Would that be =
the right place to query about the underlying hardware?

Then the following functions would gain a new "small_divisor" parameter:
- imx_media_mbus_fmt_to_pix_fmt (a GPL symbol)
- imx_media_mbus_fmt_to_ipu_image (a GPL symbol)
- __capture_try_fmt

Those would have to extract the device type from struct capture_priv:
- __capture_legacy_try_fmt
- capture_try_fmt_vid_cap
- capture_s_fmt_vid_cap
- capture_init_format

Regards,
Dorota

--Sig_/Lb+aKW2dEDTyBgr2xwG1woU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEExKRqtqfFqmh+lu1oADBpX4S8ZncFAmFmpkwACgkQADBpX4S8
Zne+Wg/+MuIDGf86E/3/MqRiCINZ9zRQOQ7IPp/BCUpsxVBh5BEVKZKjkDQAoi1O
x5/OXocME8+T7mU6NMuShIoXdCt9nX1yZ8kZTv9TcLjV+/Fd4gu5e7M6WQ4PP7CT
V+EU38QiIPpMCavCQBKU+MIS2HNwMeZsz8G/Z5gjtPMR/Xnhh764c7wPuwWOpsOH
aDulbdrJ0nkKSrOznou6eDgxWXDk4cuHOVe14e61k52MfXsSbXzNYV9IWUkzOL/d
6gXVSOp9X0QC5TeDgjgVXFIJy/G5c7iOO1xNzfz4Ayg+C98lwWKfkCELUUSJGQer
Az1t1NSjLS3oZQBL1BkDp+N9y1/Q7PBPVGi6e5wtCjeoLQuRZnyRb04+qVLM/lfo
IieI8RtIiSx7g0jg0EALCfksUEPddln5lcR994AEtVrHjnmexOFsSFtBKZiKNNS8
tfWO/dIfDrE8+HbXGzXWuijAQMq7M7D5t7OeHjZ+lCXuZJlCY2EmVTz20ho1rs82
1KaX/S9/fq8Qk56xc4oUXPfWm7GZwgqBguRPHiSeIeIe0C5Y3sV9MCWqZ3Fze1ey
7IW3mgMbFWT6wg8KAPMEa2oegymDxgO0P4r58qY3r4D2yJ5j34wpjm05PC06uBvZ
atqqq9dIOsZ1XeKetuj5yieHhzpNId5n7GKfmIaEtObhCinXZrI=
=YM5e
-----END PGP SIGNATURE-----

--Sig_/Lb+aKW2dEDTyBgr2xwG1woU--
