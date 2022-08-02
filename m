Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38316587904
	for <lists+linux-media@lfdr.de>; Tue,  2 Aug 2022 10:30:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235945AbiHBIaq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Aug 2022 04:30:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232747AbiHBIap (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Aug 2022 04:30:45 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 476CD252A6
        for <linux-media@vger.kernel.org>; Tue,  2 Aug 2022 01:30:44 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id s9so8878857ljs.6
        for <linux-media@vger.kernel.org>; Tue, 02 Aug 2022 01:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=fddXSsZeILvCt8YBIViNhrEqIzaRUfzlbqJpUYKW0mA=;
        b=nhWcy3Ab9AEw+1Y9n5TC5mlbhpsvRXyVUXrGJInf0hEHX4kLjsgwWP3vo+9nHLLCMn
         F8cLdUtJVf0nWFHIuiVQawYh0wmeKzYPBhmfctW615cn5esCbrBOz8Q3QxSXj1prdVvX
         W9jUkTs2cEeaJGHUR9LKwrmT80WPP9TlOcIXHLbJ4k2+UM51XRDIJgxNyFlSw0WIp7u5
         l2GgXknEtZCcJVpplbZiW41JGpsSwBItapOD4HnZCKO/MVTlFPk7G4w48zIsSEkaB56b
         geqAeO3oN5YMuJ/aCrMPuKI9zhxq+8cboVh0VCc2bqTLoZXa20LqHnx52yf3gcCgTjO/
         eh+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=fddXSsZeILvCt8YBIViNhrEqIzaRUfzlbqJpUYKW0mA=;
        b=Yfsbt84tbhV/NFjlo1Dv8LXCAI/WuN6p7zNaP5xGLX7mWeG2iXfIjwSaacBARMQqEi
         fRl0kXiRxFXabqmqbARrt9mLVBDGOeffDUXP4Nb4PoKtguvTJz0/BderyUpLPmEPD1Oc
         U9vc3tqdW49ltDgRMM/sUVs4P1g12nMUEVAaZ75dYC8kAReootUkfQwGLObRzZg+J+8I
         HZq+EOYhPx5/PR7iqwXH+3ETEXl2RH66Ls08AnqmpZm9jI5W8x8YS0X+7CqT9pmNG0qw
         45jg4r6aLurhIBXsyCyuuIyY/1axqBJ5mnIWApu8T+IdBZBkcOOrgCBzve896Ryvq6fH
         J3tg==
X-Gm-Message-State: ACgBeo3TXTJqJfgKrIqKvf2Ix6VPnUsfAamXFaQmp5LWVe3QVij0FPLn
        6wLRuGCbB6z+65zHQKS5US6X5A==
X-Google-Smtp-Source: AA6agR7rZK+UG2EQIFq5eQqHk8Nufc3f6Wxp5DKs26lWctLCemiTsyK9CVjP1izHGdMe7OKjneWQSQ==
X-Received: by 2002:a2e:8096:0:b0:25e:4024:5fb6 with SMTP id i22-20020a2e8096000000b0025e40245fb6mr5461894ljg.332.1659429042612;
        Tue, 02 Aug 2022 01:30:42 -0700 (PDT)
Received: from [192.168.1.6] ([213.161.169.44])
        by smtp.gmail.com with ESMTPSA id bq30-20020a056512151e00b00489e812f05asm2030630lfb.21.2022.08.02.01.30.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 01:30:42 -0700 (PDT)
Message-ID: <0a1e8af3-6c55-8a4a-ec85-9ba6bff22520@linaro.org>
Date:   Tue, 2 Aug 2022 10:30:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 3/7] media: i2c: ov9282: Add ov9281 compatible
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Naushir Patuck <naush@raspberrypi.com>
References: <20220728130237.3396663-1-alexander.stein@ew.tq-group.com>
 <20220728130237.3396663-4-alexander.stein@ew.tq-group.com>
 <4e89e55b-9312-5525-974b-0a1dbe0b3dd1@linaro.org>
 <YuOHOEUk+znzump5@valkosipuli.retiisi.eu>
 <YuOXyZ6XTW2DjLvd@pendragon.ideasonboard.com>
 <e3847096-ae60-9ab3-f1e7-c461508be952@linaro.org>
 <8015285b-940b-503a-159e-66f10a34a999@linaro.org>
 <Yuje6wip8KEZG6Af@valkosipuli.retiisi.eu>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Yuje6wip8KEZG6Af@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/08/2022 10:23, Sakari Ailus wrote:
> On Mon, Aug 01, 2022 at 08:08:58PM +0200, Krzysztof Kozlowski wrote:
>> On 01/08/2022 20:07, Krzysztof Kozlowski wrote:
>>> On 29/07/2022 10:18, Laurent Pinchart wrote:
>>>> Hi Sakari,
>>>>
>>>> (Adding Dave and Naush to the CC list)
>>>>
>>>> On Fri, Jul 29, 2022 at 10:07:36AM +0300, Sakari Ailus wrote:
>>>>> On Thu, Jul 28, 2022 at 03:13:11PM +0200, Krzysztof Kozlowski wrote:
>>>>>> On 28/07/2022 15:02, Alexander Stein wrote:
>>>>>>> According to product brief they are identical from software point of view.
>>>>>>> Differences are a different chief ray angle (CRA) and the package.
>>>>>>>
>>>>>>> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>>>>>>> Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
>>>>>>> ---
>>>>>>>  drivers/media/i2c/ov9282.c | 1 +
>>>>>>>  1 file changed, 1 insertion(+)
>>>>>>>
>>>>>>> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
>>>>>>> index 8a252bf3b59f..c8d83a29f9bb 100644
>>>>>>> --- a/drivers/media/i2c/ov9282.c
>>>>>>> +++ b/drivers/media/i2c/ov9282.c
>>>>>>> @@ -1113,6 +1113,7 @@ static const struct dev_pm_ops ov9282_pm_ops = {
>>>>>>>  };
>>>>>>>  
>>>>>>>  static const struct of_device_id ov9282_of_match[] = {
>>>>>>> +	{ .compatible = "ovti,ov9281" },
>>>>>>
>>>>>> The devices seem entirely compatible, so why you add a new compatible
>>>>>> and not re-use existing?
>>>>>>
>>>>>> The difference in lens does not explain this.
>>>>>
>>>>> It is typically necessary to know what kind of related hardware can be
>>>>> found in the system, beyond just the device's register interface. Apart
>>>>> from USB cameras, less integrated cameras require low-level software
>>>>> control in which specific device properties are important. In this case it
>>>>> could be the lens shading table, among other things.
>>>>>
>>>>> 	https://www.ovt.com/sensor/ov9282/
>>>>>
>>>>> Therefore I think adding a specific compatible string for this one is
>>>>> justified.
>>>
>>> Specific compatible in binding is a requirement. No one discussed this.
>>> However not in the driver. None of the arguments above justify adding
>>> such binding, unless user-space depends on matching compatible, but not
>>> real compatible?
>>
>> Eh, now I used vague words. This should be instead:
>>
>> "However not in the driver. None of the arguments above justify adding
>> such compatible to driver, unless user-space depends on matching
>> compatible, but not real compatible?"
> 
> If I understand you right, you'd put the more specific model name as well
> as the more generic one to the compatible property and let the driver match
> against the more generic one?

Yes.

> 
> But in this case neither of these models is more generic than the other.

It's not a problem. Also the spec explains it similar way:
"They
 allow a device to express its compatibility with a family of similar
devices, potentially allowing a single
 device driver to match against several devices."

Of course the numbers would suggest that ov9281 should be the family (as
lower number usually means designed earlier), but it is a matter of
convention which here can be skipped. The point is that ov9281 and
ov9282 are compatible between each other, therefore they belong to
single family.

Best regards,
Krzysztof
