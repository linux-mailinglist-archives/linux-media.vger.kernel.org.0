Return-Path: <linux-media+bounces-33338-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6FFAC39CC
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 08:25:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF9533B3436
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 06:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EFBE1DB958;
	Mon, 26 May 2025 06:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="iGxKrpK/"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68081D799D;
	Mon, 26 May 2025 06:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748240706; cv=none; b=lfBHKVwSZVW7AmXVjCSdYkqGOD5MCgTvMJmYyhtfZwnHCVHhb/tk/46AwPEqmI+9WeW+jlqS95bOSRan8tk4Sz7WhVG/Hv33TPA9ca3HNAC/Ep9F2+y5jWpXhyFbCGjHP2h87odBisikSR55acR+5kyNHfQzCt4h0Ass2QXcc4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748240706; c=relaxed/simple;
	bh=L8b1p5kbrVy+tMLeyLn1FM1MK9BLFpgzBzjIgI+UJy0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=C5ZPoHIXydZLjtkFJPrn3BqeC+xdpZXsdG3xTWdtklCgFnBLd7/CLWUcb7OxicxqvxiE0XSYw1hyoBLZFwg2Ta1lhZNFSz7TjZiPrPiroigQUZaomhFmK/nqD5KN2LBOo0uYFT1BC2rd/R0sQfvm5PFKxs3Jb4eMhxqTOJeYzEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=iGxKrpK/; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54Q6Oc9O2628339;
	Mon, 26 May 2025 01:24:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748240678;
	bh=76ZzqSisVzXfe0G42LdDt43iYzUKgkGIRLwgRXSzqJo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=iGxKrpK/jWti8I+82nyThAir3ryJESpZdIkbXJcCyH8KjtmblXmVovbMxmB0O2tPJ
	 yD0bbmYYQT3VQ8HJmWk3Ps3GEvUqAcZ5vug1jh9up/RplI21G8/xcPJlQG3ueAjGSL
	 HlIVbfK8lyKG5+tDPgE/SKiQqYSErfJGYy9sTTyo=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54Q6Ocb81916022
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 26 May 2025 01:24:38 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 26
 May 2025 01:24:37 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 26 May 2025 01:24:37 -0500
Received: from [172.24.227.115] (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54Q6OW7R2628278;
	Mon, 26 May 2025 01:24:33 -0500
Message-ID: <482afba8-c6fb-4420-83f1-597fb7088ce4@ti.com>
Date: Mon, 26 May 2025 11:54:32 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: i2c: ds90ub960: Add support for DS90UB954-Q1
To: Jai Luthra <jai.luthra@ideasonboard.com>, <conor+dt@kernel.org>,
        <krzk+dt@kernel.org>, <mchehab@kernel.org>, <robh@kernel.org>,
        <tomi.valkeinen@ideasonboard.com>
CC: <hverkuil@xs4all.nl>, <sakari.ailus@linux.intel.com>,
        <laurent.pinchart@ideasonboard.com>, <vaishnav.a@ti.com>,
        <u-kumar1@ti.com>, <jai.luthra@linux.dev>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250523083655.3876005-1-y-abhilashchandra@ti.com>
 <20250523083655.3876005-3-y-abhilashchandra@ti.com>
 <174801920679.2094995.12860064357887094874@freya>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <174801920679.2094995.12860064357887094874@freya>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Jai,

Thanks for the review.

On 23/05/25 22:23, Jai Luthra wrote:
> Hi Abhilash,
> 
> Thanks for the patch.
> 
> Quoting Yemike Abhilash Chandra (2025-05-23 14:06:55)
>> DS90UB954-Q1 is an FPDLink-III deserializer that is mostly register
>> compatible with DS90UB960-Q1. The main difference is that it supports
>> half of the RX and TX ports, i.e. 2x FPDLink RX ports and 1x CSI TX
>> port.
>>
>> Some other registers are marked as reserved in the datasheet as well,
>> notably around CSI-TX frame and line-count monitoring and some other
>> status registers. The datasheet also does not mention anything about
> 
> So what happens when userspace calls LOG_STATUS and the driver tries to
> read these monitoring registers? Are these populated in the device but just
> marked as reserved in the datasheet?
> 
> Whatever is the case, please make sure the driver doesn't crash, and update
> the commit message with the reality if the datasheet is wrong.
> 

I don't see a crash while doing a log-status [1]. In the driver, we 
check what
TX and RX ports are active from the HW data and the do a register read
accordingly. That should be fine I believe.

>> setting strobe position, and fails to lock the RX ports if we forcefully
>> set it, so disable it through the hw_data.
>>
>> Link: https://www.ti.com/lit/gpn/ds90ub954-q1
>> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>> ---
>>   drivers/media/i2c/Kconfig     |  2 +-
>>   drivers/media/i2c/ds90ub960.c | 46 +++++++++++++++++++++++++++++++++++
>>   2 files changed, 47 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
>> index e68202954a8f..6e265e1cec20 100644
>> --- a/drivers/media/i2c/Kconfig
>> +++ b/drivers/media/i2c/Kconfig
>> @@ -1662,7 +1662,7 @@ config VIDEO_DS90UB960
>>          select V4L2_FWNODE
>>          select VIDEO_V4L2_SUBDEV_API
>>          help
>> -         Device driver for the Texas Instruments DS90UB960
>> +         Device driver for the Texas Instruments DS90UB954/DS90UB960
>>            FPD-Link III Deserializer and DS90UB9702 FPD-Link IV Deserializer.
> 
> nit:
>             Device driver for the Texas Instruments DS90UB954, DS90UB960
>             FPD-Link III Deserializers and DS90UB9702 FPD-Link IV Deserializer.
> 
>>   
>>   config VIDEO_MAX96714
>> diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
>> index ed2cf9d247d1..38e4f006d098 100644
>> --- a/drivers/media/i2c/ds90ub960.c
>> +++ b/drivers/media/i2c/ds90ub960.c
>> @@ -460,6 +460,7 @@ struct ub960_hw_data {
>>          u8 num_txports;
>>          bool is_ub9702;
>>          bool is_fpdlink4;
>> +       bool is_ub954;
>>   };
>>   
>>   enum ub960_rxport_mode {
>> @@ -982,6 +983,10 @@ static int ub960_txport_select(struct ub960_data *priv, u8 nport)
>>   
>>          lockdep_assert_held(&priv->reg_lock);
>>   
>> +       /* TX port registers are shared for UB954*/
>> +       if (priv->hw_data->is_ub954)
>> +               return 0;
>> +
> 
> nit: This could be moved above the assertion

Will do that in next revision.

> 
>>          if (priv->reg_current.txport == nport)
>>                  return 0;
>>   
>> @@ -1415,6 +1420,13 @@ static int ub960_parse_dt_txport(struct ub960_data *priv,
>>                  goto err_free_vep;
>>          }
>>   
>> +       /* UB954 does not support 1.2 Gbps */
>> +       if (priv->tx_data_rate == MHZ(1200) && priv->hw_data->is_ub954) {
>> +               dev_err(dev, "tx%u: invalid 'link-frequencies' value\n", nport);
>> +               ret = -EINVAL;
>> +               goto err_free_vep;
>> +       }
>> +
> 
> The error handling is exactly the same as the previous if {} block that
> checks the allowed data rates for UB960. IMO cleaner to move this condition
> in that block.
> 

Noted, will try to do that in a cleaner way in next revision.

> Maybe even a separate table for allowed data-rates for each chip, but that
> is probably overkill.
> 
>>          v4l2_fwnode_endpoint_free(&vep);
>>   
>>          priv->txports[nport] = txport;
>> @@ -1572,6 +1584,10 @@ static int ub960_rxport_set_strobe_pos(struct ub960_data *priv,
>>          u8 clk_delay, data_delay;
>>          int ret = 0;
>>   
>> +       /* FIXME: After writing to this area the UB954 chip no longer responds */
>> +       if (priv->hw_data->is_ub954)
>> +               return 0;
>> +
> 
> It would be good to understand if this is a hardware limitation or not.
> Tomi, do you have any idea?
> 
>>          clk_delay = UB960_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY;
>>          data_delay = UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY;
>>   
>> @@ -5021,6 +5037,27 @@ static int ub960_enable_core_hw(struct ub960_data *priv)
>>          if (priv->hw_data->is_ub9702)
>>                  ret = ub960_read(priv, UB9702_SR_REFCLK_FREQ, &refclk_freq,
>>                                   NULL);
>> +       else if (priv->hw_data->is_ub954) {
>> +               /* From DS90UB954-Q1 datasheet:
>> +                * "REFCLK_FREQ measurement is not synchronized. Value in this
>> +                * register should read twice and only considered valid if
> 
>                     * register should be read twice and only considered valid if
> 
>> +                * REFCLK_FREQ is unchanged between reads."
>> +                */
>> +               unsigned long timeout = jiffies + msecs_to_jiffies(100);
>> +
>> +               do {
>> +                       u8 refclk_new;
>> +
>> +                       ret = ub960_read(priv, UB960_XR_REFCLK_FREQ, &refclk_new,
>> +                                        NULL);
>> +                       if (ret)
>> +                               goto err_pd_gpio;
>> +
>> +                       if (refclk_new == refclk_freq)
>> +                               break;
>> +                       refclk_freq = refclk_new;
>> +               } while (time_before(jiffies, timeout));
>> +       }
> 
> Hmm.. in your testing did you find this actually requiring more than one
> read?
> 
> I'm surprised because this is missing from UB960 which is an older device.
> 

In my testing (around 20 reboots) , I had to do only 1 check i.e just 2
iterations. I am not sure on how to proceed but the data sheet at7.6.121 
REFCLK_FREQ Register clearly specifies the below.

"REFCLK_FREQ measurement is not synchronized. Value in this
register should read twice and only considered valid if
REFCLK_FREQ is unchanged between reads."


Thanks and Regards,
Abhilash Chandra

[1]: 
https://gist.github.com/Yemike-Abhilash-Chandra/dc07a6389d06648d9e80de23d8cae954

>>          else
>>                  ret = ub960_read(priv, UB960_XR_REFCLK_FREQ, &refclk_freq,
>>                                   NULL);
>> @@ -5177,6 +5214,13 @@ static void ub960_remove(struct i2c_client *client)
>>          mutex_destroy(&priv->reg_lock);
>>   }
>>   
>> +static const struct ub960_hw_data ds90ub954_hw = {
>> +       .model = "ub954",
>> +       .num_rxports = 2,
>> +       .num_txports = 1,
>> +       .is_ub954 = true,
>> +};
>> +
>>   static const struct ub960_hw_data ds90ub960_hw = {
>>          .model = "ub960",
>>          .num_rxports = 4,
>> @@ -5192,6 +5236,7 @@ static const struct ub960_hw_data ds90ub9702_hw = {
>>   };
>>   
>>   static const struct i2c_device_id ub960_id[] = {
>> +       { "ds90ub954-q1", (kernel_ulong_t)&ds90ub954_hw },
>>          { "ds90ub960-q1", (kernel_ulong_t)&ds90ub960_hw },
>>          { "ds90ub9702-q1", (kernel_ulong_t)&ds90ub9702_hw },
>>          {}
>> @@ -5199,6 +5244,7 @@ static const struct i2c_device_id ub960_id[] = {
>>   MODULE_DEVICE_TABLE(i2c, ub960_id);
>>   
>>   static const struct of_device_id ub960_dt_ids[] = {
>> +       { .compatible = "ti,ds90ub954-q1", .data = &ds90ub954_hw },
>>          { .compatible = "ti,ds90ub960-q1", .data = &ds90ub960_hw },
>>          { .compatible = "ti,ds90ub9702-q1", .data = &ds90ub9702_hw },
>>          {}
>> -- 
>> 2.34.1
>>
>>
> 
> Thanks,
> Jai

