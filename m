Return-Path: <linux-media+bounces-26260-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D386A3957F
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 09:34:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD98218874F8
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 08:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3B7A22B8BF;
	Tue, 18 Feb 2025 08:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TRb3c/EY"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC8B14A614;
	Tue, 18 Feb 2025 08:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739867682; cv=none; b=WoPLceaFPTKdP5b4HO5sQ2B7XfnmHiikhKVStXnGplfnMTg6X3TbSjvxaltIF5mMT4BwRJE6pQ5Xdi/NT54BrLPUWGhAmblgn+dn6GH+3mY3Cft1a3ao2Y5vwrQZ+CG7tsDrLfgRGk2CmTZ/8Dk5IxRBEuwWQOWmCsiDD+vD+0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739867682; c=relaxed/simple;
	bh=eq2r3EqfURpJDfyUrO6e7ReKUX5wIYAdUMSspXkp1uc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W0rfeZEOwbYmEfwXPhdModvLLBd8bAEnk737EuasDtMsEJC2p+ggJxElNPsf+G/qW+eS2bTEuPiWmHUXKqxCEOeF/iuCYuFIspQpHdqGgBIDE3iGrBYkS3Idy8lqe92Z1tjHUXBtE38ArcPEyTysijcShrFugi5XLn95ymAwzvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TRb3c/EY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 209BBC4CEE2;
	Tue, 18 Feb 2025 08:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739867681;
	bh=eq2r3EqfURpJDfyUrO6e7ReKUX5wIYAdUMSspXkp1uc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TRb3c/EY/sJVCKw71472WLrZ4IEMuF8E8vTFPp4HbRW9WZO88B7ruAIJPTIrVy64z
	 N1GPzNO+6ef9OaJDenL1YYP9DE2aNb9fkoBDh6C9iA86Caoa8O7iFNBfBowPTLeBK9
	 BjFwJ56Qo9zL1vyTduZmFrRtZg7sns95U0oJ/DnPuMRjHORsim0gx311cauOTMJjHW
	 t8K/Ql/2sQFPhaazeBqsy+nS/mbSVFTTrEMRHw1fdpq5OflgFlupFy7e+Kr6lNbq3t
	 xWYuxx8DRjWXg7VLp1T27oDj7HndVV9ZAbt/uMQDvJD5QsBM+rllQQ7e11U4ehwudk
	 H1/5fel3iKPSA==
Message-ID: <29a8e7ec-dabc-4cc1-a262-676ebd838dfd@kernel.org>
Date: Tue, 18 Feb 2025 09:34:34 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: dt-bindings: Add dt bindings for
 m2m-deinterlace device
To: Matthew Majewski <mattwmajewski@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 "Dr. David Alan Gilbert" <linux@treblig.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Uwe Kleine-Konig <u.kleine-koenig@baylibre.com>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
Cc: devicetree@vger.kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250212170901.3881838-1-mattwmajewski@gmail.com>
 <20250212170901.3881838-2-mattwmajewski@gmail.com>
 <5e9432d7-0be1-4d98-9a61-cd288e53e772@kernel.org>
 <91fbc8f06f4d57f5e3d25dfec99e2fdb76b0a4cb.camel@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <91fbc8f06f4d57f5e3d25dfec99e2fdb76b0a4cb.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/02/2025 23:29, Matthew Majewski wrote:
> Hi Krzysztof, thanks for the quick feedback. 
> 
> On Wed, 2025-02-12 at 18:22 +0100, Krzysztof Kozlowski wrote:
>> On 12/02/2025 18:09, Matthew Majewski wrote:
>>> Create a new yaml schema file to describe the device tree bindings
>>> for
>>> the generic m2m-deinterlace driver.
>>
>>
>> Bindings are for hardware, not drivers, and usually not generic.
>>
> 
> Ok, I'll change the wording from "driver" to "device" in V2.
> 
>> Please describe here exemplary devices.
> 
> The m2m-deinterlace device can be used on any hardware that provides a
> MEM_TO_MEM and interleaved capable dma channel. I'll note that in the
> commit message for V2 as well.

I asked to give names of actual hardware you are writing bindings for.

> 
>>>
>>> +description: |
>>> +  A generic memory2memory device for deinterlacing video
>>> +  using dmaengine.
>>
>> And what is this generic device supposed to do? What fits to generic
>> device?
>>
> 
> The term "generic" was taken from the driver description. It's generic
> insofar as it only relies on the dmaengine API for processing (and
> hence is relatively platform agnostic).
> 
> I will add more information about the device in the description for V2.
> I'll also mention that it's intended for converting between interlaced
> and non-interlaced formats by line-doubling. 
> 
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: m2m-deinterlace
>>> +
>>> +  dma-names:
>>> +    items:
>>> +      - const: rxtx
>>> +
>>> +  dmas:
>>> +    items:
>>> +      - description: mem-to-mem capable DMA channel
>>> +
>>> +required:
>>> +  - compatible
>>> +  - dma-names
>>> +  - dmas
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    m2m-deinterlace {
>>> +        compatible = "m2m-deinterlace";
>>> +        dma-names = "rxtx";
>>> +        dmas = <&edma 20 0>;
>>
>>
>> This all looks rather like bindings for driver and not even quite
>> generic because looks quite simple. I guess media folks will provide
>> more input, but anyway it looks a bit not-DT-enough.
>>
>>> +    };
> 
> Yes, the bindings are much simpler than a typical media device, but
> that is because the m2m-deinterlace device only needs to be provided a
> handle to a dma channel to function properly. My reasoning for adding 

Really only this? How do you reset the device? How do you clock it (or
does it come with internal oscillator?) How do you program anything
there if there are no resources?


> dt-bindings for this device is because it is a consumer of a dma-
> channel and the dt bindings are a platform-agnostic way to be able to
> provide a specific dma channel to the device.
> 
> As an example, say on an embedded device I have a dma controller which
> provides multiple interleaved MEM_TO_MEM capable channels. I want the

I asked about the names already, still nothing.

> m2m-deinterlace device to consume one particular channel because it is
> higher-priority than the others. With these dt-bindings I can simply
> specify the correct dma channel that should be used. Without the
> device-tree bindings I would have to manually edit the driver to filter
> for the correct dma channel to be used, but then the device is no
> longer "generic".
> 
> It would be helpful to hear what the media people have to say about it.

Then wait before sending new version.



Best regards,
Krzysztof

