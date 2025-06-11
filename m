Return-Path: <linux-media+bounces-34508-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A224AD5530
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 14:15:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6F3517F683
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 12:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D041A27E7F0;
	Wed, 11 Jun 2025 12:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="fxKAQ6lx"
X-Original-To: linux-media@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B0C2E6102;
	Wed, 11 Jun 2025 12:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749644123; cv=none; b=VHgG3bhpYx1qs7a4b3jysLAKzzlxIokHUb2Gq29fNrcvnTDAjWiQK+yHdsIpQzHE4T/n0aQOHgdZ/ikzdSV3577iZQwf4z3Tnx2FFZiSSv+fa2gLUWzJkBs/KTYRFeKirwQUSYMWNQqME9Z5hnO7rQEfT7JI44fcxgettxivdE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749644123; c=relaxed/simple;
	bh=FQrqMWHcqOYSzV0uJEVqzpxAbDwWYRMY89idJmr1ruM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mzo9NRq0/xE8PJzy3G4gRJRgYTbagNQ2tztMANi7Is0zD/1fU/TICJk1sg6mPMUIp0+1UH215/tAWJV1qozE2V18XbPak4pxZUIqaIiwatBQZNC3nSPLEGePcOeCMQguikrUs+BsDB4IBqYIOBvvaKNVqBjLuQqVrbYTPyS7u8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=fxKAQ6lx; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
	:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=xq24d1PFQ1Om8DHKsu9Y7WJ8vjCj2XxMm2DJZnzLc2I=; b=fxKAQ6lxrh1rLRfimuQ7BwYziF
	mGufIwkUqLEKEYohk0a2/a1MWY0cOcs0WTtyCfgXAP3rl6B+UWPrxoXRMxlWqA1Jg+UCQlMH1DsVd
	t5QhJCUURgvfTSx/MJkwP1IHljOekVNbSrVPyn6/XW/GXVOfB3hsDXRoHmofQi5cklH8=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:53988 helo=[192.168.0.218])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1uPKMJ-003Rdv-9u; Wed, 11 Jun 2025 14:15:11 +0200
Message-ID: <f4ebc809-f30e-46aa-9f36-db98370ebe6e@emfend.at>
Date: Wed, 11 Jun 2025 14:15:10 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: dw9714: add support for powerdown pin
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, bsp-development.geo@leica-geosystems.com
References: <20250611-dw9714-sd-v1-1-fb47ef5e736c@emfend.at>
 <aElNcDTLEJTcJs2s@kekkonen.localdomain>
Content-Language: de-DE
From: Matthias Fend <matthias.fend@emfend.at>
In-Reply-To: <aElNcDTLEJTcJs2s@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: 
X-Spam-Bar: 
X-Spam-Report: 

Hi Sakari,

thanks for your comments.

Am 11.06.2025 um 11:33 schrieb Sakari Ailus:
> Hi Matthias,
> 
> Thanks for the patch.
> 
> On Wed, Jun 11, 2025 at 09:13:33AM +0200, Matthias Fend wrote:
>> Add support for the powerdown pin (xSD), which can be used to put the VCM
>> driver into power down mode. This is useful, for example, if the VCM
>> driver's power supply cannot be controlled.
>> The use of the powerdown pin is optional.
> 
> Please rewrap. Most editors can do it for you.

To me the message body looks line wrapped at 75 columns. The last 
sentence on a new line. At least that is what was intended.
So I think I'm missing something here. Can you please tell me what 
exactly I should change?

> 
>>
>> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
>> ---
>>   drivers/media/i2c/Kconfig  |  2 +-
>>   drivers/media/i2c/dw9714.c | 16 ++++++++++++++++
>>   2 files changed, 17 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
>> index e45ba127069fc0848f1a06ceb789efd3c222c008..e923daeec9c574c5b8c7014b9e83fcbad47866c0 100644
>> --- a/drivers/media/i2c/Kconfig
>> +++ b/drivers/media/i2c/Kconfig
>> @@ -748,7 +748,7 @@ config VIDEO_AK7375
>>   
>>   config VIDEO_DW9714
>>   	tristate "DW9714 lens voice coil support"
>> -	depends on I2C && VIDEO_DEV
>> +	depends on GPIOLIB && I2C && VIDEO_DEV
>>   	select MEDIA_CONTROLLER
>>   	select VIDEO_V4L2_SUBDEV_API
>>   	select V4L2_ASYNC
>> diff --git a/drivers/media/i2c/dw9714.c b/drivers/media/i2c/dw9714.c
>> index 2ddd7daa79e28a2cde915b4173fa27e60d5a2b57..5b78c1848f80bc3e32df13d149f3865ff8defe6e 100644
>> --- a/drivers/media/i2c/dw9714.c
>> +++ b/drivers/media/i2c/dw9714.c
>> @@ -2,6 +2,7 @@
>>   // Copyright (c) 2015--2017 Intel Corporation.
>>   
>>   #include <linux/delay.h>
>> +#include <linux/gpio/consumer.h>
>>   #include <linux/i2c.h>
>>   #include <linux/module.h>
>>   #include <linux/pm_runtime.h>
>> @@ -38,6 +39,7 @@ struct dw9714_device {
>>   	struct v4l2_subdev sd;
>>   	u16 current_val;
>>   	struct regulator *vcc;
>> +	struct gpio_desc *powerdown_gpio;
>>   };
>>   
>>   static inline struct dw9714_device *to_dw9714_vcm(struct v4l2_ctrl *ctrl)
>> @@ -151,11 +153,20 @@ static int dw9714_probe(struct i2c_client *client)
>>   	if (IS_ERR(dw9714_dev->vcc))
>>   		return PTR_ERR(dw9714_dev->vcc);
>>   
>> +	dw9714_dev->powerdown_gpio = devm_gpiod_get_optional(&client->dev,
>> +							     "powerdown",
>> +							     GPIOD_OUT_LOW);
>> +	if (IS_ERR(dw9714_dev->powerdown_gpio))
>> +		return dev_err_probe(&client->dev,
>> +				     PTR_ERR(dw9714_dev->powerdown_gpio),
>> +				     "could not get powerdown gpio\n");
>> +
>>   	rval = regulator_enable(dw9714_dev->vcc);
>>   	if (rval < 0) {
>>   		dev_err(&client->dev, "failed to enable vcc: %d\n", rval);
>>   		return rval;
>>   	}
>> +	gpiod_set_value_cansleep(dw9714_dev->powerdown_gpio, 0);
> 
> This seems to be redundant, you're already setting the GPIO low when
> acquiring it. Typically the order is different, though: the regulator is
> enabled first. Also related to the following comment.

Yes, that's right. I'll set the pin during initialization so that 
power-down mode is active. So at least the sequence is always the same.

> 
>>   
>>   	usleep_range(1000, 2000);
>>   
>> @@ -185,6 +196,7 @@ static int dw9714_probe(struct i2c_client *client)
>>   	return 0;
>>   
>>   err_cleanup:
>> +	gpiod_set_value_cansleep(dw9714_dev->powerdown_gpio, 1);
>>   	regulator_disable(dw9714_dev->vcc);
> 
> It'd be nice to have a single implementation of the power-on and power-off
> sequences. Now there are two.

Okay, will do so.

Thanks,
  ~Matthias

> 
>>   	v4l2_ctrl_handler_free(&dw9714_dev->ctrls_vcm);
>>   	media_entity_cleanup(&dw9714_dev->sd.entity);
>> @@ -200,6 +212,7 @@ static void dw9714_remove(struct i2c_client *client)
>>   
>>   	pm_runtime_disable(&client->dev);
>>   	if (!pm_runtime_status_suspended(&client->dev)) {
>> +		gpiod_set_value_cansleep(dw9714_dev->powerdown_gpio, 1);
>>   		ret = regulator_disable(dw9714_dev->vcc);
>>   		if (ret) {
>>   			dev_err(&client->dev,
>> @@ -234,6 +247,7 @@ static int __maybe_unused dw9714_vcm_suspend(struct device *dev)
>>   		usleep_range(DW9714_CTRL_DELAY_US, DW9714_CTRL_DELAY_US + 10);
>>   	}
>>   
>> +	gpiod_set_value_cansleep(dw9714_dev->powerdown_gpio, 1);
>>   	ret = regulator_disable(dw9714_dev->vcc);
>>   	if (ret)
>>   		dev_err(dev, "Failed to disable vcc: %d\n", ret);
>> @@ -262,6 +276,8 @@ static int  __maybe_unused dw9714_vcm_resume(struct device *dev)
>>   		dev_err(dev, "Failed to enable vcc: %d\n", ret);
>>   		return ret;
>>   	}
>> +	gpiod_set_value_cansleep(dw9714_dev->powerdown_gpio, 0);
>> +
>>   	usleep_range(1000, 2000);
>>   
>>   	for (val = dw9714_dev->current_val % DW9714_CTRL_STEPS;
>>
> 


