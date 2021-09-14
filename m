Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2AA840AD05
	for <lists+linux-media@lfdr.de>; Tue, 14 Sep 2021 14:06:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232341AbhINMIB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Sep 2021 08:08:01 -0400
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:42689 "EHLO
        wnew4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232507AbhINMIA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Sep 2021 08:08:00 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.west.internal (Postfix) with ESMTP id CC9CC2B01378;
        Tue, 14 Sep 2021 08:06:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Tue, 14 Sep 2021 08:06:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=yfkVLActGZMW68g0rs5VgSAOO6b
        1fyb8KwcUxANrGvI=; b=Cl+efySlyeLdlJ76DlnUc3lHR0Ma1FNQuBgjIKyF2IX
        2iyE9TvmSmfmbH3Gw45cSg25pmOIUxrIssx4+3jHb4aIZi5Q47MT2n+Y1GuXW2zW
        M8Yt6WLEPihW7JVv/Z3RtktTRTHX+ppYre0vpwENysxJJaDtpGrVJc3qtYBhgKl8
        W/J1uOGyVjAy9eb33aSJbmPU2JK+grc3LLX5XA/UZL4aM8p3HdlPei76essp8Wvj
        pgp1v01aab/IInvuMT7DeTzqoBrupy8jq1EBbzQiV+beujxTdSrinubb5/0EYISb
        ulvRwQRyj9YDqfpdkbviEUM0/gYiS2aFPVB6XYq90yg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=yfkVLA
        ctGZMW68g0rs5VgSAOO6b1fyb8KwcUxANrGvI=; b=KnJSO2rPQinOv/9FwMKY4b
        AQhn60d1b3wVFPPKFrMili2ucoOsbmLTcxs7XdmUTqIhLX4/hd6nwYEUnZodnDfn
        3jh7QMe4boupn3A6ZO00fJYG18z5+6PeMlcgrYhIJ83vFZsQlkXIhMNVlN3DPMis
        M90ThZsx2Aebx20+uXkaOCYK81sCmDCHwtIuAbFNA4lTF35ZRhsO2Jpw5unKirER
        lMiQ4TYsbsTvpbYE9xDqReUkZVkfjT6/v+HrXtsqR3vYwrMSK/IXiG1tWMJUk4ZF
        QLyD889Wwj0D6y3NiQNvj+Khom6VQMdjrGoaDc4+r0CRGl3dMOURbJ/zKY+rbavw
        ==
X-ME-Sender: <xms:T5BAYdV73150Y3X--vSlRxt9z7M75DzQL8nKNLq7hAvR67Q4gOOnIA>
    <xme:T5BAYdkzu1RfLQPGClzipekhNZUwUvb9cJE-S8CW4sKNieRV_DjohuK2jtI4xFLdQ
    voBxbSUqsw821RprnU>
X-ME-Received: <xmr:T5BAYZZhtjX2Zg2IVfHvCMUXmOXIF15ksGGZaZjvCnlo657Vsp1YtWm2lZYsXdfuwy_m_7HYOPkr_rEZM_1GX7Zpg8Zk0X5H_w1Z>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegledggeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:T5BAYQW9fwmSCK3M0eDzK7FNI5QZUMcClPeOgJG428yL0PgmqxpF4g>
    <xmx:T5BAYXm9FaJRWb_jjJXdWdxVwoEkCXL0hT7alnUpxohe7V4l4LG3ag>
    <xmx:T5BAYdf-7qWy2N6HS1jwX6Uysm4GlORvDQo8Y5JGNNqrauOs6Wb0zA>
    <xmx:UZBAYZr6SbYBEVjYhovoXOX8Xm6m9g8saV6DUjauLo-BkNNmH3KKv6rw9KY>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Sep 2021 08:06:38 -0400 (EDT)
Date:   Tue, 14 Sep 2021 14:06:37 +0200
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
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 05/22] dt-bindings: media: sun6i-a31-csi: Add MIPI CSI-2
 input port
Message-ID: <20210914120637.dpaig2nx6i45hkec@gilmour>
References: <20210910184147.336618-1-paul.kocialkowski@bootlin.com>
 <20210910184147.336618-6-paul.kocialkowski@bootlin.com>
 <20210913080931.opbtx45sxqu52jxe@gilmour>
 <YUBSjBMUk+nQSzRz@aptenodytes>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ls7hdd33ltqkrebg"
Content-Disposition: inline
In-Reply-To: <YUBSjBMUk+nQSzRz@aptenodytes>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--ls7hdd33ltqkrebg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 14, 2021 at 09:43:08AM +0200, Paul Kocialkowski wrote:
> Hi,
>=20
> On Mon 13 Sep 21, 10:09, Maxime Ripard wrote:
> > On Fri, Sep 10, 2021 at 08:41:30PM +0200, Paul Kocialkowski wrote:
> > > The A31 CSI controller supports two distinct input interfaces:
> > > parallel and an external MIPI CSI-2 bridge. The parallel interface
> > > is often connected to a set of hardware pins while the MIPI CSI-2
> > > bridge is an internal FIFO-ish link. As a result, these two inputs
> > > are distinguished as two different ports.
> > >=20
> > > Note that only one of the two may be present on a controller instance.
> > > For example, the V3s has one controller dedicated to MIPI-CSI2 and one
> > > dedicated to parallel.
> > >=20
> > > Update the binding with an explicit ports node that holds two distinct
> > > port nodes: one for parallel input and one for MIPI CSI-2.
> > >=20
> > > This is backward-compatible with the single-port approach that was
> > > previously taken for representing the parallel interface port, which
> > > stays enumerated as fwnode port 0.
> > >=20
> > > Note that additional ports may be added in the future, especially to
> > > support feeding the CSI controller's output to the ISP.
> > >=20
> > > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > Acked-by: Maxime Ripard <mripard@kernel.org>
> > > ---
> > >  .../media/allwinner,sun6i-a31-csi.yaml        | 75 +++++++++++++++--=
--
> > >  1 file changed, 62 insertions(+), 13 deletions(-)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/media/allwinner,sun6i-=
a31-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-=
csi.yaml
> > > index 8b568072a069..f4a686b77a38 100644
> > > --- a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi=
=2Eyaml
> > > +++ b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi=
=2Eyaml
> > > @@ -61,6 +61,49 @@ properties:
> > > =20
> > >      additionalProperties: false
> > > =20
> > > +  ports:
> > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > +
> > > +    properties:
> > > +      port@0:
> > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > +        description: Parallel input port, connect to a parallel sens=
or
> > > +
> > > +        properties:
> > > +          reg:
> > > +            const: 0
> > > +
> > > +          endpoint:
> > > +            $ref: video-interfaces.yaml#
> > > +            unevaluatedProperties: false
> > > +
> > > +            properties:
> > > +              bus-width:
> > > +                enum: [ 8, 10, 12, 16 ]
> > > +
> > > +              pclk-sample: true
> > > +              hsync-active: true
> > > +              vsync-active: true
> > > +
> > > +            required:
> > > +              - bus-width
> > > +
> > > +        additionalProperties: false
> >=20
> > You don't have to duplicate the entire definition there, you can just
> > reference port:
> >=20
> > $ref: #/properties/port
>=20
> And that would reference the local (previous) definition of the port node?

Yep. You can't use additionalProperties anymore though, but only
unevaluatedProperties since additionalProperties is about the current
schema (ie, every below port@0 here), while unevaluatedProperties is
about the sum of all the schemas.

> Sounds like a good thing indeed.

> > > +      port@1:
> > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > +        description: MIPI CSI-2 bridge input port
> > > +
> > > +        properties:
> > > +          reg:
> > > +            const: 1
> > > +
> > > +          endpoint:
> > > +            $ref: video-interfaces.yaml#
> > > +            unevaluatedProperties: false
> > > +
> > > +        additionalProperties: false
> > > +
> >=20
> > port@0 is required?
>=20
> It shouldn't be required. Does that call for a change here?

I guess you'd at least need one of the two?

So something like this should work

anyOf:
  - required:
    - port@0

  - required:
    - port@1

> > And at the top-level, either ports or port are required too
>=20
> Yes I guess that is true. Should that be a required+oneOf type of thing?

Yes, anyOf is an OR, oneOf a XOR. I don't think it makes sense to have
ports and port there.

Maxime

--ls7hdd33ltqkrebg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYUCQTQAKCRDj7w1vZxhR
xVY0AQC0MzwuomSb5c5Fgv85f1YABbZl/usW1RpLFc/A86BSgAD+IXKAZTi4a+Im
jo0PlN3KwTvKKVqnAGtwPT6IAzjArwI=
=yj8h
-----END PGP SIGNATURE-----

--ls7hdd33ltqkrebg--
