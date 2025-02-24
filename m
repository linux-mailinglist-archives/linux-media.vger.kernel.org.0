Return-Path: <linux-media+bounces-26822-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A379A41EF5
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 13:29:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 558691888FA9
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 12:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E25A2192E7;
	Mon, 24 Feb 2025 12:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Pg0V2vph"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4972571AD
	for <linux-media@vger.kernel.org>; Mon, 24 Feb 2025 12:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740399876; cv=none; b=EJsUYjY7pPDKBAltV5DR9E2ifLY+wzTr3DKoywqVeTgWw5iCZPkiA+O1kk+CKdCqCgpQSSkZtL+4jCnZHLVVPHQTHwDYqnIwLuTwDGJX1GmUeNoIKj3ha6g6kt1dBCGPIqszB+n0yo2wF1ANfRBj8++oVs5CcJNmPtIh98Zipu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740399876; c=relaxed/simple;
	bh=TU5wLQnn6g7WQ9VxIWB7/Q+rMchq+QRLVLZBJkMk2kQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pvMy21pmdRrpLQ0sRNaeNfqQmVDbTEndY2UwLO8XV6Sx21nfm5AbtwvvzOd1O/FeqhSMWrqkynfV0x7+Vb6Y/Y4NhWMxAXjwqwAxztXb7yla9JtkEKzU9Bd9R0UM2Vp9dyV8X63se+sB7V3Me13RIvvDNoGtipc4DdV1dvXAWBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Pg0V2vph; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 010D255A;
	Mon, 24 Feb 2025 13:23:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740399786;
	bh=TU5wLQnn6g7WQ9VxIWB7/Q+rMchq+QRLVLZBJkMk2kQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Pg0V2vph8L0pF9ufItalBjLvXa5ZXNOFsBNOGVMc1tmPnmSbhrD3j/tGZAHxSG60F
	 VaHVQw1pnaFfgq8SKsPV58Wpo7thWGPwYv+c6xmvw938Gya4juCkCQbZoKFrJS3mwc
	 jjIw9vub9F0+Oo0wx0l1QBP2gCianb8982hNbs+Q=
Message-ID: <2462254c-bd3f-488b-94d9-e11e16108327@ideasonboard.com>
Date: Mon, 24 Feb 2025 14:24:29 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: imx219: Add support for 'clock-frequency'
 parsing
To: Mehdi Djait <mehdi.djait@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dave.stevenson@raspberrypi.com, linux-media@vger.kernel.org
References: <20250220154909.152538-1-mehdi.djait@linux.intel.com>
 <20250223230649.GD16159@pendragon.ideasonboard.com>
 <picj7e6sohybmsyb63xuxdglyxk67pj3rfmej27lr2z2pyaqss@ahqmpyszie3a>
 <Z7w-9DjMOIDtndti@kekkonen.localdomain>
 <hs5odm7vni4va2wikso7htyqcgbaiqbfrjqzeofzofrrabn5d6@cportdepyasr>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <hs5odm7vni4va2wikso7htyqcgbaiqbfrjqzeofzofrrabn5d6@cportdepyasr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 24/02/2025 13:54, Mehdi Djait wrote:
> Hi Sakari,
> 
> On Mon, Feb 24, 2025 at 09:42:12AM +0000, Sakari Ailus wrote:
>> Hi Mehdi,
>>
>> On Mon, Feb 24, 2025 at 08:59:34AM +0100, Mehdi Djait wrote:
>>> Hi Laurent,
>>>
>>> On Mon, Feb 24, 2025 at 01:06:49AM +0200, Laurent Pinchart wrote:
>>>> Hi Mehdi,
>>>>
>>>> Thank you for the patch.
>>>>
>>>> On Thu, Feb 20, 2025 at 04:49:09PM +0100, Mehdi Djait wrote:
>>>>> Make the clock producer reference lookup optional
>>>>>
>>>>> Add support for ACPI-based platforms by parsing the 'clock-frequency'
>>>>> property when no clock producer is available
>>>>>
>>>>> Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
>>>>> ---
>>>>>   drivers/media/i2c/imx219.c | 14 ++++++++++++--
>>>>>   1 file changed, 12 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
>>>>> index 2d54cea113e1..a876a6d80a47 100644
>>>>> --- a/drivers/media/i2c/imx219.c
>>>>> +++ b/drivers/media/i2c/imx219.c
>>>>> @@ -1103,12 +1103,22 @@ static int imx219_probe(struct i2c_client *client)
>>>>>   				     "failed to initialize CCI\n");
>>>>>   
>>>>>   	/* Get system clock (xclk) */
>>>>> -	imx219->xclk = devm_clk_get(dev, NULL);
>>>>> +	imx219->xclk = devm_clk_get_optional(dev, NULL);
>>>>>   	if (IS_ERR(imx219->xclk))
>>>>>   		return dev_err_probe(dev, PTR_ERR(imx219->xclk),
>>>>>   				     "failed to get xclk\n");
>>>>>   
>>>>> -	imx219->xclk_freq = clk_get_rate(imx219->xclk);
>>>>> +	if (imx219->xclk) {
>>>>> +		imx219->xclk_freq = clk_get_rate(imx219->xclk);
>>>>> +	} else {
>>>>> +		ret = fwnode_property_read_u32(dev_fwnode(dev),
>>>>> +					       "clock-frequency",
>>>>> +					       &imx219->xclk_freq);
>>>>> +		if (ret)
>>>>> +			return dev_err_probe(dev, ret,
>>>>> +					     "failed to get clock frequency");
>>>>> +	}
>>>>> +
>>>>
>>>> This doesn't seem specific to the imx219 driver. Could you turn this
>>>> into a generic V4L2 sensor helper that would take a struct device and a
>>>> clock name, and return the frequency, either retrieved from the clock,
>>>> or from the clock-frequency property as a fallback ?
>>>>
>>>> Some drivers will also need to control the clock, so the clock should
>>>> probably be returned too.
>>>>
>>>
>>> Yes, I saw that many sensor drivers have the same issue.
>>>
>>> I will try to make it into a generic V4L2 helper and send the patches.
>>
>> There are other such functions in drivers/media/v4l2-core/v4l2-common.c.
>> Perhaps this is where the new helper could be located as well?
>>
> 
> I was thinking about drivers/media/v4l2-core/v4l2-fwnode.c but if
> v4l2-common.c is more appropriate we can go with that.

I admit I have no clue about ACPI, but why is this v4l2 specific? Why 
doesn't clock framework do this for us?

  Tomi


