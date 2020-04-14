Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3224A1A760A
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2020 10:28:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436813AbgDNI2L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 04:28:11 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:51605 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2436781AbgDNI2I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 04:28:08 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 63B26B34;
        Tue, 14 Apr 2020 04:28:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 14 Apr 2020 04:28:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=JFPo3P/ogXd9mYgq1lTrnURkg3G
        K316i1UBGh+ZNSj0=; b=Kq0iiCN6F5a0zhqu0NSJX7TiRC0KsxldKcBvWwnD4ja
        bjT4AfoFrBGrwu87abBZls5MSTr0iaQ/44rxNgGfwCloGBTfXCWsiFvdl76cBrs3
        N9VdKftdIJAdnmWc44flznOqmpPdO1WCOXOsF5WbVufrZyeOph1omTZSVH74s4JI
        0RUAW0duLxDrvyWt25/iBT3G8ncETrdn6E21fczt8QsC0uQg/Tb2Uz5x5TP/823Q
        J4k20iLE3qCoL2X+oEfM5hA4K6Z+zFO6l5Cl4p8gK1wYscKbiy12gTRMg6EfpXTS
        fLkCVV9IayvKVkXd6JTZaBMVw68MU7eF971G+z3U+5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=JFPo3P
        /ogXd9mYgq1lTrnURkg3GK316i1UBGh+ZNSj0=; b=PBCjk96VAiWJqcoEPe+SJY
        yWF2SnRjOjUhIn0QW60Gxvdx3cyoHKHlfabFxEgsstDkaxge40CqubetqzyUMV2n
        zrrhBN9GuOdhXDI2pl+GggBP5U5HM3jQeQXeIzI6aKUJhTL4vPuwAGS++Hn9rCDS
        jCX00GG09VnnybEQu6gVbQtVa3XhDBi2pbiOxhT9gFA8gP4Azew8Gcs6V11Kumg4
        t46jMimiIySax2JtTtf6jfzAAMrHiqB5FS0XsKnFjZGL/ILvK2r/GLJAJcbmjRQ3
        cj0DHlGXiPTLvpZl7/MpFINnUjIRLIPCldx0XxDo03mGyK+TU5B6+J9ro3+XVemQ
        ==
X-ME-Sender: <xms:FXSVXnuBmWR3eYET2Z9MgBfz__Q8mjY6mWJBakKIjV3kw_3KRWJ3IA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrfedugddtgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucffohhmrghinh
    epuggvvhhitggvthhrvggvrdhorhhgnecukfhppeeltddrkeelrdeikedrjeeinecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvse
    gtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:FXSVXsuYOWilsWshQSQEN5IXz0MgYBQHF47jhckdIVoQfARkluILjg>
    <xmx:FXSVXlxdm8ZSD4qpDGkve2dzNh7DAs3FJ9VbHcQGewsFcbVZRXSUUg>
    <xmx:FXSVXqhx1g03UCsS6Bd61q5jcCDNcm4wTyaTWOcOCVqTiwBFlvYWOA>
    <xmx:FnSVXq0lretqr5VzwkTBOofhco5UnEPTdf_ucnMw7OuzPCv4yzm7kQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 0B547328005E;
        Tue, 14 Apr 2020 04:28:04 -0400 (EDT)
Date:   Tue, 14 Apr 2020 10:28:03 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 1/4] dt-bindings: display: convert atmel-hlcdc to DT
 Schema
Message-ID: <20200414082803.exblunwe7bufbiht@gilmour.lan>
References: <20200412182012.27515-1-sam@ravnborg.org>
 <20200412182012.27515-2-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jmsbjzfjeb57pove"
Content-Disposition: inline
In-Reply-To: <20200412182012.27515-2-sam@ravnborg.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--jmsbjzfjeb57pove
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sam,

On Sun, Apr 12, 2020 at 08:20:09PM +0200, Sam Ravnborg wrote:
> diff --git a/Documentation/devicetree/bindings/display/atmel/hlcdc-dc.yaml b/Documentation/devicetree/bindings/display/atmel/hlcdc-dc.yaml
> new file mode 100644
> index 000000000000..7eb6266a25a2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/atmel/hlcdc-dc.yaml
> @@ -0,0 +1,102 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/atmel/hlcdc-dc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Atmel HLCDC (High LCD Controller) display controller
> +
> +maintainers:
> +  - Sam Ravnborg <sam@ravnborg.org>
> +  - Boris Brezillon <bbrezillon@kernel.org>
> +
> +description: |
> +  The Atmel HLCDC Display Controller is subdevice of the HLCDC MFD device.
> +  See ../../mfd/atmel-hlcdc.yaml for more details.
> +
> +properties:
> +  compatible:
> +    const: atmel,hlcdc-display-controller
> +
> +  "#address-cells":
> +    const: 1
> +  "#size-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +patternProperties:
> +  "^port@[0-9]$":
> +    type: object
> +    description: |
> +      A port node with endpoint definitions as defined in
> +      ../../media/video-interfaces.txt
> +
> +    properties:
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +      reg:
> +        maxItems: 1
> +        description: The virtual number of the port
> +
> +    patternProperties:
> +      "^endpoint(@[0-9])$":

I guess you meant ^endpoint(@[0-9])?$ instead?

> +        type: object
> +
> +        properties:
> +          reg:
> +            maxItems: 1
> +            description: The virtual number of the endpoint
> +
> +          bus-width:
> +            enum: [12, 16, 18, 24]
> +            description:
> +              Any endpoint node may specify a desired video interface
> +              according to ../../media/video-interfaces.txt, specifically
> +              Recognized values are <12>, <16>, <18> and <24>, and
> +              override any output mode selection heuristic, forcing
> +              "rgb444", "rgb565", "rgb666" and "rgb888" respectively.
> +
> +          remote-endpoint:
> +            $ref: /schemas/types.yaml#/definitions/phandle
> +            description:
> +              phandle to the panel node
> +
> +        required:
> +          - reg

And if so, reg depends on whether the unit-address is set or not, so
you can't really enforce that.

> diff --git a/Documentation/devicetree/bindings/mfd/atmel-hlcdc.yaml b/Documentation/devicetree/bindings/mfd/atmel-hlcdc.yaml
> new file mode 100644
> index 000000000000..cad14fa173a1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/atmel-hlcdc.yaml
> @@ -0,0 +1,78 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/atmel-hlcdc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Device-Tree bindings for Atmel's HLCDC (High LCD Controller)
> +
> +maintainers:
> +  - Sam Ravnborg <sam@ravnborg.org>
> +  - Boris Brezillon <bbrezillon@kernel.org>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - atmel,at91sam9n12-hlcdc
> +      - atmel,at91sam9x5-hlcdc
> +      - atmel,sama5d2-hlcdc
> +      - atmel,sama5d3-hlcdc
> +      - atmel,sama5d4-hlcdc
> +      - microchip,sam9x60-hlcdc
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 3

Having descirptions of what those clocks are would be nice.

> +  clock-names:
> +    maxItems: 3
> +    items:
> +      - const: periph_clk
> +      - const: sys_clk
> +      - const: slow_clk
> +
> +  interrupts:
> +    description: The HLCDC interrupt line
> +    maxItems: 1
> +
> +  hlcdc_pwm:
> +    type: object
> +    description: |
> +      PWM controller - used for backlight.
> +      See ../pwm/atmel-hlcdc-pwm.yaml for details
> +
> +  hlcdc-display-controller:
> +    type: object
> +    description: |
> +      LCD display controller
> +      See ../display/atmel/hlcdc-dc.yaml for details

I guess you could include those two schemas to make sure that it's
valid? Otherwise, if you have an hlcdc-display-controller (or pwm)
node without a compatible, it will not be checked here, and will not
be checked by the hlcdc-dc.yaml schemas either since it matches on the
compatible.

Maxime

--jmsbjzfjeb57pove
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXpV0EwAKCRDj7w1vZxhR
xdwLAQC4by4PgosznV+p4IdHObNQzfxqPCjqjhyEcpaRB6WTDQEA4IURhU5p2H7t
kBc5B8X3W23gG4cKdAEc7QBEdFBZcA0=
=9LzM
-----END PGP SIGNATURE-----

--jmsbjzfjeb57pove--
