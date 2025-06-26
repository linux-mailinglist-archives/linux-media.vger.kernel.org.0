Return-Path: <linux-media+bounces-35935-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 983B1AE99B7
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 11:11:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B9A53A849A
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 09:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6E9D29CB32;
	Thu, 26 Jun 2025 09:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X66W3j2s"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283C926B76D;
	Thu, 26 Jun 2025 09:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750929095; cv=none; b=fu75KmiXAg5GlylSME5A5BmO4YzSIEpGQhuj926tql6xAmE1I1wwuTfWS3H5NHekaNiRyk9kvaeADGf6lrW6KtCsZwPcIBF30KkvyCsQKUgSeUuBtubYCUNxHNMIUwnDrBdgIr2aPWRpDSm+SYT6Yymp0fntnti+JawDDLA6MC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750929095; c=relaxed/simple;
	bh=izvdoDHPwap29gsMm8KjSGY+FSECgCE9vlOURjOlLe4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GeRtqjMux2Jl9vJPrCmYC5Q3xS5soe+gi0i+4XIgF9PZRIkNVKzTK3qTJ3FijhKFbDOkA2OJ8LrY6Grbt8/BcbaTnGUn3qQYIlivLI8t2TI0HqXB/9IzVmpEBfH268LcLHEcg3+5IzwwRvwCIGMVWuJO1zGrqIpfBc+VBQeGVm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X66W3j2s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 959A8C4CEEB;
	Thu, 26 Jun 2025 09:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750929094;
	bh=izvdoDHPwap29gsMm8KjSGY+FSECgCE9vlOURjOlLe4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X66W3j2sZRlOI7urjMz3QGefFhUcabD2n4EAl3FuuuvR5EKsFAA7ms8+Vl4okRf8k
	 rl0m85ccKq4XFJQ/AEEyVMyZKWryweQtVcTKeVhaVOf5/HNGvl/x10MHIxCBiH5LdJ
	 s66qfxWK/C9QzI2CskRknUzjNGLy2X5cXX+cB0rOIre1FrbjSvt6PRMSgz+rgN+xYK
	 82Z2tgCN7iHvjGZo+Pa2sswVZ5sqlpLiNUmOq+vlNvj4MCcvj3qq6BbmjgfH+w9eiY
	 sVssYXyddrV2me1vnnDoYWbUxRdcSZ1f0RsLGv2F2hI0A/PzQZOeuQODFaGlFfu09Z
	 llQFUuVJxVvoQ==
Message-ID: <c923723f-5e94-4621-9bb8-36c8572f9b51@kernel.org>
Date: Thu, 26 Jun 2025 11:11:28 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: media: qcom,x1e80100-camss: Sort
 interconnects alphabetically
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20250624094253.57441-1-vladimir.zapolskiy@linaro.org>
 <20250624094253.57441-2-vladimir.zapolskiy@linaro.org>
 <aa56b956-95f3-484d-8afa-058925b95bfd@kernel.org>
 <fff77f71-e21b-43b9-9da5-6cf819add970@linaro.org>
 <5a5b78f7-e156-4c5e-8407-b249040e227d@kernel.org>
 <c29385d4-30ea-4774-9cf9-699b08e29800@linaro.org>
 <329b89a4-85a9-496f-8b1b-6239dfc9057b@kernel.org>
 <930edec1-7403-4ecf-bb17-2e68b8d351f8@kernel.org>
 <e0eb8d55-b4fd-4f3b-94b0-5c56d48b4671@linaro.org>
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
In-Reply-To: <e0eb8d55-b4fd-4f3b-94b0-5c56d48b4671@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/06/2025 16:07, Vladimir Zapolskiy wrote:
> On 6/25/25 10:01, Krzysztof Kozlowski wrote:
>> On 25/06/2025 08:58, Krzysztof Kozlowski wrote:
>>> On 24/06/2025 15:29, Vladimir Zapolskiy wrote:
>>>> On 6/24/25 15:04, Krzysztof Kozlowski wrote:
>>>>> On 24/06/2025 13:38, Vladimir Zapolskiy wrote:
>>>>>> On 6/24/25 13:10, Krzysztof Kozlowski wrote:
>>>>>>> On 24/06/2025 11:42, Vladimir Zapolskiy wrote:
>>>>>>>> Sort the entries of interconnect and interconnect-names lists in the
>>>>>>>> alphabetical order of values in the latter property.
>>>>>>>
>>>>>>> We do not sort these entries alphabetically and you did not explain why
>>>>>>> you are doing this.
>>>>>>
>>>>>> I did it, because I assume that the preference is to sort all named
>>>>>> values alphanumerically.
>>>>>
>>>>> Where is such preference documented?
>>>>
>>>> There is no such preference documented, as I stated it was my assumption
>>>> and it was based on your firm insistance to apply a particular sorting
>>>> order for regs, clocks and interrupts properties. Apparently you are
>>>
>>> Hm? And the rule is by name? I don't think I ever expressed that or
>>> insisted on some sorting by name. During previous talks on camss
>>> numerous times you ignored the ONLY rule of sorting I was insisting:
>>> keep the same as all other devices. That was the one and only rule.
>>>
>>>> fine with out of the same sort order for 'interconnects' values, the
>>>> criteria of picked properties remains unclear for me.
>>>
>>> I don't understand why it is unclear. That time with Bryan you both
>>> received VERY CLEAR feedback from me: there is no such rule of sorting
>>> any values. Yet you were pushing the discussion and patchset like there
>>> was something.
>>>
>> Look, the first reply:
>>
>> https://lore.kernel.org/all/65e5796a-8b8d-44f0-aef4-e420083b9d52@kernel.org/
>>
>> "You are supposed to keep the same order, as much as
>> possible."
>>
>> What rule is unclear here?
> 
> At the moment of the given comment "the same order" was not "sorting by
> values", it was "sorting to address".
> 
> Check the next message right in the same thread:
> 
> https://lore.kernel.org/all/c1539cce-92eb-43fc-9267-f6e002611bbb@linaro.org/
> 
> "We always sort by address". And that was the correct statement at

Hm? This was not a true statement and anyway this was not from me. Why
are you both with Bryan creating some fake rules and then later use them
in arguments in discussions?

We don't talk here what sort of rule other person invented.

> the time of the discussion.
> 
> Did it help to "keep the same order" in any sense? No, the message was
> plainly ignored, and after the long discussion with you the sorting order

And that's some sort of my job to read every possible comment
everywhere? I have way too many emails to respond to, so no, I will
ignore most of them.

> has been brutally enforced to become the new "sorting by values" order,

What? Where? This never happened!

Point me to any guidance by DT maintainers. Not to some other people
telling you random stuff.

> and to my sincere today's surprise there is no such rule. Apparently now
> I have to believe it was Bryan's and my voluntary and deliberate decision
> to change the sorting order, all right.

Point to arguments where any DT maintainer asked you to sort by value.


Best regards,
Krzysztof

