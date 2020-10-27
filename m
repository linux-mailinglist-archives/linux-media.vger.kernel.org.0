Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 568E429A86C
	for <lists+linux-media@lfdr.de>; Tue, 27 Oct 2020 10:54:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896229AbgJ0Jwc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Oct 2020 05:52:32 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:51921 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2409569AbgJ0Jwb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Oct 2020 05:52:31 -0400
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 34CAC20010;
        Tue, 27 Oct 2020 09:52:22 +0000 (UTC)
Date:   Tue, 27 Oct 2020 10:52:21 +0100
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
Message-ID: <20201027095221.GE168350@aptenodytes>
References: <20201023174546.504028-1-paul.kocialkowski@bootlin.com>
 <20201023174546.504028-8-paul.kocialkowski@bootlin.com>
 <20201026161450.gr3dqpltxw2ccc3s@gilmour.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ILuaRSyQpoVaJ1HG"
Content-Disposition: inline
In-Reply-To: <20201026161450.gr3dqpltxw2ccc3s@gilmour.lan>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--ILuaRSyQpoVaJ1HG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon 26 Oct 20, 17:14, Maxime Ripard wrote:
> i2c? :)

Oops, good catch!
=20
> On Fri, Oct 23, 2020 at 07:45:39PM +0200, Paul Kocialkowski wrote:
> > This introduces YAML bindings documentation for the A31 MIPI CSI-2
> > controller.
> >=20
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > ---
> >  .../media/allwinner,sun6i-a31-mipi-csi2.yaml  | 168 ++++++++++++++++++
> >  1 file changed, 168 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/allwinner,s=
un6i-a31-mipi-csi2.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/media/allwinner,sun6i-a3=
1-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/allwinner,sun6i-=
a31-mipi-csi2.yaml
> > new file mode 100644
> > index 000000000000..9adc0bc27033
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-mipi-=
csi2.yaml
> > @@ -0,0 +1,168 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/allwinner,sun6i-a31-mipi-csi2=
=2Eyaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Allwinner A31 MIPI CSI-2 Device Tree Bindings
> > +
> > +maintainers:
> > +  - Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - const: allwinner,sun6i-a31-mipi-csi2
> > +      - items:
> > +          - const: allwinner,sun8i-v3s-mipi-csi2
> > +          - const: allwinner,sun6i-a31-mipi-csi2
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
> > +
> > +  clock-names:
> > +    items:
> > +      - const: bus
> > +      - const: mod
> > +
> > +  phys:
> > +    items:
> > +      - description: MIPI D-PHY
> > +
> > +  phy-names:
> > +    items:
> > +      - const: dphy
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  # See ./video-interfaces.txt for details
> > +  ports:
> > +    type: object
> > +
> > +    properties:
> > +      port@0:
> > +        type: object
> > +        description: Input port, connect to a MIPI CSI-2 sensor
> > +
> > +        properties:
> > +          reg:
> > +            const: 0
> > +
> > +          endpoint:
> > +            type: object
> > +
> > +            properties:
> > +              remote-endpoint: true
> > +
> > +              bus-type:
> > +                const: 4
> > +
> > +              clock-lanes:
> > +                maxItems: 1
> > +
> > +              data-lanes:
> > +                minItems: 1
> > +                maxItems: 4
> > +
> > +            required:
> > +              - bus-type
> > +              - data-lanes
> > +              - remote-endpoint
> > +
> > +            additionalProperties: false
> > +
> > +        required:
> > +          - endpoint
> > +
> > +        additionalProperties: false
> > +
> > +      port@1:
> > +        type: object
> > +        description: Output port, connect to a CSI controller
> > +
> > +        properties:
> > +          reg:
> > +            const: 1
> > +
> > +          endpoint:
> > +            type: object
> > +
> > +            properties:
> > +              remote-endpoint: true
> > +
> > +              bus-type:
> > +                const: 4
>=20
> That one seems a bit weird. If the input and output ports are using the
> same format, what is that "bridge" supposed to be doing?

Fair enough. What this represents is the internal link (likely a FIFO) betw=
een
the two controllers. It is definitely not a MIPI CSI-2 bus but there's no
mbus type for an internal link (probably because it's not a bus after all).

Note that on the CSI controller side, we need the bus-type to be set to 4 f=
or it
to properly select the MIPI CSI-2 input. So it just felt more logical to ha=
ve
the same on the other side of the endpoint. On the other hand, we can just
remove it on the MIPI CSI-2 controller side since it won't check it and hav=
e it
fallback to the unknown mbus type.

But that would make the types inconsistent on the two sides of the link.
I don't think V4L2 will complain about it at the moment, but it would also =
make
sense that it does eventually.

What do you think?

> > +            additionalProperties: false
> > +
> > +        required:
> > +          - endpoint
> > +
> > +        additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +  - resets
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/clock/sun8i-v3s-ccu.h>
> > +    #include <dt-bindings/reset/sun8i-v3s-ccu.h>
> > +
> > +    mipi_csi2: mipi-csi2@1cb1000 {
>=20
> The unit name should be pretty standard, with the list here:
>=20
> https://github.com/devicetree-org/devicetree-specification/blob/master/so=
urce/chapter2-devicetree-basics.rst#generic-names-recommendation
>=20
> there's nothing really standing out for us in that list, but given that
> there's dsi, we should stick with csi

Then what really surprises me is that the CSI controllers are called "camer=
a",
not "csi". If "camera" is supposed to cover both image sensor and camera se=
nsor
interfaces, it would probably fit MIPI CSI-2 as well.

I see lots of names with -controller for controllers with specific devices
attached, like "nand-controller" or "lcd-controller". Maybe using
"camera-controller" for the CSI and MIPI CSI-2 controllers would make the m=
ost
sense, while keeping "camera" for the actual image sensors.

What do you think?

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--ILuaRSyQpoVaJ1HG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl+X7dUACgkQ3cLmz3+f
v9HIzgf/VU3frpGzprIvTeXBh32se5uXZB/3cj0cUb++7oXeTXSc/db0LOwDu7jo
/UyfvdYNUhuUMMOPT/ltm0ObonZzOv4GkAl0rjQYccWmwqAhi9/m/ac++ub7WjUk
yv159tAbN+dorR6X2Q548Y8JKAYXBM/of0RVIs0ms/J8rnBkozXBv89gxTiIxrnH
3swwmgsFAYEklUApRcIUcgSdsbxyRu10JTQ7vlmimb5/4Z3mEmOXGe7SkxKREFym
fGumuTIXAWceJ0NLAXkUw3XxHku1Xczzmj78crBFvE0L8fUDKAoMFOG96oQqbI5t
GlF0jyE3FZO/rbmGafQtSqE/B9JOFw==
=CWwJ
-----END PGP SIGNATURE-----

--ILuaRSyQpoVaJ1HG--
