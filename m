Return-Path: <linux-media+bounces-17005-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A2996257F
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 13:06:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CCFC1C23AD6
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 11:06:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06ADE16CD10;
	Wed, 28 Aug 2024 11:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s6in7ls4"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B482166319;
	Wed, 28 Aug 2024 11:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724843203; cv=none; b=OC6C6CasfXCH3ACk8Ee4ZX/TS402+uUgnyHQEk/bYmDBsWVm6W1UyFT+O8x4D32JF/W7NNQ2nsWPf4XafIiIJX1YLsXXrFrdiY5Cb/Liy6KuRPeLKzJDWsGoM3Q18s4bStlJpver0umEuJcC2PPvjFVv38O9TYF7YChsV5VZix4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724843203; c=relaxed/simple;
	bh=ffCUfA7PbPmj67mMz4cR94498n0GiF70pRr536geWsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RSAVOL/Dios/WONl+lspZBYvurNWnVxQSfOm8fKqafY2CzqkdeZGhBoAOP7WRYSw3FbiCq377MuGuB2as+E6Aa46ymhk1SsxydUSzHL1vhstdYakrnJ4fdQykHXs44TCEZQMdu+4rvxKogPgPGMWdha72aiwsH7e/VlPR0D1QCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s6in7ls4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64442C51AB5;
	Wed, 28 Aug 2024 11:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724843203;
	bh=ffCUfA7PbPmj67mMz4cR94498n0GiF70pRr536geWsE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=s6in7ls4NqaYDTi70pioDxbwpE7QVD308rB/8tHOeldHccyzoODvgvOZDiEodcDk0
	 3A6BuS6/RfEL9D4g8OKW6y7nlB0FhfvY9q6dmTFdyNB1AalcJ6Yqb0E1Q9TyHH2WO6
	 aJOPIpWQFywuED86inJ1ko3TGdZ9qR5DgWW3/IZWN1cHb57Q331ZJnuN1lBcxTipRT
	 5+6GTkmKpf2hCkwU/w6eu/x/4KYK3isrK5EhQ8uewB32LHPjMBYUuqVi2Z4CU1lSJd
	 ICpJMXIn7/8h1EILc70zFkC1eESnDKPGZm3POLX3fSO2B9vbn0xyTz6IYwsskYE0HL
	 gg+MSw4VviCBw==
Message-ID: <530102e8-e638-49c1-a0ac-960c51d4f3dc@kernel.org>
Date: Wed, 28 Aug 2024 13:06:37 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: media: renesas,isp: Add Gen4 family
 fallback
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20240826144352.3026980-1-niklas.soderlund+renesas@ragnatech.se>
 <20240826144352.3026980-2-niklas.soderlund+renesas@ragnatech.se>
 <cnca2gdh6c3kg5ybb4dxzlca5c7jsvz4tomibpkf746syejvmf@ndbq4qkykume>
 <20240827081233.GE2636928@fsdn.se>
 <20240827213441.GA30398@pendragon.ideasonboard.com>
 <9e18bbf4-ae22-4d53-a998-67ad5807d72b@kernel.org>
 <20240828105008.GJ30398@pendragon.ideasonboard.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240828105008.GJ30398@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/08/2024 12:50, Laurent Pinchart wrote:
> On Wed, Aug 28, 2024 at 07:36:35AM +0200, Krzysztof Kozlowski wrote:
>> On 27/08/2024 23:34, Laurent Pinchart wrote:
>>> On Tue, Aug 27, 2024 at 10:12:33AM +0200, Niklas Söderlund wrote:
>>>> On 2024-08-27 08:31:22 +0200, Krzysztof Kozlowski wrote:
>>>>> On Mon, Aug 26, 2024 at 04:43:47PM +0200, Niklas Söderlund wrote:
>>>>>> The ISP Channel Selector IP is the same for all current Gen4 devices.
>>>>>> This was not known when adding support for V3U and V4H and a single SoC
>>>>>> specific compatible was used.
>>>>>>
>>>>>> Before adding more SoC specific bindings for V4M add a family compatible
>>>>>> fallback for Gen4. That way the driver only needs to be updated once for
>>>>>> Gen4, and we still have the option to fix any problems in the driver if
>>>>>> any testable differences between the SoCs are found.
>>>>>>
>>>>>> There are already DTS files using the V3U and V4H compatibles which
>>>>>> needs to be updated to not produce a warning for DTS checks. The driver
>>>>>> also needs to kept the compatible values to be backward compatible , but
>>>>>> for new Gen4 SoCs such as V4M we can avoid this.
>>>>>>
>>>>>> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>>>>>> ---
>>>>>> * Changes since v1
>>>>>> - New in v2.
>>>>>> ---
>>>>>>  Documentation/devicetree/bindings/media/renesas,isp.yaml | 3 ++-
>>>>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/media/renesas,isp.yaml b/Documentation/devicetree/bindings/media/renesas,isp.yaml
>>>>>> index 33650a1ea034..730c86f2d7b1 100644
>>>>>> --- a/Documentation/devicetree/bindings/media/renesas,isp.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/media/renesas,isp.yaml
>>>>>> @@ -22,6 +22,7 @@ properties:
>>>>>>        - enum:
>>>>>>            - renesas,r8a779a0-isp # V3U
>>>>>>            - renesas,r8a779g0-isp # V4H
>>>>>> +      - const: renesas,rcar-gen4-isp # Generic R-Car Gen4
>>>>>
>>>>> Adding generic fallback post-factum is odd, does not feel reliable.
>>>>> Instead use specific compatibles as fallbacks.
>>>>
>>>> I agree, it feels a bit odd. But this was the road we hammered out at 
>>>> great pain for how to be able to move forward with this issue for the 
>>>> other IP block involved in video capture for R-Car Gen4, VIN [1]. This 
>>>> just mirrors that long discussion decision for the R-Car CSISP.
>>>>
>>>> I would hate to have different solutions for the two.
>>>>
>>>> 1. [PATCH v5 0/6] rcar-vin: Add support for R-Car V4M
>>>>    https://lore.kernel.org/all/20240704161620.1425409-1-niklas.soderlund+renesas@ragnatech.se/
>>>
>>> The compatible fallback for VIN has been added following a request from
>>> Conor and Rob, so it would be nice if the three of you could agree to
>>> achieve consistency in the bindings :-)
>>
>> Don't twist our answers. You need fallback, but specific, not family.
>> There was a countless number of answers from Rob that specific
>> compatibles are preferred.
>>
>> Look, Conor's reply:
>>
>> https://lore.kernel.org/all/20240620-gating-coherent-af984389b2d7@spud/
>> Do you see family fallback? I think "r8a779g0" is SoC.
>>
>> Look here:
>> https://lore.kernel.org/all/20240610-screen-wolverine-78370c66d40f@spud/
>>
>> Or here
>> https://lore.kernel.org/all/20240624-rented-danger-300652ab8eeb@wendy/
>> where Conor agrees against!
>>
>> So let me actually NAK it - you got multiple comments on VIN to use
>> specific compatible.
> 
> Krzysztof, this tone is not acceptable, regardless of the technical
> argument. Period.

Except elevated arguments I don't think the tone is not acceptable.

Anyway, please provide references supporting your statement that Conor
and Rob encouraged using generic (not specific) fallback compatible.

I provided what I found, so I keep the discussion based on facts. I
expect the same from you.


Best regards,
Krzysztof


