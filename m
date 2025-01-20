Return-Path: <linux-media+bounces-24974-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C5DA16D6C
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 14:31:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 235461882C11
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 13:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 803DA1E103B;
	Mon, 20 Jan 2025 13:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KkZwyRI8"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB502119
	for <linux-media@vger.kernel.org>; Mon, 20 Jan 2025 13:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737379853; cv=none; b=lUG6L3sW3twUEcXxcph5wfvtx1NKUFL6aIcWOrzopKs5PPZWA6Wzd+Krc3owHv7NYgS5tMGFmZ2+lQsBmHLxIx6h+Bb0XayhAhPNIYL6X/Q/rJ3kE2EMy8FbDp6flqNXgz4N3zXNbYMS586znymApQu4jW/wSCZT9A5ByI+9GhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737379853; c=relaxed/simple;
	bh=62lRvWHD/XWZgl6HpF0j0wf55e1EN8O0DeGo17L8PjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KYUShRZGUr+vdTTGUe11qDhxwLLfQ8NKNRgA09B5tScboGpCx/wezvuR8lkUssriydvvJXwmc/F9TbeBqEM1vARIde6b1VYr1gjxdRl+KbtAm1XGCsxcaao9kIZS/2LAOcWX3Su+xUrQyB6Sr/Qx8j4cUZu2f9Oger/srAB7zHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KkZwyRI8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737379851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CKFHoOnCCE2cD2+LSiRztzHg+t8WkyCeV1yyk6qo5YM=;
	b=KkZwyRI8zSxPOfXEwMCf+cPQfiio0pMqEYxDi387X3Nsn4eLOoFWr6RqDQODzTGgQAV8cY
	Vx+eHRz4PmblraLVT9EOhP0dZ8XjJdQaa3yV8foPWnZD2NL3I6fYrIdU/c6bcpmXfd/X1K
	1uQYKKoe+0VCF2RT67p8M+DK0au45P0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-127-HOz31TqmO6G-OTn18AtGCg-1; Mon, 20 Jan 2025 08:30:49 -0500
X-MC-Unique: HOz31TqmO6G-OTn18AtGCg-1
X-Mimecast-MFC-AGG-ID: HOz31TqmO6G-OTn18AtGCg
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ab2e529dc35so435726466b.3
        for <linux-media@vger.kernel.org>; Mon, 20 Jan 2025 05:30:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737379848; x=1737984648;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CKFHoOnCCE2cD2+LSiRztzHg+t8WkyCeV1yyk6qo5YM=;
        b=sSC0mAEBu7jw9v0GI7mlkaSj9TKktnz+TYuTGZN7AnuenmikDnLdozGDsGQ8EVnDX0
         p7szPFXV8z2BTL5Y0u9Jq704Ts5e/MZeMTWgBMJRvFrU3epjuv3Mj8NTsHAdDES6poJj
         6OVO67cUR5PvPfEHxyWPI+RPqHIFDKd+kwE8y3+uhGqPmUyQA1g12WIewtWC8dSUSMGf
         pg9B8B39BlrgrndZSNUSmt69YGz3CQIUoTgxEn0nEIvysabMysxgwNvEVUNWJM7UcJQD
         SBtieci1vN7VyWyEf6SC62V8IielVySLOE9SUvSYzRslAHqHOVI6GDVGyoDiMRIMvm9j
         0Ayg==
X-Gm-Message-State: AOJu0YxXWe20SB1uozdu3Mg56V2Su8fe1y/o63glhYj5pTHBExODfD/K
	vOr7E/wAhNeQdNI5hjGNeNZQYOY3/pxcqrYDD7L5sAHu8WwzoUGs27zeTkVgUJcmY/ymt+O8kIu
	RUGuNFHrXLPwOQB7UnlvjQuUvAIR63gImiEh8SjynrvwMWSH17sC4sr+1QVlo
X-Gm-Gg: ASbGnctPhMe7otQ3y0TJKKaxnNcJUGIa51Bt+M5KZyHaK3eJvWxMeQJ1Ih3mMvG14wt
	LM++TX+9KNc+l8Kmh2BWPyEdx58cMky312Tsr41TZyaToXxqUS9xiIQNk8H48otxc8S/ofWerME
	9IiWCyEdikL3ntOoqmrEy3u5Tg22nAQiPa5Vmj0nbpwcMGqpisyz1TZNG0I1JMBAS82388tkizy
	fJ+Jkt4PSR+yDsK++AIFAyn6hHplSYkqGmf6PgSY7k0g+UZ/9LXFGtM1W9wbFveb4DD9a2x6QPO
	rWMV8MFJR4vr80Aci2ycsYP5JswMc4+Ye82miuCrgV7SxO7V/RdyrAp0qJlrGspTybadNT2LHyg
	gVD2AZ3bAlSG1koYbKbLZQEHAW6MUrH3Duo/L1ZRk6MgY
X-Received: by 2002:a17:907:7b9d:b0:ab3:2fbc:64d5 with SMTP id a640c23a62f3a-ab38b17b9bamr1151852066b.31.1737379848290;
        Mon, 20 Jan 2025 05:30:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEHGo7WouHppRer3I1u8sSEOa1qsbaAftqpBHcj5r5P1kb2W6pnMuko4QGWnLlmHsJYEGrzXw==
X-Received: by 2002:a17:907:7b9d:b0:ab3:2fbc:64d5 with SMTP id a640c23a62f3a-ab38b17b9bamr1151849066b.31.1737379847728;
        Mon, 20 Jan 2025 05:30:47 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384f223fesm621158266b.105.2025.01.20.05.30.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jan 2025 05:30:47 -0800 (PST)
Message-ID: <0a0b765e-b342-4433-9c6c-07da78f0f63b@redhat.com>
Date: Mon, 20 Jan 2025 14:30:46 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] media: ov7251: Remap "reset" to "enable" for
 OV7251
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
References: <20241108145024.1490536-1-andriy.shevchenko@linux.intel.com>
 <Zy43D7wAZLrBDtiX@kekkonen.localdomain> <Zy48Fc_nUceCs3PK@smile.fi.intel.com>
 <Zy4_hR9AsDhmK5MK@kekkonen.localdomain>
 <2957d1f6-f846-4916-980d-4346bc2b9d64@redhat.com>
 <ZzG4ekFKe25Ws0D7@kekkonen.localdomain>
 <20b988cb-603a-4c1f-8a6e-76a4cb98baa0@redhat.com>
 <Z4kcLFlmp51QQAFZ@smile.fi.intel.com> <Z44Z3kedl2I0i9Z5@kekkonen.localdomain>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Z44Z3kedl2I0i9Z5@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

+Cc platform-driver-x86@vger.kernel.org

Hi Sakari,

On 20-Jan-25 10:39 AM, Sakari Ailus wrote:
> Hi Andy,
> 
> On Thu, Jan 16, 2025 at 04:48:12PM +0200, Andy Shevchenko wrote:
>> On Mon, Nov 11, 2024 at 10:46:32AM +0100, Hans de Goede wrote:
>>> On 11-Nov-24 8:55 AM, Sakari Ailus wrote:
>>>> On Fri, Nov 08, 2024 at 07:19:05PM +0100, Hans de Goede wrote:
>>>>> On 8-Nov-24 5:42 PM, Sakari Ailus wrote:
>>>>>> On Fri, Nov 08, 2024 at 06:28:05PM +0200, Andy Shevchenko wrote:
>>>>>>> On Fri, Nov 08, 2024 at 04:06:39PM +0000, Sakari Ailus wrote:
>>>>>>>> On Fri, Nov 08, 2024 at 04:50:24PM +0200, Andy Shevchenko wrote:
>>>>>>>>> The driver of OmniVision OV7251 expects "enable" pin instead of "reset".
>>>>>>>>> Remap "reset" to "enable" and update polarity.
>>>>>>>>>
>>>>>>>>> In particular, the Linux kernel can't load the camera sensor
>>>>>>>>> driver on Microsoft Surface Book without this change:
>>>>>>>>>
>>>>>>>>>  ov7251 i2c-INT347E:00: supply vdddo not found, using dummy regulator
>>>>>>>>>  ov7251 i2c-INT347E:00: supply vddd not found, using dummy regulator
>>>>>>>>>  ov7251 i2c-INT347E:00: supply vdda not found, using dummy regulator
>>>>>>>>>  ov7251 i2c-INT347E:00: cannot get enable gpio
>>>>>>>>>  ov7251 i2c-INT347E:00: probe with driver ov7251 failed with error -2
>>
>> ...
>>
>>>>>>>> Should this be cc'd to stable? I guess it's not exactly a fix in the driver
>>>>>>>> but a BIOS bug, but it can be worked around in the driver. :-)
>>>>>>>
>>>>>>> It's everything, but a BIOS bug, it's DT bug and whoever first introduced that
>>>>>>> GPIO in the driver. Even in the DT present in kernel the pin was referred as
>>>>>>
>>>>>> How is that a DT (binding?) bug?
>>>>>
>>>>> Since it is not following the datasheet name for the pin,
>>>>> it arguably is a DT binding bug
>>>>>
>>>>> But whatever, the whole discussion about if it is a bug and whose
>>>>> bug it is is not useful. Since we cannot go back in time and change
>>>>> the DT binding DT and ACPI are simply going to disagree on the name
>>>>> and we will need something like this patch.
>>>>>
>>>>>>> CAM_RST_N, which is exactly how this patch names it.
>>>>>>>
>>>>>>> OTOH it's a fix to the driver that never worked for ACPI case, so there never
>>>>>>> was a regression to fix.
>>>>>>
>>>>>> It probably worked just fine, just not with that Surface Book.
>>>>>>
>>>>>> The polarity of the enable gpio appears to be set wrong in devm_gpiod_get()
>>>>>> call. I can post a patch but cannot test it.
>>>>>
>>>>> That is on purpose, at least the polarity if the devm_gpiod_get(..., "reset",
>>>>> ...) is inverted from the existing one for "enable" because reset needs
>>>>> to be inactive/disabled to enable the sensor.
>>>>>
>>>>>> Similarly, you should actually set the flags to GPIOD_OUT_HIGH as reset
>>>>>> should be enabled here -- it's disabled only in power_on() as part of the
>>>>>> power-on sequence.
>>>>>
>>>>> This seems to be a pre-existing bug in this driver, which currently
>>>>> starts driving enable high, enabling the sensor at gpiod_get() time.
>>>>>
>>>>> Note that fixing this is tricky-ish, if the pin was already high at
>>>>> gpiod_get() time then changing the gpiod_get() to drive it low
>>>>> will result in it only being driven low for a very short time since
>>>>> ov7251_set_power_on() will get called almost immediately after this
>>>>> and it will drive the pin high again without any delays.
>>>>
>>>> The question here is not about how long the hard reset is applied, but
>>>> whether or not the sensor's power-on sequence is followed. Currently it is
>>>> not.
>>>
>>> Right / agreed. The 2 points which I am trying to make are:
>>>
>>> 1. This is a pre-existing problem unrelated to this patch.
>>>
>>> So this should be fixed in a separate patch.
>>>
>>> 2. That separate patch should put a delay after requesting the GPIO
>>> to enforce that it is (logically) low (for "enable") for a minimum
>>> amount of time.
>>
>> Sakari, what's the status on this, please?
>> We have non-working camera just because of this small patch is absent.
> 
> Thanks for the ping.
> 
> I took a closer look at the problem, indeed the GPIO name comes from the
> int3472 driver and it's much better to work around this there than to ram
> Windows ACPI table specifics to sensor drivers. I'll post a patch for that
> shortly. Testing would be appreciated as the Surface Go 2 doesn't have a
> GPIO connected to this sensor.

Actually Andy wrote this patch after first writing a similar quirk patch
as yours from:

https://lore.kernel.org/platform-driver-x86/1cf93f61-9285-f2fe-fb92-8fb8a3f44201@linux.intel.com/T/#t

because I asked him to fix this in the sensor driver instead.

The problem is that we cannot fix this in the INT3472 driver without
that becoming one big mess of driver specific quirks.

The Windows code seems to have separate power-ctrl/sequence drivers
for the INT3472 device vs the rest of the sensor driver and this
power-sequence driver happily consumes whatever GPIOs the INT3472
device provides independent of the sensor.

So e.g. on some designs we are going to see a reset pin and on others
a powerdown pin.

But in this specific case things are actually more simple,
the datasheet describes the pin as:

XSHUTDOWN input reset (active low with internal pull down resistor)

So the devicetree binding calling it "enable" is just wrong and in
this case it is actually the DT binding which is buggy (there is no
"enable" pin anywhere in the datasheet) and not the ACPI tables.

Also since you match on the sensor-type for the remapping this clearly
is a per sensor thing and per sensor handling should be in the sensor
drivers, which gives us the per sensor mapping for free.

Yes needing to handle this in the sensor driver makes the sensor
driver slightly less pretty. But dealing with platform specifics
in drivers is done all over the kernel and I don't see why camera
sensor drivers are so special that they get to be excluded from
sometimes needing to deal with platform specifics.

Regards,

Hans




