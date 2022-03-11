Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29F0C4D6346
	for <lists+linux-media@lfdr.de>; Fri, 11 Mar 2022 15:17:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243007AbiCKOS2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Mar 2022 09:18:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243411AbiCKOS0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Mar 2022 09:18:26 -0500
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83F761C74F9;
        Fri, 11 Mar 2022 06:17:20 -0800 (PST)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 79C82240002;
        Fri, 11 Mar 2022 14:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1647008239;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=IjzOVVFwC8YElYj8/GGShDmz19TH4NBCiTfKXK73bOo=;
        b=MzM2DzFv1Q5pucT5b8sktuJE/gaDbYQcAq0LSMU98HTmzmqr3bTnBwuILIuHeK1W0p0XS7
        3ljzPQiOuTRY9mnWxe+D9+T5uhjs49vxI5YkHBRtKJLUsa77V5rkf3t9S46sD2DpdptnC+
        HTGh9Jq3kMPQhu8kwVqxNkrE/FtmzYPHrkjrJFhTblQHuOz/pMTgcPWN7GaiPEifPH8IgJ
        7IZYxtr+fys1Qrz5/xAIUc0LRlOt+LLoObOFCkxClgjkX62hkOudEM4RyqRjQvF6ArBnls
        Lnjpyd/TcNT1vIEcPF971Se5w1ZE2TXcYOrUc19/bKwSy1rVrk+U90eDkw4rRw==
Date:   Fri, 11 Mar 2022 15:17:15 +0100
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-staging@lists.linux.dev,
        Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Helen Koike <helen.koike@collabora.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 61/66] dt-bindings: media: Add Allwinner A31 ISP
 bindings documentation
Message-ID: <YitZ6y2JoNzeHUrp@aptenodytes>
References: <20220205185429.2278860-62-paul.kocialkowski@bootlin.com>
 <YgE/+UmP4nJVxtRT@pendragon.ideasonboard.com>
 <YgqAv2vLimYgRwDS@aptenodytes>
 <YgqM3ZdMfEz+ZKo/@pendragon.ideasonboard.com>
 <Ygt8LF8qx3rnxlgp@aptenodytes>
 <Ygt9j+rwEC+2aUjH@pendragon.ideasonboard.com>
 <Yh4+E9el5NdQ7qJq@aptenodytes>
 <YiH/kLakb/GOaYIT@pendragon.ideasonboard.com>
 <YiIa1SRFhtvURTbN@aptenodytes>
 <YiIdo4PF/5smLocf@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kNn+ks4zuyAAfq3C"
Content-Disposition: inline
In-Reply-To: <YiIdo4PF/5smLocf@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--kNn+ks4zuyAAfq3C
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On Fri 04 Mar 22, 16:09, Laurent Pinchart wrote:
> Hi Paul,
>=20
> (With a question for Sakari below)
>=20
> On Fri, Mar 04, 2022 at 02:57:41PM +0100, Paul Kocialkowski wrote:
> > On Fri 04 Mar 22, 14:01, Laurent Pinchart wrote:
> > > On Tue, Mar 01, 2022 at 04:38:59PM +0100, Paul Kocialkowski wrote:
> > > > On Tue 15 Feb 22, 12:16, Laurent Pinchart wrote:
> > > > > On Tue, Feb 15, 2022 at 11:10:52AM +0100, Paul Kocialkowski wrote:
> > > > > > On Mon 14 Feb 22, 19:09, Laurent Pinchart wrote:
> > > > > > > On Mon, Feb 14, 2022 at 05:18:07PM +0100, Paul Kocialkowski w=
rote:
> > > > > > > > On Mon 07 Feb 22, 17:51, Laurent Pinchart wrote:
> > > > > > > > > On Sat, Feb 05, 2022 at 07:54:24PM +0100, Paul Kocialkows=
ki wrote:
> > > > > > > > > > This introduces YAML bindings documentation for the All=
winner A31 Image
> > > > > > > > > > Signal Processor (ISP).
> > > > > > > > > >=20
> > > > > > > > > > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@boo=
tlin.com>
> > > > > > > > > > ---
> > > > > > > > > >  .../media/allwinner,sun6i-a31-isp.yaml        | 117 ++=
++++++++++++++++
> > > > > > > > > >  1 file changed, 117 insertions(+)
> > > > > > > > > >  create mode 100644 Documentation/devicetree/bindings/m=
edia/allwinner,sun6i-a31-isp.yaml
> > > > > > > > > >=20
> > > > > > > > > > diff --git a/Documentation/devicetree/bindings/media/al=
lwinner,sun6i-a31-isp.yaml b/Documentation/devicetree/bindings/media/allwin=
ner,sun6i-a31-isp.yaml
> > > > > > > > > > new file mode 100644
> > > > > > > > > > index 000000000000..2d87022c43ce
> > > > > > > > > > --- /dev/null
> > > > > > > > > > +++ b/Documentation/devicetree/bindings/media/allwinner=
,sun6i-a31-isp.yaml
> > > > > > > > > > @@ -0,0 +1,117 @@
> > > > > > > > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > > > > > > > +%YAML 1.2
> > > > > > > > > > +---
> > > > > > > > > > +$id: http://devicetree.org/schemas/media/allwinner,sun=
6i-a31-isp.yaml#
> > > > > > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > > > > > +
> > > > > > > > > > +title: Allwinner A31 Image Signal Processor Driver (IS=
P) Device Tree Bindings
> > > > > > > > > > +
> > > > > > > > > > +maintainers:
> > > > > > > > > > +  - Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > > > > > > > > +
> > > > > > > > > > +properties:
> > > > > > > > > > +  compatible:
> > > > > > > > > > +    enum:
> > > > > > > > > > +      - allwinner,sun6i-a31-isp
> > > > > > > > > > +      - allwinner,sun8i-v3s-isp
> > > > > > > > > > +
> > > > > > > > > > +  reg:
> > > > > > > > > > +    maxItems: 1
> > > > > > > > > > +
> > > > > > > > > > +  interrupts:
> > > > > > > > > > +    maxItems: 1
> > > > > > > > > > +
> > > > > > > > > > +  clocks:
> > > > > > > > > > +    items:
> > > > > > > > > > +      - description: Bus Clock
> > > > > > > > > > +      - description: Module Clock
> > > > > > > > > > +      - description: DRAM Clock
> > > > > > > > >=20
> > > > > > > > > That's interesting, does the ISP have a dedicated DRAM ?
> > > > > > > >=20
> > > > > > > > It doesn't, it actually uses the main DRAM with the "mbus" =
interconnect.
> > > > > > > > The clock is probably for the DMA engine.
> > > > > > > >=20
> > > > > > > > > > +
> > > > > > > > > > +  clock-names:
> > > > > > > > > > +    items:
> > > > > > > > > > +      - const: bus
> > > > > > > > > > +      - const: mod
> > > > > > > > > > +      - const: ram
> > > > > > > > > > +
> > > > > > > > > > +  resets:
> > > > > > > > > > +    maxItems: 1
> > > > > > > > > > +
> > > > > > > > > > +  ports:
> > > > > > > > > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > > > > > > > > +
> > > > > > > > > > +    properties:
> > > > > > > > > > +      port@0:
> > > > > > > > > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > > > > > > > > +        description: CSI0 input port
> > > > > > > > > > +
> > > > > > > > > > +        properties:
> > > > > > > > > > +          reg:
> > > > > > > > > > +            const: 0
> > > > > > > > > > +
> > > > > > > > > > +          endpoint:
> > > > > > > > > > +            $ref: video-interfaces.yaml#
> > > > > > > > > > +            unevaluatedProperties: false
> > > > > > > > >=20
> > > > > > > > > If no other property than remote-endpoint are allowed, I'=
d write
> > > > > > > > >=20
> > > > > > > > >           endpoint:
> > > > > > > > >             $ref: video-interfaces.yaml#
> > > > > > > > > 	    remote-endpoint: true
> > > > > > > > >             additionalProperties: false
> > > > > > > > >=20
> > > > > > > > > Same below.
> > > > > > > > >=20
> > > > > > > > > > +
> > > > > > > > > > +        additionalProperties: false
> > > > > > > > > > +
> > > > > > > > > > +      port@1:
> > > > > > > > > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > > > > > > > > +        description: CSI1 input port
> > > > > > > > > > +
> > > > > > > > > > +        properties:
> > > > > > > > > > +          reg:
> > > > > > > > > > +            const: 0
> > > > > > > > >=20
> > > > > > > > > This should be 1.
> > > > > > > >=20
> > > > > > > > Correct, thanks!
> > > > > > > >=20
> > > > > > > > > > +
> > > > > > > > > > +          endpoint:
> > > > > > > > > > +            $ref: video-interfaces.yaml#
> > > > > > > > > > +            unevaluatedProperties: false
> > > > > > > > > > +
> > > > > > > > > > +        additionalProperties: false
> > > > > > > > > > +
> > > > > > > > > > +    anyOf:
> > > > > > > > > > +      - required:
> > > > > > > > > > +        - port@0
> > > > > > > > > > +      - required:
> > > > > > > > > > +        - port@1
> > > > > > > > >=20
> > > > > > > > > As ports are an intrinsic property of the ISP, both shoul=
d be required,
> > > > > > > > > but they don't have to be connected.
> > > > > > > >=20
> > > > > > > > Well the ISP does have the ability to source from either CS=
I0 and CSI1
> > > > > > > > but I don't really get the point of declaring both ports wh=
en only one
> > > > > > > > of the two controllers is present.
> > > > > > >=20
> > > > > > > If it's within an SoC I don't mind too much. What I usually i=
nsist on is
> > > > > > > declaring all ports even when no external devices are connect=
ed on the
> > > > > > > board. It may however be easier to implement things on the dr=
iver side
> > > > > > > when all the ports are declared, even for internal devices. I=
 won't
> > > > > > > insist either way here.
> > > > > > >=20
> > > > > > > > > By the way, how do you select at runtime which CSI-2 RX t=
he ISP gets its
> > > > > > > > > image stream from ? Is it configured through registers of=
 the ISP ?
> > > > > > > >=20
> > > > > > > > Actually what the ISP gets is fully dependent on what is re=
ceived by the
> > > > > > > > CSI controller it is connected to (which can be the mipi cs=
i-2 controller
> > > > > > > > or its direct parallel pins), so the configuration happens =
on the CSI side.
> > > > > > >=20
> > > > > > > OK, then how do you select at runtime which CSI the ISP gets =
its image
> > > > > > > stream from ? :-)
> > > > > >=20
> > > > > > What is done in the driver is that all available csi(s) entitie=
s pads are linked
> > > > > > to a single csi sink media pad, which allows userspace to enabl=
e one or the
> > > > > > other. If there's only one, it's enabled by default.
> > > > > >=20
> > > > > > The actual stream source (isp_dev->proc.source) is selected at =
link_validate
> > > > > > time and the source bit is set in sun6i_isp_proc_enable.
> > > > > >=20
> > > > > > I hope this answers your question!
> > > > >=20
> > > > > Yes it does, thank you.
> > > > >=20
> > > > > While this works, it makes life a bit more complicated for usersp=
ace, as
> > > > > switching between the two sources require disabling the link firs=
t and
> > > > > then enabling the new one. This is something that caused issues i=
n the
> > > > > libcamera simple pipeline handler, I ended up having to implement=
 a
> > > > > workaround.
> > > >=20
> > > > That surprises me a bit, I thought this was a typical use-case for =
links.
> > > > So the fact that it's a two-step process causes issues somehow?
> > >=20
> > > It's not so much that the links have to be configured in two steps
> > > (although it would be nice if that could be fixed), but the fact that
> > > the order of the operations matter. Userspace has to know what
> > > combination of links is acceptable in order to determine the order of
> > > the enable/disable operations, otherwise errors may be returned. That
> > > makes it more difficult to write generic userspace code.
> >=20
> > Ah right, I understand that. Now it's pretty much trial-and-error if us=
erspace
> > doesn't have prior knowledge about the hardware. But to be honest I ass=
umed
> > that it was more or less understood that there cannot be fully generic
> > userspace for this and that knowedlege about the driver and pipeline fl=
ow
> > is required to do things right.
>=20
> You're right, and that's why we have device-specific code in libcamera.
> However, the more generic-friendly the APIs can be, the more the
> device-specific userspace code will be able to use generic helpers, so
> it still matters.
>=20
> > > > > Could you instead have two sink pads for the ISP, and select the =
sensor
> > > > > at stream on time instead of link validation time by checking whi=
ch link
> > > > > is enabled ? If no links or both links are enabled, you can then =
return
> > > > > an error.
> > > >=20
> > > > Yes that's totally doable.
> > > >=20
> > > > There's a similar situation with the sun6i-csi bridge where the sou=
rce pad
> > > > has two possible links: one for routing to sun6i-csi capture (video=
 device)
> > > > and one for routing to the isp entity.
> > > >=20
> > > > Would that also be best represented as two pads?
> > >=20
> > > Are the two outputs mutually exclusive ? Sorry if I've asked before.
> >=20
> > I don't think you have. Yes they are mutually exclusive, only one source
> > can be selected at a time. Same situation as the ISP where the two CSI =
unit
> > inputs are mutually exclusive.
>=20
> On the sink (input) side that's quite common, if you have two different
> sources but a single sink, the sink can't (usually) process both sources
> at the same time. I understand that for the sun6i-csi bridge it's the
> other way around, with the bridge can output to either a DMA engine or
> to the ISP, but not both at the same time. That's less common, but can
> certainly happen. I think I'd go for two source pads in that case too.
> Sakari, any opinion ?

As I was reading this thread again, I think there might be a misunderstandi=
ng
here when you said that "switching between the two sources require disabling
the link first and then enabling the new one".

The driver is currently not checking the validity of the setup at link_setup
but at link_validate (which is called at streamon time), so userspace can
effectively disable/enable links in whichever order and a valid setup is on=
ly
required when streaming starts. I think that's already the situation that y=
ou
want to achieve.

To summarize, the following pads can have multiple links:
- csi sink (parallel sensor source or mipi csi-2 bridge source)
- csi source (isp sink or video capture sink)
- isp sink (csi0 source or csi1 source)

I'll send my next versions without changes (one pad, multiple links)
but we can revisit this if there's an issue with that after all.

Cheers,

Paul

> > > > > Ideally I'd say such internal routing should use the new V4L2 sub=
dev
> > > > > routing API that is currently being implemented (see [1]), but I =
don't
> > > > > know when it will land, and I don't want to delay your patch seri=
es.
> > > > >=20
> > > > > [1] https://lore.kernel.org/linux-media/20211130141536.891878-28-=
tomi.valkeinen@ideasonboard.com
> > > >=20
> > > > I'm still a bit confused what problem this is trying to solve.
> > > > My understanding was that the current pad/link API allows represent=
ing complex
> > > > topologies and switching different paths with link enable/disable.
> > >=20
> > > That was the intent of the MEDIA_IOC_SETUP_LINK ioctl, but we ended up
> > > with something that is fairly ill-defined, and doesn't have the abili=
ty
> > > to set multiple links atomically. It turned out to be less usable for
> > > userspace than expected. Mistakes happen (and I'll blame myself here,
> > > having designed that API) when we don't have real test cases during
> > > kernel development.
> >=20
> > Yeah it's hard to predict these kinds of things in advance I suppose.
> > Thanks for the heads up!
> >=20
> > > > > > > > > > +
> > > > > > > > > > +required:
> > > > > > > > > > +  - compatible
> > > > > > > > > > +  - reg
> > > > > > > > > > +  - interrupts
> > > > > > > > > > +  - clocks
> > > > > > > > > > +  - clock-names
> > > > > > > > > > +  - resets
> > > > > > > > > > +
> > > > > > > > > > +additionalProperties: false
> > > > > > > > > > +
> > > > > > > > > > +examples:
> > > > > > > > > > +  - |
> > > > > > > > > > +    #include <dt-bindings/interrupt-controller/arm-gic=
=2Eh>
> > > > > > > > > > +    #include <dt-bindings/clock/sun8i-v3s-ccu.h>
> > > > > > > > > > +    #include <dt-bindings/reset/sun8i-v3s-ccu.h>
> > > > > > > > > > +
> > > > > > > > > > +    isp: isp@1cb8000 {
> > > > > > > > > > +        compatible =3D "allwinner,sun8i-v3s-isp";
> > > > > > > > > > +        reg =3D <0x01cb8000 0x1000>;
> > > > > > > > > > +        interrupts =3D <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH=
>;
> > > > > > > > > > +        clocks =3D <&ccu CLK_BUS_CSI>,
> > > > > > > > > > +             <&ccu CLK_CSI1_SCLK>,
> > > > > > > > > > +             <&ccu CLK_DRAM_CSI>;
> > > > > > > > > > +        clock-names =3D "bus", "mod", "ram";
> > > > > > > > > > +        resets =3D <&ccu RST_BUS_CSI>;
> > > > > > > > > > +
> > > > > > > > > > +        ports {
> > > > > > > > > > +            #address-cells =3D <1>;
> > > > > > > > > > +            #size-cells =3D <0>;
> > > > > > > > > > +
> > > > > > > > > > +            port@0 {
> > > > > > > > > > +                reg =3D <0>;
> > > > > > > > > > +
> > > > > > > > > > +                isp_in_csi0: endpoint {
> > > > > > > > > > +                    remote-endpoint =3D <&csi0_out_isp=
>;
> > > > > > > > > > +                };
> > > > > > > > > > +            };
> > > > > > > > > > +        };
> > > > > > > > > > +    };
> > > > > > > > > > +
> > > > > > > > > > +...
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--kNn+ks4zuyAAfq3C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmIrWesACgkQ3cLmz3+f
v9H/qwgAoJ0iY70KHMsk2Wxl0Y8gur2XscmVSFGx5nYg9vVy1dHSdkUMTzAO8cUT
TwdttkByR80Yk8PWefn/KwQB3u7Touzw4qGCm7RQXos88Aatl1YPrKB110defLFd
IBlWEb14OysTJtx3zfGLRBTBGB3bZ33a+ljk3mYyFrKJM8v/6pnrmKehPX+9/Bre
KUxC9Ym0qW+YFlS66oeiu01njGjG8qMkbVyUUoh/pjdXULTr6cEe/i75ZswnLHrL
vkco3jfm2a80G13QINKyO3vfC3Eu5rT20PIm+TqbwgA/QUpsjwF9NGAz1ZtSyux6
tBsDZ+pxG5EWczBq4vPlEhcrusckIQ==
=qGKp
-----END PGP SIGNATURE-----

--kNn+ks4zuyAAfq3C--
