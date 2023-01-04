Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D3B065CEE2
	for <lists+linux-media@lfdr.de>; Wed,  4 Jan 2023 10:00:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233543AbjADI7f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Jan 2023 03:59:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbjADI7J (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Jan 2023 03:59:09 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFF491F2;
        Wed,  4 Jan 2023 00:59:07 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 582D46C7;
        Wed,  4 Jan 2023 09:59:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1672822744;
        bh=X4caveR8pcG+lsAtnOYm8ZzzqR5wLDb9yHb7Nz59WIs=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=VkBvjaRSuvrQF35+gGbVJo9ejV7VMTl8XW9Lu58F7TtMYjdWjufTL5npH4QOca+2R
         gJJL8Jb4YVEfwqVYQIF6J3+xAxbLLuxqHqLfForz/MIcI+6niAUG7vBXk+vBi4jZFe
         NCnWRPXSIQaSSoMC37ZollMukUXW3qQYGJ0SrDbc=
Message-ID: <67f2998e-131f-a4f9-1434-8e0f5bd90bd7@ideasonboard.com>
Date:   Wed, 4 Jan 2023 10:59:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 5/8] dt-bindings: media: add bindings for TI DS90UB960
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Shawn Tu <shawnx.tu@intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        =?UTF-8?Q?Krzysztof_Ha=c5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>
References: <20221208104006.316606-1-tomi.valkeinen@ideasonboard.com>
 <20221208104006.316606-6-tomi.valkeinen@ideasonboard.com>
 <Y5YaMpbj1WTTIp3B@pendragon.ideasonboard.com>
 <99372b9d-2050-2040-6b29-a1939c2e0c95@ideasonboard.com>
 <Y6nRWpWvWZ++V1KP@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <Y6nRWpWvWZ++V1KP@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26/12/2022 18:52, Laurent Pinchart wrote:
> Hi Tomi,
> 
> On Tue, Dec 13, 2022 at 04:25:46PM +0200, Tomi Valkeinen wrote:
>> On 11/12/2022 19:58, Laurent Pinchart wrote:
>>> On Thu, Dec 08, 2022 at 12:40:03PM +0200, Tomi Valkeinen wrote:
>>>> Add DT bindings for TI DS90UB960 FPDLink-3 Deserializer.
>>>>
>>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>>> ---
>>>>    .../bindings/media/i2c/ti,ds90ub960.yaml      | 358 ++++++++++++++++++
>>>>    1 file changed, 358 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
>>>> new file mode 100644
>>>> index 000000000000..d8b5e219d420
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
>>>> @@ -0,0 +1,358 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/media/i2c/ti,ds90ub960.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Texas Instruments DS90UB9XX Family FPD-Link Deserializer Hubs
>>>> +
>>>> +maintainers:
>>>> +  - Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>>> +
>>>> +description:
>>>> +  The TI DS90UB9XX devices are FPD-Link video deserializers with I2C and GPIO
>>>> +  forwarding.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    enum:
>>>> +      - ti,ds90ub960-q1
>>>> +      - ti,ds90ub9702-q1
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +    description:
>>>> +      i2c addresses for the deserializer and the serializers
>>>
>>> s/i2c/I2C/
>>>
>>> Same below.
>>>
>>> A bit more details would be nice, for instance the order in which
>>> addresses should be specified should be documented. The example below
>>> has one address only, so it's quite unclear. Or is this a left-over,
>>> from before the i2c-alias-pool ?
>>
>> That's a left over, but not related to i2c-alias-pool but the i2c-alias
>> for the serializers. It already says above 'maxItems: 1', so now it only
>> contains the deserializer address. I'll drop the desc.
> 
> Looks good to me.
> 
>>>> +
>>>> +  clocks:
>>>> +    maxItems: 1
>>>> +    description:
>>>> +      Reference clock connected to the REFCLK pin.
>>>> +
>>>> +  clock-names:
>>>> +    items:
>>>> +      - const: refclk
>>>> +
>>>> +  powerdown-gpios:
>>>> +    maxItems: 1
>>>> +    description:
>>>> +      Specifier for the GPIO connected to the PDB pin.
>>>> +
>>>> +  i2c-alias-pool:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint16-array
>>>> +    description:
>>>> +      i2c alias pool is a pool of i2c addresses on the main i2c bus that can be
>>>> +      used to access the remote peripherals. The addresses must be available,
>>>> +      not used by any other peripheral. Each remote peripheral is assigned an
>>>> +      alias from the pool, and transactions to that address will be forwarded
>>>> +      to the remote peripheral, with the address translated to the remote
>>>> +      peripheral's real address.
>>>
>>> As this property is optional, should you describe what happens when it's
>>> not specified ?
>>>
>>> I would also indicate that the pool doesn't cover the serializers, only
>>> the devices behind them.
>>
>> Yep, I'll clarify these.
>>
>>>> +
>>>> +  links:
>>>> +    type: object
>>>> +    additionalProperties: false
>>>> +
>>>> +    properties:
>>>> +      '#address-cells':
>>>> +        const: 1
>>>> +
>>>> +      '#size-cells':
>>>> +        const: 0
>>>> +
>>>> +      ti,manual-strobe:
>>>> +        type: boolean
>>>> +        description:
>>>> +          Enable manual strobe position and EQ level
>>>> +
>>>> +    patternProperties:
>>>> +      '^link@[0-9a-f]+$':
>>>
>>> There can be up to 4 links only, right ? I would then use
>>>
>>>         '^link@[0-3]$':
>>
>> Yes, I'll change that.
>>
>>>> +        type: object
>>>> +        additionalProperties: false
>>>> +        properties:
>>>> +          reg:
>>>> +            description: The link number
>>>> +            maxItems: 1
>>>> +
>>>> +          i2c-alias:
>>>> +            description:
>>>> +              The i2c address used for the serializer. Transactions to this
>>>> +              address on the i2c bus where the deserializer resides are
>>>> +              forwarded to the serializer.
>>>> +
>>>> +          ti,rx-mode:
>>>> +            $ref: /schemas/types.yaml#/definitions/uint32
>>>> +            enum:
>>>> +              - 0 # RAW10
>>>> +              - 1 # RAW12 HF
>>>> +              - 2 # RAW12 LF
>>>> +              - 3 # CSI2 SYNC
>>>> +              - 4 # CSI2 NON-SYNC
>>>> +            description: FPD-Link Input Mode
>>>
>>> Are there use cases for controlling this dynamically (in particular the
>>> sync/non-sync modes) ? Is there anything that could be queried at
>>> runtime from the serializers instead of being specified in DT ?
>>
>> We need a link to the serializer before we can query anything from the
>> serializer.
> 
> I meant querying it from the serializer driver, not the serializer
> hardware. This being said, it would likely be difficult to do so, as the
> serializer driver would need to probe first. I think I'm thus fine
> selecting the mode in DT on the deserializer side.
> 
>> To have a link, we need the mode... So, as I mentioned in
>> the other reply, we could define these in some way in the serializer's
>> properties instead of here, but I'm not sure if that's a good change.
>>
>> The driver can change the mode at runtime (say, from sync to non-sync
>> mode, if the HW supports that). But I think this property should reflect
>> the HW strapped configuration of the serializer.
> 
> That would possibly work for the DS90UB953, but the DS90UB913 has no
> strapped mode selected at boot time but is instead configured
> automatically through the back-channel (see my last reply to patch 3/8).

Indeed.

> When connecting a DS90UB913 to a DS90UB914 deserializer, we can probably
> start without mode selection in software, as the MODE pin is meant to
> bootstrap that to a correct value which is then automatically
> transmitted to the serializer (hardware designs where the mode would
> need to be overridden should be rate). However, when connecting multiple

I don't know if that's true. I guess it depends on how you see the deser 
and the camera module. Are they part of the same HW design or not? In my 
setups they are quite separate, and I connect different kinds of camera 
modules to my deserializers. But I can see that if you create a, say, 
car, you'd have both sides known at design time and would never change.

> DS90UB913 to a DS90UB960, I can imagine connecting different types of
> cameras on the four input ports, so the need to specify the mode
> per-port in DT would be more common.

Right, and even with UB914, you might well design the deserializer side 
with, say, RAW10 sensors, but later in the cycle you'd need to change to 
a RAW12 sensor. Depending on the deser mode strap would require you to 
do a HW change on the deser side too.

As I said in the other mail, I don't like the deser's strap, and I think 
we should just basically ignore it as we can provide the necessary data 
in the DT.

> For these reasons, I don't think the ti,rx-mode property can be defined
> as reflecting the hardware MODE strap with the DS90UB913. I also think
> it would be quite confusing to define it as the desired runtime
> configuration for the DS90UB913 and as the hardware MODE strap for the
> DS90UB953. Could it be (explicitly) defined as the desired runtime
> configuration in all cases ?

That sounds bad in a DT context =). You're right that the rx-mode can't 
be defined as reflecting the serializer mode strap, but I think we can 
define it as reflecting the default operation mode of the serializer 
hardware (or maybe rather the camera module).

  Tomi

