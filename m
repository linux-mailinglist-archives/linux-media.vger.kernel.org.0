Return-Path: <linux-media+bounces-14107-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 525EF916940
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2024 15:44:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D19011F26D38
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2024 13:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0823B16B38E;
	Tue, 25 Jun 2024 13:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ha33VICF"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCCB161915;
	Tue, 25 Jun 2024 13:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719323050; cv=none; b=kuUigrhzQ7viE+20hNFw5dokREgfW9KmQJSIPiU/yHXlG/hLJxUrKwUUOzo0KB7W64T9dsQepsEJER2yWvsYVH0UhJonyHpDUlpswv+obZqSAF2+2cVVxxuzRYWtQ9htORz6IFHKjj7gpMAnEvhFat+Iaz2SSwMwx24zkPMDuLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719323050; c=relaxed/simple;
	bh=qQWHcYlUDLhXU8vkBrdqxz/UtKXK1E/0XxX62Qh+A5c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JeWgV8ypTs8SeRbGFJCsW2lJhSkpu0ptsDSadq10KrW6G/QMPk22KkbHktWnkA2gWYxOVq4+W79KsyIZHJ36gXnNdUN30LeFqFLJSnPUzBIdarDuk0IVePm/ZwcfzDdMd1j/rWi2pwGFsauq/Fkvi7c7BSkc6Af70QzQVoIN7XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ha33VICF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA04BC32786;
	Tue, 25 Jun 2024 13:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719323049;
	bh=qQWHcYlUDLhXU8vkBrdqxz/UtKXK1E/0XxX62Qh+A5c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ha33VICFx8Cl6rQrGCxAALxVpGPzCRJMpS4FzY6a94Ws0zp+ey1rwAV/Hr65ShuAD
	 G7qV7JNjQPDrKi/HgcO02Tkfl+XqQlhkbOxrDkZOTs88pA2Huw9TH+VVSZXShbKfky
	 OTbtY7X3e99NXlY20Hu08LwMzFDBzF0rfoocpTqTyMWAa/8uNdqbKh6ub9VFhxBy4o
	 +RvXHoY+bTvJq3HOgp+8GnK7bkarCXmuEI7PxztysV7edk1/sEJDe02WZZLVY9K+dV
	 UWeUKIwKnrtKEn1TQXHiK434fS2FNmqHjv9+aA9SeCE9w+h6+UXsuNdpfsL3oOHn18
	 YkxEQR0hPFA9w==
Message-ID: <5c9ab5bf-95f2-4195-8797-335010223aac@kernel.org>
Date: Tue, 25 Jun 2024 15:44:02 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/16] dt-bindings: mfd: mediatek: Add codec property
 for MT6357 PMIC
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
 <20240226-audio-i350-v6-3-f754ec1a7634@baylibre.com>
 <cd190d35-1658-43d8-9606-5e73257bbf3a@linaro.org>
 <95bab90f-b196-4e79-bb88-7fd534cca721@baylibre.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <95bab90f-b196-4e79-bb88-7fd534cca721@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/06/2024 11:23, Alexandre Mergnat wrote:
> 
> 
> On 21/06/2024 17:00, Krzysztof Kozlowski wrote:
>> On 19/06/2024 16:46, Alexandre Mergnat wrote:
>>> Add the audio codec sub-device. This sub-device is used to set the
>>> optional voltage values according to the hardware.
>>> The properties are:
>>>    - Setup of microphone bias voltage.
>>>    - Setup of the speaker pin pull-down.
>>>
>>> Also, add the audio power supply property which is dedicated for
>>> the audio codec sub-device.
>>>
>>> Signed-off-by: Alexandre Mergnat<amergnat@baylibre.com>
>>> ---
>>>   .../devicetree/bindings/mfd/mediatek,mt6357.yaml   | 33 ++++++++++++++++++++++
>>>   1 file changed, 33 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
>>> index 37423c2e0fdf..d95307393e75 100644
>>> --- a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
>>> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
>>> @@ -37,6 +37,32 @@ properties:
>>>     "#interrupt-cells":
>>>       const: 2
>>>   
>>> +  vaud28-supply:
>>> +    description: 2.8 volt supply phandle for the audio codec
>>> +
>>> +  audio-codec:
>>> +    type: object
>> Still not much improved. You do not have any resources there, so these
>> should go to the parent node.
> 
> Hi Krzysztof,
> 
> vaud28-supply seems to be a mistake that I forward port.
> In the V4, AFAII, your feedback [1] suggested me to move the vaud28-supply from the "audio-codec" 
> sub-node to the parent node, which for me is the "pmic" (mfd), because the property is considered as 
> power-supply.
> 
>      pwrap {
>          pmic {
>              ...
>              audio-codec {
>                  ...
> 
> Hardware side, vaud28-supply is the output of PMIC-regulator subsystem, and AVDD28 is the input of 
> PMIC-audio-codec subsystem. Then:
> - The property name is wrong and must be change to AVDD28, which is a consumer (power input), not a 
> power-supply. => description: 2.8 volt power input for microphones (AU_VIN0, AU_VIN1, AU_VIN2)
> - IMHO, move this property to the next parent (pwrap) isn't consistent. It should be moved back to 
> Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml (Done in the V4) into audio-codec 
> substystem, beside mediatek,micbias0-microvolt

I don't understand why do we talk again about supply. My comment was not
under the supply.

Best regards,
Krzysztof


