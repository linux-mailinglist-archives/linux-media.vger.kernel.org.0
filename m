Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 998C65BC425
	for <lists+linux-media@lfdr.de>; Mon, 19 Sep 2022 10:19:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229926AbiISITO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Sep 2022 04:19:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229937AbiISITM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Sep 2022 04:19:12 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F324205FE
        for <linux-media@vger.kernel.org>; Mon, 19 Sep 2022 01:19:10 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id h3so24556010lja.1
        for <linux-media@vger.kernel.org>; Mon, 19 Sep 2022 01:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=UkEI6Wgy4k9VtOrM7WdWbzd7EfHqK85lNcyzLrqA37o=;
        b=FPsoXJw7FBanwzpf+Nt7c7P93iaUzEZIt6GHy7fz2C1Fazs7THwMWRaJjX5mpYhb1L
         g3UbE358gq6RnaK0F2yPwBYQdL2c7nVl8VXHLcryRfPH2X/tfXuFHVbNgdAG6Xez22XJ
         /qwi8/MvK1NyPpLsde0KNGTN5knosmuGMNwWKHZkHZ1nRIGwC6jKH56oB4mOjjRkfI8b
         /ngy5aoUzI1QAvKY3nGcFLopU2NIzEsv+qzHYKGUi0q6ZMv1eIYaFyscFQqSgZQSEcEe
         HB+kvg7BN4KOcJjGMfZ9odA5DHHq7EasSPqq4wpubPedsejps/9oPiliGsMGrowb6t7y
         swIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=UkEI6Wgy4k9VtOrM7WdWbzd7EfHqK85lNcyzLrqA37o=;
        b=ExyFi5tHndKSzATbbedMzHDIYKYygae76TbvmDNHDYEwt0rOTTt08L/b0XYFu88Ihl
         SyGuUSmshV3Z1vPYQ8o427XvNALG4DPeMdAIQY4O1E5Wa8Ke7UHz9XxG9RDnbLg8IMfa
         9ArwweGGER4gha2B1u7jdcjKRCwmqfca6HjXd03/+SeTNCcpjuokWkwcOco61J2S1yJx
         E3wekSDMEFfSj0oNEvoNzCBGEwx6C6W+hVqIc6yL5QD/PcxYMtMZKMqI5iqX4JYvZFqC
         iCy1JwXwx2B2z1NHofJKCPCkJANsoO4V5lo8WgDg6mpG0jfsUmMeSHOLgzhUcuQHhxdV
         5ElA==
X-Gm-Message-State: ACrzQf1/fd2y69af1UlaMmRLv7Ad+RGqlfYeeMkPg1D2YbB3hBKXh1q3
        KnR1v7Al6/J6t5Lc17oZECxrOA==
X-Google-Smtp-Source: AMsMyM46UQAXva4/n5G0JyybDDnqLzhtGsEjIMky24uSv0afcZHXph6nsCJwHu42ZILKQdrrpHprRg==
X-Received: by 2002:a2e:9d88:0:b0:26a:95c1:218f with SMTP id c8-20020a2e9d88000000b0026a95c1218fmr4824159ljj.223.1663575548744;
        Mon, 19 Sep 2022 01:19:08 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id c37-20020a05651223a500b0048b3926351bsm5079034lfv.56.2022.09.19.01.19.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 01:19:08 -0700 (PDT)
Message-ID: <fc1c075d-e20d-9395-d168-8cfe530f77ad@linaro.org>
Date:   Mon, 19 Sep 2022 10:19:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] media: dt-bindings: i2c: ovti,ov5640: Drop ref to
 video-interface-devices.yaml
Content-Language: en-US
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220916133521.73183-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <YyZS38Wo7rDsNRm2@pendragon.ideasonboard.com>
 <CA+V-a8vvNHFt818wryyuhWxPtay4czjWXiH=AWEKiJ1AzB46mA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CA+V-a8vvNHFt818wryyuhWxPtay4czjWXiH=AWEKiJ1AzB46mA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 19/09/2022 10:08, Lad, Prabhakar wrote:
> Hi Laurent,
> 
> Thank you for the review.
> 
> On Sun, Sep 18, 2022 at 12:06 AM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
>>
>> Hi Prabhakar,
>>
>> Thank you for the patch.
>>
>> On Fri, Sep 16, 2022 at 02:35:21PM +0100, Prabhakar wrote:
>>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>>
>>> video-interface-devices.yaml isn't used so just drop it from the
>>> DT binding doc.
>>>
>>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>> ---
>>>  Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml | 3 ---
>>>  1 file changed, 3 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml
>>> index 540fd69ac39f..ce99aada75ad 100644
>>> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml
>>> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml
>>> @@ -9,9 +9,6 @@ title: OmniVision OV5640 Image Sensor Device Tree Bindings
>>>  maintainers:
>>>    - Steve Longerbeam <slongerbeam@gmail.com>
>>>
>>> -allOf:
>>> -  - $ref: /schemas/media/video-interface-devices.yaml#
>>> -
>>
>> The rotation property listed in this binding uses the definition from
>> video-interface-devices.yaml. I don't think just dropping this is the
>> right solution. Changing additionaProperties to unevaluatedProperties
>> seems a better option.
>>
> Agreed, I missed rotation was used from video-interface-devices.yaml.
> Agreed the changing additionaProperties to unevaluatedProperties seems
> a better option.

The meaning of unevaluatedProperties:false would be here - accept other
properties (not mentioned here explicitly) from referenced schema. If
this is your actual intention for this binding, it makes sense. But if
the intention in this binding was to disallow these other properties,
then it would be wrong to change to unevaluatedProperties.

Therefore before sending patches and calling something better or not,
please instead focus on that aspect of referenced schema.


Best regards,
Krzysztof
