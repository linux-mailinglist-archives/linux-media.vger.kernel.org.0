Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FC5B2A627A
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 11:48:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729591AbgKDKsg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 05:48:36 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:44623 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727923AbgKDKsg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 05:48:36 -0500
X-Greylist: delayed 895 seconds by postgrey-1.27 at vger.kernel.org; Wed, 04 Nov 2020 05:48:33 EST
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id BA2FB24000D;
        Wed,  4 Nov 2020 10:48:27 +0000 (UTC)
Date:   Wed, 4 Nov 2020 11:48:27 +0100
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
Subject: Re: [PATCH 07/14] dt-bindings: media: i2c: Add A31 MIPI CSI-2
 bindings documentation
Message-ID: <20201104104827.GD285779@aptenodytes>
References: <20201023174546.504028-1-paul.kocialkowski@bootlin.com>
 <20201023174546.504028-8-paul.kocialkowski@bootlin.com>
 <20201026161450.gr3dqpltxw2ccc3s@gilmour.lan>
 <20201027095221.GE168350@aptenodytes>
 <20201027184459.eberpkr52kay3du6@gilmour.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="JwB53PgKC5A7+0Ej"
Content-Disposition: inline
In-Reply-To: <20201027184459.eberpkr52kay3du6@gilmour.lan>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--JwB53PgKC5A7+0Ej
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue 27 Oct 20, 19:44, Maxime Ripard wrote:
> On Tue, Oct 27, 2020 at 10:52:21AM +0100, Paul Kocialkowski wrote:
> > Hi,
> >=20
> > On Mon 26 Oct 20, 17:14, Maxime Ripard wrote:
> > > i2c? :)
> >=20
> > Oops, good catch!
> > =20
> > > On Fri, Oct 23, 2020 at 07:45:39PM +0200, Paul Kocialkowski wrote:
> > > > This introduces YAML bindings documentation for the A31 MIPI CSI-2
> > > > controller.
> > > >=20
> > > > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > > ---
> > > >  .../media/allwinner,sun6i-a31-mipi-csi2.yaml  | 168 ++++++++++++++=
++++
> > > >  1 file changed, 168 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/media/allwinn=
er,sun6i-a31-mipi-csi2.yaml
> > > >=20
> > > > diff --git a/Documentation/devicetree/bindings/media/allwinner,sun6=
i-a31-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/allwinner,su=
n6i-a31-mipi-csi2.yaml
> > > > new file mode 100644
> > > > index 000000000000..9adc0bc27033
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-m=
ipi-csi2.yaml
> > > > @@ -0,0 +1,168 @@
> > > > +# SPDX-License-Identifier: GPL-2.0
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/media/allwinner,sun6i-a31-mipi-=
csi2.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Allwinner A31 MIPI CSI-2 Device Tree Bindings
> > > > +
> > > > +maintainers:
> > > > +  - Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    oneOf:
> > > > +      - const: allwinner,sun6i-a31-mipi-csi2
> > > > +      - items:
> > > > +          - const: allwinner,sun8i-v3s-mipi-csi2
> > > > +          - const: allwinner,sun6i-a31-mipi-csi2
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  interrupts:
> > > > +    maxItems: 1
> > > > +
> > > > +  clocks:
> > > > +    items:
> > > > +      - description: Bus Clock
> > > > +      - description: Module Clock
> > > > +
> > > > +  clock-names:
> > > > +    items:
> > > > +      - const: bus
> > > > +      - const: mod
> > > > +
> > > > +  phys:
> > > > +    items:
> > > > +      - description: MIPI D-PHY
> > > > +
> > > > +  phy-names:
> > > > +    items:
> > > > +      - const: dphy
> > > > +
> > > > +  resets:
> > > > +    maxItems: 1
> > > > +
> > > > +  # See ./video-interfaces.txt for details
> > > > +  ports:
> > > > +    type: object
> > > > +
> > > > +    properties:
> > > > +      port@0:
> > > > +        type: object
> > > > +        description: Input port, connect to a MIPI CSI-2 sensor
> > > > +
> > > > +        properties:
> > > > +          reg:
> > > > +            const: 0
> > > > +
> > > > +          endpoint:
> > > > +            type: object
> > > > +
> > > > +            properties:
> > > > +              remote-endpoint: true
> > > > +
> > > > +              bus-type:
> > > > +                const: 4
> > > > +
> > > > +              clock-lanes:
> > > > +                maxItems: 1
> > > > +
> > > > +              data-lanes:
> > > > +                minItems: 1
> > > > +                maxItems: 4
> > > > +
> > > > +            required:
> > > > +              - bus-type
> > > > +              - data-lanes
> > > > +              - remote-endpoint
> > > > +
> > > > +            additionalProperties: false
> > > > +
> > > > +        required:
> > > > +          - endpoint
> > > > +
> > > > +        additionalProperties: false
> > > > +
> > > > +      port@1:
> > > > +        type: object
> > > > +        description: Output port, connect to a CSI controller
> > > > +
> > > > +        properties:
> > > > +          reg:
> > > > +            const: 1
> > > > +
> > > > +          endpoint:
> > > > +            type: object
> > > > +
> > > > +            properties:
> > > > +              remote-endpoint: true
> > > > +
> > > > +              bus-type:
> > > > +                const: 4
> > >=20
> > > That one seems a bit weird. If the input and output ports are using t=
he
> > > same format, what is that "bridge" supposed to be doing?
> >=20
> > Fair enough. What this represents is the internal link (likely a FIFO) =
between
> > the two controllers. It is definitely not a MIPI CSI-2 bus but there's =
no
> > mbus type for an internal link (probably because it's not a bus after a=
ll).
> >=20
> > Note that on the CSI controller side, we need the bus-type to be set to=
 4 for it
> > to properly select the MIPI CSI-2 input. So it just felt more logical t=
o have
> > the same on the other side of the endpoint. On the other hand, we can j=
ust
> > remove it on the MIPI CSI-2 controller side since it won't check it and=
 have it
> > fallback to the unknown mbus type.
> >=20
> > But that would make the types inconsistent on the two sides of the link.
> > I don't think V4L2 will complain about it at the moment, but it would a=
lso make
> > sense that it does eventually.
> >=20
> > What do you think?
>=20
> There's still the same issue though, it doesn't make any sense that a
> bridge doesn't change the bus type. If it really did, we wouldn't need
> that in the first place.

Yes I agreee.

> What you want to check in your driver is whether the subdev you're
> connected to has a sink pad that uses MIPI-CSI

I'm not really sure that's possible, but if it is it would indeed be the mo=
st
appropriate solution. If it's not, we still need to know that we need to fe=
ed
=66rom MIPI CSI-2 so I don't see any other option than report MIPI CSI-2 on=
 both
ends of MIPI CSI-2 controller.

But there's still the question of what media bus type should be reported for
the CSI <-> MIPI CSI-2 link. I'm fine with unknown but we could also add a
generic internal bus type for this case.

Paul

> Maxime
>=20
> > > > +            additionalProperties: false
> > > > +
> > > > +        required:
> > > > +          - endpoint
> > > > +
> > > > +        additionalProperties: false
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - reg
> > > > +  - interrupts
> > > > +  - clocks
> > > > +  - clock-names
> > > > +  - resets
> > > > +
> > > > +additionalProperties: false
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > > +    #include <dt-bindings/clock/sun8i-v3s-ccu.h>
> > > > +    #include <dt-bindings/reset/sun8i-v3s-ccu.h>
> > > > +
> > > > +    mipi_csi2: mipi-csi2@1cb1000 {
> > >=20
> > > The unit name should be pretty standard, with the list here:
> > >=20
> > > https://github.com/devicetree-org/devicetree-specification/blob/maste=
r/source/chapter2-devicetree-basics.rst#generic-names-recommendation
> > >=20
> > > there's nothing really standing out for us in that list, but given th=
at
> > > there's dsi, we should stick with csi
> >=20
> > Then what really surprises me is that the CSI controllers are called "c=
amera",
> > not "csi". If "camera" is supposed to cover both image sensor and camer=
a sensor
> > interfaces, it would probably fit MIPI CSI-2 as well.
> >=20
> > I see lots of names with -controller for controllers with specific devi=
ces
> > attached, like "nand-controller" or "lcd-controller". Maybe using
> > "camera-controller" for the CSI and MIPI CSI-2 controllers would make t=
he most
> > sense, while keeping "camera" for the actual image sensors.
> >=20
> > What do you think?
>=20
> If you really want to discuss this, feel free to open a PR for the DT
> spec and add it. However, I still think this csi would be best here:
> it's neither a camera nor a camera controller
>=20
> maxime



--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--JwB53PgKC5A7+0Ej
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl+ihvsACgkQ3cLmz3+f
v9Fongf/XSL+crE1GI4SFbtd8uVX2nhvXCN78RRSKI1fFD3SRaWIIuHRUshscxMo
dEoZ1GzYSbaZSQMJQRXRnJIWQ4AgLMqlnM33gA6me8FSi8YJ4PuKWHP44luENEHT
rJLDGv3PV72DypUm+hsi/lHdPMmRsmw0MZhT3AixhO6WPevpIswAxyCXasZsKCtc
o94Fs6UflwcYjfdy+nho8rTRYoz/A6YIUSvaTUJ2TpxJGa/+kNaqXO6D6SC65k4N
1eTRyoE42qXVN2TP0DJrURO5Cs1yNrBvzbFJ55+FV2GJR1fzoZIdRu4tNeigXT5q
UyZgCYQBFJCgNSy2qaScfOBdfTnCNQ==
=flAo
-----END PGP SIGNATURE-----

--JwB53PgKC5A7+0Ej--
