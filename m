Return-Path: <linux-media+bounces-33870-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E94ACA9CF
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 09:17:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0641E189C53E
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 07:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07E591A3BD8;
	Mon,  2 Jun 2025 07:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uL7csRMP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541DA4CB5B;
	Mon,  2 Jun 2025 07:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748848616; cv=none; b=fbEb4u58IQc2IFLxjaDKA6/JHmpOqrcnSVgqvFru2JhyPwH1heOHwcz07813fxuIur0g8g6aNVhb73RViEEORqpuVjak1Zyp3w2fn+c6EXr5A3zOdgA59MCjN1JIy3aefWggU4ccQz4X50fyJgGvNnAK9F8PKRTI58lC4yYBE4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748848616; c=relaxed/simple;
	bh=k8/ajehcsXC9pzGDvbWH+RGqWBJO6syEXO3Bt43BeYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fxPTYh2eYN26CmcYBJhCEAfr+eBq/R1Ew4H1Hyx//aGLtIr4gOzq177E1wkzvS3NGEvCyvD3IjT5xY+xrx4ky9xaWNitMR1wcfB8l7xaftyPnSyqB9zoRh1tdnbOxpWMKLaSEQNd2TgkugilJs4PcYtNzj0a84RUka9mF4vVXKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uL7csRMP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 74639379;
	Mon,  2 Jun 2025 09:16:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748848611;
	bh=k8/ajehcsXC9pzGDvbWH+RGqWBJO6syEXO3Bt43BeYE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uL7csRMPKw9OTgeAxlVZym+90HAE1gosvTH1xWlE4+638Avk4D+bxDGc6RHkhvtit
	 0WEG8HMvG2KJmUkaGGA1jKGVu1u9IiNGAFKBuUbtOdTHl6KyfzRFc+yKPoshf1bU7X
	 Tov4yrfyJjqnqa3cnIOEMANlqp1YKZ0Op4QmWLR0=
Message-ID: <8174bfcd-76bb-4b5a-a253-ae3edec54048@ideasonboard.com>
Date: Mon, 2 Jun 2025 10:16:49 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: i2c: ds90ub960: Add support for DS90UB954-Q1
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Cc: hverkuil@xs4all.nl, sakari.ailus@linux.intel.com,
 laurent.pinchart@ideasonboard.com, vaishnav.a@ti.com, u-kumar1@ti.com,
 jai.luthra@linux.dev, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
References: <20250523083655.3876005-1-y-abhilashchandra@ti.com>
 <20250523083655.3876005-3-y-abhilashchandra@ti.com>
 <07e4d87f-0893-40d6-8704-f37c743ff979@ideasonboard.com>
 <85243712-e09f-43c3-bdcc-4a7e7be4dc52@ti.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <85243712-e09f-43c3-bdcc-4a7e7be4dc52@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 28/05/2025 09:25, Yemike Abhilash Chandra wrote:
> Hi Tomi,
> 
> Thanks for the review.
> 
> On 27/05/25 11:10, Tomi Valkeinen wrote:
>> Hi,
>>
>> On 23/05/2025 11:36, Yemike Abhilash Chandra wrote:
>>> DS90UB954-Q1 is an FPDLink-III deserializer that is mostly register
>>> compatible with DS90UB960-Q1. The main difference is that it supports
>>> half of the RX and TX ports, i.e. 2x FPDLink RX ports and 1x CSI TX
>>> port.
>>>
>>> Some other registers are marked as reserved in the datasheet as well,
>>> notably around CSI-TX frame and line-count monitoring and some other
>>
>> Hmm what does that mean? That in log_status we show random data (or
>> maybe always 0) for these?
>>
> 
> It seems like it is showing 0's for these. I streamed around 100 frames.
> But the frame counter and line counter returned is 0. Please find the
> logs at [1].

If the registers are marked as reserved and don't function, we should
not use them. Here it doesn't do any harm when running the code, but it
does decrease the usefulness of log_status if the user is shown data
that is wrong (and the user most likely doesn't know it's wrong).

>>> status registers. The datasheet also does not mention anything about
>>> setting strobe position, and fails to lock the RX ports if we forcefully
>>> set it, so disable it through the hw_data.
>>
>> This app-note has some details:
>>
>> https://www.ti.com/lit/an/snla301/snla301.pdf
>>
>>> Link: https://www.ti.com/lit/gpn/ds90ub954-q1
>>> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>>> ---
>>>   drivers/media/i2c/Kconfig     |  2 +-
>>>   drivers/media/i2c/ds90ub960.c | 46 +++++++++++++++++++++++++++++++++++
>>>   2 files changed, 47 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
>>> index e68202954a8f..6e265e1cec20 100644
>>> --- a/drivers/media/i2c/Kconfig
>>> +++ b/drivers/media/i2c/Kconfig
>>> @@ -1662,7 +1662,7 @@ config VIDEO_DS90UB960
>>>       select V4L2_FWNODE
>>>       select VIDEO_V4L2_SUBDEV_API
>>>       help
>>> -      Device driver for the Texas Instruments DS90UB960
>>> +      Device driver for the Texas Instruments DS90UB954/DS90UB960
>>>         FPD-Link III Deserializer and DS90UB9702 FPD-Link IV
>>> Deserializer.
>>>     config VIDEO_MAX96714
>>> diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/
>>> ds90ub960.c
>>> index ed2cf9d247d1..38e4f006d098 100644
>>> --- a/drivers/media/i2c/ds90ub960.c
>>> +++ b/drivers/media/i2c/ds90ub960.c
>>> @@ -460,6 +460,7 @@ struct ub960_hw_data {
>>>       u8 num_txports;
>>>       bool is_ub9702;
>>>       bool is_fpdlink4;
>>> +    bool is_ub954;
>>
>> No, let's not add any more of these. We should have enums for the device
>> model and the "family" (ub954/ub960 are clearly of the same family,
>> whereas ub9702 is of a newer one).
>>
> 
> Got it. I will add enums in the next revision.
> 
>>>   };
>>>     enum ub960_rxport_mode {
>>> @@ -982,6 +983,10 @@ static int ub960_txport_select(struct ub960_data
>>> *priv, u8 nport)
>>>         lockdep_assert_held(&priv->reg_lock);
>>>   +    /* TX port registers are shared for UB954*/
>>
>> Space missing at the end. What does the comment mean? "registers are
>> shared"?
>>
> 
> Apologies for the inaccurate comment description, My intention to
> comment that the tx_port_select function does not make sense for
> UB954, since we have only 1 CSI TX. May be I can have something
> like below.
> 
> /** UB954 has only 1 CSI TX. Hence, no need to select **/
> 
>> I think it's good to have this after the lockdep assert. The lock rules
>> are in place, even if on ub954 we don't do anything here.
>>
>>> +    if (priv->hw_data->is_ub954)
>>> +        return 0;
>>> +
>>>       if (priv->reg_current.txport == nport)
>>>           return 0;
>>>   @@ -1415,6 +1420,13 @@ static int ub960_parse_dt_txport(struct
>>> ub960_data *priv,
>>>           goto err_free_vep;
>>>       }
>>>   +    /* UB954 does not support 1.2 Gbps */
>>> +    if (priv->tx_data_rate == MHZ(1200) && priv->hw_data->is_ub954) {
>>
>> Test for ub954 first, 1200 MHz second. It's more logical for the reader
>> that way.
>>
> 
> Noted, will do that in the next revision.
> 
>>> +        dev_err(dev, "tx%u: invalid 'link-frequencies' value\n",
>>> nport);
>>> +        ret = -EINVAL;
>>> +        goto err_free_vep;
>>> +    }
>>> +
>>>       v4l2_fwnode_endpoint_free(&vep);
>>>         priv->txports[nport] = txport;
>>> @@ -1572,6 +1584,10 @@ static int ub960_rxport_set_strobe_pos(struct
>>> ub960_data *priv,
>>>       u8 clk_delay, data_delay;
>>>       int ret = 0;
>>>   +    /* FIXME: After writing to this area the UB954 chip no longer
>>> responds */
>>> +    if (priv->hw_data->is_ub954)
>>> +        return 0;
>>> +
>>
>> Check the app note. It would be nice to have this working, as, afaik,
>> the HW functionality should be the same on ub954 and ub960.
>>
> 
> I tried referring the app note and changed the strobe position values
> accordingly, but it did not help.
> 
> Since the app note also specifies the below at Table 2 Strobe Adaption
> Modes
> 
> "
> AEQ Adaption Mode--> Strobe position is selected as part of AEQ. This is
> the default mode.
> 
> Manual Adaption Mode --> The strobe position is selected manually and
> will remain at
> the specified position until a new one is chosen. This mode is
> recommended as an
> evaluation and debugging mode "
> 
> Since, under the default settings, the strobe position is selected as
> part of the AEQ process.
> Can we limit the ub960_rxport_set_strobe_pos function to only UB960 and
> UB9702.

Ok. But it doesn't sound good if we just skip the
ub960_rxport_set_strobe_pos(), but keep all the other EQ related writes.
I.e. we do the EQ config partially, and leave out parts that, for
unknown reasons, seem to cause problems...

So probably the check should be in ub960_rxport_config_eq(). With a
FIXME comment, and a short note where it fails.

That said, if everyone (?) agrees that the HW should support this, it
would be really nice if you can keep poking the FPD-Link people in TI
and try to get clarification on what's going on (what's the diff between
ub960 and ub954).

Btw, did you look at the other EQ related writes, and check if they're
valid for ub954?

 Tomi

>>>       clk_delay = UB960_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY;
>>>       data_delay = UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY;
>>>   @@ -5021,6 +5037,27 @@ static int ub960_enable_core_hw(struct
>>> ub960_data *priv)
>>>       if (priv->hw_data->is_ub9702)
>>>           ret = ub960_read(priv, UB9702_SR_REFCLK_FREQ, &refclk_freq,
>>>                    NULL);
>>> +    else if (priv->hw_data->is_ub954) {
>>> +        /* From DS90UB954-Q1 datasheet:
>>> +         * "REFCLK_FREQ measurement is not synchronized. Value in this
>>> +         * register should read twice and only considered valid if
>>> +         * REFCLK_FREQ is unchanged between reads."
>>> +         */
>>> +        unsigned long timeout = jiffies + msecs_to_jiffies(100);
>>> +
>>> +        do {
>>> +            u8 refclk_new;
>>> +
>>> +            ret = ub960_read(priv, UB960_XR_REFCLK_FREQ, &refclk_new,
>>> +                     NULL);
>>> +            if (ret)
>>> +                goto err_pd_gpio;
>>> +
>>> +            if (refclk_new == refclk_freq)
>>> +                break;
>>> +            refclk_freq = refclk_new;
>>> +        } while (time_before(jiffies, timeout));
>>> +    }
>>
>> This feels a bit too much for a not-that-important debug print... As the
>> tests show that a single read is (practically always?) enough, I think
>> we can just use the same code as for ub960. Maybe add a comment about
>> it, though.
>>
> 
> okay, I will use the same code that is being used for UB960 and will add
> a comment
> about that.
> 
> Thanks and Regards,
> Abhilash Chandra
> 
> [1]: https://gist.github.com/Yemike-Abhilash-Chandra/
> c6b3da2a10586567a3a4179a2b20d21b
> 
>>   Tomi
>>
>>>       else
>>>           ret = ub960_read(priv, UB960_XR_REFCLK_FREQ, &refclk_freq,
>>>                    NULL);
>>> @@ -5177,6 +5214,13 @@ static void ub960_remove(struct i2c_client
>>> *client)
>>>       mutex_destroy(&priv->reg_lock);
>>>   }
>>>   +static const struct ub960_hw_data ds90ub954_hw = {
>>> +    .model = "ub954",
>>> +    .num_rxports = 2,
>>> +    .num_txports = 1,
>>> +    .is_ub954 = true,
>>> +};
>>> +
>>>   static const struct ub960_hw_data ds90ub960_hw = {
>>>       .model = "ub960",
>>>       .num_rxports = 4,
>>> @@ -5192,6 +5236,7 @@ static const struct ub960_hw_data ds90ub9702_hw
>>> = {
>>>   };
>>>     static const struct i2c_device_id ub960_id[] = {
>>> +    { "ds90ub954-q1", (kernel_ulong_t)&ds90ub954_hw },
>>>       { "ds90ub960-q1", (kernel_ulong_t)&ds90ub960_hw },
>>>       { "ds90ub9702-q1", (kernel_ulong_t)&ds90ub9702_hw },
>>>       {}
>>> @@ -5199,6 +5244,7 @@ static const struct i2c_device_id ub960_id[] = {
>>>   MODULE_DEVICE_TABLE(i2c, ub960_id);
>>>     static const struct of_device_id ub960_dt_ids[] = {
>>> +    { .compatible = "ti,ds90ub954-q1", .data = &ds90ub954_hw },
>>>       { .compatible = "ti,ds90ub960-q1", .data = &ds90ub960_hw },
>>>       { .compatible = "ti,ds90ub9702-q1", .data = &ds90ub9702_hw },
>>>       {}
>>


