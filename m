Return-Path: <linux-media+bounces-22538-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 620219E1CB7
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 13:50:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31B69167DCA
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 12:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6C661EF0B6;
	Tue,  3 Dec 2024 12:46:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from 189.cn (ptr.189.cn [183.61.185.103])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31FFE1EB9F3;
	Tue,  3 Dec 2024 12:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.61.185.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733230016; cv=none; b=m1RjFyOFwqunQdoFxZaVCIFUnlfjBAG0mpt4DGuv7enwPaP7PW/sKxt4XUH8DJUz1N7vJslZ9NeVV6ALRu9eIIzG6ptMM5S1WA0Vf2FDx0r1IRNN+8jQTT+sGqkAwt/HbCnd3HN+UIajYVNq02QZz6QhR5IRlgX/YtXB+n6STPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733230016; c=relaxed/simple;
	bh=XUvKG8rmpTeKfs6cJxGKS5fKCHuP/bWdL33sNoy5MUs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s7BB/UER8CVh7cfnPvqtxNmeep6e5x38udOI5izztHKxZoxyNhO0njZXj8By0YJ3qNpA2PoeQw1lgwAi8yWhschFqAqVaXRlCCWJfTOeXNLkvrbfhfOmK97RIRAx+j6OdTLbhLlJrBsxeXdFieGXNL3SGRRa1ozgm4MoK21A7kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=189.cn; spf=pass smtp.mailfrom=189.cn; arc=none smtp.client-ip=183.61.185.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=189.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=189.cn
HMM_SOURCE_IP:10.158.243.220:61015.1046576544
HMM_ATTACHE_NUM:0000
HMM_SOURCE_TYPE:SMTP
Received: from clientip-117.15.92.245 (unknown [10.158.243.220])
	by 189.cn (HERMES) with SMTP id D578F1000E6;
	Tue,  3 Dec 2024 20:46:49 +0800 (CST)
Received: from  ([117.15.92.245])
	by gateway-153622-dep-5c5f88b874-f78lq with ESMTP id f59ace2d81c7420d85fd34d7fce76345 for hdegoede@redhat.com;
	Tue, 03 Dec 2024 20:46:50 CST
X-Transaction-ID: f59ace2d81c7420d85fd34d7fce76345
X-Real-From: chensong_2000@189.cn
X-Receive-IP: 117.15.92.245
X-MEDUSA-Status: 0
Sender: chensong_2000@189.cn
Message-ID: <98cfdcf2-e823-4773-a396-84148a4d6a5b@189.cn>
Date: Tue, 3 Dec 2024 20:46:48 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers/staging/media/atomisp: replace legacy GPIO APIs
 in atomisp_gmin_platform
To: Hans de Goede <hdegoede@redhat.com>, andy@kernel.org, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
 bergh.jonathan@gmail.com
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20241203091436.203745-1-chensong_2000@189.cn>
 <81a63f9d-afe4-4a29-ae98-5c5837bcd7cb@redhat.com>
Content-Language: en-US
From: Song Chen <chensong_2000@189.cn>
In-Reply-To: <81a63f9d-afe4-4a29-ae98-5c5837bcd7cb@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

oh, good to know, many thanks.

Song

在 2024/12/3 18:13, Hans de Goede 写道:
> Hi,
> 
> On 3-Dec-24 10:14 AM, Song Chen wrote:
>> In atomisp_gmin_platform, gpio0 and gpio1 have moved to descriptor-based
>> GPIO APIs, but v1p8_gpio and v2p8_gpio still remain calling legacy ones,
>> such as gpio_request.
>>
>> This patch replaces old with new, also removes including gpio.h.
>>
>> Signed-off-by: Song Chen <chensong_2000@189.cn>
> 
> Thank you for your patch, this is already addresses by this patch
> which I plan to merge soon:
> 
> https://lore.kernel.org/linux-media/20241107221134.596149-1-hdegoede@redhat.com/
> 
> Regards,
> 
> Hans
> 
> 
>> ---
>>   .../media/atomisp/pci/atomisp_gmin_platform.c | 63 ++++++++-----------
>>   1 file changed, 25 insertions(+), 38 deletions(-)
>>
>> diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
>> index e176483df301..7ff548ac3171 100644
>> --- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
>> +++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
>> @@ -11,7 +11,6 @@
>>   #include <linux/mfd/intel_soc_pmic.h>
>>   #include <linux/regulator/consumer.h>
>>   #include <linux/gpio/consumer.h>
>> -#include <linux/gpio.h>
>>   #include <linux/platform_device.h>
>>   #include "../../include/linux/atomisp_platform.h"
>>   #include "../../include/linux/atomisp_gmin_platform.h"
>> @@ -85,8 +84,8 @@ struct gmin_subdev {
>>   	bool v2p8_on;
>>   	bool v1p2_on;
>>   
>> -	int v1p8_gpio;
>> -	int v2p8_gpio;
>> +	struct gpio_desc *v1p8_gpiod;
>> +	struct gpio_desc *v2p8_gpiod;
>>   
>>   	u8 pwm_i2c_addr;
>>   
>> @@ -548,23 +547,6 @@ static int gmin_subdev_add(struct gmin_subdev *gs)
>>   	else
>>   		dev_info(dev, "will handle gpio1 via ACPI\n");
>>   
>> -	/*
>> -	 * Those are used only when there is an external regulator apart
>> -	 * from the PMIC that would be providing power supply, like on the
>> -	 * two cases below:
>> -	 *
>> -	 * The ECS E7 board drives camera 2.8v from an external regulator
>> -	 * instead of the PMIC.  There's a gmin_CamV2P8 config variable
>> -	 * that specifies the GPIO to handle this particular case,
>> -	 * but this needs a broader architecture for handling camera power.
>> -	 *
>> -	 * The CHT RVP board drives camera 1.8v from an* external regulator
>> -	 * instead of the PMIC just like ECS E7 board.
>> -	 */
>> -
>> -	gs->v1p8_gpio = gmin_get_var_int(dev, true, "V1P8GPIO", -1);
>> -	gs->v2p8_gpio = gmin_get_var_int(dev, true, "V2P8GPIO", -1);
>> -
>>   	/*
>>   	 * FIXME:
>>   	 *
>> @@ -830,21 +812,23 @@ static int gmin_v1p2_ctrl(struct v4l2_subdev *subdev, int on)
>>   static int gmin_v1p8_ctrl(struct v4l2_subdev *subdev, int on)
>>   {
>>   	struct gmin_subdev *gs = find_gmin_subdev(subdev);
>> +	struct i2c_client *client = v4l2_get_subdevdata(gs->subdev);
>> +	struct device *dev = &client->dev;
>>   	int ret;
>>   	int value;
>>   	int reg;
>> +	int v1p8_gpio;
>>   
>>   	if (!gs || gs->v1p8_on == on)
>>   		return 0;
>>   
>> -	if (gs->v1p8_gpio >= 0) {
>> -		pr_info("atomisp_gmin_platform: 1.8v power on GPIO %d\n",
>> -			gs->v1p8_gpio);
>> -		ret = gpio_request(gs->v1p8_gpio, "camera_v1p8_en");
>> -		if (!ret)
>> -			ret = gpio_direction_output(gs->v1p8_gpio, 0);
>> -		if (ret)
>> +	v1p8_gpio = gmin_get_var_int(dev, true, "V1P8GPIO", -1);
>> +	if (v1p8_gpio >= 0) {
>> +		gs->v1p8_gpiod = gpiod_get_index(dev, "camera_v1p8", v1p8_gpio, GPIOD_ASIS);
>> +		if (IS_ERR(gs->v1p8_gpiod))
>>   			pr_err("V1P8 GPIO initialization failed\n");
>> +		else
>> +			gpiod_direction_output(gs->v1p8_gpiod, 0);
>>   	}
>>   
>>   	gs->v1p8_on = on;
>> @@ -861,8 +845,8 @@ static int gmin_v1p8_ctrl(struct v4l2_subdev *subdev, int on)
>>   			goto out; /* Still needed */
>>   	}
>>   
>> -	if (gs->v1p8_gpio >= 0)
>> -		gpio_set_value(gs->v1p8_gpio, on);
>> +	if (v1p8_gpio >= 0)
>> +		gpiod_set_value(gs->v1p8_gpiod, on);
>>   
>>   	if (gs->v1p8_reg) {
>>   		regulator_set_voltage(gs->v1p8_reg, 1800000, 1800000);
>> @@ -911,21 +895,24 @@ static int gmin_v1p8_ctrl(struct v4l2_subdev *subdev, int on)
>>   static int gmin_v2p8_ctrl(struct v4l2_subdev *subdev, int on)
>>   {
>>   	struct gmin_subdev *gs = find_gmin_subdev(subdev);
>> +	struct i2c_client *client = v4l2_get_subdevdata(gs->subdev);
>> +	struct device *dev = &client->dev;
>>   	int ret;
>>   	int value;
>>   	int reg;
>> +	int v2p8_gpio;
>>   
>>   	if (WARN_ON(!gs))
>>   		return -ENODEV;
>>   
>> -	if (gs->v2p8_gpio >= 0) {
>> -		pr_info("atomisp_gmin_platform: 2.8v power on GPIO %d\n",
>> -			gs->v2p8_gpio);
>> -		ret = gpio_request(gs->v2p8_gpio, "camera_v2p8");
>> -		if (!ret)
>> -			ret = gpio_direction_output(gs->v2p8_gpio, 0);
>> -		if (ret)
>> +	v2p8_gpio = gmin_get_var_int(dev, true, "V2P8GPIO", -1);
>> +	if (v2p8_gpio >= 0) {
>> +		pr_info("atomisp_gmin_platform: 2.8v power on GPIO %d\n", v2p8_gpio);
>> +		gs->v2p8_gpiod = gpiod_get_index(dev, "camera_v2p8", v2p8_gpio, GPIOD_ASIS);
>> +		if (IS_ERR(gs->v2p8_gpiod))
>>   			pr_err("V2P8 GPIO initialization failed\n");
>> +		else
>> +			gpiod_direction_output(gs->v2p8_gpiod, 0);
>>   	}
>>   
>>   	if (gs->v2p8_on == on)
>> @@ -944,8 +931,8 @@ static int gmin_v2p8_ctrl(struct v4l2_subdev *subdev, int on)
>>   			goto out; /* Still needed */
>>   	}
>>   
>> -	if (gs->v2p8_gpio >= 0)
>> -		gpio_set_value(gs->v2p8_gpio, on);
>> +	if (v2p8_gpio >= 0)
>> +		gpiod_set_value(gs->v2p8_gpiod, on);
>>   
>>   	if (gs->v2p8_reg) {
>>   		regulator_set_voltage(gs->v2p8_reg, 2900000, 2900000);
> 
> 

