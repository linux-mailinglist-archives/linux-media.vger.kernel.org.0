Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 959D5299217
	for <lists+linux-media@lfdr.de>; Mon, 26 Oct 2020 17:15:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1775055AbgJZQO6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Oct 2020 12:14:58 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:49761 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2391829AbgJZQO5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Oct 2020 12:14:57 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 130A85803F3;
        Mon, 26 Oct 2020 12:14:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 26 Oct 2020 12:14:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=TLyiKgOV7T5s8EKyctDKKbjHeyz
        5nHIrwqEFQz+QSsQ=; b=eQ84KS+HxBeS5NfvqwoZsa3zVE9VdlE4oktymJyDQTK
        WS7H4qOwWNOjFcRnWwESGIIL0tmYDLBXu21at3eeaIvdP9Azl5PeViTGrOE4ojjF
        fElUd5JF7ca5hU6FddgR0La0JVwLAdEqUOU8GOjuwYp6a6DBAoaQXVTNfuEyy2DW
        By09qbGxxKRf//Z3NBctrDf9cusTv3i43OZxa84yRN1HPCNWJq4vWp8u1J/6AfGh
        Ep6i7i+lAi758RcR3kzVETsF/Xs4cfpaSHA8pFtdHuVSk1rFR43XS8Bj9ZZfuRJl
        dbpkMQ0xRLkylJ/e6l8Sfdcqi+Sng3B4RMjhlGbYAgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=TLyiKg
        OV7T5s8EKyctDKKbjHeyz5nHIrwqEFQz+QSsQ=; b=kPj637TBaochR9cRFkstu+
        10qhPZTu5UDqMrTpZGMEIM3kNXx2JDANwJFF0MNf9Cyy3wRyfch/94WbzPeMFSXy
        bN8rur72crIYEoWeji0FI5mEX0fhsZSti13lkhaKbV6N/C9xQOrvs6NVbX08rM3+
        LoXLkgmtoFLp6edw/UWuik8t7IOwopH9WEVmPKexSJx4FrcEJKKitUw/9PUl5Xp3
        v/o7Rl80TNqAKj0p7PSRV/1JY1NISaHVlWQfqgaybK7PkjO3z8mCSZWQglvr+F/J
        79HKZ9e6OFSC+n8f/rqoS4jlcAzBu2yWFoMdJOvdQ/+2oIlusKaik4HXST39kVmw
        ==
X-ME-Sender: <xms:_PWWX2Q0dI-rq3Gnyc7GIvZi6m4l_FcbIjIqpWPycwP9Vt2VQoejHw>
    <xme:_PWWX7xCssfOupGPUQtUzu3UYVbtF6WmxTzXln6unevGeR2keKoUXMjw7jtYrUHMW
    MA8siE9uQSeHH6-JAw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrkeejgdeglecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeetudffiefhhedvgfeufeejvedvveffffeikeduvdejuefgieffgedtuddtfeek
    tdenucffohhmrghinhepuggvvhhitggvthhrvggvrdhorhhgpdhgihhthhhusgdrtghomh
    enucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:_PWWXz2qi7ON9-JqjnXXE9GC-GWrYsSb-s3pckEdeD75HwYaAWhmFw>
    <xmx:_PWWXyC2iQjygG9reB_Xy5CrTnilepzJFsxPOnDf7ZEr24cEAZISDw>
    <xmx:_PWWX_gPBz6ftr6DNqQ2O4FsX9TJijAolCNgNaCjYgnSa66AtySSLA>
    <xmx:APaWX4YEYu7cKh-qE3DWOvv4gH6ix1EeaVXqWS-lWcLLK-jn97J7Qw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 406783280059;
        Mon, 26 Oct 2020 12:14:52 -0400 (EDT)
Date:   Mon, 26 Oct 2020 17:14:50 +0100
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
Message-ID: <20201026161450.gr3dqpltxw2ccc3s@gilmour.lan>
References: <20201023174546.504028-1-paul.kocialkowski@bootlin.com>
 <20201023174546.504028-8-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="eiytbmgwemquicwl"
Content-Disposition: inline
In-Reply-To: <20201023174546.504028-8-paul.kocialkowski@bootlin.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--eiytbmgwemquicwl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

i2c? :)

On Fri, Oct 23, 2020 at 07:45:39PM +0200, Paul Kocialkowski wrote:
> This introduces YAML bindings documentation for the A31 MIPI CSI-2
> controller.
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  .../media/allwinner,sun6i-a31-mipi-csi2.yaml  | 168 ++++++++++++++++++
>  1 file changed, 168 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun=
6i-a31-mipi-csi2.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-=
mipi-csi2.yaml b/Documentation/devicetree/bindings/media/allwinner,sun6i-a3=
1-mipi-csi2.yaml
> new file mode 100644
> index 000000000000..9adc0bc27033
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-mipi-cs=
i2.yaml
> @@ -0,0 +1,168 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/allwinner,sun6i-a31-mipi-csi2.y=
aml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner A31 MIPI CSI-2 Device Tree Bindings
> +
> +maintainers:
> +  - Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: allwinner,sun6i-a31-mipi-csi2
> +      - items:
> +          - const: allwinner,sun8i-v3s-mipi-csi2
> +          - const: allwinner,sun6i-a31-mipi-csi2
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Bus Clock
> +      - description: Module Clock
> +
> +  clock-names:
> +    items:
> +      - const: bus
> +      - const: mod
> +
> +  phys:
> +    items:
> +      - description: MIPI D-PHY
> +
> +  phy-names:
> +    items:
> +      - const: dphy
> +
> +  resets:
> +    maxItems: 1
> +
> +  # See ./video-interfaces.txt for details
> +  ports:
> +    type: object
> +
> +    properties:
> +      port@0:
> +        type: object
> +        description: Input port, connect to a MIPI CSI-2 sensor
> +
> +        properties:
> +          reg:
> +            const: 0
> +
> +          endpoint:
> +            type: object
> +
> +            properties:
> +              remote-endpoint: true
> +
> +              bus-type:
> +                const: 4
> +
> +              clock-lanes:
> +                maxItems: 1
> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +            required:
> +              - bus-type
> +              - data-lanes
> +              - remote-endpoint
> +
> +            additionalProperties: false
> +
> +        required:
> +          - endpoint
> +
> +        additionalProperties: false
> +
> +      port@1:
> +        type: object
> +        description: Output port, connect to a CSI controller
> +
> +        properties:
> +          reg:
> +            const: 1
> +
> +          endpoint:
> +            type: object
> +
> +            properties:
> +              remote-endpoint: true
> +
> +              bus-type:
> +                const: 4

That one seems a bit weird. If the input and output ports are using the
same format, what is that "bridge" supposed to be doing?

> +            additionalProperties: false
> +
> +        required:
> +          - endpoint
> +
> +        additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - resets
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/sun8i-v3s-ccu.h>
> +    #include <dt-bindings/reset/sun8i-v3s-ccu.h>
> +
> +    mipi_csi2: mipi-csi2@1cb1000 {

The unit name should be pretty standard, with the list here:

https://github.com/devicetree-org/devicetree-specification/blob/master/sour=
ce/chapter2-devicetree-basics.rst#generic-names-recommendation

there's nothing really standing out for us in that list, but given that
there's dsi, we should stick with csi

Maxime

--eiytbmgwemquicwl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX5b1+gAKCRDj7w1vZxhR
xUrvAQDaCb49+m5oHHwZxWYiC4umXmj81ww7TpCLw3SGokcdqgD+PDaf8R4Y7Mki
j3oAL73uUh4iuB1RtuGhHa16do4kDgg=
=ZVlV
-----END PGP SIGNATURE-----

--eiytbmgwemquicwl--
