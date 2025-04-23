Return-Path: <linux-media+bounces-30815-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96398A98DDF
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 16:50:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FCBC5A59AC
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 14:49:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4086D27FD54;
	Wed, 23 Apr 2025 14:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="kIny4gBU"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6070A280A32;
	Wed, 23 Apr 2025 14:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745419749; cv=none; b=kVC0SS5i2/QHeTmS+TCaBVgCxq+eN9SMs60xSgD28gnprvH0UKW7sz7du55PTMsTqzykc4mFkwdXo1sGeJa8CB6iYmsQRiYAfjakXHId6KZtM3oMnLJXrR7TT3DJgbWvW+hpFR3jr6W5TUq0+YEfKuLGXD3CgaOZK18YJ23gyq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745419749; c=relaxed/simple;
	bh=GkJyG9CjxMhdK7gBRuo+c/ctvQ4KTph0Y3Pv46e8L9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iEXXy9ggfmW2xT8GO0hdO2Y7LAfHmCckexH6/4Fd+gFxp0KPqh0KB8ErRM/xtTuls+MUME1BtPfpKkD+cNTf1WALXRHUZkdSB5VW9SPssCUN0FsJ6gSMdfU46xCNrvMJ2AGIiXr3p3ZTreoNVsNT6JDf73jjK8jfmFX+qBtjat0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=kIny4gBU; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAxx6M005349;
	Wed, 23 Apr 2025 16:48:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	djp0SJrJVey+yNcfBy7xqDCy+IeZ994xZIZT+SAeRRQ=; b=kIny4gBUxbHewjMU
	DLEl4Zx9N/sh8kOrwKyRoVD0G3WL3CA9Zq2uHSMnIeI7ycZjg16eLl+8a65UN49L
	eng8HjFDrAxX1KHcAtRa8+C6k7R98oalJ2jvNk9Iaw3xNg202713MjE1Y0jKAFMx
	zhyFOKwKaP7IITnR187Y6xUHp2QvPNUf5XcfQZqRZj0xqjfcjSMD1jpdFf5ZYjUS
	M9MPa5R2tOBTZhRsAtOurbpuct3ERm0YNdweJXRsr+y7Z0MCQzvzL6hr4NiWo6l3
	G8xvy8yIZpBSfUUtnkwo3cUBMnvqIFEtiw2iR7y/7eoR92O3L8SsJ6sHoCKTL/S2
	0YHhgg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 466jk3bukp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 16:48:55 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C2B9A40054;
	Wed, 23 Apr 2025 16:47:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 41FCFA400E8;
	Wed, 23 Apr 2025 16:47:13 +0200 (CEST)
Received: from [10.130.73.167] (10.130.73.167) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Apr
 2025 16:47:12 +0200
Message-ID: <68e1c909-d1ff-4ada-9072-ffa3ac8b5a47@foss.st.com>
Date: Wed, 23 Apr 2025 16:47:12 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] media: dt-bindings: Add ST VD55G1 camera sensor
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus
	<sakari.ailus@linux.intel.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250404-b4-vd55g1-v5-0-98f2f02eec59@foss.st.com>
 <20250404-b4-vd55g1-v5-1-98f2f02eec59@foss.st.com>
 <20250422131151.GA16823@pendragon.ideasonboard.com>
Content-Language: en-US
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20250422131151.GA16823@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01

Hi Laurent,

Thank you for your review.

On 4/22/25 15:11, Laurent Pinchart wrote:
> Hi Benjamin,
> 
> Thank you for the patch.
> 
> On Fri, Apr 04, 2025 at 04:50:51PM +0200, Benjamin Mugnier wrote:
>> Also update MAINTAINERS file accordingly.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
>> ---
>>  .../devicetree/bindings/media/i2c/st,vd55g1.yaml   | 132 +++++++++++++++++++++
>>  MAINTAINERS                                        |   7 ++
>>  2 files changed, 139 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml b/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..6b777f86790da4e5941ac1cad86dc1a5021f9f5b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
>> @@ -0,0 +1,132 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +# Copyright (c) 2025 STMicroelectronics SA.
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/i2c/st,vd55g1.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: STMicroelectronics VD55G1 Global Shutter Image Sensor
>> +
>> +maintainers:
>> +  - Benjamin Mugnier <benjamin.mugnier@foss.st.com>
>> +  - Sylvain Petinot <sylvain.petinot@foss.st.com>
>> +
>> +description: |-
>> + The STMicroelectronics VD55G1 is a global shutter image sensor with an active
>> + array size of 804H x 704V. It is programmable through I2C interface. The I2C
>> + address is fixed to 0x10.
> 
> If you intend for this block of text to be split in two paragraphs, it's
> missing a blank line here. Otherwise, it should be reflowed as a single
> paragraph.

Thanks, I'll add a blank line.

> 
>> + Image data is sent through MIPI CSI-2, which is configured as only 1 data
>> + lane. The sensor provides 4 GPIOS that can be used for external LED signal
>> + (synchronized with sensor integration periods).
>> +
>> +allOf:
>> +  - $ref: /schemas/media/video-interface-devices.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: st,vd55g1
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
> 
> If multiple GPIOs are specified, do they all serve the exact same
> purpose, or is there a need to differentiate them ?

The same purpose. All GPIOs mentioned in this list will be used for
illumination and will strobe the same way regardless of their id.

> 
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
>> +            items:
>> +              - const: 1
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
> 
> Does the sensor support non-continuous D-PHY clock ?

No it doesn't, continuous clock only.

> 
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
>> index 2286200b355bde3604607be916ef09aa88feed0e..4f5e9005063a157de69e81b10f8def9da9e6c04c 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -22410,6 +22410,13 @@ S:	Maintained
>>  F:	Documentation/hwmon/stpddc60.rst
>>  F:	drivers/hwmon/pmbus/stpddc60.c
>>  
>> +ST VD55G1 DRIVER
>> +M:	Benjamin Mugnier <benjamin.mugnier@foss.st.com>
>> +M:	Sylvain Petinot <sylvain.petinot@foss.st.com>
>> +L:	linux-media@vger.kernel.org
>> +S:	Maintained
>> +F:	Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
>> +
>>  ST VGXY61 DRIVER
>>  M:	Benjamin Mugnier <benjamin.mugnier@foss.st.com>
>>  M:	Sylvain Petinot <sylvain.petinot@foss.st.com>
> 

-- 
Regards,
Benjamin

