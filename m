Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AB3C29C7AC
	for <lists+linux-media@lfdr.de>; Tue, 27 Oct 2020 19:46:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1829024AbgJ0SqG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Oct 2020 14:46:06 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:58589 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1811781AbgJ0SpF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Oct 2020 14:45:05 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 60BF658036F;
        Tue, 27 Oct 2020 14:45:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 27 Oct 2020 14:45:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=t7z/cLM+PBO9W3R+rmq7Cyf2T6S
        x/gXYEwNRq31AYOM=; b=s+oKm/i2NjpN5p1l+kCVUx0k4Ew7dZ8OafPZ4V5GD30
        5hxqZxriU2wwySZLzp6ASFwucf4LMGhLhw2DXQ+tvZynpmflKuhMTxw6YRPU8lkM
        qdzUcmNtMz9OOpuVZrJgOImYQBpdMnsFySm82HBsMGTxV1nWdI+wrEt5EeCKnkV2
        h1y5IbF2m+++tDv3gf27stG0rwIWVHZj6DBWWjgixHx/UEthVDK3WmSU+bM3pV8Z
        8W0R5EiMg+5pcNcmHW3DNdIC0tLsFyH42bGvLrrCBVPwD+3R37gTv5LVHKMLAgxn
        bPQFiiEukSdaMKBblr7gNtionwyVKCMS+oZUSvDMnCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=t7z/cL
        M+PBO9W3R+rmq7Cyf2T6Sx/gXYEwNRq31AYOM=; b=aFjqFQZjQO7mDsK9weGcf5
        OVKzrBUIVDBgU2poA4SIMVu5mQaMKNhHr5Scu+tJPUP+dSb3oQzlZU0XL1dBe2zp
        2lTRt/JdW6q4CGdn26r/Ouqn6hMGxSr4UUzmr+/gPvQLcPVDR8mYREpuzt5kOpit
        nbfvBSiVKJ7ZhK8kq8ycKzdKyPK8t0k4CBuYxUiB+dhLQnTYW4oU/El5cAYXyrDH
        NfHhayO70/DUUjqZbpW3QJn5ExzDWU2eJWHgeB+WWRbrV6cqxcCJ+lSUjaA0Zdpj
        LqVfKcgBLU1d2yoRb5oGqBewYbMesiuP+7Mm01FfelLd50b9P0ugR0RcNiDTfAvA
        ==
X-ME-Sender: <xms:rWqYXybSzrNbjGFoyBZwWZViaZK434vaHRQRPKGKS5DEbCnVddxmIw>
    <xme:rWqYX1a621aJnPN8Cdh822qv_8SGcyXZ00lGeDyFj_QqUr-ZZ0KhhO_EHLOjHUa6H
    fIRpi0nPB-WT2OXyKE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrkeelgdduudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepteduffeihfehvdfgueefjeevvdevffffieekuddvjeeugfeiffegtddutdef
    kedtnecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghdpghhithhhuhgsrdgtoh
    hmnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:rWqYX8_yn7fdVpJq4hmee7sfkOIvAl3sCiuPzKeRgkTuoPzUEmqISA>
    <xmx:rWqYX0rI94DUNLwm-lZWiEF6iyVkzWQEc0Azj8CRtxr1um5BM36Pmw>
    <xmx:rWqYX9qH7pOj-l5zJjtidtEAsrhjB48NACiejVnwkOB9EYM7qmCh_w>
    <xmx:r2qYXyij2FajEFirNdUx8WJYRfMx1e5GCPjC6ZLu4GqdIrhCmVab1Q>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 0373A3280064;
        Tue, 27 Oct 2020 14:45:00 -0400 (EDT)
Date:   Tue, 27 Oct 2020 19:44:59 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
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
Message-ID: <20201027184459.eberpkr52kay3du6@gilmour.lan>
References: <20201023174546.504028-1-paul.kocialkowski@bootlin.com>
 <20201023174546.504028-8-paul.kocialkowski@bootlin.com>
 <20201026161450.gr3dqpltxw2ccc3s@gilmour.lan>
 <20201027095221.GE168350@aptenodytes>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cfopkkgnocgfckzp"
Content-Disposition: inline
In-Reply-To: <20201027095221.GE168350@aptenodytes>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--cfopkkgnocgfckzp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2020 at 10:52:21AM +0100, Paul Kocialkowski wrote:
> Hi,
>=20
> On Mon 26 Oct 20, 17:14, Maxime Ripard wrote:
> > i2c? :)
>=20
> Oops, good catch!
> =20
> > On Fri, Oct 23, 2020 at 07:45:39PM +0200, Paul Kocialkowski wrote:
> > > This introduces YAML bindings documentation for the A31 MIPI CSI-2
> > > controller.
> > >=20
> > > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > ---
> > >  .../media/allwinner,sun6i-a31-mipi-csi2.yaml  | 168 ++++++++++++++++=
++
> > >  1 file changed, 168 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/media/allwinner=
,sun6i-a31-mipi-csi2.yaml
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/media/allwinner,sun6i-=
a31-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/allwinner,sun6=
i-a31-mipi-csi2.yaml
> > > new file mode 100644
> > > index 000000000000..9adc0bc27033
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-mip=
i-csi2.yaml
> > > @@ -0,0 +1,168 @@
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/allwinner,sun6i-a31-mipi-cs=
i2.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Allwinner A31 MIPI CSI-2 Device Tree Bindings
> > > +
> > > +maintainers:
> > > +  - Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    oneOf:
> > > +      - const: allwinner,sun6i-a31-mipi-csi2
> > > +      - items:
> > > +          - const: allwinner,sun8i-v3s-mipi-csi2
> > > +          - const: allwinner,sun6i-a31-mipi-csi2
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description: Bus Clock
> > > +      - description: Module Clock
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: bus
> > > +      - const: mod
> > > +
> > > +  phys:
> > > +    items:
> > > +      - description: MIPI D-PHY
> > > +
> > > +  phy-names:
> > > +    items:
> > > +      - const: dphy
> > > +
> > > +  resets:
> > > +    maxItems: 1
> > > +
> > > +  # See ./video-interfaces.txt for details
> > > +  ports:
> > > +    type: object
> > > +
> > > +    properties:
> > > +      port@0:
> > > +        type: object
> > > +        description: Input port, connect to a MIPI CSI-2 sensor
> > > +
> > > +        properties:
> > > +          reg:
> > > +            const: 0
> > > +
> > > +          endpoint:
> > > +            type: object
> > > +
> > > +            properties:
> > > +              remote-endpoint: true
> > > +
> > > +              bus-type:
> > > +                const: 4
> > > +
> > > +              clock-lanes:
> > > +                maxItems: 1
> > > +
> > > +              data-lanes:
> > > +                minItems: 1
> > > +                maxItems: 4
> > > +
> > > +            required:
> > > +              - bus-type
> > > +              - data-lanes
> > > +              - remote-endpoint
> > > +
> > > +            additionalProperties: false
> > > +
> > > +        required:
> > > +          - endpoint
> > > +
> > > +        additionalProperties: false
> > > +
> > > +      port@1:
> > > +        type: object
> > > +        description: Output port, connect to a CSI controller
> > > +
> > > +        properties:
> > > +          reg:
> > > +            const: 1
> > > +
> > > +          endpoint:
> > > +            type: object
> > > +
> > > +            properties:
> > > +              remote-endpoint: true
> > > +
> > > +              bus-type:
> > > +                const: 4
> >=20
> > That one seems a bit weird. If the input and output ports are using the
> > same format, what is that "bridge" supposed to be doing?
>=20
> Fair enough. What this represents is the internal link (likely a FIFO) be=
tween
> the two controllers. It is definitely not a MIPI CSI-2 bus but there's no
> mbus type for an internal link (probably because it's not a bus after all=
).
>=20
> Note that on the CSI controller side, we need the bus-type to be set to 4=
 for it
> to properly select the MIPI CSI-2 input. So it just felt more logical to =
have
> the same on the other side of the endpoint. On the other hand, we can just
> remove it on the MIPI CSI-2 controller side since it won't check it and h=
ave it
> fallback to the unknown mbus type.
>=20
> But that would make the types inconsistent on the two sides of the link.
> I don't think V4L2 will complain about it at the moment, but it would als=
o make
> sense that it does eventually.
>=20
> What do you think?

There's still the same issue though, it doesn't make any sense that a
bridge doesn't change the bus type. If it really did, we wouldn't need
that in the first place.

What you want to check in your driver is whether the subdev you're
connected to has a sink pad that uses MIPI-CSI

Maxime

> > > +            additionalProperties: false
> > > +
> > > +        required:
> > > +          - endpoint
> > > +
> > > +        additionalProperties: false
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - interrupts
> > > +  - clocks
> > > +  - clock-names
> > > +  - resets
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > +    #include <dt-bindings/clock/sun8i-v3s-ccu.h>
> > > +    #include <dt-bindings/reset/sun8i-v3s-ccu.h>
> > > +
> > > +    mipi_csi2: mipi-csi2@1cb1000 {
> >=20
> > The unit name should be pretty standard, with the list here:
> >=20
> > https://github.com/devicetree-org/devicetree-specification/blob/master/=
source/chapter2-devicetree-basics.rst#generic-names-recommendation
> >=20
> > there's nothing really standing out for us in that list, but given that
> > there's dsi, we should stick with csi
>=20
> Then what really surprises me is that the CSI controllers are called "cam=
era",
> not "csi". If "camera" is supposed to cover both image sensor and camera =
sensor
> interfaces, it would probably fit MIPI CSI-2 as well.
>=20
> I see lots of names with -controller for controllers with specific devices
> attached, like "nand-controller" or "lcd-controller". Maybe using
> "camera-controller" for the CSI and MIPI CSI-2 controllers would make the=
 most
> sense, while keeping "camera" for the actual image sensors.
>=20
> What do you think?

If you really want to discuss this, feel free to open a PR for the DT
spec and add it. However, I still think this csi would be best here:
it's neither a camera nor a camera controller

maxime

--cfopkkgnocgfckzp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX5hqqwAKCRDj7w1vZxhR
xWOdAQCgcheKUpHY5huK9sZ1YmtHOdNLHJM82kpytWznl5K1WwEA1hQ0cY/AQUSd
L8eWrgM6YcwDaOVPF09iGVC89/ISpA0=
=MFnt
-----END PGP SIGNATURE-----

--cfopkkgnocgfckzp--
