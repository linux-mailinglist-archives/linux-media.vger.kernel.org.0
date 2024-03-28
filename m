Return-Path: <linux-media+bounces-8092-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9239088FDFA
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 12:22:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD58B1C26884
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 11:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C91F7D411;
	Thu, 28 Mar 2024 11:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="upmnBozr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B317BAE7
	for <linux-media@vger.kernel.org>; Thu, 28 Mar 2024 11:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711624943; cv=none; b=njdPw8DF4kvYepL7RyUldbs9AQS+4WNScGMgc8ddHmMycqJBb01YsBeNfbXvOymari8Rb+KU13cLbQdlMTi/NerUea3PMXwY4oAoI3b9RzHBRaPZE7mzxilttKQfJEmflk7KMwAlzXgAeyNvW6c7ihPqrR3kGPt5N2/9qXcodHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711624943; c=relaxed/simple;
	bh=rvy8nWTyyIj1+znNdZh5LmCx7za+nlu0xRBaN1U8awI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MfwqF+ipRRqf6wX6yVCxPAPwlaNhjh7RWiYBHwdvVX8QnZNAoLAdqOii/O1ehTh+diAk21hSoHh1wH+SBsmsrjZGfJTYJ2GXXBFilWHm8umksrvS5ASv4iev88VRYH0xR73cW/tr4Oy0EcHDYbsjDzeccF7hwHJ9LHzN51RadI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=upmnBozr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.105] (unknown [103.251.226.73])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 14137E0C;
	Thu, 28 Mar 2024 12:21:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711624906;
	bh=rvy8nWTyyIj1+znNdZh5LmCx7za+nlu0xRBaN1U8awI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=upmnBozrToACuRef59tsZm0mhL5OEvBD8hiAWa4/DtzWz8LKxt5VnhVLkTkUJmuUw
	 CLQhV70Z45kqAQE1NdYBSEIqzO8F5AIWQGUSX4UCkDcsREk2ookO85NPcaz5zc29bO
	 pAUOh38WXKOndgHzACkjYyILP47XYsNll7XYCrRQ=
Message-ID: <e01af8fd-6e02-49b0-887d-5c2cc352463a@ideasonboard.com>
Date: Thu, 28 Mar 2024 16:52:11 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: imx219: Use dev_err_probe on probe
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tommaso Merciai <tomm.merciai@gmail.com>, linux-media@vger.kernel.org,
 dave.stevenson@raspberrypi.com, sakari.ailus@linux.intel.com,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20240311090042.30280-1-umang.jain@ideasonboard.com>
 <Ze7shcxM/v1+FHCm@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <b949d192-9ea5-489a-91a9-2b055ec47b22@ideasonboard.com>
 <20240314152147.GB2441@pendragon.ideasonboard.com>
 <7b3724aa-04ac-463c-834a-3902fae4b505@ideasonboard.com>
 <20240328105305.GB26064@pendragon.ideasonboard.com>
 <d5d210d9-b638-4790-a9fe-0816462ba58a@ideasonboard.com>
 <20240328110913.GC26064@pendragon.ideasonboard.com>
From: Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <20240328110913.GC26064@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

hello

On 28/03/24 4:39 pm, Laurent Pinchart wrote:
> Sakari, there's a question for you below.
>
> On Thu, Mar 28, 2024 at 04:29:41PM +0530, Umang Jain wrote:
>> On 28/03/24 4:23 pm, Laurent Pinchart wrote:
>>> On Fri, Mar 15, 2024 at 12:13:15PM +0530, Umang Jain wrote:
>>>> On 14/03/24 8:51 pm, Laurent Pinchart wrote:
>>>>> On Thu, Mar 14, 2024 at 06:51:04PM +0530, Umang Jain wrote:
>>>>>> On 11/03/24 5:05 pm, Tommaso Merciai wrote:
>>>>>>> On Mon, Mar 11, 2024 at 02:30:42PM +0530, Umang Jain wrote:
>>>>>>>> Drop dev_err() and use the dev_err_probe() helper on probe path.
>>>>>>>>
>>>>>>>> No functional changes intended.
>>>>>>>>
>>>>>>>> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
>>>>>>>> ---
>>>>>>>>      drivers/media/i2c/imx219.c | 64 +++++++++++++++++++-------------------
>>>>>>>>      1 file changed, 32 insertions(+), 32 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
>>>>>>>> index e17ef2e9d9d0..acd27e2ef849 100644
>>>>>>>> --- a/drivers/media/i2c/imx219.c
>>>>>>>> +++ b/drivers/media/i2c/imx219.c
>>>>>>>> @@ -551,8 +551,9 @@ static int imx219_init_controls(struct imx219 *imx219)
>>>>>>>>      
>>>>>>>>      	if (ctrl_hdlr->error) {
>>>>>>>>      		ret = ctrl_hdlr->error;
>>>>>>>> -		dev_err(&client->dev, "%s control init failed (%d)\n",
>>>>>>>> -			__func__, ret);
>>>>>>>> +		dev_err_probe(&client->dev, ret,
>>>>>>>> +			      "%s control init failed\n",
>>>>>>>> +			      __func__);
>>>>> ctrl_hdlr->error can never be -EPROBE_DEFER, is dev_err_probe() really
>>>>> useful here ?
>>>> is dev_err_probe() really /only/ about -EPROBE_DEFER ?  or all probe()
>>>> errors?
>>>>
>>>> The documentation is explicitly stating for dev_Err_probe()
>>>>
>>>> ```
>>>>     * Note that it is deemed acceptable to use this function for error
>>>>     * prints during probe even if the @err is known to never be -EPROBE_DEFER.
>>>>     * The benefit compared to a normal dev_err() is the standardized format
>>>>     * of the error code and the fact that the error code is returned.
>>>>     *
>>>>
>>>> ```
>>> As in so many cases, it's partly a matter of taste :-) When it comes to
>>> changes such as
>>>
>>> -		dev_err(dev, "xclk frequency not supported: %d Hz\n",
>>> -			imx219->xclk_freq);
>>> -		return -EINVAL;
>>> +		return dev_err_probe(dev, -EINVAL,
>>> +				     "xclk frequency not supported: %d Hz\n",
>>> +				     imx219->xclk_freq);
>>>
>>> I find the resulting less readable. The indentation is higher, you have
>>> to look at the parameters to dev_err_probe() to see what is returned
>>> (compared to reading "return -EINVAL"), and adding the error code to the
>>> printed message also makes the kernel log less as the error code really
>>> doesn't need to be printed in this case.
>> Indeed, a matter of taste ...
>>
>> On IMX283 driver, I got the feedback that all probe errors should go via
>> dev_err_probe()
>>
>> "Make all messages in ->probe() stage to use the same pattern." [1]
>>
>> For IMX219, (since it's the most appropriate reference driver from
>> framework PoV), I saw that it is not logging through dev_err_probe(),
>> and in such cases hence tried to align with [1]
> I'd say we should have common guidelines for all sensor drivers. As
> Sakari is the maintainer here, he can be the judge too :-)

There is also a v2 in case someone has missed it:
https://patchwork.kernel.org/project/linux-media/patch/20240320070027.77194-1-umang.jain@ideasonboard.com/
>
>> [1] https://lore.kernel.org/all/CAHp75Vcvvadd6EeTWk2ZDrmtCQzWBV8rOoxNCotzYRRPwecaEA@mail.gmail.com/
>>
>>>>>>>>      		goto error;
>>>>>>>>      	}
>>> [snip]


