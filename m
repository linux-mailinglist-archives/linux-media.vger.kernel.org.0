Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 575D92A6190
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 11:28:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728969AbgKDK2K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 05:28:10 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:39619 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729097AbgKDK0s (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 05:26:48 -0500
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 3C79840011;
        Wed,  4 Nov 2020 10:26:43 +0000 (UTC)
Date:   Wed, 4 Nov 2020 11:26:43 +0100
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
        Maxime Ripard <mripard@kernel.org>, kevin.lhopital@hotmail.com,
        =?utf-8?B?S8OpdmluIEwnaMO0cGl0YWw=?= <kevin.lhopital@bootlin.com>
Subject: Re: [PATCH 1/3] dt-bindings: media: i2c: Add OV8865 bindings
 documentation
Message-ID: <20201104102643.GH2123@aptenodytes>
References: <20201023175406.504527-1-paul.kocialkowski@bootlin.com>
 <20201023175406.504527-2-paul.kocialkowski@bootlin.com>
 <20201102232411.GD26150@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="JI+G0+mN8WmwPnOn"
Content-Disposition: inline
In-Reply-To: <20201102232411.GD26150@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--JI+G0+mN8WmwPnOn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sakari and thanks for the review!

On Tue 03 Nov 20, 01:24, Sakari Ailus wrote:
> On Fri, Oct 23, 2020 at 07:54:04PM +0200, Paul Kocialkowski wrote:
> > This introduces YAML bindings documentation for the OV8865
> > image sensor.
> >=20
> > Co-developed-by: K=C3=A9vin L'h=C3=B4pital <kevin.lhopital@bootlin.com>
> > Signed-off-by: K=C3=A9vin L'h=C3=B4pital <kevin.lhopital@bootlin.com>
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > ---
> >  .../bindings/media/i2c/ovti,ov8865.yaml       | 124 ++++++++++++++++++
> >  1 file changed, 124 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov=
8865.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.ya=
ml b/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
> > new file mode 100644
> > index 000000000000..807f1a94afae
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
> > @@ -0,0 +1,124 @@
> > +# SPDX-License-Identifier: GPL-2.0
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
> > +  clock-names:
> > +    items:
> > +      - const: extclk
>=20
> Is this needed with a single clock?

Yes I think so: we grab the clock with devm_clk_get which takes a name stri=
ng
that matches the clock-names property.

> And... shouldn't this also come with assigned-clock-rates etc., to set the
> clock frequency?

I'm a bit confused why we would need to do that in the device-tree rather t=
han
setting the clock rate with clk_set_rate in the driver, like any other driv=
er
does. I think this was discussed before (on the initial ov8865 series) and =
the
conclusion was that there is no particular reason for media i2c drivers to
behave differently. So I believe this is the correct approach.

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
> I believe you can drop clock-lanes and bus-type; these are both constants.

I don't understand why bus-type should be dropped because it is constant:
if bus-type is set to something else, the driver will definitely not probe
since we're requesting V4L2_MBUS_CSI2_DPHY for v4l2_fwnode_endpoint_parse.
So I think it's quite important for the bindings to reflect this.

> I presume the device does not support lane remapping?

That's correct so this is indeed not something we can configure.
But shouldn't we instead specift clock-lanes =3D <0> as a const rather than
getting rid of it?

> Could you also add link-frequencies, to list which frequencies are known =
to
> be good?

Ah right, I had missed it. I'm a bit unsure about what I should do with the
information from the driver though: should I refuse to use link frequencies=
 that
are not in the list?

Cheers,

Paul

> Same comments on the other OV sensor bindings.
>=20
> > +
> > +          data-lanes:
> > +            minItems: 1
> > +            maxItems: 4
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
> > +    #include <dt-bindings/clock/sun8i-a83t-ccu.h>
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    i2c2 {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        ov8865: camera@36 {
> > +            compatible =3D "ovti,ov8865";
> > +            reg =3D <0x36>;
> > +
> > +            pinctrl-names =3D "default";
> > +            pinctrl-0 =3D <&csi_mclk_pin>;
> > +
> > +            clocks =3D <&ccu CLK_CSI_MCLK>;
> > +            clock-names =3D "extclk";
> > +
> > +            avdd-supply =3D <&reg_ov8865_avdd>;
> > +            dovdd-supply =3D <&reg_ov8865_dovdd>;
> > +            dvdd-supply =3D <&reg_ov8865_dvdd>;
> > +
> > +            powerdown-gpios =3D <&pio 4 17 GPIO_ACTIVE_LOW>; /* PE17 */
> > +            reset-gpios =3D <&pio 4 16 GPIO_ACTIVE_LOW>; /* PE16 */
> > +
> > +            port {
> > +                ov8865_out_mipi_csi2: endpoint {
> > +                    bus-type =3D <4>; /* MIPI CSI-2 D-PHY */
> > +                    clock-lanes =3D <0>;
> > +                    data-lanes =3D <1 2 3 4>;
> > +
> > +                    remote-endpoint =3D <&mipi_csi2_in_ov8865>;
> > +                };
> > +            };
> > +        };
> > +    };
> > +
> > +...
>=20
> --=20
> Regards,
>=20
> Sakari Ailus

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--JI+G0+mN8WmwPnOn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl+igeMACgkQ3cLmz3+f
v9GD4gf/d6zDky1Bc2fNJdjcVgUx18tpFH1w8Ph3txVlRC1B2ct42ap/t54nNnig
9LmLH689DbU5cpyvmzec/+j/nwdpOybyKKlAWwGeUpl8EU84juQ7G0MSTzBoSVu4
JUMFQVbo5VBSNWFZzBfBxUMd1/JOxNC9F5fvboVQXRWMQjz+KZbixWItXXw3lwwd
OVG9usEHThAp1dLU7kPm3lMRqIdfFFor4uR+Ua37nV1oEeuORaimr+d5JI50HCG4
Do7Q3yWO97DcYdbD9PH+U9ibo9QdDPFCzcKe2g/0U0IoQaXOsfd2Ypz/OBrQPs2o
xOMSjWxF0sbjVR1edHd/IfKg238n6Q==
=lx7E
-----END PGP SIGNATURE-----

--JI+G0+mN8WmwPnOn--
