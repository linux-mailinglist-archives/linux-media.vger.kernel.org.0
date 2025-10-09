Return-Path: <linux-media+bounces-44095-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC55BC9657
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 15:59:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E495D4F516F
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 13:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D2A42EA154;
	Thu,  9 Oct 2025 13:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jvCn5gK9"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD651DE8B3;
	Thu,  9 Oct 2025 13:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760018367; cv=none; b=qEf5t7yP/Iq0OZMOoVmodFXSAe5au22weklcx6+gzwFDHFLge1K1OCpbLbJbCnPiAs9y4UP4fMSwZLW8Gl/0YEYLYAI7bubIXhUeCx/dTyUWgXvrYH3LvFiJoKEh0ABXzpfB5F2kug09QwxxIpkLsHHYaEMW/hcVh4aduhYKoeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760018367; c=relaxed/simple;
	bh=iNDaFwd/+nHWC4AzJm7JeHk7mdsdzAkeN+HSGpKQbHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=btxcNSRDeBJ1sBhCbFRvBVBNG4QRfczphY9GnvZDUQx2ujcsbNgzifz1RRtZlm8oU3L9Zk4r2nlYnUNdFhGpI5LcWr9/sVOO2QqMrRIOUPv79725OddLlRqhi+amp8KDDehBz9scW+7HrUL95pwEQsaCK8Bdk0Ebe6WPaeOGxqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jvCn5gK9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0208CC4CEE7;
	Thu,  9 Oct 2025 13:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760018366;
	bh=iNDaFwd/+nHWC4AzJm7JeHk7mdsdzAkeN+HSGpKQbHQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jvCn5gK9Eq2wmH6y5a8smkGkWnqVn4Vac4oDJkd12bn3tqMBkks/zgYP2oY9WY7Mw
	 Q8yOTFNh11sx2Cq7dLgDfVnGuZXlpwttWLDlbg1p4XS5Ejw7c2yeCY/NerQE62r+rA
	 epQmpavkqUwSe2mno8Ozs1+JzH0KUhOQ30qeLXBzR4riIHx4aJjWv94AaGTRp3D3Cy
	 9neT1NhhjwqDxOpog3fvTf9EbDlsRKIODT2pc1Eof0On+sF2W0VUOHsQOECrcGn4+5
	 3EqVYDAEoF/cDXgkdrcWpHUM7HdY0DKs256151A8LXkgYH00vpdFE5z8eF3A+1XHRi
	 Mx2rKmzNbC7Sw==
Message-ID: <45ffc9f5-5873-4fd1-85c6-495a84766b23@kernel.org>
Date: Thu, 9 Oct 2025 22:59:14 +0900
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Introduce "non-pixel" sub node within iris video
 node
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>, Bryan O'Donoghue
 <bod@kernel.org>, Charan Teja Kalla <charan.kalla@oss.qualcomm.com>,
 Bryan O'Donoghue <bod.linux@nxsw.ie>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <7b6db4fa-2f73-376d-4eb3-64c1c7e6cda3@quicinc.com>
 <9bae595a-597e-46e6-8eb2-44424fe21db6@linaro.org>
 <MMSKAu89Ew7StAeFBV442KfKNzmqbTSQ-maFG35Jr9d8PkUV2L4sx44R2DRevXA8mC45vkA398l2mvVzarZwew==@protonmail.internalid>
 <bcfbf35b-69ed-4f39-8312-6a53123cd898@kernel.org>
 <d46c0335-99d6-469f-a61f-aca4c851f745@kernel.org>
 <GyrcG3qBN7c5C7ajCs3EV81hWvuaVbg64CpzQ-X3d_p6EauoiKxSoG2aOKE21-j12SWFjNDjV-kVSwYYqVm_lQ==@protonmail.internalid>
 <a0dc93ec-e35c-409b-8dfb-1642c92a9f0c@kernel.org>
 <98e6acf8-80d7-4894-b4ce-ce74660722ef@kernel.org>
 <soFAWqHDNosrZui972Ip7EvMCfB6tepD-HxHkc17RKmilPJpQZjMzni9LmMOpvKumHqFEibe5FdNkkJG8DKlcw==@protonmail.internalid>
 <5085c857-f6e8-4faf-b61a-a9ee562ccf06@kernel.org>
 <7ba3953a-166f-4c67-8f54-666b0c488b12@kernel.org>
 <e15f156c-cb38-4566-b275-ba156a7b598d@kernel.org>
 <4fac8b52-180d-7b79-f0d9-52c0f94186da@quicinc.com>
 <e8dfad82-ab07-40e9-9296-859168142611@kernel.org>
 <28baa5ce-c161-426a-b5df-1cd784489bb5@linaro.org>
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
In-Reply-To: <28baa5ce-c161-426a-b5df-1cd784489bb5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/10/2025 20:06, Bryan O'Donoghue wrote:
> On 09/10/2025 11:45, Krzysztof Kozlowski wrote:
>> On 09/10/2025 19:40, Vikash Garodia wrote:
>>>
>>> On 10/9/2025 2:41 PM, Krzysztof Kozlowski wrote:
>>>> On 09/10/2025 17:38, Bryan O'Donoghue wrote:
>>>>> On 09/10/2025 02:04, Krzysztof Kozlowski wrote:
>>>>>>> The iommu description for this platform basically lacks the data that
>>>>>>> _should_ be there -> FUNCTION_ID.
>>>>>> No. The index tells that already.
>>>>>
>>>>> Hmm.
>>>>>>> The rule is that the DT should really describe the hardware right ?
>>>>>> It already does. Same as I wrote on IRC, DT already has all the
>>>>>> information. Entry 0 has function ID-foo. Entry 1 has function ID-bar.
>>>>>> Entry 2 has function ID-bar or whatever.
>>>>>
>>>>> That's the part I don't believe is true its a 1:Many relationship
>>>>> between FUNCTION_ID:SIDs
>>>>>
>>>>> Let me check the docs...
>>>>>
>>>>> Here's the example I gave on IRC for lore
>>>>>
>>>>> SID 0x1940 maps to AC_VM_HLOS (Linux)
>>>>> SID 0x1941 maps to AC_VM_CP_BITSTREAM - protected bitstream
>>>>> SID 0x1945 maps to AC_WM_CP_BITSTREAM
>>>>>
>>>>
>>>> I responded to this on IRC... Nothing proves here that 1:many cannot be
>>>> done.
>>>
>>> Kaanapali already has 1:Many relationship for FUNCTION_ID:SIDs.
>>
>> Sun is a star. How is that related? I am not going to duplicate
>> arguments from IRC, especially to that pointless argument. Read again
>> discussion on IRC.
>>
>> Best regards,
>> Krzysztof
> 
> But Krzysztof is it not the case DT should be a representation of the 
> real hardware and that this takes priority over established schema.
> 
> There seems to be no other reason to keep SID in the DT and FUNCTION_ID 
> in driver meta-data except the schema already says X.
> 
> There are as I count it, 189 TCU SID mappings for Hamoa.


That could be an argument in favor of different representation, so
present that exact case - comparison of bindings and driver in two cases.

> 
> So in the extreme case that means we have an iommu = <> for each of 
> those but then need a corresponding entry in a driver to map each SID to 
> its relevant FUNCTION_ID.
> 
> And do that over and over again for each new SoC.
> 
> OTOH if we extend the iommu to include FUNCTION_ID then only the DT 
> changes - with the iommu setup code changing once to accommodate it.


Existing patch does not support this so far. Existing
patch/code/proposal clearly points to mapping that index of entry is
sufficient enough. Happy to see different code - make your case, please.


Best regards,
Krzysztof

