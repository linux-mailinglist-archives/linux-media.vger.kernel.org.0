Return-Path: <linux-media+bounces-28970-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63203A75422
	for <lists+linux-media@lfdr.de>; Sat, 29 Mar 2025 05:26:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFEF21893973
	for <lists+linux-media@lfdr.de>; Sat, 29 Mar 2025 04:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FD3C13DDB9;
	Sat, 29 Mar 2025 04:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SyVOJEbY"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC8029A5;
	Sat, 29 Mar 2025 04:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743222350; cv=none; b=usjQSO9DY9YnYgQ7QSyDPnJL3w5vv7ue1J3JyTJNxJwfiU6y/cZsXqQwyEo2yocRM0+92g9gD2EgK7zbc74ATjmsM3W7kNGyNsyP09Af7PDD5thg08cUcf7G2XymqOpkc/Ma0Xub4txC1Cw18nfoN/WctSc7MznNLIv80GeQXVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743222350; c=relaxed/simple;
	bh=MDFIaZsnKiaO2sMRiXwW6IbfLfg4w1EmA+l8yH+ZZfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JtU3ULH4HC1pAaxKVmLiR6B36jpMlwUNbHvYw9Nioy/vPwczsCGi2JANUcKDFICyDvlm/QEv4bJxxeMCaUKfBRk2djE6RqxIllCDSYlkEerqEbPjXutfRxX7M7U7duOkUq0iCY/67M/hUQ56EB57HNKEq3MqdB0fELNryuM66Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SyVOJEbY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5A13C4CEE2;
	Sat, 29 Mar 2025 04:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743222350;
	bh=MDFIaZsnKiaO2sMRiXwW6IbfLfg4w1EmA+l8yH+ZZfs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SyVOJEbYVRkxra/o2RP5SkFZCH5Uwhce8JjThWIaEX3da4wL+Nfgv4JwGEwm+7E8U
	 /UWSeya5jbiwpdcfsyi78C7sSdb634c3x8sj++2kFYu8G2jBd5qbIYZR+UA5bYDyjj
	 hsO4wSlTUk/TenqLPJ+KTDkdbhVGCpHUoJjUXhNySim2OQXVlKlseyuFneM+xKMVLy
	 FlgzQ8iaEQL+/xMXrBO076EG5CmvrfDydlmo0GpEBvBdfGPqS/ZlvE62M5Kqn3MKyY
	 GkPRzuI9aqc9xZX57KXrlc8r7Agq4K/XL+963GBcVYD9TWXc2FL8fQUgQWaDEIDSwf
	 wwdG4pSQ/79gw==
Message-ID: <8f9863af-61bd-44c3-937b-e8a9a5410556@kernel.org>
Date: Sat, 29 Mar 2025 05:25:41 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: Add OV05C camera sensor driver
To: "Nirujogi, Pratap" <pnirujog@amd.com>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
 laurent.pinchart@ideasonboard.com, dave.stevenson@raspberrypi.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com,
 king.li@amd.com, dominic.antony@amd.com
References: <20250228165317.3468075-1-pratap.nirujogi@amd.com>
 <03c3e6bf-9688-446d-9b45-5b186a1d5b0e@kernel.org>
 <4f85e24e-4bd9-4cde-ad33-075cfcb2b7c0@amd.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <4f85e24e-4bd9-4cde-ad33-075cfcb2b7c0@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/03/2025 23:19, Nirujogi, Pratap wrote:
> Hi Krzysztof,
> 
> Thanks for reviewing and extremely sorry for the delayed response.
> 
> We have submitted V2 patch based on the review feedback. Can you please 
> help to review latest V2 patch and let us know your feedback.
> 
> Thanks,
> Pratap
> 
> On 3/1/2025 8:30 AM, Krzysztof Kozlowski wrote:
>> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>>
>>
>> On 28/02/2025 17:53, Pratap Nirujogi wrote:
>>> Add driver for OmniVision 5.2M OV05C10 sensor. This driver
>>> supports only the full size normal 2888x1808@30fps 2-lane
>>> sensor profile.
>>>
>>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
>>> ---
>>>   drivers/media/i2c/Kconfig  |   10 +
>>>   drivers/media/i2c/Makefile |    1 +
>>>   drivers/media/i2c/ov05c.c  | 1031 ++++++++++++++++++++++++++++++++++++
>>>   3 files changed, 1042 insertions(+)
>>>   create mode 100644 drivers/media/i2c/ov05c.c
>>>
>>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
>>> index 8ba096b8ebca..fd160feabc41 100644
>>> --- a/drivers/media/i2c/Kconfig
>>> +++ b/drivers/media/i2c/Kconfig
>>> @@ -337,6 +337,16 @@ config VIDEO_OG01A1B
>>>          To compile this driver as a module, choose M here: the
>>>          module will be called og01a1b.
>>>
>>> +config VIDEO_OV05C
>>> +     tristate "OmniVision OV05 sensor support"
>>> +     select V4L2_CCI_I2C
>>> +     help
>>> +       This is a Video4Linux2 sensor driver for the OmniVision
>>> +       OV05C camera.
>>> +
>>> +       To compile this driver as a module, choose M here: the
>>> +       module will be called OV05C.
>>> +
>>>   config VIDEO_OV01A10
>>>        tristate "OmniVision OV01A10 sensor support"
>>>        help
>>> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
>>> index fbb988bd067a..08bfc2d59be2 100644
>>> --- a/drivers/media/i2c/Makefile
>>> +++ b/drivers/media/i2c/Makefile
>>> @@ -80,6 +80,7 @@ obj-$(CONFIG_VIDEO_MT9V011) += mt9v011.o
>>>   obj-$(CONFIG_VIDEO_MT9V032) += mt9v032.o
>>>   obj-$(CONFIG_VIDEO_MT9V111) += mt9v111.o
>>>   obj-$(CONFIG_VIDEO_OG01A1B) += og01a1b.o
>>> +obj-$(CONFIG_VIDEO_OV05C) += ov05c.o
>>>   obj-$(CONFIG_VIDEO_OV01A10) += ov01a10.o
>>>   obj-$(CONFIG_VIDEO_OV02A10) += ov02a10.o
>>>   obj-$(CONFIG_VIDEO_OV08D10) += ov08d10.o
>>> diff --git a/drivers/media/i2c/ov05c.c b/drivers/media/i2c/ov05c.c
>>> new file mode 100644
>>> index 000000000000..96c4f74af4a9
>>> --- /dev/null
>>> +++ b/drivers/media/i2c/ov05c.c
>>> @@ -0,0 +1,1031 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright (C) 2025 Advanced Micro Devices, Inc. All rights reserved.
>>> + * All Rights Reserved.
>>> + *
>>> + * Permission is hereby granted, free of charge, to any person obtaining a
>>> + * copy of this software and associated documentation files (the
>>> + * "Software"), to deal in the Software without restriction, including
>>> + * without limitation the rights to use, copy, modify, merge, publish,
>>> + * distribute, sub license, and/or sell copies of the Software, and to
>>> + * permit persons to whom the Software is furnished to do so, subject to
>>> + * the following conditions:
>>> + *
>>> + * The above copyright notice and this permission notice (including the
>>> + * next paragraph) shall be included in all copies or substantial portions
>>> + * of the Software.
>>> + *
>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
>>> + * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
>>> + * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
>>> + * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
>>> + * USE OR OTHER DEALINGS IN THE SOFTWARE.
>>
>> What's with AMD? Second patch that day, same issues.
>>
>> Drop license boilerplate.
>>
> Done. Updated copyright header and license in V2.
> 
>>> + *
>>> + */
>>> +
>>> +#include <linux/acpi.h>
>>> +#include <linux/i2c.h>
>>> +#include <linux/module.h>
>>> +#include <linux/delay.h>
>>> +#include <linux/units.h>
>>> +#include <linux/pm_runtime.h>
>>> +#include <linux/gpio.h>
>>> +#include <media/v4l2-ctrls.h>
>>> +#include <media/v4l2-device.h>
>>> +#include <media/v4l2-fwnode.h>
>>> +#include <media/v4l2-cci.h>
>>
>>
>> ...
>>
>>> +
>>> +static int ov05c_probe(struct i2c_client *client)
>>> +{
>>> +     struct ov05c *ov05c;
>>> +     int i, ret;
>>> +
>>> +     ov05c = devm_kzalloc(&client->dev, sizeof(*ov05c), GFP_KERNEL);
>>> +     if (!ov05c)
>>> +             return -ENOMEM;
>>> +
>>> +     client->dev.init_name = DRV_NAME;
>>> +
>>> +     /* create sensor enable gpio control */
>>> +     ov05c->enable_gpio = devm_gpiod_get(&client->dev, "sensor0_enable", GPIOD_OUT_LOW);
>>
>>
>> s/sensor0_enable/enable/
>>
> Is it okay to use "sensor0_enabled" as connection id? We used this name 
> to differentiate the two GPIO PINs that has to be programmed for RGB 
> streaming to work with this sensor.

How much time did you give me to respond here? 20 minutes. In the middle
of my night. And then you send v2, without waiting for my answer.

That's not acceptable for me.

Best regards,
Krzysztof

