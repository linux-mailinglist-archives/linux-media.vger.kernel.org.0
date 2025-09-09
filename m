Return-Path: <linux-media+bounces-42122-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A29B50004
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 16:49:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C910E7A7202
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 14:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9232350D6C;
	Tue,  9 Sep 2025 14:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n/G8ON7X"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FB02DA75F;
	Tue,  9 Sep 2025 14:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757429334; cv=none; b=jGY+JLdFP0uhXo8xBdv4S86IZOqHkp4984rF19yPx7s8TqBcvDa/kHuPxax+WswDfWioGQIpDLDecNI2ksk8Cra9fIz/YgRDcVmrfR6ee05MmInRiLRVj/9FUmd65H11Y78zc7hzzhxa4S6SvrfYKlDfndRIET+r3BkyXfc+9Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757429334; c=relaxed/simple;
	bh=1he5lMmIOrXZENUj3C6Qi6jYmJXZHpJnlEqP8eH+yPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h3qf4D+ITn6wFOWXt7FQYkaCTBlfuEHmOzdKd2/LEsFQ0kGIH2wd1rmvIQEYhqnwTjpAT8tpnWX5rdwP2jQ5vNqiM9cYEwAr17MTe53pTrdFvxDCbwANOkrtkjB/7ARdNjKwpK57nFr73ihHzaP0ZxiDT4bARtGkUOxnSpqwefI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n/G8ON7X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EDF0C4CEF4;
	Tue,  9 Sep 2025 14:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757429333;
	bh=1he5lMmIOrXZENUj3C6Qi6jYmJXZHpJnlEqP8eH+yPI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=n/G8ON7Xphogw9Re/idOK/s7hKXy6Pccbg6YNNRt+QtGRjfXXXk0Xngr6n4kJe/1r
	 roN4gY1rMKWn9abC8c+f0Us4jfY6cs53mlYujoCVvyr/SH8GAE1thsM8BttdEEQ83K
	 aA/Hk4YVZQJGoNIvTmWv8O2HqnxZZLN0EXD+cygdRam3NQ71n0dJU06igHIHL5aMW5
	 UdQGMGRWDvN6u09WZXmRlLEl0NTI4w7vhbwb3Q5hc6gJ1dISYU6st0kivhUbbONaZG
	 tVdfN7kMrVGJtO7azs7MeVWqGmuZFAqfKoROgLifrg9xsdMcipYtV0Fhwb4XP2VvOu
	 2npaUWmc+U3oQ==
Message-ID: <bcdeb20c-3f4c-4eec-8f92-a098c4529778@kernel.org>
Date: Tue, 9 Sep 2025 16:48:47 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dt-bindings: leds: commonize leds property
To: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Rob Herring <robh@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
 Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250908-leds-v3-0-5944dc400668@vinarskis.com>
 <20250908-leds-v3-2-5944dc400668@vinarskis.com>
 <0e030e7d-0a1a-4a00-ba18-ed26107d07fa@oss.qualcomm.com>
 <046b289d-b6a5-45f9-88b1-090e2ab7c95d@kernel.org>
 <39b955b9-a152-458a-8e09-908efebaaccd@oss.qualcomm.com>
 <20250908222247.GA1943768-robh@kernel.org>
 <bde582df-9522-48ae-9d84-fa3751c4a06d@kernel.org>
 <FVT6YHf1Lshr9lndhkSNVDowe3ZXPE31ULuotmmZ-brY_kmVRVj8oONZfWqE41lBIJyx4joIVRoqxdv1B_xvfGByECvOtQVS0G8xXQuDrwY=@vinarskis.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <FVT6YHf1Lshr9lndhkSNVDowe3ZXPE31ULuotmmZ-brY_kmVRVj8oONZfWqE41lBIJyx4joIVRoqxdv1B_xvfGByECvOtQVS0G8xXQuDrwY=@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9-Sep-25 11:28 AM, Aleksandrs Vinarskis wrote:
> 
> 
> 
> 
> 
> On Tuesday, September 9th, 2025 at 11:21, Hans de Goede <hansg@kernel.org> wrote:
> 
>>
>>
>> Hi All,
>>
>> On 9-Sep-25 12:22 AM, Rob Herring wrote:
>>
>>> On Mon, Sep 08, 2025 at 09:36:39AM +0200, Konrad Dybcio wrote:
>>>
>>>> On 9/8/25 9:33 AM, Hans de Goede wrote:
>>>>
>>>>> Hi,
>>>>>
>>>>> On 8-Sep-25 09:20, Konrad Dybcio wrote:
>>>>>
>>>>>> On 9/8/25 1:18 AM, Aleksandrs Vinarskis wrote:
>>>>>>
>>>>>>> A number of existing schemas use 'leds' property to provide
>>>>>>> phandle-array of LED(s) to the consumer. Additionally, with the
>>>>>>> upcoming privacy-led support in device-tree, v4l2 subnode could be a
>>>>>>> LED consumer, meaning that all camera sensors should support 'leds'
>>>>>>> and 'led-names' property via common 'video-interface-devices.yaml'.
>>>>>>>
>>>>>>> To avoid dublication, commonize 'leds' property from existing schemas
>>>>>>> to newly introduced 'led-consumer.yaml'.
>>>>>>>
>>>>>>> Signed-off-by: Aleksandrs Vinarskis alex@vinarskis.com
>>>>>>> ---
>>>>>>
>>>>>> [...]
>>>>>>
>>>>>>> + leds:
>>>>>>> + minItems: 1
>>>>>>> + maxItems: 1
>>>>>>
>>>>>> My brain compiler suggests this will throw a warning (minItems should
>>>>>> be redundant in this case)
>>>>>>
>>>>>>> +
>>>>>>> + led-names:
>>>>>>> + enum:
>>>>>>> + - privacy-led
>>>>>>
>>>>>> Nit: "privacy" makes more sense without the suffix, as we inherently
>>>>>> know this is supposed to be an LED
>>>>>
>>>>> Note "privacy-led" as name is already used on the x86/ACPI side and
>>>>> the code consuming this will be shared.
>>>>>
>>>>> With that said if there is a strong preference for going with just
>>>>> "privacy" the x86 side can be adjusted since the provider-info is
>>>>> generated through a LED lookup table on the x86/ACPI side. So we can
>>>>> just modify both the lookup table generation as well as the already
>>>>> existing led_get(dev, "privacy-led") call to use just "privacy"
>>>>> without problems.
>>>>
>>>> In that case, it may be cleaner to just go with what we have today
>>>> (unless the dt maintainers have stronger opinions)
>>>
>>> Well, I do, but I guess it's fine. Please don't add the suffix on the
>>> rest and add a comment for why it's there.
>>
>>
>> As mentioned dropping the "-led" suffix is no big deal for the ACPI
>> side and if we don't want the suffix then IMHO we should just drop
>> it rather then making an exception here.
>>
>> Attached are 2 patches which drop the suffix on the ACPI side.
>>
>> If people agree with dropping the suffix I'll officially submit these
>> upstream.
> 
> Sounds like this is the preferred way. Could you please CC me when you
> submit it? I will then respin this series and indicate yours as
> dependency.

Done, including adding you to the Cc.

Regards,

Hans


