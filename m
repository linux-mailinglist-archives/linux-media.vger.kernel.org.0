Return-Path: <linux-media+bounces-597-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C46F67F0F98
	for <lists+linux-media@lfdr.de>; Mon, 20 Nov 2023 10:58:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00B501C2114F
	for <lists+linux-media@lfdr.de>; Mon, 20 Nov 2023 09:58:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4201F125C3;
	Mon, 20 Nov 2023 09:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xf81EliQ"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A64C8F
	for <linux-media@vger.kernel.org>; Mon, 20 Nov 2023 01:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700474324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=332vkApsXHsrWIjkkuK5LmA8mBeV5SS3dbZDWGiD6U0=;
	b=Xf81EliQLDeRBTqlp+X/t+i48fkRmwiGit6333ZfpG1BCcsbz48nTwECMOz2clWm/tfNlb
	gdvp3JR+NadR7LL4RMDqGl+3fjenZ7QTISD9uP9Ta+qlaStnzYqI58KySnBdHGNQSzb0KJ
	F+/yrZ3fhg7l9mDq7yWBuHDXBUMi6oU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-258-kYQR9Cf1MQ6y-ExReyUDjg-1; Mon, 20 Nov 2023 04:58:43 -0500
X-MC-Unique: kYQR9Cf1MQ6y-ExReyUDjg-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9e15f05c3ceso293332466b.3
        for <linux-media@vger.kernel.org>; Mon, 20 Nov 2023 01:58:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700474322; x=1701079122;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=332vkApsXHsrWIjkkuK5LmA8mBeV5SS3dbZDWGiD6U0=;
        b=Io13+8bBorMKQ09eONJv34L3amO01UzSP3iT2iWy6hZ1lCnqXewiz2LbMyHdVeftvV
         oiMPHBa+AeAjbOoTNVexs7EGnTMvlplCUvU+J/FGuI1vS3Ijro83RnjWjXo2sBRUvtEU
         OTSpT+zZM+cmpLNBxRrI7ryq6BxWzYJtDL89egjQUqBd4/JPHqztPlgpMPxiM6QUbg8s
         MOYMlC9CCFkMqUITKbnnq/TmQappVbnoJxlGSBCmtsTN3c3yB+pz/JqV1aYD+nxbZ5yM
         4y5CdXy5YQzlAlS6HMhlGukaYOjUEcpb+kubAwlbpjFDyEXVgFjeRRx119t8xlVnxftz
         OTsA==
X-Gm-Message-State: AOJu0YwvFOcUj3d4bfTPLGzHxtL0WNO4BpuiQOALro7X+R8+4VEhYJKE
	6uMD2F3P/SN8ZeW0Ab10SnoqdvhozVA1OQmLlkfXgWgGuH//fzzYlIQAIlw9IMqbalrhY5SyNKH
	sdpBFVadV1Fri5q4zmpusKms=
X-Received: by 2002:a17:906:1c91:b0:9bf:889e:32a4 with SMTP id g17-20020a1709061c9100b009bf889e32a4mr5355124ejh.54.1700474322275;
        Mon, 20 Nov 2023 01:58:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFyDXvYx6FbES6ogVQOhacFJ8I0goE4dQ0+LonCW75hzsBEXZTSnHMR9VgVP+5zkawos7Vb2A==
X-Received: by 2002:a17:906:1c91:b0:9bf:889e:32a4 with SMTP id g17-20020a1709061c9100b009bf889e32a4mr5355110ejh.54.1700474321951;
        Mon, 20 Nov 2023 01:58:41 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id dx25-20020a170906a85900b009f826f1238esm3565520ejb.100.2023.11.20.01.58.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 01:58:41 -0800 (PST)
Message-ID: <9960589d-a91b-4edf-ba42-c6331ecc4cb8@redhat.com>
Date: Mon, 20 Nov 2023 10:58:40 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: ov2740: Add support for reset GPIO
Content-Language: en-US, nl
To: Bingbu Cao <bingbu.cao@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>, Bingbu Cao <bingbu.cao@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Kate Hsuan <hpa@redhat.com>,
 linux-media@vger.kernel.org
References: <20231115123817.196252-1-hdegoede@redhat.com>
 <20231115123817.196252-2-hdegoede@redhat.com>
 <8a2988c5-e01d-1515-b908-2e28a6545120@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <8a2988c5-e01d-1515-b908-2e28a6545120@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Bingbu,

Thank you for the review!

On 11/20/23 05:04, Bingbu Cao wrote:
> 
> Hans,
> 
> Thanks for your patch.
> 
> On 11/15/23 8:38 PM, Hans de Goede wrote:
>> On some ACPI platforms, such as Chromebooks the ACPI methods to
>> change the power-state (_PS0 and _PS3) fully take care of powering
>> on/off the sensor.
>>
>> On other ACPI platforms, such as e.g. various ThinkPad models with
>> IPU6 + ov2740 sensor, the sensor driver must control the reset GPIO
>> and the sensor's clock itself.
>>
>> Add support for having the driver control an optional reset GPIO.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/media/i2c/ov2740.c | 48 ++++++++++++++++++++++++++++++++++++--
>>  1 file changed, 46 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
>> index 24e468485fbf..e5f9569a229d 100644
>> --- a/drivers/media/i2c/ov2740.c
>> +++ b/drivers/media/i2c/ov2740.c
>> @@ -4,6 +4,7 @@
>>  #include <asm/unaligned.h>
>>  #include <linux/acpi.h>
>>  #include <linux/delay.h>
>> +#include <linux/gpio/consumer.h>
>>  #include <linux/i2c.h>
>>  #include <linux/module.h>
>>  #include <linux/pm_runtime.h>
>> @@ -333,6 +334,9 @@ struct ov2740 {
>>  	struct v4l2_ctrl *hblank;
>>  	struct v4l2_ctrl *exposure;
>>  
>> +	/* GPIOs, clocks */
> 
> It looks like the 'clock' should be in another one (2/2), :).

This was intentional to avoid churn in the form of
immediately changing the comment in the second patch :)

>> +	struct gpio_desc *reset_gpio;
>> +
>>  	/* Current mode */
>>  	const struct ov2740_mode *cur_mode;
>>  
>> @@ -1058,6 +1062,26 @@ static int ov2740_register_nvmem(struct i2c_client *client,
>>  	return 0;
>>  }
>>  
>> +static int ov2740_suspend(struct device *dev)
>> +{
>> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>> +	struct ov2740 *ov2740 = to_ov2740(sd);
>> +
>> +	gpiod_set_value_cansleep(ov2740->reset_gpio, 1);
>> +	return 0;
>> +}
>> +
>> +static int ov2740_resume(struct device *dev)
>> +{
>> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>> +	struct ov2740 *ov2740 = to_ov2740(sd);
>> +
>> +	gpiod_set_value_cansleep(ov2740->reset_gpio, 0);
>> +	msleep(20);
> 
> I remember that usleep_range() is prefered for <=20ms.

I think that only applies to msleep <= 10ms, at least
check-patch is happy with this and I know it complains
about too short msleep() calls.

Regards,

Hans


