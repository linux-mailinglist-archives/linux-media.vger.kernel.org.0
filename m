Return-Path: <linux-media+bounces-33893-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2DBACACCE
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 12:55:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7AA7D17E6FE
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 10:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14272204C2F;
	Mon,  2 Jun 2025 10:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="jWFsK5/0"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345B0D529;
	Mon,  2 Jun 2025 10:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748861697; cv=none; b=cjmUYUoNGDoy4ReEdupxpTELn5nGw6kxnfI3Zm4T6jYYjG//90W8kWvSNRe6r76iUGdrDAodIvt7XcDXf/AcCKVXS3HXDxDF69NG3W8Ec5XFPpJ6ZB++1mjzjZ2iOXBcF/cDlqeupftz2NUuTS/RotS/Cp87QdGtrg3BjV/yh54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748861697; c=relaxed/simple;
	bh=jcGd6FUpXej9pxEbjT8idF0HGCNQDXT2Aa0hkmLsep0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Yq8e2hoS8+JKpegIJkQeTC20Yl7D/Xtj7bd6FyVo+mXFzQDq6/rcTAAtiI85VGiTyhXAEDGQ+S7MTd9SAuwuh/cHcpgotYXFL76z3DOM5J//d9KMiC61C0+Zq/55a02PbxzqkZYKj3JJSJ3x6PpHcClju8zPnVduDfG0u52P2x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=jWFsK5/0; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 552Asc5r3181299;
	Mon, 2 Jun 2025 05:54:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748861678;
	bh=T6OBbValwC1dR8jKsr8GvTD5VGYJoqGl5D+rYZ6UgLM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=jWFsK5/0G/ppP2gZkReW5WzeeG3qetMi+RiT09bvje2ebtWlfSztSaPtyO+0rwZVM
	 q2j6crlr5iH1tILSzIpFhX6VkqcKt7+P3pieKsNEbLEHrSkpj5anpgNmz4hKndAI+B
	 te+e7teHub6I6j3FUxpi3RzXWLJwJQg3d7xVxosk=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 552AscY02825842
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 2 Jun 2025 05:54:38 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 2
 Jun 2025 05:54:37 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 2 Jun 2025 05:54:37 -0500
Received: from [172.24.227.115] (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 552AsWjv2909952;
	Mon, 2 Jun 2025 05:54:33 -0500
Message-ID: <5db8987f-c074-4e13-b571-6d455d452f7f@ti.com>
Date: Mon, 2 Jun 2025 16:24:32 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: i2c: ds90ub960: Add support for DS90UB954-Q1
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC: <hverkuil@xs4all.nl>, <sakari.ailus@linux.intel.com>,
        <laurent.pinchart@ideasonboard.com>, <vaishnav.a@ti.com>,
        <u-kumar1@ti.com>, <jai.luthra@linux.dev>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <mchehab@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
References: <20250523083655.3876005-1-y-abhilashchandra@ti.com>
 <20250523083655.3876005-3-y-abhilashchandra@ti.com>
 <07e4d87f-0893-40d6-8704-f37c743ff979@ideasonboard.com>
 <85243712-e09f-43c3-bdcc-4a7e7be4dc52@ti.com>
 <8174bfcd-76bb-4b5a-a253-ae3edec54048@ideasonboard.com>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <8174bfcd-76bb-4b5a-a253-ae3edec54048@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Tomi,
Thanks for the review.

On 02/06/25 12:46, Tomi Valkeinen wrote:
> Hi,
> 
> On 28/05/2025 09:25, Yemike Abhilash Chandra wrote:
>> Hi Tomi,
>>
>> Thanks for the review.
>>
>> On 27/05/25 11:10, Tomi Valkeinen wrote:
>>> Hi,
>>>
>>> On 23/05/2025 11:36, Yemike Abhilash Chandra wrote:
>>>> DS90UB954-Q1 is an FPDLink-III deserializer that is mostly register
>>>> compatible with DS90UB960-Q1. The main difference is that it supports
>>>> half of the RX and TX ports, i.e. 2x FPDLink RX ports and 1x CSI TX
>>>> port.
>>>>
>>>> Some other registers are marked as reserved in the datasheet as well,
>>>> notably around CSI-TX frame and line-count monitoring and some other
>>>
>>> Hmm what does that mean? That in log_status we show random data (or
>>> maybe always 0) for these?
>>>
>>
>> It seems like it is showing 0's for these. I streamed around 100 frames.
>> But the frame counter and line counter returned is 0. Please find the
>> logs at [1].
> 
> If the registers are marked as reserved and don't function, we should
> not use them. Here it doesn't do any harm when running the code, but it
> does decrease the usefulness of log_status if the user is shown data
> that is wrong (and the user most likely doesn't know it's wrong).
> 

Yes, Understood. I will address this in the next revision.

>>>> status registers. The datasheet also does not mention anything about
>>>> setting strobe position, and fails to lock the RX ports if we forcefully
>>>> set it, so disable it through the hw_data.
>>>
>>> This app-note has some details:
>>>
>>> https://www.ti.com/lit/an/snla301/snla301.pdf
>>>
>>>> Link: https://www.ti.com/lit/gpn/ds90ub954-q1
>>>> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>>>> ---
>>>>    drivers/media/i2c/Kconfig     |  2 +-
>>>>    drivers/media/i2c/ds90ub960.c | 46 +++++++++++++++++++++++++++++++++++
>>>>    2 files changed, 47 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
>>>> index e68202954a8f..6e265e1cec20 100644
>>>> --- a/drivers/media/i2c/Kconfig
>>>> +++ b/drivers/media/i2c/Kconfig
>>>> @@ -1662,7 +1662,7 @@ config VIDEO_DS90UB960
>>>>        select V4L2_FWNODE
>>>>        select VIDEO_V4L2_SUBDEV_API
>>>>        help
>>>> -      Device driver for the Texas Instruments DS90UB960
>>>> +      Device driver for the Texas Instruments DS90UB954/DS90UB960
>>>>          FPD-Link III Deserializer and DS90UB9702 FPD-Link IV
>>>> Deserializer.
>>>>      config VIDEO_MAX96714
>>>> diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/
>>>> ds90ub960.c
>>>> index ed2cf9d247d1..38e4f006d098 100644
>>>> --- a/drivers/media/i2c/ds90ub960.c
>>>> +++ b/drivers/media/i2c/ds90ub960.c
>>>> @@ -460,6 +460,7 @@ struct ub960_hw_data {
>>>>        u8 num_txports;
>>>>        bool is_ub9702;
>>>>        bool is_fpdlink4;
>>>> +    bool is_ub954;
>>>
>>> No, let's not add any more of these. We should have enums for the device
>>> model and the "family" (ub954/ub960 are clearly of the same family,
>>> whereas ub9702 is of a newer one).
>>>
>>
>> Got it. I will add enums in the next revision.
>>
>>>>    };
>>>>      enum ub960_rxport_mode {
>>>> @@ -982,6 +983,10 @@ static int ub960_txport_select(struct ub960_data
>>>> *priv, u8 nport)
>>>>          lockdep_assert_held(&priv->reg_lock);
>>>>    +    /* TX port registers are shared for UB954*/
>>>
>>> Space missing at the end. What does the comment mean? "registers are
>>> shared"?
>>>
>>
>> Apologies for the inaccurate comment description, My intention to
>> comment that the tx_port_select function does not make sense for
>> UB954, since we have only 1 CSI TX. May be I can have something
>> like below.
>>
>> /** UB954 has only 1 CSI TX. Hence, no need to select **/
>>
>>> I think it's good to have this after the lockdep assert. The lock rules
>>> are in place, even if on ub954 we don't do anything here.
>>>
>>>> +    if (priv->hw_data->is_ub954)
>>>> +        return 0;
>>>> +
>>>>        if (priv->reg_current.txport == nport)
>>>>            return 0;
>>>>    @@ -1415,6 +1420,13 @@ static int ub960_parse_dt_txport(struct
>>>> ub960_data *priv,
>>>>            goto err_free_vep;
>>>>        }
>>>>    +    /* UB954 does not support 1.2 Gbps */
>>>> +    if (priv->tx_data_rate == MHZ(1200) && priv->hw_data->is_ub954) {
>>>
>>> Test for ub954 first, 1200 MHz second. It's more logical for the reader
>>> that way.
>>>
>>
>> Noted, will do that in the next revision.
>>
>>>> +        dev_err(dev, "tx%u: invalid 'link-frequencies' value\n",
>>>> nport);
>>>> +        ret = -EINVAL;
>>>> +        goto err_free_vep;
>>>> +    }
>>>> +
>>>>        v4l2_fwnode_endpoint_free(&vep);
>>>>          priv->txports[nport] = txport;
>>>> @@ -1572,6 +1584,10 @@ static int ub960_rxport_set_strobe_pos(struct
>>>> ub960_data *priv,
>>>>        u8 clk_delay, data_delay;
>>>>        int ret = 0;
>>>>    +    /* FIXME: After writing to this area the UB954 chip no longer
>>>> responds */
>>>> +    if (priv->hw_data->is_ub954)
>>>> +        return 0;
>>>> +
>>>
>>> Check the app note. It would be nice to have this working, as, afaik,
>>> the HW functionality should be the same on ub954 and ub960.
>>>
>>
>> I tried referring the app note and changed the strobe position values
>> accordingly, but it did not help.
>>
>> Since the app note also specifies the below at Table 2 Strobe Adaption
>> Modes
>>
>> "
>> AEQ Adaption Mode--> Strobe position is selected as part of AEQ. This is
>> the default mode.
>>
>> Manual Adaption Mode --> The strobe position is selected manually and
>> will remain at
>> the specified position until a new one is chosen. This mode is
>> recommended as an
>> evaluation and debugging mode "
>>
>> Since, under the default settings, the strobe position is selected as
>> part of the AEQ process.
>> Can we limit the ub960_rxport_set_strobe_pos function to only UB960 and
>> UB9702.
> 
> Ok. But it doesn't sound good if we just skip the
> ub960_rxport_set_strobe_pos(), but keep all the other EQ related writes.
> I.e. we do the EQ config partially, and leave out parts that, for
> unknown reasons, seem to cause problems...
> 
> So probably the check should be in ub960_rxport_config_eq(). With a
> FIXME comment, and a short note where it fails.
> 
> That said, if everyone (?) agrees that the HW should support this, it
> would be really nice if you can keep poking the FPD-Link people in TI
> and try to get clarification on what's going on (what's the diff between
> ub960 and ub954).
> 

Yes, I will do that.

> Btw, did you look at the other EQ related writes, and check if they're
> valid for ub954?
> 

Not until now, will check that.

Thanks and Regards
Abhilash Chandra


>   Tomi
> 
>>>>        clk_delay = UB960_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY;
>>>>        data_delay = UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY;
>>>>    @@ -5021,6 +5037,27 @@ static int ub960_enable_core_hw(struct
>>>> ub960_data *priv)
>>>>        if (priv->hw_data->is_ub9702)
>>>>            ret = ub960_read(priv, UB9702_SR_REFCLK_FREQ, &refclk_freq,
>>>>                     NULL);
>>>> +    else if (priv->hw_data->is_ub954) {
>>>> +        /* From DS90UB954-Q1 datasheet:
>>>> +         * "REFCLK_FREQ measurement is not synchronized. Value in this
>>>> +         * register should read twice and only considered valid if
>>>> +         * REFCLK_FREQ is unchanged between reads."
>>>> +         */
>>>> +        unsigned long timeout = jiffies + msecs_to_jiffies(100);
>>>> +
>>>> +        do {
>>>> +            u8 refclk_new;
>>>> +
>>>> +            ret = ub960_read(priv, UB960_XR_REFCLK_FREQ, &refclk_new,
>>>> +                     NULL);
>>>> +            if (ret)
>>>> +                goto err_pd_gpio;
>>>> +
>>>> +            if (refclk_new == refclk_freq)
>>>> +                break;
>>>> +            refclk_freq = refclk_new;
>>>> +        } while (time_before(jiffies, timeout));
>>>> +    }
>>>
>>> This feels a bit too much for a not-that-important debug print... As the
>>> tests show that a single read is (practically always?) enough, I think
>>> we can just use the same code as for ub960. Maybe add a comment about
>>> it, though.
>>>
>>
>> okay, I will use the same code that is being used for UB960 and will add
>> a comment
>> about that.
>>
>> Thanks and Regards,
>> Abhilash Chandra
>>
>> [1]: https://gist.github.com/Yemike-Abhilash-Chandra/
>> c6b3da2a10586567a3a4179a2b20d21b
>>
>>>    Tomi
>>>
>>>>        else
>>>>            ret = ub960_read(priv, UB960_XR_REFCLK_FREQ, &refclk_freq,
>>>>                     NULL);
>>>> @@ -5177,6 +5214,13 @@ static void ub960_remove(struct i2c_client
>>>> *client)
>>>>        mutex_destroy(&priv->reg_lock);
>>>>    }
>>>>    +static const struct ub960_hw_data ds90ub954_hw = {
>>>> +    .model = "ub954",
>>>> +    .num_rxports = 2,
>>>> +    .num_txports = 1,
>>>> +    .is_ub954 = true,
>>>> +};
>>>> +
>>>>    static const struct ub960_hw_data ds90ub960_hw = {
>>>>        .model = "ub960",
>>>>        .num_rxports = 4,
>>>> @@ -5192,6 +5236,7 @@ static const struct ub960_hw_data ds90ub9702_hw
>>>> = {
>>>>    };
>>>>      static const struct i2c_device_id ub960_id[] = {
>>>> +    { "ds90ub954-q1", (kernel_ulong_t)&ds90ub954_hw },
>>>>        { "ds90ub960-q1", (kernel_ulong_t)&ds90ub960_hw },
>>>>        { "ds90ub9702-q1", (kernel_ulong_t)&ds90ub9702_hw },
>>>>        {}
>>>> @@ -5199,6 +5244,7 @@ static const struct i2c_device_id ub960_id[] = {
>>>>    MODULE_DEVICE_TABLE(i2c, ub960_id);
>>>>      static const struct of_device_id ub960_dt_ids[] = {
>>>> +    { .compatible = "ti,ds90ub954-q1", .data = &ds90ub954_hw },
>>>>        { .compatible = "ti,ds90ub960-q1", .data = &ds90ub960_hw },
>>>>        { .compatible = "ti,ds90ub9702-q1", .data = &ds90ub9702_hw },
>>>>        {}
>>>
> 

