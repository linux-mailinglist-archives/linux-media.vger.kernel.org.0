Return-Path: <linux-media+bounces-29053-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 74190A7661D
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 14:36:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E91616B42F
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 12:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDA411E5B72;
	Mon, 31 Mar 2025 12:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="1Kt6EFTy"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD122AEFB;
	Mon, 31 Mar 2025 12:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743424554; cv=none; b=lqRGJm6UOHNqWhE/5C8POdzL5b8s08T8LpSrfGhMJftwCux7SGbMMxJerOHjfWtFxh/6gsg5iQw/KaSA+umc77t9WNuA8jGnm7qBwT9S6RM9JRUsojs7F1rGVRUZok+UlGEWOM3H0/52umbG0GA+mT/e5fu+irEV53H451pIGFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743424554; c=relaxed/simple;
	bh=3/t1iCg1+6GJDxjqoMTxXMUAYXyD0gbKLUeMXXAnNWo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FnUSugBY5qE21dJehBnE5GWaUaWHs9ZcXUEnWoi1ZACYyzlyHaq11hhE6QmNIVI8pwRmOSAh/AzsSGLqXqX+MgAbaqIzTDyDYCbbWptCgQ+O8n+o1iF9YbZ02eY2aKznIZ6O9CrUYLJMP9HgLo6LmAgbNANrud6KeFY15NIIzK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=1Kt6EFTy; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VBdmvv032351;
	Mon, 31 Mar 2025 14:35:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	w87q9PnJmB9peQep5J2CgPni283zIpSSEYxQSxlcnXM=; b=1Kt6EFTy/c8tNYnw
	Voam4b1ywVqa2EhNWslKjE08YwmkWvgnkmlpQK0QVJu3RLZlVGOjei3kIYJWhWLF
	poDp1n5Zl8gGmYhVzxbGGOBll5P11pGDB5sgfsaIZVMhzvRJdchJB3bZEcc622gE
	dczCY8yLa2Vy8jQEHmDQ3j9UYz3zse8ua1gPNxNqLoYjbE7OwNzio13hiPKNNori
	pKhazDU20IhEDM+aFjcAg3Jafh8lZAWXehCNRiMc5i/tTjhI8ssaKu/ktU3vnlNf
	oQ2PE2XDi3/i8BNeMp5yz3hTyqiMOCI0LUmC0NQlL2Au1vpdfi3cdhMSfTqGoBhY
	F4wVaQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45pua7nkjx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Mar 2025 14:35:32 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4352340044;
	Mon, 31 Mar 2025 14:34:43 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 44495898276;
	Mon, 31 Mar 2025 14:34:06 +0200 (CEST)
Received: from [10.130.73.167] (10.130.73.167) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 31 Mar
 2025 14:34:05 +0200
Message-ID: <e00973c9-3817-415f-a724-faed0728cf5d@foss.st.com>
Date: Mon, 31 Mar 2025 14:34:05 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: dt-bindings: Add ST VD55G1 camera sensor
 binding
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Sylvain Petinot
	<sylvain.petinot@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus
	<sakari.ailus@linux.intel.com>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250328-b4-vd55g1-v1-0-8d16b4a79f29@foss.st.com>
 <20250328-b4-vd55g1-v1-1-8d16b4a79f29@foss.st.com>
 <5c7b41bb-8e4e-44b2-9fd6-b5dd9258ee4e@kernel.org>
Content-Language: en-US
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <5c7b41bb-8e4e-44b2-9fd6-b5dd9258ee4e@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_05,2025-03-27_02,2024-11-22_01

Hi Krzysztof,

Thank you for your review. Consider everything done for V2.

On 3/29/25 06:42, Krzysztof Kozlowski wrote:
> On 28/03/2025 14:40, Benjamin Mugnier wrote:
>> +
>> +allOf:
>> +  - $ref: /schemas/media/video-interface-devices.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: st,st-vd55g1
> 
> Drop st. See your filename how this should be called. Anyway, filename
> must match the compatible.
> 
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
>> +      List sensor's GPIOs used to control strobe light sources during exposure
>> +      time. The numbers identify the sensor pin on which the illumination
>> +      system is connected. GPIOs are active-high.
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 1
>> +    maxItems: 4
>> +    items:
>> +      minimum: 0
>> +      maximum: 3
>> +
>> +  port:
>> +    $ref: /schemas/graph.yaml#/$defs/port-base
>> +    additionalProperties: false
>> +
>> +    properties:
>> +      endpoint:
>> +        $ref: /schemas/media/video-interfaces.yaml#
>> +        unevaluatedProperties: false
>> +
>> +        properties:
>> +          data-lanes:
>> +            description:
>> +              VD55G1 only has one data lane, and must be 1.
>> +            maxItems: 1
>> +            items:
>> +              const: 1
> 
> Instead of five lines, just two:
> 
> items:
>   - const: 1
> 
> Don't repeat constraints in free form text.
> 
> 
>> +
>> +          link-frequencies:
>> +            maxItems: 1
>> +            items:
>> +              minimum: 125000000
>> +              maximum: 600000000
>> +
>> +          lane-polarities:
>> +            minItems: 1
>> +            maxItems: 2
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
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +
>> +    i2c {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        camera-sensor@10 {
>> +            compatible = "st,vd55g1";
> 
> And here another compatible...
> 
>> +            reg = <0x10>;
>> +
>> +            clocks = <&camera_clk_12M>;
>> +
>> +            vcore-supply = <&camera_vcore_v1v15>;
>> +            vddio-supply = <&camera_vddio_v1v8>;
>> +            vana-supply = <&camera_vana_v2v8>;
>> +
>> +            reset-gpios = <&gpio 5 GPIO_ACTIVE_LOW>;
>> +            st,leds = <2>;
>> +
>> +            orientation = <2>;
>> +            rotation = <0>;
>> +
>> +            port {
>> +                endpoint {
>> +                    data-lanes = <1>;
>> +                    link-frequencies = /bits/ 64 <600000000>;
>> +                    remote-endpoint = <&csiphy0_ep>;
>> +                };
>> +            };
>> +        };
>> +    };
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 2286200b355bde3604607be916ef09aa88feed0e..857af27ef392b6e6865d9a545061d1b012cce07e 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -22410,6 +22410,14 @@ S:	Maintained
>>  F:	Documentation/hwmon/stpddc60.rst
>>  F:	drivers/hwmon/pmbus/stpddc60.c
>>  
>> +ST VD55G1 DRIVER
>> +M:	Benjamin Mugnier <benjamin.mugnier@foss.st.com>
>> +M:	Sylvain Petinot <sylvain.petinot@foss.st.com>
>> +L:	linux-media@vger.kernel.org
>> +S:	Maintained
>> +T:	git git://linuxtv.org/media.git
> 
> Drop, unless you push patches there. Otherwise what is the point of
> duplicating subsystem data?
> 
>> +F:	Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
>> +
>>  ST VGXY61 DRIVER
>>  M:	Benjamin Mugnier <benjamin.mugnier@foss.st.com>
>>  M:	Sylvain Petinot <sylvain.petinot@foss.st.com>
>>
> 
> 
> Best regards,
> Krzysztof

-- 
Regards,
Benjamin

