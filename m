Return-Path: <linux-media+bounces-21192-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E5B9C24C8
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 19:19:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C71EF28286B
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 18:19:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D17D1A9B56;
	Fri,  8 Nov 2024 18:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="URYbxPoC"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406CE233D6E
	for <linux-media@vger.kernel.org>; Fri,  8 Nov 2024 18:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731089954; cv=none; b=LwbMsgtB4eLwK1Kf90s4xI5oDcspn0HOe7tTcnIqwQYOVEj4LOJ6XMo41eTl/579RLHGAG1Wi40AreKJJadVgnPed8zlJwTbRmqQXUghaQqA5IZgcSXjLyWU91lz97gpFJBbJ7jGFE7GCADIHzpFUVRqrvub6IkehIih5fOQuGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731089954; c=relaxed/simple;
	bh=aD8D+4ng0E/F47a5g4wTG/QvG7PlR9J/BnbQFoQHKIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Osu9wqNihI3baSO4nXOTx5ESr9uyw42Ba5OENxkAVsVO/1+bI1yED3ulM7zGmQWFEh+ZXwqlMQ6PuWcq/QKfJWZRM+b0dWmzrEP3MXseJtJLV7qdTjfWHVv1zSm84YnXU0Pv5ue6xl+xvNcqq+/yYov14EEDQwQu/SOqzobTHZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=URYbxPoC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731089950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8BE+hJq4wivH5URFktHYmgMbquuiBfaa5EuFxhGnhm8=;
	b=URYbxPoCGHZWMGnRPlO/1thst93kF7VSR61CbHjeO5NhX/J2XtJL7iKwpt0Op8uhI/cCao
	ZbFFT2IqWvfYrQcNQS3m/Gr8/4a/Wk5WlAT/4ei3H0W7XFxKuW5aNlmSQJy1StGSpl9WOU
	KlD0+3qIeildU4X/X3NoNOoiaWUL9+U=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-542-HdsJIJl6P7mgGrMUYRZvsQ-1; Fri, 08 Nov 2024 13:19:09 -0500
X-MC-Unique: HdsJIJl6P7mgGrMUYRZvsQ-1
X-Mimecast-MFC-AGG-ID: HdsJIJl6P7mgGrMUYRZvsQ
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-539ebb5a10cso2623918e87.3
        for <linux-media@vger.kernel.org>; Fri, 08 Nov 2024 10:19:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731089947; x=1731694747;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8BE+hJq4wivH5URFktHYmgMbquuiBfaa5EuFxhGnhm8=;
        b=lx0Lm0bAtrQwja854hb0aHo2xPmOruzswBq5MQDU4dtLSxntWg7F/p9hOquxt2dAyC
         yinfjtcvMKaxMVgoBr7utU12+NgpraKGzNWr7XmACwLqSoLDiZlNqGUBFZfAUo/LbE+9
         ZxpgA1GhadSwUBdMzM8P+OgsWx41Ui1AiWtTFRE/xk3VEVHgCLSYBps3RGhHBlrlpIxc
         6BfAUxBA5CFwbqs2+R/xf5RpcATiPwfZ0CWNdU69/grEFk2F09uo/CtThYnEsIRRGkj4
         orU+4n2IYgHLz0nE1bdeysCslxvz9hXmXWcfQ5EE7NT0gWxzbdEWWlIV6lHcnuEFUJlX
         xhGw==
X-Gm-Message-State: AOJu0Yw1QHtadA6reb7xNS4Y4mrEelFE0Im/5F9gV9YTujzw21YAvHbG
	QA26G3ao5L6mcmITMGvWN+IeTzlDfY4hkxU9AmeH6VEKmNJxhKh1XivTqZDG7g6LucJzEu7o467
	pODNfNAiL58cOWHIzzxWrBi2mBEo7IoflQbmQe0/BPJ/cZtw1XsVn/HyGyaD8p84LHSl9
X-Received: by 2002:a2e:a995:0:b0:2fb:5206:1675 with SMTP id 38308e7fff4ca-2ff2028a9a5mr34288501fa.27.1731089946942;
        Fri, 08 Nov 2024 10:19:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFaBapJXyw0gGoHMy0oLhUG9TcdL5X+uu9R+OOqA85l2rjsKw3rZG35xPvySkupRobDfWMJtw==
X-Received: by 2002:a2e:a995:0:b0:2fb:5206:1675 with SMTP id 38308e7fff4ca-2ff2028a9a5mr34288221fa.27.1731089946386;
        Fri, 08 Nov 2024 10:19:06 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0a4bfa1sm264962766b.74.2024.11.08.10.19.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2024 10:19:05 -0800 (PST)
Message-ID: <2957d1f6-f846-4916-980d-4346bc2b9d64@redhat.com>
Date: Fri, 8 Nov 2024 19:19:05 +0100
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
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20241108145024.1490536-1-andriy.shevchenko@linux.intel.com>
 <Zy43D7wAZLrBDtiX@kekkonen.localdomain> <Zy48Fc_nUceCs3PK@smile.fi.intel.com>
 <Zy4_hR9AsDhmK5MK@kekkonen.localdomain>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Zy4_hR9AsDhmK5MK@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8-Nov-24 5:42 PM, Sakari Ailus wrote:
> Hi Andy,
> 
> On Fri, Nov 08, 2024 at 06:28:05PM +0200, Andy Shevchenko wrote:
>> On Fri, Nov 08, 2024 at 04:06:39PM +0000, Sakari Ailus wrote:
>>> On Fri, Nov 08, 2024 at 04:50:24PM +0200, Andy Shevchenko wrote:
>>>> The driver of OmniVision OV7251 expects "enable" pin instead of "reset".
>>>> Remap "reset" to "enable" and update polarity.
>>>>
>>>> In particular, the Linux kernel can't load the camera sensor
>>>> driver on Microsoft Surface Book without this change:
>>>>
>>>>  ov7251 i2c-INT347E:00: supply vdddo not found, using dummy regulator
>>>>  ov7251 i2c-INT347E:00: supply vddd not found, using dummy regulator
>>>>  ov7251 i2c-INT347E:00: supply vdda not found, using dummy regulator
>>>>  ov7251 i2c-INT347E:00: cannot get enable gpio
>>>>  ov7251 i2c-INT347E:00: probe with driver ov7251 failed with error -2
>>
>> ...
>>
>>> Should this be cc'd to stable? I guess it's not exactly a fix in the driver
>>> but a BIOS bug, but it can be worked around in the driver. :-)
>>
>> It's everything, but a BIOS bug, it's DT bug and whoever first introduced that
>> GPIO in the driver. Even in the DT present in kernel the pin was referred as
> 
> How is that a DT (binding?) bug?

Since it is not following the datasheet name for the pin,
it arguably is a DT binding bug

But whatever, the whole discussion about if it is a bug and whose
bug it is is not useful. Since we cannot go back in time and change
the DT binding DT and ACPI are simply going to disagree on the name
and we will need something like this patch.

>> CAM_RST_N, which is exactly how this patch names it.
>>
>> OTOH it's a fix to the driver that never worked for ACPI case, so there never
>> was a regression to fix.
> 
> It probably worked just fine, just not with that Surface Book.
> 
> The polarity of the enable gpio appears to be set wrong in devm_gpiod_get()
> call. I can post a patch but cannot test it.

That is on purpose, at least the polarity if the devm_gpiod_get(..., "reset",
...) is inverted from the existing one for "enable" because reset needs
to be inactive/disabled to enable the sensor.

> Similarly, you should actually set the flags to GPIOD_OUT_HIGH as reset
> should be enabled here -- it's disabled only in power_on() as part of the
> power-on sequence.

This seems to be a pre-existing bug in this driver, which currently
starts driving enable high, enabling the sensor at gpiod_get() time.

Note that fixing this is tricky-ish, if the pin was already high at
gpiod_get() time then changing the gpiod_get() to drive it low
will result in it only being driven low for a very short time since
ov7251_set_power_on() will get called almost immediately after this
and it will drive the pin high again without any delays.

So if the pin was already high then making it low at gpiod_get()
time will result in a very short spike to low, immediately followed
by the pin going high again. This short spike may very well leave
the sensor in a confused state rather then properly resetting it...

OTOH if the pin was already high with the old code where
gpiod_get("enable") requests the pin as high (so it is left high),
then the existing state of the sensor is simply preserved (no reset)
which should be fine for the initial probe which just checks
the id register.

And if the pin was low then it is driven high once and kept high,
so again no glitch / spike. So arguably the old code is fine.

If this is changed then a delay needs to be added to ensure that
the pin is guaranteed to be driven low for some minimum amount
of time.

Regards,

Hans




