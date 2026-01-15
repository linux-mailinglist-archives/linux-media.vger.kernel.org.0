Return-Path: <linux-media+bounces-50742-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 599F5D22369
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 03:59:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0CE4E3026BEE
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 02:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA5EB275AF5;
	Thu, 15 Jan 2026 02:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QA4C+0WL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7EC27874F
	for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 02:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768445936; cv=none; b=U53J2qFeOZ5XQRAGGqjl466lQnTDsVLWDpit+r0Um1tO3GKruUxu1ymn3xENuOfaJHzKLH3nu5Nym1jkigBg1bj2kleQmnqkkXfXLvaCyJWu3GgyaB8dJLtluwR3L3UJ+uCTT3J+A7G2mK3xxXO8gRPucX3OzoMywYYws1XKBw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768445936; c=relaxed/simple;
	bh=G0j5HAiR0C3JJjOni2dZdfpXBmHvJZ29uZYV9H6XczU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nyNA1JGE9/fKsgHEmDWwuwxuI89cw2yfspBVPdvhgyCwfFzcSab3dQtf+3Y6M3ux63c07XS3ftrIZj2IcwP01CwNzwhfbmsLDidnAdZ/vi9nYOHCjU5T6Rxnd/GvA+IIG4UwItLD0YlT88F2WlD+YvkOev+rFwlkPdmahM0C+sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QA4C+0WL; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-382fb1e257bso582191fa.3
        for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 18:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768445933; x=1769050733; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=04QHhzYz2v+yNJO8IS9lKBiZ6dL208fyd5PVe/BXAQg=;
        b=QA4C+0WLTqkasx+paTIXJtFZ3sRTPu9GXmpZWevkRG09GO3+zhSp/n0Mtspa5P1OTq
         tVhoZmctfGe4f/l2sZFeRvRWzCpz0+BL/Zbwe42B2ZxQ+22CE4yU92u9tWOUhDhzgoAn
         /eXL0FdOBNL18omzGV4RRbWPrWWk2ktImVRC91blG/J8exlKR2bnuEpJrn7SDdVHpVuY
         uMoPLgIeIsb9klN40N4hCmSszZx6oaZfwTW8du8GRDLnTc/5Qxb20sMGOl53emmx8QQk
         2JjQhyorVWhHy3dniZIQ7KG9T/IYMZY9wz5U/ex9SYBMSbAJZrJnnRxf2Ep0BRLecmKI
         BEpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768445933; x=1769050733;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=04QHhzYz2v+yNJO8IS9lKBiZ6dL208fyd5PVe/BXAQg=;
        b=OELpS+rj0WmZZvm9mNQszfpF5x3/bbvcdT3c+lkI5ive5dZQKeRDVdA0wSVvCkAtKk
         SZjaLukxbVyY5pfqMHtitiI6ZtGF9xS0URhq971Rc+LhvxE2++tcLhhkO2uoTyXWt4yE
         r4H6XK7tNZEw+peJUw51vdRLcSzDKDfY5G4mTPI4xrO8TJDjh8y5N4pDgqZNLmOiIDWa
         d5dvLJXaZ3Tg/eSQNAlp4pznThis+mzljMgUcgDJgd2XUKbwdD2KLmomTU5OQzq3qBZF
         VdI7ABdglHEpACCxPXWKuNjgcx5FUyHJDj4UcF24IUOpG5Yt7Va++34M6ameBJf2GPW9
         ahHw==
X-Forwarded-Encrypted: i=1; AJvYcCW5NBS5uS4rVTEe44EMd4PG7JRlEH/NTLQzwWqM7NfupAiOyTUkm2oH3FbiOfYvWGY1aA3SiWz05+rlNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YykI7rNhGl8KERzEyIludg0DO9gdzpR0DJiVEtnJFioxjpKRCm7
	IE1UrJOZQOLA8LdlrFewm0MwslruqAlkAjRdvhGW/a1tUWUvzRujs9fdHWVGgJSWg9Y=
X-Gm-Gg: AY/fxX6ernxHW9IIQtHhuxNug1hZe8p545AVoBp25jsJpzh3t/vlo9YiwJx0935PVVJ
	XdThID7Jz310TuiH1p0Xj21xXqVC1/q7kHmmbs7+McHoPWQJ28j9a7lTAp0/jIktsBzvD5BHW5C
	Htxf13I6lH+9F8PD39i16yHMx6kZyu+DvEQdKdQrDyzK0sBDDSwj382npbvaIEqBXEMxHtUGGHe
	QqYK+IaKpkNKzxYBc0paNpZzbYFn10bEllO5mJYo1xh7SU65xR9tMLUTw2SSnlzDYOPC+mn3l6x
	4eIwJLi/BQo8e6Jx35X5GQS7ogHNrHrMJA7ie5nZf2i8rtE5lRq0h8qiF6FL3Viy1XhGWxQ30+f
	dRShdtq5PyIlgmQdv1fHzNxkEplagOdF7NeXJWeiiE/3JduW4tSJs7OLfZCB7MNva91aKfTyC/s
	m60017KqYmS8BkWcqMNuRBorryJZNTo+WqRJr6rQGoco6lh7kRNWnGlI0EmXYMmU1ZOQ==
X-Received: by 2002:a05:6512:4017:b0:592:f383:3aad with SMTP id 2adb3069b0e04-59ba0f9f61emr890004e87.8.1768445932776;
        Wed, 14 Jan 2026 18:58:52 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59ba1045c55sm1219619e87.80.2026.01.14.18.58.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 18:58:51 -0800 (PST)
Message-ID: <f1c4288f-983f-4a62-82fb-22d1ec56bed0@linaro.org>
Date: Thu, 15 Jan 2026 04:58:51 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] media: qcom: camss: Add common TPG support
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20260113-camss_tpg-v8-0-fa2cb186a018@oss.qualcomm.com>
 <20260113-camss_tpg-v8-1-fa2cb186a018@oss.qualcomm.com>
 <87a31d4e-b604-4b9a-92e9-75fd2748489a@linaro.org>
 <98a26638-675b-4654-a940-898ba9e1af9c@oss.qualcomm.com>
 <e1907273-3d14-41ee-9a22-a963f2b83d20@linaro.org>
 <a70f69e6-6ee6-4a96-88fc-c0ec4db48697@oss.qualcomm.com>
 <641421a6-bf42-49f4-8f94-9cb0bce8e97c@linaro.org>
 <f77e0d03-ba4a-4722-b575-7aee8e93f04b@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <f77e0d03-ba4a-4722-b575-7aee8e93f04b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/15/26 03:06, Bryan O'Donoghue wrote:
> On 14/01/2026 22:07, Vladimir Zapolskiy wrote:
>> Hi Wenmeng.
>>
>> On 1/14/26 14:18, Wenmeng Liu wrote:
>>>
>>> Hi Vladimir,
>>>
>>>
>>> On 1/14/2026 1:05 PM, Vladimir Zapolskiy wrote:
>>>> Hi Wenmeng.
>>>>
>>>> On 1/14/26 05:04, Wenmeng Liu wrote:
>>>>> Hi Vladimir,
>>>>>
>>>>> On 1/14/2026 12:27 AM, Vladimir Zapolskiy wrote:
>>>>>> Hello Wenmeng.
>>>>>>
>>>>>> On 1/13/26 11:03, Wenmeng Liu wrote:
>>>>>>> Introduce a new common Test Pattern Generator (TPG) implementation
>>>>>>> for
>>>>>>> Qualcomm CAMSS. This module provides a generic interface for pattern
>>>>>>> generation that can be reused by multiple platforms.
>>>>>>>
>>>>>>> Unlike CSID-integrated TPG, this TPG acts as a standalone block
>>>>>>> that emulates both CSIPHY and sensor behavior, enabling flexible test
>>>>>>> patterns without external hardware.
>>>>>>>
>>>>>>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>>>>>>> ---
>>>>>>>      drivers/media/platform/qcom/camss/Makefile    |   1 +
>>>>>>>      drivers/media/platform/qcom/camss/camss-tpg.c | 710 ++++++++++
>>>>>>> ++++++
>>>>>>> ++++++++++
>>>>>>>      drivers/media/platform/qcom/camss/camss-tpg.h | 127 +++++
>>>>>>>      drivers/media/platform/qcom/camss/camss.h     |   5 +
>>>>>>>      4 files changed, 843 insertions(+)
>>>>>>>
>>>>>>> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/
>>>>>>> media/platform/qcom/camss/Makefile
>>>>>>> index
>>>>>>> 5e349b4915130c71dbff90e73102e46dfede1520..d355e67c25700ac061b878543c32ed8defc03ad0 100644
>>>>>>> --- a/drivers/media/platform/qcom/camss/Makefile
>>>>>>> +++ b/drivers/media/platform/qcom/camss/Makefile
>>>>>>> @@ -27,5 +27,6 @@ qcom-camss-objs += \
>>>>>>>              camss-vfe.o \
>>>>>>>              camss-video.o \
>>>>>>>              camss-format.o \
>>>>>>> +        camss-tpg.o \
>>>>>>
>>>>>> While you're here, please sort and keep the lines in alphabetical
>>>>>> order.
>>>>> ACK.
>>>>>
>>>>>>
>>>>>>>      obj-$(CONFIG_VIDEO_QCOM_CAMSS) += qcom-camss.o
>>>>>>> diff --git a/drivers/media/platform/qcom/camss/camss-tpg.c b/drivers/
>>>>>>> media/platform/qcom/camss/camss-tpg.c
>>>>>>> new file mode 100644
>>>>>>> index
>>>>>>> 0000000000000000000000000000000000000000..f4c015aafa202e5b64fafa3c543128fda6440b11
>>>>>>> --- /dev/null
>>>>>>> +++ b/drivers/media/platform/qcom/camss/camss-tpg.c
>>>>>>> @@ -0,0 +1,710 @@
>>>>>>> +// SPDX-License-Identifier: GPL-2.0
>>>>>>> +/*
>>>>>>> + *
>>>>>>> + * Qualcomm MSM Camera Subsystem - TPG Module
>>>>>>> + *
>>>>>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its
>>>>>>> subsidiaries.
>>>>>>> + */
>>>>>>> +#include <linux/clk.h>
>>>>>>> +#include <linux/delay.h>
>>>>>>> +#include <linux/io.h>
>>>>>>> +#include <linux/kernel.h>
>>>>>>> +#include <linux/of.h>
>>>>>>> +#include <linux/platform_device.h>
>>>>>>> +#include <linux/pm_runtime.h>
>>>>>>> +#include <media/media-entity.h>
>>>>>>> +#include <media/v4l2-device.h>
>>>>>>> +#include <media/v4l2-subdev.h>
>>>>>>> +
>>>>>>> +#include "camss-tpg.h"
>>>>>>> +#include "camss.h"
>>>>>>> +
>>>>>>> +const char * const testgen_payload_modes[] = {
>>>>>>> +    "Disabled",
>>>>>>> +    "Incrementing",
>>>>>>> +    "Alternating 0x55/0xAA",
>>>>>>> +    "Reserved",
>>>>>>> +    "Reserved",
>>>>>>> +    "Pseudo-random Data",
>>>>>>> +    "User Specified",
>>>>>>> +    "Reserved",
>>>>>>> +    "Reserved",
>>>>>>> +    "Color bars",
>>>>>>> +    "Reserved"
>>>>>>
>>>>>> It makes little sense to mention the unsupported values, and then
>>>>>> introduce enum tpg_testgen_mode to list the supported ones.
>>>>>>
>>>>> This is for ctrl menu, will do as follow:
>>>>> static const char * const testgen_payload_modes[] = {
>>>>>         [TPG_PAYLOAD_MODE_DISABLED]          = "Disabled",
>>>>>         [TPG_PAYLOAD_MODE_INCREMENTING]      = "Incrementing",
>>>>>         [TPG_PAYLOAD_MODE_ALTERNATING_55_AA]       = "Alternating
>>>>> 0x55/0xAA",
>>>>>         [TPG_PAYLOAD_MODE_RANDOM]      = "Pseudo-random Data",
>>>>>         [TPG_PAYLOAD_MODE_USER_SPECIFIED]    = "User Specified",
>>>>>         [TPG_PAYLOAD_MODE_COLOR_BARS]        = "Color bars",
>>>>> };
>>>>>
>>>>
>>>> This is also not perfect, still userspace is misinformed about a number
>>>> of possible TPG modes vs. a number of actually supported TPG modes.
>>>>
>>> 0x0: INCREMENTING
>>> 0x1: ALTERNATING_55_AA
>>> 0x4: RANDOM
>>> 0x5: USER_SPECIFIED
>>> 0x8: COLOR_BARS
>>>
>>> These values come from the register configuration, these pattern values
>>> are consistent with the CSID TPG.
>>
>> Userspace should not be aware of such low level details as register values,
>> there are many abstraction layers in-between to hide this type of
>> information.
>>
>> Writing proper values to registers should be a concern on the driver level,
>> it sounds improper to push this simple task and responsibility to
>> userspace.
> 
> I think we should stick to the same format as is already upstream for
> the CSID version of this - which is the same data.
> 

It is not the same and it will not be the same, if the currently presented
version is taken. If TPG modes in CSID are continuous, here they are not,
so it makes a big difference for userspace, and better it should be removed.

-- 
Best wishes,
Vladimir

