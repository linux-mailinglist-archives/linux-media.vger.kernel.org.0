Return-Path: <linux-media+bounces-28508-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCADA69D14
	for <lists+linux-media@lfdr.de>; Thu, 20 Mar 2025 01:15:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70ACE8A68D9
	for <lists+linux-media@lfdr.de>; Thu, 20 Mar 2025 00:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CCE22557C;
	Thu, 20 Mar 2025 00:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="JO0VTa3s"
X-Original-To: linux-media@vger.kernel.org
Received: from ixit.cz (ip-89-177-23-149.bb.vodafone.cz [89.177.23.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8975F12B73;
	Thu, 20 Mar 2025 00:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.177.23.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742429657; cv=none; b=u/KG94h4QAR0RuwW7wl/njyvTTEDmLPJjLOzxcESkjse1A+QOIViSpyWvRSqUAEb8+RHsTeY9GQRDwWIAVWGXdQIsVrGAFoHRfudTKs9xU6LRY6ctQhK+pBZoiZSVmowMmkW0tb3Thy22K4rObU6cBhJEfVXK3GKn5csaYSBjPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742429657; c=relaxed/simple;
	bh=Zv2ls7KoQMDvurCvt39mDEoOloXcGKm7QSI4WBIOOf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JO/mqwf9KSFipH0nJu5t90ZdQlWaKmLq3dPQZU9ZdC7PUz0+4WNvuAZiyn6ixy8orebAjvWZjm2HnC0pgWog3jV53J0+7+3quLUQhNOrJseealT1h/xXI6sfHfLvpR8x/4x/6DYlBjzB6h60fohtpiyk3sO7Lr4uZHCnjcXz5DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=JO0VTa3s; arc=none smtp.client-ip=89.177.23.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Received: from [10.0.0.228] (unknown [10.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 448C31615EC;
	Thu, 20 Mar 2025 01:14:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1742429644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=7qZ1HpNB2ZHlzsN9ROOWbhITIJbhiwqTH5F9w84T/s4=;
	b=JO0VTa3sw7zaYvmRNSRt6di4RphlccbjCzyDtX9E0D7va5HDnJRX+hMrVzTFFakf1igfYW
	6eYIU1Vy/7Fy12gRk3CokjAzbtaR8RYpfoeIKUEWAdao1FHTrFKsH9Q4Z3vuD98DUfudn1
	r67cQ8F+yd+u/yUDuWmmNjaYv3bMc50=
Message-ID: <622b1887-6738-41d6-a8a8-37690cc0c63e@ixit.cz>
Date: Thu, 20 Mar 2025 01:14:03 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: dt-bindings: Convert Analog Devices ad5820 to
 DT schema
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250314-b4-ad5820-dt-yaml-v2-1-287958c3c07c@ixit.cz>
 <Z9SYOCVxt70u_bad@kekkonen.localdomain>
 <ec820dbf-5a37-4477-a99d-f3fbe338c198@ixit.cz>
 <ih3ykzxrnpbwg4bvkmpoo2tashcxidir4r4zofhlvrs7udkp7o@6qtqh6wtmkwd>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <ih3ykzxrnpbwg4bvkmpoo2tashcxidir4r4zofhlvrs7udkp7o@6qtqh6wtmkwd>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/03/2025 16:49, Sebastian Reichel wrote:
> Hello,
> 
> On Sat, Mar 15, 2025 at 02:18:40PM +0100, David Heidelberg wrote:
>> On 14/03/2025 21:57, Sakari Ailus wrote:
>>> Thanks for converting this to YAML.
>>>
>>> On Fri, Mar 14, 2025 at 08:58:27PM +0100, David Heidelberg via B4 Relay wrote:
>>>> From: David Heidelberg <david@ixit.cz>
>>>>
>>>> Convert the Analog Devices ad5820 to DT schema format.
>>>>
>>>> Add the previously undocumented io-channel-cells property,
>>>> which can be omitted. If present, it must be set to 0,
>>>> as the device provides only one channel.
>>>
>>> What's the purpose of this property? The driver doesn't use it nor I think
>>> it provides any information on the hardware either. The above description
>>> also appears to be saying it's redundant.
>>
>> Hello Sakari,
>>
>> from my understanding, you're right.
>>
>> I would prefer to drop it, see [1].
>>
>> Anyway from reading of documentation I understood it may be right to have
>> the property empty, but also may be omitted. I saw both approaches in the
>> code.
>>
>> If you choose not liking this redudancy, I push [1] and drop the property
>> here.
>>
>> David
>>
>> [1] https://patchwork.kernel.org/project/linux-omap/patch/20250213203208.93316-1-david@ixit.cz/
> 
> Like all DT properties starting with #, this is not about hardware,
> but about parsing the device tree itself and used by core DT code:
> 
> $ git grep io-channels drivers/of/property.c
> drivers/of/property.c:DEFINE_SIMPLE_PROP(io_channels, "io-channels", "#io-channel-cells")
> 
> Have a look at the following example DT:
> 
> iio_device1: iio-provider1 {
>      #io-channel-cells = <2>;
> };
> 
> iio_device2: iio-provider2 {
>      #io-channel-cells = <1>;
> };
> 
> iio_device3: iio-provider3 {
>      #io-channel-cells = <0>;
> };
> 
> example-iio-user {
>      my-iio-reference = <&iio_device1 AREA0 CHANNEL2>, <&iio_device3>, <&iio_device2 CHAN0>;
> };
> 
> While you can easily understand that without the io-channel-cells,
> please have a look what it looks like after sending it through the
> DT compiler. You will get something like this:
> 
> iio-provider1 {
>      #io-channel-cells = <2>;
>      phandle = <23>;
> };
> 
> iio-provider2 {
>      #io-channel-cells = <1>;
>      phandle = <10>;
> };
> 
> iio-provider3 {
>      #io-channel-cells = <0>;
>      phandle = <37>;
> };
> 
> example-iio-user {
>      my-iio-reference = <23 42 13 37 10 0>;
> };
> 
> But you can safely drop it, when there are no references to the IIO
> device. So it's obviously not required in all cases.
> 
> I hope I could explain the purpose well enough :)

This looks like a very good explanation, it helped me a lot.

Any chance to sneak it into the docs somewhere?

David

> 
> Greetings,
> 
> -- Sebastian

-- 
David Heidelberg


