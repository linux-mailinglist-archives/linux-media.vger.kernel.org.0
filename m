Return-Path: <linux-media+bounces-11932-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0D08D010E
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 15:16:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 686E61F2461D
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 13:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D521D15DBC1;
	Mon, 27 May 2024 13:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="PWUcrWnw"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7542715ECE7;
	Mon, 27 May 2024 13:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716815738; cv=none; b=gGNZ1GuV9JSiQluH6q4k8kEDr5LTdVhfg500UQRE0q1P05JQlw+rRG9HJ5bkRdp2CjFoKiH8kxrzP0pSd7Ior3BmMG6v6yOgcrGADyh3nbYe05zRVmHPpDXQF/QOYMcx0kKDgptzGRECIgJaew9NzflXuOGO4fQBO+Cdjn70aXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716815738; c=relaxed/simple;
	bh=B8cYOtpeE0HUjZd9NR4Eg7T92wexYwy2k7m+8psPL18=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NSHT2VApfxO3F+OKQvhzbEyAKxGdOjxSSzY+nht5JyVk2FKP54bNAiNdeg3M0Flq4a/RV+tSrq+0Bbv7zvyY7DXaottuFy7xeMlif9H0yluEgcPAUuwJl+iAD/8gfLCH7Ipgjoev5R1JKEVvkA+SrnqMMoOoZN3Xp+q0VOvsFso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=PWUcrWnw; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44RCGrF3017304;
	Mon, 27 May 2024 15:15:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	6U3S0nhV1fvnOXy1Abo104qBpad6fsNBZGWtsNvzJD0=; b=PWUcrWnwrzPB4SX6
	I0yJEZrdYnIwZKHRTorsJQsiiUj34EB/DLx5GZzqH3WxpwDGGeO14cybCpBBljDs
	Cbvvz0wizV4skWlvNuqDHxMVuRFeBNMv8veRiqO4z5h03/OdqUwx/kNRdIhzaXSF
	RQJ9FZD66Q8EnqnnFtWApDiFwFefvDDWar1mILM0fY3PjRbQbCcUWIH22h9HzcfX
	oJkILm9FWFVunvlrhwDti+D6LSsZU+ITe5Al79DgskokmQV/FhN3GxaubWoaIIlR
	sRL/+Hh7tMZtPKWeQ6qu3WrlTXCc8MmDNDjZ4uDs/0pJMIXU1JM/LqiRVFZOr5Vh
	6yJEYw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yb9yj7e3r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 May 2024 15:15:20 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5B35C4002D;
	Mon, 27 May 2024 15:15:15 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4710A215BD5;
	Mon, 27 May 2024 15:14:37 +0200 (CEST)
Received: from [10.131.140.24] (10.131.140.24) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 27 May
 2024 15:14:36 +0200
Message-ID: <77fa3ed3-2341-4106-adf2-ec8bd9de91ff@foss.st.com>
Date: Mon, 27 May 2024 15:14:35 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] media: dt-bindings: Add ST VD56G3 camera sensor
 binding
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        <benjamin.mugnier@foss.st.com>, <mchehab@kernel.org>,
        <robh@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, Sakari Ailus
	<sakari.ailus@iki.fi>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240521162950.6987-1-sylvain.petinot@foss.st.com>
 <20240521162950.6987-2-sylvain.petinot@foss.st.com>
 <2110ba34-658e-4d60-b524-2f5ead6c8d3e@linaro.org>
Content-Language: en-US
From: Sylvain Petinot <sylvain.petinot@foss.st.com>
In-Reply-To: <2110ba34-658e-4d60-b524-2f5ead6c8d3e@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-27_02,2024-05-24_01,2024-05-17_01

Hi Krzysztof,

Thanks for the review.

On 5/21/2024 7:37 PM, Krzysztof Kozlowski wrote:
> On 21/05/2024 18:29, Sylvain Petinot wrote:
>> Add devicetree bindings Documentation for ST VD56G3 & ST VD66GY camera
>> sensors. Update MAINTAINERS file.
>>
> 
> A nit, subject: drop second/last, redundant "binding". The "dt-bindings"
> prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
> 

Ok, fixed in V3.

> 
>> Signed-off-by: Sylvain Petinot <sylvain.petinot@foss.st.com>
>> ---
>>  .../bindings/media/i2c/st,st-vd56g3.yaml      | 132 ++++++++++++++++++
>>  MAINTAINERS                                   |   9 ++
>>  2 files changed, 141 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/media/i2c/st,st-vd56g3.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/media/i2c/st,st-vd56g3.yaml b/Documentation/devicetree/bindings/media/i2c/st,st-vd56g3.yaml
>> new file mode 100644
>> index 000000000000..22cb2557e311
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/i2c/st,st-vd56g3.yaml
> 
> Why duplicated 'st'?

Legacy : our first st-mipid02 driver was upstream this way few years back.

We have 3 options :

1- keep this unpleasant naming to keep consistency with st-mipid02 [1]
and st-vgxy61 [2]
2- rename this driver properly ('vd56g3') and keep the two others the
old way (I personally don't like this option)
3- rename this driver properly ('vd56g3') and in a second patch rename
the two others drivers.

I would be interested to get Sakari's opinion on this subject.

[1]:
https://elixir.bootlin.com/linux/v6.9.1/source/drivers/media/i2c/st-mipid02.c

[2]:
https://elixir.bootlin.com/linux/v6.9.1/source/drivers/media/i2c/st-vgxy61.c

> 
>> @@ -0,0 +1,132 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +# Copyright (c) 2024 STMicroelectronics SA.
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/i2c/st,st-vd56g3.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: STMicroelectronics VD56G3 Global Shutter Image Sensor
>> +
>> +maintainers:
>> +  - Benjamin Mugnier <benjamin.mugnier@foss.st.com>
>> +  - Sylvain Petinot <sylvain.petinot@foss.st.com>
>> +
>> +description: |-
>> +  The STMicroelectronics VD56G3 is a 1.5 M pixel global shutter image sensor
> 
> This claims device is VD56G3, not ST-VD56G3.

Sure, linked with previous point.

> 
>> +  with an active array size of 1124 x 1364 (portrait orientation). It is
>> +  programmable through I2C, the address is fixed to 0x10. The sensor output is
>> +  available via CSI-2, which is configured as either 1 or 2 data lanes. The
>> +  sensor provides 8 GPIOS that can be used for external LED signal
>> +  (synchronized with sensor integration periods)
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - st,st-vd56g3
>> +      - st,st-vd66gy
>> +    description:
>> +      Two variants are availables; VD56G3 is a monochrome sensor while VD66GY
>> +      is a colour variant.
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  vcore-supply:
>> +    description: Digital core power supply (1.15V)
>> +
>> +  vddio-supply:
>> +    description: Digital IO power supply (1.8V)
>> +
>> +  vana-supply:
>> +    description: Analog power supply (2.8V)
>> +
>> +  reset-gpios:
>> +    description: Sensor reset active low GPIO (XSHUTDOWN)
>> +    maxItems: 1
>> +
>> +  st,leds:
>> +    description:
>> +      Sensor's GPIOs used for external LED control. Signal being the enveloppe
>> +      of the integration time.
> 
> More information is needed. GPIOs coming from LED or SoC? What's the
> meaning of values?

The vd56g3 image sensor provides 8 GPIOS that can be used for different
use cases (external led controls, synchronization between master/slave
sensors, external sensor trigger, etc.). This submission supports only
the first use case: the control of one(or multiple) external LED.

The vd56g3 sensor family are optimized for visible and near infrared
scenes. In NIR, external IR leds are generally used for illumination.

With such use case, a led (or a led driver) can be connected directly to
one of the 8 GPIOs of the sensor. On the driver side, when a led is
configured in the dt, the driver will configure the sensor accordingly.
It will also offer an optional "V4L2_FLASH_LED_MODE_FLASH" control to
start/stop the external control.

Different signal modes are supported by the HW, but the default
(implemented) one is a "strobe" mode where signal is the envelope of the
integration time (IR led is on while image sensor is integrating).

> 
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 1
>> +    maxItems: 8
>> +    items:
>> +      minimum: 0
>> +      maximum: 7
>> +
>> +  port:
>> +    $ref: /schemas/graph.yaml#/$defs/port-base
> 
> missing additionalProperties: false

Ok, fixed in V3.

> 
>> +
>> +    properties:
>> +      endpoint:
>> +        $ref: /schemas/media/video-interfaces.yaml#
>> +        unevaluatedProperties: false
>> +
>> +        properties:
>> +          data-lanes:
>> +            minItems: 1
>> +            maxItems: 2
>> +            items:
>> +              enum: [1, 2]
> 
> 
>> +
>> +          link-frequencies:
>> +            minItems: 1
> 
> maxItems is enough

Ok, fixed in V3.

> 
>> +            maxItems: 1
>> +            items:
>> +              enum: [402000000, 750000000]
>> +
>> +          lane-polarities:
>> +            minItems: 1
>> +            maxItems: 3
>> +            description: Any lane can be inverted or not.
>> +
>> +        required:
>> +          - data-lanes
>> +          - link-frequencies
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - vcore-supply
>> +  - vddio-supply
>> +  - vana-supply
>> +  - reset-gpios
>> +  - port
>> +
> 
> 
> Not a video-interface-device.yaml type of device?

Good point, something I'll consider in V3

> 
> Best regards,
> Krzysztof
> 

--
Sylvain

