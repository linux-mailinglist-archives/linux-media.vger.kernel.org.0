Return-Path: <linux-media+bounces-42080-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A3DB4A69D
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 11:06:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D895C174F89
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 09:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74DB92773DA;
	Tue,  9 Sep 2025 09:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YgpIdyA/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7951A4E70;
	Tue,  9 Sep 2025 09:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757408789; cv=none; b=VOsVJL1qR+8Z4/BvV0CMY7gRUOKUzgL75A9uW19W+qMi66Do3+/PoZn4l91+kSQAQ79rNDDRP19eFiFR1iA6PG6aq8f6f3PJwQzFbIRXlnG47K9nO+SvujdMA37LKzakQfwLv1b4WHSqKyKy7aj7rTvR2xTif6iADCrEwlPlAY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757408789; c=relaxed/simple;
	bh=7KHRyNXulEzV5xfA0DTLR93wZhedtS6U0W/OgCRxzTo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WTHeZrTL9rsbHgW3joBwov/tyAWHVvCpQQvcmHjkwv+WI3kvMA2qxfQsErKogAPG7HGRLmwk17wr4v5fgJXQ/i9IySiv7Giaf2Asi0/5xsRrRxaOdbdFmimzZ1duteiGyxrL2onl5hszwst9fKl1CV2YNmz0u9xBUWEWHYD084I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YgpIdyA/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0263CC4CEF5;
	Tue,  9 Sep 2025 09:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757408788;
	bh=7KHRyNXulEzV5xfA0DTLR93wZhedtS6U0W/OgCRxzTo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YgpIdyA/7SeKJXe88JKdL+8cKRhcsDkqKgcop6CyNabiQH1IoGUGWwnhISrzq+ATK
	 iw+a1kLwmrkdfoCl+Y3T4dFzQ8PiQC7YrA26Lp4HvdqoN2LU+n3Yoi0MtMBGjkeea2
	 ohKhJtF5gy9ML01DyQtxo78OqfDTX/OtsszEzisC5gbN6zhA4mh5be1PK6inzH7n/n
	 rmL1ylDc4WnEFZK9RumjHEvr/qFuHAbGJLE5xzf+fbRiKWYGDO4XzmzyUrtIezcjJc
	 1Iv9IyF4uuYyhVUnsSMAOlvNmC0VKCUpivKwootXbR+ghdD42K7rqLJ4UQPM4rTMvI
	 LhJpZ1LEvqxdw==
Message-ID: <98871c1b-7183-4a08-a5ea-9fa5c91c6777@kernel.org>
Date: Tue, 9 Sep 2025 11:06:21 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dt-bindings: leds: commonize leds property
To: Rob Herring <robh@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Aleksandrs Vinarskis <alex@vinarskis.com>, Lee Jones <lee@kernel.org>,
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
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20250908222247.GA1943768-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9-Sep-25 12:22 AM, Rob Herring wrote:
> On Mon, Sep 08, 2025 at 09:36:39AM +0200, Konrad Dybcio wrote:
>> On 9/8/25 9:33 AM, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 8-Sep-25 09:20, Konrad Dybcio wrote:
>>>> On 9/8/25 1:18 AM, Aleksandrs Vinarskis wrote:
>>>>> A number of existing schemas use 'leds' property to provide
>>>>> phandle-array of LED(s) to the consumer. Additionally, with the
>>>>> upcoming privacy-led support in device-tree, v4l2 subnode could be a
>>>>> LED consumer, meaning that all camera sensors should support 'leds'
>>>>> and 'led-names' property via common 'video-interface-devices.yaml'.
>>>>>
>>>>> To avoid dublication, commonize 'leds' property from existing schemas
>>>>> to newly introduced 'led-consumer.yaml'.
>>>>>
>>>>> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>>  
>>>>> +  leds:
>>>>> +    minItems: 1
>>>>> +    maxItems: 1
>>>>
>>>> My brain compiler suggests this will throw a warning (minItems should
>>>> be redundant in this case)
>>>>> +
>>>>> +  led-names:
>>>>> +    enum:
>>>>> +      - privacy-led
>>>>
>>>> Nit: "privacy" makes more sense without the suffix, as we inherently
>>>> know this is supposed to be an LED
>>>
>>> Note "privacy-led" as name is already used on the x86/ACPI side and
>>> the code consuming this will be shared.
>>>
>>> With that said if there is a strong preference for going with just
>>> "privacy" the x86 side can be adjusted since the provider-info is
>>> generated through a LED lookup table on the x86/ACPI side. So we can
>>> just modify both the lookup table generation as well as the already
>>> existing led_get(dev, "privacy-led") call to use just "privacy"
>>> without problems.
>>
>> In that case, it may be cleaner to just go with what we have today
>> (unless the dt maintainers have stronger opinions)
> 
> Well, I do, but I guess it's fine. Please don't add the suffix on the 
> rest and add a comment for why it's there.

Dropping the "-led" suffix on the ACPI side really is no big deal,
so if we don't want the suffix it is probably best to also drop
it for "privacy-led" rather then setting a bad example to be
copy and pasted.

Regards,

Hans



