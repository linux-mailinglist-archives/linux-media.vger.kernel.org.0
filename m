Return-Path: <linux-media+bounces-21247-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC759C3B47
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2024 10:47:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 419CE1C21696
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2024 09:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76D551714C8;
	Mon, 11 Nov 2024 09:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Kd9K5xfV"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB94155342
	for <linux-media@vger.kernel.org>; Mon, 11 Nov 2024 09:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731318399; cv=none; b=C/NG4ngqh6BeuiVbWY1+Nqq/BxSsfW64rO0vnZ2Ev/JmoB2IqZ8rbO65BkQSRwI3FpqoPmDy4nxwzjHHCVfFNBgW0y9YwTPl1W+UqnGclAvNnRwdiEei6uacSLMJVuwin122y1Six/IdYtvIKw5ShVfvnJiotz9n+6kdidHFp4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731318399; c=relaxed/simple;
	bh=w920tSfB0M075as5TYxc4W+nRALAsTg7M4Tx8ZBYXlM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kF4ROIQo/k3scm63CWqBfDsZ1R3qjBnt7Ux/HcKwP3P2AB6hcVKN9YMLRlkG01nVo9Y/8/oZRPUpzwJy3voegCUL5J/3F70Oxew1sV7YixFXO3gqKS2VV0SMYwhq8n6HtADWgAGdFWNp4i0uGQMFDvVg0SjIwFxV4l6RURVTous=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Kd9K5xfV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731318396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=62GSbDvUL0zOMpHftPm6BKPDBc/cKDzWGTr8CdJHqeQ=;
	b=Kd9K5xfVFaTJTPdGXZyVV5XVD5bQuWS7bpmpZbO5pYh+uF9pp/PC2udoPLn5gvc3MyWnW1
	4trfGTOVl5f9xOv4vrManK5KNqrcoowo96SHcAft19DP0CGypKg3Ip0BWMFVoQpQMi78iH
	eqaREwJUlgy60JwIA794OCtEsku0uik=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-164-p2y28U6xOMKXjIaKKMjZdA-1; Mon, 11 Nov 2024 04:46:35 -0500
X-MC-Unique: p2y28U6xOMKXjIaKKMjZdA-1
X-Mimecast-MFC-AGG-ID: p2y28U6xOMKXjIaKKMjZdA
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a9a01cba9f7so341447466b.3
        for <linux-media@vger.kernel.org>; Mon, 11 Nov 2024 01:46:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731318394; x=1731923194;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=62GSbDvUL0zOMpHftPm6BKPDBc/cKDzWGTr8CdJHqeQ=;
        b=jF+weKl8QdBw/Xr8qGQCdU6F30hQiykS4hqzlWqDYAVkMFWdJ2w6Y3aCBq5d5zSO/l
         NFni3g7zbFq/inximoKzBdRlPdWNnwyP3sDkk5bYf5H4orcxS5t6mrLCR+SuGemKr7Er
         yUwk3d2yU+A2Cbn/d3LquSQSGRoM35/pwNrjJ2N2J8yjq7cyNjsIBwUR/O34mMnzT4Ss
         cZYCsiBSkJfZ/11llmlXVSpHcnWu+X4UWsK6l1mKQnS5ht33qNp0isSGRe/BVXmTFHQY
         jysFgUMhxvzeb+kiNOWrAR3HIAXinwG/4KzMCjWU2HzUNjyxMSMRJXbM4bYXrs479nH0
         TRMw==
X-Forwarded-Encrypted: i=1; AJvYcCVk9GbWDoNEsACbOplLO7Z3VaaYQHXGRwCtr9+sg4wJDVoYL8PriZrPVaTKQsNBSRbiqPsFCoyUSmlARw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzXgh6ScU7uHPDGuQ6ZRuDwlK8je1BWaNrwryzrz1na/DWCwOY
	YtDzqoQuiRdydJMw6Wmj1Qp/6KkkY9x34hQRjM32doUKywo8JwPyUu2vPuL4v1tz0o5DgTn+fj3
	feeCrHh0H0atm0UekxvFRyZw8NjSjDqxDleBn2feYySupWckCDpz/tlvCJmYt
X-Received: by 2002:a17:907:94ca:b0:a99:2ab0:d973 with SMTP id a640c23a62f3a-a9ef001b427mr1268844866b.55.1731318394108;
        Mon, 11 Nov 2024 01:46:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFoMiWttuHvhIkKbgxZGj6GDKOKya83rJOg8cvtcHZgwwiRdP5umpQQXdpMqR/iJ/UXIQKO5A==
X-Received: by 2002:a17:907:94ca:b0:a99:2ab0:d973 with SMTP id a640c23a62f3a-a9ef001b427mr1268841566b.55.1731318393695;
        Mon, 11 Nov 2024 01:46:33 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0a4e1desm566629466b.81.2024.11.11.01.46.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 01:46:33 -0800 (PST)
Message-ID: <20b988cb-603a-4c1f-8a6e-76a4cb98baa0@redhat.com>
Date: Mon, 11 Nov 2024 10:46:32 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] media: ov7251: Remap "reset" to "enable" for
 OV7251
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20241108145024.1490536-1-andriy.shevchenko@linux.intel.com>
 <Zy43D7wAZLrBDtiX@kekkonen.localdomain> <Zy48Fc_nUceCs3PK@smile.fi.intel.com>
 <Zy4_hR9AsDhmK5MK@kekkonen.localdomain>
 <2957d1f6-f846-4916-980d-4346bc2b9d64@redhat.com>
 <ZzG4ekFKe25Ws0D7@kekkonen.localdomain>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZzG4ekFKe25Ws0D7@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11-Nov-24 8:55 AM, Sakari Ailus wrote:
> Hi Hans,
> 
> On Fri, Nov 08, 2024 at 07:19:05PM +0100, Hans de Goede wrote:
>> Hi,
>>
>> On 8-Nov-24 5:42 PM, Sakari Ailus wrote:
>>> Hi Andy,
>>>
>>> On Fri, Nov 08, 2024 at 06:28:05PM +0200, Andy Shevchenko wrote:
>>>> On Fri, Nov 08, 2024 at 04:06:39PM +0000, Sakari Ailus wrote:
>>>>> On Fri, Nov 08, 2024 at 04:50:24PM +0200, Andy Shevchenko wrote:
>>>>>> The driver of OmniVision OV7251 expects "enable" pin instead of "reset".
>>>>>> Remap "reset" to "enable" and update polarity.
>>>>>>
>>>>>> In particular, the Linux kernel can't load the camera sensor
>>>>>> driver on Microsoft Surface Book without this change:
>>>>>>
>>>>>>  ov7251 i2c-INT347E:00: supply vdddo not found, using dummy regulator
>>>>>>  ov7251 i2c-INT347E:00: supply vddd not found, using dummy regulator
>>>>>>  ov7251 i2c-INT347E:00: supply vdda not found, using dummy regulator
>>>>>>  ov7251 i2c-INT347E:00: cannot get enable gpio
>>>>>>  ov7251 i2c-INT347E:00: probe with driver ov7251 failed with error -2
>>>>
>>>> ...
>>>>
>>>>> Should this be cc'd to stable? I guess it's not exactly a fix in the driver
>>>>> but a BIOS bug, but it can be worked around in the driver. :-)
>>>>
>>>> It's everything, but a BIOS bug, it's DT bug and whoever first introduced that
>>>> GPIO in the driver. Even in the DT present in kernel the pin was referred as
>>>
>>> How is that a DT (binding?) bug?
>>
>> Since it is not following the datasheet name for the pin,
>> it arguably is a DT binding bug
>>
>> But whatever, the whole discussion about if it is a bug and whose
>> bug it is is not useful. Since we cannot go back in time and change
>> the DT binding DT and ACPI are simply going to disagree on the name
>> and we will need something like this patch.
>>
>>>> CAM_RST_N, which is exactly how this patch names it.
>>>>
>>>> OTOH it's a fix to the driver that never worked for ACPI case, so there never
>>>> was a regression to fix.
>>>
>>> It probably worked just fine, just not with that Surface Book.
>>>
>>> The polarity of the enable gpio appears to be set wrong in devm_gpiod_get()
>>> call. I can post a patch but cannot test it.
>>
>> That is on purpose, at least the polarity if the devm_gpiod_get(..., "reset",
>> ...) is inverted from the existing one for "enable" because reset needs
>> to be inactive/disabled to enable the sensor.
>>
>>> Similarly, you should actually set the flags to GPIOD_OUT_HIGH as reset
>>> should be enabled here -- it's disabled only in power_on() as part of the
>>> power-on sequence.
>>
>> This seems to be a pre-existing bug in this driver, which currently
>> starts driving enable high, enabling the sensor at gpiod_get() time.
>>
>> Note that fixing this is tricky-ish, if the pin was already high at
>> gpiod_get() time then changing the gpiod_get() to drive it low
>> will result in it only being driven low for a very short time since
>> ov7251_set_power_on() will get called almost immediately after this
>> and it will drive the pin high again without any delays.
> 
> The question here is not about how long the hard reset is applied, but
> whether or not the sensor's power-on sequence is followed. Currently it is
> not.

Right / agreed. The 2 points which I am trying to make are:

1. This is a pre-existing problem unrelated to this patch.

So this should be fixed in a separate patch.

2. That separate patch should put a delay after requesting the GPIO
to enforce that it is (logically) low (for "enable") for a minimum
amount of time.

Regards,

Hans



