Return-Path: <linux-media+bounces-47501-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A9BC7456E
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 14:49:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CC1E83571D3
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 13:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 621D5341063;
	Thu, 20 Nov 2025 13:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="msNtPb/b"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CFC33A003;
	Thu, 20 Nov 2025 13:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763646272; cv=none; b=WEaKEH+6hikDDEuObxEgQdhUtJfnc9x8fcFDuwxsEaishlZyfHXrT1qXpLe1gJ2/cKNeOp2bx9sUrlA/cJUzep560IzeF3MOh+OL6On5JBSyNeOC+Ac356OTX+DFzHlN3jeQKeFqAlg2akgfUq04IWI0k2PI0U7isYOQcr5MAIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763646272; c=relaxed/simple;
	bh=CLQfYe5K8BnIGRpXDic6QZBVupxIpc6StQw66vm6qGY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=aa6qxWwxPb7dkRuNhOqFNsXJn1BzyPlZ5/9OrvoUYOKub0mdHS48H9j+wbtj5aWzQXmT9Opg60HdcwFowLezNJYYX6s3zzliN41xtOSU9lc1mX092Dyct9kDJpf+3+Cf8nx75/qjuKF+ZyJ9yEWCQEORWImchUT37oYpebJKfVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=msNtPb/b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08CA9C4CEF1;
	Thu, 20 Nov 2025 13:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763646272;
	bh=CLQfYe5K8BnIGRpXDic6QZBVupxIpc6StQw66vm6qGY=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=msNtPb/bV/K2drAC1HLFyLmgEV+FsOshiWpAdYDThL4QVHbXZT/u2LNxalWg4hEfe
	 NuunQ2+CsWXr2zBFUuoeKHF9YlzYMD6uKegjD3QHGjxiitXrWC5alaguY2i2N1MK/e
	 axpcftm5J0aVOw/kofzXnpLrwEiem9txWgCRNZ6vyIwHDGhSCt07EfxFgEsrU/4up9
	 UwhfSGLxTKZ4GjXMNBuQMdUuUyS5RFqMD48PFTK9Sah4F5NtIyK4nmzSKqT7Ltz52c
	 231U4cix5FKkxjtpgpKBG0HBA174cju4xdFOAuZmta/k/EP2TYHr6fXru5suFg71uX
	 C874fjmdEPzhA==
Message-ID: <9ecd6482-5ef9-479d-a0ea-5dc06e3b9ffb@kernel.org>
Date: Thu, 20 Nov 2025 14:44:28 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] media: dt-bindings: adi,adv7180: add VPP and CSI
 register maps
To: Michael Tretter <m.tretter@pengutronix.de>,
 Lars-Peter Clausen <lars@metafoo.de>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, kernel@pengutronix.de
References: <20251119-b4-adv7180-vpp-sub-device-v2-0-86a7790b63ab@pengutronix.de>
 <20251119-b4-adv7180-vpp-sub-device-v2-1-86a7790b63ab@pengutronix.de>
 <20251120-calm-invisible-bullmastiff-ceaf71@kuoka>
 <aR7W76sUxs2gm1LL@pengutronix.de>
 <bdc6a80f-3d26-420e-8c83-839f06c365a5@kernel.org>
 <aR8DAObqhSh5BJky@pengutronix.de>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <aR8DAObqhSh5BJky@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/11/2025 13:01, Michael Tretter wrote:
> On Thu, 20 Nov 2025 10:05:43 +0100, Krzysztof Kozlowski wrote:
>> On 20/11/2025 09:53, Michael Tretter wrote:
>>> On Thu, 20 Nov 2025 09:04:48 +0100, Krzysztof Kozlowski wrote:
>>>> On Wed, Nov 19, 2025 at 05:25:51PM +0100, Michael Tretter wrote:
>>>>> diff --git a/Documentation/devicetree/bindings/media/i2c/adi,adv7180.yaml b/Documentation/devicetree/bindings/media/i2c/adi,adv7180.yaml
>>>>> index dee8ce7cb7ba..dbbbe76291bc 100644
>>>>> --- a/Documentation/devicetree/bindings/media/i2c/adi,adv7180.yaml
>>>>> +++ b/Documentation/devicetree/bindings/media/i2c/adi,adv7180.yaml
>>>>> @@ -30,7 +30,27 @@ properties:
>>>>>            - adi,adv7282-m
>>>>>  
>>>>>    reg:
>>>>> -    maxItems: 1
>>>>> +    minItems: 1
>>>>> +    items:
>>>>> +      - description: main register map
>>>>> +      - description: CSI register map
>>>>> +      - description: VPP register map
>>>>> +    description:
>>>>> +      The ADV7180 family may have up to three register maps. All chips have
>>>>> +      the main register map. The availability of the CSI and VPP register maps
>>>>> +      depends on the chip variant.
>>>>> +
>>>>> +      The addresses of the CSI and VPP register maps are programmable by
>>>>> +      software. They depend on the board layout and other devices on the I2C
>>>>> +      bus and are determined by the hardware designer to avoid address
>>>>> +      conflicts on the I2C bus.
>>>>> +
>>>>> +  reg-names:
>>>>> +    minItems: 1
>>>>> +    items:
>>>>> +      - const: main
>>>>> +      - enum: [ csi, vpp ]
>>>>> +      - enum: [ csi, vpp ]
>>>>
>>>> Last entry must be:
>>>>
>>>> const: vpp
>>>>
>>>> We do not allow flexible order... but the problem is that your if:then:
>>>> does not match above at all. You do not have three items anywhere.
>>>
>>> I'm not entirely sure, if I correctly understand that comment.
>>>
>>> The adi,adv7280-m and adi,adv7282-m have all three items and don't need
>>> an if:then:. Do I have explicitly define the binding with three items,
>>> too?
>>
>> Which comment? That third item cannot be csi? What is odd here?
>>
>>
>>>
>>> The chip has the following variants:
>>>
>>> adi,adv7180:     main
>>> adi,adv7180cp:   main
>>> adi,adv7180st:   main
>>> adi,adv7182:     main
>>> adi,adv7280:     main, vpp
>>> adi,adv7280-m:   main, csi, vpp
>>> adi,adv7281:     main, csi
>>> adi,adv7281-m:   main, csi
>>> adi,adv7281-ma:  main, csi
>>> adi,adv7282:     main, vpp
>>> adi,adv7282-m:   main, csi, vpp
>>
>> So where is csi as third item?
>>
>> Anyway, you also miss minItems in your if:then: cases.
> 
> The minItems in the if:then: cases would be the same as in the top level
> definition. Do I have to override the minItems if it's the same?

Yes, you need to make it explicit. All constraints, except min=maxItems,
which you imply here, must be explicit.

> 
>>
>>>
>>> If I make the last entry (vpp) const, I allow exactly these variants.
>>>
>>> For the adi,adv7280-m compatible, the following combinations would be
>>> valid or invalid:
>>>
>>> adi,adv7280-m:   main
>>>
>>> is valid, because only main is mandatory. For csi and vpp, the default
>>> addresses are used.
>>>
>>> adi,adv7280-m:   main, vpp
>>>
>>> is valid, because the second entry may be vpp. For csi, the default
>>> address is used.
>>>
>>> adi,adv7280-m:   main, vpp, csi
>>>
>>> is invalid, because the entries must be in the defined order, and
>>> flexible order is not possible.
>>>
>>> Is this correct and matches the binding definition?
>>
>> It does not match your code.
> 
> If I change the last entry to
> 
> 	- const: csi
> 
> to disallow vpp as a third item (which is compliant to the example), the
> binding is fine. Correct?

Probably, lost context, because I asked you to do that but it felt like
you keep discussing. So if you implement reviewer's suggestion, it is
enough to say "ack" or "ok".


Best regards,
Krzysztof

