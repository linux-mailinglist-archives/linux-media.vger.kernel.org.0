Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AFCF40AD0A
	for <lists+linux-media@lfdr.de>; Tue, 14 Sep 2021 14:07:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232483AbhINMJG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Sep 2021 08:09:06 -0400
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:46679 "EHLO
        wnew4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232284AbhINMJF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Sep 2021 08:09:05 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.west.internal (Postfix) with ESMTP id 661922B01379;
        Tue, 14 Sep 2021 08:07:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 14 Sep 2021 08:07:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=BS95iNxDHg5IOU2+CDcWqYE/6lG
        WFlRvAAVzj9l4DcI=; b=XD0+gQOXZbokDOzAZ6flaxp1i3L29WmBNgvS1Iax+5y
        tsCM8t450uG5+RRc7xYNnAZju6OG5oxHlE87g3dz6IA/5AZAJZ9ieDc5CFsVBP8J
        UoBhlPs0o3Yzz2JkZM5T09E0j5wlMAY4LXAx1tycjB0wn3r9m9VSRtZnUr8IhwdZ
        qgB/QgS9zlUj8CNgvt+nBK+ynRBhOikrLj3pvUpootJKV3K6ARUGsYm61Lc0zInB
        k77qW8Ttx8A/wmqmhnthJFZWdQntKS8o0a2V0YyD7x4I190U+zQkIlfi6RWsAjlD
        GcjswuV7jTYPP9ujh/SSpZaxq5F5KBGtTDKW+8i7yjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=BS95iN
        xDHg5IOU2+CDcWqYE/6lGWFlRvAAVzj9l4DcI=; b=KuRS788U0D00PNM0rHpJOb
        paqmhCQq/lTNWXqchtoymYAiUr/aHBjKWnjwESbx6+wXIJeKvarfuqe40r/Eo+IC
        UtLey5pD9YswkZGbwxb6iTGksHQIdQwGkDJJtvyIIyPQJrG9sceNofxIi99njlUd
        QZ6WoKRkmC8P+T44zr6uXJMUxqwjiCjseXhuOylMAfyw+LD00O0spSZfR7W2O3ca
        FuTWM00Nv/PBVHbmfN9Wd8QIIi+YcS5yn/PBPBFOmgMJ7rxV85jnxE6hhrQ18qmk
        lB7PYwwv4QBj7OsiW95ac6T6Edqm5dC1MXqY/sBjdEr3HB9chrqiWZr+U2OWlv/Q
        ==
X-ME-Sender: <xms:j5BAYQgogg9sngRVjbTllDyGz7_Kw68pQmB09t8RMJtmGL--F_6WtQ>
    <xme:j5BAYZBXuKmNNkVESltB9bCqWSLLgqlFKLfzVei9eSTuVId4NwCTviiUD1Slz3kAW
    SI0QzJz6MaoHj_xqx8>
X-ME-Received: <xmr:j5BAYYEASXI7suVY92ZYBFAlV-f55ITFV58C4ljccexpd4S1KCpHW9ndY45IMhSRrZ-FqZ5BjCqSkjRBmFlIsninoT6MsBQwK4gA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegledggeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepffetteevieejteeuhfffgeektefghfeileehhedtuddutefhhfejtddvtddu
    ledvnecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdr
    thgvtghh
X-ME-Proxy: <xmx:j5BAYRSJWNm5GuLVrGpo9E_Arz34Zw8bK4nebFcVEEdapol1o0KCyw>
    <xmx:j5BAYdwZjghzUaDfTNUNN3dvAN2ZCuaKDbXLmTpQWN-GaQr10aWZ0Q>
    <xmx:j5BAYf5Gc2_Bmqj5UMvNQiwkXWWIAaJMHbzI0vj8bCM7XQ4EpkDZIg>
    <xmx:kpBAYepHMCq04u8C3mlL2dWZog89syeFPfOKB36rETkDZP8WxmfuL8_Onp4>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Sep 2021 08:07:43 -0400 (EDT)
Date:   Tue, 14 Sep 2021 14:07:41 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
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
Message-ID: <20210914120741.gmrqdlev2p7r6f5l@gilmour>
References: <20210910184147.336618-1-paul.kocialkowski@bootlin.com>
 <20210910184147.336618-18-paul.kocialkowski@bootlin.com>
 <20210913081808.esgqvz4eeatp4hkp@gilmour>
 <YUBS1sdHKUMZx6gx@aptenodytes>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gqq67qthp5eyfcss"
Content-Disposition: inline
In-Reply-To: <YUBS1sdHKUMZx6gx@aptenodytes>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--gqq67qthp5eyfcss
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 14, 2021 at 09:44:22AM +0200, Paul Kocialkowski wrote:
> Hi,
>=20
> On Mon 13 Sep 21, 10:18, Maxime Ripard wrote:
> > On Fri, Sep 10, 2021 at 08:41:42PM +0200, Paul Kocialkowski wrote:
> > > This introduces YAML bindings documentation for the Allwinner A31 Ima=
ge
> > > Signal Processor (ISP).
> > >=20
> > > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > ---
> > >  .../media/allwinner,sun6i-a31-csi.yaml        |   2 +-
> > >  .../media/allwinner,sun6i-a31-isp.yaml        | 111 ++++++++++++++++=
++
> > >  2 files changed, 112 insertions(+), 1 deletion(-)
> > >  create mode 100644 Documentation/devicetree/bindings/media/allwinner=
,sun6i-a31-isp.yaml
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/media/allwinner,sun6i-=
a31-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-=
csi.yaml
> > > index f4a686b77a38..c60f6b5403fa 100644
> > > --- a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi=
=2Eyaml
> > > +++ b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi=
=2Eyaml
> > > @@ -1,4 +1,4 @@
> > > -# SPDX-License-Identifier: GPL-2.0
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > >  %YAML 1.2
> > >  ---
> > >  $id: http://devicetree.org/schemas/media/allwinner,sun6i-a31-csi.yam=
l#
> > > diff --git a/Documentation/devicetree/bindings/media/allwinner,sun6i-=
a31-isp.yaml b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-=
isp.yaml
> > > new file mode 100644
> > > index 000000000000..a0f82f150e90
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-isp=
=2Eyaml
> > > @@ -0,0 +1,111 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/allwinner,sun6i-a31-isp.yam=
l#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Allwinner A31 Image Signal Processor Driver (ISP) Device Tree=
 Bindings
> > > +
> > > +maintainers:
> > > +  - Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - allwinner,sun6i-a31-isp
> > > +      - allwinner,sun8i-v3s-isp
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
> > > +      - description: DRAM Clock
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: bus
> > > +      - const: mod
> > > +      - const: ram
> > > +
> > > +  resets:
> > > +    maxItems: 1
> > > +
> > > +  ports:
> > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > +
> > > +    properties:
> > > +      port@0:
> > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > +        description: CSI0 input port
> > > +
> > > +        properties:
> > > +          reg:
> > > +            const: 0
> > > +
> > > +          endpoint:
> > > +            $ref: video-interfaces.yaml#
> > > +            unevaluatedProperties: false
> > > +
> > > +        additionalProperties: false
> > > +
> > > +      port@1:
> > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > +        description: CSI1 input port
> > > +
> > > +        properties:
> > > +          reg:
> > > +            const: 0
> > > +
> > > +          endpoint:
> > > +            $ref: video-interfaces.yaml#
> > > +            unevaluatedProperties: false
> > > +
> > > +        additionalProperties: false
> >=20
> > port@0 and port@1 required?
>=20
> I'd say just one of them, does that make sense?

Don't we have some SoC with both? If so, we should have an anyOf here.

maxime

--gqq67qthp5eyfcss
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYUCQjQAKCRDj7w1vZxhR
xZnQAP0T5rrW8HglxlUdmhQBMd2gsP7z48fcaN5uOKJXVZgVogD9FAslehFY8qhg
xTl+YmcTWItiWy/6SBH6p5vjuNGCHQk=
=ePfT
-----END PGP SIGNATURE-----

--gqq67qthp5eyfcss--
