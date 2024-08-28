Return-Path: <linux-media+bounces-16974-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6586961E5B
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 07:46:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4DB82B2194F
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 05:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C82DD152DE7;
	Wed, 28 Aug 2024 05:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="evNSe0nn"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2533B146A63;
	Wed, 28 Aug 2024 05:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724823957; cv=none; b=B6vFU1wJwJgymqMcDQohjyx+vZcX0vX9pPohYTSNt55Zix70mNiwiOQDD659mO6hGyQMkGcejhrBIzv5I4Q4hSBXuUnXjXWVm1YZbZsJY2ekeVSbaeM28vkaESZ+C1YqeWSivokhKyfHllqwagisstFH3x9xdvaQ/yfHOq2NoYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724823957; c=relaxed/simple;
	bh=qI3VUSIjzsxGBzqqd3ev0EQ24ah7nY3XOSmQmjiULz0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BFEMp3QVakD590v7ZgMAZxpWn96hhS+Z6ueV8WqKndjOKlfa1tvPW0IcrUZ8EUrUFXap20NEmmdIyBoGNbHhVsiS9eLml2Rn1yXwp1kuyh1GkjQZ8JhCxHOCZB7ZDwBWqdp8imqC71llQnCt/ZCkJF+7lFNGTAfsyonx6/VWzo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=evNSe0nn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C6A9C32786;
	Wed, 28 Aug 2024 05:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724823956;
	bh=qI3VUSIjzsxGBzqqd3ev0EQ24ah7nY3XOSmQmjiULz0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=evNSe0nnzv0x1+xB26nbeoU5+YGZWXiqcANER8OPPeFagtaVGvKo91N2utVKZSAqu
	 OiIhX2aq9vH3F+m/YJ7U8HsmYMjlpetpVQiMig2+9OVHA68Q+KRJgY9Qr1jbmpwDyK
	 ijjrAr9Ok8cScD6LCIcCGnT5CSQmzgfT7o3YbtnvfJMezuNvbPCybSE8CNH/+CPnHN
	 4K3dEzFQB9dtoB1PlJvDudvHMy0VOtukTaAidM3vau2MfsjugImKDgdw+wZ8vV6FSG
	 pFTTi1nx2l/Z6FoNmojRE+Ga1NW3kE4lvsV6mYLfB5+/otumW3DDe6YaG7nfraaKxv
	 InqlCvMFuLN+g==
Message-ID: <8aca6aa8-8b92-4e90-b4a6-75090b502964@kernel.org>
Date: Wed, 28 Aug 2024 07:45:50 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: maxim,max96712: Add compatible
 for MAX96724
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>
References: <20240827131841.629920-1-niklas.soderlund+renesas@ragnatech.se>
 <20240827131841.629920-2-niklas.soderlund+renesas@ragnatech.se>
 <7dadf8dd-ad54-4e4f-a336-adc3444df4b0@kernel.org>
 <20240827180334.GI2636928@fsdn.se>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240827180334.GI2636928@fsdn.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/08/2024 20:03, Niklas Söderlund wrote:
> Hi Krzysztof,
> 
> Thanks for your feedback.
> 
> On 2024-08-27 16:53:20 +0200, Krzysztof Kozlowski wrote:
>> On 27/08/2024 15:18, Niklas Söderlund wrote:
>>> The MAX96712 and MAX96724 are almost identical and can be supported by
>>> the same driver, add a compatible for MAX96724.
>>
>> The driver statement in this context is meaningless. You did not make
>> them compatible so what does it matter?
> 
> Agreed, this commit message can be improved.
> 
>>
>>>
>>> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>>> ---
>>> * Changes since v1
>>> - Group in series together with driver change.
>>> ---
>>>  .../devicetree/bindings/media/i2c/maxim,max96712.yaml        | 5 ++++-
>>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
>>> index 6c72e77b927c..26f85151afbd 100644
>>> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
>>> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
>>> @@ -25,7 +25,10 @@ description: |
>>>  
>>>  properties:
>>>    compatible:
>>> -    const: maxim,max96712
>>> +    items:
>>> +      - enum:
>>> +          - maxim,max96712
>>> +          - maxim,max96724
>>
>> Driver change tells these are compatible and version is detectable.
>> Express it in the binding with fallback or explain in commit msg why
>> they are not compatible.
> 
> It is, and as you point out the commit message can be improved. It 
> should have made it clear that what is supported by the staging driver 
> (test pattern generator) is similar for the two devices, the full device 
> have larger differences.

OK.



Best regards,
Krzysztof


