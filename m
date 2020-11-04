Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6446B2A626C
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 11:44:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729548AbgKDKnz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 05:43:55 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:50406 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729036AbgKDKnz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 05:43:55 -0500
Received: from relay12.mail.gandi.net (unknown [217.70.178.232])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 1811F3AC26A;
        Wed,  4 Nov 2020 10:33:59 +0000 (UTC)
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 2ADE5200009;
        Wed,  4 Nov 2020 10:33:32 +0000 (UTC)
Date:   Wed, 4 Nov 2020 11:33:32 +0100
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-sunxi@googlegroups.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Yong Deng <yong.deng@magewell.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kevin.lhopital@hotmail.com
Subject: Re: [PATCH 11/14] dt-bindings: media: i2c: Add A83T MIPI CSI-2
 bindings documentation
Message-ID: <20201104103332.GB285779@aptenodytes>
References: <20201023174546.504028-1-paul.kocialkowski@bootlin.com>
 <20201023174546.504028-12-paul.kocialkowski@bootlin.com>
 <20201026165653.7tzo2hlagee633ra@gilmour.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yNb1oOkm5a9FJOVX"
Content-Disposition: inline
In-Reply-To: <20201026165653.7tzo2hlagee633ra@gilmour.lan>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--yNb1oOkm5a9FJOVX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon 26 Oct 20, 17:56, Maxime Ripard wrote:
> On Fri, Oct 23, 2020 at 07:45:43PM +0200, Paul Kocialkowski wrote:
> > This introduces YAML bindings documentation for the A83T MIPI CSI-2
> > controller.
> >=20
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
>=20
> What is the difference with the a31/v3s one?

It's a different controller, not a variation of the A31 one.
I'll rework the commit log to make this clearer.

> > ---
> >  .../media/allwinner,sun8i-a83t-mipi-csi2.yaml | 158 ++++++++++++++++++
> >  1 file changed, 158 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/allwinner,s=
un8i-a83t-mipi-csi2.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/media/allwinner,sun8i-a8=
3t-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/allwinner,sun8i=
-a83t-mipi-csi2.yaml
> > new file mode 100644
> > index 000000000000..2384ae4e7be0
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/allwinner,sun8i-a83t-mipi=
-csi2.yaml
> > @@ -0,0 +1,158 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/allwinner,sun8i-a83t-mipi-csi=
2.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Allwinner A83T MIPI CSI-2 Device Tree Bindings
> > +
> > +maintainers:
> > +  - Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: allwinner,sun8i-a83t-mipi-csi2
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: Bus Clock
> > +      - description: Module Clock
> > +      - description: MIPI-specific Clock
> > +      - description: Misc CSI Clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: bus
> > +      - const: mod
> > +      - const: mipi
> > +      - const: misc
>=20
> If it's only due to the clock, it's soemething you can deal with in the
> first schema, there's no need to duplicate them.

It's a completely different controller so I don't think it makes sense to
have a single schema for both. Even if the bindings look similar.

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--yNb1oOkm5a9FJOVX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl+ig3wACgkQ3cLmz3+f
v9EOVAf/e4pm05QGgcVnZzLG/lyNaEDWIuSgd/OGrAGoivwtqRFyR9doN4gDBPyT
WzqyQLUwoqabROn4uo4gDKYeVTBzurmP72wUpi56AZHwMF0GJJxBlnhPRVn+/+yA
1ivxytdXcDsCl7I4fnU5fgLBtlSAfxKLHpXiRGvUienru9cmtfaTWI4xAZdywRAu
ZHujRyp3UKa+4vLNsHfp3NTxowZPkXyvKQUkbl78EKyyT5q8fQdx8lnkkpoDdHlG
0BVa4uZLd5AREHoaRkBXyRjY1BFeurVis820lxAF6ZtX3xk91nc+ZAMGVKtPdjTr
kFZDDwiEdhWUut3CgCmxe2s656rOOA==
=ZtOi
-----END PGP SIGNATURE-----

--yNb1oOkm5a9FJOVX--
