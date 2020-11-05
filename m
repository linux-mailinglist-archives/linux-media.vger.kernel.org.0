Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AE162A824D
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 16:35:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731170AbgKEPfl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 10:35:41 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:55931 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730721AbgKEPfl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Nov 2020 10:35:41 -0500
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 7835B60009;
        Thu,  5 Nov 2020 15:35:35 +0000 (UTC)
Date:   Thu, 5 Nov 2020 16:35:34 +0100
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
Message-ID: <20201105153534.GD615923@aptenodytes>
References: <20201023175406.504527-1-paul.kocialkowski@bootlin.com>
 <20201023175406.504527-2-paul.kocialkowski@bootlin.com>
 <20201102232411.GD26150@paasikivi.fi.intel.com>
 <20201104102643.GH2123@aptenodytes>
 <20201105081954.GX26150@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="iVCmgExH7+hIHJ1A"
Content-Disposition: inline
In-Reply-To: <20201105081954.GX26150@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--iVCmgExH7+hIHJ1A
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

On Thu 05 Nov 20, 10:19, Sakari Ailus wrote:
> Hi Paul,
>=20
> On Wed, Nov 04, 2020 at 11:26:43AM +0100, Paul Kocialkowski wrote:
> > Hi Sakari and thanks for the review!
> >=20
> > On Tue 03 Nov 20, 01:24, Sakari Ailus wrote:
> > > On Fri, Oct 23, 2020 at 07:54:04PM +0200, Paul Kocialkowski wrote:
> > > > This introduces YAML bindings documentation for the OV8865
> > > > image sensor.
> > > >=20
> > > > Co-developed-by: K=C3=A9vin L'h=C3=B4pital <kevin.lhopital@bootlin.=
com>
> > > > Signed-off-by: K=C3=A9vin L'h=C3=B4pital <kevin.lhopital@bootlin.co=
m>
> > > > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > > ---
> > > >  .../bindings/media/i2c/ovti,ov8865.yaml       | 124 ++++++++++++++=
++++
> > > >  1 file changed, 124 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovt=
i,ov8865.yaml
> > > >=20
> > > > diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov886=
5.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
> > > > new file mode 100644
> > > > index 000000000000..807f1a94afae
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
> > > > @@ -0,0 +1,124 @@
> > > > +# SPDX-License-Identifier: GPL-2.0
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/media/i2c/ovti,ov8865.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: OmniVision OV8865 Image Sensor Device Tree Bindings
> > > > +
> > > > +maintainers:
> > > > +  - Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: ovti,ov8865
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  clocks:
> > > > +    items:
> > > > +      - description: EXTCLK Clock
> > > > +
> > > > +  clock-names:
> > > > +    items:
> > > > +      - const: extclk
> > >=20
> > > Is this needed with a single clock?
> >=20
> > Yes I think so: we grab the clock with devm_clk_get which takes a name =
string
> > that matches the clock-names property.
>=20
> That argument may be NULL.

Understood, let's get rid of clock-names then. I see this is done in a few
drivers already, but many also give it a name with a single clock.

It would be nice if that was consistent across all drivers just so that the
expectation is clear (that the best way for that to happen is probably to
fix up a patch myself though).

> > > And... shouldn't this also come with assigned-clock-rates etc., to se=
t the
> > > clock frequency?
> >=20
> > I'm a bit confused why we would need to do that in the device-tree rath=
er than
> > setting the clock rate with clk_set_rate in the driver, like any other =
driver
> > does. I think this was discussed before (on the initial ov8865 series) =
and the
> > conclusion was that there is no particular reason for media i2c drivers=
 to
> > behave differently. So I believe this is the correct approach.
>=20
> I'm not exactly sure about that conclusion.

I may have jumped too far here. It's not exactly clear to me what was the
conclusion from...
https://lore.kernel.org/linux-arm-kernel/20200401080705.j4goeqcqhoswhx4u@gi=
lmour.lan/

> You can use clk_set_rate() if you get the frequency from DT, but we
> recently did conclude that camera sensor drivers can expect to get the
> frequency indicated by assigned-clock-rate property.

=2E..but it looks like clock-frequency was preferred over assigned-clock-ra=
tes
and this is what the binding that was merged suggests. Is that correct?

I now understand that the clock frequency may depend on the system integrat=
ion
for this special case so we have to specify it via dt.

> In other words, the driver may not be specific to a particular board and
> SoC you have.

Although this is sadly more than often the case, because handling a variable
clock rate in the driver is quite complex (and even more with static init t=
ables
that include PLL configuration). And sadly my driver is no exception and
only supports 24 MHz input.

> Please also read Documentation/driver-api/media/camera-sensor.rst .

Thanks, I hadn't seen that document before. It's great that it exists!

Paul

> > > > +
> > > > +  dvdd-supply:
> > > > +    description: Digital Domain Power Supply
> > > > +
> > > > +  avdd-supply:
> > > > +    description: Analog Domain Power Supply (internal AVDD is used=
 if missing)
> > > > +
> > > > +  dovdd-supply:
> > > > +    description: I/O Domain Power Supply
> > > > +
> > > > +  powerdown-gpios:
> > > > +    maxItems: 1
> > > > +    description: Power Down Pin GPIO Control (active low)
> > > > +
> > > > +  reset-gpios:
> > > > +    maxItems: 1
> > > > +    description: Reset Pin GPIO Control (active low)
> > > > +
> > > > +  port:
> > > > +    type: object
> > > > +    description: Input port, connect to a MIPI CSI-2 receiver
> > > > +
> > > > +    properties:
> > > > +      endpoint:
> > > > +        type: object
> > > > +
> > > > +        properties:
> > > > +          remote-endpoint: true
> > > > +
> > > > +          bus-type:
> > > > +            const: 4
> > > > +
> > > > +          clock-lanes:
> > > > +            maxItems: 1
> > >=20
> > > I believe you can drop clock-lanes and bus-type; these are both const=
ants.
> >=20
> > I don't understand why bus-type should be dropped because it is constan=
t:
> > if bus-type is set to something else, the driver will definitely not pr=
obe
> > since we're requesting V4L2_MBUS_CSI2_DPHY for v4l2_fwnode_endpoint_par=
se.
> > So I think it's quite important for the bindings to reflect this.
>=20
> This driver is for a particular device that has MIPI CSI-2 on D-PHY as the
> data bus. You can assume that in the driver.
>=20
> >=20
> > > I presume the device does not support lane remapping?
> >=20
> > That's correct so this is indeed not something we can configure.
> > But shouldn't we instead specift clock-lanes =3D <0> as a const rather =
than
> > getting rid of it?
>=20
> Why would you put redundant information to DT?
>=20
> >=20
> > > Could you also add link-frequencies, to list which frequencies are kn=
own to
> > > be good?
> >=20
> > Ah right, I had missed it. I'm a bit unsure about what I should do with=
 the
> > information from the driver though: should I refuse to use link frequen=
cies that
> > are not in the list?
>=20
> Yes, please.
>=20
> --=20
> Regards,
>=20
> Sakari Ailus

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--iVCmgExH7+hIHJ1A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl+kG7sACgkQ3cLmz3+f
v9GMbQf9Fv6F0wyGdkd34PjIqr62ewt5wesJFn6uFDQ0396iTikAqzUbKQWZokYS
TX4DGx2ptA6Gm0X+OIpF36ni44BC+HGjVYt63l8IS+bTqYX8cDgo/d6U139hyE2d
8BE+V12NqTulgYWSk/i71/brT079EGDTsLSnYfoBdkFw31HQOIb5H3RwxIcKe+Dp
iXxcVKXIpGweRyEhOMJQ332ox6azv9+rB1q3jd2q4e8gDj/qAHMeuK6zoc6CqsPn
7oXXZG0bZW3TVlqbBm9pnAlDujNWdKdq07/+wfwiLvXtqxm8D/hu62t0ZZTOKxI2
sVlT5vIgU+qPdvViZ12VkgQeVeJTRQ==
=TUpl
-----END PGP SIGNATURE-----

--iVCmgExH7+hIHJ1A--
