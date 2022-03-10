Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F04B4D5066
	for <lists+linux-media@lfdr.de>; Thu, 10 Mar 2022 18:26:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242316AbiCJR1L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Mar 2022 12:27:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239261AbiCJR1I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Mar 2022 12:27:08 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 363B1255A4
        for <linux-media@vger.kernel.org>; Thu, 10 Mar 2022 09:26:06 -0800 (PST)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id F393B3F312
        for <linux-media@vger.kernel.org>; Thu, 10 Mar 2022 17:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646933165;
        bh=uqyFTSemI9/cH6f7bE6a+tAm1VhsT+/e17pHuuHIz6Y=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=HgyIicL4XwTx4Xp1F1KOJ0xlwIMr3JlXlkR8dF0367DU5OGJTMRYCX+j39kNYzX2I
         NhdY4ErSVjRDwwKjIoOWymzAQ+4rB+LsYccHX/gZ7yLQJfRdw+fzh30OFtuBGVgXQ2
         iJ50Tbvna97fW/8Rk1CZaXOUBy4yLKoBrpsX7XTrLHjOGrQDcrB1LzXXYI4kv07fkX
         JzIP9Gv0SIaJ6Lce3heuyKYkBF+W0yYOB2ycsow3tToAR912PEcfYZcDNC8FTAGcOk
         pnJoBrnvk4PSyDa/T/FEsNu5Nyw2ltuhEoTRG8sgdR26BPwkLBcqSIBSzBn1vLG9Ql
         BGRTZ6oRN8z/Q==
Received: by mail-ed1-f72.google.com with SMTP id l14-20020a056402344e00b0041593c729adso3487431edc.18
        for <linux-media@vger.kernel.org>; Thu, 10 Mar 2022 09:26:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=uqyFTSemI9/cH6f7bE6a+tAm1VhsT+/e17pHuuHIz6Y=;
        b=3Yq/M2xAMulaAldUugyChg9Shwjlo1PijYcresccQqD1Vwrt5+gzwztKyrlUz2MV5K
         DPyDv37FAxLCS4H6SW+MMB4bN3+VGceNRUCJrbTpfHNHSlfytX8HKssX31PhuevWjp/t
         K1tI3iLOQsqFPj2DRrcp1L4JNYKDgpakQyuRyTtkyhX+UannwmXUyDkYfs7TciZMbQ0F
         mWL8vt/oiRhVzFngR1+b0kvXRgUCC5DS6WDkX/8oTC3ljwcWfdRHdNKP7a2dW25HOvB0
         A653RhGt0zFTMqBeo8zTa0Lko+jCz2w9Rlxu1VSKirNKNGAMk193/f0OHiEgHgqUelQN
         ByEg==
X-Gm-Message-State: AOAM53202qvLtHj3R0J9DKJUFWhRTTw2n4rXdbk6CnsMljoDg0ybouAq
        pWPpchQo3p8Sp3h2VP3QYRuMsGgTUagZisduwqaIfmfVosDodRpPyLkux2KcMb4oChWAL/Q4sqT
        t8bzXagwIleaOExtIN094CrwxpiOLhHm5OC+bcPvF
X-Received: by 2002:a05:6402:6c3:b0:415:ffc9:3a09 with SMTP id n3-20020a05640206c300b00415ffc93a09mr5409304edy.403.1646933163867;
        Thu, 10 Mar 2022 09:26:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyLzGlfcKH7FfVFJiUSulm+6aK3FOqSIKdewDsnBdfE62vB/CvhDh+FLBtgu0wroxckeEHn4Q==
X-Received: by 2002:a05:6402:6c3:b0:415:ffc9:3a09 with SMTP id n3-20020a05640206c300b00415ffc93a09mr5409282edy.403.1646933163599;
        Thu, 10 Mar 2022 09:26:03 -0800 (PST)
Received: from [192.168.0.147] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id j5-20020a056402238500b00416c32d548esm523027eda.59.2022.03.10.09.26.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Mar 2022 09:26:03 -0800 (PST)
Message-ID: <7eb33fe1-2470-7096-b77b-d147c2e55fec@canonical.com>
Date:   Thu, 10 Mar 2022 18:26:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/6] media: dt-bindings: i2c: Document ov5670
Content-Language: en-US
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        jeanmichel.hautbois@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, paul.kocialkowski@bootlin.com,
        sakari.ailus@iki.fi, paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "open list:OMNIVISION OV5670 SENSOR DRIVER" 
        <linux-media@vger.kernel.org>, robh@kernel.org,
        devicetree@vger.kernel.org
References: <20220310130829.96001-1-jacopo@jmondi.org>
 <20220310130829.96001-2-jacopo@jmondi.org>
 <d7e2a189-2773-b37a-7449-0b5138e45ded@canonical.com>
 <20220310171634.qiqnq376qizrqhw5@uno.localdomain>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220310171634.qiqnq376qizrqhw5@uno.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/03/2022 18:16, Jacopo Mondi wrote:
> Hi Krzysztof
> 
> On Thu, Mar 10, 2022 at 03:29:24PM +0100, Krzysztof Kozlowski wrote:
>> On 10/03/2022 14:08, Jacopo Mondi wrote:
>>> Provide the bindings documentation for Omnivision OV5670 image sensor.
>>>
>>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
>>> ---
>>>  .../devicetree/bindings/media/i2c/ov5670.yaml | 93 +++++++++++++++++++
>>
>> Add the file to maintainers entry.
>>
> 
> Right
> 
>>>  1 file changed, 93 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov5670.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/i2c/ov5670.yaml b/Documentation/devicetree/bindings/media/i2c/ov5670.yaml
>>> new file mode 100644
>>> index 000000000000..dc4a3297bf6f
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/media/i2c/ov5670.yaml
>>
>> Missing vendor prefix in file name.
>>
> 
> Right x2
> 
>>> @@ -0,0 +1,93 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/media/i2c/ov5670.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Omnivision OV5670 5 Megapixels raw image sensor
>>> +
>>> +maintainers:
>>> +  - Jacopo Mondi <jacopo@jmondi.org>
>>
>> Please add also driver maintainer.
>>
> 
> I never got what the policy was, if the maintainer entries here only
> refer to the binding file or to the driver too

It is a person responsible for the bindings, so indeed it might not feed
existing maintainer.

> 
>>> +
>>> +description: |-
>>> +  The OV5670 is a 5 Megapixels raw image sensor which provides images in 10-bits
>>> +  RAW BGGR Bayer format on a 2 data lanes MIPI CSI-2 serial interface and is
>>> +  controlled through an I2C compatible control bus.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: ovti,ov5670
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  clock-frequency:
>>> +    description: Frequency of the xclk clock.
>>
>> Is the xclk external clock coming to the sensor? If yes, there should be
>> a "clocks" property.
>>
> 
> To be honest I was not sure about this, as clock-frequency is already
> used by the driver for the ACPI part, but it seems to in DT bindings
> it is a property meant to be specified in the clock providers, even if
> Documentation/devicetree/bindings/clock/clock-bindings.txt doesn't
> really clarify this
> 
> Clock consumer should rather use 'clocks' and point to the provider's
> phandle if my understanding is right.

This is a clock-frequency, not clock reference. For external clocks, a
clock phandles + assigned-clock-rates should be rather used. However for
internal clocks, this is a perfectly valid property.

Therefore the question is - what is the "xclk"?

> 
>>> +
>>> +  pwdn-gpios:
>>> +    description: Reference to the GPIO connected to the PWDNB pin. Active low.
>>
>> maxItems
>>
> 
> I thought it was not necessary with a single description: entry. But
> looking at the dt-schema source I fail to find any commit mentioning
> that.

The purpose of maxItems is to constrain the number of GPIOs, so two
would be incorrect.

> 
>>> +
>>> +  reset-gpios:
>>> +    description:
>>> +      Reference to the GPIO connected to the XSHUTDOWN pin. Active low.
>>
>> maxItems
>>
>>> +
>>> +  avdd-supply:
>>> +    description: Analog circuit power. Typically 2.8V.
>>> +
>>> +  dvdd-supply:
>>> +    description: Digital circuit power. Typically 1.2V.
>>> +
>>> +  dovdd-supply:
>>> +    description: Digital I/O circuit power. Typically 2.8V or 1.8V.
>>> +
>>> +  port:
>>> +    $ref: /schemas/graph.yaml#/$defs/port-base
>>> +    additionalProperties: false
>>> +
>>> +    properties:
>>> +      endpoint:
>>> +        $ref: /schemas/media/video-interfaces.yaml#
>>> +        unevaluatedProperties: false
>>> +
>>> +        properties:
>>> +          data-lanes:
>>> +            description: The sensor supports 1 or 2 data lanes operations.
>>> +            minItems: 1
>>> +            maxItems: 2
>>> +            items:
>>> +              maximum: 2
>>
>> Is '0' also allowed? If not then maybe 'enum: [ 1, 2 ]'
> 
> No 0 is not allowed, but the data-lanes properties should accept any
> of the following combinations
>         <1>
>         <1 2>
>         <2 1>
> 
> As the chip seems to support lane re-ordering.
> 
> using enum would allow to between <1> or <2> if I got it right?

Yeah, enum would be equivalent. I find it more readable, than min+max,
but it's not a strong preference.

> 
> as the data-lane property is defined in video-interfaces.yaml
> 
>   data-lanes:
>     $ref: /schemas/types.yaml#/definitions/uint32-array
>     minItems: 1
>     maxItems: 8
>     items:
>       # Assume up to 9 physical lane indices
>       maximum: 8
>     description:
>       An array of physical data lane indexes. Position of an entry determines
>       the logical lane number, while the value of an entry indicates physical
>       lane, e.g. for 2-lane MIPI CSI-2 bus we could have "data-lanes = <1 2>;",
>       assuming the clock lane is on hardware lane 0. If the hardware does not
>       support lane reordering, monotonically incremented values shall be used
>       from 0 or 1 onwards, depending on whether or not there is also a clock
>       lane. This property is valid for serial busses only (e.g. MIPI CSI-2).
> 
> I did the same but restricted the max number of items to 2, and the
> maximum value to 2 as well

Makes sense, but you should also restrict the minimum (so not 0). enum
solves this.

> 
>>
>> no clock-lanes?
>>
> 
> clock lane is fixed on lane #0 afaict

ok


Best regards,
Krzysztof
