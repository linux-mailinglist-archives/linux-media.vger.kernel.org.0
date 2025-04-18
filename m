Return-Path: <linux-media+bounces-30540-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8651A936B2
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 13:49:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 184E83BED84
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 11:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B53062741C5;
	Fri, 18 Apr 2025 11:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="GFiW2Fbm"
X-Original-To: linux-media@vger.kernel.org
Received: from ixit.cz (ip-89-177-23-149.bb.vodafone.cz [89.177.23.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFAF199947;
	Fri, 18 Apr 2025 11:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.177.23.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744976989; cv=none; b=dG8+MGUUshnpmnOXV+M5NokGmVsbuL/EgfoxZS5daaCxNn+/vkWrF2nshNUI7cG6DAM9ZY7HJAxVD/CXE7CXFVuXFYdeUkXsXbbsz51VVfkkU47GRSfAxzzDaheAih5dS4Zx3R5Z1UiyuvvDJHOgIATggt4oUgL3O5OEASVFaK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744976989; c=relaxed/simple;
	bh=0xqfItQyN6ROhVXcQYA8qrLVNEC/rcSRqgoktrpt8MA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S0yqynB5rSCqZASe1bLdNkD48Cd4evivhEq5XHvqGVjx0XDREnRrbw0LLQi0HXNMeSVlInepCGzqgw1VNyBsu/GdhO0lnqbJoDzqdqfLTVnHpzP65of7CWfKcr1Tfr8rajBC+RQMNZYQ70xXgkNPG5UDdELmP2V4fS33CdB0nSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=GFiW2Fbm; arc=none smtp.client-ip=89.177.23.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Received: from [10.0.0.185] (unknown [10.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id A5947166598;
	Fri, 18 Apr 2025 13:42:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1744976521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=5uRv3rAKMiUBBg+1+0mXz1mGMZQOP4uPKMKJVmKxbCQ=;
	b=GFiW2FbmlbicCZXJfrIJG7I75y49Jdzrt0L4YwIxh8auJP7c/Out8+Yz9zT9rKQOp46Lr1
	kcEAlTmznogxdB3SRadvHWJ0jMYLHBo0dSrRx68oUCVacjxfsIWQs44t35ye/Mxr6P6ucP
	r8aNwRixDO65HkQAbcgR5Ly8XbBKnRc=
Message-ID: <7ae72214-3f91-4bd7-b5f0-07391006f531@ixit.cz>
Date: Fri, 18 Apr 2025 13:42:01 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] media: dt-bindings: Convert Analog Devices ad5820 to
 DT schema
To: Rob Herring <robh@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Pavel Machek <pavel@ucw.cz>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250414-b4-ad5820-dt-yaml-v3-1-39bbb5db7b2b@ixit.cz>
 <20250415223557.GA940473-robh@kernel.org>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <20250415223557.GA940473-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/04/2025 00:35, Rob Herring wrote:
> On Mon, Apr 14, 2025 at 06:04:01PM +0200, David Heidelberg wrote:
>> Convert the Analog Devices ad5820 to DT schema format.
>>
>> Added the io-channel-cells property, because it's already used by the
> 
> You mean #io-channel-cells?
> 
>> Nokia N900 device-tree and defines ad5820 as having only single output.
>>
>> Acked-by: Pavel Machek <pavel@ucw.cz>
>> Signed-off-by: David Heidelberg <david@ixit.cz>
>> ---
>> Changes in v3:
>> - Removed documentation of io-channel-cells property. Now it's 1:1 to
>>    the original binding. The reference to it from the Nokia N900 dts
>>    was removed in the -next.
> 
> Added or removed? I'm confused.
> 
>> - Link to v2: https://lore.kernel.org/r/20250314-b4-ad5820-dt-yaml-v2-1-287958c3c07c@ixit.cz
>>
>> Changes in v2:
>> - added MAINTAINERS entry for the binding
>> - documented why io-channel-cells got added into the binding.
>> - dropped io-channel-cells in required properties.
>> - adjusted example indentation to 4 spaces.
>> - Link to v1: https://lore.kernel.org/r/20250209203940.159088-1-david@ixit.cz
>> ---
>>   .../devicetree/bindings/media/i2c/ad5820.txt       | 28 ----------
>>   .../devicetree/bindings/media/i2c/adi,ad5820.yaml  | 59 ++++++++++++++++++++++
>>   MAINTAINERS                                        |  1 +
>>   3 files changed, 60 insertions(+), 28 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/i2c/ad5820.txt b/Documentation/devicetree/bindings/media/i2c/ad5820.txt
>> deleted file mode 100644
>> index 5764cbedf9b73387ad1bfa9acf99c643f959b84a..0000000000000000000000000000000000000000
>> --- a/Documentation/devicetree/bindings/media/i2c/ad5820.txt
>> +++ /dev/null
>> @@ -1,28 +0,0 @@
>> -* Analog Devices AD5820 autofocus coil
>> -
>> -Required Properties:
>> -
>> -  - compatible: Must contain one of:
>> -		- "adi,ad5820"
>> -		- "adi,ad5821"
>> -		- "adi,ad5823"
>> -
>> -  - reg: I2C slave address
>> -
>> -  - VANA-supply: supply of voltage for VANA pin
>> -
>> -Optional properties:
>> -
>> -   - enable-gpios : GPIO spec for the XSHUTDOWN pin. The XSHUTDOWN signal is
>> -active low, a high level on the pin enables the device.
>> -
>> -Example:
>> -
>> -       ad5820: coil@c {
>> -               compatible = "adi,ad5820";
>> -               reg = <0x0c>;
>> -
>> -               VANA-supply = <&vaux4>;
>> -               enable-gpios = <&msmgpio 26 GPIO_ACTIVE_HIGH>;
>> -       };
>> -
>> diff --git a/Documentation/devicetree/bindings/media/i2c/adi,ad5820.yaml b/Documentation/devicetree/bindings/media/i2c/adi,ad5820.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..93349e7daf262fc8939f984fbe93cf064a0cbaf8
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/i2c/adi,ad5820.yaml
>> @@ -0,0 +1,59 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/i2c/adi,ad5820.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Analog Devices AD5820 autofocus coil
>> +
>> +maintainers:
>> +  - Pavel Machek <pavel@ucw.cz>
>> +
>> +description:
>> +  The AD5820 is a current sink driver designed for precise control of
>> +  voice coil motors (VCMs) in camera autofocus systems.
>> +
>> +allOf:
>> +  - $ref: /schemas/iio/iio.yaml#
> 
> You have the ref, so #io-channel-cells is allowed, but you need to say
> what the value for it should be for *this* binding. IOW, you still need
> to list it explicitly.

I considered to keep the previous and new binding 1:1 and drop 
#io-channel-chells with the all references to it (missed this one).

Would that be ok for v4?

> 
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - adi,ad5820
>> +      - adi,ad5821
>> +      - adi,ad5823
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  enable-gpios:
>> +    maxItems: 1
>> +    description:
>> +      GPIO spec for the XSHUTDOWN pin. The XSHUTDOWN signal is active low,
>> +      a high level on the pin enables the device.
>> +
>> +  VANA-supply:
>> +    description: supply of voltage for VANA pin
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - VANA-supply
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
>> +        coil@c {
>> +            compatible = "adi,ad5820";
>> +            reg = <0x0c>;
>> +
>> +            enable-gpios = <&msmgpio 26 GPIO_ACTIVE_HIGH>;
>> +            VANA-supply = <&vaux4>;
>> +        };
>> +    };
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index af3537005de35dfd0ded11bdc2b9c63e10c70e93..366ed4905fc9b32862a4fd665cf5f4e09fafc989 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -17274,6 +17274,7 @@ M:	Pavel Machek <pavel@kernel.org>
>>   M:	Sakari Ailus <sakari.ailus@iki.fi>
>>   L:	linux-media@vger.kernel.org
>>   S:	Maintained
>> +F:	Documentation/devicetree/bindings/media/i2c/adi,ad5820.yaml
>>   F:	drivers/media/i2c/ad5820.c
>>   F:	drivers/media/i2c/et8ek8
>>   
>>
>> ---
>> base-commit: b425262c07a6a643ebeed91046e161e20b944164
>> change-id: 20250314-b4-ad5820-dt-yaml-3220bf2f1e40
>>
>> Best regards,
>> -- 
>> David Heidelberg <david@ixit.cz>
>>

-- 
David Heidelberg


