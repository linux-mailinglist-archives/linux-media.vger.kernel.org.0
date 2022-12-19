Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0B646508FB
	for <lists+linux-media@lfdr.de>; Mon, 19 Dec 2022 10:00:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231379AbiLSJAs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Dec 2022 04:00:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbiLSJAp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Dec 2022 04:00:45 -0500
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA3B3387;
        Mon, 19 Dec 2022 01:00:43 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2BJ90RIk058132;
        Mon, 19 Dec 2022 03:00:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1671440427;
        bh=LVn4h1XmlZlzF5JubIgwsCY0ky3E6LAchf1girvLoAE=;
        h=Date:Subject:To:CC:References:From:In-Reply-To;
        b=YqGoIwaU74ci5OdEZMBhBhBaXle1DxSu6Da6Fr5duCN6DsIO8h27pFz4AshCrIt6T
         kAYQxQuFoUjTZcKQlVcGu6QBrsUsrvB2ckM+l0jw3ly9EGbvxjst6cJMWkWpOr6xgJ
         Yc0JQWk6LtLcvjoWr7SPZtN6IGBTa8KnT/0Asl+c=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2BJ90Qdv028979
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 19 Dec 2022 03:00:26 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 19
 Dec 2022 03:00:26 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 19 Dec 2022 03:00:26 -0600
Received: from [172.24.145.60] (ileaxei01-snat.itg.ti.com [10.180.69.5])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2BJ90Nm9003280;
        Mon, 19 Dec 2022 03:00:24 -0600
Message-ID: <a4615170-f5b2-e748-8c76-5b125240229f@ti.com>
Date:   Mon, 19 Dec 2022 14:30:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/3] media: ov5640: Handle delays when no reset_gpio set
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20221216134409.6868-1-j-luthra@ti.com>
 <20221216134409.6868-2-j-luthra@ti.com>
 <Y5x5UbtLFDpFIoEp@paasikivi.fi.intel.com>
 <51ef1ff4-db3d-64aa-aa9d-82f604a314c1@linaro.org>
From:   Jai Luthra <j-luthra@ti.com>
In-Reply-To: <51ef1ff4-db3d-64aa-aa9d-82f604a314c1@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari, Krzysztof,

On 16/12/22 19:40, Krzysztof Kozlowski wrote:
> On 16/12/2022 14:57, Sakari Ailus wrote:
>> Hi Jai,
>>
>> Thanks for the set.
>>
>> On Fri, Dec 16, 2022 at 07:14:07PM +0530, Jai Luthra wrote:
>>> Some module manufacturers [1][2] don't expose the RESETB gpio of the
>>> sensor directly through the 15-pin FFC connector. Instead wiring ~PWDN
>>> as a proxy reset with appropriate delays.
>>>
>>> In such cases, reset_gpio will not be available to the driver, but it
>>> will still be toggled when the sensor is powered on, and thus we should
>>> still honor the wait time of >= 5ms + 1ms + 20ms (see figure 2-3 in [3])
>>> before attempting any i/o operations over SCCB.
>>>
>>> [1] https://digilent.com/reference/_media/reference/add-ons/pcam-5c/pcam_5c_sch.pdf
>>> [2] https://www.alinx.com/public/upload/file/AN5641_User_Manual.pdf
>>> [3] https://cdn.sparkfun.com/datasheets/Sensors/LightImaging/OV5640_datasheet.pdf
>>>
>>> Fixes: 19a81c1426c1 ("[media] add Omnivision OV5640 sensor driver")
>>> Signed-off-by: Jai Luthra <j-luthra@ti.com>
>>> ---
>>>   drivers/media/i2c/ov5640.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
>>> index e0f908af581b..4bb7bf557cfa 100644
>>> --- a/drivers/media/i2c/ov5640.c
>>> +++ b/drivers/media/i2c/ov5640.c
>>> @@ -2466,6 +2466,7 @@ static int ov5640_set_power_on(struct ov5640_dev *sensor)
>>>   
>>>   	ov5640_reset(sensor);
>>>   	ov5640_power(sensor, true);
>>> +	usleep_range(26000, 30000);
>>
>> I think you should only do this if you don't have RESETB pin.
>>
>> I'm not sure how to best describe this in DT. It's not the same as if you
>> didn't have RESETB GPIO.
> 
> Why it's not the same? I understand the RESETB pin is always there just
> sometimes going to GPIO and sometimes to some other line.

Thanks for the quick review.

I agree, will send v2 where we check if reset-gpio is missing in the DT 
and in that case just toggle powerdown-gpio and wait for 26ms.

> 
> Best regards,
> Krzysztof
> 

Thanks,
Jai
