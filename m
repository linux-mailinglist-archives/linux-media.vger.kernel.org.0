Return-Path: <linux-media+bounces-38046-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5BBB09B69
	for <lists+linux-media@lfdr.de>; Fri, 18 Jul 2025 08:29:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DAFB77BADC2
	for <lists+linux-media@lfdr.de>; Fri, 18 Jul 2025 06:27:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E93720101F;
	Fri, 18 Jul 2025 06:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ItMvANtR"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAE61F4CB7;
	Fri, 18 Jul 2025 06:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752820048; cv=none; b=sSSWsP5md1A2JjbxGCGeqHEn32PDhKkG7DDzTToocIpUwh3WyO9NKdl1KNoaiIOPFj+0+gb6jYZarXNER2MX4V2HAQVVk97+Uhjdqsj5FPyw2itIIOm53Yc8mD3nDUqG74+h+k0ygk6Fz409ehoTb34PDxUMs/kq2QFRyMldQQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752820048; c=relaxed/simple;
	bh=YHIOIgkhGTfSCcRERKWuADMAyhbxHx3qzK3QbrYJlH0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eLraS3Rhc2EdueAX8hjL4BFkj+QEYHI0OMSWci6ZcaT+Pp1m0Vhfn9KbvJ7nBvxvGa40Igt2Lydp8Ym0kJqXiMXk9JLSnFhehDpFwp/OdVkzxDbsRtFXTS9AzYdswhW8rWA3xEAj4+HLBwYHgYfXkYvUqnw7xSkdnDBTdhvaCws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ItMvANtR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3201C4CEED;
	Fri, 18 Jul 2025 06:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752820047;
	bh=YHIOIgkhGTfSCcRERKWuADMAyhbxHx3qzK3QbrYJlH0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ItMvANtRGhMtyWJwDc6jLH9ISHiktN4P/s5OhyOVWMZ47lsjSOYbsD9EPMD5Ms7Mi
	 jxkt1r/ajlz+HZv075Abti7BBbG5GkoiK1KpQME4u/inls0EoGkhwMuVV3cdGUVhGV
	 RTJeiI/tGfz+sTqmPYtKgFcbGqvxjXnAp4layvshzzpyI/7FPwwO32tWm09naOMoEW
	 2r7/nw8Qa/cYpeNWmmGkgbgysUfAiGDCTZt3LZ36qt/TjOU66uJq1RDbrEly0WMz1y
	 L+/DIFkyui+6j9ecQwGLHZb/VF0NBH2V5rlL/NXu7hqUsSqAfmLp/t8Uv5DjS2+fGD
	 Lv5E55r4wKM5A==
Message-ID: <5afbaf46-bbb1-47d8-84aa-29b18987564f@kernel.org>
Date: Fri, 18 Jul 2025 08:27:23 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/7] media: dt-bindings: venus: Add qcm2290 dt schema
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, quic_vgarodia@quicinc.com,
 quic_dikshita@quicinc.com, krzk+dt@kernel.org, konradybcio@kernel.org,
 mchehab@kernel.org, andersson@kernel.org, conor+dt@kernel.org,
 amit.kucheria@oss.qualcomm.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250715204749.2189875-1-jorge.ramirez@oss.qualcomm.com>
 <20250715204749.2189875-2-jorge.ramirez@oss.qualcomm.com>
 <8a63f517-a443-48e4-9b9c-0c4b362f59f8@linaro.org> <aHiZpnFhhR5O0h97@trex>
 <0bb2867a-393b-46f9-ad6f-1aeee5a3a9d4@kernel.org> <aHjbjw8Z79Xcd/ZJ@trex>
 <aHksJum91s4ZmI56@trex>
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
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJoF1BKBQkWlnSaAAoJEBuTQ307
 QWKbHukP/3t4tRp/bvDnxJfmNdNVn0gv9ep3L39IntPalBFwRKytqeQkzAju0whYWg+R/rwp
 +r2I1Fzwt7+PTjsnMFlh1AZxGDmP5MFkzVsMnfX1lGiXhYSOMP97XL6R1QSXxaWOpGNCDaUl
 ajorB0lJDcC0q3xAdwzRConxYVhlgmTrRiD8oLlSCD5baEAt5Zw17UTNDnDGmZQKR0fqLpWy
 786Lm5OScb7DjEgcA2PRm17st4UQ1kF0rQHokVaotxRM74PPDB8bCsunlghJl1DRK9s1aSuN
 hL1Pv9VD8b4dFNvCo7b4hfAANPU67W40AaaGZ3UAfmw+1MYyo4QuAZGKzaP2ukbdCD/DYnqi
 tJy88XqWtyb4UQWKNoQqGKzlYXdKsldYqrLHGoMvj1UN9XcRtXHST/IaLn72o7j7/h/Ac5EL
 8lSUVIG4TYn59NyxxAXa07Wi6zjVL1U11fTnFmE29ALYQEXKBI3KUO1A3p4sQWzU7uRmbuxn
 naUmm8RbpMcOfa9JjlXCLmQ5IP7Rr5tYZUCkZz08LIfF8UMXwH7OOEX87Y++EkAB+pzKZNNd
 hwoXulTAgjSy+OiaLtuCys9VdXLZ3Zy314azaCU3BoWgaMV0eAW/+gprWMXQM1lrlzvwlD/k
 whyy9wGf0AEPpLssLVt9VVxNjo6BIkt6d1pMg6mHsUEVzsFNBFVDXDQBEADNkrQYSREUL4D3
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
 YpsFAmgXUF8FCRaWWyoACgkQG5NDfTtBYptO0w//dlXJs5/42hAXKsk+PDg3wyEFb4NpyA1v
 qmx7SfAzk9Hf6lWwU1O6AbqNMbh6PjEwadKUk1m04S7EjdQLsj/MBSgoQtCT3MDmWUUtHZd5
 RYIPnPq3WVB47GtuO6/u375tsxhtf7vt95QSYJwCB+ZUgo4T+FV4hquZ4AsRkbgavtIzQisg
 Dgv76tnEv3YHV8Jn9mi/Bu0FURF+5kpdMfgo1sq6RXNQ//TVf8yFgRtTUdXxW/qHjlYURrm2
 H4kutobVEIxiyu6m05q3e9eZB/TaMMNVORx+1kM3j7f0rwtEYUFzY1ygQfpcMDPl7pRYoJjB
 dSsm0ZuzDaCwaxg2t8hqQJBzJCezTOIkjHUsWAK+tEbU4Z4SnNpCyM3fBqsgYdJxjyC/tWVT
 AQ18NRLtPw7tK1rdcwCl0GFQHwSwk5pDpz1NH40e6lU+NcXSeiqkDDRkHlftKPV/dV+lQXiu
 jWt87ecuHlpL3uuQ0ZZNWqHgZoQLXoqC2ZV5KrtKWb/jyiFX/sxSrodALf0zf+tfHv0FZWT2
 zHjUqd0t4njD/UOsuIMOQn4Ig0SdivYPfZukb5cdasKJukG1NOpbW7yRNivaCnfZz6dTawXw
 XRIV/KDsHQiyVxKvN73bThKhONkcX2LWuD928tAR6XMM2G5ovxLe09vuOzzfTWQDsm++9UKF a/A=
In-Reply-To: <aHksJum91s4ZmI56@trex>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/07/2025 19:00, Jorge Ramirez wrote:
> On 17/07/25 13:16:31, Jorge Ramirez wrote:
>> On 17/07/25 08:45:17, Krzysztof Kozlowski wrote:
>>> On 17/07/2025 08:35, Jorge Ramirez wrote:
>>>> On 17/07/25 00:22:53, Bryan O'Donoghue wrote:
>>>>> On 15/07/2025 21:47, Jorge Ramirez-Ortiz wrote:
>>>>>> Add a schema for the venus video encoder/decoder on the qcm2290.
>>>>>>
>>>>>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
>>>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>>>> ---
>>>>>>   .../bindings/media/qcom,qcm2290-venus.yaml    | 127 ++++++++++++++++++
>>>>>>   1 file changed, 127 insertions(+)
>>>>>>   create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
>>>>>> new file mode 100644
>>>>>> index 000000000000..0371f8dd91a3
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
>>>>>> @@ -0,0 +1,127 @@
>>>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>>>> +%YAML 1.2
>>>>>> +---
>>>>>> +$id: http://devicetree.org/schemas/media/qcom,qcm2290-venus.yaml#
>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>> +
>>>>>> +title: Qualcomm QCM2290 Venus video encode and decode accelerators
>>>>>> +
>>>>>> +maintainers:
>>>>>> +  - Vikash Garodia <quic_vgarodia@quicinc.com>
>>>>>
>>>>> Shouldn't you be on this list ? If you upstream a file I think you should
>>>>> list yourself as responsible for its glory or its mess.
>>>>
>>>> happy to do it. The MAINTAINER's file covered all the files named
>>>
>>> This should be the person(s) interested and caring about this hardware,
>>> which means:
>>> 1. Subsystem maintainers: no
>>> 2. Driver maintainers: usually yes
>>> 3. Author(s) of new hardware support: usually yes
>>
>> perfect, will do 
>>
>>>
>>>> schemas/media/*venus* so my understanding was that I shouldn't.
>>>
>>> I cannot comment why people decided to go one way or another in other
>>> code, but it as well could be just incorrect choice thinking only people
>>> in MAINTAINERS care about hardware.
>>>
>>> ...
>>>
>>>>>> +
>>>>>> +        memory-region = <&pil_video_mem>;
>>>>>> +        iommus = <&apps_smmu 0x860 0x0>,
>>>>>> +                 <&apps_smmu 0x880 0x0>,
>>>>>> +                 <&apps_smmu 0x861 0x04>,
>>>>>> +                 <&apps_smmu 0x863 0x0>,
>>>>>> +                 <&apps_smmu 0x804 0xe0>;
>>>>>
>>>>> You're listing five iommus.
>>>>>
>>>>> I understand there's some disagreement about whether or not to list all of
>>>>> the potential use-cases but, TBH I don't think those are good arguments.
>>>>>
>>>>> Unless there's some technical prohibition I can't think of listing all five
>>>>> maxItems:5 .. let's just do that.
>>>>
>>>> since the device tree should describe hardware and not policy, and the
>>>> driver seems to be able to ignore the unused SIDs I think this is the
>>>> right thing to do.
>>>
>>>
>>> It was never about the driver but about whether you should describe in
>>> DTS for non-secure world the entries which are secure world. The answer
>>> in general is that you can and there will be benefits (e.g. sharing DTS
>>> with secure world implementations).
>>
>> all right, sounds good then, thanks
> 
> Not sure if I’ve shared this before, but following an internal
> discussion, I think it’s worth highlighting a functional dependency in
> the current kernel:
> 
>  - the driver only works if the first two IOMMUs in the list — the
> non-secure ones — are placed at the beginning. Reordering them breaks
> functionality, which introduces unexpected fragility.
> 
> Regardless, this seems like a valid concern to me — a driver shouldn't
> rely on the order of phandles — and I just wanted to make sure you're
> aware of it before I post a v8 (likely sometime next week or the
> following, as I’ll be taking a short break soon).


Hm? Order of lists is strictly defined. That's actually an overlook that
we never do it for iommus, but the core rule stays.


Best regards,
Krzysztof

