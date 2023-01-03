Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1051E65BC68
	for <lists+linux-media@lfdr.de>; Tue,  3 Jan 2023 09:44:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237066AbjACIoX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Jan 2023 03:44:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232898AbjACIoG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Jan 2023 03:44:06 -0500
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE6031126
        for <linux-media@vger.kernel.org>; Tue,  3 Jan 2023 00:44:02 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3038hmkS025566;
        Tue, 3 Jan 2023 02:43:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1672735428;
        bh=5j574VwudCGyVElyGl0vSp0cUaktQKEVzmS0+SDOXwg=;
        h=Date:Subject:To:CC:References:From:In-Reply-To;
        b=CRgQQxEmVVhQLE0npZ665aGy+YTPmNjJAfnnqOvlLZ2J65ixVzcYVWiWAvHgtcsIk
         QVZ88EEU1Ec+3YQDPrKLphZhsycac9ocPgHhHn1ysSHJrIpo8Bz8KEfpbo0/wqxR4X
         Z8n88JOtE2BR+1g+TzT736/Y4aT0Yi9JYh/7X+2k=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3038hmh3104978
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 3 Jan 2023 02:43:48 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 3
 Jan 2023 02:43:48 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 3 Jan 2023 02:43:48 -0600
Received: from [172.24.145.60] (ileaxei01-snat.itg.ti.com [10.180.69.5])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3038hjv5010389;
        Tue, 3 Jan 2023 02:43:46 -0600
Message-ID: <56b2dfc8-0caf-8a88-e46a-1327f7a870e7@ti.com>
Date:   Tue, 3 Jan 2023 14:13:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 2/3] media: ov5640: Fix soft reset sequence and timings
Content-Language: en-US
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
CC:     Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        <linux-media@vger.kernel.org>, Nishanth Menon <nm@ti.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221227173634.5752-1-j-luthra@ti.com>
 <20221227173634.5752-3-j-luthra@ti.com>
 <20221229180748.xjb2cpiehzlvbv7f@uno.localdomain>
 <0a4f4d74-3f9e-2305-b627-5ce3bd3d1d22@ti.com>
 <20230102124809.6a62e7aeifkixllu@uno.localdomain>
From:   Jai Luthra <j-luthra@ti.com>
In-Reply-To: <20230102124809.6a62e7aeifkixllu@uno.localdomain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 02/01/23 18:18, Jacopo Mondi wrote:
> Hi Jay
> 
> On Fri, Dec 30, 2022 at 02:33:41PM +0530, Luthra, Jai wrote:
>> Hi Jacopo,
>>
>> Thank you for the comments.
>>
>> On 29/12/22 23:37, Jacopo Mondi wrote:
>>> Hi Jai
>>>
>>> On Tue, Dec 27, 2022 at 11:06:33PM +0530, Jai Luthra wrote:
>>>> Move the register-based reset out of the init_setting[] and into the
>>>> powerup_sequence function. The sensor is power cycled and reset using
>>>> the gpio pins so the soft reset is not always necessary.
>>>>
>>>> This also ensures that soft reset honors the timing sequence
>>>> from the datasheet [1].
>>>>
>>>> [1] https://cdn.sparkfun.com/datasheets/Sensors/LightImaging/OV5640_datasheet.pdf
>>>>
>>>> Fixes: 19a81c1426c1 ("[media] add Omnivision OV5640 sensor driver")
>>>> Suggested-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>>> Signed-off-by: Jai Luthra <j-luthra@ti.com>
>>>> ---
>>>>    drivers/media/i2c/ov5640.c | 30 ++++++++++++++++++++----------
>>>>    1 file changed, 20 insertions(+), 10 deletions(-)
>>>>
>>>> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
>>>> index e6525caa9b8c..5df16fb6f0a0 100644
>>>> --- a/drivers/media/i2c/ov5640.c
>>>> +++ b/drivers/media/i2c/ov5640.c
>>>> @@ -50,6 +50,7 @@
>>>>    #define OV5640_REG_SYS_CTRL0		0x3008
>>>>    #define OV5640_REG_SYS_CTRL0_SW_PWDN	0x42
>>>>    #define OV5640_REG_SYS_CTRL0_SW_PWUP	0x02
>>>> +#define OV5640_REG_SYS_CTRL0_SW_RST	0x82
>>>>    #define OV5640_REG_CHIP_ID		0x300a
>>>>    #define OV5640_REG_IO_MIPI_CTRL00	0x300e
>>>>    #define OV5640_REG_PAD_OUTPUT_ENABLE01	0x3017
>>>> @@ -532,7 +533,7 @@ static const struct v4l2_mbus_framefmt ov5640_default_fmt = {
>>>>    };
>>>>
>>>>    static const struct reg_value ov5640_init_setting[] = {
>>>> -	{0x3103, 0x11, 0, 0}, {0x3008, 0x82, 0, 5}, {0x3008, 0x42, 0, 0},
>>>> +	{0x3103, 0x11, 0, 0}, {0x3008, 0x42, 0, 0},
>>>
>>> have you tried removing the second entry
>>>           {0x3008, 0x42, 0, 0},
>>>
>>> as well ?
>>>
>>> The SW_PWDN state allows programming registers (how can you exit with
>>> SW_PWUP otherwise?), so it's probably right to have it there.
>>
>> Yes, I initially removed it from here and kept it in the powerup_sequence()
>> but logic to set SW_PWDN became in that function became a bit complicated:
>>
>> When we are using HW pins, we want to wait 20ms after de-asserting RESET
>> before doing any SCCB register writes. But when we are using SW reset, we
>> were using this register write to de-assert RESET, and then wait 20ms.
>>
>> I found it cleaner to just keep it here where the registers are being
>> programmed for both the cases. But I don't have a strong opinion either way.
>>
>>>
>>>
>>>
>>>>    	{0x3103, 0x03, 0, 0}, {0x3630, 0x36, 0, 0},
>>>>    	{0x3631, 0x0e, 0, 0}, {0x3632, 0xe2, 0, 0}, {0x3633, 0x12, 0, 0},
>>>>    	{0x3621, 0xe0, 0, 0}, {0x3704, 0xa0, 0, 0}, {0x3703, 0x5a, 0, 0},
>>>> @@ -2440,18 +2441,27 @@ static void ov5640_power(struct ov5640_dev *sensor, bool enable)
>>>>     */
>>>>    static void ov5640_powerup_sequence(struct ov5640_dev *sensor)
>>>>    {
>>>> -	gpiod_set_value_cansleep(sensor->reset_gpio, 0);
>>>> +	if (sensor->pwdn_gpio) {
>>>> +		gpiod_set_value_cansleep(sensor->reset_gpio, 0);
>>>>
>>>> -	/* camera power cycle */
>>>> -	ov5640_power(sensor, false);
>>>> -	usleep_range(5000, 10000);
>>>> -	ov5640_power(sensor, true);
>>>> -	usleep_range(5000, 10000);
>>>> +		/* camera power cycle */
>>>> +		ov5640_power(sensor, false);
>>>> +		usleep_range(5000, 10000);
>>>> +		ov5640_power(sensor, true);
>>>> +		usleep_range(5000, 10000);
>>>>
>>>> -	gpiod_set_value_cansleep(sensor->reset_gpio, 1);
>>>> -	usleep_range(1000, 2000);
>>>> +		gpiod_set_value_cansleep(sensor->reset_gpio, 1);
>>>> +		usleep_range(1000, 2000);
>>>>
>>>> -	gpiod_set_value_cansleep(sensor->reset_gpio, 0);
>>>> +		gpiod_set_value_cansleep(sensor->reset_gpio, 0);
>>>> +	} else {
>>>> +		/* software reset */
>>>> +		ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0,
>>>> +				 OV5640_REG_SYS_CTRL0_SW_RST);
>>>> +		usleep_range(5000, 10000);
>>>> +		ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0,
>>>> +				 OV5640_REG_SYS_CTRL0_SW_PWUP);
>>>
>>> But now I wonder if this last PWUP is necessary, since init_settings[]
>>> (which programs PWDN) is programmed immediately after.
>>
>> Using the PWUP (0x02) as a way to de-assert RST (0x42) here, and not as an
> 
> RST is 0x82 if I read it right

Oops made a typo, yes RST is 0x82.

> 
>> actual PWUP per se.
>>
> 
> It is not necessary. The RST cleans up itself when the chip has done
> resetting. I tested it with:
> 
> @@ -2463,12 +2478,24 @@ static void ov5640_powerup_sequence(struct ov5640_dev *sensor)
> 
>                  gpiod_set_value_cansleep(sensor->reset_gpio, 0);
>          } else {
> +               int ret;
> +               u16 sysctrl = 0;
> +               u16 counter = 0;
> +
>                  /* software reset */
>                  ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0,
>                                   OV5640_REG_SYS_CTRL0_SW_RST);
> -                usleep_range(5000, 10000);
> -               ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0,
> -                                OV5640_REG_SYS_CTRL0_SW_PWUP);
> +
> +               do {
> +                       usleep_range(2000, 2500);
> +                       ret = ov5640_read_reg16(sensor, OV5640_REG_SYS_CTRL0,
> +                                               &sysctrl);
> +                       if (ret)
> +                               pr_err("Failed to read sysctrl: %d\n", ret);
> +               } while (sysctrl & BIT(7) || ++counter > 100);
> +
> +               pr_err("Exit from reset in %u loops\n", counter);
>          }
>          usleep_range(20000, 25000);
> 
> The loop exists after 1 iteration
> 
> So I guess you can remove the last SW_PWUP write

Great that simplifies things, thanks for that quick test!

> 
>>>
>>>
>>>> +	}
>>>>    	usleep_range(20000, 25000);
>>
>> Now that I think of it, we can move the PWDN from the register table to
>> here, after this sleep - and keep the (0x02) above to de-assert reset. Let
>> me know your thoughts.
>>
> 
> Yes, I think it might be a good idea.
> The diff on top of your series should be like
> 
> ------------------------------------------------------------------------------
> -- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -533,7 +533,7 @@ static const struct v4l2_mbus_framefmt ov5640_default_fmt = {
>   };
> 
>   static const struct reg_value ov5640_init_setting[] = {
> -       {0x3103, 0x11, 0, 0}, {0x3008, 0x42, 0, 0},
> +       {0x3103, 0x11, 0, 0},
>          {0x3103, 0x03, 0, 0}, {0x3630, 0x36, 0, 0},
>          {0x3631, 0x0e, 0, 0}, {0x3632, 0xe2, 0, 0}, {0x3633, 0x12, 0, 0},
>          {0x3621, 0xe0, 0, 0}, {0x3704, 0xa0, 0, 0}, {0x3703, 0x5a, 0, 0},
> @@ -2466,11 +2466,12 @@ static void ov5640_powerup_sequence(struct ov5640_dev *sensor)
>                  /* software reset */
>                  ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0,
>                                   OV5640_REG_SYS_CTRL0_SW_RST);
> -               usleep_range(5000, 10000);
> -               ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0,
> -                                OV5640_REG_SYS_CTRL0_SW_PWUP);
>          }
>          usleep_range(20000, 25000);
> +
> +       /* Software standby: allows registers programming; exit at s_stream(1) */
> +       ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0,
> +                        OV5640_REG_SYS_CTRL0_SW_PWDN);
>   }
> 
>   static int ov5640_set_power_on(struct ov5640_dev *sensor)
> ------------------------------------------------------------------------------
> 
> Do you agree with this ?
> 
> Also, since you have to resend, could you please swap the order of
> patches 1 and 2 ? It's more logically correct to plumb the SW reset
> handling in, then allow it to happen as you do in patch 1/3.

Makes sense, I will move the SW PWDN and re-order the patches in v4.

> 
>>>>    }
>>>>
>>>> --
>>>> 2.17.1
>>>>
>>
>> Thanks,
>> Jai

Thanks,
Jai
