Return-Path: <linux-media+bounces-48835-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FC4CC0702
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 02:21:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DFC5030169B9
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 01:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AD00258CE9;
	Tue, 16 Dec 2025 01:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hl+rjKPr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AFF23C503
	for <linux-media@vger.kernel.org>; Tue, 16 Dec 2025 01:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765848092; cv=none; b=VFWnb9sOwKdb9rLxyQseEyYFfvvCq8BDrhNNeLz0IJwI7fw1vuIaH8JKL5JlFHQpq9gWByCdTTnphIVeE7k2S8kdZ1kDG9jpvpdzUbCpunihxEOk6cWUb4wAzQl9NY+ajqJbGqyHcoxI7Lk9odzbHfWp3xzB4q4Ji89xz5hITZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765848092; c=relaxed/simple;
	bh=qUZU4oOQEqfv6gvQYh9sooxjGnt9rbBJv8OvmJ8ZRkk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qnuHuARmZyxKv5HIuibkI+9UFAycIIDA8KM/rvhPUGiHW1bcKx72zGqOCHoI8WobLIYyuwFADytNLN7LiJ5nCAidHHOzM3ynBHAwStpnKgeQMwFeTX5O2k28e4Kwj1rnj+efqmFbGMIiTfAZJ5DN5f7RSxcrMo9/OnzxAmlId8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hl+rjKPr; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-37a990ec4e5so3390741fa.3
        for <linux-media@vger.kernel.org>; Mon, 15 Dec 2025 17:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765848086; x=1766452886; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9GxCsdbDzaUKeECTtk2Q/mX37hdT/FvGREhPPmkoY7I=;
        b=hl+rjKPrnxgLOeB4/xE9KgzwoewIsFQCYOHM8Y/P/G1CBQ4fSCGOah3P0c5tMnaSpL
         0O983aENlPsvZK/r9k7fn5soZS4X2oWTEz732ve4EPlVbD7lBD6a73CVhQ5ZYWoK7kfn
         r2e48WycYwRlJRii0+l+R4x3PB8ztgaGycu1RsDTgK2PjL/Mb0ONGivcAxQa6G6adgeO
         rO6lSwf/NIFF5b39wi+Taw1qMp021HPKiVM8XjY0703y/lxcajp6il3MlgU84ec0UdmT
         QSM78QRlfecqnDw92iszLz/pHLcYBUB1YOkTE5qaPGHZCKf0WzcQeb2dDsldyG0j6o9S
         PXqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765848086; x=1766452886;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9GxCsdbDzaUKeECTtk2Q/mX37hdT/FvGREhPPmkoY7I=;
        b=rcRyTPEAWootH/NpkQ9Tj4W1c5eRmd56/joXeKkKOmP3Yf1tEWM9Qwm9pzB8jzyqRQ
         C5NMj8dowLPYJk0ZKtHx8rbkaJt/PXTkvRUU6AIOFaPUWNAd0Cntu86quK1vQB0PwWQz
         F6n2IvnJML1/3sTAKf4xT010esDD6E69Bdm/CwX/Uduh3wNy9r3VkAu8UcNRQkWaYg4w
         cWzZWPu/B9iUQ199/iJOfjsMCGelETSedJhLqWKsQo6JMQ1+OK5lUNaHvsTkraJgf8hM
         6iub42ocIURdWlzhIXuI5y1Tyzd0ikLexXKKt4S7CakoAdqG0CwkeveETw6V3zcpaoOZ
         M+2A==
X-Forwarded-Encrypted: i=1; AJvYcCU/HojCe/E85+ADyhzZPyAVUWcjJilzDGrOpWsJFhIGT9c1vm4cYB6jcel3CQvgqjzv3qXgDT59eF2xQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrSIcJA3YuL5Z4kRaY2CnjG1Km/CrIOuxZAQz0vUdF5XwDFtun
	tXGkC7eZIfUlmLUsak8gp29qS/t6H8+dOhl33HVgyDyR+xaCMX8Lx4JTN3qX98bqPvW/i0chOzu
	5nvRh
X-Gm-Gg: AY/fxX53QYrShjeyMuP3Y+ew8rYtGauBNE9Tuy47gCqGokI7b7GzoK13yhu+h1ehwWU
	m8gMX4P0CJyZnnrMEnY8z0//e3WByBSbsfU2tDpBEiECtNOlRXi7yiK4TX47MiOIZ8SqzpaMk0M
	1oFP85gXHWJF7xpYphUZER1O+Ju/7MUORtizo75UpPRbTBDIZlbVSH4svZkAV6gBiPI+cj5iEZg
	HHetBdOvUhq+1L6a6oFQWOPrN3z9wMX9Biy4nH4JUERT5V/bcsSW8xNTuovNYLakk5+UKFXyz2f
	m6yzcShqFcog91gkFab+ucqM3HAbf1GN9j75/fifgiQT8NZAXeCmtG14ZxLlOgxanKYjlYjngUA
	7XD0hQb+EjFqrHrg9uTVJs8hZQPQXFnE/J9mNZuw0LyjWOLp4qQ8xcSrom7WSY55ktwA19Q8oHh
	aBBfJU/hqX0Kkxf7gsPO7KokA45CTRzS9Zol0PbzF7mR1x1TfPAVvOxetqouO95bx6zg==
X-Google-Smtp-Source: AGHT+IER1d9HWWZIFkaz5VB2aQ/uGH2mFw8XkkXgJt7cJefox/9lebHUHTzWvr+HQHGWBWq4mgRV/Q==
X-Received: by 2002:a05:6512:23aa:b0:595:9161:f837 with SMTP id 2adb3069b0e04-598faa763c1mr2407256e87.4.1765848085613;
        Mon, 15 Dec 2025 17:21:25 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5990da78bfdsm326832e87.97.2025.12.15.17.21.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Dec 2025 17:21:23 -0800 (PST)
Message-ID: <d53ded68-48d6-4b05-902c-d399ecd00f26@linaro.org>
Date: Tue, 16 Dec 2025 03:21:21 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] media: i2c: add os05b10 image sensor driver
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>,
 "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
Cc: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>,
 Hans de Goede <hansg@kernel.org>, Mehdi Djait <mehdi.djait@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Dongcheng Yan <dongcheng.yan@intel.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Jingjing Xiong <jingjing.xiong@intel.com>,
 Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20251212090358.44989-1-himanshu.bhavani@siliconsignals.io>
 <20251212090358.44989-3-himanshu.bhavani@siliconsignals.io>
 <3987b3fa-efd0-4ff3-9739-86a5cff6b4a4@linaro.org>
 <PN0P287MB2019A74DDE19F52E8526A7879AADA@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <PN0P287MB2019A74DDE19F52E8526A7879AADA@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Himanshu.

On 12/15/25 17:34, Himanshu Bhavani wrote:
> Hi Vladimir,
> 
>> On 12/12/25 11:03, Himanshu Bhavani wrote:
>>> Add a v4l2 subdevice driver for the Omnivision OS05B10 sensor.
>>>
>>> The Omnivision OS05B10 image sensor with an active
>>> array size of 2592 x 1944.
>>>
>>> The following features are supported:
>>> - Manual exposure an gain control support
>>> - vblank/hblank control support
>>> - Supported resolution: 2592 x 1944 @ 60fps (SBGGR10)
>>>
>>> Co-developed-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
>>> Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
>>> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
>>> ---
>>>     MAINTAINERS                 |    1 +
>>>     drivers/media/i2c/Kconfig   |   10 +
>>>     drivers/media/i2c/Makefile  |    1 +
>>>     drivers/media/i2c/os05b10.c | 1115 +++++++++++++++++++++++++++++++++++
>>>     4 files changed, 1127 insertions(+)
>>>     create mode 100644 drivers/media/i2c/os05b10.c
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index c85915d5d20e..c48d04ca38d1 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -19240,6 +19240,7 @@ M:    Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
>>>     L:  linux-media@vger.kernel.org
>>>     S:  Maintained
>>>     F:  Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
>>> +F:   drivers/media/i2c/os05b10.c
>>>
>>>     OMNIVISION OV01A10 SENSOR DRIVER
>>>     M:  Bingbu Cao <bingbu.cao@intel.com>
>>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
>>> index 4b4db8c4f496..9800ba50b9a6 100644
>>> --- a/drivers/media/i2c/Kconfig
>>> +++ b/drivers/media/i2c/Kconfig
>>> @@ -371,6 +371,16 @@ config VIDEO_OG0VE1B
>>>           To compile this driver as a module, choose M here: the
>>>           module will be called og0ve1b.
>>>
>>> +config VIDEO_OS05B10
>>> +        tristate "OmniVision OS05B10 sensor support"
>>> +        select V4L2_CCI_I2C
>>> +        help
>>> +          This is a Video4Linux2 sensor driver for Omnivision
>>> +          OS05B10 camera sensor.
>>> +
>>> +       To compile this driver as a module, choose M here: the
>>> +          module will be called os05b10.
>>> +
>>>     config VIDEO_OV01A10
>>>         tristate "OmniVision OV01A10 sensor support"
>>>         help
>>> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
>>> index c5f17602454f..561d37939875 100644
>>> --- a/drivers/media/i2c/Makefile
>>> +++ b/drivers/media/i2c/Makefile
>>> @@ -84,6 +84,7 @@ obj-$(CONFIG_VIDEO_MT9V032) += mt9v032.o
>>>     obj-$(CONFIG_VIDEO_MT9V111) += mt9v111.o
>>>     obj-$(CONFIG_VIDEO_OG01A1B) += og01a1b.o
>>>     obj-$(CONFIG_VIDEO_OG0VE1B) += og0ve1b.o
>>> +obj-$(CONFIG_VIDEO_OS05B10) += os05b10.o
>>>     obj-$(CONFIG_VIDEO_OV01A10) += ov01a10.o
>>>     obj-$(CONFIG_VIDEO_OV02A10) += ov02a10.o
>>>     obj-$(CONFIG_VIDEO_OV02C10) += ov02c10.o
>>> diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
>>> new file mode 100644
>>> index 000000000000..319428f48f72
>>> --- /dev/null
>>> +++ b/drivers/media/i2c/os05b10.c
>>> @@ -0,0 +1,1115 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * V4L2 Support for the os05b10
>>> + *
>>> + * Copyright (C) 2025 Silicon Signals Pvt. Ltd.
>>> + *
>>> + * Inspired from imx219, ov2735 camera drivers.
>>> + */
>>> +
>>> +#include <linux/array_size.h>
>>> +#include <linux/bitops.h>
>>> +#include <linux/cleanup.h>
>>> +#include <linux/clk.h>
>>> +#include <linux/container_of.h>
>>> +#include <linux/delay.h>
>>> +#include <linux/device/devres.h>
>>> +#include <linux/err.h>
>>> +#include <linux/gpio/consumer.h>
>>> +#include <linux/i2c.h>
>>> +#include <linux/module.h>
>>> +#include <linux/pm_runtime.h>
>>> +#include <linux/property.h>
>>> +#include <linux/regulator/consumer.h>
>>> +#include <linux/units.h>
>>> +#include <linux/types.h>
>>> +#include <linux/time.h>
>>> +
>>> +#include <media/v4l2-cci.h>
>>> +#include <media/v4l2-ctrls.h>
>>> +#include <media/v4l2-device.h>
>>> +#include <media/v4l2-fwnode.h>
>>> +#include <media/v4l2-mediabus.h>
>>> +
>>> +#define OS05B10_XCLK_FREQ            (24 * HZ_PER_MHZ)
>>> +
>>> +#define OS05B10_REG_CHIP_ID          CCI_REG24(0x300A)
>>> +#define OS05B10_CHIP_ID                      0x530641
>>> +
>>> +#define OS05B10_REG_CTRL_MODE                CCI_REG8(0x0100)
>>> +#define OS05B10_MODE_STANDBY         0x00
>>> +#define OS05B10_MODE_STREAMING               0x01
>>> +
>>> +#define OS05B10_REG_VTS                      CCI_REG16(0x380E)
>>> +#define OS05B10_VTS_MAX                      0xFFFF
>>> +
>>> +#define OS05B10_REG_HTS                      CCI_REG16(0x380C)
>>> +
>>> +#define OS05B10_ANALOG_GAIN          CCI_REG16(0x3508)
>>> +#define OS05B10_ANALOG_GAIN_MIN              0x80
>>> +#define OS05B10_ANALOG_GAIN_MAX              0x7C0
>>> +#define OS05B10_ANALOG_GAIN_STEP     1
>>> +#define OS05B10_ANALOG_GAIN_DEFAULT     0x80
>>> +
>>> +#define OS05B10_EXPOSURE_GAIN                CCI_REG24(0x3500)
>>> +#define OS05B10_EXPOSURE_MIN         2
>>> +#define OS05B10_EXPOSURE_STEP                1
>>> +#define OS05B10_EXPOSURE_MARGIN         8
>>> +
>>> +#define OS05B10_PIXEL_RATE           (480 * HZ_PER_MHZ)
>>> +#define OS05B10_LINK_FREQ_600MHZ     (600 * HZ_PER_MHZ)
>>> +
>>> +static const struct v4l2_rect os05b10_native_area = {
>>> +     .top = 0,
>>> +     .left = 0,
>>> +     .width = 2608,
>>> +     .height = 1960,
>>> +};
>>> +
>>> +static const struct v4l2_rect os05b10_active_area = {
>>> +     .top = 8,
>>> +     .left = 8,
>>> +     .width = 2592,
>>> +     .height = 1944,
>>> +};
>>> +
>>> +static const char * const os05b10_supply_name[] = {
>>> +     "avdd", /*Analog supply 2.8v */
>>> +     "dvdd", /*Digital core 1.2v */
>>> +     "dovdd", /*Digital IO 1.8v */
>>> +};
>>
>> Move voltage levels of supplies to the descriptions of voltage supplies
>> in the added dt binding documentation file, that's the proper place to
>> store this type of information.
>>
>> Also note that there should be a space symbol after '/*'.
>>
>>> +
>>> +static const struct cci_reg_sequence os05b10_common_regs[] = {
>>> +     { CCI_REG8(0x0103), 0x01 },
>>> +     { CCI_REG8(0x0301), 0x44 },
>>> +     { CCI_REG8(0x0303), 0x02 },
>>> +     { CCI_REG8(0x0305), 0x32 },
>>> +     { CCI_REG8(0x0306), 0x00 },
>>> +     { CCI_REG8(0x0325), 0x3b },
>>> +     { CCI_REG8(0x3002), 0x21 },
>>> +     { CCI_REG8(0x3016), 0x72 },
>>> +     { CCI_REG8(0x301e), 0xb4 },
>>> +     { CCI_REG8(0x301f), 0xd0 },
>>> +     { CCI_REG8(0x3021), 0x03 },
>>> +     { CCI_REG8(0x3022), 0x01 },
>>> +     { CCI_REG8(0x3107), 0xa1 },
>>> +     { CCI_REG8(0x3108), 0x7d },
>>> +     { CCI_REG8(0x3109), 0xfc },
>>> +     { CCI_REG8(0x3500), 0x00 },
>>> +     { CCI_REG8(0x3501), 0x07 },
>>> +     { CCI_REG8(0x3502), 0xb6 },
>>> +     { CCI_REG8(0x3503), 0x88 },
>>> +     { CCI_REG8(0x3508), 0x00 },
>>> +     { CCI_REG8(0x3509), 0x80 },
>>> +     { CCI_REG8(0x350a), 0x04 },
>>> +     { CCI_REG8(0x350b), 0x00 },
>>> +     { CCI_REG8(0x350c), 0x00 },
>>> +     { CCI_REG8(0x350d), 0x80 },
>>> +     { CCI_REG8(0x350e), 0x04 },
>>> +     { CCI_REG8(0x350f), 0x00 },
>>> +     { CCI_REG8(0x3510), 0x00 },
>>> +     { CCI_REG8(0x3511), 0x00 },
>>> +     { CCI_REG8(0x3512), 0x20 },
>>> +     { CCI_REG8(0x3600), 0x4d },
>>> +     { CCI_REG8(0x3601), 0x08 },
>>> +     { CCI_REG8(0x3610), 0x87 },
>>> +     { CCI_REG8(0x3611), 0x24 },
>>> +     { CCI_REG8(0x3614), 0x4c },
>>> +     { CCI_REG8(0x3620), 0x0c },
>>> +     { CCI_REG8(0x3632), 0x80 },
>>> +     { CCI_REG8(0x3633), 0x00 },
>>> +     { CCI_REG8(0x3636), 0xcc },
>>> +     { CCI_REG8(0x3637), 0x27 },
>>> +     { CCI_REG8(0x3660), 0x00 },
>>> +     { CCI_REG8(0x3662), 0x10 },
>>> +     { CCI_REG8(0x3665), 0x00 },
>>> +     { CCI_REG8(0x3666), 0x00 },
>>> +     { CCI_REG8(0x366a), 0x14 },
>>> +     { CCI_REG8(0x3670), 0x0b },
>>> +     { CCI_REG8(0x3671), 0x0b },
>>> +     { CCI_REG8(0x3672), 0x0b },
>>> +     { CCI_REG8(0x3673), 0x0b },
>>> +     { CCI_REG8(0x3678), 0x2b },
>>> +     { CCI_REG8(0x367a), 0x11 },
>>> +     { CCI_REG8(0x367b), 0x11 },
>>> +     { CCI_REG8(0x367c), 0x11 },
>>> +     { CCI_REG8(0x367d), 0x11 },
>>> +     { CCI_REG8(0x3681), 0xff },
>>> +     { CCI_REG8(0x3682), 0x86 },
>>> +     { CCI_REG8(0x3683), 0x44 },
>>> +     { CCI_REG8(0x3684), 0x24 },
>>> +     { CCI_REG8(0x3685), 0x00 },
>>> +     { CCI_REG8(0x368a), 0x00 },
>>> +     { CCI_REG8(0x368d), 0x2b },
>>> +     { CCI_REG8(0x368e), 0x2b },
>>> +     { CCI_REG8(0x3690), 0x00 },
>>> +     { CCI_REG8(0x3691), 0x0b },
>>> +     { CCI_REG8(0x3692), 0x0b },
>>> +     { CCI_REG8(0x3693), 0x0b },
>>> +     { CCI_REG8(0x3694), 0x0b },
>>> +     { CCI_REG8(0x369d), 0x68 },
>>> +     { CCI_REG8(0x369e), 0x34 },
>>> +     { CCI_REG8(0x369f), 0x1b },
>>> +     { CCI_REG8(0x36a0), 0x0f },
>>> +     { CCI_REG8(0x36a1), 0x77 },
>>> +     { CCI_REG8(0x36b0), 0x30 },
>>> +     { CCI_REG8(0x36b2), 0x00 },
>>> +     { CCI_REG8(0x36b3), 0x00 },
>>> +     { CCI_REG8(0x36b4), 0x00 },
>>> +     { CCI_REG8(0x36b5), 0x00 },
>>> +     { CCI_REG8(0x36b6), 0x00 },
>>> +     { CCI_REG8(0x36b7), 0x00 },
>>> +     { CCI_REG8(0x36b8), 0x00 },
>>> +     { CCI_REG8(0x36b9), 0x00 },
>>> +     { CCI_REG8(0x36ba), 0x00 },
>>> +     { CCI_REG8(0x36bb), 0x00 },
>>> +     { CCI_REG8(0x36bc), 0x00 },
>>> +     { CCI_REG8(0x36bd), 0x00 },
>>> +     { CCI_REG8(0x36be), 0x00 },
>>> +     { CCI_REG8(0x36bf), 0x00 },
>>> +     { CCI_REG8(0x36c0), 0x01 },
>>> +     { CCI_REG8(0x36c1), 0x00 },
>>> +     { CCI_REG8(0x36c2), 0x00 },
>>> +     { CCI_REG8(0x36c3), 0x00 },
>>> +     { CCI_REG8(0x36c4), 0x00 },
>>> +     { CCI_REG8(0x36c5), 0x00 },
>>> +     { CCI_REG8(0x36c6), 0x00 },
>>> +     { CCI_REG8(0x36c7), 0x00 },
>>> +     { CCI_REG8(0x36c8), 0x00 },
>>> +     { CCI_REG8(0x36c9), 0x00 },
>>> +     { CCI_REG8(0x36ca), 0x0e },
>>> +     { CCI_REG8(0x36cb), 0x0e },
>>> +     { CCI_REG8(0x36cc), 0x0e },
>>> +     { CCI_REG8(0x36cd), 0x0e },
>>> +     { CCI_REG8(0x36ce), 0x0c },
>>> +     { CCI_REG8(0x36cf), 0x0c },
>>> +     { CCI_REG8(0x36d0), 0x0c },
>>> +     { CCI_REG8(0x36d1), 0x0c },
>>> +     { CCI_REG8(0x36d2), 0x00 },
>>> +     { CCI_REG8(0x36d3), 0x08 },
>>> +     { CCI_REG8(0x36d4), 0x10 },
>>> +     { CCI_REG8(0x36d5), 0x10 },
>>> +     { CCI_REG8(0x36d6), 0x00 },
>>> +     { CCI_REG8(0x36d7), 0x08 },
>>> +     { CCI_REG8(0x36d8), 0x10 },
>>> +     { CCI_REG8(0x36d9), 0x10 },
>>> +     { CCI_REG8(0x3701), 0x1d },
>>> +     { CCI_REG8(0x3703), 0x2a },
>>> +     { CCI_REG8(0x3704), 0x05 },
>>> +     { CCI_REG8(0x3709), 0x57 },
>>> +     { CCI_REG8(0x370b), 0x63 },
>>> +     { CCI_REG8(0x3706), 0x28 },
>>> +     { CCI_REG8(0x370a), 0x00 },
>>> +     { CCI_REG8(0x370b), 0x63 },
>>> +     { CCI_REG8(0x370e), 0x0c },
>>> +     { CCI_REG8(0x370f), 0x1c },
>>> +     { CCI_REG8(0x3710), 0x00 },
>>> +     { CCI_REG8(0x3713), 0x00 },
>>> +     { CCI_REG8(0x3714), 0x24 },
>>> +     { CCI_REG8(0x3716), 0x24 },
>>> +     { CCI_REG8(0x371a), 0x1e },
>>> +     { CCI_REG8(0x3724), 0x09 },
>>> +     { CCI_REG8(0x3725), 0xb2 },
>>> +     { CCI_REG8(0x372b), 0x54 },
>>> +     { CCI_REG8(0x3730), 0xe1 },
>>> +     { CCI_REG8(0x3735), 0x80 },
>>> +     { CCI_REG8(0x3739), 0x10 },
>>> +     { CCI_REG8(0x373f), 0xb0 },
>>> +     { CCI_REG8(0x3740), 0x28 },
>>> +     { CCI_REG8(0x3741), 0x21 },
>>> +     { CCI_REG8(0x3742), 0x21 },
>>> +     { CCI_REG8(0x3743), 0x21 },
>>> +     { CCI_REG8(0x3744), 0x63 },
>>> +     { CCI_REG8(0x3745), 0x5a },
>>> +     { CCI_REG8(0x3746), 0x5a },
>>> +     { CCI_REG8(0x3747), 0x5a },
>>> +     { CCI_REG8(0x3748), 0x00 },
>>> +     { CCI_REG8(0x3749), 0x00 },
>>> +     { CCI_REG8(0x374a), 0x00 },
>>> +     { CCI_REG8(0x374b), 0x00 },
>>> +     { CCI_REG8(0x3756), 0x00 },
>>> +     { CCI_REG8(0x3757), 0x0e },
>>> +     { CCI_REG8(0x375d), 0x84 },
>>> +     { CCI_REG8(0x3760), 0x11 },
>>> +     { CCI_REG8(0x3767), 0x08 },
>>> +     { CCI_REG8(0x376f), 0x42 },
>>> +     { CCI_REG8(0x3771), 0x00 },
>>> +     { CCI_REG8(0x3773), 0x01 },
>>> +     { CCI_REG8(0x3774), 0x02 },
>>> +     { CCI_REG8(0x3775), 0x12 },
>>> +     { CCI_REG8(0x3776), 0x02 },
>>> +     { CCI_REG8(0x377b), 0x40 },
>>> +     { CCI_REG8(0x377c), 0x00 },
>>> +     { CCI_REG8(0x377d), 0x0c },
>>> +     { CCI_REG8(0x3782), 0x02 },
>>> +     { CCI_REG8(0x3787), 0x24 },
>>> +     { CCI_REG8(0x378a), 0x01 },
>>> +     { CCI_REG8(0x378d), 0x00 },
>>> +     { CCI_REG8(0x3790), 0x1f },
>>> +     { CCI_REG8(0x3791), 0x58 },
>>> +     { CCI_REG8(0x3795), 0x24 },
>>> +     { CCI_REG8(0x3796), 0x01 },
>>> +     { CCI_REG8(0x3798), 0x40 },
>>> +     { CCI_REG8(0x379c), 0x00 },
>>> +     { CCI_REG8(0x379d), 0x00 },
>>> +     { CCI_REG8(0x379e), 0x00 },
>>> +     { CCI_REG8(0x379f), 0x01 },
>>> +     { CCI_REG8(0x37a1), 0x10 },
>>> +     { CCI_REG8(0x37a6), 0x00 },
>>> +     { CCI_REG8(0x37ab), 0x0e },
>>> +     { CCI_REG8(0x37ac), 0xa0 },
>>> +     { CCI_REG8(0x37be), 0x0a },
>>> +     { CCI_REG8(0x37bf), 0x05 },
>>> +     { CCI_REG8(0x37bb), 0x02 },
>>> +     { CCI_REG8(0x37bf), 0x05 },
>>> +     { CCI_REG8(0x37c2), 0x04 },
>>> +     { CCI_REG8(0x37c4), 0x11 },
>>> +     { CCI_REG8(0x37c5), 0x80 },
>>> +     { CCI_REG8(0x37c6), 0x14 },
>>> +     { CCI_REG8(0x37c7), 0x08 },
>>> +     { CCI_REG8(0x37c8), 0x42 },
>>> +     { CCI_REG8(0x37cd), 0x17 },
>>> +     { CCI_REG8(0x37ce), 0x01 },
>>> +     { CCI_REG8(0x37d8), 0x02 },
>>> +     { CCI_REG8(0x37d9), 0x08 },
>>> +     { CCI_REG8(0x37dc), 0x01 },
>>> +     { CCI_REG8(0x37e0), 0x0c },
>>> +     { CCI_REG8(0x37e1), 0x20 },
>>> +     { CCI_REG8(0x37e2), 0x10 },
>>> +     { CCI_REG8(0x37e3), 0x04 },
>>> +     { CCI_REG8(0x37e4), 0x28 },
>>> +     { CCI_REG8(0x37e5), 0x02 },
>>> +     { CCI_REG8(0x37ef), 0x00 },
>>> +     { CCI_REG8(0x37f4), 0x00 },
>>> +     { CCI_REG8(0x37f5), 0x00 },
>>> +     { CCI_REG8(0x37f6), 0x00 },
>>> +     { CCI_REG8(0x37f7), 0x00 },
>>> +     { CCI_REG8(0x3800), 0x01 },
>>> +     { CCI_REG8(0x3801), 0x30 },
>>> +     { CCI_REG8(0x3802), 0x00 },
>>> +     { CCI_REG8(0x3803), 0x00 },
>>> +     { CCI_REG8(0x3804), 0x0b },
>>> +     { CCI_REG8(0x3805), 0x5f },
>>> +     { CCI_REG8(0x3806), 0x07 },
>>> +     { CCI_REG8(0x3807), 0xa7 },
>>> +     { CCI_REG8(0x3808), 0x0a },
>>> +     { CCI_REG8(0x3809), 0x20 },
>>> +     { CCI_REG8(0x380a), 0x07 },
>>> +     { CCI_REG8(0x380b), 0x98 },
>>> +     { CCI_REG8(0x380c), 0x06 },
>>> +     { CCI_REG8(0x380d), 0xd0 },
>>> +     { CCI_REG8(0x380e), 0x07 },
>>> +     { CCI_REG8(0x380f), 0xd6 },
>>> +     { CCI_REG8(0x3810), 0x00 },
>>> +     { CCI_REG8(0x3811), 0x08 },
>>> +     { CCI_REG8(0x3812), 0x00 },
>>> +     { CCI_REG8(0x3813), 0x08 },
>>> +     { CCI_REG8(0x3814), 0x01 },
>>> +     { CCI_REG8(0x3815), 0x01 },
>>> +     { CCI_REG8(0x3816), 0x01 },
>>> +     { CCI_REG8(0x3817), 0x01 },
>>> +     { CCI_REG8(0x3818), 0x00 },
>>> +     { CCI_REG8(0x3819), 0x00 },
>>> +     { CCI_REG8(0x381a), 0x00 },
>>> +     { CCI_REG8(0x381b), 0x01 },
>>> +     { CCI_REG8(0x3820), 0x88 },
>>> +     { CCI_REG8(0x3821), 0x00 },
>>> +     { CCI_REG8(0x3822), 0x12 },
>>> +     { CCI_REG8(0x3823), 0x08 },
>>> +     { CCI_REG8(0x3824), 0x00 },
>>> +     { CCI_REG8(0x3825), 0x20 },
>>> +     { CCI_REG8(0x3826), 0x00 },
>>> +     { CCI_REG8(0x3827), 0x08 },
>>> +     { CCI_REG8(0x3829), 0x03 },
>>> +     { CCI_REG8(0x382a), 0x00 },
>>> +     { CCI_REG8(0x382b), 0x00 },
>>> +     { CCI_REG8(0x3832), 0x08 },
>>> +     { CCI_REG8(0x3838), 0x00 },
>>> +     { CCI_REG8(0x3839), 0x00 },
>>> +     { CCI_REG8(0x383a), 0x00 },
>>> +     { CCI_REG8(0x383b), 0x00 },
>>> +     { CCI_REG8(0x383d), 0x01 },
>>> +     { CCI_REG8(0x383e), 0x00 },
>>> +     { CCI_REG8(0x383f), 0x00 },
>>> +     { CCI_REG8(0x3843), 0x00 },
>>> +     { CCI_REG8(0x3880), 0x16 },
>>> +     { CCI_REG8(0x3881), 0x00 },
>>> +     { CCI_REG8(0x3882), 0x08 },
>>> +     { CCI_REG8(0x389a), 0x00 },
>>> +     { CCI_REG8(0x389b), 0x00 },
>>> +     { CCI_REG8(0x38a2), 0x02 },
>>> +     { CCI_REG8(0x38a3), 0x02 },
>>> +     { CCI_REG8(0x38a4), 0x02 },
>>> +     { CCI_REG8(0x38a5), 0x02 },
>>> +     { CCI_REG8(0x38a7), 0x04 },
>>> +     { CCI_REG8(0x38b8), 0x02 },
>>> +     { CCI_REG8(0x3c80), 0x3e },
>>> +     { CCI_REG8(0x3c86), 0x01 },
>>> +     { CCI_REG8(0x3c87), 0x02 },
>>> +     { CCI_REG8(0x389c), 0x00 },
>>> +     { CCI_REG8(0x3ca2), 0x0c },
>>> +     { CCI_REG8(0x3d85), 0x1b },
>>> +     { CCI_REG8(0x3d8c), 0x01 },
>>> +     { CCI_REG8(0x3d8d), 0xe2 },
>>> +     { CCI_REG8(0x3f00), 0xcb },
>>> +     { CCI_REG8(0x3f03), 0x08 },
>>> +     { CCI_REG8(0x3f9e), 0x07 },
>>> +     { CCI_REG8(0x3f9f), 0x04 },
>>> +     { CCI_REG8(0x4000), 0xf3 },
>>> +     { CCI_REG8(0x4002), 0x00 },
>>> +     { CCI_REG8(0x4003), 0x40 },
>>> +     { CCI_REG8(0x4008), 0x02 },
>>> +     { CCI_REG8(0x4009), 0x0d },
>>> +     { CCI_REG8(0x400a), 0x01 },
>>> +     { CCI_REG8(0x400b), 0x00 },
>>> +     { CCI_REG8(0x4040), 0x00 },
>>> +     { CCI_REG8(0x4041), 0x07 },
>>> +     { CCI_REG8(0x4090), 0x14 },
>>> +     { CCI_REG8(0x40b0), 0x01 },
>>> +     { CCI_REG8(0x40b1), 0x01 },
>>> +     { CCI_REG8(0x40b2), 0x30 },
>>> +     { CCI_REG8(0x40b3), 0x04 },
>>> +     { CCI_REG8(0x40b4), 0xe8 },
>>> +     { CCI_REG8(0x40b5), 0x01 },
>>> +     { CCI_REG8(0x40b7), 0x07 },
>>> +     { CCI_REG8(0x40b8), 0xff },
>>> +     { CCI_REG8(0x40b9), 0x00 },
>>> +     { CCI_REG8(0x40ba), 0x00 },
>>> +     { CCI_REG8(0x4300), 0xff },
>>> +     { CCI_REG8(0x4301), 0x00 },
>>> +     { CCI_REG8(0x4302), 0x0f },
>>> +     { CCI_REG8(0x4303), 0x20 },
>>> +     { CCI_REG8(0x4304), 0x20 },
>>> +     { CCI_REG8(0x4305), 0x83 },
>>> +     { CCI_REG8(0x4306), 0x21 },
>>> +     { CCI_REG8(0x430d), 0x00 },
>>> +     { CCI_REG8(0x4505), 0xc4 },
>>> +     { CCI_REG8(0x4506), 0x00 },
>>> +     { CCI_REG8(0x4507), 0x60 },
>>> +     { CCI_REG8(0x4803), 0x00 },
>>> +     { CCI_REG8(0x4809), 0x8e },
>>> +     { CCI_REG8(0x480e), 0x00 },
>>> +     { CCI_REG8(0x4813), 0x00 },
>>> +     { CCI_REG8(0x4814), 0x2a },
>>> +     { CCI_REG8(0x481b), 0x40 },
>>> +     { CCI_REG8(0x481f), 0x30 },
>>> +     { CCI_REG8(0x4825), 0x34 },
>>> +     { CCI_REG8(0x4829), 0x64 },
>>> +     { CCI_REG8(0x4837), 0x12 },
>>> +     { CCI_REG8(0x484b), 0x07 },
>>> +     { CCI_REG8(0x4883), 0x36 },
>>> +     { CCI_REG8(0x4885), 0x03 },
>>> +     { CCI_REG8(0x488b), 0x00 },
>>> +     { CCI_REG8(0x4d06), 0x01 },
>>> +     { CCI_REG8(0x4e00), 0x2a },
>>> +     { CCI_REG8(0x4e0d), 0x00 },
>>> +     { CCI_REG8(0x5000), 0xf9 },
>>> +     { CCI_REG8(0x5001), 0x09 },
>>> +     { CCI_REG8(0x5004), 0x00 },
>>> +     { CCI_REG8(0x5005), 0x0e },
>>> +     { CCI_REG8(0x5036), 0x00 },
>>> +     { CCI_REG8(0x5080), 0x04 },
>>> +     { CCI_REG8(0x5082), 0x00 },
>>> +     { CCI_REG8(0x5180), 0x00 },
>>> +     { CCI_REG8(0x5181), 0x10 },
>>> +     { CCI_REG8(0x5182), 0x01 },
>>> +     { CCI_REG8(0x5183), 0xdf },
>>> +     { CCI_REG8(0x5184), 0x02 },
>>> +     { CCI_REG8(0x5185), 0x6c },
>>> +     { CCI_REG8(0x5189), 0x48 },
>>> +     { CCI_REG8(0x520a), 0x03 },
>>> +     { CCI_REG8(0x520b), 0x0f },
>>> +     { CCI_REG8(0x520c), 0x3f },
>>> +     { CCI_REG8(0x580b), 0x03 },
>>> +     { CCI_REG8(0x580d), 0x00 },
>>> +     { CCI_REG8(0x580f), 0x00 },
>>> +     { CCI_REG8(0x5820), 0x00 },
>>> +     { CCI_REG8(0x5821), 0x00 },
>>> +     { CCI_REG8(0x3222), 0x03 },
>>> +     { CCI_REG8(0x3208), 0x06 },
>>> +     { CCI_REG8(0x3701), 0x1d },
>>> +     { CCI_REG8(0x37ab), 0x01 },
>>> +     { CCI_REG8(0x3790), 0x21 },
>>> +     { CCI_REG8(0x38be), 0x00 },
>>> +     { CCI_REG8(0x3791), 0x5a },
>>> +     { CCI_REG8(0x37bf), 0x1c },
>>> +     { CCI_REG8(0x3610), 0x37 },
>>> +     { CCI_REG8(0x3208), 0x16 },
>>> +     { CCI_REG8(0x3208), 0x07 },
>>> +     { CCI_REG8(0x3701), 0x1d },
>>> +     { CCI_REG8(0x37ab), 0x0e },
>>> +     { CCI_REG8(0x3790), 0x21 },
>>> +     { CCI_REG8(0x38be), 0x00 },
>>> +     { CCI_REG8(0x3791), 0x5a },
>>> +     { CCI_REG8(0x37bf), 0x0a },
>>> +     { CCI_REG8(0x3610), 0x87 },
>>> +     { CCI_REG8(0x3208), 0x17 },
>>> +     { CCI_REG8(0x3208), 0x08 },
>>> +     { CCI_REG8(0x3701), 0x1d },
>>> +     { CCI_REG8(0x37ab), 0x0e },
>>> +     { CCI_REG8(0x3790), 0x21 },
>>> +     { CCI_REG8(0x38be), 0x00 },
>>> +     { CCI_REG8(0x3791), 0x5a },
>>> +     { CCI_REG8(0x37bf), 0x0a },
>>> +     { CCI_REG8(0x3610), 0x87 },
>>> +     { CCI_REG8(0x3208), 0x18 },
>>> +     { CCI_REG8(0x3208), 0x09 },
>>> +     { CCI_REG8(0x3701), 0x1d },
>>> +     { CCI_REG8(0x37ab), 0x0e },
>>> +     { CCI_REG8(0x3790), 0x28 },
>>> +     { CCI_REG8(0x38be), 0x00 },
>>> +     { CCI_REG8(0x3791), 0x63 },
>>> +     { CCI_REG8(0x37bf), 0x0a },
>>> +     { CCI_REG8(0x3610), 0x87 },
>>> +     { CCI_REG8(0x3208), 0x19 },
>>> +};
>>> +
>>> +struct os05b10 {
>>> +     struct device *dev;
>>> +     struct regmap *cci;
>>> +     struct v4l2_subdev sd;
>>> +     struct media_pad pad;
>>> +     struct clk *xclk;
>>> +     struct i2c_client *client;
>>> +     struct gpio_desc *reset_gpio;
>>> +     struct regulator_bulk_data supplies[ARRAY_SIZE(os05b10_supply_name)];
>>> +
>>> +     /* V4L2 Controls */
>>> +     struct v4l2_ctrl_handler handler;
>>> +     struct v4l2_ctrl *link_freq;
>>> +     struct v4l2_ctrl *pixel_rate;
>>
>> The 'pixel_rate' pointer to a control can be removed, the control is fixed.
>>
>>> +     struct v4l2_ctrl *hblank;
>>> +     struct v4l2_ctrl *vblank;
>>> +     struct v4l2_ctrl *gain;
>>> +     struct v4l2_ctrl *exposure;
>>> +
>>> +     unsigned long link_freq_index;
>>
>> link_freq_index is always 0, thus it can be removed.
> link_freq_index cannot be removed when using v4l2_link_freq_to_bitmap(),
> as the helper always writes to the provided pointer and therefore
> requires a valid storage address.

Of course the index can be removed, v4l2_link_freq_to_bitmap() does not
need it. Please reference to the existing drivers/media/i2c/ examples.

> Keeping it also allows the code to be easily extended in the future if
support for multiple link frequencies is added.

This is called a premature optimisation, and it says it's the root of
all evil.

Please remove all currently unused code.

>>> +};
>>> +
>>> +struct os05b10_mode {
>>> +     u32 width;
>>> +     u32 height;
>>> +     u32 vts; /* default VTS */
>>> +     u32 hts; /* default HTS */
>>> +     u32 exp; /* default exposure */
>>> +};
>>> +
>>> +static const struct os05b10_mode supported_modes_10bit[] = {
>>> +     {
>>> +             /* 2592x1944 */
>>> +             .width = 2592,
>>> +             .height = 1944,
>>> +             .vts = 2006,
>>> +             .hts = 2616,
>>> +             .exp = 1944,
>>> +     },
>>> +};
>>> +
>>> +static const s64 link_frequencies[] = {
>>> +     OS05B10_LINK_FREQ_600MHZ,
>>> +};
>>> +
>>> +static const u32 os05b10_mbus_codes[] = {
>>> +     MEDIA_BUS_FMT_SBGGR10_1X10,
>>> +};
>>> +
>>> +static inline struct os05b10 *to_os05b10(struct v4l2_subdev *sd)
>>> +{
>>> +     return container_of_const(sd, struct os05b10, sd);
>>> +};
>>> +
>>> +static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
>>> +{
>>> +     struct os05b10 *os05b10 = container_of_const(ctrl->handler,
>>> +                                                  struct os05b10, handler);
>>> +     struct v4l2_mbus_framefmt *fmt;
>>> +     struct v4l2_subdev_state *state;
>>> +     int vmax, ret;
>>> +
>>> +     state = v4l2_subdev_get_locked_active_state(&os05b10->sd);
>>> +     fmt = v4l2_subdev_state_get_format(state, 0);
>>> +
>>> +     if (ctrl->id == V4L2_CID_VBLANK) {
>>> +             /* Honour the VBLANK limits when setting exposure. */
>>> +             s64 max = fmt->height + ctrl->val - OS05B10_EXPOSURE_MARGIN;
>>> +
>>> +             ret = __v4l2_ctrl_modify_range(os05b10->exposure,
>>> +                                            os05b10->exposure->minimum, max,
>>> +                                            os05b10->exposure->step,
>>> +                                            os05b10->exposure->default_value);
>>> +
>>> +             if (ret)
>>> +                     return ret;
>>> +     }
>>> +
>>> +     if (pm_runtime_get_if_in_use(os05b10->dev) == 0)
>>> +             return 0;
>>> +
>>> +     switch (ctrl->id) {
>>> +     case V4L2_CID_VBLANK:
>>> +             vmax = fmt->height + ctrl->val;
>>> +             ret = cci_write(os05b10->cci, OS05B10_REG_VTS, vmax, NULL);
>>> +             break;
>>> +     case V4L2_CID_ANALOGUE_GAIN:
>>> +             ret = cci_write(os05b10->cci, OS05B10_ANALOG_GAIN, ctrl->val,
>>> +                             NULL);
>>> +             break;
>>> +     case V4L2_CID_EXPOSURE:
>>> +             ret = cci_write(os05b10->cci, OS05B10_EXPOSURE_GAIN, ctrl->val,
>>> +                             NULL);
>>> +             break;
>>> +     default:
>>> +             dev_err(os05b10->dev, "ctrl(id:0x%x, val:0x%x) is not handled\n",
>>> +                     ctrl->id, ctrl->val);
>>
>> Here you shall assign 'ret = -EINVAL', otherwise you return an unset value.
>>
>> Here you shall remove dev_err(), otherwise you just open a way to a user
>> to flood the kernel log buffer.
>>
>>> +             break;
>>> +     }
>>> +
>>> +     pm_runtime_put(os05b10->dev);
>>> +
>>> +     return ret;
>>> +}
>>> +
>>> +static int os05b10_get_regulators(struct os05b10 *os05b10)
>>> +{
>>> +     unsigned int i;
>>> +
>>> +     for (i = 0; i < ARRAY_SIZE(os05b10_supply_name); i++)
>>> +             os05b10->supplies[i].supply = os05b10_supply_name[i];
>>> +
>>> +     return devm_regulator_bulk_get(os05b10->dev,
>>> +                                    ARRAY_SIZE(os05b10_supply_name),
>>> +                                    os05b10->supplies);
>>> +}
>>
>> I'd rather suggest not to make a separate trivial one time called funtion
>> here, just embed it into the .probe().
>>
>>> +
>>> +static int os05b10_enum_mbus_code(struct v4l2_subdev *sd,
>>> +                               struct v4l2_subdev_state *sd_state,
>>> +                               struct v4l2_subdev_mbus_code_enum *code)
>>> +{
>>> +     if (code->index >= ARRAY_SIZE(os05b10_mbus_codes))
>>> +             return -EINVAL;
>>> +
>>> +     code->code = os05b10_mbus_codes[code->index];
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int os05b10_set_framing_limits(struct os05b10 *os05b10,
>>> +                                   const struct os05b10_mode *mode)
>>> +{
>>> +     u32 hblank, vblank, vblank_max, max_exp;
>>> +     int ret;
>>> +
>>> +     hblank = mode->hts - mode->width;
>>> +     ret = __v4l2_ctrl_modify_range(os05b10->hblank, hblank, hblank, 1, hblank);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     vblank = mode->vts - mode->height;
>>> +     vblank_max = OS05B10_VTS_MAX - mode->height;
>>> +     ret = __v4l2_ctrl_modify_range(os05b10->vblank, 0, vblank_max, 1, vblank);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     max_exp = mode->vts - OS05B10_EXPOSURE_MARGIN;
>>> +     return __v4l2_ctrl_modify_range(os05b10->exposure,
>>> +                                     OS05B10_EXPOSURE_MIN, max_exp,
>>> +                                     OS05B10_EXPOSURE_STEP, mode->exp);
>>> +}
>>> +
>>> +static int os05b10_set_pad_format(struct v4l2_subdev *sd,
>>> +                               struct v4l2_subdev_state *sd_state,
>>> +                               struct v4l2_subdev_format *fmt)
>>> +{
>>> +     struct v4l2_mbus_framefmt *format;
>>> +     const struct os05b10_mode *mode = &supported_modes_10bit[0];
>>> +     struct os05b10 *os05b10 = to_os05b10(sd);
>>
>> If possible, please sort the list of local variable declarations in
>> "reverse Chrismas tree" order, this way it looks tidier and slightly more
>> readable.
>>
>> "Reverse xmas tree" order is when the variable declaration lines are started
>>from the longest one to the shortest one.
>>
>>> +     int ret;
>>> +
>>> +     fmt->format.width = mode->width;
>>> +     fmt->format.height = mode->height;
>>> +     fmt->format.field = V4L2_FIELD_NONE;
>>> +     fmt->format.colorspace = V4L2_COLORSPACE_RAW;
>>> +     fmt->format.quantization = V4L2_QUANTIZATION_FULL_RANGE;
>>> +     fmt->format.xfer_func = V4L2_XFER_FUNC_NONE;
>>> +
>>> +     format = v4l2_subdev_state_get_format(sd_state, 0);
>>> +
>>> +     if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
>>> +             ret = os05b10_set_framing_limits(os05b10, mode);
>>> +             if (ret)
>>> +                     return ret;
>>> +     }
>>> +
>>> +     *format = fmt->format;
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int os05b10_get_selection(struct v4l2_subdev *sd,
>>> +                              struct v4l2_subdev_state *sd_state,
>>> +                              struct v4l2_subdev_selection *sel)
>>> +{
>>> +     switch (sel->target) {
>>> +     case V4L2_SEL_TGT_NATIVE_SIZE:
>>> +     case V4L2_SEL_TGT_CROP_BOUNDS:
>>> +             sel->r = os05b10_native_area;
>>> +             return 0;
>>> +     case V4L2_SEL_TGT_CROP:
>>> +     case V4L2_SEL_TGT_CROP_DEFAULT:
>>> +             sel->r = os05b10_active_area;
>>> +             return 0;
>>> +     default:
>>> +             return -EINVAL;
>>> +     }
>>> +}
>>> +
>>> +static int os05b10_enum_frame_size(struct v4l2_subdev *sd,
>>> +                                struct v4l2_subdev_state *sd_state,
>>> +                                struct v4l2_subdev_frame_size_enum *fse)
>>> +{
>>> +     if (fse->index >= ARRAY_SIZE(supported_modes_10bit))
>>> +             return -EINVAL;
>>> +
>>> +     if (fse->index >= 1)
>>> +             return -EINVAL;
>>
>> These two checks above are equal, so one of them shall be removed.
>>
>>> +
>>> +     fse->min_width = supported_modes_10bit[fse->index].width;
>>> +     fse->max_width = fse->min_width;
>>> +     fse->min_height = supported_modes_10bit[fse->index].height;
>>> +     fse->max_height = fse->min_height;
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int os05b10_enable_streams(struct v4l2_subdev *sd,
>>> +                               struct v4l2_subdev_state *state,
>>> +                               u32 pad, u64 streams_mask)
>>> +{
>>> +     struct os05b10 *os05b10 = to_os05b10(sd);
>>> +     int ret;
>>> +
>>> +     ret = pm_runtime_resume_and_get(os05b10->dev);
>>> +     if (ret < 0)
>>> +             return ret;
>>> +
>>> +     /* Write common registers */
>>> +     ret = cci_multi_reg_write(os05b10->cci, os05b10_common_regs,
>>> +                               ARRAY_SIZE(os05b10_common_regs), NULL);
>>> +     if (ret) {
>>> +             dev_err(os05b10->dev, "%s failed to write common registers\n",
>>> +                     __func__);
>>> +             goto err_rpm_put;
>>> +     }
>>> +
>>> +     /* Apply customized user controls */
>>> +     ret = __v4l2_ctrl_handler_setup(os05b10->sd.ctrl_handler);
>>> +     if (ret)
>>> +             goto err_rpm_put;
>>> +
>>> +     /* Stream ON */
>>> +     ret = cci_write(os05b10->cci, OS05B10_REG_CTRL_MODE,
>>> +                     OS05B10_MODE_STREAMING, NULL);
>>> +     if (ret)
>>> +             goto err_rpm_put;
>>> +
>>> +     return 0;
>>> +
>>> +err_rpm_put:
>>> +     pm_runtime_put(os05b10->dev);
>>> +     return ret;
>>> +}
>>> +
>>> +static int os05b10_disable_streams(struct v4l2_subdev *sd,
>>> +                                struct v4l2_subdev_state *state,
>>> +                                u32 pad, u64 streams_mask)
>>> +{
>>> +     struct os05b10 *os05b10 = to_os05b10(sd);
>>> +     int ret;
>>> +
>>> +     ret = cci_write(os05b10->cci, OS05B10_REG_CTRL_MODE,
>>> +                     OS05B10_MODE_STANDBY, NULL);
>>> +     if (ret)
>>> +             dev_err(os05b10->dev, "%s failed to set stream off\n", __func__);
>>> +
>>> +     pm_runtime_put(os05b10->dev);
>>> +
>>> +     return ret;
>>> +}
>>> +
>>> +static int os05b10_init_state(struct v4l2_subdev *sd,
>>> +                           struct v4l2_subdev_state *state)
>>> +{
>>> +     struct v4l2_mbus_framefmt *format;
>>> +     const struct os05b10_mode *mode;
>>> +
>>> +     /* Initialize try_fmt */
>>> +     format = v4l2_subdev_state_get_format(state, 0);
>>> +
>>> +     mode = &supported_modes_10bit[0];
>>> +     format->code = MEDIA_BUS_FMT_SBGGR10_1X10;
>>> +
>>> +     /* Update image pad formate */
>>> +     format->width = mode->width;
>>> +     format->height = mode->height;
>>> +     format->field = V4L2_FIELD_NONE;
>>> +     format->colorspace = V4L2_COLORSPACE_RAW;
>>> +     format->quantization = V4L2_QUANTIZATION_FULL_RANGE;
>>> +     format->xfer_func = V4L2_XFER_FUNC_NONE;
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static const struct v4l2_subdev_video_ops os05b10_video_ops = {
>>> +     .s_stream = v4l2_subdev_s_stream_helper,
>>> +};
>>> +
>>> +static const struct v4l2_subdev_pad_ops os05b10_pad_ops = {
>>> +     .enum_mbus_code = os05b10_enum_mbus_code,
>>> +     .get_fmt = v4l2_subdev_get_fmt,
>>> +     .set_fmt = os05b10_set_pad_format,
>>> +     .get_selection = os05b10_get_selection,
>>> +     .enum_frame_size = os05b10_enum_frame_size,
>>> +     .enable_streams = os05b10_enable_streams,
>>> +     .disable_streams = os05b10_disable_streams,
>>> +};
>>> +
>>> +static const struct v4l2_subdev_internal_ops os05b10_internal_ops = {
>>> +     .init_state = os05b10_init_state,
>>> +};
>>> +
>>> +static const struct v4l2_subdev_ops os05b10_subdev_ops = {
>>> +     .video = &os05b10_video_ops,
>>> +     .pad = &os05b10_pad_ops,
>>> +};
>>> +
>>> +static const struct v4l2_ctrl_ops os05b10_ctrl_ops = {
>>> +     .s_ctrl = os05b10_set_ctrl,
>>> +};
>>> +
>>> +static int os05b10_identify_module(struct os05b10 *os05b10)
>>> +{
>>> +     int ret;
>>> +     u64 val;
>>> +
>>> +     ret = cci_read(os05b10->cci, OS05B10_REG_CHIP_ID, &val, NULL);
>>> +     if (ret)
>>> +             return dev_err_probe(os05b10->dev, ret,
>>> +                                  "failed to read chip id %x\n",
>>> +                                  OS05B10_CHIP_ID);
>>> +
>>> +     if (val != OS05B10_CHIP_ID)
>>> +             return dev_err_probe(os05b10->dev, -EIO,
>>> +                                  "chip id mismatch: %x!=%llx\n",
>>> +                                  OS05B10_CHIP_ID, val);
>>> +     return 0;
>>> +}
>>> +
>>> +static int os05b10_power_on(struct device *dev)
>>> +{
>>> +     struct v4l2_subdev *sd = dev_get_drvdata(dev);
>>> +     struct os05b10 *os05b10 = to_os05b10(sd);
>>> +     unsigned long delay_us;
>>> +     int ret;
>>> +
>>> +     /* Enable power rails */
>>> +     ret = regulator_bulk_enable(ARRAY_SIZE(os05b10_supply_name),
>>> +                                 os05b10->supplies);
>>
>> If you have an access to the sensor datasheet document, please double
>> check the power on/off sequencies, it might happen that the unordered
>> bulk operation should be replaced by a more specific sequence given
>> by the Omnivision.
> According to the datasheet, the power supplies dvdd, dovdd, and avdd
> can be applied in any order; however, XSHUTDOWN must be asserted only after
> all three supplies are enabled.

Good, then regulator bulk enable/disable operations are safe to have here.

>>> +     if (ret) {
>>> +             dev_err(os05b10->dev, "failed to enable regulators\n");
>>> +             return ret;
>>> +     }
>>> +
>>> +     /* Enable xclk */
>>> +     ret = clk_prepare_enable(os05b10->xclk);
>>> +     if (ret) {
>>> +             dev_err(os05b10->dev, "failed to enable clock\n");
>>> +             goto err_regulator_off;
>>> +     }
>>> +
>>> +     gpiod_set_value_cansleep(os05b10->reset_gpio, 0);
>>> +
>>> +     /* Delay T1 */
>>> +     fsleep(5 * USEC_PER_MSEC);
>>> +
>>> +     /* Delay T2 (8192 cycles before SCCB/I2C access) */
>>> +     delay_us = DIV_ROUND_UP(8192, OS05B10_XCLK_FREQ / 1000 / 1000);
>>> +     usleep_range(delay_us, delay_us * 2);
>>> +
>>> +     return 0;
>>> +
>>> +err_regulator_off:
>>> +     regulator_bulk_disable(ARRAY_SIZE(os05b10_supply_name),
>>> +                            os05b10->supplies);
>>> +     return ret;
>>> +}
>>> +
>>> +static int os05b10_power_off(struct device *dev)
>>> +{
>>> +     struct v4l2_subdev *sd = dev_get_drvdata(dev);
>>> +     struct os05b10 *os05b10 = to_os05b10(sd);
>>> +
>>> +     gpiod_set_value_cansleep(os05b10->reset_gpio, 1);
>>> +
>>> +     regulator_bulk_disable(ARRAY_SIZE(os05b10_supply_name), os05b10->supplies);
>>> +     clk_disable_unprepare(os05b10->xclk);
>>
>> Please insert a blank line here to separate the return for improving
>> readability.
>>
>>> +     return 0;
>>> +}
>>> +
>>> +static int os05b10_parse_endpoint(struct os05b10 *os05b10)
>>> +{
>>> +     struct v4l2_fwnode_endpoint bus_cfg = {
>>> +             .bus_type = V4L2_MBUS_CSI2_DPHY
>>> +     };
>>> +     struct fwnode_handle *ep;
>>> +     int ret;
>>> +
>>> +     ep = fwnode_graph_get_next_endpoint(dev_fwnode(os05b10->dev), NULL);
>>> +     if (!ep) {
>>> +             dev_err(os05b10->dev, "Failed to get next endpoint\n");
>>> +             return -ENXIO;
>>> +     }
>>> +
>>> +     ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
>>> +     fwnode_handle_put(ep);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>
>> Here you should add a check for bus_cfg.bus.mipi_csi2.num_data_lanes, which
>> is supported by the driver, is it 2 or 4?
>>
>>> +     ret = v4l2_link_freq_to_bitmap(os05b10->dev, bus_cfg.link_frequencies,
>>> +                                    bus_cfg.nr_of_link_frequencies,
>>> +                                    link_frequencies,
>>> +                                    ARRAY_SIZE(link_frequencies),
>>> +                                    &os05b10->link_freq_index);

Since you've mentioned it, here &os05b10->link_freq_index usage is just
invalid, the returned value is a bitmap, not an index.

Please get any existing code as a proper reference.

>>> +
>>> +     if (ret)
>>> +             dev_err(os05b10->dev, "only 600MHz frequency is available\n");
>>> +
>>> +     v4l2_fwnode_endpoint_free(&bus_cfg);
>>
>> Please insert a blank line here to separate the return for improving
>> readability.
>>
>>> +     return ret;
>>> +}
>>> +
>>> +static int os05b10_init_controls(struct os05b10 *os05b10)
>>> +{
>>> +     struct v4l2_ctrl_handler *ctrl_hdlr;
>>> +     struct v4l2_fwnode_device_properties props;
>>> +     const struct os05b10_mode *mode = &supported_modes_10bit[0];
>>> +     u64 hblank_def, vblank_def, exp_max;
>>> +     int ret;
>>> +
>>> +     ctrl_hdlr = &os05b10->handler;
>>> +     v4l2_ctrl_handler_init(ctrl_hdlr, 8);
>>> +
>>> +     os05b10->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
>>> +                                             V4L2_CID_PIXEL_RATE,
>>> +                                             OS05B10_PIXEL_RATE,
>>> +                                             OS05B10_PIXEL_RATE, 1,
>>> +                                             OS05B10_PIXEL_RATE);
>>> +
>>> +     os05b10->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &os05b10_ctrl_ops,
>>> +                                                 V4L2_CID_LINK_FREQ,
>>> +                                                 os05b10->link_freq_index,
>>> +                                                 0, link_frequencies);
>>> +     if (os05b10->link_freq)
>>> +             os05b10->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>>> +
>>> +     hblank_def = mode->hts - mode->width;
>>> +     os05b10->hblank = v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_HBLANK,
>>> +                                         hblank_def, hblank_def, 1, hblank_def);
>>> +     if (os05b10->hblank)
>>> +             os05b10->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>>> +
>>> +     vblank_def = mode->vts - mode->height;
>>> +     os05b10->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
>>> +                                         V4L2_CID_VBLANK, vblank_def,
>>> +                                         OS05B10_VTS_MAX - mode->height,
>>> +                                         1, vblank_def);
>>> +
>>> +     exp_max = mode->vts - OS05B10_EXPOSURE_MARGIN;
>>> +     os05b10->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
>>> +                                           V4L2_CID_EXPOSURE,
>>> +                                           OS05B10_EXPOSURE_MIN,
>>> +                                           exp_max, OS05B10_EXPOSURE_STEP,
>>> +                                           mode->exp);
>>> +
>>> +     os05b10->gain = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
>>> +                                       V4L2_CID_ANALOGUE_GAIN,
>>> +                                       OS05B10_ANALOG_GAIN_MIN,
>>> +                                       OS05B10_ANALOG_GAIN_MAX,
>>> +                                       OS05B10_ANALOG_GAIN_STEP,
>>> +                                       OS05B10_ANALOG_GAIN_DEFAULT);
>>> +
>>> +     if (ctrl_hdlr->error) {
>>> +             ret = ctrl_hdlr->error;
>>> +             dev_err(os05b10->dev, "control init failed (%d)\n", ret);
>>> +             goto error;
>>> +     }
>>> +
>>> +     ret = v4l2_fwnode_device_parse(os05b10->dev, &props);
>>> +     if (ret)
>>> +             goto error;
>>> +
>>> +     ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &os05b10_ctrl_ops,
>>> +                                           &props);
>>> +     if (ret)
>>> +             goto error;
>>> +
>>> +     os05b10->sd.ctrl_handler = ctrl_hdlr;
>>> +
>>> +     return 0;
>>
>> Please insert a blank line between return and the next goto label.
>>
>>> +error:
>>> +     v4l2_ctrl_handler_free(ctrl_hdlr);
>>> +
>>> +     return ret;
>>> +}
>>> +
>>> +static int os05b10_probe(struct i2c_client *client)
>>> +{
>>> +     struct os05b10 *os05b10;
>>> +     unsigned int xclk_freq;
>>> +     int ret;
>>> +
>>> +     os05b10 = devm_kzalloc(&client->dev, sizeof(*os05b10), GFP_KERNEL);
>>> +     if (!os05b10)
>>> +             return -ENOMEM;
>>> +
>>> +     os05b10->client = client;
>>> +     os05b10->dev = &client->dev;
>>> +
>>> +     v4l2_i2c_subdev_init(&os05b10->sd, client, &os05b10_subdev_ops);
>>> +
>>> +     os05b10->cci = devm_cci_regmap_init_i2c(client, 16);
>>> +     if (IS_ERR(os05b10->cci))
>>> +             return dev_err_probe(os05b10->dev, PTR_ERR(os05b10->cci),
>>> +                                  "failed to initialize CCI\n");
>>> +
>>> +     os05b10->xclk = devm_v4l2_sensor_clk_get(os05b10->dev, NULL);
>>> +     if (IS_ERR(os05b10->xclk))
>>> +             return dev_err_probe(os05b10->dev, PTR_ERR(os05b10->xclk),
>>> +                                  "failed to get xclk\n");
>>> +
>>> +     xclk_freq = clk_get_rate(os05b10->xclk);
>>> +     if (xclk_freq != OS05B10_XCLK_FREQ)
>>> +             return dev_err_probe(os05b10->dev, -EINVAL,
>>> +                                  "xclk frequency not supported: %d Hz\n",
>>> +                                  xclk_freq);
>>> +
>>> +     ret = os05b10_get_regulators(os05b10);
>>> +     if (ret)
>>> +             return dev_err_probe(os05b10->dev, ret, "failed to get regulators\n");
>>> +
>>> +     ret = os05b10_parse_endpoint(os05b10);
>>> +     if (ret) {
>>> +             return dev_err_probe(os05b10->dev, ret,
>>> +                                  "failed to parse endpoint configuration\n");
>>> +     }
>>
>> Curly brackets are not needed here, please remove.
>>
>>> +
>>> +     os05b10->reset_gpio = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_LOW);
>>> +     if (IS_ERR(os05b10->reset_gpio))
>>> +             return dev_err_probe(os05b10->dev, PTR_ERR(os05b10->reset_gpio),
>>> +                                  "failed to get reset GPIO\n");
>>> +
>>> +     ret = os05b10_power_on(os05b10->dev);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     ret = os05b10_identify_module(os05b10);
>>> +     if (ret)
>>> +             goto error_power_off;
>>> +
>>> +     /* This needs the pm runtime to be registered. */
>>> +     ret = os05b10_init_controls(os05b10);
>>> +     if (ret)
>>> +             goto error_power_off;
>>> +
>>> +     /* Initialize subdev */
>>> +     os05b10->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>>> +     os05b10->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
>>> +     os05b10->sd.internal_ops = &os05b10_internal_ops;
>>> +     os05b10->pad.flags = MEDIA_PAD_FL_SOURCE;
>>> +
>>> +     ret = media_entity_pads_init(&os05b10->sd.entity, 1, &os05b10->pad);
>>> +     if (ret) {
>>> +             dev_err_probe(os05b10->dev, ret, "failed to init entity pads\n");
>>> +             goto error_handler_free;
>>> +     }
>>> +
>>> +     os05b10->sd.state_lock = os05b10->handler.lock;
>>> +     ret = v4l2_subdev_init_finalize(&os05b10->sd);
>>> +     if (ret < 0) {
>>> +             dev_err_probe(os05b10->dev, ret, "subdev init error\n");
>>> +             goto error_media_entity;
>>> +     }
>>> +
>>> +     pm_runtime_set_active(os05b10->dev);
>>> +     pm_runtime_enable(os05b10->dev);
>>> +
>>> +     ret = v4l2_async_register_subdev_sensor(&os05b10->sd);
>>> +     if (ret < 0) {
>>> +             dev_err_probe(os05b10->dev, ret,
>>> +                           "failed to register os05b10 sub-device\n");
>>> +             goto error_subdev_cleanup;
>>> +     }
>>> +
>>> +     pm_runtime_idle(os05b10->dev);
>>> +
>>> +     return 0;
>>> +
>>> +error_subdev_cleanup:
>>> +     v4l2_subdev_cleanup(&os05b10->sd);
>>> +     pm_runtime_disable(os05b10->dev);
>>> +     pm_runtime_set_suspended(os05b10->dev);
>>> +
>>> +error_media_entity:
>>> +     media_entity_cleanup(&os05b10->sd.entity);
>>> +
>>> +error_handler_free:
>>> +     v4l2_ctrl_handler_free(os05b10->sd.ctrl_handler);
>>> +
>>> +error_power_off:
>>> +     os05b10_power_off(os05b10->dev);
>>> +
>>> +     return ret;
>>> +}
>>> +
>>> +static void os05b10_remove(struct i2c_client *client)
>>> +{
>>> +     struct v4l2_subdev *sd = i2c_get_clientdata(client);
>>> +     struct os05b10 *os05b10 = to_os05b10(sd);
>>> +
>>> +     v4l2_async_unregister_subdev(sd);
>>> +     v4l2_subdev_cleanup(&os05b10->sd);
>>> +     media_entity_cleanup(&sd->entity);
>>> +     v4l2_ctrl_handler_free(os05b10->sd.ctrl_handler);
>>> +
>>> +     pm_runtime_disable(&client->dev);
>>> +     if (!pm_runtime_status_suspended(&client->dev)) {
>>> +             os05b10_power_off(&client->dev);
>>> +             pm_runtime_set_suspended(&client->dev);
>>> +     }
>>> +}
>>> +
>>> +static DEFINE_RUNTIME_DEV_PM_OPS(os05b10_pm_ops, os05b10_power_off,
>>> +                              os05b10_power_on, NULL);
>>> +
>>> +static const struct of_device_id os05b10_id[] = {
>>> +     { .compatible = "ovti,os05b10" },
>>> +     { /* sentinel */ },
>>> +};
>>> +
>>> +MODULE_DEVICE_TABLE(of, os05b10_id);
>>> +
>>> +static struct i2c_driver os05b10_driver = {
>>> +     .driver = {
>>> +             .name = "os05b10",
>>> +             .pm = pm_ptr(&os05b10_pm_ops),
>>> +             .of_match_table = os05b10_id,
>>> +     },
>>> +     .probe = os05b10_probe,
>>> +     .remove = os05b10_remove,
>>> +};
>>> +
>>> +module_i2c_driver(os05b10_driver);
>>> +
>>> +MODULE_DESCRIPTION("OS05B10 Camera Sensor Driver");
>>> +MODULE_AUTHOR("Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>");
>>> +MODULE_AUTHOR("Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>");
>>> +MODULE_LICENSE("GPL");
>>> --
>>> 2.34.1
>>>

-- 
Best wishes,
Vladimir

