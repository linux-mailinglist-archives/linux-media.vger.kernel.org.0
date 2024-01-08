Return-Path: <linux-media+bounces-3326-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FA5826F7E
	for <lists+linux-media@lfdr.de>; Mon,  8 Jan 2024 14:17:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56688283E75
	for <lists+linux-media@lfdr.de>; Mon,  8 Jan 2024 13:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4976C41761;
	Mon,  8 Jan 2024 13:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="iniwHoRJ"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093B141752;
	Mon,  8 Jan 2024 13:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704719846;
	bh=0C+qk5jTczq4Or8P9y61UPP0JeZhz44a+u+12PaJMnI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iniwHoRJfjrKzH7K2sFtKyWgqyXkzcWZetnoxQvKlldrWEtnORg7vhxCvE/1Nimyw
	 gDr97X8ZENcD/WFocJA5Am2VGmTprc96Q/Y7JGTzH+PU9dmxKm9qWOraCv0qEvuQiq
	 A/u8ZPOf22ZDewk3BHFb8mioYAZpFvhynjszsIckIXzMRPMFxPwlF2e2p54n3B1hzK
	 lAQz88vK/Hfk2yn39BJmxAJdHMAgDbA5SMxTo7axj4Qm/fslfdGJYT9GOmr+a0PKzj
	 Mj4Lq99W3r3A7FdBA++96e4G+jfvOz/SACqHhX1Jjb9DD25x00FZGjzSYWBgnShV8a
	 +Rykhum5e3E0g==
Received: from [100.74.67.65] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C218D3782047;
	Mon,  8 Jan 2024 13:17:25 +0000 (UTC)
Message-ID: <0ddaae18-d34c-40f7-9109-23d71d9324d5@collabora.com>
Date: Mon, 8 Jan 2024 14:17:24 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: media: add Maxim MAX96714F GMSL2
 Deserializer
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org
Cc: kernel@collabora.com
References: <20231208143359.469049-1-julien.massot@collabora.com>
 <20231208143359.469049-2-julien.massot@collabora.com>
 <e7dd1964-76fa-42a2-a570-2148f439c850@kernel.org>
From: Julien Massot <julien.massot@collabora.com>
In-Reply-To: <e7dd1964-76fa-42a2-a570-2148f439c850@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Krzysztof,

Thanks for the review.

On 12/8/23 18:16, Krzysztof Kozlowski wrote:
> On 08/12/2023 15:33, Julien Massot wrote:
>> Add DT bindings for Maxim MAX96714F GMSL2 Deserializer.
>>
>> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> 
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC (and consider --no-git-fallback argument). It might
> happen, that command when run on an older kernel, gives you outdated
> entries. Therefore please be sure you base your patches on recent Linux
> kernel.
Will do

> 
> Limited review follows, as robot already pointed out issues.. >
>> ---
>>   .../bindings/media/i2c/maxim,max96714f.yaml   | 163 ++++++++++++++++++
>>   1 file changed, 163 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max96714f.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714f.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714f.yaml
>> new file mode 100644
>> index 000000000000..8a2a06e7e279
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714f.yaml
>> @@ -0,0 +1,163 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +# Copyright (C) 2023 Collabora Ltd.
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/i2c/maxim,max96714f.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: GMSL2 to CSI-2 Deserializer
>> +
>> +maintainers:
>> +  - Julien Massot <julien.massot@collabora.com>
>> +
>> +description: |
>> +  The MAX96714F deserializer converts GMSL2 serial inputs into MIPI
>> +  CSI-2 D-PHY or C-PHY formatted output. The device allows the GMSL2 link to
>> +  simultaneously transmit bidirectional control-channel data while forward
>> +  video transmissions are in progress. The MAX96714F can connect to one
>> +  remotely located serializer using industry-standard coax or STP
>> +  interconnects. The device cans operate in pixel or tunnel mode. In pixel mode
>> +  the MAX96714F can select individual video stream, while the tunnel mode forward all
>> +  the MIPI data received by the serializer.
>> +
>> +  The GMSL2 serial link operates at a fixed rate of 3Gbps in the
>> +  forward direction and 187.5Mbps in the reverse direction.
>> +
>> +properties:
>> +  compatible:
>> +    const: maxim,max96714f
>> +
>> +  reg:
>> +    description: I2C device address
> 
> Drop
Ok

> 
>> +    maxItems: 1
>> +
>> +  enable-gpios: true
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        unevaluatedProperties: false
>> +        description: GMSL Input
>> +        properties:
>> +          endpoint:
>> +            $ref: /schemas/media/video-interfaces.yaml#
>> +            unevaluatedProperties: false
>> +            description:
>> +              Endpoint for GMSL2-Link port.
>> +
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        unevaluatedProperties: false
>> +        description: CSI-2 Output
>> +
>> +        properties:
>> +          endpoint:
>> +            $ref: /schemas/media/video-interfaces.yaml#
>> +            unevaluatedProperties: false
>> +
>> +            properties:
>> +              data-lanes: true
>> +              bus-type:
>> +                enum:
>> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
>> +
>> +            required:
>> +              - data-lanes
>> +              - bus-type
>> +
>> +    required:
>> +      - port@1
>> +
>> +  i2c-gate:
>> +    $ref: /schemas/i2c/i2c-controller.yaml
>> +    unevaluatedProperties: false
>> +    description: |
>> +      The MAX96714 will pass through and forward the I2C requests from the
>> +      incoming I2C bus over the GMSL2 link. Therefore it supports an i2c-gate
>> +      subnode to configure a serializer.
>> +
>> +  port0-poc-supply:
>> +    description: Regulator providing Power over Coax for a particular port
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - ports
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +    #include <dt-bindings/media/video-interfaces.h>
>> +
>> +    main_i2c2 {
> 
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

Ok V3 will use generic node names.

> 
> 
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
> 
>> +            i2c-gate {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +
>> +                gmsl-serializer@40 {
>> +                    compatible = "maxim,max96717f";
>> +                    reg = <0x40>;
> 
> Not documented.
Ok I will re-post max96717f binding first and then the max96714f binding.


Thank you,

-- 
Julien Massot

