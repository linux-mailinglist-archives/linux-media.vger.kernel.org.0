Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5295465BC5C
	for <lists+linux-media@lfdr.de>; Tue,  3 Jan 2023 09:39:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231184AbjACIj0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Jan 2023 03:39:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237112AbjACIjV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Jan 2023 03:39:21 -0500
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEB60DF59
        for <linux-media@vger.kernel.org>; Tue,  3 Jan 2023 00:39:18 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3038d8qT045171;
        Tue, 3 Jan 2023 02:39:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1672735148;
        bh=wn51pyupL2kCp9ZXX8sikzMgd0nnnZUM199Kp2oMuak=;
        h=Date:Subject:To:CC:References:From:In-Reply-To;
        b=R4x0MgoGvCxLRASCO7cWRCn7X3oKBmUyR/w6qHuqECsjbcF2K3dQ0mMPyz6Dr9+Ln
         hyOw1VlwuKRUko0L2/A49iuTwDRMD0hzguEEpFFg6HEfOeO56VS/gBWVziC5SDION3
         GMLcHyGGXdvvgHBEBi6pc+v8S+Xy2nQD/02VI5yY=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3038d8Ll102699
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 3 Jan 2023 02:39:08 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 3
 Jan 2023 02:39:08 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 3 Jan 2023 02:39:08 -0600
Received: from [172.24.145.60] (ileaxei01-snat.itg.ti.com [10.180.69.5])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3038d4p2046703;
        Tue, 3 Jan 2023 02:39:05 -0600
Message-ID: <eb8c7fcd-32a5-ff09-6ed5-edf394b1d9f5@ti.com>
Date:   Tue, 3 Jan 2023 14:09:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 3/3] media: ov5640: Honor power on time in init_setting
Content-Language: en-US
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Nishanth Menon <nm@ti.com>
CC:     Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        <linux-media@vger.kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221227173634.5752-1-j-luthra@ti.com>
 <20221227173634.5752-4-j-luthra@ti.com>
 <20221229181036.a6eldz42eaksared@uno.localdomain>
 <20230102125903.5r3ot4v3gbskrstc@uno.localdomain>
From:   Jai Luthra <j-luthra@ti.com>
In-Reply-To: <20230102125903.5r3ot4v3gbskrstc@uno.localdomain>
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

On 02/01/23 18:29, Jacopo Mondi wrote:
> Hello again
> 
> On Thu, Dec 29, 2022 at 07:10:36PM +0100, Jacopo Mondi wrote:
>> Hi again
>>
>> On Tue, Dec 27, 2022 at 11:06:34PM +0530, Jai Luthra wrote:
>>> From: Nishanth Menon <nm@ti.com>
>>>
>>> OV5640 Datasheet[1] Figures 2-3 and 2-4 indicate the timing sequences
>>> that is expected during various initialization steps. Note the power
>>> on time includes t0 + t1 + t2 >= 5ms, delay for poweron.
>>>
>>> As indicated in section 2.8, the PWDN assertion can either be via
>>> external pin control OR via the register 0x3008 bit 6 (see table 7-1 in
>>> [1])
>>>
>>> [1] https://cdn.sparkfun.com/datasheets/Sensors/LightImaging/OV5640_datasheet.pdf
>>>
>>> Fixes: 19a81c1426c1 ("[media] add Omnivision OV5640 sensor driver")
>>> Signed-off-by: Nishanth Menon <nm@ti.com>
>>> Signed-off-by: Jai Luthra <j-luthra@ti.com>
>>> ---
>>>   drivers/media/i2c/ov5640.c | 16 ++++++++++++----
>>>   1 file changed, 12 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
>>> index 5df16fb6f0a0..bd7cc294cfe6 100644
>>> --- a/drivers/media/i2c/ov5640.c
>>> +++ b/drivers/media/i2c/ov5640.c
>>> @@ -609,7 +609,7 @@ static const struct reg_value ov5640_init_setting[] = {
>>>   	{0x583b, 0x28, 0, 0}, {0x583c, 0x42, 0, 0}, {0x583d, 0xce, 0, 0},
>>>   	{0x5025, 0x00, 0, 0}, {0x3a0f, 0x30, 0, 0}, {0x3a10, 0x28, 0, 0},
>>>   	{0x3a1b, 0x30, 0, 0}, {0x3a1e, 0x26, 0, 0}, {0x3a11, 0x60, 0, 0},
>>> -	{0x3a1f, 0x14, 0, 0}, {0x3008, 0x02, 0, 0}, {0x3c00, 0x04, 0, 300},
>>> +	{0x3a1f, 0x14, 0, 0}, {0x3008, 0x02, 0, 5}, {0x3c00, 0x04, 0, 300},
>>
>> This might also allow to remove the
>>
>> 		/* remain in power down mode for DVP */
>> 		if (regs->reg_addr == OV5640_REG_SYS_CTRL0 &&
>> 		    val == OV5640_REG_SYS_CTRL0_SW_PWUP &&
>> 		    !ov5640_is_csi2(sensor))
>> 			continue;
>>
>> in ov5640_load_regs()
>>
>> Prabhakar since you have introduced it, coudl you test if you still
>> need it with Nishanth's patch applied ?
> 
> No, it doesn't, sorry for the confusion.
> 
> The following patch would allow to remove the above quirk by removing
>          {0x3008, 0x02}
> from the init_sequence[].
> 
> Unfortunately the first 3 images are then black when running in CSI-2
> mode.
> 
> -------------------------------------------------------------------------------
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 96b986051414..bfb60648c72a 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -609,7 +609,7 @@ static const struct reg_value ov5640_init_setting[] = {
>          {0x583b, 0x28, 0, 0}, {0x583c, 0x42, 0, 0}, {0x583d, 0xce, 0, 0},
>          {0x5025, 0x00, 0, 0}, {0x3a0f, 0x30, 0, 0}, {0x3a10, 0x28, 0, 0},
>          {0x3a1b, 0x30, 0, 0}, {0x3a1e, 0x26, 0, 0}, {0x3a11, 0x60, 0, 0},
> -       {0x3a1f, 0x14, 0, 0}, {0x3008, 0x02, 0, 5}, {0x3c00, 0x04, 0, 300},
> +       {0x3a1f, 0x14, 0, 0}, {0x3c00, 0x04, 0, 300},
>   };
> 
>   static const struct reg_value ov5640_setting_low_res[] = {
> @@ -1808,7 +1808,7 @@ static int ov5640_set_autogain(struct ov5640_dev *sensor, bool on)
>                                BIT(1), on ? 0 : BIT(1));
>   }
> 
> -static int ov5640_set_stream_dvp(struct ov5640_dev *sensor, bool on)
> +static int ov5640_set_stream(struct ov5640_dev *sensor, bool on)
>   {
>          int ret;
> 
> @@ -3725,11 +3725,13 @@ static int ov5640_s_stream(struct v4l2_subdev *sd, int enable)
>                          sensor->pending_fmt_change = false;
>                  }
> 
> -               if (ov5640_is_csi2(sensor))
> +               if (ov5640_is_csi2(sensor)) {
>                          ret = ov5640_set_stream_mipi(sensor, enable);
> -               else
> -                       ret = ov5640_set_stream_dvp(sensor, enable);
> +                       if (ret)
> +                               goto out;
> +               }
> 
> +               ret = ov5640_set_stream(sensor, enable);
>                  if (!ret)
>                          sensor->streaming = enable;
>          }
> -------------------------------------------------------------------------------
> 
> I do however now question the patch utility itself. SW PWDN is the
> software standby state, while Figure 2.3 and 2.4 you mention in the
> commit message report:
> 
> t2 = 5 ms: delay from DVDD stable to sensor power up stable
> 
> I doubt this apply to SW standby as it the delay is probably required
> to have the internal circuitry stabilize after the power rail has been
> enabled.

Good catch.

> 
> Does this patch make any practical difference in your setup ? I'm
> asking as in my case it doesn't, but I'm on a CSI-2 setup.

I tested today with this patch removed, and it does not make any 
difference to the probe success rate. We missed this during development 
as we first tried the SW powerdown and reset timing changes, and later 
the hardware reset timing changes [1/3].

I will drop this patch in the next series. Thanks for pointing this out.

> 
>>
>> Thanks
>>    j
>>
>>
>>>   };
>>>
>>>   static const struct reg_value ov5640_setting_low_res[] = {
>>> @@ -1810,9 +1810,17 @@ static int ov5640_set_autogain(struct ov5640_dev *sensor, bool on)
>>>
>>>   static int ov5640_set_stream_dvp(struct ov5640_dev *sensor, bool on)
>>>   {
>>> -	return ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0, on ?
>>> -				OV5640_REG_SYS_CTRL0_SW_PWUP :
>>> -				OV5640_REG_SYS_CTRL0_SW_PWDN);
>>> +	int ret;
>>> +
>>> +	if (on) {
>>> +		ret = ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0,
>>> +				       OV5640_REG_SYS_CTRL0_SW_PWUP);
>>> +		usleep_range(5000, 6000);
>>> +	} else {
>>> +		ret = ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0,
>>> +				       OV5640_REG_SYS_CTRL0_SW_PWDN);
>>> +	}
>>> +	return ret;
>>>   }
>>>
>>>   static int ov5640_set_stream_mipi(struct ov5640_dev *sensor, bool on)
>>> --
>>> 2.17.1
>>>

Thanks,
Jai
