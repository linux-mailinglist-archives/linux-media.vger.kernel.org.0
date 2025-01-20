Return-Path: <linux-media+bounces-24995-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B915A1704B
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 17:37:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 488CC1641E4
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 16:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2CE11E9B2E;
	Mon, 20 Jan 2025 16:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FLUoYnoy"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2852BE65
	for <linux-media@vger.kernel.org>; Mon, 20 Jan 2025 16:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737391036; cv=none; b=kvGgI1SP8Ifj+lyliObz8Wb2CQxCgeqjJ+HTf9rquFtDzFic2tftYH2J7f8aqx+J56XNWK1uGCqAjZujNs+h5Z2XPK+UISF32EZ+Q4AzVNYcdvLUY+ybCnUqkqgog+X9X2aNeqKQyMfal7gVpmm2z8XazDE0CFdFgUxRoYZ4ZCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737391036; c=relaxed/simple;
	bh=eGUMRvdoH9/RDjYajkFoEJlHROaLDxe7vFGwrEf803Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GXHPar1Gj5wj7kHNWX/EFpgkOwsGwr9bfEElcglll7y9ISKCh7FmrRU5ogXRxuc6Bk2iCcqJzGwHTsoapfLntx00+GX6HROtMhzkwrJg5fVZ9mhGdy1a3cUlSnZEUzXvDKkQy0ac6dFslynCrb7t7wOYNcEc/XYDIs6JN1lAPWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FLUoYnoy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737391032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pXKimu5bb7HcVutHt4UxGTkpHXNy5ybuFKeIuXz/BAM=;
	b=FLUoYnoyoZByB3oB+FYQuFMciFbdgZXzQ/kobBKfzXQms9cAud/tgR4bdvJGk9yuhRvO0u
	29UWVMkRZV3vEpw0s/mjvQnWa5STrAnLVwIPcwBe3fGGPTHJOQSAl8s+wJ4s/R7SfUf3DM
	y6/v/1y4ec83bjzlBGzC010M+rZZvZs=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-61-2tS-gk7kPd2v9rvQqm0D1Q-1; Mon, 20 Jan 2025 11:37:11 -0500
X-MC-Unique: 2tS-gk7kPd2v9rvQqm0D1Q-1
X-Mimecast-MFC-AGG-ID: 2tS-gk7kPd2v9rvQqm0D1Q
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-aa6732a1af5so526775866b.3
        for <linux-media@vger.kernel.org>; Mon, 20 Jan 2025 08:37:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737391030; x=1737995830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pXKimu5bb7HcVutHt4UxGTkpHXNy5ybuFKeIuXz/BAM=;
        b=vAeljGhvweVuxpgCC/3e46HKyFn+qF+dM2jGO9tbJDj2zqghWWQ4po5DeUHE3W8I++
         6Rfw0/K6+SdwEt9xZAq6stVmINKrwjYQB0NnVVuUYczbOurilbHlz/CA/kJFByH66MZM
         f3oMPOvLK+TLeldTmYOLQ1MimCrlUnNQLXS5a1jPZKntGlVxR3zdILxKXv1qFcDD4GV9
         Iv+0679SVbHH3yMJEivWV3I/jGQJydeUKXXqQ+BHZ+xcT/f7K9ul+W0hulCNc5SKOzaT
         sCU18y0IwDn1x6sE1wcVJgtvAIcCYNbxSv9W8i/rsyEom1b9ZE9iaQGFgXGquftCn0SO
         nyfg==
X-Forwarded-Encrypted: i=1; AJvYcCUiBiYpiVYx3nIjMMurPqc/jcgBGX5eL0043btGvY5mkctvyb/MxDJ0Rei8v2IMcUIhEQcZG4FNJS57ow==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2oyvZCDgZ14ZRX9rb+PkvupX9bTNszasRkZjoXYgdsatBnpGJ
	Wib6V2cGZ6r8quEyCmUhG5Mf77tYpSccbBcWR4oQssHna5JPMmNeCCUg2wQ7Kwif+Zxi7ANomqM
	2zO9/RXIWEkxMTKkTY4DmODB5EiIbg3XojEPT73Pn2guCRICuzLAknRakOohy
X-Gm-Gg: ASbGncvCK9Tdm6/Nr2uxOJRwpu2Q+ZvJqz36a+RIgoORlhwe9GAH8f+Temp/38aw183
	w5ZTaC7oKuk/KqG6d46ItwSkKa53L2CmkJ8KoV5rFb8DUVtnMPIL+nzsEU4R4V+bzvmfK7ENbua
	51KB4n295OVgSzh8P93y1zzP+vbEMOodpQzU4VzItkoA9+Q3m5/2mws0MOuG/iw8XnEoRcAWLGs
	tHQxLfOxhRMSlgRWhCpUp+j8kqAhGVL4L/Q9nHgeyTHdQU8DkIVEaN03t8MTYaTiu6haNsL8WdD
	dh3WKPOi8MBp0RUKrd4YuRHo47r/RMSR7jvyb9TrdnRHbN+LaizqxEm981Dh4A13NvFOneT/0y8
	/mu+yaAS24FdRMZegOUGnEPJa3uAFBUsH8+9XWqKPHixc
X-Received: by 2002:a17:907:7fa6:b0:ab3:84b3:9a7c with SMTP id a640c23a62f3a-ab38af450f4mr1308744966b.0.1737391029993;
        Mon, 20 Jan 2025 08:37:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGBMCG5/m0YhIpNDLpf7A6fFbGaitjL8ovBwzhbAMvapDeQKz/52U5Z5Lna4PCMZAxyXEcoKQ==
X-Received: by 2002:a17:907:7fa6:b0:ab3:84b3:9a7c with SMTP id a640c23a62f3a-ab38af450f4mr1308741766b.0.1737391029462;
        Mon, 20 Jan 2025 08:37:09 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384fc35ffsm629459166b.160.2025.01.20.08.37.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jan 2025 08:37:08 -0800 (PST)
Message-ID: <695e3d64-57c4-45e0-ae5c-b6879246b34a@redhat.com>
Date: Mon, 20 Jan 2025 17:37:08 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] media: ov7251: Remap "reset" to "enable" for
 OV7251
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
References: <20241108145024.1490536-1-andriy.shevchenko@linux.intel.com>
 <Zy43D7wAZLrBDtiX@kekkonen.localdomain> <Zy48Fc_nUceCs3PK@smile.fi.intel.com>
 <Zy4_hR9AsDhmK5MK@kekkonen.localdomain>
 <2957d1f6-f846-4916-980d-4346bc2b9d64@redhat.com>
 <ZzG4ekFKe25Ws0D7@kekkonen.localdomain>
 <20b988cb-603a-4c1f-8a6e-76a4cb98baa0@redhat.com>
 <Z4kcLFlmp51QQAFZ@smile.fi.intel.com> <Z44Z3kedl2I0i9Z5@kekkonen.localdomain>
 <0a0b765e-b342-4433-9c6c-07da78f0f63b@redhat.com>
 <20250120160505.GA21978@pendragon.ideasonboard.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250120160505.GA21978@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Laurent,

On 20-Jan-25 5:05 PM, Laurent Pinchart wrote:
> On Mon, Jan 20, 2025 at 02:30:46PM +0100, Hans de Goede wrote:
>> +Cc platform-driver-x86@vger.kernel.org
>>
>> Hi Sakari,
>>
>> On 20-Jan-25 10:39 AM, Sakari Ailus wrote:
>>> Hi Andy,
>>>
>>> On Thu, Jan 16, 2025 at 04:48:12PM +0200, Andy Shevchenko wrote:
>>>> On Mon, Nov 11, 2024 at 10:46:32AM +0100, Hans de Goede wrote:
>>>>> On 11-Nov-24 8:55 AM, Sakari Ailus wrote:
>>>>>> On Fri, Nov 08, 2024 at 07:19:05PM +0100, Hans de Goede wrote:
>>>>>>> On 8-Nov-24 5:42 PM, Sakari Ailus wrote:
>>>>>>>> On Fri, Nov 08, 2024 at 06:28:05PM +0200, Andy Shevchenko wrote:
>>>>>>>>> On Fri, Nov 08, 2024 at 04:06:39PM +0000, Sakari Ailus wrote:
>>>>>>>>>> On Fri, Nov 08, 2024 at 04:50:24PM +0200, Andy Shevchenko wrote:
>>>>>>>>>>> The driver of OmniVision OV7251 expects "enable" pin instead of "reset".
>>>>>>>>>>> Remap "reset" to "enable" and update polarity.
>>>>>>>>>>>
>>>>>>>>>>> In particular, the Linux kernel can't load the camera sensor
>>>>>>>>>>> driver on Microsoft Surface Book without this change:
>>>>>>>>>>>
>>>>>>>>>>>  ov7251 i2c-INT347E:00: supply vdddo not found, using dummy regulator
>>>>>>>>>>>  ov7251 i2c-INT347E:00: supply vddd not found, using dummy regulator
>>>>>>>>>>>  ov7251 i2c-INT347E:00: supply vdda not found, using dummy regulator
>>>>>>>>>>>  ov7251 i2c-INT347E:00: cannot get enable gpio
>>>>>>>>>>>  ov7251 i2c-INT347E:00: probe with driver ov7251 failed with error -2
>>>>
>>>> ...
>>>>
>>>>>>>>>> Should this be cc'd to stable? I guess it's not exactly a fix in the driver
>>>>>>>>>> but a BIOS bug, but it can be worked around in the driver. :-)
>>>>>>>>>
>>>>>>>>> It's everything, but a BIOS bug, it's DT bug and whoever first introduced that
>>>>>>>>> GPIO in the driver. Even in the DT present in kernel the pin was referred as
>>>>>>>>
>>>>>>>> How is that a DT (binding?) bug?
>>>>>>>
>>>>>>> Since it is not following the datasheet name for the pin,
>>>>>>> it arguably is a DT binding bug
>>>>>>>
>>>>>>> But whatever, the whole discussion about if it is a bug and whose
>>>>>>> bug it is is not useful. Since we cannot go back in time and change
>>>>>>> the DT binding DT and ACPI are simply going to disagree on the name
>>>>>>> and we will need something like this patch.
>>>>>>>
>>>>>>>>> CAM_RST_N, which is exactly how this patch names it.
>>>>>>>>>
>>>>>>>>> OTOH it's a fix to the driver that never worked for ACPI case, so there never
>>>>>>>>> was a regression to fix.
>>>>>>>>
>>>>>>>> It probably worked just fine, just not with that Surface Book.
>>>>>>>>
>>>>>>>> The polarity of the enable gpio appears to be set wrong in devm_gpiod_get()
>>>>>>>> call. I can post a patch but cannot test it.
>>>>>>>
>>>>>>> That is on purpose, at least the polarity if the devm_gpiod_get(..., "reset",
>>>>>>> ...) is inverted from the existing one for "enable" because reset needs
>>>>>>> to be inactive/disabled to enable the sensor.
>>>>>>>
>>>>>>>> Similarly, you should actually set the flags to GPIOD_OUT_HIGH as reset
>>>>>>>> should be enabled here -- it's disabled only in power_on() as part of the
>>>>>>>> power-on sequence.
>>>>>>>
>>>>>>> This seems to be a pre-existing bug in this driver, which currently
>>>>>>> starts driving enable high, enabling the sensor at gpiod_get() time.
>>>>>>>
>>>>>>> Note that fixing this is tricky-ish, if the pin was already high at
>>>>>>> gpiod_get() time then changing the gpiod_get() to drive it low
>>>>>>> will result in it only being driven low for a very short time since
>>>>>>> ov7251_set_power_on() will get called almost immediately after this
>>>>>>> and it will drive the pin high again without any delays.
>>>>>>
>>>>>> The question here is not about how long the hard reset is applied, but
>>>>>> whether or not the sensor's power-on sequence is followed. Currently it is
>>>>>> not.
>>>>>
>>>>> Right / agreed. The 2 points which I am trying to make are:
>>>>>
>>>>> 1. This is a pre-existing problem unrelated to this patch.
>>>>>
>>>>> So this should be fixed in a separate patch.
>>>>>
>>>>> 2. That separate patch should put a delay after requesting the GPIO
>>>>> to enforce that it is (logically) low (for "enable") for a minimum
>>>>> amount of time.
>>>>
>>>> Sakari, what's the status on this, please?
>>>> We have non-working camera just because of this small patch is absent.
>>>
>>> Thanks for the ping.
>>>
>>> I took a closer look at the problem, indeed the GPIO name comes from the
>>> int3472 driver and it's much better to work around this there than to ram
>>> Windows ACPI table specifics to sensor drivers. I'll post a patch for that
>>> shortly. Testing would be appreciated as the Surface Go 2 doesn't have a
>>> GPIO connected to this sensor.
>>
>> Actually Andy wrote this patch after first writing a similar quirk patch
>> as yours from:
>>
>> https://lore.kernel.org/platform-driver-x86/1cf93f61-9285-f2fe-fb92-8fb8a3f44201@linux.intel.com/T/#t
>>
>> because I asked him to fix this in the sensor driver instead.
>>
>> The problem is that we cannot fix this in the INT3472 driver without
>> that becoming one big mess of driver specific quirks.
>>
>> The Windows code seems to have separate power-ctrl/sequence drivers
>> for the INT3472 device vs the rest of the sensor driver and this
>> power-sequence driver happily consumes whatever GPIOs the INT3472
>> device provides independent of the sensor.
>>
>> So e.g. on some designs we are going to see a reset pin and on others
>> a powerdown pin.
>>
>> But in this specific case things are actually more simple,
>> the datasheet describes the pin as:
>>
>> XSHUTDOWN input reset (active low with internal pull down resistor)
>>
>> So the devicetree binding calling it "enable" is just wrong and in
>> this case it is actually the DT binding which is buggy (there is no
>> "enable" pin anywhere in the datasheet) and not the ACPI tables.
> 
> There has never been a requirement for the GPIO in DT to match the pin
> name from the datasheet. It's actually quite the contrary, DT
> maintainers request GPIO names to be standardized. Using
> "xshutdown-gpios" wouldn't be appreciated, instead DT bindings are
> encouraged to use standard names such as "reset", "enable" and
> "powerdown". As the pin is called "XSHUTDOWN", "enable" is not
> necessarily a bad match. "reset" could have been picked too, but that
> wasn't the case and we can't change that.
> 
> The core of the issue here is that we have two firmware representations,
> DT and ACPI, and no coordination between the two. I don't expect that to
> change, and until Windows OEMs collaborate to standardize ACPI bindings,
> I'll consider this as a Windows-specific hack that I don't want to see
> being pushed to indidividual sensor drivers. This would be better
> handled in my opinion in the INT3472 driver.
> 
>> Also since you match on the sensor-type for the remapping this clearly
>> is a per sensor thing and per sensor handling should be in the sensor
>> drivers, which gives us the per sensor mapping for free.
>>
>> Yes needing to handle this in the sensor driver makes the sensor
>> driver slightly less pretty. But dealing with platform specifics
>> in drivers is done all over the kernel and I don't see why camera
>> sensor drivers are so special that they get to be excluded from
>> sometimes needing to deal with platform specifics.
> 
> The whole point of having standardized firmware descriptions is to avoid
> board-specific code in drivers. INT3472 is meant to handle board
> specificities.

The problem is that some issues are relatively easy to fix in a generic
manner in the driver's while they are quite hard to fix, requiring
per board/laptop-model enablement using DMI quirks in the platform
glue code.

A good example of this is this case from further down the thread:

On atomisp tablets there typically is a standard camera connector with both
reset and powerdown signals and the atomisp _DSM equivalent of the INT3472
GPIO map _DSM typically contains both signals. But on sensors with only
1 reset pin it is unclear which of the 2 is actually used. One model
camera module with sensor X may connect the sensor's single pin to
the powerdown signal on the standard camera connector, while another
camera module may use the reset signal on the standard connector.

There are 2 ways to handle this:

1. Make the driver deal with the fact that there may be 2 GPIOs,
treating both as optional and driving both low/high at the same time
since only 1 will actually be used. This is somewhat ugly on the driver
side, but then fixes things for all tablets/laptops out there using
this sensor model.

2. Make this the platform glue's problem and require the platform code
to have per laptop/tablet model quirks using DMI matching meaning that
instead of things just working OOTB for models not added to the quirk
table, we now need users to report an issue and then manually fix
that for every model under the sun. Which is very much sub optimal.

See e.g.:

https://github.com/jwrdegoede/linux-sunxi/commit/e43be8f19b5913a2e4bd715e7eef88fd909a2d1d

(which I have not posted upstream yet since I don't have the mt9m114
driver working on atomisp models yet)

Dealing with this specific case at the glue code level requires per
laptop-model knowledge to map the right one of the 2 pins to "reset"
which means needing to manually add a quirk every time we learn
about a new model and perhaps more importantly this means things
not workin OOTB until we add such a quirk.

When working on the UVC driver you sometimes ask / wonder what
does Windows do here?   In this case it is pretty clear that
Window simply sets all GPIOs listed in the INT3472 ACPI resources/
the DSM call describing the GPIOs to their "on" state when
the sensor needs to be turned on.

Since we don't have the sensor-power-sequencing part split of
from the rest of the sensor driver code as Windows appears to
have, we need to at least be able to mimick Windows to get
things to "just work" which in some cases means driving 2 GPIOs
even if the sensor really only has one enable/reset input.

I'm most interested in how we can solve the mentioned mt9m114
example here, since that is a case where per model DMI
quirks will be necessary for a glue level solution, where as
a sensor-driver level solution will solve this once for all
models with that sensor.

Also drivers/media/i2c so far is quite unique in trying to
completely avoid any ACPI platform specific handling. Almost
all other driver subsystems I have worked in have various
platform specific code-paths, sometimes for device-tree
specific things and sometimes for ACPI specific things, e.g. :

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/input/touchscreen/goodix.c#n811

but that is just one example out of many. Although I understand
that it is desirable to keep platform specific code out of
the sensor drivers we also need to be pragmatic here IMHO.

Regards,

Hans




