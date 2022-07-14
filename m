Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43C18574B93
	for <lists+linux-media@lfdr.de>; Thu, 14 Jul 2022 13:12:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238276AbiGNLMH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jul 2022 07:12:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230005AbiGNLMF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jul 2022 07:12:05 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B6741839F
        for <linux-media@vger.kernel.org>; Thu, 14 Jul 2022 04:12:04 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id u13so2231457lfn.5
        for <linux-media@vger.kernel.org>; Thu, 14 Jul 2022 04:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=xsLamLUNJsD1h11+P6lAZNoQtFA12pWQUC8rNnSr0Jw=;
        b=F7gtUweIlpPFpjxi5yyzmJqJt1kZO0G3N+6Y5bpjqURNfJGzjoMh3A6dAs3Ci9bCOw
         VknU9JeLRLeIoCYQw0QZMvLL0CqRo3l1roEUcARS64DWd2zphf5OXfz/4v7a9yf4WWmK
         EnXRKFAvVNwRMupVftsRKXKKLO3TuAA96BCao5whAKA9rll/poXDm4cJdGkXnlCo1EnV
         HBksHrsTFz6URpCXx5dohGs1nszYqeEYSobZVtqpFWVkfQYjuwEF0/0yxZ8VWzOIeMep
         SAhNQVFePgpzPQv4HVpNWe0WPhaz2N1qVDS/oxUWzVgixK51V7YXb73Dp+KW3qtqXHEt
         5GXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=xsLamLUNJsD1h11+P6lAZNoQtFA12pWQUC8rNnSr0Jw=;
        b=uwPy9KZBx6KQWDnvpLxEN1jcOjrZ/sumq483b/bPc8jsPSIXd4Gd2185EWC+/DNiop
         xpmJ16ogYs5wL8hErR3SpkuQN4UC8q1UoLgTeB1WE+jhpBdr4X/MMthPNllWw6Ldh6MY
         +WlP41yO3AvcJ0hm4r1YqnsgYuoQsJVbJVq9UJMLpNrAQNc4SjaUNtMRRk7sQyrWyjzO
         /IGmVrr+OVG8Q6fOKpO2quB8P11v2Zci9xL72Nk1dGvcRiKrs0U6RuAD/H+xVmUbz+i3
         w986zahEpQKr/QsQFSTQY/sHTnLG+gTP/4CfjB3+Jjqij/5WVrs20beQHBHYSWEFqEkx
         Orcw==
X-Gm-Message-State: AJIora8OAnJq1wuGj0OgPM4o6veB1eXoa+WFr1h6TJOvYiGGZst9V2B0
        Mr1lL5vOTUxHjTqB5kt7Njt9gg==
X-Google-Smtp-Source: AGRyM1t0ibQDCtYYyp0mJkc22/yedPqV++EQ3KGT+NWHAIuF4DlG+ose42j17ESBSPYOKCh2ifeQCQ==
X-Received: by 2002:a05:6512:169b:b0:47f:6567:c196 with SMTP id bu27-20020a056512169b00b0047f6567c196mr4806663lfb.589.1657797122772;
        Thu, 14 Jul 2022 04:12:02 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id t15-20020a056512208f00b00489ab10f1b1sm306092lfr.20.2022.07.14.04.12.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 04:12:01 -0700 (PDT)
Message-ID: <ea549e79-29e6-a590-2292-bbdcf80bd628@linaro.org>
Date:   Thu, 14 Jul 2022 13:11:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 5/6] media: dt-bindings: media: i2c: Add mlx7502x
 camera sensor binding
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <7e362d83-36c2-00ed-6525-37197ee8e5d7@linaro.org>
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

On 14/07/2022 13:00, Krzysztof Kozlowski wrote:
> On 14/07/2022 12:45, Laurent Pinchart wrote:
>> On Thu, Jul 14, 2022 at 12:35:52PM +0200, Krzysztof Kozlowski wrote:
>>> On 14/07/2022 12:06, Laurent Pinchart wrote:
>>>> Hi Volodymyr,
>>>>
>>>> Thank you for the patch.
>>>>
>>>> On Thu, Jul 14, 2022 at 11:34:47AM +0300, Volodymyr Kharuk wrote:
>>>>> Add device tree binding of the mlx7502x and update MAINTAINERS
>>>>>
>>>>> Signed-off-by: Volodymyr Kharuk <vkh@melexis.com>
>>>>> ---
>>>>>  .../bindings/media/i2c/melexis,mlx7502x.yaml  | 146 ++++++++++++++++++
>>>>>  MAINTAINERS                                   |   1 +
>>>>>  2 files changed, 147 insertions(+)
>>>>>  create mode 100644 Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml b/Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..4ac91f7a26b6
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml
>>>>> @@ -0,0 +1,146 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/media/i2c/melexis,mlx7502x.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: Melexis ToF 7502x MIPI CSI-2 Sensor
>>>>> +
>>>>> +maintainers:
>>>>> +  - Volodymyr Kharuk <vkh@melexis.com>
>>>>> +
>>>>> +description: |-
>>>>> +  Melexis ToF 7502x sensors has a CSI-2 output. It supports 2 and 4 lanes,
>>>>> +  and mipi speeds are 300, 600, 704, 800, 904, 960Mbs. Supported format is RAW12.
>>>>> +  Sensor 75026 is QVGA, while 75027 is VGA sensor.
>>>>> +  If you use compatible = "melexis,mlx7502x", then autodetect will be called.
>>>>
>>>> I'd move this last line as a description of the compatible property, but
>>>> I'm also not sure this should be mentioned in the DT bindings, as it's a
>>>> driver implementation detail. I'm actually not sure we should support it
>>>> with three different compatible values as proposed, as without this
>>>> documentation users will have a hard time figuring out what compatible
>>>> value to pick.
>>>>
>>>> One option would be to support the following three compatible values:
>>>>
>>>> 	compatible = "melexis,mlx75026", "melexis,mlx7502x";
>>>> 	compatible = "melexis,mlx75027", "melexis,mlx7502x";
>>>> 	compatible = "melexis,mlx7502x";
>>>>
>>>> The last one only would trigger autodetection. I'm still not sure how to
>>>> document that properly in bindings though.
>>>
>>> I missed that part of binding.
>>>
>>> Wildcards are not allowed in compatible, so mlx7502x has to go.
>>
>> Really ? We've had fallback generic compatible strings since the
>> beginning.
> 
> Fallback generic compatibles are allowed. Wildcards not. Wildcards were
> actually never explicitly allowed, they just slipped in to many
> bindings... We have several discussions on this on mailing list, so no
> real point to repeat the arguments.

Although I forgot one more acceptable case - family of devices followed
by a specific compatible. However that "family" cannot be on its own.


Best regards,
Krzysztof
