Return-Path: <linux-media+bounces-12437-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D87A8D7DC9
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 10:48:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 878871F24E35
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 08:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AA0E823CA;
	Mon,  3 Jun 2024 08:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="4kzbDaM0"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB3681736;
	Mon,  3 Jun 2024 08:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717404428; cv=none; b=eTnFJVv2ATiu8XM9vvVZT9xLYoRZM4xVsHqfFkfHjrZJdaP0QSoFiMP0WXPICO/vKCRNurot0b6waxHj4mjYFTRyvFsJkvLak8/aPVQhIWr9fQOSmkX7O6j3QTjYwcwQioGO4rdTcbIIebinAQT2q3XhlFlPM8c9fsGYFMR4Qsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717404428; c=relaxed/simple;
	bh=4K7nj//IB95NQDmk7+1awX10JKPvXQq7j5HzT0K3WbU=;
	h=Message-ID:Date:MIME-Version:From:Subject:References:To:CC:
	 In-Reply-To:Content-Type; b=TDbDTBj1lNs0gMOpD9fp5r4tfMHQiPA2RsMysgNK72S6VvosFZGeXOUXqOKoTO70te2qZwBlW+8aZHhxdFdsBfaH4cRMKaKtLw8sKC32+Q5GhYbBtz0ws3ibaogg8n5mfujJJj0FCjSnkjZRXa/uYuwvjHislse0hLc9zwQXsY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=4kzbDaM0; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4537NAKD018951;
	Mon, 3 Jun 2024 10:46:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	Qpxf+Iz424T4bPUJD3hcBhowtB7icuKYhmMWW77VdPo=; b=4kzbDaM0+2uC2uZI
	BTWpc7oUUKZQE77opADNqTGdGRlpaILSkMcvEJXWPw5MwVHMGUsTx3Bwp9TTfj1w
	KZaQjY3mbh2XNMcuRanO+wdFT3f77WoavSS7XzuIVsQDCl2T/cCsoaMEOiSHR/6v
	fzNV8oDqX7mQ/8iJ646dsvFtsERKmnthnnWdb69TAesfhvG5CsOt0F2H6nS9exsF
	qtIJsJFWgT+KcfvpQLKx+SssFdzgaK63e3WjTWaDIqI2IO2GRWm4XTvaim++mRRU
	8+nFbtLPlRskj6EkRjJSm6mlPmy4/GxyS8TmkyYP27+lhb1oEbaaCswEz7qpl5Z+
	c8aiFw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ygd70kx77-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 10:46:56 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A651440046;
	Mon,  3 Jun 2024 10:46:51 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 05BE7214545;
	Mon,  3 Jun 2024 10:46:14 +0200 (CEST)
Received: from [10.131.140.24] (10.131.140.24) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 3 Jun
 2024 10:46:13 +0200
Message-ID: <832ab797-3852-4b30-a0b1-7ea9c85fdfa6@foss.st.com>
Date: Mon, 3 Jun 2024 10:46:12 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Sylvain Petinot <sylvain.petinot@foss.st.com>
Subject: Re: [PATCH v2 1/2] media: dt-bindings: Add ST VD56G3 camera sensor
 binding
References: <20240521162950.6987-1-sylvain.petinot@foss.st.com>
 <20240521162950.6987-2-sylvain.petinot@foss.st.com>
 <2110ba34-658e-4d60-b524-2f5ead6c8d3e@linaro.org>
 <77fa3ed3-2341-4106-adf2-ec8bd9de91ff@foss.st.com>
 <ceab83fe-b741-4f9e-8b0c-9de3ca79fc55@linaro.org>
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        <benjamin.mugnier@foss.st.com>, <mchehab@kernel.org>,
        <robh@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, Sakari Ailus
	<sakari.ailus@iki.fi>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
In-Reply-To: <ceab83fe-b741-4f9e-8b0c-9de3ca79fc55@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_05,2024-05-30_01,2024-05-17_01

Hello Krzysztof,


On 5/27/2024 9:00 PM, Krzysztof Kozlowski wrote:
> On 27/05/2024 15:14, Sylvain Petinot wrote:
>>>
>>>> Signed-off-by: Sylvain Petinot <sylvain.petinot@foss.st.com>
>>>> ---
>>>>  .../bindings/media/i2c/st,st-vd56g3.yaml      | 132 ++++++++++++++++++
>>>>  MAINTAINERS                                   |   9 ++
>>>>  2 files changed, 141 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/media/i2c/st,st-vd56g3.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/media/i2c/st,st-vd56g3.yaml b/Documentation/devicetree/bindings/media/i2c/st,st-vd56g3.yaml
>>>> new file mode 100644
>>>> index 000000000000..22cb2557e311
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/media/i2c/st,st-vd56g3.yaml
>>>
>>> Why duplicated 'st'?
>>
>> Legacy : our first st-mipid02 driver was upstream this way few years back.
>>
>> We have 3 options :
>>
>> 1- keep this unpleasant naming to keep consistency with st-mipid02 [1]
>> and st-vgxy61 [2]
> 
> ? Unpleasant?
> Please follow generic rules. Filename must match compatible and
> compatible must follow vendor,device format.
> 
>> 2- rename this driver properly ('vd56g3') and keep the two others the
>> old way (I personally don't like this option)
> 
> We do not talk about driver here. Does not matter.
> 
>> 3- rename this driver properly ('vd56g3') and in a second patch rename
>> the two others drivers.
>>
>> I would be interested to get Sakari's opinion on this subject.
> 
> About what? Renaming drivers?
> 
>>
>> [1]:
>> https://elixir.bootlin.com/linux/v6.9.1/source/drivers/media/i2c/st-mipid02.c
>>
>> [2]:
>> https://elixir.bootlin.com/linux/v6.9.1/source/drivers/media/i2c/st-vgxy61.c
> 
> Howe are these drivers anyhow related to the *binding*?

I got your point. bindings will be updated accordingly in V3 to follow
vendor,device format.

My point was more about consistency :
1- ensure driver name is aligned with the bindings name (without vendor
prefix)
2- ensure all ST image sensor drivers and bindings follow the same rules.
But, you're right, this is a out of bindings topic and I will handle it
separately.

> 
> 
> ...
> 
>>>> +
>>>> +  st,leds:
>>>> +    description:
>>>> +      Sensor's GPIOs used for external LED control. Signal being the enveloppe
>>>> +      of the integration time.
>>>
>>> More information is needed. GPIOs coming from LED or SoC? What's the
>>> meaning of values?
>>
>> The vd56g3 image sensor provides 8 GPIOS that can be used for different
>> use cases (external led controls, synchronization between master/slave
>> sensors, external sensor trigger, etc.). This submission supports only
>> the first use case: the control of one(or multiple) external LED.
> 
> What your driver supports is not really relevant. Describe hardware.
> 
>>
>> The vd56g3 sensor family are optimized for visible and near infrared
>> scenes. In NIR, external IR leds are generally used for illumination.
>>
>> With such use case, a led (or a led driver) can be connected directly to
>> one of the 8 GPIOs of the sensor. On the driver side, when a led is
>> configured in the dt, the driver will configure the sensor accordingly.
>> It will also offer an optional "V4L2_FLASH_LED_MODE_FLASH" control to
>> start/stop the external control.
>>
>> Different signal modes are supported by the HW, but the default
>> (implemented) one is a "strobe" mode where signal is the envelope of the
>> integration time (IR led is on while image sensor is integrating).
> 
> You did not explain the meaning of the property. Please describe the
> hardware and the meaning of values used in this property.
> 
> 

Sure, this was more contextual information. Please find below a proposal
for the "st,leds" property :

st,leds:
  description:
    List sensor's GPIOs used to control strobe light sources during exposure
    time. The numbers identify the sensor pin on which the illumination
system
    is connected. GPIOs are active-high.
  $ref: /schemas/types.yaml#/definitions/uint32-array
  minItems: 1
  maxItems: 8
  items:
    minimum: 0
    maximum: 7

> 
> Best regards,
> Krzysztof
> 

--
Sylvain

