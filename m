Return-Path: <linux-media+bounces-65197-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Fs4XC1zuM2pWJAYAu9opvQ
	(envelope-from <linux-media+bounces-65197-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 15:10:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5E16A05B0
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 15:10:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=U1LSmo5q;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65197-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65197-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B3BDF30F8D50
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 13:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0A563F86F5;
	Thu, 18 Jun 2026 13:04:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CB93F7A86
	for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 13:04:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781787851; cv=none; b=NPMl84lWqaOXeAEeddR3bxORwYkbCIm8M6fVKKZHtJ6rX3HxBDIxFStlRbWhXEhOenC44iZGVydYluKSJZxiCvkkw25IlRmZUe10LiqEEFqbcn/0gFuZIVEHaRpOxa7bVJ80aRc2aBr+3nmtuuNyCGpyyTXY7v9QeJHOu3mbObU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781787851; c=relaxed/simple;
	bh=J6Sw/dQgNmxN0/EMz0SfG6mVKF1zfca1vJnX/kjOmJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uaLmosFn/YwN9LIGR+0HGzAT5fYTT2k6jg6uOp9tN4WRDTA2ggApvk9a0Kt51dv0cWCN6HU3d36wiCB9F5Slii3QyQaRln2P1Pn9AIEtgec+WfzMJkIcKj5omc2+6LUY1HTci9BKjJOGxROyT5r2n0s9XN5kjD9d0SiVUePJxo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U1LSmo5q; arc=none smtp.client-ip=209.85.167.44
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aa9326af17so139224e87.0
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 06:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781787847; x=1782392647; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kv/G4FgIe0eCoDORK2JWlpclpJ0tr//RTe0aIs6WhTI=;
        b=U1LSmo5q9y2pX8H9YbHU69C0KVtJo0Xn3yXX8pwvMEJFhbiJuISPCZGj64DwTDOc7o
         BU+sYlM8wVjzz97SyrtPK3+0nnSW274A68Ztlp6wwy9aP6ZLJOrbZ8gct2u5PYk0w4KL
         V5DQX9//RNhF+o8EXidAV5JyrPMztOECbUcjI5xsRZIF+Qy/hs9WmW0oD9TpQBzqNVwn
         U98aImfzisE9lPtZsPUfDJcpISCHv8flPdNWT1hk67rigfT+D4OIwiLrRwzs8+Q8Ijhv
         7fzcaBxJzPBkvqqngeptSdBmtlQ4QntBvGAlxfN6/99BORUvxfbfdsiPCdQsPehVk+mQ
         FOuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781787847; x=1782392647;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kv/G4FgIe0eCoDORK2JWlpclpJ0tr//RTe0aIs6WhTI=;
        b=BRIznX6p4GW9CrUwyyIkUboguHkLlXqXEWakw/NIgFFz1K9rEMeqKWr8iAcId9tq6R
         yjD2T+rBSAA48VRV8joaPIXpBkJZE3zdIRdOziNdMxvN5viqznjJUQp+hKt4Pq/ndOm5
         944BYvpSndhww0DTdERwzSm4NuDvi6aomsayu90Z5b4kvP+tNfqtEad5kJkGSdVRpzg+
         CY6Bcvd3bou8xNjBBmF2YI6NeaSQrDl1UMThZU4RKHAHRmFZ5/5YfJqk4KO/fKFg+012
         UxH74QVNdB+Xgoq6fBHW6dFYVLp0N0IMi5Vlq7VELpK0FC9soFCx95YkkVpk+xhKY4NW
         eV+g==
X-Gm-Message-State: AOJu0YzcqvEJnZjAgmU7xR6JlD3FmTWqP7nMH4LwG+eCvPbCk0JlPkir
	TYUq94hTYRNJEYiBRG1IF/90xuwMyCN4LcbsyaBTuAxvoZbbwdxoYemkI36ZPqRpPzY=
X-Gm-Gg: AfdE7cnImUs5tBdlzBfOviNZ9dFq89LMJ+lutdvTHoFLlMmQ3lZDq9FYrEC/cTmwikM
	NoDdq2g0ZXZ0DWFs+/YeQ0o9UMCTEu+TQRk9HbZTJzgZZlHkSdJ8GCK++Dj18QJvZ/BFTYpPaGV
	6AAPRGbArRveHVGcVhs2JPq9gali2IiIlp1gSd5d+srpUES6koMDjRO7ZNhjCI6r1qgcYBt/frZ
	FqOgbnBVzsRWufG0OcxwbDRC6mYmRYz42n4Xc/pUz/Z+DPtNKBtFfGAcr6ESBW6b+TmQo8p+4/3
	kAo6QFs3AfgIhGoHA2Lnh9uIjq6/SfTyKjSCI+pG4chgQ6wl5UmMmeJ/LRMqVNE5kCP1KXJ5Tvu
	8tqKT3TOJkKcHx7O33xXbsu3IVD3DJxcKS1wdrzded+fxE90cMuVWE0IjivchRc7n5fPyLVcVvN
	+tPR3TNGOYYWlPJFeTJwFn5HFgnU1vGi9pmOkRPhuiPiCHygB5Ko48acBaxZHUoiTHn6o=
X-Received: by 2002:ac2:4bc5:0:b0:5ad:2ac0:9fb0 with SMTP id 2adb3069b0e04-5ad4dabf7d5mr716947e87.4.1781787847062;
        Thu, 18 Jun 2026 06:04:07 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad4cf526ecsm893796e87.12.2026.06.18.06.04.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 06:04:06 -0700 (PDT)
Message-ID: <594dbb69-0d5e-4bc1-9328-f0949e994a8d@linaro.org>
Date: Thu, 18 Jun 2026 16:04:05 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: i2c: og0va1b: Add OmniVision OG0VA1B camera
 sensor
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260618-og0va1b-v1-0-dda71bb83009@oss.qualcomm.com>
 <20260618-og0va1b-v1-2-dda71bb83009@oss.qualcomm.com>
 <1a57863c-831a-411c-a0ae-da3d4f1fd6a0@linaro.org>
 <226a55a6-babd-47ce-b261-35b982d5c7db@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <226a55a6-babd-47ce-b261-35b982d5c7db@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65197-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:wenmeng.liu@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AF5E16A05B0

On 6/18/26 15:36, Wenmeng Liu wrote:
> 
> 
> On 6/18/2026 6:50 PM, Vladimir Zapolskiy wrote:
>> Hello Wenmeng.
>>
>> On 6/18/26 13:37, Wenmeng Liu wrote:
>>> Add V4L2 sub device driver for OmniVision OG0VA1B image sensor.
>>> OmniVision OG0VA1B is an image sensor, which produces frames in 10-bit
>>> raw output format (Y10) over a 1-lane MIPI CSI-2 interface and supports
>>> the 640x480 (VGA) resolution.
>>>
>>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>>> ---
>>>    MAINTAINERS                 |   1 +
>>>    drivers/media/i2c/Kconfig   |  10 +
>>>    drivers/media/i2c/Makefile  |   1 +
>>>    drivers/media/i2c/og0va1b.c | 867 ++++++++++++++++++++++++++++++++++
>>> ++++++++++
>>>    4 files changed, 879 insertions(+)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index
>>> 5aa846c8479b20651291d5bd2e316308310f826c..85a06eb9eacc410a565b80d56979eaa565515d0e 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -19891,6 +19891,7 @@ M:    Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>>>    L:    linux-media@vger.kernel.org
>>>    S:    Maintained
>>>    F:    Documentation/devicetree/bindings/media/i2c/ovti,og0va1b.yaml
>>> +F:    drivers/media/i2c/og0va1b.c
>>>    OMNIVISION OG0VE1B SENSOR DRIVER
>>>    M:    Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
>>> index
>>> 5d173e0ecf424f2f204f8d426be818e44357f8e4..56680772f5f47b4629c4e17f5a5feba08b1d94fc 100644
>>> --- a/drivers/media/i2c/Kconfig
>>> +++ b/drivers/media/i2c/Kconfig
>>> @@ -363,6 +363,16 @@ config VIDEO_OG01A1B
>>>          To compile this driver as a module, choose M here: the
>>>          module will be called og01a1b.
>>> +config VIDEO_OG0VA1B
>>> +    tristate "OmniVision OG0VA1B sensor support"
>>> +    select V4L2_CCI_I2C
>>> +    help
>>> +      This is a Video4Linux2 sensor driver for the OmniVision
>>> +      OG0VA1B camera.
>>> +
>>> +      To compile this driver as a module, choose M here: the
>>> +      module will be called og0va1b.
>>> +
>>>    config VIDEO_OG0VE1B
>>>        tristate "OmniVision OG0VE1B sensor support"
>>>        select V4L2_CCI_I2C
>>> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
>>> index
>>> e45359efe0e41e13e3c0869e5ead7d6cf4aca3a7..c60851c7fe07e3bdc511c5f482525ba7a044f48e 100644
>>> --- a/drivers/media/i2c/Makefile
>>> +++ b/drivers/media/i2c/Makefile
>>> @@ -83,6 +83,7 @@ obj-$(CONFIG_VIDEO_MT9V011) += mt9v011.o
>>>    obj-$(CONFIG_VIDEO_MT9V032) += mt9v032.o
>>>    obj-$(CONFIG_VIDEO_MT9V111) += mt9v111.o
>>>    obj-$(CONFIG_VIDEO_OG01A1B) += og01a1b.o
>>> +obj-$(CONFIG_VIDEO_OG0VA1B) += og0va1b.o
>>>    obj-$(CONFIG_VIDEO_OG0VE1B) += og0ve1b.o
>>>    obj-$(CONFIG_VIDEO_OS05B10) += os05b10.o
>>>    obj-$(CONFIG_VIDEO_OV01A10) += ov01a10.o
>>> diff --git a/drivers/media/i2c/og0va1b.c b/drivers/media/i2c/og0va1b.c
>>> new file mode 100644
>>> index
>>> 0000000000000000000000000000000000000000..f0505b7ba7f329ad57ffafa8f90a24204f002d3c
>>> --- /dev/null
>>> +++ b/drivers/media/i2c/og0va1b.c
>>> @@ -0,0 +1,867 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * OmniVision OG0VA1B Camera Sensor Driver
>>> + *
>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries
>>> + */
>>> +
>>> +#include <linux/clk.h>
>>> +#include <linux/delay.h>
>>> +#include <linux/gpio/consumer.h>
>>> +#include <linux/i2c.h>
>>> +#include <linux/module.h>
>>> +#include <linux/of.h>
>>> +#include <linux/pm_runtime.h>
>>> +#include <linux/regulator/consumer.h>
>>> +
>>> +#include <media/v4l2-cci.h>
>>> +#include <media/v4l2-ctrls.h>
>>> +#include <media/v4l2-device.h>
>>> +#include <media/v4l2-fwnode.h>
>>> +#include <media/v4l2-subdev.h>
>>> +
>>> +#define OG0VA1B_REG_CHIP_ID        CCI_REG16(0x300a)
>>> +#define OG0VA1B_CHIP_ID            0xC756
>>
>> This is the same chip id as of the OG0VE1B sensor device.
>>
>> What's the difference between these two sensors, and do you find it
>> possible
>> to add support of OG0VA1B sensor/modes into OG0VE1B sensor driver? Or is
>> it just the same device?
>>
>> Hardware specifics described in dt changes also does not show a difference
>> in comparison to ovti,og0ve1b.yaml.
>>
> 
> Hi Vladimir,
> 
> Both OG0VE1B and OG0VA1B belong to the same OmniVision VGA monochrome
> sensor family. They share the same resolution, power rails, reset GPIO
> behavior and power management framework.
> 
> But they are different:
> OG0VE1B:  8-bit RAW, lower FPS

The current OG0VE1B driver supports 640x480@120 FPS, 8-bit mode, however
the sensor itself has 10-bit image output format mode support also.

> OG0VA1B: 10-bit RAW, higher FPS
> and some registers are not same.

The very first one, which I'd like to see in the driver, is the difference
in the CHIP_IP register value.

> 
> The DT bindings can be reused, but would it be more appropriate for the
> driver to remain independent?
> 

It depends on the actual difference between two devices, if it is lightly
maintainable, then it makes no sense to add another driver IMHO, but this
should be established.

If the difference is about different mode programming, I'd say it can be
kept under one device driver.

FWIW on OmniVision website there are "OG0VE" and "OG0VA" product briefs,
the devices are very similar, but not identical. Obviously there are
Linux device drivers, in particular image sensor drivers, which support
multiple different devices, so having a single device driver is at least
a viable option to consider.

It'd be great to get comments from other developers on the subject.

-- 
Best wishes,
Vladimir

