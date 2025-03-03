Return-Path: <linux-media+bounces-27316-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C7EA4B865
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 08:35:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBAD4167E26
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 07:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D2901EA7E8;
	Mon,  3 Mar 2025 07:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ae/eu6wz"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F441E5B76;
	Mon,  3 Mar 2025 07:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740987292; cv=none; b=EWuLO11zSW+glRwqZVrPpX0V3O/sv3DxKWRnuiOf2JLtRvOSl2qiMZIDSo5apC9l3LjRNUdRWzQ8b2LA6qOblS2erSW3h6dR7ri3Bp3Ohts9ZV08+0g1baacSQto1PRm4OpSB2HbMVKbM9NQjXDfvMZmmRLO/HuvVQy+6TEksmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740987292; c=relaxed/simple;
	bh=OdVpAxmtfoalSXyqc+DLAkGnZF5iDT2lNU6C/joqxOA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=TfCjdrrRcMu6o6snqI3+kC3FzSUvML6g+CuXSfTC5S0P9c3EPRKlil1lE9n18GxJ3PWuSAU3BGsIKyZ7mp1NJEqsBsgcUyP07sIYt4pQDKSayjjd4hPkH9oClqworMmZ21qU7CppFMnmjFiihyIHD5y0lFFtRrvtTSI5CbtGRZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ae/eu6wz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94412C4CED6;
	Mon,  3 Mar 2025 07:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740987292;
	bh=OdVpAxmtfoalSXyqc+DLAkGnZF5iDT2lNU6C/joqxOA=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=Ae/eu6wzFC+50YktcQuMsFoMEsSip8iy+UoejH9l6iTL+foo31bCfLjUFZFn5COBq
	 9+SwxdDtT9v2e3n0Rz4tJR4QnZGh7pGvpaga+HBQ5P0t3nsh9z1e9r0WTjYitRScB3
	 MckHDxDMuCXVtr3pYNcEzCnoRXGoyHuymYWYdqTcRisJbJfffQauC/cp3nWit3Iryl
	 9nmzPDRdg5Ttnka1VH/LnFW1ar2oS12afA/YFdsnihR2R4J2J5vq19bmQ5Clixcut2
	 g8NcYKA5YyZOAgXg9naN7yF0/vgJ/A8zIt19AcGTEvrpA5+7k/fe5VVjr7w92ytu5j
	 HGzLXy+OyWquA==
Message-ID: <7c720780-03ad-43a1-b89c-8cedd00dd129@kernel.org>
Date: Mon, 3 Mar 2025 08:34:45 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] media: dt-bindings: Add dt bindings for
 m2m-deinterlace device
From: Krzysztof Kozlowski <krzk@kernel.org>
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
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <3d729159-4d13-4a61-88c7-3be992b23728@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/03/2025 08:31, Krzysztof Kozlowski wrote:
> On 26/02/2025 23:41, Matthew Majewski wrote:
>> Hi Krzysztof,
>>
>> On Tue, 2025-02-18 at 09:30 +0100, Krzysztof Kozlowski wrote:
>>> On Fri, Feb 14, 2025 at 06:17:58PM -0500, Matthew Majewski wrote:
>>>> Create a new yaml schema file to describe the device tree bindings
>>>> for
>>>> generic m2m-deinterlace device.
>>>>
>>>> This device is supported on any hardware that provides a MEM_TO_MEM
>>>
>>> Which device? I don't see here any device name/model.
>>
>> By "device" I am referring to the m2m-deinterlace device, which I
>> explained is a quasi-virtual device. If this is confusing wording I can
>> change. 
>>
>>> I asked to provide here some examples of devices.
>>
>> As I wrote, supported devices/hardware is anything that provides a
>> MEM_TO_MEM capable dma-controller with interleaved transfer support. I
>> did not list specific devices because the bindings are supposed to be
>> generic, as they are not describing actual silicon. But if you want me
> 
> I already told you that no. Bindings are not supposed to be generic.
> 
> From where did you get such information?
> 
>> to list some devices which provide a compatible dma-controller, here
>> are devices I found in the current mainline kernel:
>>
>> - TI OMAP Soc Family
>> - TI Davinci Soc Family
>> - TI Keystone Processor Family
>> - IMX27 Processor and variants
>> - Several Microchip Processors (sama5, sam9x7, sam9x60)
> 
> That's too generic - you just listed SoCs, which consist of dozen or
> hundred of devices. Which hardware piece is here?
> 
> Maybe this is not for a real device, but then this should be marked clearly.
> 
>>
>> As I mentioned in my original email, I have personally tested on a
>> BeagleBone Black with an AM335X OMAP processor. There are likely many
>> more devices with compatible dma-controllers that could be supported
>> with additional dmaengine driver support. 
>>
>>
>>>> capable dma channel with interleaved trasfer support. Device tree
>>>> bindings are for providing appropriate dma channel to device.
>>>
>>> Don't describe what DT is, but the hardware.
>>>
>>
>> Ok, will remove reference to DT.
>>
>>>> +description: |-
>>>> +  A generic memory2memory device for deinterlacing video using
>>>> dmaengine. It can
>>>> +  convert between interlaced buffer formats and can convert
>>>> interlaced to
>>>> +  progressive using a simple line-doubling algorithm. This device
>>>> can be used on
>>>> +  any hardware that provides a MEM_TO_MEM capable dma controller
>>>> that supports
>>>> +  interleaved transfers.
>>>
>>> And how do you program that device to deinterlace? How do you signal
>>> end
>>> of frame/data when writing to the memory?
>>>
>>> It still looks all this is for driver :/
>>>
>>
>> All of the deinterlacing is handled by the dma channel. To simplify a
>> bit, m2m-deinterlace basically just translates video format information
>> into appropriate interleaved dma transfers. Everything else (and
>> everything hardware specific) is handled by the dma engine, such as
>> initiation and signaling completion of transfers. 
> 
> 
> So the device is the dma controller and maybe all this should be folded
> into that controller bindings.

Answering myself: obviously no, because interleaved DMA is not relevant
to this device, so again: there is no device in SoC doing that. You just
add bindings for specific Linux driver without saying that this is that
driver and calling it "generic device". There is no device here.


Best regards,
Krzysztof

