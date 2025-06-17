Return-Path: <linux-media+bounces-35035-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C44ADC3CB
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 09:55:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A33C1896E5B
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 07:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09B1928F51A;
	Tue, 17 Jun 2025 07:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nLyu2AU3"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA521E008B;
	Tue, 17 Jun 2025 07:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750146909; cv=none; b=ewEdK2jWbiLRNWS8psIGop8u0jdhbGSObZZRBATSpi479J7sdqNv6qNw5y1Fuht4SaLEIxbxX6vm32ms6yhCyAeQeLfzG6s/wE9UmB9uzQ/WONPUzihEXmAbkldKrWE3zX28fY/Dbzj1iPdQU3ARz7GnmcxnSEEkYzVCLAQUvRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750146909; c=relaxed/simple;
	bh=p3P9QL1Q/bB2osrnrmMdPHDXHWkXxUr+dLGsCfhdwL0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gy50JDUxsNQO0r1EBbMlUBYiBH+7Cb0IztZhLoUPplZLF8mNH3TBgv6I5pcGL1p5va6JkJnUNRRqEiORYX5xbF1HLh6FrwVZtytMSwqmdnUB5BQwalEuqx0NYsQfNWIcDnBijpTREoajlNES1vi+gMWhg8T7K2lWBGtCtqA6Br8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nLyu2AU3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E158CC4CEE3;
	Tue, 17 Jun 2025 07:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750146908;
	bh=p3P9QL1Q/bB2osrnrmMdPHDXHWkXxUr+dLGsCfhdwL0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nLyu2AU3hnSwHwbfR+veBhM2vUFPR2CmJGofG+ayqDh9D/vpwl7jczoug55hz50BD
	 Bs2fhuf6L80ZDGE+5W6ekio/lvu+kCOZ5GWNITFYPvcRNC/0fzIoSTFVz/GIq9eFGS
	 Gd+5Hci3mmtO5Sj9NlsQ/e3kBfzMEQfE1OHlY+CV48Xs8A+k3UsRWv8wy7V/2AKrQM
	 lgd7c4lGXFt1fIGFYuBvr9/aZZp3X2craHNM9UgsT3/AMqLNzxG4G1SuXcpKkn+QF9
	 uynWsok5X3BYPbD/9Kprmy2t6grLm+g2oqeeEhICG9f+tEkuKHj6YBPjZChECo7Pjb
	 xPkT3VqpCtC+g==
Message-ID: <86817edd-a966-4a39-9622-7cef7f070e42@kernel.org>
Date: Tue, 17 Jun 2025 09:55:04 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: media: venus: Add qcm2290 dt schema
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
Cc: quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com,
 bryan.odonoghue@linaro.org, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, stanimir.varbanov@linaro.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250613140402.3619465-2-jorge.ramirez@oss.qualcomm.com>
 <6f4e715f-1c73-450e-b7eb-92781b7fa050@kernel.org> <aFATp3zoSgkrj3YX@trex>
 <a76789cf-afe1-4d91-afdf-65c3af5ad11f@kernel.org> <aFBDzWLkKC9MWGoC@trex>
 <48e6cc62-ffb0-4ca7-80c8-9e510db505db@kernel.org> <aFBNVjl4n7I+OkO5@trex>
 <c7aef6cd-e07d-4422-a34a-ce04c37ad2e8@kernel.org> <aFEPfjJLEMnIriXX@trex>
 <0d381ad0-85d4-43de-a050-3b9ed03bf5d8@kernel.org> <aFEZnrMUH7qorvnt@trex>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <aFEZnrMUH7qorvnt@trex>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/06/2025 09:30, Jorge Ramirez wrote:
> On 17/06/25 08:56:37, Krzysztof Kozlowski wrote:
>> On 17/06/2025 08:47, Jorge Ramirez wrote:
>>> On 17/06/25 08:14:23, Krzysztof Kozlowski wrote:
>>>> On 16/06/2025 18:59, Jorge Ramirez wrote:
>>>>> On 16/06/25 18:23:18, Krzysztof Kozlowski wrote:
>>>>>> On 16/06/2025 18:18, Jorge Ramirez wrote:
>>>>>>> On 16/06/25 16:41:44, Krzysztof Kozlowski wrote:
>>>>>>>> On 16/06/2025 14:52, Jorge Ramirez wrote:
>>>>>>>>>>
>>>>>>>>>>> +  The Venus AR50_LITE IP is a video encode and decode accelerator present
>>>>>>>>>>> +  on Qualcomm platforms
>>>>>>>>>>> +
>>>>>>>>>>> +allOf:
>>>>>>>>>>> +  - $ref: qcom,venus-common.yaml#
>>>>>>>>>>> +
>>>>>>>>>>> +properties:
>>>>>>>>>>> +  compatible:
>>>>>>>>>>> +    const: qcom,qcm2290-venus
>>>>>>>>>>> +
>>>>>>>>>>> +  power-domains:
>>>>>>>>>>> +    minItems: 2
>>>>>>>>>>> +    maxItems: 3
>>>>>>>>>>> +
>>>>>>>>>>> +  power-domain-names:
>>>>>>>>>>> +    minItems: 2
>>>>>>>>>>
>>>>>>>>>> Why is this flexible? Either you have two or three. Not mixed.
>>>>>>>>>
>>>>>>>>> please check 5b380f242f360256c96e96adabeb7ce9ec784306
>>>>>>>>
>>>>>>>> This does not explain why this is optional HERE. You cannot use for a
>>>>>>>> new platform an argument that some existing platform was changed in
>>>>>>>> ABI-preserving way.
>>>>>>>
>>>>>>> thanks for quick the follow up.
>>>>>>>
>>>>>>> but bear with me please because I dont follow - why can the same logic
>>>>>>> be used - it being applicable - and therefore result in a definition
>>>>>>> similar to those other platforms?
>>>>>>
>>>>>> Because this platform either has 2 or 3, not both. Unless that's not
>>>>>> true, but then please share some arguments.
>>>>>
>>>>> as with every other venus schema with more than 1 power domain, the
>>>>> argument is the same one that I have shared with you a couple of
>>>>> messages back (DVFS).
>>>>>
>>>>> verbatim:
>>>>>     Venus needs to vote for the performance state of a power domain (cx)
>>>>>     to be able to support DVFS. This 'cx' power domain is controlled by
>>>>>     rpm and is a common power domain (scalable) not specific to
>>>>>     venus alone. This is optional in the sense that, leaving this power
>>>>>     domain out does not really impact the functionality but just makes
>>>>>     the platform a little less power efficient.
>>>>
>>>> That's not definition of optional. The domain is needed for this device,
>>>> the device is one way or another having its rails routed to that domain.
>>>> It is not optional.
>>>>
>>>>>
>>>>> Seeing all these venus schemas follow the same pattern, it seems to me
>>>>> that this is the correct way of implementing the above.
>>>>
>>>> No for the reason I mentioned earlier.
>>>
>>> So just to close this story up, were these two commits wrongly
>>> reviewed and signed off then ? Please do notice they were also - just
>>> like this one - new additions and not a change in an ABI preserving way
>>> as you characterize them.
>>>
>>> e48b839b6699c2268e545360e06962bb76ff5b8d
>>> 8d3a1cb32124eaeb3f2efe4889de214d3b658d8d
>>
>> I was waiting for this argument: there was something similar some years
>> ago (but even months ago...) and it got reviewed, so I can do the same.

Waiting and hoping discussion will end earlier... but I guess I should
anticipate your arguments and find preemptively some commits from 4
years ago. Well, I have just 100 patches on patchwork with status "Needs
Review", so I will not go through past commits anticipating other
persons arguments when reviewing that person's patches.

Help in reviews is always appreciated, especially if by any chance you
are unhappy with me not having time to bring past commits into the
review discussions.

Best regards,
Krzysztof

