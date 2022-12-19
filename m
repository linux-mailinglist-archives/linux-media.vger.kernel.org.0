Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 730A6650D1D
	for <lists+linux-media@lfdr.de>; Mon, 19 Dec 2022 15:17:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231394AbiLSORu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Dec 2022 09:17:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbiLSORs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Dec 2022 09:17:48 -0500
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3319AB7E2
        for <linux-media@vger.kernel.org>; Mon, 19 Dec 2022 06:17:46 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2BJEHWtL072831;
        Mon, 19 Dec 2022 08:17:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1671459452;
        bh=q1cc7NdqP3cKihh0hn+Q1Fp8awqHXlLSpcXpxT+9OHA=;
        h=Date:Subject:To:CC:References:From:In-Reply-To;
        b=NDQUm71Agb1VtTimLn3QxQ1BnvGtu5OdNlKpjJBzDnJ5UuVcr1ZEGTsPwDK98lPxe
         eYk0K/l6QzJWXdpdAmHyA08gccJACbn8al+eYMHhhv9SwCmDBbTkKVFpSpIvDUJ51C
         E0+knFTHZUEDKmIQgMOeBIdnNUgw6tl+4fu6QwdE=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2BJEHWi2082962
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 19 Dec 2022 08:17:32 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 19
 Dec 2022 08:17:31 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 19 Dec 2022 08:17:31 -0600
Received: from [172.24.145.60] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2BJEHSUX114024;
        Mon, 19 Dec 2022 08:17:29 -0600
Message-ID: <28d474a0-0acc-46c1-b7a2-91a8f104a3e9@ti.com>
Date:   Mon, 19 Dec 2022 19:47:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 3/3] media: ov5640: Honor power on time in init_setting
Content-Language: en-US
To:     Jacopo Mondi <jacopo@jmondi.org>
CC:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        <linux-media@vger.kernel.org>, Nishanth Menon <nm@ti.com>
References: <20221216134409.6868-1-j-luthra@ti.com>
 <20221216134409.6868-4-j-luthra@ti.com>
 <20221219101023.kgctbtqbuq6ajjmo@uno.localdomain>
 <34e4f5a3-61c4-c1a6-623c-4d51a589d841@ti.com>
 <20221219132519.tbsl3rsbm5lowivz@uno.localdomain>
From:   Jai Luthra <j-luthra@ti.com>
In-Reply-To: <20221219132519.tbsl3rsbm5lowivz@uno.localdomain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
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

On 19/12/22 18:55, Jacopo Mondi wrote:
> Hi Jai
> 
> On Mon, Dec 19, 2022 at 06:38:54PM +0530, Jai Luthra wrote:
>> Hi Jacopo,
>>
>> Thank you for the comments.
>>
>> On 19/12/22 15:40, Jacopo Mondi wrote:
>>> Hi Jai
>>>
>>> On Fri, Dec 16, 2022 at 07:14:09PM +0530, Jai Luthra wrote:
>>>> From: Nishanth Menon <nm@ti.com>
>>>>
>>>> OV5640 Datasheet[1] Figures 2-3 and 2-4 indicate the timing sequences
>>>> that is expected during various initialization steps. Note the power
>>>> on time includes t0 + t1 + t2 >= 5ms, delay for poweron.
>>>>
>>>> As indicated in section 2.8, the PWDN assertion can either be via
>>>> external pin control OR via the register 0x3008 bit 6 (see table 7-1 in
>>>> [1])
>>>>
>>>> [1] https://cdn.sparkfun.com/datasheets/Sensors/LightImaging/OV5640_datasheet.pdf
>>>>
>>>> Fixes: 19a81c1426c1 ("[media] add Omnivision OV5640 sensor driver")
>>>> Signed-off-by: Nishanth Menon <nm@ti.com>
>>>> ---
>>>>    drivers/media/i2c/ov5640.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
>>>> index fa84e60de0db..ff2a2c9358e7 100644
>>>> --- a/drivers/media/i2c/ov5640.c
>>>> +++ b/drivers/media/i2c/ov5640.c
>>>> @@ -608,7 +608,7 @@ static const struct reg_value ov5640_init_setting[] = {
>>>>    	{0x583b, 0x28, 0, 0}, {0x583c, 0x42, 0, 0}, {0x583d, 0xce, 0, 0},
>>>>    	{0x5025, 0x00, 0, 0}, {0x3a0f, 0x30, 0, 0}, {0x3a10, 0x28, 0, 0},
>>>>    	{0x3a1b, 0x30, 0, 0}, {0x3a1e, 0x26, 0, 0}, {0x3a11, 0x60, 0, 0},
>>>> -	{0x3a1f, 0x14, 0, 0}, {0x3008, 0x02, 0, 0}, {0x3c00, 0x04, 0, 300},
>>>> +	{0x3a1f, 0x14, 0, 0}, {0x3008, 0x02, 0, 5}, {0x3c00, 0x04, 0, 300},
>>>
>>> Two observations:
>>>
>>> as per the description of register 0x3008
>>>
>>> 3008 default value = 0x02
>>> 3008[7] = Software Reset
>>> 3008[6] = Software Power Down
>>>
>>> The init_settings[] register table has these entries at the very
>>> beginning
>>>
>>> 	{0x3008, 0x82, 0, 5}, {0x3008, 0x42, 0, 0},
>>>
>>> and ends with the entry you have modified
>>>
>>>           {0x3008, 0x02, 0, 5}
>>>
>>> As I read from the 2.8 section of the datasheet
>>>
>>> A reset can also be initiated through the SCCB interface by setting
>>> register 0x3008[7] to high.
>>>
>>> So I presume the first two registers entries:
>>>
>>> 	{0x3008, 0x82, 0, 5} -> Start a SW reset and wait 5 msec
>>>                                   for the chip to resume
>>> 	{0x3008, 0x42, 0, 0} -> SW standby mode
>>>
>>> SW standby mode is described as:
>>>
>>>           Executing a software standby through the SCCB interface
>>>           suspends internal circuit activity but does not halt the
>>>           device clock. All register content is maintained in standby
>>>           mode.
>>
>> I agree with everything above.
>>
>>>
>>> I presume that the first
>>>
>>> 	{0x3008, 0x42, 0, 0}
>>>
>>>    exists from SW standby mode to program the chip and the last
>>
>> Here I'm a little confused. Isn't it the opposite according to the
>> datasheet?
>>
>> Setting the register to 0x42 (bit 6 = 1) initiates SW standby, which I
>> assume stops all other functions on the chip but still allows programming
>> registers.
>>
> 
> I haven't found any mention about the BIT(6) polarity. IOW I haven't
> found documented if setting it to 1 enters or exists SW standby mode.
> 
> Your reasoning is valid, I'm just a bit surprised the SCCB is active
> and registers can be programmed while in standby mode. >
> However, this
> 
> #define OV5640_REG_SYS_CTRL0_SW_PWDN	0x42
> #define OV5640_REG_SYS_CTRL0_SW_PWUP	0x02
> 
> seems to confirm what you said. >
>>>
>>>           {0x3008, 0x02, 0, 5}
>>>
>>> puts the chip in sw standby at the end of init_settings[]
>>
>> Then setting 0x02 (bit 6 = 0) exits from SW standby in case of MIPI.
>>
>> For DVP though, I see that we skip setting 0x02 to that register in
>> ov5640_load_regs(), so sensor stays in SW standby mode until
>> ov5640_set_stream_dvp() is called.
>>
> 
> That's what confused me. init_settings[] are programmed for both DVP
> and MIPI. If the last write to 0x3008 is 0x02 there shouldn't be any
> need to re-program it. However since ov5640_set_stream_dvp() is called
> in the s_stream() call path it means SW standby is entered between
> every streaming session.
> 
> Please note that no 5msec delay is respected when
> existing/entering sw standby between streaming session.

Good catch, I wonder if that is what causes failure to stream here
https://lore.kernel.org/all/3b54ab9b-4ffd-ab32-d495-fad6132ea504@microchip.com/

Will fix in v2.

> >
>>> Software standby is then exited by ov5640_set_stream_dvp() for DVP and
>>> by clearing 0x300e[4:3] in MIPI mode, as the datasheet reports:
>>>
>>>           To initiate hardware standby mode, the PWDN pin must be tied to high
>>>           (while in MIPI mode, set register 0x300E[4:3] to 2’b11 before the PWDN
>>>           pin is set to high >
>>> My second observation is that those entries in the init_settings[]
>>> table performs SW reset/standby regardless if there's a GPIO or not
>>> installed to control the reset and pwdn lines.
>>>
>>> Would it be worth in your opinion trying to modify ov5640_power()
>>> and ov5640_reset() to use either SW or HW standby/reset conditionally
>>> on the avialability of sensor->reset_gpio and sensor->pwdn_gpio and
>>> remove the initial SW standby/reset from init_setting[] ?
>>
>> I don't think we can use the SCCB register pwdn & reset for the initial
>> sensor power up sequence, as sensor SCCB depends on the correct sequence
>> being followed on hardware pins. From Section 2.8:
> 
> I was suggesting to use sw reset/powerup if no gpios are registered.
> 
>>
>> 	Manually applying a hard reset upon power up is required even
>> 	though on-chip reset is included.
>>
> 
> Do you interpret "Manually applying a reset upon power up" to imply
> "software reset" ? As I read it it doesn't require the reset to be
> SW or HW.

It's the second phrase "though on-chip reset is included" that makes me 
believe they require it to be HW only.

> 
>> But I agree, if some module does not wire the pins at all then we might have
>> to ignore the datasheet here and try it using the register.
>>
> 
> That's what I was suggesting. If you have gpios you shouldn't need
> initial SW resets and powerup. If you don't have gpios, use sw reset
> so that the reset/powerup routines are centralized and not spread between
> register tables and functions ?

Makes sense, I will try this out and spin it as a separate series.

> 
> What setup are you testing with ? DVP or MIPI ? With gpios or without
> ? I can test on a 2-data lanes MIPI setup with HW gpio lines if it
> helps.

Thanks, my module is similar with MIPI but only has the PWUP gpio line. 
Might send you the patches separately if it doesn't work on my setup.

> 
> Thanks
>    j
> 

Thanks,
Jai

> 
> 
>>>
>>>>    };
>>>>
>>>>    static const struct reg_value ov5640_setting_low_res[] = {
>>>> --
>>>> 2.17.1
>>>>
>>
>> Thanks,
>> Jai
