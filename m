Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49B7640858E
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 09:45:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237725AbhIMHqo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 03:46:44 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:43281 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235185AbhIMHqn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 03:46:43 -0400
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id EAB981BF209;
        Mon, 13 Sep 2021 07:45:22 +0000 (UTC)
Date:   Mon, 13 Sep 2021 09:45:22 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Helen Koike <helen.koike@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 19/22] soc: sunxi: mbus: Add A31 ISP compatibles to the
 list
Message-ID: <YT8BkjAZUGGYTR9l@aptenodytes>
References: <20210910184147.336618-1-paul.kocialkowski@bootlin.com>
 <20210910184147.336618-20-paul.kocialkowski@bootlin.com>
 <208239ba-01b1-451e-6030-894bd25770c3@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="47pajI10N0kGx3V3"
Content-Disposition: inline
In-Reply-To: <208239ba-01b1-451e-6030-894bd25770c3@sholland.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--47pajI10N0kGx3V3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Samuel,

On Fri 10 Sep 21, 21:36, Samuel Holland wrote:
> On 9/10/21 1:41 PM, Paul Kocialkowski wrote:
> > The A31 ISP sits on the mbus and requires the usual bus address
> > adaptation. Add its compatibles to the list.
>=20
> My understanding is that this driver only exists to work around old DT
> bindings where the interconnects/interconnect-names =3D "dma-mem"
> properties are not required (and so they are historically missing from
> the device trees).
>=20
> For new bindings, it would be better to use those properties and not add
> to this list.

Oh okay, I didn't really look into it and just did the same thing that was
done for the CSI controller. Thanks for the heads up!

Paul

> Regards,
> Samuel
>=20
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > ---
> >  drivers/soc/sunxi/sunxi_mbus.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/drivers/soc/sunxi/sunxi_mbus.c b/drivers/soc/sunxi/sunxi_m=
bus.c
> > index d90e4a264b6f..7f0079ea30b1 100644
> > --- a/drivers/soc/sunxi/sunxi_mbus.c
> > +++ b/drivers/soc/sunxi/sunxi_mbus.c
> > @@ -37,6 +37,7 @@ static const char * const sunxi_mbus_devices[] =3D {
> >  	"allwinner,sun5i-a13-video-engine",
> >  	"allwinner,sun6i-a31-csi",
> >  	"allwinner,sun6i-a31-display-backend",
> > +	"allwinner,sun6i-a31-isp",
> >  	"allwinner,sun7i-a20-csi0",
> >  	"allwinner,sun7i-a20-display-backend",
> >  	"allwinner,sun7i-a20-display-frontend",
> > @@ -50,6 +51,7 @@ static const char * const sunxi_mbus_devices[] =3D {
> >  	"allwinner,sun8i-h3-csi",
> >  	"allwinner,sun8i-h3-video-engine",
> >  	"allwinner,sun8i-v3s-csi",
> > +	"allwinner,sun8i-v3s-isp",
> >  	"allwinner,sun9i-a80-display-backend",
> >  	"allwinner,sun50i-a64-csi",
> >  	"allwinner,sun50i-a64-video-engine",
> >=20
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--47pajI10N0kGx3V3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmE/AZIACgkQ3cLmz3+f
v9HI1wf/b/uiL/LNM4ar7LYjzQX7BdaBGjb90aD2mdIi3U+jTM2QjcnvDcWrmKXa
KtNwOdxKB+9/l5qoOzNJgoddBs0EMS//K1kcsr/m0s/+bX32+x+IzZlf3JNp5CUp
gO8q2V1PznhOppOajF1ozaBa9O7XXY1HLy3aoxrOQGziWF/OuQKp0K0qag59avxi
jR6bJdBimD2FNMN4vGooXfCfXEKlVgFe1danPQKA9R0Zos7qQSXO4qbEB1PH5NXJ
kNkPyZpLsYbEFH1o7dnzlxKaqmw8uwLsQy8Vy9KkrKgEyMbrchBM86nyPfVcZZPL
FuWgSOGqcL/+uN5VONdKyYxwYU4i6Q==
=ligS
-----END PGP SIGNATURE-----

--47pajI10N0kGx3V3--
