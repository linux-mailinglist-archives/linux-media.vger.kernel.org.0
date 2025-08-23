Return-Path: <linux-media+bounces-40821-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AB8B328CE
	for <lists+linux-media@lfdr.de>; Sat, 23 Aug 2025 15:33:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 164157B5108
	for <lists+linux-media@lfdr.de>; Sat, 23 Aug 2025 13:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9072B2264B4;
	Sat, 23 Aug 2025 13:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WSZ5ygzf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A7D14A62B
	for <linux-media@vger.kernel.org>; Sat, 23 Aug 2025 13:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755956012; cv=none; b=P3HKfKjwWQH1p0YWDQwMeowChdnGwgVmmdwEVaNj3q/skPU+0HER7FrzhUxOHRaD49EI2Et2MHbyCjSbMspHW/3BmcksclFUKHJeyj29NGAVSy6nL55cTU1K31qhbVHj6PPEBEu3SkY8TBroVc4cL9qroQXDX4OCOUNJY714b14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755956012; c=relaxed/simple;
	bh=XG/YCdKmCL184FVcuudROWoIAOAC3BzKeQpSIV2o1Ho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o3iQmgtYFdFL2rlfJ1ykw0Xj5QB+VokAqlHhzAVhRhmip7jNBgPrRBGcJGdqq/daXiQt6NRF0IAfD+7CKBXFnk8klL1pGmQHQDT0vZnw65MNg2yMK7cqd8j2e8JCDGmqFriGtFw60+t/9vPkhiSGoACxsUtiCt6mjDIR8+EdNWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WSZ5ygzf; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-333f914fb11so3316821fa.2
        for <linux-media@vger.kernel.org>; Sat, 23 Aug 2025 06:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755956008; x=1756560808; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BaYqLD6xOEfnp7FTRb0ZV1e9hgfbEL9+FtcNUdbaGNU=;
        b=WSZ5ygzfWtoy/qCgmc2HnB+XWPFAiffSdkLap4fXXmiMPQLoGo0wmVAyLLo3aiY0pU
         i1QX3OB4cJPyjUhykr53P2Vmx5B/IW3ard28ctzdQwXyjU5cbvQEa1KNEME3gszpx6Zs
         DPawCpR48VQmNn3jXJtwuYRFPR1TO15ytRDW2r8YKust+cpEkpMbDguQBphoniRETyLl
         YxsbQicldLC/sWnX+/WZBXrgrNgG3Jbd9XNB90KYdc5KuGDeEmEkStas/XC8m5A0S88v
         y0r+trmeEY/JKYE7WngesDzTpZmEpiuwygZZh4Vj+CwrxE9TXit3VZwlhexNVXWo28yF
         UN+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755956008; x=1756560808;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BaYqLD6xOEfnp7FTRb0ZV1e9hgfbEL9+FtcNUdbaGNU=;
        b=X0Grp1z/5C3MIZf7OJJEFQDp2HpJj5R+mIATvaZOvUDpevPdRSHDBT+okIQSKqgoip
         1YD1asVE1i7Yt38rVOmlmamuvLCWmIVi8Iu/Hg51TsDFJoNUGyrPRVDktXJGSECULYn0
         hOK56QyJ3ayrTr0V8MeOw1EZ4xL3XjU7SNrqQkGwwM5g9o5FvM2L2gtn6vgVTs1sdWj/
         FQRY6SpQFw8YcAOBlukGVGiG8k4mu5RnNJ4HQNQ2EffQZsdDzWJsfj3AXeJNuPhRlsld
         T1X8xE8Jnc991ft2GhSz4g2o9ZjNBsNZrjsHaseo13RxzFmxK/Xp9kxRy+BQo+ctCt/l
         Uf0w==
X-Forwarded-Encrypted: i=1; AJvYcCWp21Z7NGtSeTflnrpWNLD2FhZOeNMJiBtrFKztbjttT3fpDfAJ6V2Id0oixjo334tCI7Gqmr+IPFxUQw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7boVVZWL/nItG4B9i7mslqmjIkKkailQ2smsC8Xw+iDpt/g3X
	Y2Q1XCKsXpDzcgl63h9TCifc+kno2sVoLevufIMjYVNfWANXhNpXYBZKYj3rsxSMXrQ=
X-Gm-Gg: ASbGncsA7Wv4GYFMmhaLRmuwHOU/MgdH2MzAttcS2CjcLRKdjWCHdMa49rV/Z8Z+7MX
	6WDiby8G9CheRmmKL8owEdG4s2LaA3i9po7mL/DYHq8F5JZLiK0XXk+PEQmyMNBUHFgbluvEWUb
	p/Dc3WiKm3ca6bnGFnlUwHa0R85h3qMKN76Vl6Jd3Eb+auy4VmHrV7LzIdILOXDRICdEGiUkZGM
	b++Ms6XbJoG7alvMvaz1ZNY2ZGoMWm2ovxBXCsX/1moJFXi42B3fB44UzFw4KvaZws52SC1d9vc
	fozU8Bx/COD/BJOuTWbhy4UQzDS0/8fVP/mTHp2SrOGYkoa2OQX4tEg2GjlBvFV2LN31Pyse7Bx
	qC9WfJeIzcIYzsDQiaofahSDiEcoSWLh92oVM3OoBktoCxXRVS0kerv6kcsvOrKRlU8Npd//R+L
	jYiAoQD4HV+5Q=
X-Google-Smtp-Source: AGHT+IFX9/5pfF5mk/M+1J4+FE6OnRkTAlyTlm228dSREURBcGRhEZalXIhf/FzFXVFcxsX+QJ+epg==
X-Received: by 2002:a05:6512:1092:b0:55b:8260:3011 with SMTP id 2adb3069b0e04-55f0d38f70amr1174274e87.7.1755956007523;
        Sat, 23 Aug 2025 06:33:27 -0700 (PDT)
Received: from [192.168.1.100] (88-112-128-43.elisa-laajakaista.fi. [88.112.128.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35c12423sm516298e87.51.2025.08.23.06.33.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Aug 2025 06:33:27 -0700 (PDT)
Message-ID: <d6b281a5-3872-450e-b37e-10fe7ff63bcc@linaro.org>
Date: Sat, 23 Aug 2025 16:33:26 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: og01a1b: Change I2C interface controls to
 V4L2 CCI
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil@kernel.org>, Hans de Goede <hansg@kernel.org>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Dongcheng Yan <dongcheng.yan@intel.com>,
 Jingjing Xiong <jingjing.xiong@intel.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20250822203632.159005-1-vladimir.zapolskiy@linaro.org>
 <PN3P287MB182948539FAD0BCE7E105B838B3CA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <PN3P287MB182948539FAD0BCE7E105B838B3CA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Tarang!

On 8/23/25 09:31, Tarang Raval wrote:
> Hi Vladimir
> 
>> Switch the sensor driver to exploit V4L2 CCI helper interfaces instead
>> of driver specific wrappers over I2C read/write functions.
>>
>> The change is intended to be non-function, on the conversion two
>> register defines were removed as unused ones.
>>
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>>   drivers/media/i2c/Kconfig   |   1 +
>>   drivers/media/i2c/og01a1b.c | 684 ++++++++++++++++--------------------
>>   2 files changed, 304 insertions(+), 381 deletions(-)
>>
>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
>> index 1f5a3082ead9..389461d3a37a 100644
>> --- a/drivers/media/i2c/Kconfig
>> +++ b/drivers/media/i2c/Kconfig
>> @@ -333,6 +333,7 @@ config VIDEO_MT9V111
>>
>>   config VIDEO_OG01A1B
>>          tristate "OmniVision OG01A1B sensor support"
>> +       select V4L2_CCI_I2C
>>          help
>>            This is a Video4Linux2 sensor driver for the OmniVision
>>            OG01A1B camera.
>> diff --git a/drivers/media/i2c/og01a1b.c b/drivers/media/i2c/og01a1b.c
>> index 78d5d406e4b7..8c62d0903426 100644
>> --- a/drivers/media/i2c/og01a1b.c
>> +++ b/drivers/media/i2c/og01a1b.c
>> @@ -1,7 +1,6 @@
>>   // SPDX-License-Identifier: GPL-2.0
>>   // Copyright (c) 2022 Intel Corporation.
>>
>> -#include <linux/unaligned.h>
>>   #include <linux/acpi.h>
>>   #include <linux/clk.h>
>>   #include <linux/delay.h>
>> @@ -10,6 +9,7 @@
>>   #include <linux/module.h>
>>   #include <linux/pm_runtime.h>
>>   #include <linux/regulator/consumer.h>
>> +#include <media/v4l2-cci.h>
>>   #include <media/v4l2-ctrls.h>
>>   #include <media/v4l2-device.h>
>>   #include <media/v4l2-fwnode.h>
>> @@ -24,49 +24,40 @@
>>   #define OG01A1B_DATA_LANES             2
>>   #define OG01A1B_RGB_DEPTH              10
>>
>> -#define OG01A1B_REG_CHIP_ID            0x300a
>> +#define OG01A1B_REG_CHIP_ID            CCI_REG24(0x300a)
>>   #define OG01A1B_CHIP_ID                        0x470141
>>
>> -#define OG01A1B_REG_MODE_SELECT                0x0100
>> +#define OG01A1B_REG_MODE_SELECT                CCI_REG8(0x0100)
>>   #define OG01A1B_MODE_STANDBY           0x00
>>   #define OG01A1B_MODE_STREAMING         0x01
>>
>>   /* vertical-timings from sensor */
>> -#define OG01A1B_REG_VTS                        0x380e
>> +#define OG01A1B_REG_VTS                        CCI_REG16(0x380e)
>>   #define OG01A1B_VTS_120FPS             0x0498
>>   #define OG01A1B_VTS_120FPS_MIN         0x0498
>>   #define OG01A1B_VTS_MAX                        0x7fff
>>
>> -/* horizontal-timings from sensor */
>> -#define OG01A1B_REG_HTS                        0x380c
> 
> Please do not remove this macro. You should keep it and use the
> macro OG01A1B_REG_HTS in the mode_1280x1024_regs configuration.
> 

Definitely it would makes sense, my original idea was to have a single
patch only to get a conversion to CCI, but likely it should be split.

>>   /* Exposure controls from sensor */
>> -#define OG01A1B_REG_EXPOSURE           0x3501
>> +#define OG01A1B_REG_EXPOSURE           CCI_REG16(0x3501)
>>   #define        OG01A1B_EXPOSURE_MIN            1
>>   #define OG01A1B_EXPOSURE_MAX_MARGIN    14
>>   #define        OG01A1B_EXPOSURE_STEP           1
>>
>>   /* Analog gain controls from sensor */
>> -#define OG01A1B_REG_ANALOG_GAIN                0x3508
>> +#define OG01A1B_REG_ANALOG_GAIN                CCI_REG16(0x3508)
>>   #define        OG01A1B_ANAL_GAIN_MIN           16
>>   #define        OG01A1B_ANAL_GAIN_MAX           248 /* Max = 15.5x */
>>   #define        OG01A1B_ANAL_GAIN_STEP          1
>>
>>   /* Digital gain controls from sensor */
>> -#define OG01A1B_REG_DIG_GAIN           0x350a
>> +#define OG01A1B_REG_DIG_GAIN           CCI_REG24(0x350a)
>>   #define OG01A1B_DGTL_GAIN_MIN          1024
>>   #define OG01A1B_DGTL_GAIN_MAX          16384 /* Max = 16x */
>>   #define OG01A1B_DGTL_GAIN_STEP         1
>>   #define OG01A1B_DGTL_GAIN_DEFAULT      1024
>>
>> -/* Group Access */
>> -#define OG01A1B_REG_GROUP_ACCESS       0x3208
>> -#define OG01A1B_GROUP_HOLD_START       0x0
>> -#define OG01A1B_GROUP_HOLD_END         0x10
>> -#define OG01A1B_GROUP_HOLD_LAUNCH      0xa0
>> -

Do you have any objections against removing this "group access" macro?

>>   /* Test Pattern Control */
>> -#define OG01A1B_REG_TEST_PATTERN       0x5100
>> +#define OG01A1B_REG_TEST_PATTERN       CCI_REG8(0x5100)
>>   #define OG01A1B_TEST_PATTERN_ENABLE    BIT(7)
>>   #define OG01A1B_TEST_PATTERN_BAR_SHIFT 2
> 
> ...
>   
>> +static const struct cci_reg_sequence mode_1280x1024_regs[] = {
>> +       { CCI_REG8(0x0300), 0x0a },
>> +       { CCI_REG8(0x0301), 0x29 },
>> +       { CCI_REG8(0x0302), 0x31 },
>> +       { CCI_REG8(0x0303), 0x02 },
>> +       { CCI_REG8(0x0304), 0x00 },
>> +       { CCI_REG8(0x0305), 0xd2 },
>> +       { CCI_REG8(0x0306), 0x00 },
>> +       { CCI_REG8(0x0307), 0x01 },
>> +       { CCI_REG8(0x0308), 0x02 },
>> +       { CCI_REG8(0x0309), 0x00 },
>> +       { CCI_REG8(0x0310), 0x00 },
>> +       { CCI_REG8(0x0311), 0x00 },
>> +       { CCI_REG8(0x0312), 0x07 },
>> +       { CCI_REG8(0x0313), 0x00 },
>> +       { CCI_REG8(0x0314), 0x00 },
>> +       { CCI_REG8(0x0315), 0x00 },
>> +       { CCI_REG8(0x0320), 0x02 },
>> +       { CCI_REG8(0x0321), 0x01 },
>> +       { CCI_REG8(0x0322), 0x01 },
>> +       { CCI_REG8(0x0323), 0x02 },
>> +       { CCI_REG8(0x0324), 0x01 },
>> +       { CCI_REG8(0x0325), 0x77 },
>> +       { CCI_REG8(0x0326), 0xce },
>> +       { CCI_REG8(0x0327), 0x04 },
>> +       { CCI_REG8(0x0329), 0x02 },
>> +       { CCI_REG8(0x032a), 0x04 },
>> +       { CCI_REG8(0x032b), 0x04 },
>> +       { CCI_REG8(0x032c), 0x02 },
>> +       { CCI_REG8(0x032d), 0x01 },
>> +       { CCI_REG8(0x032e), 0x00 },
>> +       { CCI_REG8(0x300d), 0x02 },
>> +       { CCI_REG8(0x300e), 0x04 },
>> +       { CCI_REG8(0x3021), 0x08 },
>> +       { CCI_REG8(0x301e), 0x03 },
>> +       { CCI_REG8(0x3103), 0x00 },
>> +       { CCI_REG8(0x3106), 0x08 },
>> +       { CCI_REG8(0x3107), 0x40 },
>> +       { CCI_REG8(0x3216), 0x01 },
>> +       { CCI_REG8(0x3217), 0x00 },
>> +       { CCI_REG8(0x3218), 0xc0 },
>> +       { CCI_REG8(0x3219), 0x55 },
>> +       { CCI_REG8(0x3500), 0x00 },
>> +       { CCI_REG8(0x3501), 0x04 },
>> +       { CCI_REG8(0x3502), 0x8a },
> 
> You are already setting them using set_ctrl,
> so you can remove these two lines.
> 

Ack.

>> +       { CCI_REG8(0x3506), 0x01 },
>> +       { CCI_REG8(0x3507), 0x72 },
>> +       { CCI_REG8(0x3508), 0x01 },
>> +       { CCI_REG8(0x3509), 0x00 },
> 
> Same here.
> 

Ack.

>> +       { CCI_REG8(0x350a), 0x01 },
>> +       { CCI_REG8(0x350b), 0x00 },
>> +       { CCI_REG8(0x350c), 0x00 },
>> +       { CCI_REG8(0x3541), 0x00 },
>> +       { CCI_REG8(0x3542), 0x40 },
>> +       { CCI_REG8(0x3605), 0xe0 },
>> +       { CCI_REG8(0x3606), 0x41 },
>> +       { CCI_REG8(0x3614), 0x20 },
>> +       { CCI_REG8(0x3620), 0x0b },
>> +       { CCI_REG8(0x3630), 0x07 },
>> +       { CCI_REG8(0x3636), 0xa0 },
>> +       { CCI_REG8(0x3637), 0xf9 },
>> +       { CCI_REG8(0x3638), 0x09 },
>> +       { CCI_REG8(0x3639), 0x38 },
>> +       { CCI_REG8(0x363f), 0x09 },
>> +       { CCI_REG8(0x3640), 0x17 },
>> +       { CCI_REG8(0x3662), 0x04 },
>> +       { CCI_REG8(0x3665), 0x80 },
>> +       { CCI_REG8(0x3670), 0x68 },
>> +       { CCI_REG8(0x3674), 0x00 },
>> +       { CCI_REG8(0x3677), 0x3f },
>> +       { CCI_REG8(0x3679), 0x00 },
>> +       { CCI_REG8(0x369f), 0x19 },
>> +       { CCI_REG8(0x36a0), 0x03 },
>> +       { CCI_REG8(0x36a2), 0x19 },
>> +       { CCI_REG8(0x36a3), 0x03 },
>> +       { CCI_REG8(0x370d), 0x66 },
>> +       { CCI_REG8(0x370f), 0x00 },
>> +       { CCI_REG8(0x3710), 0x03 },
>> +       { CCI_REG8(0x3715), 0x03 },
>> +       { CCI_REG8(0x3716), 0x03 },
>> +       { CCI_REG8(0x3717), 0x06 },
>> +       { CCI_REG8(0x3733), 0x00 },
>> +       { CCI_REG8(0x3778), 0x00 },
>> +       { CCI_REG8(0x37a8), 0x0f },
>> +       { CCI_REG8(0x37a9), 0x01 },
>> +       { CCI_REG8(0x37aa), 0x07 },
>> +       { CCI_REG8(0x37bd), 0x1c },
>> +       { CCI_REG8(0x37c1), 0x2f },
>> +       { CCI_REG8(0x37c3), 0x09 },
>> +       { CCI_REG8(0x37c8), 0x1d },
>> +       { CCI_REG8(0x37ca), 0x30 },
>> +       { CCI_REG8(0x37df), 0x00 },
>> +       { CCI_REG8(0x3800), 0x00 },
>> +       { CCI_REG8(0x3801), 0x00 },
>> +       { CCI_REG8(0x3802), 0x00 },
>> +       { CCI_REG8(0x3803), 0x00 },
>> +       { CCI_REG8(0x3804), 0x05 },
>> +       { CCI_REG8(0x3805), 0x0f },
>> +       { CCI_REG8(0x3806), 0x04 },
>> +       { CCI_REG8(0x3807), 0x0f },
>> +       { CCI_REG8(0x3808), 0x05 },
>> +       { CCI_REG8(0x3809), 0x00 },
>> +       { CCI_REG8(0x380a), 0x04 },
>> +       { CCI_REG8(0x380b), 0x00 },
>> +       { CCI_REG8(0x380c), 0x03 },
>> +       { CCI_REG8(0x380d), 0x50 },
> 
> You can use OG01A1B_REG_HTS
> { OG01A1B_REG_HTS, 0x0350 }
> 
>> +       { CCI_REG8(0x380e), 0x04 },
>> +       { CCI_REG8(0x380f), 0x98 },
> 
> You can also remove these two lines.
> 

Sure, that's true.

>> +       { CCI_REG8(0x3810), 0x00 },
>> +       { CCI_REG8(0x3811), 0x08 },
>> +       { CCI_REG8(0x3812), 0x00 },
>> +       { CCI_REG8(0x3813), 0x08 },
>> +       { CCI_REG8(0x3814), 0x11 },
>> +       { CCI_REG8(0x3815), 0x11 },
>> +       { CCI_REG8(0x3820), 0x40 },
>> +       { CCI_REG8(0x3821), 0x04 },
>> +       { CCI_REG8(0x3826), 0x00 },
>> +       { CCI_REG8(0x3827), 0x00 },
>> +       { CCI_REG8(0x382a), 0x08 },
>> +       { CCI_REG8(0x382b), 0x52 },
>> +       { CCI_REG8(0x382d), 0xba },
>> +       { CCI_REG8(0x383d), 0x14 },
>> +       { CCI_REG8(0x384a), 0xa2 },
>> +       { CCI_REG8(0x3866), 0x0e },
>> +       { CCI_REG8(0x3867), 0x07 },
>> +       { CCI_REG8(0x3884), 0x00 },
>> +       { CCI_REG8(0x3885), 0x08 },
>> +       { CCI_REG8(0x3893), 0x68 },
>> +       { CCI_REG8(0x3894), 0x2a },
>> +       { CCI_REG8(0x3898), 0x00 },
>> +       { CCI_REG8(0x3899), 0x31 },
>> +       { CCI_REG8(0x389a), 0x04 },
>> +       { CCI_REG8(0x389b), 0x00 },
>> +       { CCI_REG8(0x389c), 0x0b },
>> +       { CCI_REG8(0x389d), 0xad },
>> +       { CCI_REG8(0x389f), 0x08 },
>> +       { CCI_REG8(0x38a0), 0x00 },
>> +       { CCI_REG8(0x38a1), 0x00 },
>> +       { CCI_REG8(0x38a8), 0x70 },
>> +       { CCI_REG8(0x38ac), 0xea },
>> +       { CCI_REG8(0x38b2), 0x00 },
>> +       { CCI_REG8(0x38b3), 0x08 },
>> +       { CCI_REG8(0x38bc), 0x20 },
>> +       { CCI_REG8(0x38c4), 0x0c },
>> +       { CCI_REG8(0x38c5), 0x3a },
>> +       { CCI_REG8(0x38c7), 0x3a },
>> +       { CCI_REG8(0x38e1), 0xc0 },
>> +       { CCI_REG8(0x38ec), 0x3c },
>> +       { CCI_REG8(0x38f0), 0x09 },
>> +       { CCI_REG8(0x38f1), 0x6f },
>> +       { CCI_REG8(0x38fe), 0x3c },
>> +       { CCI_REG8(0x391e), 0x00 },
>> +       { CCI_REG8(0x391f), 0x00 },
>> +       { CCI_REG8(0x3920), 0xa5 },
>> +       { CCI_REG8(0x3921), 0x00 },
>> +       { CCI_REG8(0x3922), 0x00 },
>> +       { CCI_REG8(0x3923), 0x00 },
>> +       { CCI_REG8(0x3924), 0x05 },
>> +       { CCI_REG8(0x3925), 0x00 },
>> +       { CCI_REG8(0x3926), 0x00 },
>> +       { CCI_REG8(0x3927), 0x00 },
>> +       { CCI_REG8(0x3928), 0x1a },
>> +       { CCI_REG8(0x3929), 0x01 },
>> +       { CCI_REG8(0x392a), 0xb4 },
>> +       { CCI_REG8(0x392b), 0x00 },
>> +       { CCI_REG8(0x392c), 0x10 },
>> +       { CCI_REG8(0x392f), 0x40 },
>> +       { CCI_REG8(0x4000), 0xcf },
>> +       { CCI_REG8(0x4003), 0x40 },
>> +       { CCI_REG8(0x4008), 0x00 },
>> +       { CCI_REG8(0x4009), 0x07 },
>> +       { CCI_REG8(0x400a), 0x02 },
>> +       { CCI_REG8(0x400b), 0x54 },
>> +       { CCI_REG8(0x400c), 0x00 },
>> +       { CCI_REG8(0x400d), 0x07 },
>> +       { CCI_REG8(0x4010), 0xc0 },
>> +       { CCI_REG8(0x4012), 0x02 },
>> +       { CCI_REG8(0x4014), 0x04 },
>> +       { CCI_REG8(0x4015), 0x04 },
>> +       { CCI_REG8(0x4017), 0x02 },
>> +       { CCI_REG8(0x4042), 0x01 },
>> +       { CCI_REG8(0x4306), 0x04 },
>> +       { CCI_REG8(0x4307), 0x12 },
>> +       { CCI_REG8(0x4509), 0x00 },
>> +       { CCI_REG8(0x450b), 0x83 },
>> +       { CCI_REG8(0x4604), 0x68 },
>> +       { CCI_REG8(0x4608), 0x0a },
>> +       { CCI_REG8(0x4700), 0x06 },
>> +       { CCI_REG8(0x4800), 0x64 },
>> +       { CCI_REG8(0x481b), 0x3c },
>> +       { CCI_REG8(0x4825), 0x32 },
>> +       { CCI_REG8(0x4833), 0x18 },
>> +       { CCI_REG8(0x4837), 0x0f },
>> +       { CCI_REG8(0x4850), 0x40 },
>> +       { CCI_REG8(0x4860), 0x00 },
>> +       { CCI_REG8(0x4861), 0xec },
>> +       { CCI_REG8(0x4864), 0x00 },
>> +       { CCI_REG8(0x4883), 0x00 },
>> +       { CCI_REG8(0x4888), 0x90 },
>> +       { CCI_REG8(0x4889), 0x05 },
>> +       { CCI_REG8(0x488b), 0x04 },
>> +       { CCI_REG8(0x4f00), 0x04 },
>> +       { CCI_REG8(0x4f10), 0x04 },
>> +       { CCI_REG8(0x4f21), 0x01 },
>> +       { CCI_REG8(0x4f22), 0x40 },
>> +       { CCI_REG8(0x4f23), 0x44 },
>> +       { CCI_REG8(0x4f24), 0x51 },
>> +       { CCI_REG8(0x4f25), 0x41 },
>> +       { CCI_REG8(0x5000), 0x1f },
>> +       { CCI_REG8(0x500a), 0x00 },
>> +       { CCI_REG8(0x5100), 0x00 },
>> +       { CCI_REG8(0x5111), 0x20 },
>> +       { CCI_REG8(0x3020), 0x20 },
>> +       { CCI_REG8(0x3613), 0x03 },
>> +       { CCI_REG8(0x38c9), 0x02 },
>> +       { CCI_REG8(0x5304), 0x01 },
>> +       { CCI_REG8(0x3620), 0x08 },
>> +       { CCI_REG8(0x3639), 0x58 },
>> +       { CCI_REG8(0x363a), 0x10 },
>> +       { CCI_REG8(0x3674), 0x04 },
>> +       { CCI_REG8(0x3780), 0xff },
>> +       { CCI_REG8(0x3781), 0xff },
>> +       { CCI_REG8(0x3782), 0x00 },
>> +       { CCI_REG8(0x3783), 0x01 },
>> +       { CCI_REG8(0x3798), 0xa3 },
>> +       { CCI_REG8(0x37aa), 0x10 },
>> +       { CCI_REG8(0x38a8), 0xf0 },
>> +       { CCI_REG8(0x38c4), 0x09 },
>> +       { CCI_REG8(0x38c5), 0xb0 },
>> +       { CCI_REG8(0x38df), 0x80 },
>> +       { CCI_REG8(0x38ff), 0x05 },
>> +       { CCI_REG8(0x4010), 0xf1 },
>> +       { CCI_REG8(0x4011), 0x70 },
>> +       { CCI_REG8(0x3667), 0x80 },
>> +       { CCI_REG8(0x4d00), 0x4a },
>> +       { CCI_REG8(0x4d01), 0x18 },
>> +       { CCI_REG8(0x4d02), 0xbb },
>> +       { CCI_REG8(0x4d03), 0xde },
>> +       { CCI_REG8(0x4d04), 0x93 },
>> +       { CCI_REG8(0x4d05), 0xff },
>> +       { CCI_REG8(0x4d09), 0x0a },
>> +       { CCI_REG8(0x37aa), 0x16 },
> 
> Many registers are being written multiple times. I don't think this is
> helpful, so we can remove
> 
> Some repeated registers I found:
> 
> 0x37aa: 0x07 > 0x10 > 0x16 (written 3 times)
> 0x38a8: 0x70 > 0xF0 (written 2 times)
> 0x38c4: 0x0c > 0x09 (written 2 times)
> 
> ... there are likely many more.
> 
> You can simply keep the last value and remove the other entries.

I'll check it, thank you. As I've said above it's quite out of the
scope for the change, but apparently it should precede the CCI change.

> Additionally, please check the mipi_data_rate_1000mbps registers.
> It seems the same registers are repeated in mode_1280x1024_regs,
> so remove those duplicates from mode_1280x1024_regs.

Right.

> If you have the datasheet, please also add the register names for
> the known ones.
> 

-- 
Best wishes,
Vladimir

