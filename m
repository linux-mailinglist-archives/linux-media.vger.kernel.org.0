Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFA5A1C02E1
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 18:44:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726435AbgD3Qnt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Apr 2020 12:43:49 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:58891 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726333AbgD3Qns (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Apr 2020 12:43:48 -0400
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id CB8E11BF203;
        Thu, 30 Apr 2020 16:43:43 +0000 (UTC)
Date:   Thu, 30 Apr 2020 18:43:43 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hansverk@cisco.com>,
        justin.swartz@risingedge.co.za, Johan Jonker <jbx6244@gmail.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 4/4] media: rockchip: rga: Only set output CSC mode
 for RGB input
Message-ID: <20200430164343.GB1526319@aptenodytes>
References: <20200423200937.1039257-1-paul.kocialkowski@bootlin.com>
 <20200423200937.1039257-5-paul.kocialkowski@bootlin.com>
 <c49a060e7f5da9564e375fdd47117d3f901e5d00.camel@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="eRtJSFbw+EEWtPj3"
Content-Disposition: inline
In-Reply-To: <c49a060e7f5da9564e375fdd47117d3f901e5d00.camel@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--eRtJSFbw+EEWtPj3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ezequiel,

On Sat 25 Apr 20, 10:46, Ezequiel Garcia wrote:
> Hi Paul,
>=20
> Thanks a lot for the patch.
>=20
> I haven't had the chance to test this,
> but I'd say you are fixing a long time issue here.
>=20
> I really appreciate that.
>=20
> On Thu, 2020-04-23 at 22:09 +0200, Paul Kocialkowski wrote:
> > Setting the output CSC mode is required for a YUV output, but must not
> > be set when the input is also YUV. Doing this (as tested with a YUV420P
> > to YUV420P conversion) results in wrong colors.
> >=20
> > Adapt the logic to only set the CSC mode when the output is YUV and the
> > input is RGB.
> >=20
> > Fixes: f7e7b48e6d79 ("[media] rockchip/rga: v4l2 m2m support")
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > ---
> >  drivers/media/platform/rockchip/rga/rga-hw.c | 18 +++++++++++-------
> >  1 file changed, 11 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/med=
ia/platform/rockchip/rga/rga-hw.c
> > index 4be6dcf292ff..cbffcf986ccf 100644
> > --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> > +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> > @@ -216,13 +216,17 @@ static void rga_cmd_set_trans_info(struct rga_ctx=
 *ctx)
> >  	}
> > =20
> >  	if (ctx->out.fmt->hw_format >=3D RGA_COLOR_FMT_YUV422SP) {
>=20
> Since we are already here touching this code, would you mind
> adding another patch, to do some cleaning first?
>=20
> First, replace the nested ifs with a boolean operator.
> Then, introduce some IS_YUV (or IS_RGB) macro, making the above test
> more like IS_YUV(out_hw_format).
>=20
> Finally, perhaps a comment along the lines of your commit message:
>=20
> """
> Setting the output CSC mode is required for a YUV output,
> but must not be set when the input is also YUV.
> """
>=20
> Details up to you :-)
>=20
> After the clean-up patch, which would be just cosmetics,
> your fix should be cleaner and more clear.

All done in v3, thanks for the feedback :)

Cheers,

Paul

> Thanks,
> Ezequiel
> =20
> > -		switch (ctx->out.colorspace) {
> > -		case V4L2_COLORSPACE_REC709:
> > -			dst_info.data.csc_mode =3D RGA_SRC_CSC_MODE_BT709_R0;
> > -			break;
> > -		default:
> > -			dst_info.data.csc_mode =3D RGA_DST_CSC_MODE_BT601_R0;
> > -			break;
> > +		if (ctx->in.fmt->hw_format < RGA_COLOR_FMT_YUV422SP) {
> > +			switch (ctx->out.colorspace) {
> > +			case V4L2_COLORSPACE_REC709:
> > +				dst_info.data.csc_mode =3D
> > +					RGA_SRC_CSC_MODE_BT709_R0;
> > +				break;
> > +			default:
> > +				dst_info.data.csc_mode =3D
> > +					RGA_DST_CSC_MODE_BT601_R0;
> > +				break;
> > +			}
> >  		}
> >  	}
> > =20
>=20
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--eRtJSFbw+EEWtPj3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl6rAD8ACgkQ3cLmz3+f
v9EZUgf/ZXVht/wSchF8mkR6JIJf2Oywvx2GVKvvg/AmHfOt1XTsRKHpmGz8hQEH
NbOjsdq8EVD+tGKnOgP/DyjN4cTtkpNFJj89Bi95hb+7AyBu+ixbDH25hV2jYija
hYHjahA0/MqEN6hFxB4JKlYtd642n5RZ14NCxWqerWKha6LmfsLFT5tdytpQQ/8W
2DTfATXGqnDr5Mmds+uFfRoXGhN9D9OxH+XLSmKsVOtsYurEShfPLIXscec00Mdn
gjvMhqTTat/ttKD1OWnT6C3wuxAE0QrxHg0VvZ2LchjGq4VZbRdF/iQ+DJ4TlASi
5NDfLWJCRezzUYzh000lLcAHVxOAQw==
=2n7E
-----END PGP SIGNATURE-----

--eRtJSFbw+EEWtPj3--
