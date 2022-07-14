Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CC16574BD8
	for <lists+linux-media@lfdr.de>; Thu, 14 Jul 2022 13:24:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238393AbiGNLYQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jul 2022 07:24:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238734AbiGNLXr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jul 2022 07:23:47 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F466EE3E
        for <linux-media@vger.kernel.org>; Thu, 14 Jul 2022 04:23:46 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id r9so2250376lfp.10
        for <linux-media@vger.kernel.org>; Thu, 14 Jul 2022 04:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=HvvFaUR5bXY5BZZNecv98EVTmNE2OacreTsFOQhpBFU=;
        b=doYkZSEz2un16ZFvgiaI2FMwS94GxnUmCHQO8N7NoKhxkNxKaydfkJ9TFIB4pnjzV9
         m7DygNZ+j8xWFasx88z+RA9oxcARFs728OzMQcr0AXGYutc1SDGY5+oacRKa6f/n8+3E
         bkL6aBct7g6QoAFTjnkjEhZ1XSvkuFWm6yDfXN/92CkuT5CTqlvIqS+hsaEuqIhc9iLN
         PSXZFS0Q5nj0tWpQExYv/3Ls6JrTUIX/VfQ1niDwJ4/E8DrV9VNmWy/2/Uo6eheI7eA8
         cHWoEkdnodYbTpikky94rwzmly8+b+LsyTkaQQ8YD/ZsUGaxHJAE7XtLiPeCACM/wWdr
         c1qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HvvFaUR5bXY5BZZNecv98EVTmNE2OacreTsFOQhpBFU=;
        b=E6hHqMIYXhoAldp5n/v3pNNSKDmNhggVEmB+cy4NUp62bfQee7uzSHUyi7zXOwFEdm
         LNU8TFNDy4+CEVAlTXxa0U6FbbMn9fs+A6LkeSxygYzxp014NKRfL5j5DNtfj5KPmrxI
         kX+ZeY+29YI3JRHZWnvYbZAzfOSk4t49aBat2iKipCFcAPVm9GNT3m3G4O1EEXK30RWn
         w0ZWgSseEGIMndRcIHjGXG4JHq067l7JQWlNPr0cWta/DQevPSsmKykQdLuBwzzfKS7o
         NV2O8QiRSgdmHVoXGmQ39bOMGDVfy2Jar4vBTjnkZYHWQviPPdjBrxWXEjj8OALzGE30
         HtyA==
X-Gm-Message-State: AJIora+bQWd7SacIVuYgGfuRtrmIVOUt5KEidKEfSRZ8hAIYzL1rqumB
        CiR7BPRYA8CvCRBWz7qoNhXV9g==
X-Google-Smtp-Source: AGRyM1uS0KaiJyicc7GDsROKAP5c3u5hRQ92wasnzsfAJLIR1n7pW45ZSBBRj55ec2eGuZxhpBy/yw==
X-Received: by 2002:a05:6512:3c86:b0:489:cef9:18bd with SMTP id h6-20020a0565123c8600b00489cef918bdmr4873452lfv.386.1657797824467;
        Thu, 14 Jul 2022 04:23:44 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id u19-20020a05651c131300b0025d87a16111sm239000lja.31.2022.07.14.04.23.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 04:23:43 -0700 (PDT)
Message-ID: <20a88191-0c4e-710f-e6ab-4087e5980533@linaro.org>
Date:   Thu, 14 Jul 2022 13:23:41 +0200
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
 <7e362d83-36c2-00ed-6525-37197ee8e5d7@linaro.org>
 <Ys/6O2H/eDEWYHei@pendragon.ideasonboard.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Ys/6O2H/eDEWYHei@pendragon.ideasonboard.com>
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

On 14/07/2022 13:12, Laurent Pinchart wrote:
>>>>> One option would be to support the following three compatible values:
>>>>>
>>>>> 	compatible = "melexis,mlx75026", "melexis,mlx7502x";
>>>>> 	compatible = "melexis,mlx75027", "melexis,mlx7502x";
>>>>> 	compatible = "melexis,mlx7502x";
>>>>>
>>>>> The last one only would trigger autodetection. I'm still not sure how to
>>>>> document that properly in bindings though.
>>>>
>>>> I missed that part of binding.
>>>>
>>>> Wildcards are not allowed in compatible, so mlx7502x has to go.
>>>
>>> Really ? We've had fallback generic compatible strings since the
>>> beginning.
>>
>> Fallback generic compatibles are allowed. Wildcards not. Wildcards were
>> actually never explicitly allowed, they just slipped in to many
>> bindings... We have several discussions on this on mailing list, so no
>> real point to repeat the arguments.
>>
>> There is a difference between generic fallback. If the device follows
>> clear specification and version, e.g. "foo-bar-v4", you can use it for
>> generic compatible. This is more common in SoC components. Requirement -
>> there is a clear mapping between versions and SoCs.
> 
> I'm not sure to see a clear difference between the two concepts.

The clear difference is that you have a versioned and re-usable hardware
block plus clear mapping which version goes to which SoC. Version
numbers usually start with 1, not with 75025. 75025 is a model name.

>>>> Anyway what does this autodetection mean?
>>>
>>> As far as I understand, it means that the driver will use a hardware
>>> identification register to figure out if the sensor is a 75026 or 75027.
>>
>> Then there is no need to define 75027 compatible. DT is for cases where
>> autodetection does not work...
> 
> It's autodetection of the exact device model, those are I2C devices so
> we still need DT, and we still need to know that it's one of the
> MLX75026 or MLX75027.
> 
>>> The upside is that one doesn't need to change the device tree when
>>> swapping between those two sensors. The downside is that the sensor
>>> needs to be powered up at probe time. Depending on the platform, one of
>>> those two behaviours is preferred. Auto-detection is nice, but in
>>> laptops or tablets (not a use case for this particular device, but the
>>> problem applies to camera sensors in general), it would mean that the
>>> privacy LED of the camera could be briefly lit at boot time due to the
>>> sensor being powered on, which can worry users.
>>
>> OK, that's reasonable argument for dedicated compatible but I don't
>> understand why you cannot perform autodetection the moment device is
>> actually powered up (first time). I understand it is nice and easy to
>> make everything in the probe and most devices perform it that way. But
>> if you don't want to do it in the probe - DT is not a workaround for this...
> 
> For cameras, we often deal with complex pipelines with multiple external
> devices and multiple IP cores, with drivers that need to communicate
> with each other to initialize the complete camera system. For instance,
> each camera-related component in the system registers itself in a media
> graph that can be queried from userspace and exposes information about
> all devices, including their model. There's no power up of any device
> when this query is being performed from userspace. It could possibly be
> changed (and maybe it should, for reasons unrelated to this discussion),
> but we're looking at pretty much a complete redesign of V4L2 and MC
> then.

Is then autodetection a real use case since you have to power up the
sensor each time system boots and this violates privacy? Several I2C
sensors do not care about this and they always do it on power up, so
aren't we solving here something unimportant?

Best regards,
Krzysztof
