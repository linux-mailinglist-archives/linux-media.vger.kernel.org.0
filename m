Return-Path: <linux-media+bounces-24750-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37088A11C35
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 09:40:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA8913A87FF
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 08:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BBA91E7C16;
	Wed, 15 Jan 2025 08:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xdt5nVJx"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0D923F269;
	Wed, 15 Jan 2025 08:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736930412; cv=none; b=BhMl9dBAq5mVq4MZLDniu7bxRk1Fda1W+uzEBWpR0aYCUaHA5UbWkl1oBySitQJNbKoHB4WeDjFxkkgyvy7TqYMHxS783lt9/FQeQ2DFk43Y9OE3KjuJA3YbY0lO5uvKr/l0Hl/kxIitFUFWTLXC4lVrYuzrCqwDnxtif4AjEPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736930412; c=relaxed/simple;
	bh=m4aiJ94d30wT17abWtLA+tJ7fjYJjps/sRvyjyNqHyQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KIDo7dOns109GMFHvV/TtIhW2zVDE7ngHZ6JwE/GTAIdIISUGcBVIXj+1aHBorz6VRq1JTCn6YrvLay746f2Qz/kibgKY/kvkU96+0aZdIc9GWQhOHC15a7ole19cMZNvsknwGxaLjx5pOiECjpMikw5wcFGDQmdpLhRGFJxWDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xdt5nVJx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 984ECC4CEDF;
	Wed, 15 Jan 2025 08:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736930412;
	bh=m4aiJ94d30wT17abWtLA+tJ7fjYJjps/sRvyjyNqHyQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Xdt5nVJx2ZJPZWOXl5hHTurLhDr7fhBznKWpFkvC/WUzTr1PWJ+BZMulRPAQq5W46
	 LRKc4mVKJf7kCsnYqqHcO9WnL4C06MJaMt1dS37WhULasGFZM5OyZ5qQxEbvVMc54M
	 yuR3cHX1vvrCJ6soMOOzWg0T1UNS6l8GkMVq4Vg4Gs2aBuduNNt/EDovhAtYdUu1UT
	 9lFZH5Bh6wI7k0KITl3dwUP5XZlmYADiGyFH0+pRIc0hshqnrDZRqK394fyr0+EG7x
	 jeEQ34b+AjQaaG1utL80kbZrmJYZFJZ6IghlMf0Uki/HqH8PJujUmGS2bzmeWc7aBZ
	 loNr271zo/QpQ==
Message-ID: <ffecd7b0-39f1-494b-8a9f-81702a439752@kernel.org>
Date: Wed, 15 Jan 2025 09:40:07 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/19] media: dt-bindings: ti,ds90ub960: Add "i2c-addr"
 link property
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Devarsh Thakkar <devarsht@ti.com>,
 Jai Luthra <jai.luthra@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, devicetree@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20250110-ub9xx-improvements-v1-0-e0b9a1f644da@ideasonboard.com>
 <20250110-ub9xx-improvements-v1-17-e0b9a1f644da@ideasonboard.com>
 <iet6yl4mloktmpm7ngkug2dgtddriot7qwrkgg6loqermj7f74@mzyg34r7f4pc>
 <19c22201-e3ec-4d07-97ae-c149b172e480@ideasonboard.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJgPO8PBQkUX63hAAoJEBuTQ307
 QWKbBn8P+QFxwl7pDsAKR1InemMAmuykCHl+XgC0LDqrsWhAH5TYeTVXGSyDsuZjHvj+FRP+
 gZaEIYSw2Yf0e91U9HXo3RYhEwSmxUQ4Fjhc9qAwGKVPQf6YuQ5yy6pzI8brcKmHHOGrB3tP
 /MODPt81M1zpograAC2WTDzkICfHKj8LpXp45PylD99J9q0Y+gb04CG5/wXs+1hJy/dz0tYy
 iua4nCuSRbxnSHKBS5vvjosWWjWQXsRKd+zzXp6kfRHHpzJkhRwF6ArXi4XnQ+REnoTfM5Fk
 VmVmSQ3yFKKePEzoIriT1b2sXO0g5QXOAvFqB65LZjXG9jGJoVG6ZJrUV1MVK8vamKoVbUEe
 0NlLl/tX96HLowHHoKhxEsbFzGzKiFLh7hyboTpy2whdonkDxpnv/H8wE9M3VW/fPgnL2nPe
 xaBLqyHxy9hA9JrZvxg3IQ61x7rtBWBUQPmEaK0azW+l3ysiNpBhISkZrsW3ZUdknWu87nh6
 eTB7mR7xBcVxnomxWwJI4B0wuMwCPdgbV6YDUKCuSgRMUEiVry10xd9KLypR9Vfyn1AhROrq
 AubRPVeJBf9zR5UW1trJNfwVt3XmbHX50HCcHdEdCKiT9O+FiEcahIaWh9lihvO0ci0TtVGZ
 MCEtaCE80Q3Ma9RdHYB3uVF930jwquplFLNF+IBCn5JRzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmA872oFCRRflLYACgkQG5NDfTtBYpvScw/9GrqBrVLuJoJ52qBBKUBDo4E+5fU1bjt0
 Gv0nh/hNJuecuRY6aemU6HOPNc2t8QHMSvwbSF+Vp9ZkOvrM36yUOufctoqON+wXrliEY0J4
 ksR89ZILRRAold9Mh0YDqEJc1HmuxYLJ7lnbLYH1oui8bLbMBM8S2Uo9RKqV2GROLi44enVt
 vdrDvo+CxKj2K+d4cleCNiz5qbTxPUW/cgkwG0lJc4I4sso7l4XMDKn95c7JtNsuzqKvhEVS
 oic5by3fbUnuI0cemeizF4QdtX2uQxrP7RwHFBd+YUia7zCcz0//rv6FZmAxWZGy5arNl6Vm
 lQqNo7/Poh8WWfRS+xegBxc6hBXahpyUKphAKYkah+m+I0QToCfnGKnPqyYIMDEHCS/RfqA5
 t8F+O56+oyLBAeWX7XcmyM6TGeVfb+OZVMJnZzK0s2VYAuI0Rl87FBFYgULdgqKV7R7WHzwD
 uZwJCLykjad45hsWcOGk3OcaAGQS6NDlfhM6O9aYNwGL6tGt/6BkRikNOs7VDEa4/HlbaSJo
 7FgndGw1kWmkeL6oQh7wBvYll2buKod4qYntmNKEicoHGU+x91Gcan8mCoqhJkbqrL7+nXG2
 5Q/GS5M9RFWS+nYyJh+c3OcfKqVcZQNANItt7+ULzdNJuhvTRRdC3g9hmCEuNSr+CLMdnRBY fv0=
In-Reply-To: <19c22201-e3ec-4d07-97ae-c149b172e480@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/01/2025 12:50, Tomi Valkeinen wrote:
> Hi,
> 
> On 11/01/2025 12:31, Krzysztof Kozlowski wrote:
>> On Fri, Jan 10, 2025 at 11:14:17AM +0200, Tomi Valkeinen wrote:
>>> From: Jai Luthra <jai.luthra@ideasonboard.com>
>>>
>>> The serializer's I2C address on the FPD-Link bus is usually communicated
>>> to the deserializer once the forward-channel is established. But in some
>>> cases it might be necessary to program the serializer (over the
>>> back-channel) before the forward-channel is established.
>>>
>>> This can be used e.g. to correct serializer configuration which
>>> otherwise would prevent the FC to be enabled.
>>>
>>> Add a new optional property to specify the I2C address of the
>>> serializer.
>>>
>>> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>> Cc: devicetree@vger.kernel.org
>>> Cc: Rob Herring <robh@kernel.org>
>>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>>
>> Why only these folks? Why not all of the maintainers?
> 
> The whole series is sent to the media list and maintainers. I thought 
> this single patch doesn't warrant sending the whole series to DT list 
> and maintainers, so I cc'd them here.


I was wondering why only some of the DT maintainers, not all? My usual
assumption is: you are not using get_maintainers.pl or you are working
on an old kernel.


> 
>> Anyway, Please drop the autogenerated scripts/get_maintainer.pl CC-entries from
>> commit msg. There is no single need to store automated output of
>> get_maintainers.pl in the git log. It can be easily re-created at any
>> given time, thus its presence in the git history is redundant and
>> obfuscates the log.
> 
> I think that's a valid point.
> 
>> If you need it for your own patch management purposes, keep it under the
>> --- separator.
> 
> I'm using b4. I don't know how to do that with b4, but I'll look into it.
> 
>>> ---
>>>   Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml | 7 +++++++
>>>   1 file changed, 7 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
>>> index 0b71e6f911a8..e17b508b6409 100644
>>> --- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
>>> +++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
>>> @@ -75,6 +75,13 @@ properties:
>>>                 address on the I2C bus where the deserializer resides are
>>>                 forwarded to the serializer.
>>>   
>>> +          i2c-addr:
>>> +            $ref: /schemas/types.yaml#/definitions/uint32
>>
>> Why isn't this part of reg, if that's the same device? If that is not
>> the same device, you are not expected to encode addresses of other
>> devices in this device. Address of 'foo' is not a property of device
>> 'bar'. Phandles or graphs express relationships between devices.
> 
> With the understanding of the HW I have right now, I would have added 
> the i2c address as the address of the serializer node, with reg 
> property. I would probably also do a few other changes to the bindings...
> 
> But as we already have the current bindings, adding the i2c-addr felt 
> like an easy way to keep backwards compatibility and add the address of 
> the serializer.
> 
> However, thinking about this more, maybe we could just go and add the 
> address of the serializer with reg, in the ds90ub953 bindings. It's the 
> ub960 driver that needs the address, but it shouldn't be much trouble to 
> get that from the ub953's data.
> 
> But we need to keep the address optional to keep the backwards 
> compatibility. If it's not defined, the ub960 will automatically receive 
> the serializer's address when the link goes up (as it is handled now).


The 'reg' can grow and should not cause ABI issues, because
implementations should just ignore additional entry.

Best regards,
Krzysztof

