Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99AB2574C9A
	for <lists+linux-media@lfdr.de>; Thu, 14 Jul 2022 13:56:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239133AbiGNL4W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jul 2022 07:56:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239120AbiGNL4T (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jul 2022 07:56:19 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6910A5A2F3
        for <linux-media@vger.kernel.org>; Thu, 14 Jul 2022 04:56:18 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id o12so1894660ljc.3
        for <linux-media@vger.kernel.org>; Thu, 14 Jul 2022 04:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=p8EsLkUZSHrLHIHAucm4oSdExDu8mXcFIggmkva2To4=;
        b=Wg//tstVLeD5BKJ9pqEBzrGxoHCSn928xaCqhBshtV4tRnNBhAgyegHi7qSiYL45bo
         AwlxKs2Qln1gQejqjMOv3JreWXMnGW0naRPfuM7CngSDNCZsLGaVDjUfaZSI/SWQiRNe
         XhONpnYpjCQaSqer0jQ9bI4lqfp1lYoUfVpFn2vtcfDy8XI2MATPuJOgTDWrbiTywbII
         Iyg63IAS5XMrc3qI8hcIg6P5cMbgpNoY3Fipnw6xg/RKAtz6CexuqCwJOJbcF8NUBhuH
         QflELdGTQHVlAB8FVnTrz1ewEASpFEWmbO9QwZnj5nxeG6sjfKzTRHujrMoKnS0Jba9+
         U38g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=p8EsLkUZSHrLHIHAucm4oSdExDu8mXcFIggmkva2To4=;
        b=qw3LZIC2LyEVr8jWg4yD6rB3VBESsmgFzZygbdfD5TjCRltwrdCIFungxmiK9JZpTV
         dC+t4HjoPgbs+HIg0fHk+t3szTiVntdGbZTMrwfa1HXsuAgjamF5kdCm/1krzR8WoNcE
         7AA5UDKEpR8Kt8hKkx3M8aRDRJnNjmFPv5JoJOTNC3O4tWPbwAmIf9FXGZt7cmOGYgAB
         zg3ZA5ePjdd2AnFw111798vtk66r4LytyBPIqiEA9lQ15yilHweY82r1YY7e7tb2GMXb
         5Gem2sMvUZgNB374F2cyqaPmgfEPMe+UZBZ85YUUf5DB7jB9XzvJkA1Zz269Kf/GnymH
         nRyw==
X-Gm-Message-State: AJIora/nQzs2ox2LXbW3xIW0YnAW74eIrCqpUpvn30z0JDotP8tr3nrI
        +bQEGTbe+EalCudYFwRqqcwsOg==
X-Google-Smtp-Source: AGRyM1vJe203laQ6CvNrndxCYSIi6oWCyfF3Nl+nPdDKdrg78zPh/SMNbhFPnv/37PD2GZG9njV3ZQ==
X-Received: by 2002:a2e:9ec4:0:b0:25d:46da:2b7a with SMTP id h4-20020a2e9ec4000000b0025d46da2b7amr4047345ljk.300.1657799776712;
        Thu, 14 Jul 2022 04:56:16 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id y1-20020ac24461000000b00484d82e8a09sm320408lfl.211.2022.07.14.04.56.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 04:56:16 -0700 (PDT)
Message-ID: <85cb8f2d-5d8b-ffa9-9f53-0e8bc1233e69@linaro.org>
Date:   Thu, 14 Jul 2022 13:56:13 +0200
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
 <20a88191-0c4e-710f-e6ab-4087e5980533@linaro.org>
 <Ys/+KaNltkZZmRE4@pendragon.ideasonboard.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Ys/+KaNltkZZmRE4@pendragon.ideasonboard.com>
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

On 14/07/2022 13:29, Laurent Pinchart wrote:
> On Thu, Jul 14, 2022 at 01:23:41PM +0200, Krzysztof Kozlowski wrote:
>> On 14/07/2022 13:12, Laurent Pinchart wrote:
>>>>>>> One option would be to support the following three compatible values:
>>>>>>>
>>>>>>> 	compatible = "melexis,mlx75026", "melexis,mlx7502x";
>>>>>>> 	compatible = "melexis,mlx75027", "melexis,mlx7502x";
>>>>>>> 	compatible = "melexis,mlx7502x";
>>>>>>>
>>>>>>> The last one only would trigger autodetection. I'm still not sure how to
>>>>>>> document that properly in bindings though.
>>>>>>
>>>>>> I missed that part of binding.
>>>>>>
>>>>>> Wildcards are not allowed in compatible, so mlx7502x has to go.
>>>>>
>>>>> Really ? We've had fallback generic compatible strings since the
>>>>> beginning.
>>>>
>>>> Fallback generic compatibles are allowed. Wildcards not. Wildcards were
>>>> actually never explicitly allowed, they just slipped in to many
>>>> bindings... We have several discussions on this on mailing list, so no
>>>> real point to repeat the arguments.
>>>>
>>>> There is a difference between generic fallback. If the device follows
>>>> clear specification and version, e.g. "foo-bar-v4", you can use it for
>>>> generic compatible. This is more common in SoC components. Requirement -
>>>> there is a clear mapping between versions and SoCs.
>>>
>>> I'm not sure to see a clear difference between the two concepts.
>>
>> The clear difference is that you have a versioned and re-usable hardware
>> block plus clear mapping which version goes to which SoC. Version
>> numbers usually start with 1, not with 75025. 75025 is a model name.
> 
> How about Documentation/devicetree/bindings/serial/renesas,scif.yaml for
> instance, where the version number isn't known and the SoC name is used
> instead ? Is that acceptable ?

This is the second case I mentioned - family of devices where the family
fallback is not allowed to be alone. You cannot use just "renesas,scif"
in DTS.

> 
> How should we deal with devices that have different models, where the
> model is irrelevant to the kernel driver, but relevant to userspace ?
> Imagine, for instance, a light sensor with 10 models than only differ by
> the filter they use to tune the sensitivity to different light spectrums
> ? They are all "compatible" from a software point of view, would the
> driver need to list all 10 compatible strings ?

I don't understand that example, I mean, what's the problem here? If
they are all compatible, you can use only one comaptible, e.g.
melexis,mlx75026.

If you ever need to differentiate it for user-space, you add specific
compatible for the model and you have:

melexis,mlx75027, melexis,mlx75026

If user-space needs dedicated compatibles - add them, no one here argues
to not to use specific compatibles.


>>> For cameras, we often deal with complex pipelines with multiple external
>>> devices and multiple IP cores, with drivers that need to communicate
>>> with each other to initialize the complete camera system. For instance,
>>> each camera-related component in the system registers itself in a media
>>> graph that can be queried from userspace and exposes information about
>>> all devices, including their model. There's no power up of any device
>>> when this query is being performed from userspace. It could possibly be
>>> changed (and maybe it should, for reasons unrelated to this discussion),
>>> but we're looking at pretty much a complete redesign of V4L2 and MC
>>> then.
>>
>> Is then autodetection a real use case since you have to power up the
>> sensor each time system boots and this violates privacy? Several I2C
>> sensors do not care about this and they always do it on power up, so
>> aren't we solving here something unimportant?
> 
> In a laptop or tablet with a camera sensor, you likely don't want
> autodetection. In an industrial device, you don't care, and having the
> ability to auto-detect the exact sensor model when booting saves cost in
> the production chain as a single image can work across different models.

We talk about the case here, not generic. Do you want to have
autodetection possible here or not?

Best regards,
Krzysztof
