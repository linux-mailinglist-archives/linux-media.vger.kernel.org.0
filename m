Return-Path: <linux-media+bounces-20517-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6159B47C1
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 12:05:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB0E11F2455A
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 11:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C976B20A5CC;
	Tue, 29 Oct 2024 10:57:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6883C205AB9;
	Tue, 29 Oct 2024 10:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730199439; cv=none; b=WD/fSi7PSr3004Fn/Ao+Wyo8uAbGfc9xOmP0bi7IPZklMe1kKezafSmfvSJW1Qkj6MEI4vFT1G46TkURY0rJHOY7UmNQaKOdXH6Ji96mAtZPsKlQzNaxk6oSHn/53NoiPIuz9SAH/lNjwO9a3MOSi0pIJSoRpLog9fhflJicmEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730199439; c=relaxed/simple;
	bh=7zqc7zZdhGKgzF6Co/xOQryInAWUuQZefGgGI7QiWXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ais+TXnPAjknAqSzsctY3PnBEFxHdURtBsKkcIG118DiZF5URm4xQYGPWtYT9HL8EeyAWRlTk0IIo57mylwNLIYf9Tii3Klo8/CafajVsQiO5l4MTdP0t4U9kuqZC1x25MZkcZ4G6hCrEFgbAS/Sq0hdLYGX+n4TEWhinAgPDao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 863A6C4CECD;
	Tue, 29 Oct 2024 10:57:17 +0000 (UTC)
Message-ID: <b580805b-8f00-40d1-bc1c-3ac19a19ac45@xs4all.nl>
Date: Tue, 29 Oct 2024 11:57:16 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: cx18: Remove unused cx18_reset_ir_gpio
Content-Language: en-US
To: Sean Young <sean@mess.org>, linux@treblig.org
Cc: awalls@md.metrocast.net, mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241012233932.255211-1-linux@treblig.org>
 <Zx_s76gUaQwAxzip@gofer.mess.org>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <Zx_s76gUaQwAxzip@gofer.mess.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/28/24 20:58, Sean Young wrote:
> On Sun, Oct 13, 2024 at 12:39:32AM +0100, linux@treblig.org wrote:
>> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>>
>> cx18_reset_ir_gpio() has been unused in tree since 2009
>> commit eefe1010a465 ("V4L/DVB (10759): cx18: Convert GPIO connected
>> functions to act as v4l2_subdevices")
>>
>> It has a comment saying it's exported for use by 'lirc_pvr150' but I don't
>> see any sign of it in the lirc git, and I see it removed support
>> for lirc_i2c.c 'Flavors of the Hauppage PVR-150...' in 2014.
>>
>> Remove it.
> 
> Interesting, I can't find any call site either. The ir-i2c-kbd driver could
> potentially use this, but it would to know the correct v4l2_dev for the
> device; also there are devices other than the cx18 which use the same IR
> module, so they would not have a way to force a reset or need a different
> mechanism (e.g. ivtv driver).
> 
> So I don't understand how this could be wired up or how it was ever wired
> up.
> 
> This could be great because if done correctly, we could remove the
> VIDIOC_INT_RESET ioctl completely. Then again, I don't know how often the
> device hangs. With the current driver the IR module I don't know of any
> hangs -- maybe the ioctl could just go anyway.
> 
> 
> Sean
> 
>>
>> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
>> ---
>>  drivers/media/pci/cx18/cx18-gpio.c | 15 ---------------
>>  drivers/media/pci/cx18/cx18-gpio.h |  1 -
>>  2 files changed, 16 deletions(-)
>>
>> diff --git a/drivers/media/pci/cx18/cx18-gpio.c b/drivers/media/pci/cx18/cx18-gpio.c
>> index c85eb8d25837..485a6cbeb15a 100644
>> --- a/drivers/media/pci/cx18/cx18-gpio.c
>> +++ b/drivers/media/pci/cx18/cx18-gpio.c
>> @@ -305,21 +305,6 @@ int cx18_gpio_register(struct cx18 *cx, u32 hw)
>>  	return v4l2_device_register_subdev(&cx->v4l2_dev, sd);
>>  }
>>  
>> -void cx18_reset_ir_gpio(void *data)
>> -{
>> -	struct cx18 *cx = to_cx18(data);
>> -
>> -	if (cx->card->gpio_i2c_slave_reset.ir_reset_mask == 0)
>> -		return;
>> -
>> -	CX18_DEBUG_INFO("Resetting IR microcontroller\n");
>> -
>> -	v4l2_subdev_call(&cx->sd_resetctrl,
>> -			 core, reset, CX18_GPIO_RESET_Z8F0811);

Ah, this calls core.reset. But VIDIOC_INT_RESET in cx18_default() does the
same (actually, it calls this for all subdevs). So dropping this code should
be fine since you can still do the same thing with cx18-ctl --reset.

This function was probably used a long time ago by lirc_pvr150, but I can't
even find the source for that anymore. I assume it has a modern replacement.

This is the original commit adding this function:

commit 02fa272fcb6edda9059d6dbaab20dfe919f4f4d2
Author: Andy Walls <awalls@radix.net>
Date:   Sun Jul 13 19:30:15 2008 -0300

    V4L/DVB (8332): cx18: Suport external reset of the Z8F0811 IR controller on HVR-1600 for lirc

    cx18: added in cx18_ir_reset_gpio function for lirc_pvr150 like module.  Also
    added the ability to reset the IR chip via ioctl like ivtv.  This needs the
    mutex to protect gpio_dir and gpio_val in struct cx18 as gpio changes can
    come from a few different asynchronous sources now.

    Signed-off-by: Andy Walls <awalls@radix.net>
    Signed-off-by: Mauro Carvalho Chehab <mchehab@infradead.org>

Perhaps Andy remembers how frequent the lock ups were.

Regards,

	Hans

>> -}
>> -EXPORT_SYMBOL(cx18_reset_ir_gpio);
>> -/* This symbol is exported for use by lirc_pvr150 for the IR-blaster */
>> -
>>  /* Xceive tuner reset function */
>>  int cx18_reset_tuner_gpio(void *dev, int component, int cmd, int value)
>>  {
>> diff --git a/drivers/media/pci/cx18/cx18-gpio.h b/drivers/media/pci/cx18/cx18-gpio.h
>> index 0fa4c7ad2286..8d5797dea7f5 100644
>> --- a/drivers/media/pci/cx18/cx18-gpio.h
>> +++ b/drivers/media/pci/cx18/cx18-gpio.h
>> @@ -17,5 +17,4 @@ enum cx18_gpio_reset_type {
>>  	CX18_GPIO_RESET_XC2028  = 2,
>>  };
>>  
>> -void cx18_reset_ir_gpio(void *data);
>>  int cx18_reset_tuner_gpio(void *dev, int component, int cmd, int value);
>> -- 
>> 2.47.0
>>
> 


