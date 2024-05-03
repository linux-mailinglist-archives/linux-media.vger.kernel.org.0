Return-Path: <linux-media+bounces-10669-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9108BA8AB
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 10:25:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB13C283134
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 08:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B31971494DC;
	Fri,  3 May 2024 08:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="WhrGYaBe"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25791148840;
	Fri,  3 May 2024 08:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714724750; cv=none; b=C5aYGDAGQniJ4BcRjkNe9PqeYw5+45dQGJAhtww4TASHcE8oqyKhGtEXK5eV+P8GV22y6y4TpbFkcZiKptwSaq/ewmYMVRvpuUi9XE3w3ik0DzzOHwlxOxh3kWM5QgSUvrovCzLisQbrvXdjDg2+sMeQD4eR5FWCT1THADxAQW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714724750; c=relaxed/simple;
	bh=qY3LbjOuYFneOe+hmHooS9j9caKybr8SBiK6uP2RlX0=;
	h=Message-ID:Date:MIME-Version:From:Subject:References:To:CC:
	 In-Reply-To:Content-Type; b=DmaiI4clVgGpCuDTDlreXf3QKnZfuHd2BlhPHixzLcX9xiXmEBmQ93WLnFPLj07e05lcLPqV1S6zGRo+UTjxHeFAn/CcW/YnF2DfTTjB+cpdqO5upVxthfnUKhy6qhH0/G6l23cdKEoM26K+oU22MiRuYHg2iobF8SanD38V/eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=WhrGYaBe; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4437IxxI004602;
	Fri, 3 May 2024 10:25:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	message-id:date:mime-version:from:subject:references:to:cc
	:in-reply-to:content-type:content-transfer-encoding; s=
	selector1; bh=cCL9+CG98sH7iI8Z8nmO09eQOGyb/CAYHK5KGNx/K14=; b=Wh
	rGYaBe1gBEMhPdLhNe+dypmUX0CqsLQ9uU26z5EvW38cM3pp4Lq/j2ZaAUr8ynDR
	PoVM0PRc+2aXmvMqB2uhGxV9qoDRemvb51bHgFnS+PaOjfNL1wkA9NzUbrHrHBX6
	c8gqIYQEQK7fChXZ/jzEfImj4jNlvjtANgUTa90jfTXyxj8YtfjTB55rviPpDiSc
	GWYfgDnWy8nx4i4rlY9rRayVy8okBrpK45QATztBzkgu5WI2qmZGRov6zHanm/Aq
	30j66Eb5bF+5Gkl2VGAc660JKXW4o2YGo6YSiRQP7I1g+ZIgLVEPFjMR8RXPz2+Z
	NXDxYfy7sqW9dx/MKdxA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xrr8cyyu2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 May 2024 10:25:39 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A40BB40048;
	Fri,  3 May 2024 10:25:35 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CAB3F2115F3;
	Fri,  3 May 2024 10:25:07 +0200 (CEST)
Received: from [10.252.22.51] (10.252.22.51) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 3 May
 2024 10:25:07 +0200
Message-ID: <e38eeaab-f3dd-4129-86aa-9f6bb03bdc40@foss.st.com>
Date: Fri, 3 May 2024 10:25:06 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Sylvain Petinot <sylvain.petinot@foss.st.com>
Subject: Re: [PATCH 1/2] media: dt-bindings: Add ST VD56G3 camera sensor
 binding
References: <20240417133453.17406-1-sylvain.petinot@foss.st.com>
 <20240417133453.17406-2-sylvain.petinot@foss.st.com>
 <20240418130916.GA1016598-robh@kernel.org>
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
CC: <benjamin.mugnier@foss.st.com>, <mchehab@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
In-Reply-To: <20240418130916.GA1016598-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-03_05,2024-05-03_01,2023-05-22_02

Hi Rob,

Thanks for the review.

On 4/18/2024 3:09 PM, Rob Herring wrote:
> On Wed, Apr 17, 2024 at 03:34:52PM +0200, Sylvain Petinot wrote:
>> Add devicetree bindings Documentation for ST VD56G3 & ST VD66GY camera
>> sensors. Update MAINTAINERS file.
>>
>> Signed-off-by: Sylvain Petinot <sylvain.petinot@foss.st.com>
>> ---
>>  .../bindings/media/i2c/st,st-vd56g3.yaml      | 143 ++++++++++++++++++
>>  MAINTAINERS                                   |   9 ++
>>  2 files changed, 152 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/media/i2c/st,st-vd56g3.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/media/i2c/st,st-vd56g3.yaml b/Documentation/devicetree/bindings/media/i2c/st,st-vd56g3.yaml
>> new file mode 100644
>> index 000000000000..6792c02fea5c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/i2c/st,st-vd56g3.yaml
>> @@ -0,0 +1,143 @@
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
>> +  with an active array size of 1124 x 1364 (portrait orientation).
>> +  It is programmable through I2C, the address is fixed to 0x10.
>> +  The sensor output is available via CSI-2, which is configured as either 1 or
>> +  2 data lanes.
>> +  The sensor provides 8 GPIOS that can be used for either
>> +    - frame synchronization (Master: out-sync or Slave: in-sync)
>> +    - external LED signal (synchronized with sensor integration periods)
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
>> +  VCORE-supply:
> 
> Convention is lowercase.

Ok, updated for V2.

> 
>> +    description: Digital core power supply (1.15V)
>> +
>> +  VDDIO-supply:
>> +    description: Digital IO power supply (1.8V)
>> +
>> +  VANA-supply:
>> +    description: Analog power supply (2.8V)
>> +
>> +  reset-gpios:
>> +    description: Sensor reset active low GPIO (XSHUTDOWN)
>> +    maxItems: 1
>> +
>> +  st,leds:
>> +    description:
>> +      Sensor's GPIOs used for external LED control.
>> +      Signal being the enveloppe of the integration time.
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 1
>> +    maxItems: 8
>> +    items:
>> +      minimum: 0
>> +      maximum: 7
>> +
>> +  port:
>> +    $ref: /schemas/graph.yaml#/$defs/port-base
>> +
>> +    properties:
>> +      endpoint:
>> +        $ref: /schemas/media/video-interfaces.yaml#
>> +        unevaluatedProperties: false
>> +
>> +        properties:
>> +          clock-lanes:
>> +            const: 0
> 
> If required and only 1 possible value, why does this need to be in DT?

Indeed... it probably serves no purpose.
I added it to be consistent with the data-lanes that can be
reordered/swapped. Will be dropped in V2.

> 
>> +
>> +          data-lanes:
>> +            minItems: 1
>> +            maxItems: 2
>> +            items:
>> +              enum: [1, 2]
>> +
>> +          link-frequencies:
>> +            minItems: 1
>> +            maxItems: 1
>> +            items:
>> +              enum: [402000000, 750000000]
>> +
>> +          lane-polarities:
>> +            minItems: 1
>> +            maxItems: 3
>> +            items:
>> +              enum: [0, 1]
> 
> video-interfaces.yaml already defines this constraint, so you just need 
> to define how many entries.

Ok, updated for V2.

> 
>> +            description: Any lane can be inverted or not.
>> +
>> +        required:
>> +          - clock-lanes
>> +          - data-lanes
>> +          - link-frequencies
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - VCORE-supply
>> +  - VDDIO-supply
>> +  - VANA-supply
>> +  - reset-gpios
>> +  - port
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +
>> +    i2c {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        vd56g3: camera-sensor@10 {
> 
> Drop unused labels.

Ok

> 
>> +            compatible = "st,st-vd56g3";
>> +            reg = <0x10>;
>> +
>> +            clocks = <&camera_clk_12M>;
>> +
>> +            VCORE-supply = <&camera_vcore_v1v15>;
>> +            VDDIO-supply = <&camera_vddio_v1v8>;
>> +            VANA-supply = <&camera_vana_v2v8>;
>> +
>> +            reset-gpios = <&gpio 5 GPIO_ACTIVE_LOW>;
>> +            st,leds = <6>;
>> +
>> +            port {
>> +                vd56g3_ep: endpoint {
>> +                    clock-lanes = <0>;
>> +                    data-lanes = <1 2>;
>> +                    link-frequencies =
>> +                      /bits/ 64 <402000000>;
>> +                    remote-endpoint = <&csiphy0_ep>;
>> +                };
>> +            };
>> +        };
>> +    };
>> +...
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 7c121493f43d..991e65627e18 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -20868,6 +20868,15 @@ S:	Maintained
>>  F:	Documentation/hwmon/stpddc60.rst
>>  F:	drivers/hwmon/pmbus/stpddc60.c
>>  
>> +ST VD56G3 DRIVER
>> +M:	Benjamin Mugnier <benjamin.mugnier@foss.st.com>
>> +M:	Sylvain Petinot <sylvain.petinot@foss.st.com>
>> +L:	linux-media@vger.kernel.org
>> +S:	Maintained
>> +T:	git git://linuxtv.org/media_tree.git
> 
> This should be covered by the media maintainer entry.

I'm really sorry but I don't see what you're referring to. Can you point
me to the correct direction please ?

> 
>> +F:	Documentation/devicetree/bindings/media/i2c/st,st-vd56g3.yaml
>> +F:	drivers/media/i2c/st-vd56g3.c
>> +
>>  ST VGXY61 DRIVER
>>  M:	Benjamin Mugnier <benjamin.mugnier@foss.st.com>
>>  M:	Sylvain Petinot <sylvain.petinot@foss.st.com>
>> -- 
>> 2.17.1
>>

--
Sylvain

