Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E0D91FCA97
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2020 12:16:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726313AbgFQKQu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jun 2020 06:16:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725536AbgFQKQt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jun 2020 06:16:49 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0F80C061573
        for <linux-media@vger.kernel.org>; Wed, 17 Jun 2020 03:16:49 -0700 (PDT)
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2C342F9;
        Wed, 17 Jun 2020 12:16:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592389008;
        bh=DRKEFqBp1g6CJZLt0dLOSXYeAHYjmxU2hv358vk2Ens=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=RvGlDZux1+mWfxJjmklO5vd6wdPD5JUw+2eeZ73Jp9SXLolaeRBTAUwLKo7SpHGuX
         wHQyGrsbUphnjHe1KB0+yGiAggforzSNzUXpweEulWLC6g3L/NHKmfIlroZSxkniN6
         zuuMN19GcW44n5wc8IJ+ZR2K9NZJm2Ru97Ezlww0=
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v1 078/107] media: ti-vpe: cal: Don't store external rate
 in cal_camerarx
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
 <20200614235944.17716-79-laurent.pinchart@ideasonboard.com>
 <50074fee-06aa-8511-2134-3ff51a66eda0@ideasonboard.com>
 <20200617100548.GB5838@pendragon.ideasonboard.com>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 WZw01QYHU/GUV/zHJSFk
Organization: Ideas on Board
Message-ID: <662619b0-21f2-9bb7-454c-f8fcf38e610f@ideasonboard.com>
Date:   Wed, 17 Jun 2020 11:16:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200617100548.GB5838@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 17/06/2020 11:05, Laurent Pinchart wrote:
> Hi Kieran,
> 
> On Wed, Jun 17, 2020 at 10:56:29AM +0100, Kieran Bingham wrote:
>> On 15/06/2020 00:59, Laurent Pinchart wrote:
>>> The external pixel rate is retrieved when starting the camerarx and only
>>> used then. There's no need to store it in the cal_camerarx structure, it
>>> can be returned by cal_camerarx_get_external_info() and explicitly
>>> passed to cal_camerarx_config().
>>>
>>> While at it, rename cal_camerarx_get_external_info() to
>>> cal_camerarx_get_external_rate() to better reflect the function's
>>> purpose.
>>>
>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> ---
>>>  drivers/media/platform/ti-vpe/cal.c | 24 ++++++++++++------------
>>>  1 file changed, 12 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
>>> index 8326db0e4197..a11457909134 100644
>>> --- a/drivers/media/platform/ti-vpe/cal.c
>>> +++ b/drivers/media/platform/ti-vpe/cal.c
>>> @@ -272,7 +272,6 @@ struct cal_camerarx {
>>>  	struct v4l2_fwnode_endpoint	endpoint;
>>>  	struct device_node	*sensor_node;
>>>  	struct v4l2_subdev	*sensor;
>>> -	unsigned int		external_rate;
>>
>> Here, external_rate is 32 bit,
>>
>>>  };
>>>  
>>>  struct cal_dev {
>>> @@ -481,9 +480,10 @@ static void cal_quickdump_regs(struct cal_dev *cal)
>>>   * ------------------------------------------------------------------
>>>   */
>>>  
>>> -static int cal_camerarx_get_external_info(struct cal_camerarx *phy)
>>> +static s64 cal_camerarx_get_external_rate(struct cal_camerarx *phy)
>>>  {
>>>  	struct v4l2_ctrl *ctrl;
>>> +	s64 rate;
>>
>> and now it becomes a 64 bit value.
>>
>>>  
>>>  	if (!phy->sensor)
>>>  		return -ENODEV;
>>> @@ -495,10 +495,10 @@ static int cal_camerarx_get_external_info(struct cal_camerarx *phy)
>>>  		return -EPIPE;
>>>  	}
>>>  
>>> -	phy->external_rate = v4l2_ctrl_g_ctrl_int64(ctrl);
>>> -	phy_dbg(3, phy, "sensor Pixel Rate: %u\n", phy->external_rate);
>>> +	rate = v4l2_ctrl_g_ctrl_int64(ctrl);
>>> +	phy_dbg(3, phy, "sensor Pixel Rate: %llu\n", rate);
>>>  
>>> -	return 0;
>>> +	return rate;
>>>  }
>>>  
>>>  static void cal_camerarx_lane_config(struct cal_camerarx *phy)
>>> @@ -554,7 +554,7 @@ static void cal_camerarx_disable(struct cal_camerarx *phy)
>>>  #define TCLK_MISS	1
>>>  #define TCLK_SETTLE	14
>>>  
>>> -static void cal_camerarx_config(struct cal_camerarx *phy,
>>> +static void cal_camerarx_config(struct cal_camerarx *phy, s64 external_rate,
>>>  				const struct cal_fmt *fmt)
>>>  {
>>>  	unsigned int reg0, reg1;
>>> @@ -566,7 +566,7 @@ static void cal_camerarx_config(struct cal_camerarx *phy,
>>>  
>>>  	/* DPHY timing configuration */
>>>  	/* CSI-2 is DDR and we only count used lanes. */
>>> -	csi2_ddrclk_khz = phy->external_rate / 1000
>>> +	csi2_ddrclk_khz = external_rate / 1000
>>>  		/ (2 * num_lanes) * fmt->bpp;
>>
>> Which causes this calculation to fail on 32 bit ARM builds.
>> (I'm building for the DRA76-EVM).
> 
> Oops :-/
> 
>> I've got the following fix up on the top of your tree to solve this, but
>> I'm not particularly happy about having to break the calculation up (and
>> re-use external_rate) though the use of do_div.
>>
>> From ca6ce335a852e34364bc45cb4240f703e4ea4248 Mon Sep 17 00:00:00 2001
>> From: Kieran Bingham <kieran.bingham@ideasonboard.com>
>> Date: Tue, 16 Jun 2020 16:19:04 +0100
>> Subject: [PATCH] media: ti-vpe: cal: Use do_div() for 64 bit operations
>>
>> Support building the CAL driver on arm32 bit targets by updating the
>> CSI2 clock calculation (which uses a signed 64 bit input value from
>> the sensors pixel clock rate) to use the do_div() helpers.
>>
>> The calculation is split into distinct parts to maintain
>> order of operations while making use of the do_div macro and further
>> re-ordered to convert to kHz at the end to maintain precision.
>>
>> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
>> ---
>>  drivers/media/platform/ti-vpe/cal-camerarx.c | 22 +++++++++++++++++---
>>  1 file changed, 19 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c
>> b/drivers/media/platform/ti-vpe/cal-camerarx.c
>> index 014ca46509db..0ef19a516902 100644
>> --- a/drivers/media/platform/ti-vpe/cal-camerarx.c
>> +++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
>> @@ -126,9 +126,25 @@ static void cal_camerarx_config(struct cal_camerarx
>> *phy, s64 external_rate)
>>         u32 num_lanes = mipi_csi2->num_data_lanes;
>>
>>         /* DPHY timing configuration */
>> -       /* CSI-2 is DDR and we only count used lanes. */
>> -       csi2_ddrclk_khz = external_rate / 1000
>> -               / (2 * num_lanes) * phy->fmtinfo->bpp;
>> +
>> +       /*
>> +        * CSI-2 is DDR and we only count used lanes.
>> +        *
>> +        * csi2_ddrclk_khz = external_rate / 1000
>> +        *                   / (2 * num_lanes) * phy->fmtinfo->bpp;
>> +        *
>> +        * The equation is broken into separate statements to maintain
>> +        * order of operations, and conversion to kHz is done last to
>> +        * keep precision.
>> +        *
>> +        * The 64 bit external_rate is modified during this equation and
>> +        * contains the result, not the original after calculation.
>> +        */
>> +       do_div(external_rate, 2 * num_lanes);
>> +       external_rate *= phy->fmtinfo->bpp;
>> +       do_div(external_rate, 1000);
>> +       csi2_ddrclk_khz = external_rate;
> 
> How about
> 
> 	external_rate *= phy->fmtinfo->bpp;
>  	do_div(external_rate, 2 * num_lanes * 1000);

Ah yes, that looks better indeed, and keeps the improved integer precision.

I believe the s64 external_rate should cope with the * bpp operation
easily too, so I don't think there's any risk of an overflow there.

Squash it ;-)

--
Kieran


> 
>> +
>>         phy_dbg(1, phy, "csi2_ddrclk_khz: %d\n", csi2_ddrclk_khz);
>>
>>         /* THS_TERM: Programmed value = floor(20 ns/DDRClk period) */
>> -- 
>> 2.25.1
>>
>>
>> If you have a better way to correctly calculate the rate (also noting
>> that I moved the /1000 to the end, I'm not sure if that's more correct,
>> or makes it stop following what the hardware would do) - please update
>> accordingly, or feel free to squash this patch in as you wish.
>>
>>
>> With the calculation corrected:
>>
>> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
>>
>> --
>> Kieran
>>
>>
>>>  	phy_dbg(1, phy, "csi2_ddrclk_khz: %d\n", csi2_ddrclk_khz);
>>>  
>>> @@ -667,13 +667,14 @@ static void cal_camerarx_wait_stop_state(struct cal_camerarx *phy)
>>>  static int cal_camerarx_start(struct cal_camerarx *phy,
>>>  			      const struct cal_fmt *fmt)
>>>  {
>>> +	s64 external_rate;
>>>  	u32 sscounter;
>>>  	u32 val;
>>>  	int ret;
>>>  
>>> -	ret = cal_camerarx_get_external_info(phy);
>>> -	if (ret < 0)
>>> -		return ret;
>>> +	external_rate = cal_camerarx_get_external_rate(phy);
>>> +	if (external_rate < 0)
>>> +		return external_rate;
>>>  
>>>  	ret = v4l2_subdev_call(phy->sensor, core, s_power, 1);
>>>  	if (ret < 0 && ret != -ENOIOCTLCMD && ret != -ENODEV) {
>>> @@ -719,7 +720,7 @@ static int cal_camerarx_start(struct cal_camerarx *phy,
>>>  	reg_read(phy, CAL_CSI2_PHY_REG0);
>>>  
>>>  	/* Program the PHY timing parameters. */
>>> -	cal_camerarx_config(phy, fmt);
>>> +	cal_camerarx_config(phy, external_rate, fmt);
>>>  
>>>  	/*
>>>  	 *    b. Assert the FORCERXMODE signal.
>>> @@ -1034,7 +1035,6 @@ static struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
>>>  
>>>  	phy->cal = cal;
>>>  	phy->instance = instance;
>>> -	phy->external_rate = 192000000;
>>>  
>>>  	phy->res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
>>>  						(instance == 0) ?
> 

-- 
Regards
--
Kieran
