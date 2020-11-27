Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CF142C67F1
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 15:32:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730889AbgK0OaJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Nov 2020 09:30:09 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:42731 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730573AbgK0OaJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Nov 2020 09:30:09 -0500
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 9FA5D100008;
        Fri, 27 Nov 2020 14:30:01 +0000 (UTC)
Date:   Fri, 27 Nov 2020 15:30:00 +0100
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        =?utf-8?B?S8OpdmluIEwnaMO0cGl0YWw=?= <kevin.lhopital@bootlin.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: media: i2c: Add OV8865 bindings
 documentation
Message-ID: <X8ENaKmZ8faK2Y/H@aptenodytes>
References: <20201113170344.2252234-1-paul.kocialkowski@bootlin.com>
 <20201113170344.2252234-2-paul.kocialkowski@bootlin.com>
 <20201127135220.GR3940@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ggGsnbaJWrW+VcAz"
Content-Disposition: inline
In-Reply-To: <20201127135220.GR3940@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--ggGsnbaJWrW+VcAz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

On Fri 27 Nov 20, 15:52, Sakari Ailus wrote:
> Hi Paul,
>=20
> On Fri, Nov 13, 2020 at 06:03:42PM +0100, Paul Kocialkowski wrote:
> > This introduces YAML bindings documentation for the OV8865
> > image sensor.
> >=20
> > Co-developed-by: K=C3=A9vin L'h=C3=B4pital <kevin.lhopital@bootlin.com>
> > Signed-off-by: K=C3=A9vin L'h=C3=B4pital <kevin.lhopital@bootlin.com>
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > ---
> >  .../bindings/media/i2c/ovti,ov8865.yaml       | 120 ++++++++++++++++++
> >  1 file changed, 120 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov=
8865.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.ya=
ml b/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
> > new file mode 100644
> > index 000000000000..47af90d6ebea
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
> > @@ -0,0 +1,120 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/ovti,ov8865.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: OmniVision OV8865 Image Sensor Device Tree Bindings
> > +
> > +maintainers:
> > +  - Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: ovti,ov8865
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: EXTCLK Clock
> > +
> > +  assigned-clocks:
> > +    maxItems: 1
> > +
> > +  assigned-clock-rates:
> > +    maxItems: 1
> > +
> > +  dvdd-supply:
> > +    description: Digital Domain Power Supply
> > +
> > +  avdd-supply:
> > +    description: Analog Domain Power Supply (internal AVDD is used if =
missing)
> > +
> > +  dovdd-supply:
> > +    description: I/O Domain Power Supply
> > +
> > +  powerdown-gpios:
> > +    maxItems: 1
> > +    description: Power Down Pin GPIO Control (active low)
> > +
> > +  reset-gpios:
> > +    maxItems: 1
> > +    description: Reset Pin GPIO Control (active low)
> > +
> > +  port:
> > +    type: object
> > +    description: MIPI CSI-2 transmitter port
> > +
> > +    properties:
> > +      endpoint:
> > +        type: object
> > +
> > +        properties:
> > +          remote-endpoint: true
> > +
> > +          data-lanes:
> > +            minItems: 1
> > +            maxItems: 4
> > +
> > +        required:
> > +          - bus-type
> > +          - data-lanes
> > +          - remote-endpoint
>=20
> link-frequencies seems to be still missing here (same with the example).

Oh my bad, you're right.

Note that I found an issue in this series (as well as the ov5648 one)
so I will be reposting them anyways (likely later today).

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--ggGsnbaJWrW+VcAz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl/BDWgACgkQ3cLmz3+f
v9GNwggAloOeOCLvs38Da0chIMZxaWvY/JRgwKn06YIOIwSUx6jQ54qeuWZIGexe
u8AZQjGVxKg7sj77j0FMSUGLyZ9IoLWxlh/ONLnKND9cZPwZRW6FhYDfhb8DtkZc
Y56P/rR91z0TaLaEczGdJqWrgVplzo/PgA4u6fME0jCRu8Uwv0LCe3CDY6epGmUb
vzyQI/52XhPCIVK18cWJYlkXHxvvSRPZIwQmFgbmffw+TE/IkuufgVRl7wMWNdJc
rxW6RyUdWASoqOsE1PTkmRzmEjZv6t0HIx8XbcPdMMzMkvoRqOK+Q2F3zPw2RuDV
+nNBP5+06Etz8w1vXX4K6cbT7vrDeA==
=zm+Z
-----END PGP SIGNATURE-----

--ggGsnbaJWrW+VcAz--
