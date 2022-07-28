Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C27C58369B
	for <lists+linux-media@lfdr.de>; Thu, 28 Jul 2022 04:01:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234636AbiG1CBo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jul 2022 22:01:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234096AbiG1CBn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jul 2022 22:01:43 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA9D64F651
        for <linux-media@vger.kernel.org>; Wed, 27 Jul 2022 19:01:41 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id b6so200892wmq.5
        for <linux-media@vger.kernel.org>; Wed, 27 Jul 2022 19:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=JWNU5o153wcHdOJzLmrQ5cBWYSvc8sIq2qxzHsa3A9Q=;
        b=CO9RhJWJeUVgfjP4Tkt1jiEA2BdOQLGv6DqOJqCjw0UV32vYTpJFvpx53DJZkfAyDg
         d6cIsz8wIr0nKxxjcNbzVxkoBtD/SSgFjfrAMm3fN12fGh0Wl0CNAjTV8gl97OCP6yxY
         OWQzMU9ydS3tcqxHsjSKkgLLg/qy5CA3c+XeU3fb/U6UQKOQ9kz8ruq8JJRyl4SG9dQX
         blRwS5W7Ss8NgPunEwoG1JQY2W/Ur5pzGk0y87ytUM2+gwOMjvloFjMd9ZscEn5f0oj4
         GAm1IWJaM8bx4m9mC8kqv87TwmTlFPdYw1Y23mTQkrC69fG4mY80vJD8EjTcTpv/uQ47
         P56A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=JWNU5o153wcHdOJzLmrQ5cBWYSvc8sIq2qxzHsa3A9Q=;
        b=gXpY3rc92KU2AFvxPD9hPqGklQTgKSs3a7/Ep3JtTTdca8n1s/QN02rwww0gy2uEbK
         5UNDBQefNRDC1HyHy54GVIWOBQmHJiIc/6YibLxbps0Ft0hU9lb4/SANdqQuHSSu3q6x
         HzMe/DcvSEFvWPELZivxGTccvokAG+DxqrGHCIryrQyYqVH9cqoBUjut3vIIUtj7yiBN
         UXjq6bVCVBVXEDzG0OmsPMHTD1XnhIomdQ+eObkJ/eBYAT5irCSkn4C5+84/JyBcbigc
         yrYMCjLT5FFBLNDHyS7M8nyFdsePST54Ug2iDqLH2LmloUgPRm9NCtDeI8cpxxiBqzsz
         eNTg==
X-Gm-Message-State: AJIora+Um3kThf+8d7rafk8b3TtGfd1MHd2ndEXe5cW/YlF0PHkHaUhH
        YO1YAiSZm2E5LadhALjf7dv/CQ==
X-Google-Smtp-Source: AGRyM1tn1xSHIpkrF6oqi1mZNVW1LmPEXFf5MWnFFBf3b0SFKD4PQspGwkKt11kFL/G1tARlBP+S4w==
X-Received: by 2002:a7b:c3d4:0:b0:3a3:ce7:7894 with SMTP id t20-20020a7bc3d4000000b003a30ce77894mr4914964wmj.134.1658973700105;
        Wed, 27 Jul 2022 19:01:40 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id d16-20020adff2d0000000b0021d4aca9d1esm21588763wrp.99.2022.07.27.19.01.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 19:01:39 -0700 (PDT)
Message-ID: <87c0cdee-688a-7c32-9957-f0ac305a6965@linaro.org>
Date:   Thu, 28 Jul 2022 03:01:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 0/3] Add imx577 compatible to imx412
Content-Language: en-US
To:     "Alessandrelli, Daniele" <daniele.alessandrelli@intel.com>,
        "Murphy, Paul J" <paul.j.murphy@intel.com>,
        "jacopo@jmondi.org" <jacopo@jmondi.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "sakari.ailus@iki.fi" <sakari.ailus@iki.fi>
Cc:     "konrad.dybcio@somainline.org" <konrad.dybcio@somainline.org>,
        "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
        "andrey.konovalov@linaro.org" <andrey.konovalov@linaro.org>
References: <20220718014215.1240114-1-bryan.odonoghue@linaro.org>
 <fe14541568ab201abac5cfd4914b750d54ef4aa6.camel@intel.com>
 <57f8897de98b5433a66983d2e175b855c6c38d5c.camel@intel.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <57f8897de98b5433a66983d2e175b855c6c38d5c.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27/07/2022 21:12, Alessandrelli, Daniele wrote:
> On Thu, 2022-07-21 at 16:15 +0100, Daniele Alessandrelli wrote:
>> Hi Bryan,
>>
>> On Mon, 2022-07-18 at 02:42 +0100, Bryan O'Donoghue wrote:
>>> V2:
>>> Sakari wasn't especially satisfied with the answer imx412 and imx577 have
>>> the same init sequence but, suggested setting the string for imx577 as is
>>> done in the ccs driver.
>>>
>>> https://lore.kernel.org/all/20220607134057.2427663-3-bryan.odonoghue@linaro.org/t/
>>>
>>> I went to look at that and asked myself "how would I tell the difference
>>> between the two silicon parts". The obvious answer is a chip identifier.
>>>
>>> Luckily this class of IMX sensor has a chip identifier at offset 0x0016.
>>>
>>> That looks like this for imx258, imx319 and imx355
>>>
>>> drivers/media/i2c/imx258.c:#define IMX258_REG_CHIP_ID    0x0016
>>> drivers/media/i2c/imx258.c:#define IMX258_CHIP_ID        0x0258
>>>
>>> drivers/media/i2c/imx319.c:#define IMX319_REG_CHIP_ID    0x0016
>>> drivers/media/i2c/imx319.c:#define IMX319_CHIP_ID        0x0319
>>>
>>> drivers/media/i2c/imx355.c:#define IMX355_REG_CHIP_ID    0x0016
>>> drivers/media/i2c/imx355.c:#define IMX355_CHIP_ID        0x0355
>>>
>>> but then looks like this for imx412.
>>>
>>> drivers/media/i2c/imx412.c:#define IMX412_REG_ID         0x0016
>>> drivers/media/i2c/imx412.c:#define IMX412_ID             0x577
>>>
>>> This made no sense at all to me, why is the imx412 driver not named imx577 ?
>>
>> I tried to reached out to the colleagues who wrote the driver but it
>> seems they are not in the company anymore.
>>
>> However, I managed to get the imx412 register map documentation they
>> used while developing the driver and the value at offset 0x0016 is
>> reported to be 0x0577.
>>
>> I agree this is strange, so, next week, I'll try to see if I can get my
>> hands on an imx412 sensor to verify the value reported by the HW.
> 
> I managed to get one of the imx412 sensors that were used for the
> development of this driver and I can confirm that the CHIP ID reported
> by the HW is 0x577 (as specified in the datasheet I was given)

Did you happen to check the other offset we discussed, the one you 
mentioned @ 0x0000 ?

[   10.422064] imx577 20-001a: Register @ 0x0000 0x0000 register @ 
0x0016 0x0577

> However, somebody [1] on the internet is reporting that their imx412
> shows a different ID, so it's possible that different batches of imx412
> have different IDs (perhaps Sony fixed the ID inconsistency at some
> point). But I'd like to see more evidence of this.
> 
> [1] https://discuss.96boards.org/t/imx412-driver-troubleshooting/11350
> 
> Anyway, regardless of the ID, I think this driver shouldn't be renamed
> because it was written for imx412, using an imx412.

Can't say I agree there.

Currently imx412.c

- Uses the imx577 init sequence
- Uses the imx577 register id

if any thing imx412 should be considered a special case of imx577 not 
the reverse.

./oem/qcom/sensor/imx577/imx577_sensor.xml<registerAddr>0x0136</registerAddr>
<registerData>0x18</registerData>
<registerAddr>0x0137</registerAddr>
<registerData>0x00</registerData><registerAddr>0x3C7E</registerAddr>
<registerData>0x01</registerData>
<registerAddr>0x3C7F</registerAddr>
<registerData>0x02</registerData>
<registerAddr>0x38A8</registerAddr>
<registerData>0x1F</registerData>
<registerAddr>0x38A9</registerAddr>
<registerData>0xFF</registerData>
<registerAddr>0x38AA</registerAddr>
<registerData>0x1F</registerData>
<registerAddr>0x38AB</registerAddr>
<registerData>0xFF</registerData>
<registerAddr>0x55D4</registerAddr>
<registerData>0x00</registerData>
<registerAddr>0x55D5</registerAddr>
<registerData>0x00</registerData>
...

drivers/media/i2c/imx412.c
static const struct imx412_reg mode_4056x3040_regs[] = {
         {0x0136, 0x18},
         {0x0137, 0x00},
         {0x3c7e, 0x08},
         {0x3c7f, 0x02},
         {0x38a8, 0x1f},
         {0x38a9, 0xff},
         {0x38aa, 0x1f},
         {0x38ab, 0xff},
         {0x55d4, 0x00},
         {0x55d5, 0x00},
...

drivers/media/i2c/imx258.c:#define IMX258_CHIP_ID        0x0258
drivers/media/i2c/imx319.c:#define IMX319_CHIP_ID        0x0319
drivers/media/i2c/imx355.c:#define IMX355_CHIP_ID        0x0355

and then make this departure

drivers/media/i2c/imx412.c:#define IMX577_ID             0x577

I honestly think we should rename to imx577 here, it seems very 
illogical to have the imx577 init sequence, the imx577 register 
identifier but break with the established naming convention and call the 
driver imx412.

---
bod
