Return-Path: <linux-media+bounces-35715-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49215AE5C58
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 08:01:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABCF116D9D2
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 06:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56490231CB0;
	Tue, 24 Jun 2025 06:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FbdptENK"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBF0182D2;
	Tue, 24 Jun 2025 06:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750744891; cv=none; b=D2MIsfplcZIOAY4sNM3nBVs2D44JqUW7uKS3x7NsdER7BSUoB/EdYTsoKTMHnwOAW+J7iI+ZaThHSJ/dHC9eRYWE2LVEiwY+vJ6Y2Wo5uqI9NScPIktNgdPlmvSfuccEkhPGj9L2Z5y03YduEv4lAPLQMo77jT8IRHsZk6mFMgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750744891; c=relaxed/simple;
	bh=Re4L/KbulPTuPxlNaGjKu3leE53gc/OLFGO6Ell44L4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BtcpdxwhrWrRyyaJsidX5aZCqdEV3kVNSf1QSQPqQPeRV509t2qMp6MZWgixxiqVL9vvraq8z0kshu0D/sGQJOsiG+UOimGdGWZPrCBYIscnNGhboNDNRsta/H5faDDv0Pz5JB1KsHSc/z0DG2RgZRhohk65M8dmbe+EPpG4HWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FbdptENK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55955C4CEE3;
	Tue, 24 Jun 2025 06:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750744891;
	bh=Re4L/KbulPTuPxlNaGjKu3leE53gc/OLFGO6Ell44L4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FbdptENK06EEkYc+6bTBNOfYETEqh4ezWe15oEn18fNaJ6Qqd7if4s2vC/EG38DI+
	 lE0Le7bAZPfZxNXQNsZ89T5JkZqrkc/VI3LtIA31OwH9FxmnXrahCylDLTZMh6NNI7
	 8BKLXpq9twkQvJGYTkoKlKcYyRQ7teUd2jfTYm4sNo6QgRmk6BcnL6hB34TkfHWJSL
	 Cho5S2JMASOEK1visKc42GGUtlt3JgOoFwxrOeUIlr/tqXcSrwBKatTBbiDJ8Aef8M
	 iQixiXjhU+CDor79rmwe+wClFeK5RvNtzelBmJKUs3Zm8uQUCL5ayZfcKn8zFBv/AN
	 +fwfGoj2B6qQQ==
Message-ID: <10127f4d-a6bf-44b7-8d07-89f1c462ff8e@kernel.org>
Date: Tue, 24 Jun 2025 08:01:25 +0200
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
 <e00ec6f8-479e-46c4-9c99-7de4c9fa1c27@kernel.org>
 <CAPY8ntCkgnwhA_OuDY3zMMrptFmLqTm_mLdmdLeO5txyFuG1Jw@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CAPY8ntCkgnwhA_OuDY3zMMrptFmLqTm_mLdmdLeO5txyFuG1Jw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/06/2025 19:54, Dave Stevenson wrote:
>>
>>> +          - brcm,bcm2711-hevc-dec
>>> +          - brcm,bcm2712-hevc-dec
>>>
>>>> You referred to file "raspberrypi,pisbe.yaml" before, but there is no
>>>> such file in the next.
>>>
>>> Typo.
>>> https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/media/raspberrypi%2Cpispbe.yaml
>>> Reviewed by Rob only just over a year ago [2]
>>
>> There were some discussions and reasons with explanations.
>> Feel free to use same arguments and accurately describe the hardware, so
>> we won't be needing to ask usual questions.
> 
> Sorry if the previous descriptions hadn't been clear. All the same
> points as for raspberrypi,pispbe.yaml apply here, which is why I'd
> tried to link to it originally.
> 
> Describe the hardware:
> Raspberry Pi designed and are the sole owners of the IP for this HEVC
> decoder block. This is *not* Broadcom IP.
> 
> That design was given to Broadcom as Verilog to wire into the
> bus/interrupt/clock fabric of BCM2711, and to manufacture it via TSMC
> on a 28nm process node.
> 
> A few years later the same design was given to Broadcom to wire into
> BCM2712, and to manufacture it on a 16nm process node.
> 
> As it is Raspberry Pi owned IP it can be used in other places than
> Broadcom SoCs.
> Broadcom does not have a licence to use the IP in any other of their chips.
> 
> It is the same situation as for raspberrypi,pispbe.yaml except the
> block already exists in 2 chips rather than just the 1. There also
> isn't a version register in the hardware that is different between
> those chips (an oversight noted for future chips).
> It could be compared to a Synopsis or Cadence IP block dropped into an
> SoC. The vendor prefix happens to be raspberrypi instead of snps or
> cdns.
> 
> Is there any part that needs to be further clarified?

Dunno, thread is way too old to be in my inbox. Anyway, it is part of
the SoC as you said, so SoC compatibles rules apply here. It's the same
for Synopsys.

> 
>> Anyway, we asked for fallback, so you need items, just like every SoC
>> compatible (see also example schema).

Just implement the feedback.

>>
>>
>>>
>>>> Before you reply that there is a binding using different rules: well,
>>>> there is always poor code. Above two comments are repeated, especially
>>>> this about specific compatible - all the time, so these are not new
>>>> rules. These are given in reviews since some years.
>>>
>>> My Google-foo is totally failing with the only directly relevant
>>> mention of "fallback compatible" I find is [3], which just says to use
>>> them.
>>>
>>> You're effectively saying I can't take anything in the kernel tree as
>>> being a valid example as it could be poor code, and a layman such as
>>> myself has no way of telling.
>>
>> No, I am saying that argument "I saw someone doing this, so I am allowed
>> to do the same" is not correct. There are good and bad examples. For
>> example in my talks I mentioned good examples. The list of good examples
>> was not accepted to the kernel so well... I just use as an example any
>> recent Qcom binding using specific compatibles.
>>
>>> Could you please point me at documentation and examples I can rely on,
>>> or educate me with what is wanted in this situation to avoid me having
>>> to guess?
>>>
>>> A further mailing list search has brought up [4] which is a thread
>>> with yourself from 2 years ago which looks to be a very similar
>>> situation. Other than missing the const on the SoC strings (although
>>> that isn't in the merged version of cnm,wave521c.yaml), and two SoC
>>> specific strings, I'm not seeing an obvious difference between there
>>> and here either.
>>
>> How is the [4] relevant? That's IP block from other vendor.
> 
> It was another example of an IP block belonging to vendor A being
> added into an SoC from vendor B, same as the situation here. Raspberry
> Pi != Broadcom.

People hide real explanation, real facts, so don't use one example for
other case. I was told *explicitly* that Raspberry ISP or whatetever it
was called, was NOT PART OF the SoC. Now you said:
"A few years later the same design was given to Broadcom to wire into
BCM2712, and to manufacture it on a 16nm process node."


Best regards,
Krzysztof

