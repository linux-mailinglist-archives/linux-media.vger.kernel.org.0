Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1590640A863
	for <lists+linux-media@lfdr.de>; Tue, 14 Sep 2021 09:45:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236994AbhINHqf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Sep 2021 03:46:35 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:45971 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237252AbhINHpo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Sep 2021 03:45:44 -0400
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id AC9E4100011;
        Tue, 14 Sep 2021 07:44:22 +0000 (UTC)
Date:   Tue, 14 Sep 2021 09:44:22 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-staging@lists.linux.dev,
        Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Helen Koike <helen.koike@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 17/22] dt-bindings: media: Add Allwinner A31 ISP bindings
 documentation
Message-ID: <YUBS1sdHKUMZx6gx@aptenodytes>
References: <20210910184147.336618-1-paul.kocialkowski@bootlin.com>
 <20210910184147.336618-18-paul.kocialkowski@bootlin.com>
 <20210913081808.esgqvz4eeatp4hkp@gilmour>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="x/ZjxzLvCjsZxqAS"
Content-Disposition: inline
In-Reply-To: <20210913081808.esgqvz4eeatp4hkp@gilmour>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--x/ZjxzLvCjsZxqAS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon 13 Sep 21, 10:18, Maxime Ripard wrote:
> On Fri, Sep 10, 2021 at 08:41:42PM +0200, Paul Kocialkowski wrote:
> > This introduces YAML bindings documentation for the Allwinner A31 Image
> > Signal Processor (ISP).
> >=20
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > ---
> >  .../media/allwinner,sun6i-a31-csi.yaml        |   2 +-
> >  .../media/allwinner,sun6i-a31-isp.yaml        | 111 ++++++++++++++++++
> >  2 files changed, 112 insertions(+), 1 deletion(-)
> >  create mode 100644 Documentation/devicetree/bindings/media/allwinner,s=
un6i-a31-isp.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/media/allwinner,sun6i-a3=
1-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-cs=
i.yaml
> > index f4a686b77a38..c60f6b5403fa 100644
> > --- a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.y=
aml
> > +++ b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.y=
aml
> > @@ -1,4 +1,4 @@
> > -# SPDX-License-Identifier: GPL-2.0
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >  %YAML 1.2
> >  ---
> >  $id: http://devicetree.org/schemas/media/allwinner,sun6i-a31-csi.yaml#
> > diff --git a/Documentation/devicetree/bindings/media/allwinner,sun6i-a3=
1-isp.yaml b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-is=
p.yaml
> > new file mode 100644
> > index 000000000000..a0f82f150e90
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-isp.y=
aml
> > @@ -0,0 +1,111 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/allwinner,sun6i-a31-isp.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Allwinner A31 Image Signal Processor Driver (ISP) Device Tree B=
indings
> > +
> > +maintainers:
> > +  - Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - allwinner,sun6i-a31-isp
> > +      - allwinner,sun8i-v3s-isp
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
> > +      - description: DRAM Clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: bus
> > +      - const: mod
> > +      - const: ram
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        description: CSI0 input port
> > +
> > +        properties:
> > +          reg:
> > +            const: 0
> > +
> > +          endpoint:
> > +            $ref: video-interfaces.yaml#
> > +            unevaluatedProperties: false
> > +
> > +        additionalProperties: false
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        description: CSI1 input port
> > +
> > +        properties:
> > +          reg:
> > +            const: 0
> > +
> > +          endpoint:
> > +            $ref: video-interfaces.yaml#
> > +            unevaluatedProperties: false
> > +
> > +        additionalProperties: false
>=20
> port@0 and port@1 required?

I'd say just one of them, does that make sense?

> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +  - resets
>=20
> ports required?

I think so yes, so I'll add it there.

Paul


--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--x/ZjxzLvCjsZxqAS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmFAUtYACgkQ3cLmz3+f
v9EiZQgAncwC5/lF0lGIbrTPuu+Q9LnR4LGlxrt2xaOkbmtxVfCuQexU1wx2+C0m
X+H+fuo3Eq8DN3lFIeAmXG03mYFoVJj8kPybnE6K9e48LQJ70/ahwK7MueZQVuzO
PDGmIDVxWJtGSbbPUTedQnlYgE+eVzqfbedRrdeYFGRdrUSS9pbO4kW/4lm0xkZW
UMGcam8bE8v4iyc77LBdvX1cNtexR/PD4L7aiCD0zPkG35iHwzZcEPuXmhuyg/27
ksjDM1DurT9+zJMQTOv09ii1qJr3jaN1t6l7THV3hOYupapueCU1G/ILqb2Wd4mK
CSZ2qYlFM6vc5HrIf0v671i9ViGatQ==
=gBHG
-----END PGP SIGNATURE-----

--x/ZjxzLvCjsZxqAS--
