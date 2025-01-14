Return-Path: <linux-media+bounces-24715-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CC0A105ED
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2025 12:50:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90EE8188837E
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2025 11:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4AAB234D1C;
	Tue, 14 Jan 2025 11:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Yo3aZswF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD38234CE0;
	Tue, 14 Jan 2025 11:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736855416; cv=none; b=a0Z8WTEsMqfo5ZEWFHdhmSNxq7Sjc7YEiQFudHRc5X54+yrfPlE/fDdIM8dtFFJ9SWcaL13dWn9dyKCfI9mmp/assnWWA3xHrC4OkIQvYf9cH3NMeS4K1V1AYaTvHcrPeTFM6uwRlo/y+AmuU8wdojPwCU4f+r7IGoyft8roiXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736855416; c=relaxed/simple;
	bh=w2Er+Bu+HS7K/9B5iXZWi5I3KwVp0DSyTPw9lhO0jJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NiVrQzRDvjLCo9OrIum9tbPs8ZvKqAzmrthizEmy+wroiVHXx0WezsdDujpSu7JvX0TOUW7i77yfhKSz+09OTyBGqgFDYW2iox/tN+EWopb1WmYe5YrolANG+scYY+pEdcyU1nKtaqZeiynBaAvF6UAHjgZcrknryiElDz2KPmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Yo3aZswF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5FCD7D21;
	Tue, 14 Jan 2025 12:49:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1736855354;
	bh=w2Er+Bu+HS7K/9B5iXZWi5I3KwVp0DSyTPw9lhO0jJY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Yo3aZswFqBUYlhJOZwHk4Ze3ywrWgMQuWVznfB6zdVdUkiO2OkLXc6yYz5W7lOypw
	 B5N4DIi1Q4QZFj142ZFiBPie/XnKZQ7gd2Pcoy1OKGwuvmIcOzgsEC2Mm5y7xLwx5w
	 pXD/Io6dm77NTzVFpxrqyJBIiiH6ggI4krPzsUKo=
Message-ID: <19c22201-e3ec-4d07-97ae-c149b172e480@ideasonboard.com>
Date: Tue, 14 Jan 2025 13:50:08 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/19] media: dt-bindings: ti,ds90ub960: Add "i2c-addr"
 link property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Devarsh Thakkar <devarsht@ti.com>,
 Jai Luthra <jai.luthra@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, devicetree@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20250110-ub9xx-improvements-v1-0-e0b9a1f644da@ideasonboard.com>
 <20250110-ub9xx-improvements-v1-17-e0b9a1f644da@ideasonboard.com>
 <iet6yl4mloktmpm7ngkug2dgtddriot7qwrkgg6loqermj7f74@mzyg34r7f4pc>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <iet6yl4mloktmpm7ngkug2dgtddriot7qwrkgg6loqermj7f74@mzyg34r7f4pc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/01/2025 12:31, Krzysztof Kozlowski wrote:
> On Fri, Jan 10, 2025 at 11:14:17AM +0200, Tomi Valkeinen wrote:
>> From: Jai Luthra <jai.luthra@ideasonboard.com>
>>
>> The serializer's I2C address on the FPD-Link bus is usually communicated
>> to the deserializer once the forward-channel is established. But in some
>> cases it might be necessary to program the serializer (over the
>> back-channel) before the forward-channel is established.
>>
>> This can be used e.g. to correct serializer configuration which
>> otherwise would prevent the FC to be enabled.
>>
>> Add a new optional property to specify the I2C address of the
>> serializer.
>>
>> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> Cc: devicetree@vger.kernel.org
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> 
> Why only these folks? Why not all of the maintainers?

The whole series is sent to the media list and maintainers. I thought 
this single patch doesn't warrant sending the whole series to DT list 
and maintainers, so I cc'd them here.

> Anyway, Please drop the autogenerated scripts/get_maintainer.pl CC-entries from
> commit msg. There is no single need to store automated output of
> get_maintainers.pl in the git log. It can be easily re-created at any
> given time, thus its presence in the git history is redundant and
> obfuscates the log.

I think that's a valid point.

> If you need it for your own patch management purposes, keep it under the
> --- separator.

I'm using b4. I don't know how to do that with b4, but I'll look into it.

>> ---
>>   Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
>> index 0b71e6f911a8..e17b508b6409 100644
>> --- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
>> +++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
>> @@ -75,6 +75,13 @@ properties:
>>                 address on the I2C bus where the deserializer resides are
>>                 forwarded to the serializer.
>>   
>> +          i2c-addr:
>> +            $ref: /schemas/types.yaml#/definitions/uint32
> 
> Why isn't this part of reg, if that's the same device? If that is not
> the same device, you are not expected to encode addresses of other
> devices in this device. Address of 'foo' is not a property of device
> 'bar'. Phandles or graphs express relationships between devices.

With the understanding of the HW I have right now, I would have added 
the i2c address as the address of the serializer node, with reg 
property. I would probably also do a few other changes to the bindings...

But as we already have the current bindings, adding the i2c-addr felt 
like an easy way to keep backwards compatibility and add the address of 
the serializer.

However, thinking about this more, maybe we could just go and add the 
address of the serializer with reg, in the ds90ub953 bindings. It's the 
ub960 driver that needs the address, but it shouldn't be much trouble to 
get that from the ub953's data.

But we need to keep the address optional to keep the backwards 
compatibility. If it's not defined, the ub960 will automatically receive 
the serializer's address when the link goes up (as it is handled now).

  Tomi


