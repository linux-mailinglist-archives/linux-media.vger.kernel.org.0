Return-Path: <linux-media+bounces-42075-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF10CB4A55A
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 10:33:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B8E14E4E22
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 08:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B9E724BD04;
	Tue,  9 Sep 2025 08:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="ZMO1eSXg"
X-Original-To: linux-media@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8490A24728E;
	Tue,  9 Sep 2025 08:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757406765; cv=none; b=IF53w+A9aNInl2yWLGHzWIxgUwdnG6fJYXHU0pDOK8QAjD4UaB49RAgoafUADHv8S03mv3Wvo1I49MFVsHk1sPY2aGNoNManVBPMNjqJhvYLn6ufQHiLhI91plcGV6z2KiPxP8nHE7fdYn0/6JcXJSZeitHhv+Gfy6aE4tvAKyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757406765; c=relaxed/simple;
	bh=pM5dpLJ68zvYdmgTFMYPesYP2UfuiYQOL3U5MABggOs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DpFKST2eR65ZqFSlwYGSQulwXUThiJEkUaxU021aPwUlggMeRgAiZfCTjhLPsrKEXbRSYKLcFDHrs6SHW/JR25H5USbCsl7Locb5iE3mWoPDBhIkY3H7E32+8i1JLZiicGAN960dV1GJyb8GuavO/NsDC0EFbD9PoqkFuHRJNc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=ZMO1eSXg; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
	:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ymhLTOmvsj60mhAT0jeL59s88QrzoIS8036CDrPEKRA=; b=ZMO1eSXgPNZsMERT5izBCx132y
	geilEU1EYgEC3dEJXfd9hY/crVdb097qrtCedZNTWSiwirJ7Obbc6VQrVGBf0DOtj/DQIvJQ6lQE2
	g7jYeas+2cb2tAtSmKhtxbK7O9hHl/FDxfOqxjQ1sK2WfjjjXk9r4sRZsNl+xoDJ6MVM=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:59814 helo=[192.168.0.207])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1uvtm2-004XPb-Nj; Tue, 09 Sep 2025 10:32:23 +0200
Message-ID: <b2826079-7db5-4adf-9e2a-e372e977acf3@emfend.at>
Date: Tue, 9 Sep 2025 10:32:21 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] media: dt-bindings: i2c: add Himax HM1246 image
 sensor
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 bsp-development.geo@leica-geosystems.com
References: <20250526-hm1246-v2-0-6b882827a3a5@emfend.at>
 <20250526-hm1246-v2-1-6b882827a3a5@emfend.at>
 <aLq0jJtdaxIpN9CT@valkosipuli.retiisi.eu>
Content-Language: de-DE
From: Matthias Fend <matthias.fend@emfend.at>
In-Reply-To: <aLq0jJtdaxIpN9CT@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: 
X-Spam-Bar: 
X-Spam-Report: 

Hi Sakari,

Thanks for you feedback!

Am 05.09.2025 um 11:59 schrieb Sakari Ailus:
> Hi Matthias,
> 
> Thanks for the set.
> 
> On Mon, May 26, 2025 at 08:59:27AM +0200, Matthias Fend wrote:
>> Add YAML device tree binding for Himax HM1246 image sensor.
>>
>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
>> ---
>>   .../bindings/media/i2c/himax,hm1246.yaml           | 111 +++++++++++++++++++++
>>   1 file changed, 111 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/i2c/himax,hm1246.yaml b/Documentation/devicetree/bindings/media/i2c/himax,hm1246.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..8a67de7e3ffcaa9f1acfe443b1e36fffb79dbacf
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/i2c/himax,hm1246.yaml
>> @@ -0,0 +1,111 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +# Copyright 2025 Matthias Fend <matthias.fend@emfend.at>
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/i2c/himax,hm1246.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Himax HM1246-AWD 1/3.7-Inch megapixel SoC image sensor
>> +
>> +maintainers:
>> +  - Matthias Fend <matthias.fend@emfend.at>
>> +
>> +description:
>> +  The Himax HM1246-AWD is a 1/3.7-Inch CMOS image sensor SoC with an active
>> +  array size of 1296 x 976. It is programmable through an I2C interface and
>> +  connected via parallel bus.
>> +
>> +allOf:
>> +  - $ref: /schemas/media/video-interface-devices.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: himax,hm1246
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    description: Input reference clock (6 - 27 MHz)
>> +    maxItems: 1
>> +
>> +  reset-gpios:
>> +    description: Active low XSHUTDOWN pin
>> +    maxItems: 1
>> +
>> +  avdd-supply:
>> +    description: Power for analog circuit (3.0 - 3.6 V)
>> +
>> +  iovdd-supply:
>> +    description: Power for I/O circuit (1.7 - 3.6 V)
>> +
>> +  dvdd-supply:
>> +    description: Power for digital circuit (1.5 / 1.8 V)
>> +
>> +  port:
>> +    $ref: /schemas/graph.yaml#/$defs/port-base
>> +    additionalProperties: false
>> +    description: Parallel video output port
>> +
>> +    properties:
>> +      endpoint:
>> +        $ref: /schemas/media/video-interfaces.yaml#
>> +        unevaluatedProperties: false
>> +
>> +        properties:
>> +          bus-type:
>> +            const: 5
> 
> Does the device also support e.g. Bt.656? If not, you can drop this.

It is always a parallel interface. Okay, will remove it.
> 
> If the rest of the parallel interface parameter properties aren't
> mandatory, what are their default values?

The defaults are:
hsync-active: 1 (high)
vsync-active: 1 (high)
pclk-sample: 0 (falling)

Should I add the default values? The properties section of the endpoint 
would then look like this:

properties:
   hsync-active:
     default: 1

   vsync-active:
     default: 1

   pclk-sample:
     default: 0

> 
>> +
>> +        required:
>> +          - bus-type

Then I should probably remove that too?

>> +
>> +    required:
>> +      - endpoint
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - avdd-supply
>> +  - iovdd-supply
>> +  - dvdd-supply
>> +  - port
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +    #include <dt-bindings/media/video-interfaces.h>
>> +
>> +    i2c {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        sensor@24 {
>> +            compatible =  "himax,hm1246";
>> +            reg = <0x24>;
>> +
>> +            clocks = <&hm1246_clk>;
>> +
>> +            reset-gpios = <&gpio0 0 GPIO_ACTIVE_LOW>;
>> +
>> +            avdd-supply = <&hm1246_avdd>;
>> +            iovdd-supply = <&hm1246_iovdd>;
>> +            dvdd-supply = <&hm1246_dvdd>;
>> +
>> +            orientation = <2>;
> 
> It'd be nice to add macros for these in
> include/dt-bindings/media/video-interfaces.h .

True. However, since this is not specific to this sensor, I think it's 
something for a separate series.
Should I omit these properties in this example?

Thanks
  ~Matthias

> 
>> +            rotation = <0>;
>> +
>> +            port {
>> +                endpoint {
>> +                    remote-endpoint = <&isp_par_in>;
>> +                    bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
>> +                    bus-width = <10>;
>> +                    hsync-active = <1>; /* active high */
>> +                    vsync-active = <1>; /* active high */
>> +                    pclk-sample = <1>; /* sample on rising edge */
>> +                };
>> +            };
>> +        };
>> +    };
>>
> 


