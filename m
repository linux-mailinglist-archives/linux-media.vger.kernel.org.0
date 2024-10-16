Return-Path: <linux-media+bounces-19757-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 854219A08EA
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 13:59:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8BF31C22AFA
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 11:58:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DE61207A26;
	Wed, 16 Oct 2024 11:58:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD49206979;
	Wed, 16 Oct 2024 11:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729079931; cv=none; b=jOyuWINstizMYYwh0ahjyE4y5iWXFmSaqkBAnwfpK3pm20DZsyVAKguXsGT0RAK8QofFY95kMXbGgINRmjbuSOLy6jI+Xu5xLV2D9rPP/vipYhxH5DH+WYN+lCG0PTx6rQkrEiMf0W41QwsS6gHt92vVozAz1+vj3DtNdIwBmTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729079931; c=relaxed/simple;
	bh=8YHl+oky3VlQy0t+QUgagnccnW+oHm6p5EVTOwdNNto=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fzl5MAzPl9i8Fdc8d7kfm+6VWH0D5apXQ0RrcwCCTlrd+oOeZFOfp2MS+e/5iCAceRxQGXVpfdhMr1S5oTm3Moq6+HUGXXRF2xsq0gCEQRqeo/R2P29V8Ub+mnlUS2iFVyZT1dEPYP+Vw4QOP7T72EAnx8AkH9kJABN3/Vin8Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1913C4CEC5;
	Wed, 16 Oct 2024 11:58:49 +0000 (UTC)
Message-ID: <c04c22f5-cafa-4618-ad7c-319a8afc6214@xs4all.nl>
Date: Wed, 16 Oct 2024 13:58:48 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/13] media: adv7604 prevent underflow condition when
 reporting colorspace
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 stable@vger.kernel.org
References: <cover.1729074076.git.mchehab+huawei@kernel.org>
 <41d12c1afd6571f9cc56c1b920df6ba558d0b927.1729074076.git.mchehab+huawei@kernel.org>
 <e591ffa7-4214-4ec0-91f3-65c809aedce9@xs4all.nl>
 <20241016132448.15e5a4fa@foz.lan>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20241016132448.15e5a4fa@foz.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/10/2024 13:24, Mauro Carvalho Chehab wrote:
> Em Wed, 16 Oct 2024 12:57:53 +0200
> Hans Verkuil <hverkuil@xs4all.nl> escreveu:
> 
>> On 16/10/2024 12:22, Mauro Carvalho Chehab wrote:
>>> Currently, adv76xx_log_status() reads some date using
>>> io_read() which may return negative values. The current logi
>>> doesn't check such errors, causing colorspace to be reported
>>> on a wrong way at adv76xx_log_status().
>>>
>>> If I/O error happens there, print a different message, instead
>>> of reporting bogus messages to userspace.
>>>
>>> Fixes: 54450f591c99 ("[media] adv7604: driver for the Analog Devices ADV7604 video decoder")
>>> Cc: stable@vger.kernel.org  
>>
>> Not really a fix since this would just affect logging for debugging
>> purposes. I would personally just drop the Fixes and Cc tag.
> 
> The issue is on a VIDIOC_ ioctl, so part of media API. Ok, this is
> used only for debugging purposes and should, instead be implemented
> via debugfs, etc, but, in summary: it is what it is: part of the V4L2
> uAPI.

The ioctl, yes, but what it logs to the kernel log isn't part of the ABI.
That can change.

I think it is overkill to send this to stable for an old chip that almost
nobody uses, and that requires an i2c read to go wrong for it to produce
a wrong debug message. It seems an unnecessary waste of time.

> 
> -
> 
> Now, the question about what should have Fixes: tag and what
> shouldn't is a different matter. I've saw long discussions about
> that at the kernel mailing lists. In the particular case of y2038,
> I'm pretty sure I saw some of them with Fixes tag on it.

But patch 13/13 doesn't affect the operation either, again it is just
an incorrect log message that can only go wrong if Pulse-Eight still
sells that device in 2038 with a firmware build date >= 2038. And v6.12
is guaranteed to be EOL in 2038 :-)

Regards,

	Hans

> 
>>
>>> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>  
>>
>> Reviewed-by: Hans Verkuil <hverkuil@xs4all.nl>
>>
>> Regards,
>>
>> 	Hans
>>
>>> ---
>>>  drivers/media/i2c/adv7604.c | 26 +++++++++++++++++---------
>>>  1 file changed, 17 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
>>> index 48230d5109f0..272945a878b3 100644
>>> --- a/drivers/media/i2c/adv7604.c
>>> +++ b/drivers/media/i2c/adv7604.c
>>> @@ -2519,10 +2519,10 @@ static int adv76xx_log_status(struct v4l2_subdev *sd)
>>>  	const struct adv76xx_chip_info *info = state->info;
>>>  	struct v4l2_dv_timings timings;
>>>  	struct stdi_readback stdi;
>>> -	u8 reg_io_0x02 = io_read(sd, 0x02);
>>> +	int ret;
>>> +	u8 reg_io_0x02;
>>>  	u8 edid_enabled;
>>>  	u8 cable_det;
>>> -
>>>  	static const char * const csc_coeff_sel_rb[16] = {
>>>  		"bypassed", "YPbPr601 -> RGB", "reserved", "YPbPr709 -> RGB",
>>>  		"reserved", "RGB -> YPbPr601", "reserved", "RGB -> YPbPr709",
>>> @@ -2621,13 +2621,21 @@ static int adv76xx_log_status(struct v4l2_subdev *sd)
>>>  	v4l2_info(sd, "-----Color space-----\n");
>>>  	v4l2_info(sd, "RGB quantization range ctrl: %s\n",
>>>  			rgb_quantization_range_txt[state->rgb_quantization_range]);
>>> -	v4l2_info(sd, "Input color space: %s\n",
>>> -			input_color_space_txt[reg_io_0x02 >> 4]);
>>> -	v4l2_info(sd, "Output color space: %s %s, alt-gamma %s\n",
>>> -			(reg_io_0x02 & 0x02) ? "RGB" : "YCbCr",
>>> -			(((reg_io_0x02 >> 2) & 0x01) ^ (reg_io_0x02 & 0x01)) ?
>>> -				"(16-235)" : "(0-255)",
>>> -			(reg_io_0x02 & 0x08) ? "enabled" : "disabled");
>>> +
>>> +	ret = io_read(sd, 0x02);
>>> +	if (ret < 0) {
>>> +		v4l2_info(sd, "Can't read Input/Output color space\n");
>>> +	} else {
>>> +		reg_io_0x02 = ret;
>>> +
>>> +		v4l2_info(sd, "Input color space: %s\n",
>>> +				input_color_space_txt[reg_io_0x02 >> 4]);
>>> +		v4l2_info(sd, "Output color space: %s %s, alt-gamma %s\n",
>>> +				(reg_io_0x02 & 0x02) ? "RGB" : "YCbCr",
>>> +				(((reg_io_0x02 >> 2) & 0x01) ^ (reg_io_0x02 & 0x01)) ?
>>> +					"(16-235)" : "(0-255)",
>>> +				(reg_io_0x02 & 0x08) ? "enabled" : "disabled");
>>> +	}
>>>  	v4l2_info(sd, "Color space conversion: %s\n",
>>>  			csc_coeff_sel_rb[cp_read(sd, info->cp_csc) >> 4]);
>>>    
>>
> 
> 
> 
> Thanks,
> Mauro


