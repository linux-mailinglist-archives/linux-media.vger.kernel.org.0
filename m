Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16EA0574B5B
	for <lists+linux-media@lfdr.de>; Thu, 14 Jul 2022 13:00:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238559AbiGNLAd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jul 2022 07:00:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238561AbiGNLAa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jul 2022 07:00:30 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04EB2558D9
        for <linux-media@vger.kernel.org>; Thu, 14 Jul 2022 04:00:29 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id t25so2171041lfg.7
        for <linux-media@vger.kernel.org>; Thu, 14 Jul 2022 04:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=LCa+aVIC89Z/IdQehPIP96zGnlcisprBcKManxPUAMk=;
        b=CRM+BxeMLtYC7p4g/ZUfBeHmme/BrPcvvrTNUtsRG8Tgg5bWYDqo0QV6xXxYwUoEL7
         g9CkTSkANxsbmskWS1ev7Of+YddNas91xaESQRNInsjr0SnLIuOaaDdEWiX0OdKya7mi
         jE12axvwYrVKOQ8nDSRSphqn7LTzbzip1R5tlUlsfHm+bowvlRMyFoUb1XykM/fR/1kJ
         rrZAe3KZ0BiKWgX9M/kYRgfctSaYSUFZX4ZM32tkHmvIMcjtkfceyynoDMHIINJXdmD0
         LUfzFjZypgPOFCPMdd6ewxgz0pBvI3qbHkvPKeI28YKSBgKPCquzuMeUy2v/s6d/nEjH
         Aq9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LCa+aVIC89Z/IdQehPIP96zGnlcisprBcKManxPUAMk=;
        b=ePXKsQi3fDO4O+S5aTJ9C6Sy1fOdirj12cv2AEkhi54DgM3ddilHWGiW+ORI3E4N8d
         0fPETYuG5goil7CnBtmfL9OfMxbRdxM8lYoWEIoFN6UAjJnGTSZGTVMCaGUTMiOCflI9
         gZ5AF4ZjVmsxB2tTL2nhea8CulbWK1s2DMFAaGLIScmSXHo2Hd4ZfWQF8T9GF6FKdZzv
         a7HJOEEl/GO0ob8Z2jnfijYZJqOi8In6kK/6j8rFo0asmb2Fzq+GvoBZFAtg7zVZKuTy
         wJaWSTZhvPjhQkkM+SRNYoDzoXz71FMAq0hJa3owCJ480mvLFRnnHg1yQTK5jYWnnOci
         cA4w==
X-Gm-Message-State: AJIora8V3AGzc7CDy+1rbb+hx1xqqBr/Nwfpu0QORxz1vL1l6Npjv5bk
        06Ln1W2wLjCtsffUD+htpCOjCg==
X-Google-Smtp-Source: AGRyM1uqtZe7JSbXQZ65E06xS9Rx4h4QhLEojM0uMe09sJDw4ZGgyM1X93Ze8is+aeWEv/nuDQdeRw==
X-Received: by 2002:a05:6512:10cd:b0:489:ddd8:ba3e with SMTP id k13-20020a05651210cd00b00489ddd8ba3emr4629508lfg.62.1657796427375;
        Thu, 14 Jul 2022 04:00:27 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id y10-20020a056512044a00b0047fbf4c8bdfsm299061lfk.143.2022.07.14.04.00.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 04:00:26 -0700 (PDT)
Message-ID: <7e362d83-36c2-00ed-6525-37197ee8e5d7@linaro.org>
Date:   Thu, 14 Jul 2022 13:00:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 5/6] media: dt-bindings: media: i2c: Add mlx7502x
 camera sensor binding
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Volodymyr Kharuk <vkh@melexis.com>, linux-media@vger.kernel.org,
        Andrii Kyselov <ays@melexis.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org
References: <cover.1657786765.git.vkh@melexis.com>
 <712c1acff963238e685cbd5c4a1b91f0ec7f9061.1657786765.git.vkh@melexis.com>
 <Ys/qq4hIQ25KXB2/@pendragon.ideasonboard.com>
 <c87132c4-5801-2f1f-8ef9-3997474cf7a5@linaro.org>
 <Ys/zvH3ICr4zpTLH@pendragon.ideasonboard.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Ys/zvH3ICr4zpTLH@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/07/2022 12:45, Laurent Pinchart wrote:
> On Thu, Jul 14, 2022 at 12:35:52PM +0200, Krzysztof Kozlowski wrote:
>> On 14/07/2022 12:06, Laurent Pinchart wrote:
>>> Hi Volodymyr,
>>>
>>> Thank you for the patch.
>>>
>>> On Thu, Jul 14, 2022 at 11:34:47AM +0300, Volodymyr Kharuk wrote:
>>>> Add device tree binding of the mlx7502x and update MAINTAINERS
>>>>
>>>> Signed-off-by: Volodymyr Kharuk <vkh@melexis.com>
>>>> ---
>>>>  .../bindings/media/i2c/melexis,mlx7502x.yaml  | 146 ++++++++++++++++++
>>>>  MAINTAINERS                                   |   1 +
>>>>  2 files changed, 147 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml b/Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml
>>>> new file mode 100644
>>>> index 000000000000..4ac91f7a26b6
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml
>>>> @@ -0,0 +1,146 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/media/i2c/melexis,mlx7502x.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Melexis ToF 7502x MIPI CSI-2 Sensor
>>>> +
>>>> +maintainers:
>>>> +  - Volodymyr Kharuk <vkh@melexis.com>
>>>> +
>>>> +description: |-
>>>> +  Melexis ToF 7502x sensors has a CSI-2 output. It supports 2 and 4 lanes,
>>>> +  and mipi speeds are 300, 600, 704, 800, 904, 960Mbs. Supported format is RAW12.
>>>> +  Sensor 75026 is QVGA, while 75027 is VGA sensor.
>>>> +  If you use compatible = "melexis,mlx7502x", then autodetect will be called.
>>>
>>> I'd move this last line as a description of the compatible property, but
>>> I'm also not sure this should be mentioned in the DT bindings, as it's a
>>> driver implementation detail. I'm actually not sure we should support it
>>> with three different compatible values as proposed, as without this
>>> documentation users will have a hard time figuring out what compatible
>>> value to pick.
>>>
>>> One option would be to support the following three compatible values:
>>>
>>> 	compatible = "melexis,mlx75026", "melexis,mlx7502x";
>>> 	compatible = "melexis,mlx75027", "melexis,mlx7502x";
>>> 	compatible = "melexis,mlx7502x";
>>>
>>> The last one only would trigger autodetection. I'm still not sure how to
>>> document that properly in bindings though.
>>
>> I missed that part of binding.
>>
>> Wildcards are not allowed in compatible, so mlx7502x has to go.
> 
> Really ? We've had fallback generic compatible strings since the
> beginning.

Fallback generic compatibles are allowed. Wildcards not. Wildcards were
actually never explicitly allowed, they just slipped in to many
bindings... We have several discussions on this on mailing list, so no
real point to repeat the arguments.

There is a difference between generic fallback. If the device follows
clear specification and version, e.g. "foo-bar-v4", you can use it for
generic compatible. This is more common in SoC components. Requirement -
there is a clear mapping between versions and SoCs.

> 
>> Anyway what does this autodetection mean?
> 
> As far as I understand, it means that the driver will use a hardware
> identification register to figure out if the sensor is a 75026 or 75027.

Then there is no need to define 75027 compatible. DT is for cases where
autodetection does not work...

> The upside is that one doesn't need to change the device tree when
> swapping between those two sensors. The downside is that the sensor
> needs to be powered up at probe time. Depending on the platform, one of
> those two behaviours is preferred. Auto-detection is nice, but in
> laptops or tablets (not a use case for this particular device, but the
> problem applies to camera sensors in general), it would mean that the
> privacy LED of the camera could be briefly lit at boot time due to the
> sensor being powered on, which can worry users.

OK, that's reasonable argument for dedicated compatible but I don't
understand why you cannot perform autodetection the moment device is
actually powered up (first time). I understand it is nice and easy to
make everything in the probe and most devices perform it that way. But
if you don't want to do it in the probe - DT is not a workaround for this...

Best regards,
Krzysztof
