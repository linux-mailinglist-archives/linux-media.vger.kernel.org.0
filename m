Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84FFC2A619C
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 11:30:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729279AbgKDKaK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 05:30:10 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:51877 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728607AbgKDK33 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 05:29:29 -0500
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id E660A60003;
        Wed,  4 Nov 2020 10:29:23 +0000 (UTC)
Date:   Wed, 4 Nov 2020 11:29:23 +0100
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: media: i2c: Add OV5648 bindings
 documentation
Message-ID: <20201104102923.GA285779@aptenodytes>
References: <20201023174944.504358-1-paul.kocialkowski@bootlin.com>
 <20201023174944.504358-2-paul.kocialkowski@bootlin.com>
 <20201030163722.GS26150@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="8t9RHnE3ZwKMSgU+"
Content-Disposition: inline
In-Reply-To: <20201030163722.GS26150@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

On Fri 30 Oct 20, 18:37, Sakari Ailus wrote:
> On Fri, Oct 23, 2020 at 07:49:43PM +0200, Paul Kocialkowski wrote:
> > This introduces YAML bindings documentation for the OV5648
> > image sensor.
> >=20
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > ---
> >  .../bindings/media/i2c/ovti,ov5648.yaml       | 115 ++++++++++++++++++
> >  1 file changed, 115 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov=
5648.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.ya=
ml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
> > new file mode 100644
> > index 000000000000..347af925b450
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
> > @@ -0,0 +1,115 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/ovti,ov5648.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: OmniVision OV5648 Image Sensor Device Tree Bindings
> > +
> > +maintainers:
> > +  - Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: ovti,ov5648
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: XVCLK Clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: xvclk
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
> > +    description: Input port, connect to a MIPI CSI-2 receiver
>=20
> "Input"? I'd describe this as output.
>=20
> How about e.g. "MIPI CSI-2 transmitter port"?

Woops, that's definitely a mistake. Your suggestion sounds good, thanks!

> > +
> > +    properties:
> > +      endpoint:
> > +        type: object
> > +
> > +        properties:
> > +          remote-endpoint: true
> > +
> > +          bus-type:
> > +            const: 4
> > +
> > +          clock-lanes:
> > +            maxItems: 1
>=20
> You can drop the two as they're always the same.

See my reply to the same comment on the other series.

Cheers,

Paul

> > +
> > +          data-lanes:
> > +            minItems: 1
> > +            maxItems: 2
> > +
> > +        required:
> > +          - bus-type
> > +          - data-lanes
> > +          - remote-endpoint
> > +
> > +        additionalProperties: false
> > +
> > +    required:
> > +      - endpoint
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - dvdd-supply
> > +  - dovdd-supply
> > +  - port
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/sun8i-v3s-ccu.h>
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    i2c0 {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        ov5648: camera@36 {
> > +            compatible =3D "ovti,ov5648";
> > +            reg =3D <0x36>;
> > +
> > +            dvdd-supply =3D <&ov5648_dvdd>;
> > +            avdd-supply =3D <&ov5648_avdd>;
> > +            dovdd-supply =3D <&ov5648_dovdd>;
> > +            clocks =3D <&ov5648_xvclk 0>;
> > +            clock-names =3D "xvclk";
> > +
> > +            ov5648_out: port {
> > +                ov5648_out_mipi_csi2: endpoint {
> > +                    bus-type =3D <4>; /* MIPI CSI-2 D-PHY */
> > +                    clock-lanes =3D <0>;
> > +                    data-lanes =3D <1 2>;
> > +
> > +                    remote-endpoint =3D <&mipi_csi2_in_ov5648>;
> > +                };
> > +            };
> > +        };
> > +    };
>=20
> --=20
> Sakari Ailus

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--8t9RHnE3ZwKMSgU+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl+igoMACgkQ3cLmz3+f
v9Gi7Af+M3VHc6S+z8frqFhUa3rAyAf4FcwHUgEP3+/auAqIqarIHO+yVkdPhFY2
Qh4ULYUJWWLChBU7HPXMDPoimuYoTaOr8H0Ijy8vImb1spA+Ey7laIfmbiMn4M6N
4cOnF6t4JZNu4slFM4A4Rel7QVw7oQT3icHRdFHmGJtPRr1eOWryOsa6R/gV8Cvj
XkU4tuqBk+oQePoyqMx8acT8x0Cmel8FTT+djw1S+W/IhDb+ZrArBOfQzvaYuik6
yFGN6KSrbEk7QofF+HsZ5yjNpo8IF7ZtUy7nCUy3RxVK4yIchoogfb+mpENKdqeR
w/WEJgDHX/e25MgL6A7auNTRfFuSMw==
=SC2z
-----END PGP SIGNATURE-----

--8t9RHnE3ZwKMSgU+--
