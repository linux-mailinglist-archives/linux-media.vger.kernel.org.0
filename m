Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6721C4D6E2A
	for <lists+linux-media@lfdr.de>; Sat, 12 Mar 2022 11:31:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231148AbiCLKcL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Mar 2022 05:32:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230371AbiCLKcF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Mar 2022 05:32:05 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E44EE23DE85
        for <linux-media@vger.kernel.org>; Sat, 12 Mar 2022 02:30:59 -0800 (PST)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4C1C53F79D
        for <linux-media@vger.kernel.org>; Sat, 12 Mar 2022 10:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1647081058;
        bh=j2V/KUxiHqc+0Z6K00nFXFKy/NzWQiF3+GmyvFdBivI=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=nNI0kBzph1Ms5SE2/qusGlwZpNUQW5iAwa5dHlqH4tSr3LRT7Xlt1gfmyxy3WneT7
         uPMYBNX/Qo9v8QJXSXzUy63Sn7EYB8UvH4rf0xDG7JTnFEjByhxI7/8hcPUE5O/1AX
         HeWF6NCEC31dgCAjO6Z0R09DVQsj/SlU9ejKQ+fK/yEuXmXQdK0JC0ok55guhAqlkv
         pvSbZimPal7dFjb10bSvQkpG6jqDdxyk+bqRT37skFI5vi2b3ZpOgn75jBPO+QxT5i
         Zbk5bKxdE8gg4IL38ci9i6MDn2FSzCi4DXPwI+Iy+lpkCT8xwSauQ/2KSbPzg+l/R4
         SXoQXkKBYTRmw==
Received: by mail-ej1-f72.google.com with SMTP id hr26-20020a1709073f9a00b006d6d1ee8cf8so6124568ejc.19
        for <linux-media@vger.kernel.org>; Sat, 12 Mar 2022 02:30:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=j2V/KUxiHqc+0Z6K00nFXFKy/NzWQiF3+GmyvFdBivI=;
        b=zEJn+bjRxsW1QhfFfqUvTPt+4WkEksMgb8cug3ozgetPwM9rtC99xw56r2GsTlxzyW
         7+Sl6njhuQDOYPiPVL/VxKtEVP3oYbXukDuxqdv75qzQb1fOU9VrYsPolb4vhz3+FaXM
         zaNbJRvruOVIarkxjxMLp8T9MWBk4VsuI+8cAOmZN0faY5d38xUArqeiZKlw5/Fs6XOi
         ukptqUGeCifvXfa1qhbjjMiRQos67DnnBOkA1JfR7aVSQxCLh2hWJChvSx1tWGQPzhWY
         j18ZIFNIDJBV5J4TbLEDgyZ2NN3Xkz+WCCPUAIhoZUPogvUnaeJBmcXQ4I8X9/ffS51w
         q8Rw==
X-Gm-Message-State: AOAM532zVKzier774zTlD1vPdAXePQ0N6reNSemRnJEUpbC7Pl2Jgs0x
        Kuo2/whlzK4ActpZEj+VQ5vOsN2BBi5B2oI4L6rHUCAPNqZUDfoAtV/Mh44biGjFd1+DfNWzYdf
        OUI62prM9HkEWFTxwQrbGBKlFhGvSUOOCB3Z/SBIX
X-Received: by 2002:a17:906:3144:b0:6ce:de5d:5e3b with SMTP id e4-20020a170906314400b006cede5d5e3bmr12030981eje.689.1647081057521;
        Sat, 12 Mar 2022 02:30:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy71+evCpi6+Mi8YKxGgqzbdqbQ9b9ELPlodTfx8eTiRZultwyBotE/NZ9sq37I6sHZ88ZXEA==
X-Received: by 2002:a17:906:3144:b0:6ce:de5d:5e3b with SMTP id e4-20020a170906314400b006cede5d5e3bmr12030970eje.689.1647081057300;
        Sat, 12 Mar 2022 02:30:57 -0800 (PST)
Received: from [192.168.0.148] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id p15-20020a170906784f00b006ccb9e1278csm4091263ejm.6.2022.03.12.02.30.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Mar 2022 02:30:56 -0800 (PST)
Message-ID: <13b67ef0-8031-fb99-5c57-05ea07f14975@canonical.com>
Date:   Sat, 12 Mar 2022 11:30:55 +0100
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
 <7eb33fe1-2470-7096-b77b-d147c2e55fec@canonical.com>
 <20220311160524.wyfk5vj33xt4umgi@uno.localdomain>
 <5f81a066-0d28-59ed-ec55-3861766025e6@canonical.com>
 <20220311180024.duxcap6yjv6slx2t@uno.localdomain>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220311180024.duxcap6yjv6slx2t@uno.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/03/2022 19:00, Jacopo Mondi wrote:
> Hi Krzysztof
> 
> On Fri, Mar 11, 2022 at 05:11:47PM +0100, Krzysztof Kozlowski wrote:
>> On 11/03/2022 17:05, Jacopo Mondi wrote:
>>> Hi Krzysztof,
>>>
>>> On Thu, Mar 10, 2022 at 06:26:02PM +0100, Krzysztof Kozlowski wrote:
>>>> On 10/03/2022 18:16, Jacopo Mondi wrote:
>>>>> Hi Krzysztof
>>>>>
>>>>> On Thu, Mar 10, 2022 at 03:29:24PM +0100, Krzysztof Kozlowski wrote:
>>>>>> On 10/03/2022 14:08, Jacopo Mondi wrote:
>>>>>>> Provide the bindings documentation for Omnivision OV5670 image sensor.
>>>>>>>
>>>>>>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
>>>>>>> ---
>>>>>>>  .../devicetree/bindings/media/i2c/ov5670.yaml | 93 +++++++++++++++++++
>>>>>>
>>>>>> Add the file to maintainers entry.
>>>>>>
>>>>>
>>>>> Right
>>>>>
>>>>>>>  1 file changed, 93 insertions(+)
>>>>>>>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov5670.yaml
>>>>>>>
>>>>>>> diff --git a/Documentation/devicetree/bindings/media/i2c/ov5670.yaml b/Documentation/devicetree/bindings/media/i2c/ov5670.yaml
>>>>>>> new file mode 100644
>>>>>>> index 000000000000..dc4a3297bf6f
>>>>>>> --- /dev/null
>>>>>>> +++ b/Documentation/devicetree/bindings/media/i2c/ov5670.yaml
>>>>>>
>>>>>> Missing vendor prefix in file name.
>>>>>>
>>>>>
>>>>> Right x2
>>>>>
>>>>>>> @@ -0,0 +1,93 @@
>>>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>>>> +%YAML 1.2
>>>>>>> +---
>>>>>>> +$id: http://devicetree.org/schemas/media/i2c/ov5670.yaml#
>>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>>> +
>>>>>>> +title: Omnivision OV5670 5 Megapixels raw image sensor
>>>>>>> +
>>>>>>> +maintainers:
>>>>>>> +  - Jacopo Mondi <jacopo@jmondi.org>
>>>>>>
>>>>>> Please add also driver maintainer.
>>>>>>
>>>>>
>>>>> I never got what the policy was, if the maintainer entries here only
>>>>> refer to the binding file or to the driver too
>>>>
>>>> It is a person responsible for the bindings, so indeed it might not feed
>>>> existing maintainer.
>>>>
>>>>>
>>>>>>> +
>>>>>>> +description: |-
>>>>>>> +  The OV5670 is a 5 Megapixels raw image sensor which provides images in 10-bits
>>>>>>> +  RAW BGGR Bayer format on a 2 data lanes MIPI CSI-2 serial interface and is
>>>>>>> +  controlled through an I2C compatible control bus.
>>>>>>> +
>>>>>>> +properties:
>>>>>>> +  compatible:
>>>>>>> +    const: ovti,ov5670
>>>>>>> +
>>>>>>> +  reg:
>>>>>>> +    maxItems: 1
>>>>>>> +
>>>>>>> +  clock-frequency:
>>>>>>> +    description: Frequency of the xclk clock.
>>>>>>
>>>>>> Is the xclk external clock coming to the sensor? If yes, there should be
>>>>>> a "clocks" property.
>>>>>>
>>>>>
>>>>> To be honest I was not sure about this, as clock-frequency is already
>>>>> used by the driver for the ACPI part, but it seems to in DT bindings
>>>>> it is a property meant to be specified in the clock providers, even if
>>>>> Documentation/devicetree/bindings/clock/clock-bindings.txt doesn't
>>>>> really clarify this
>>>>>
>>>>> Clock consumer should rather use 'clocks' and point to the provider's
>>>>> phandle if my understanding is right.
>>>>
>>>> This is a clock-frequency, not clock reference. For external clocks, a
>>>
>>> Yes, I was suggesting to replace clock-frequency with clocks, that
>>> accepts a phandle.
>>>
>>> The thing is, the driver parses 'clock-frequency'
>>> 	device_property_read_u32(&client->dev, "clock-frequency", &input_clk);
>>>
>>> which I assume comes from ACPI (as the driver was developed for an
>>> ACPI platform).
>>>
>>> If in DTS we don't use it, I then need to
>>>
>>> #ifdef CONFIG_ACPI
>>>
>>> #elif defined CONFIG_OF
>>>
>>> #endif
>>>
>>> Which I would really like to avoid.
>>>
>>> Anyone with ACPI experience that knows where clock-frequency comes
>>> from ?
>>
>> I would assume that ACPI simply does not support common clock framework,
>> so it had to use clock-frequency. Several of such drivers were added by
>> folks from Intel which use ACPI, not Devicetree.
>>
>>>
>>>> clock phandles + assigned-clock-rates should be rather used. However for
>>>> internal clocks, this is a perfectly valid property.
>>>>
>>>> Therefore the question is - what is the "xclk"?
>>>
>>> xclk is the clock fed to the sensor, which which all its internal
>>> clocks are generated, so it's indeed an 'external' clock. As I've
>>> said, clock-frequency seems to be meant for clock providers, and
>>> the image sensor is a clock consumer.
>>
>> Regardless whether clock-frequency stays or not, you need the clocks
>> property in such case.
>>
> 
> Yes, I will have to ifdef in the driver if no better alternatives

I do not see the need of ifdefs... BTW, imx258 has exactly that case -
clock-frequency coming from ACPI world but not added to DT bindings.

Best regards,
Krzysztof
