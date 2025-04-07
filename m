Return-Path: <linux-media+bounces-29561-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A3582A7EEA8
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 22:12:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 328103A4EC8
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 20:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0227624EF73;
	Mon,  7 Apr 2025 19:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="lWCFu5Oa"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-16.smtpout.orange.fr [80.12.242.16])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D6923BD1C;
	Mon,  7 Apr 2025 19:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744055986; cv=none; b=XlnabX7sUIWjlAocoGMetOc3tmekbFSHNYbPx5i81Ub7z+CuIJLcWNlBax1hW3HvKNkP0UgMpCMmx0y79mgvv89/BsDifMFvkZq5KHVmummXPb8XMKKRKi1q3vQSFAghyE2gisAp5JKxdCDklUrtFvH1g/SyZOZXpZ6Ax1vMsdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744055986; c=relaxed/simple;
	bh=h1VyZ44tkwkZ9BYMdSWJcuMFfRfJlNycn1ZZ3RGmpfU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=inc3QkwPV7TDdHBLCS0/kCncOP3tz/bop2U1e7geh+5PltD3Ii6Kp/QeDs6bSqGagZUlLq61Oj5JN3+Cu4LCVCMbuGyPNQhWkb/p61Z8fs8/j4jfWGrrtULZsYp7Jxxx1/ZrOTNMDcKkC7PctPm3ViUGLNowiN6uALhP5AFTFuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=lWCFu5Oa; arc=none smtp.client-ip=80.12.242.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id 1sciuA5a8cIMB1sclu6ec5; Mon, 07 Apr 2025 21:59:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1744055957;
	bh=/4c4JTnHqkb3zAW3+wg0tavQK5en0rFfkh7J4+tv+sc=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=lWCFu5OavlE5trg+UvMOzz+qTahIlH8ly+lu9DnV5SFyUN9JBa+k4E1gwjnpvsMTE
	 qkc6TslmAHIKtMvwXyHkE0nqTsR+E19w/iJOj1i2/xK7F5IE8yZKjz+M6d+Ilv+j1E
	 4F336AkWsyQlmlndReYSE5VF63nOtY5lHA7UmqRx5o2TfZZOUgGCCrl0FVRM0OYCOc
	 coNE4OF4C9owj0NlCJ7CIRlL8gT+vmniz0e+bqAOQDygwoAh9hVJ0qtdJcznH0N3lm
	 fX9KkDqN0eCbDvSX0aLzEZ/hi99m9k7bGokzQ9n+Xb7KSiV9YloFt9HH4DHpngbnJG
	 WXi9zihNrnCgw==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Mon, 07 Apr 2025 21:59:17 +0200
X-ME-IP: 90.11.132.44
Message-ID: <525551ae-fab0-40df-9190-81701f3480e8@wanadoo.fr>
Date: Mon, 7 Apr 2025 21:59:31 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] media: i2c: Add driver for ST VD55G1 camera sensor
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 mchehab@kernel.org, robh@kernel.org, sakari.ailus@linux.intel.com,
 sylvain.petinot@foss.st.com
References: <20250404-b4-vd55g1-v5-0-98f2f02eec59@foss.st.com>
 <20250404-b4-vd55g1-v5-2-98f2f02eec59@foss.st.com>
 <33abd6fc-9ab3-497e-b421-0816a32b8141@wanadoo.fr>
 <27a0989a-8cb6-4b21-b94b-8cec86f2c6d1@foss.st.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <27a0989a-8cb6-4b21-b94b-8cec86f2c6d1@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 07/04/2025 à 11:07, Benjamin Mugnier a écrit :
> Hi Christophe
> 
> Thank you for your review.
> 
> On 4/4/25 18:09, Christophe JAILLET wrote:
>> Le 04/04/2025 à 16:50, Benjamin Mugnier a écrit :
>>> The VD55G1 is a monochrome global shutter camera with a 804x704 maximum
>>> resolution with RAW8 and RAW10 bytes per pixel.
>>> The driver supports :
>>> - Auto exposure from the sensor, or manual exposure mode
>>> - HDR subtraction mode, allowing edge detection and background removal
>>> - Auto exposure cold start, using configuration values from last stream
>>> to start the next one
>>> - LED GPIOs for illumination
>>> - Most standard camera sensor features (hblank, vblank, test patterns,
>>> again, dgain, hflip, vflip, auto exposure bias, etc.)
>>> Add driver source code to MAINTAINERS file.
>>
>> Hi, a few nitpicks below, should they make sense.
>>
>> ...
>>
>>> +static int vd55g1_prepare_clock_tree(struct vd55g1 *sensor)
>>> +{
>>> +    struct i2c_client *client = sensor->i2c_client;
>>> +    /* Double data rate */
>>> +    u32 mipi_freq = sensor->link_freq * 2;
>>> +    u32 sys_clk, mipi_div, pixel_div;
>>> +    int ret = 0;
>>> +
>>> +    if (sensor->xclk_freq < 6 * HZ_PER_MHZ ||
>>> +        sensor->xclk_freq > 27 * HZ_PER_MHZ) {
>>> +        dev_err(&client->dev,
>>> +            "Only 6Mhz-27Mhz clock range supported. Provided %lu MHz\n",
>>> +            sensor->xclk_freq / HZ_PER_MHZ);
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    if (mipi_freq < 250 * HZ_PER_MHZ ||
>>> +        mipi_freq > 1200 * HZ_PER_MHZ) {
>>> +        dev_err(&client->dev,
>>> +            "Only 250Mhz-1200Mhz link frequency range supported.
>>> Provided %lu MHz\n",
>>> +            mipi_freq / HZ_PER_MHZ);
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    if (mipi_freq <= 300 * HZ_PER_MHZ)
>>> +        mipi_div = 4;
>>> +    else if (mipi_freq <= 600 * HZ_PER_MHZ)
>>> +        mipi_div = 2;
>>> +    else
>>> +        mipi_div = 1;
>>> +
>>> +    sys_clk = mipi_freq * mipi_div;
>>> +
>>> +    if (sys_clk <= 780 * HZ_PER_MHZ)
>>> +        pixel_div = 5;
>>> +    else if (sys_clk <= 900 * HZ_PER_MHZ)
>>> +        pixel_div = 6;
>>> +    else
>>> +        pixel_div = 8;
>>> +
>>> +    sensor->pixel_clock = sys_clk / pixel_div;
>>> +    /* Frequency to data rate is 1:1 ratio for MIPI */
>>> +    sensor->data_rate_in_mbps = mipi_freq;
>>> +
>>> +    return ret;
>>
>> Could be return 0, and ret could be removed.
> 
> Yes, I replaced all valid return paths by return 0.
> 
>>
>>> +}
>>
>> ...
>>
>>> +static int vd55g1_enable_streams(struct v4l2_subdev *sd,
>>> +                 struct v4l2_subdev_state *state, u32 pad,
>>> +                 u64 streams_mask)
>>> +{
>>> +    struct vd55g1 *sensor = to_vd55g1(sd);
>>> +    struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
>>> +    int ret = 0;
>>
>> Un-needed init, it is set just the line after.
> 
> I always wonder if it is worth removing the initialization if it is
> redundant. I find myself spending time debugging issues happening
> because I modified the flow of a function and now the return value
> needs to be initialized.

On obvious cases, like this one, personally I prefer omitting the 
initialization, as already done in vd55g1_new_format_change_controls() 
or vd55g1_init_state() below.

But time is more important than these few bytes that will be optimized 
by the compiler anyway.

So if it may save some of your time, I think that consistently 
initializing it is certainly the way to go.

Just my 2c.

CJ

> You're absolutely correct in these initializations being unnecessary
> though, and I removed them for v6, but I'll gladly take your thinking on
> my comment :)
> 


