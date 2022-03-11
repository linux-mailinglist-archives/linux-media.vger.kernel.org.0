Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E77074D65BB
	for <lists+linux-media@lfdr.de>; Fri, 11 Mar 2022 17:05:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350096AbiCKQGh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Mar 2022 11:06:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350093AbiCKQGf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Mar 2022 11:06:35 -0500
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6EAF1D0D46;
        Fri, 11 Mar 2022 08:05:29 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id D9F4B1C0006;
        Fri, 11 Mar 2022 16:05:25 +0000 (UTC)
Date:   Fri, 11 Mar 2022 17:05:24 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        jeanmichel.hautbois@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, paul.kocialkowski@bootlin.com,
        sakari.ailus@iki.fi, paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "open list:OMNIVISION OV5670 SENSOR DRIVER" 
        <linux-media@vger.kernel.org>, robh@kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/6] media: dt-bindings: i2c: Document ov5670
Message-ID: <20220311160524.wyfk5vj33xt4umgi@uno.localdomain>
References: <20220310130829.96001-1-jacopo@jmondi.org>
 <20220310130829.96001-2-jacopo@jmondi.org>
 <d7e2a189-2773-b37a-7449-0b5138e45ded@canonical.com>
 <20220310171634.qiqnq376qizrqhw5@uno.localdomain>
 <7eb33fe1-2470-7096-b77b-d147c2e55fec@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7eb33fe1-2470-7096-b77b-d147c2e55fec@canonical.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krzysztof,

On Thu, Mar 10, 2022 at 06:26:02PM +0100, Krzysztof Kozlowski wrote:
> On 10/03/2022 18:16, Jacopo Mondi wrote:
> > Hi Krzysztof
> >
> > On Thu, Mar 10, 2022 at 03:29:24PM +0100, Krzysztof Kozlowski wrote:
> >> On 10/03/2022 14:08, Jacopo Mondi wrote:
> >>> Provide the bindings documentation for Omnivision OV5670 image sensor.
> >>>
> >>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> >>> ---
> >>>  .../devicetree/bindings/media/i2c/ov5670.yaml | 93 +++++++++++++++++++
> >>
> >> Add the file to maintainers entry.
> >>
> >
> > Right
> >
> >>>  1 file changed, 93 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov5670.yaml
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/media/i2c/ov5670.yaml b/Documentation/devicetree/bindings/media/i2c/ov5670.yaml
> >>> new file mode 100644
> >>> index 000000000000..dc4a3297bf6f
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/media/i2c/ov5670.yaml
> >>
> >> Missing vendor prefix in file name.
> >>
> >
> > Right x2
> >
> >>> @@ -0,0 +1,93 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/media/i2c/ov5670.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: Omnivision OV5670 5 Megapixels raw image sensor
> >>> +
> >>> +maintainers:
> >>> +  - Jacopo Mondi <jacopo@jmondi.org>
> >>
> >> Please add also driver maintainer.
> >>
> >
> > I never got what the policy was, if the maintainer entries here only
> > refer to the binding file or to the driver too
>
> It is a person responsible for the bindings, so indeed it might not feed
> existing maintainer.
>
> >
> >>> +
> >>> +description: |-
> >>> +  The OV5670 is a 5 Megapixels raw image sensor which provides images in 10-bits
> >>> +  RAW BGGR Bayer format on a 2 data lanes MIPI CSI-2 serial interface and is
> >>> +  controlled through an I2C compatible control bus.
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    const: ovti,ov5670
> >>> +
> >>> +  reg:
> >>> +    maxItems: 1
> >>> +
> >>> +  clock-frequency:
> >>> +    description: Frequency of the xclk clock.
> >>
> >> Is the xclk external clock coming to the sensor? If yes, there should be
> >> a "clocks" property.
> >>
> >
> > To be honest I was not sure about this, as clock-frequency is already
> > used by the driver for the ACPI part, but it seems to in DT bindings
> > it is a property meant to be specified in the clock providers, even if
> > Documentation/devicetree/bindings/clock/clock-bindings.txt doesn't
> > really clarify this
> >
> > Clock consumer should rather use 'clocks' and point to the provider's
> > phandle if my understanding is right.
>
> This is a clock-frequency, not clock reference. For external clocks, a

Yes, I was suggesting to replace clock-frequency with clocks, that
accepts a phandle.

The thing is, the driver parses 'clock-frequency'
	device_property_read_u32(&client->dev, "clock-frequency", &input_clk);

which I assume comes from ACPI (as the driver was developed for an
ACPI platform).

If in DTS we don't use it, I then need to

#ifdef CONFIG_ACPI

#elif defined CONFIG_OF

#endif

Which I would really like to avoid.

Anyone with ACPI experience that knows where clock-frequency comes
from ?

> clock phandles + assigned-clock-rates should be rather used. However for
> internal clocks, this is a perfectly valid property.
>
> Therefore the question is - what is the "xclk"?

xclk is the clock fed to the sensor, which which all its internal
clocks are generated, so it's indeed an 'external' clock. As I've
said, clock-frequency seems to be meant for clock providers, and
the image sensor is a clock consumer.

>
> >
> >>> +
> >>> +  pwdn-gpios:
> >>> +    description: Reference to the GPIO connected to the PWDNB pin. Active low.
> >>
> >> maxItems
> >>
> >
> > I thought it was not necessary with a single description: entry. But
> > looking at the dt-schema source I fail to find any commit mentioning
> > that.
>
> The purpose of maxItems is to constrain the number of GPIOs, so two
> would be incorrect.
>

I recall that with a single description entry then maxItems: 1 was
assumed by the dt-schema validator, but I cannot find references to
any commit, so I'll add it.

> >
> >>> +
> >>> +  reset-gpios:
> >>> +    description:
> >>> +      Reference to the GPIO connected to the XSHUTDOWN pin. Active low.
> >>
> >> maxItems
> >>
> >>> +
> >>> +  avdd-supply:
> >>> +    description: Analog circuit power. Typically 2.8V.
> >>> +
> >>> +  dvdd-supply:
> >>> +    description: Digital circuit power. Typically 1.2V.
> >>> +
> >>> +  dovdd-supply:
> >>> +    description: Digital I/O circuit power. Typically 2.8V or 1.8V.
> >>> +
> >>> +  port:
> >>> +    $ref: /schemas/graph.yaml#/$defs/port-base
> >>> +    additionalProperties: false
> >>> +
> >>> +    properties:
> >>> +      endpoint:
> >>> +        $ref: /schemas/media/video-interfaces.yaml#
> >>> +        unevaluatedProperties: false
> >>> +
> >>> +        properties:
> >>> +          data-lanes:
> >>> +            description: The sensor supports 1 or 2 data lanes operations.
> >>> +            minItems: 1
> >>> +            maxItems: 2
> >>> +            items:
> >>> +              maximum: 2
> >>
> >> Is '0' also allowed? If not then maybe 'enum: [ 1, 2 ]'
> >
> > No 0 is not allowed, but the data-lanes properties should accept any
> > of the following combinations
> >         <1>
> >         <1 2>
> >         <2 1>
> >
> > As the chip seems to support lane re-ordering.
> >
> > using enum would allow to between <1> or <2> if I got it right?
>
> Yeah, enum would be equivalent. I find it more readable, than min+max,
> but it's not a strong preference.
>

I don't think enum is equivalent, as it specifies a set of valid values
a property can assume, but it does not support arrays.

https://json-schema.org/draft/2020-12/json-schema-validation.html#rfc.section.6.16.1.2.

enum
  The value of this keyword MUST be an array. This array SHOULD have
  at least one element. Elements in the array SHOULD be unique.

  An instance validates successfully against this keyword if its value
  is equal to one of the elements in this keyword's array value.

In facts:

--- a/Documentation/devicetree/bindings/media/i2c/ov5670.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ov5670.yaml
@@ -52,10 +52,7 @@ properties:
         properties:
           data-lanes:
             description: The sensor supports 1 or 2 data lanes operations.
-            minItems: 1
-            maxItems: 2
-            items:
-              maximum: 2
+            enum: [1, 2]


Results in:

Documentation/devicetree/bindings/media/i2c/ov5670.example.dt.yaml: sensor@36: port:endpoint:data-lanes:0: [1, 2] is too long

If instead

--- a/Documentation/devicetree/bindings/media/i2c/ov5670.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ov5670.yaml
@@ -54,8 +54,7 @@ properties:
             description: The sensor supports 1 or 2 data lanes operations.
             minItems: 1
             maxItems: 2
-            items:
-              maximum: 2
+            enum: [1, 2]

I get
Documentation/devicetree/bindings/media/i2c/ov5670.yaml:
properties:port:properties:endpoint:properties:data-lanes:
'enum' should not be valid under {'enum': ['const', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'minimum', 'maximum', 'multipleOf', 'pattern']}
	hint: Scalar and array keywords cannot be mixed
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#

Thanks
   j

> >
> > as the data-lane property is defined in video-interfaces.yaml
> >
> >   data-lanes:
> >     $ref: /schemas/types.yaml#/definitions/uint32-array
> >     minItems: 1
> >     maxItems: 8
> >     items:
> >       # Assume up to 9 physical lane indices
> >       maximum: 8
> >     description:
> >       An array of physical data lane indexes. Position of an entry determines
> >       the logical lane number, while the value of an entry indicates physical
> >       lane, e.g. for 2-lane MIPI CSI-2 bus we could have "data-lanes = <1 2>;",
> >       assuming the clock lane is on hardware lane 0. If the hardware does not
> >       support lane reordering, monotonically incremented values shall be used
> >       from 0 or 1 onwards, depending on whether or not there is also a clock
> >       lane. This property is valid for serial busses only (e.g. MIPI CSI-2).
> >
> > I did the same but restricted the max number of items to 2, and the
> > maximum value to 2 as well
>
> Makes sense, but you should also restrict the minimum (so not 0). enum
> solves this.
>
> >
> >>
> >> no clock-lanes?
> >>
> >
> > clock lane is fixed on lane #0 afaict
>
> ok
>
>
> Best regards,
> Krzysztof
