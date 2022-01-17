Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 661564907F6
	for <lists+linux-media@lfdr.de>; Mon, 17 Jan 2022 12:57:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234066AbiAQL50 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jan 2022 06:57:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233880AbiAQL5V (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jan 2022 06:57:21 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E77ABC061574;
        Mon, 17 Jan 2022 03:57:20 -0800 (PST)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4B4C7596;
        Mon, 17 Jan 2022 12:57:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1642420639;
        bh=qLxZv4/iN1vLf/Bl6rgeZJek4+Y+dQD95HWELwIHI8s=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=t3X3MTI98MeASySsGJQdNvC13yDji2u4t5KIPxHrh+iyGJNlculzYygazXibuvUvx
         5bhRywtgMat25M2hMp54lblSg3w8ETJ+3FammpiUaMGn4YoreZuYjKEpxq8W29Nr2g
         EQPP72y3wpW9k4E0IDwrJEccTkTtqc5fDWLNGMy4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211216163439.139579-3-jacopo+renesas@jmondi.org>
References: <20211216163439.139579-1-jacopo+renesas@jmondi.org> <20211216163439.139579-3-jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v8 2/7] dt-bindings: media: max9286: Define 'maxim,gpio-poc'
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Niklas =?utf-8?q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Date:   Mon, 17 Jan 2022 11:57:16 +0000
Message-ID: <164242063681.10801.10113230520314086360@Monstersaurus>
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Quoting Jacopo Mondi (2021-12-16 16:34:34)
> Define a new vendor property in the maxim,max9286 binding schema.
>=20
> The new property allows to declare that the remote camera
> power-over-coax is controlled by one of the MAX9286 gpio lines.
>=20
> As it is currently not possible to establish a regulator as consumer
> of the MAX9286 gpio controller for this purpose, the property allows to
> declare that the camera power is controlled by the MAX9286 directly.
>=20
> The property accepts a gpio-index (0 or 1) and one line polarity
> flag as defined by dt-bindings/gpio/gpio.h.
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  .../bindings/media/i2c/maxim,max9286.yaml     | 67 ++++++++++++++++++-
>  1 file changed, 66 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.ya=
ml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> index ab4e7a620362..90315e217003 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> @@ -70,6 +70,28 @@ properties:
>        a remote serializer whose high-threshold noise immunity is not ena=
bled
>        is 100000 micro volts
> =20
> +  maxim,gpio-poc:
> +    $ref: '/schemas/types.yaml#/definitions/uint32-array'
> +    minItems: 2
> +    maxItems: 2
> +    description: |
> +      Index of the MAX9286 gpio output line (0 or 1) that controls Power=
 over
> +      Coax to the cameras and its associated polarity flag.
> +
> +      The property accepts an array of two unsigned integers, the first =
being
> +      the gpio line index (0 or 1) and the second being the gpio line po=
larity
> +      flag (GPIO_ACTIVE_HIGH or GPIO_ACTIVE_LOW) as defined in
> +      <include/dt-bindings/gpio/gpio.h>.
> +
> +      When the remote cameras power is controlled by one of the MAX9286 =
gpio
> +      lines, this property has to be used to specify which line among th=
e two
> +      available ones controls the remote camera power enablement.
> +
> +      When this property is used it is not possible to register a gpio
> +      controller as the gpio lines are controlled directly by the MAX928=
6 and
> +      not available for consumers, nor the 'poc-supply' property should =
be
> +      specified.
> +
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
> =20
> @@ -165,7 +187,16 @@ required:
>    - reg
>    - ports
>    - i2c-mux
> -  - gpio-controller
> +
> +# If 'maxim,gpio-poc' is present, then 'poc-supply' and 'gpio-controller'
> +# are not allowed.
> +if:
> +  required:
> +    - maxim,gpio-poc
> +then:
> +  properties:
> +    poc-supply: false
> +    gpio-controller: false
> =20
>  additionalProperties: false
> =20
> @@ -310,4 +341,38 @@ examples:
>                  };
>              };
>          };
> +
> +        /*
> +        * Example of a deserializer that controls the camera Power over =
Coax

Indentation seems broken...

> +        * through one of its gpio lines.
> +        */
> +        gmsl-deserializer@6c {
> +            compatible =3D "maxim,max9286";
> +            reg =3D <0x6c>;
> +            enable-gpios =3D <&gpio 14 GPIO_ACTIVE_HIGH>;
> +
> +            /*
> +            * The remote camera power is controlled by MAX9286 GPIO line=
 #0.
> +            * No 'poc-supply' nor 'gpio-controller' are specified.
> +            */
> +            maxim,gpio-poc =3D <0 GPIO_ACTIVE_LOW>;
> +
> +            /*
> +            * Do not describe connections as they're the same as in the =
previous

Here too,

This seems like a simple way to describe this without hitting the
circular dependency loops I was facing when I looked at this. I'm sorry
it took me until v8 to find this out ;-)

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> +            * example.
> +            */
> +            ports {
> +                #address-cells =3D <1>;
> +                #size-cells =3D <0>;
> +
> +                port@4 {
> +                    reg =3D <4>;
> +                };
> +            };
> +
> +            i2c-mux {
> +                #address-cells =3D <1>;
> +                #size-cells =3D <0>;
> +            };
> +        };
>      };
> --=20
> 2.33.1
>
