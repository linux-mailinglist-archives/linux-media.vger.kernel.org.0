Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76C7E654E31
	for <lists+linux-media@lfdr.de>; Fri, 23 Dec 2022 10:13:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236062AbiLWJNz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Dec 2022 04:13:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235159AbiLWJNx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Dec 2022 04:13:53 -0500
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14F2936D49
        for <linux-media@vger.kernel.org>; Fri, 23 Dec 2022 01:13:49 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2BN9DeAJ048071;
        Fri, 23 Dec 2022 03:13:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1671786820;
        bh=LqgKpY9S2/MrogXcZJT6JSdZtQzPF54OTjUdIVvH6RE=;
        h=Date:Subject:To:CC:References:From:In-Reply-To;
        b=BIshY/qvWPPPGW31k8J5HX7j4ZDXrxjHsO+EigtAVAprCSYTc+ChlcxKOZCGt5mNk
         XhwosT0+qx5IjJyqnEdcrjdSoldbsZPqQ25kIsDmhhYG8Q8blsy2jd+HO+U0zbVhDm
         aieFyMOhOk5U83/g0TFjWbNQs9qWqDAfJqZN5ng8=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2BN9De3E030634
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 23 Dec 2022 03:13:40 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 23
 Dec 2022 03:13:40 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 23 Dec 2022 03:13:40 -0600
Received: from [172.24.145.60] (ileaxei01-snat.itg.ti.com [10.180.69.5])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2BN9DblR092639;
        Fri, 23 Dec 2022 03:13:37 -0600
Message-ID: <5a0c4ac7-4948-29eb-556b-f1861b26f303@ti.com>
Date:   Fri, 23 Dec 2022 14:43:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 2/3] media: ov5640: Honor RESETB to SMBUS time t4 in
 init_setting
Content-Language: en-US
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
CC:     Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        <linux-media@vger.kernel.org>, Nishanth Menon <nm@ti.com>
References: <20221219143056.4070-1-j-luthra@ti.com>
 <20221219143056.4070-3-j-luthra@ti.com>
 <20221222181307.ajxrd5t3rmxp3oaw@uno.localdomain>
From:   Jai Luthra <j-luthra@ti.com>
In-Reply-To: <20221222181307.ajxrd5t3rmxp3oaw@uno.localdomain>
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

Hi Jacopo,

Thanks for the comments,

On 22/12/22 23:43, Jacopo Mondi wrote:
> Hi Jai
> 
> On Mon, Dec 19, 2022 at 08:00:55PM +0530, Jai Luthra wrote:
>> From: Nishanth Menon <nm@ti.com>
>>
>> OV5640 Datasheet[1] Figures 2-3 and 2-4 indicate the timing sequences
>> that is expected during various initialization steps. Note the t4 >=
>> 20ms, delay from RESETB pull high to SCCB initialization
>>
>> As indicated in section 2.8, the RESETB assertion can either be via
>> external pin control OR via the register 0x3008 bit 7. The
>> initialization sequence asserts bit7, but on deassert, we do not wait
>> for the reset delay.
>>
>> [1] https://cdn.sparkfun.com/datasheets/Sensors/LightImaging/OV5640_datasheet.pdf
>>
>> Fixes: 19a81c1426c1 ("[media] add Omnivision OV5640 sensor driver")
>> Signed-off-by: Nishanth Menon <nm@ti.com>
>> ---
>>   drivers/media/i2c/ov5640.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
>> index 41e4a4f1b99d..7b0ff04a2c93 100644
>> --- a/drivers/media/i2c/ov5640.c
>> +++ b/drivers/media/i2c/ov5640.c
>> @@ -475,7 +475,7 @@ static const struct v4l2_mbus_framefmt ov5640_default_fmt = {
>>   };
>>
>>   static const struct reg_value ov5640_init_setting[] = {
>> -	{0x3103, 0x11, 0, 0}, {0x3008, 0x82, 0, 5}, {0x3008, 0x42, 0, 0},
>> +	{0x3103, 0x11, 0, 0}, {0x3008, 0x82, 0, 5}, {0x3008, 0x42, 0, 20},
> 
> I'm debated here...
> 
> This adds a 20msec delay, even in case the reset has been performed
> using the GPIO reset line.
> 
> Ideally, these SW resets should be moved to ov5640_reset() and only
> used if no HW pin is available.
> 
> I wonder if ov5640_reset() could go as:
> 
> static void ov5640_reset(struct ov5640_dev *sensor)
> {
> 	if (sensor->pwdn_gpio) {
> 		gpiod_set_value_cansleep(sensor->reset_gpio, 0);
> 
> 		/* camera power cycle */
> 		ov5640_power(sensor, false);
> 		usleep_range(5000, 10000);
> 		ov5640_power(sensor, true);
> 		usleep_range(5000, 10000);
> 
> 		gpiod_set_value_cansleep(sensor->reset_gpio, 1);
> 		usleep_range(1000, 2000);
> 
> 		gpiod_set_value_cansleep(sensor->reset_gpio, 0);
> 	} else {
> 		ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0, 0x82);
> 		usleep_range(5000, 10000);
> 
> 		ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0, 0x42);
> 	}
> 
> 	usleep_range(20000, 25000);
> }
> 
> 
> And remove
>           {0x3008, 0x82, 0, 5}, {0x3008, 0x42, 0, 0},
> from the init_settings[] table.
> 
> FWIW I have a setup with reset and pwdn lines and I have tried
> with both lines made available to the driver from DTS, and also by removing
> them from DTS. In both cases the sensor works for me and the first
> captured pictures are ok. Removing the gpio lines from DTS
> is probably not enough to simulate a "software-only" setup as the
> lines might be left floating and could interfere with the powerup
> operations, but in my case it seems it's ok.
> 
> Could you try with your setup to see if it works ?

Will do.

> 
> Am I overthinking it ? A delay of 50+msec (25 hw + 25 sw) at power-up
> time is not negligible considering that half of that might not be
> necessary.

I agree, 50ms is too much. I will rework [2/3] and [3/3] to move SW 
reset in a common function.

> 
> 
>>   	{0x3103, 0x03, 0, 0}, {0x3630, 0x36, 0, 0},
>>   	{0x3631, 0x0e, 0, 0}, {0x3632, 0xe2, 0, 0}, {0x3633, 0x12, 0, 0},
>>   	{0x3621, 0xe0, 0, 0}, {0x3704, 0xa0, 0, 0}, {0x3703, 0x5a, 0, 0},
>> --
>> 2.17.1
>>

Thanks,
Jai
