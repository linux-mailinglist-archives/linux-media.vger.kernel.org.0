Return-Path: <linux-media+bounces-27431-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9E3A4D4C8
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 08:27:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B1CE188B9F3
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 07:27:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C1231F63C3;
	Tue,  4 Mar 2025 07:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OUG3K4Bp"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B291F3B8B;
	Tue,  4 Mar 2025 07:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741073222; cv=none; b=G1n95hwGL95bLgvo0G+7FbJp8ErRZUV7l9PPM2nHc+jAsUeZFOdUz4q0rlni9MTARR+/frpEb4c5KGojJ3481GtIa2yng/e6L/yqmNrQ4iUh4WtghhpVuDk/MnrF6mFyLCPJ7z2NNfvIjzjzko05Aft+mfVzYV90UBwbuG9sp4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741073222; c=relaxed/simple;
	bh=HEWd7nz/d+PKsQ3jXyyDNOvORZbt4ng0L2I9siK7DsM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uI1OW46t3D9axfChP6lW6HGgPy+w+yN0dH57AFB5dNz5DftYrNXbI2BhdP96ivz3QvHlkTaxLgs6hqrLax4IvFJi7B08Z/PkSMECf/wCLEGpjtSAH4D9jW3/ltkssHgBtGJQ5eXWxf3Lymmc0IjMlpCCXWLvauS1lF3L6aMcmZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OUG3K4Bp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17146C4CEE5;
	Tue,  4 Mar 2025 07:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741073222;
	bh=HEWd7nz/d+PKsQ3jXyyDNOvORZbt4ng0L2I9siK7DsM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OUG3K4Bpf1vhgWiRM16+WBYZCS+jYVx9OC/AmhrNr+WmIPpsnNrLsxE2qV+cHBHlX
	 +40WgmReWTOF4Tyq0tldq0hzJAgmFO4ZITZrnTmBgJukurE51IA8IldjRnNxCh9H8J
	 /kQeeALLw0Sg4EDRvRqUQfybrzjmFmPCOVJLuswmyBgXot1Oo3wM2JDN0PHdRfN09X
	 edYVYPamLz2cdaHeDd8w1cKp024K52dhf/+nd0BOabRuiiOkXGdjRx9ElTVLTOSrKf
	 XNj+LpegaZnz+aGJks1tuItEZMZ0dPZpkv6RbVE+Dvw7xGPbNtTjXXxxaWCUUsNJci
	 f+5Go/z8hbeHQ==
Message-ID: <7856fdff-5dc5-44e2-afde-129233b930ab@kernel.org>
Date: Tue, 4 Mar 2025 08:26:54 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] media: dt-bindings: Add dt bindings for
 m2m-deinterlace device
To: Matthew Majewski <mattwmajewski@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 "Dr. David Alan Gilbert" <linux@treblig.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Uwe Kleine-Konig <u.kleine-koenig@baylibre.com>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250214231759.119481-1-mattwmajewski@gmail.com>
 <20250214231759.119481-2-mattwmajewski@gmail.com>
 <20250218-eggplant-skylark-of-swiftness-dcf6ba@krzk-bin>
 <69cb2e95c291f17cff42b45e7c871f30a85c060d.camel@gmail.com>
 <3d729159-4d13-4a61-88c7-3be992b23728@kernel.org>
 <c7141c6554b396d3ddaf7e0e540b80e5990b416b.camel@gmail.com>
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
In-Reply-To: <c7141c6554b396d3ddaf7e0e540b80e5990b416b.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/03/2025 16:21, Matthew Majewski wrote:
> On Mon, 2025-03-03 at 08:31 +0100, Krzysztof Kozlowski wrote:
>> On 26/02/2025 23:41, Matthew Majewski wrote:
>>>
>>> As I wrote, supported devices/hardware is anything that provides a
>>> MEM_TO_MEM capable dma-controller with interleaved transfer
>>> support. I
>>> did not list specific devices because the bindings are supposed to
>>> be
>>> generic, as they are not describing actual silicon. But if you want
>>> me
>>
>> I already told you that no. Bindings are not supposed to be generic.
>>
>> From where did you get such information?
> 
> There are generic bindings in the kernel and I based my bindings off of
> them. spi-gpio.yaml, i2c-gpio.yaml, video-mux.yaml, etc are all generic
> bindings, no?

They are generic, but you said "supposed to be generic" and I am asking
about this.

BTW, any "generic" or "simple" bindings often became non-generic and
non-simple leading to mess.

> 
>>
>>> to list some devices which provide a compatible dma-controller,
>>> here
>>> are devices I found in the current mainline kernel:
>>>
>>> - TI OMAP Soc Family
>>> - TI Davinci Soc Family
>>> - TI Keystone Processor Family
>>> - IMX27 Processor and variants
>>> - Several Microchip Processors (sama5, sam9x7, sam9x60)
>>
>> That's too generic - you just listed SoCs, which consist of dozen or
>> hundred of devices. Which hardware piece is here?
>>
>> Maybe this is not for a real device, but then this should be marked
>> clearly.
>>
> 
> I listed devices that have a compatible dma-controller, so the list is
> a bit big, sorry. I also specifically mentioned the BeagleBone black
> board which I have been testing on. 
> 
> "m2m-deinterlace" used to be a part of the mach-imx27_visstrim_m10.c
> board file, but was removed with commit 879c0e5e0ac711 (ARM: imx:
> Remove i.MX27 board files). So at least the Vistrim M10 device was
> explicitly using the m2m-deinterlace device. 
> 
> When the move away from board files was made towards device-tree, m2m-
> deinterlace support was never ported over to device-tree. This is what
> I am doing now. 
> 
> And yes, m2m-deinterlace is not a "real device" if by "real device" you
> mean an actual piece of silicon on a specific piece of hardware. I
> think there is just some semantic confusion here. I will no longer
> refer to it as a "device" then, please let me know what the more
> appropriate term is and I will modify the description accordingly.
> 
>>>
>>> I think an appropriate analogy for m2m-deinterlace would be spi-
>>> gpio.
>>> Since spi-gpio leverages gpio for bitbanging the spi protocol, the
>>> bindings do not need to describe any clocks, spi-controller
>>> registers,
>>
>> Sure, SPI GPIO is Linux driver, not a device and I am asking about it
>> all the time.
>>
> 
> My point was that spi-gpio has dt-bindings even though these bindings
> do not describe a specific hardware device, hence it is "generic". 


SPI GPIO is physical GPIO lines bit-banged in software. I don't think it
is possible to achieve such SPI controller as part of some other Linux
structure.
Now your case - describe what you have here - SW for interlacing? But
that is just memory operation. I really do not see why this is supposed
to be separate device node in DTS. This is part of media pipeline, so
easily can be part of some other device.


Best regards,
Krzysztof

