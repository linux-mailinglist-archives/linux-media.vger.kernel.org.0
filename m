Return-Path: <linux-media+bounces-31231-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A4CA9F7CC
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 19:57:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB9EC1A81B83
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 17:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E14302951A9;
	Mon, 28 Apr 2025 17:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LR62Am6W"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4498E4AEE2;
	Mon, 28 Apr 2025 17:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745863020; cv=none; b=KtqhnvW61GATquIaq+N3UDuX5kEffxrEEFGHJBgJyxD1+f7rHrm4zXChb8Rog2pT3Pi3oRaQ12sjimfK3rEBziehIEpbIzNwf9aer1HOub6GUt1WBkBT4hpWhjynX50YS8LNhNH2YT3VwR03G6OVnfBtEbtn0T9jQU227SJpFUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745863020; c=relaxed/simple;
	bh=6sSqIjjMb5dgxnnth90EefvvkhjjHWZTx2JaVDNrCME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J7HkOlm18d+iHWkmUTa1B+17jhXCE3N8ItqIOnG8Nye9DqiIB5WuxHZgh7Zh2dO5cD4NPZJvMVPRG/TNLeAJ4uAkftZAf2x7As+1w5etXwtOixOjihUi0Us7MjYnKLxjNEnVTXN1rWJdl6bYLO8YBZ47lv4Cl7eizw3SlY8WnOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LR62Am6W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A20EFC4CEE4;
	Mon, 28 Apr 2025 17:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745863019;
	bh=6sSqIjjMb5dgxnnth90EefvvkhjjHWZTx2JaVDNrCME=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LR62Am6WKH/7SD0zqaWk8+1x0EHWCDdALwrUvN7WCkuj04hamMrzB3gzXyIgiIPkr
	 wFSU3WSkieVz/gJXkzYfJ5FnkXA3sGag83KtuEkGPjEDAKLfXVp+5NWo8Id12AW/eg
	 ztWMadJFxmNEYayDBnkP/80B1JJ0UfJrJ+yQGNebdpWnSi+AZlge+w5vGa0fOh7hSb
	 sLzYhMv/QJlrd8RNyypLDRu/0p6A9szUro77UcIOrO/rhSFZT1RHl508UDjn7ztoWT
	 KSWXpsTdG54YbjRey0Pu4g0g9DQukZG7/Ro5dtOiCjTm0EVZtb6A6vj9FECx2Q4KIR
	 BUTSnjoDvaZwA==
Message-ID: <e00ec6f8-479e-46c4-9c99-7de4c9fa1c27@kernel.org>
Date: Mon, 28 Apr 2025 19:56:53 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] media: dt-bindings: media: Add binding for the
 Raspberry Pi HEVC decoder
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, John Cox
 <john.cox@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>,
 review list <kernel-list@raspberrypi.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, John Cox
 <jc@kynesim.co.uk>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20250423-media-rpi-hevc-dec-v3-0-8fd3fad1d6fb@raspberrypi.com>
 <20250423-media-rpi-hevc-dec-v3-3-8fd3fad1d6fb@raspberrypi.com>
 <20250425-inescapable-beagle-of-bliss-8ae3ff@kuoka>
 <CAPY8ntCWzp9cRKwLg44G20jG17q2KhavZa_8qpodhGUGS2Bc7Q@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <CAPY8ntCWzp9cRKwLg44G20jG17q2KhavZa_8qpodhGUGS2Bc7Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/04/2025 12:03, Dave Stevenson wrote:
> Hi Krzysztof
> 
> On Fri, 25 Apr 2025 at 08:53, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On Wed, Apr 23, 2025 at 06:20:20PM GMT, Dave Stevenson wrote:
>>> Adds a binding for the HEVC decoder found on th +maintainers:
>>> +  - John Cox <john.cox@raspberrypi.com>
>>> +  - Dom Cobley <dom@raspberrypi.com>
>>> +  - Dave Stevenson <dave.stevenson@raspberrypi.com>
>>
>>> +  - Raspberry Pi internal review list <kernel-list@raspberrypi.com>
>>
>> Drop, no mailing lists in bindings maintainers. These must be people.
> 
> Ack
> 
>>> +
>>> +description:
>>> +  The Raspberry Pi HEVC decoder is a hardware video decode accelerator block
>>> +  found in the BCM2711 and BCM2712 processors used on Raspberry Pi 4 and 5
>>> +  boards respectively.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - enum:
>>> +          - brcm,bcm2711-hevc-dec
>>> +          - brcm,bcm2712-hevc-dec
>>> +      - const: raspberrypi,hevc-dec
>>
>> Not what Rob asked. You should use specific SoC compatible as fallback.
> 
> In which case I don't understand what Rob was asking for.
> I asked for clarification in [1], but got no reply. Sending a new
> version has at least got an answer, but I'm none the wiser.
> 
> Staring at this trying to work out your meaning, you want the generic
> first, and SoC specific second? ie
> +  compatible:
> +    items:
> +      - const: raspberrypi,hevc-dec

Drop

> +      - enum:

That's enum, not fallback.

> +          - brcm,bcm2711-hevc-dec
> +          - brcm,bcm2712-hevc-dec
> 
>> You referred to file "raspberrypi,pisbe.yaml" before, but there is no
>> such file in the next.
> 
> Typo.
> https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/media/raspberrypi%2Cpispbe.yaml
> Reviewed by Rob only just over a year ago [2]

There were some discussions and reasons with explanations.

Feel free to use same arguments and accurately describe the hardware, so
we won't be needing to ask usual questions.

Anyway, we asked for fallback, so you need items, just like every SoC
compatible (see also example schema).


> 
>> Before you reply that there is a binding using different rules: well,
>> there is always poor code. Above two comments are repeated, especially
>> this about specific compatible - all the time, so these are not new
>> rules. These are given in reviews since some years.
> 
> My Google-foo is totally failing with the only directly relevant
> mention of "fallback compatible" I find is [3], which just says to use
> them.
> 
> You're effectively saying I can't take anything in the kernel tree as
> being a valid example as it could be poor code, and a layman such as
> myself has no way of telling.

No, I am saying that argument "I saw someone doing this, so I am allowed
to do the same" is not correct. There are good and bad examples. For
example in my talks I mentioned good examples. The list of good examples
was not accepted to the kernel so well... I just use as an example any
recent Qcom binding using specific compatibles.

> Could you please point me at documentation and examples I can rely on,
> or educate me with what is wanted in this situation to avoid me having
> to guess?
> 
> A further mailing list search has brought up [4] which is a thread
> with yourself from 2 years ago which looks to be a very similar
> situation. Other than missing the const on the SoC strings (although
> that isn't in the merged version of cnm,wave521c.yaml), and two SoC
> specific strings, I'm not seeing an obvious difference between there
> and here either.

How is the [4] relevant? That's IP block from other vendor.

https://www.kernel.org/doc/html/latest/devicetree/bindings/writing-bindings.html#properties

https://elixir.bootlin.com/linux/v6.3-rc6/source/Documentation/devicetree/bindings/sound/nvidia,tegra210-ope.yaml#L31

Best regards,
Krzysztof

