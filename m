Return-Path: <linux-media+bounces-30185-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1710EA885D3
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 16:54:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFD801902AA2
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 14:41:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05DB12951AB;
	Mon, 14 Apr 2025 14:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WdTd4ISi"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB37294A1D
	for <linux-media@vger.kernel.org>; Mon, 14 Apr 2025 14:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744640658; cv=none; b=hR7PRql64azEp9TK442z9Kyfi0H+S3DBrv8FyvpXiVbwIk6kaRbftqQ4uluRNR4Azajlylxod7Rx/ef6X69xw6K3WyqQ5IzFAoDqxAsRUHx7XrH5AOOwSRo0HoNz0ZqtIY4qEFquhpT4mLGtkqtda9YIwJlAk8CocJQSHcTx+JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744640658; c=relaxed/simple;
	bh=R2ZHDL8FXUbBdHUJ64odJcYG2RLJ3EqbWrPbwLhljQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dJnokIZx6+WSh+nwx2lQrlhWq2a2O1Ot59Oc6nzYnAszFwzABu4SYIjEX8T3ZhSEa5YvT8Sf812uAjkoEiT+IvHevPblKCVTHhQuoeWfhpZdBagopsKB9VfD8CWoWv33FwJkC8EJwF/0AEwANscFMpVL7MOItxOWHh//wEvpFDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WdTd4ISi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744640655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eyHQV9D3ndlC1EmhDXZUhOdK5gmRE6u8+GD7BpKIRSc=;
	b=WdTd4ISiquF8WHR40qkzi1tWPXMzgRKI/V6oxXSsDQ4LU3Yi6adXWufTP8DEbwaxbuaJD0
	Y71yqV+QU//MdJUA7j8a0a8HNk9imNWFtYO4bky9eeIsx8d2T3NByOpG7iZes26/iRCv8o
	/Cq4pjQAYuEVypoAWaWirAp76/hagw8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-331-rPEjVEgxMC-TAz07oLiqGg-1; Mon, 14 Apr 2025 10:24:14 -0400
X-MC-Unique: rPEjVEgxMC-TAz07oLiqGg-1
X-Mimecast-MFC-AGG-ID: rPEjVEgxMC-TAz07oLiqGg_1744640653
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5e6a340f8c7so3919303a12.2
        for <linux-media@vger.kernel.org>; Mon, 14 Apr 2025 07:24:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744640653; x=1745245453;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eyHQV9D3ndlC1EmhDXZUhOdK5gmRE6u8+GD7BpKIRSc=;
        b=Fl/vW3BrtAB/UCWQlpVQbtlLthDHSmiuIXk4Okizu6I/4zyzrkcJUOC0RawfPClS1C
         y/NQznvugCFYtuAgFyYPDGAU9GOeo+LRWzFSuwmdV2/NeM3SEkP1OhcNPrvKA227XZa/
         7vepW6z8F8wWOEZ9zuaHh+7D7kthtKqYGvNPueaIaUFh/MgFgf+4fiLU6Xk+M9QnEaKf
         S9G56hZd6KnV6jiktBPMiz121T+Mz7vbhnTn1lHPYJ2rG9Vjofs3uyoVfdCGRZNLVVPU
         SnjstE7zIlJ1Rao8OVV5iu6RusTd0Rt8aEF3rRj7OSj2xVi95h4n7Q70NBJMlxcza/Ed
         S+6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVKQuLbgEHsN/kOFC2Z5L4RTTbqjYVhBNzinYSQKYnd4szI1+6+B0AeZPX5fZ49ZCnm2o1MrdugDSbZJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhSmbUqOkHeyhpjl9XhaiOXf+AR+ieCu5t6NoCFr5TkR77bkE8
	RSm9ho6L2B96g53UdBfskfsLq3ByDoIcg1QiRzPOqmyN4psop4Ttp3mmXeXEn40QeDwUUI19kZa
	lSl456xdnQyRQ+LzRhJXDy8rI5/hE260REdLcsau3jewHoubiQnEHcEmc57E/
X-Gm-Gg: ASbGncvELS3Hgnr34u5QZGwtETaJnZ17Kpt09VoXFQAVpkjHvrMhKs9L3xevuOTaVmd
	/etaHeCVVC7JS2ud/Eai0TzvOZ06ndS/B+1/rFVnoNsY2u265V36EDFuFvH3t3XddbMJdFNg482
	SYYi85YTR8wma/XLaeCaWJs/kVmS3Jagaa8e2dC3FWX4kW03VZr6QVYaVESVBJiicTrhD+QDTsy
	95hNjmXs2DDwTUE0FzSwN+X7ym6D1zsDfnxJYX715RbmdB1/sxo2lorUrQJO3VRaLucUJyFjnre
	rPp08MZmE5vbvFo=
X-Received: by 2002:a05:6402:520b:b0:5dc:6e27:e6e8 with SMTP id 4fb4d7f45d1cf-5f3700124ddmr9855175a12.24.1744640652931;
        Mon, 14 Apr 2025 07:24:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIpJN4VTzKjzoyWkgQjXzWIoTc364VWdEfTR/jxgrvJ5osK0Cw1ufNU1rs/OnQPNlWpkbZoQ==
X-Received: by 2002:a05:6402:520b:b0:5dc:6e27:e6e8 with SMTP id 4fb4d7f45d1cf-5f3700124ddmr9855131a12.24.1744640652494;
        Mon, 14 Apr 2025 07:24:12 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36f50569fsm5148952a12.52.2025.04.14.07.24.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 07:24:11 -0700 (PDT)
Message-ID: <ebceb201-9af9-4019-8150-8e72cc2a8930@redhat.com>
Date: Mon, 14 Apr 2025 16:24:11 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] platform/x86: int3472: add hpd pin support
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: "Yan, Dongcheng" <dongcheng.yan@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "Yan, Dongcheng" <dongcheng.yan@linux.intel.com>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 hverkuil@xs4all.nl, u.kleine-koenig@baylibre.com, ricardo.ribalda@gmail.com,
 bingbu.cao@linux.intel.com, hao.yao@intel.com
References: <Z_zDGYD1QXZYWwI9@smile.fi.intel.com>
 <d9cab351-4850-42c7-8fee-a9340d157ed9@linux.intel.com>
 <Z_zMMtUdJYpHuny7@smile.fi.intel.com>
 <f10f919e-7bdc-4a01-b131-41bdc9eb6573@intel.com>
 <01570d5d-0bdf-4192-a703-88854e9bcf78@redhat.com>
 <9dc86b0c-b63c-447d-aa2f-953fbccb1d27@redhat.com>
 <Z_z04jMiTg_xW-c2@kekkonen.localdomain>
 <518b1420-a356-4e4b-8422-c2689bc54794@redhat.com>
 <Z_0AX9sdwSAWhzTc@kekkonen.localdomain>
 <0e2306d7-3a07-45ad-958f-1039fb10a8cf@redhat.com>
 <Z_0FkADfsQLOdchI@kekkonen.localdomain>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Z_0FkADfsQLOdchI@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 14-Apr-25 14:54, Sakari Ailus wrote:
> Hi Hans,
> 
> On Mon, Apr 14, 2025 at 02:37:36PM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 14-Apr-25 14:32, Sakari Ailus wrote:
>>> Hi Hans,
>>>
>>> On Mon, Apr 14, 2025 at 02:21:56PM +0200, Hans de Goede wrote:
>>>> Hi Sakari,
>>>>
>>>> On 14-Apr-25 13:43, Sakari Ailus wrote:
>>>>> Hans, Dongcheng,
>>>>>
>>>>> On Mon, Apr 14, 2025 at 01:09:47PM +0200, Hans de Goede wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On 14-Apr-25 13:04, Hans de Goede wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> On 14-Apr-25 11:59, Yan, Dongcheng wrote:
>>>>>>>> Hi Andy and Hans,
>>>>>>>>
>>>>>>>> I found the description of lt6911uxe's GPIO in the spec:
>>>>>>>> GPIO5 is used as the interrupt signal (50ms low level) to inform SOC
>>>>>>>> start reading registers from 6911UXE;
>>>>>>>>
>>>>>>>> So setting the polarity as GPIO_ACTIVE_LOW is acceptable?
>>>>>>>
>>>>>>> Yes that is acceptable, thank you for looking this up.
>>>>>>
>>>>>> p.s.
>>>>>>
>>>>>> Note that setting GPIO_ACTIVE_LOW will invert the values returned
>>>>>> by gpiod_get_value(), so if the driver uses that you will need
>>>>>> to fix this in the driver.
>>>>>>
>>>>>> Hmm, thinking more about this, I just realized that this is an
>>>>>> input pin to the CPU, not an output pin like all other pins
>>>>>> described by the INT3472 device. I missed that as first.
>>>>>>
>>>>>> In that case using GPIO_LOOKUP_FLAGS_DEFAULT as before probably
>>>>>> makes the most sense. Please add a comment that this is an input
>>>>>> pin to the INT3472 patch and keep GPIO_LOOKUP_FLAGS_DEFAULT for
>>>>>> the next version.
>>>>>
>>>>> The GPIO_LOOKUP_FLAGS_DEFAULT is the "Linux default", not the hardware or
>>>>> firmware default so I don't think it's relevant in this context. There's a
>>>>> single non-GPIO bank driver using it, probably mistakenly.
>>>>>
>>>>> I'd also use GPIO_ACTIVE_LOW, for the reason Dongcheng pointed to above.
>>>>
>>>> The GPIO being interpreted as active-low is a thing specific to
>>>> the chip used though. Where as in the future the HPD pin type
>>>> in the INT3472 device might be used with other chips...
>>>>
>>>> Anyways either way is fine with me bu, as mentioned, using GPIO_ACTIVE_LOW
>>>> will invert the values returned by gpiod_get_value(), for which the driver
>>>> likely needs to be adjusted.
>>>
>>> The driver appears to ask for both IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING
>>> and it only uses the GPIO for an ISR so it doesn't seem to require driver
>>> changes IMO. Although this also seems to make the polarit irrelevant, at
>>> least for this driver.
>>
>> If the driver does not care about this I would prefer for the INT3472 code to
>> use GPIO_ACTIVE_HIGH to avoid the inverting behavior of GPIO_ACTIVE_LOW making 
>> things harder for other future drivers using the hpd pin through the INT3472
>> glue code.
> 
> I'm fine with that, too. (My main point was indeed
> GPIO_LOOKUP_FLAGS_DEFAULT doesn't seem to be a good fit here.)

Ok lets go with GPIO_ACTIVE_HIGH for the int3472/discrete.c changes then.

Regards,

Hans



