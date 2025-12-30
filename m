Return-Path: <linux-media+bounces-49736-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB52CE9D51
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 14:56:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 232563021E75
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 13:56:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52380241103;
	Tue, 30 Dec 2025 13:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h5hJIonm"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73DB86331;
	Tue, 30 Dec 2025 13:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767102984; cv=none; b=oK9/PnzTQ8xMnEjWIbmNvFJiQrIiRZWDK4Qr9QZeRYCkFHeUAhMsajbT0qkkOw3WXPUv1a77vIrQ6y9b5z9D1OQoZ20Zeaclxy2BJ6spb+iaUbgknD2oWSGnCrIYPxJUryjI9k9CqkjNIc2tspfI8UHp2+4JbBr95gbcKnDIc2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767102984; c=relaxed/simple;
	bh=xFldLpic3xtmpqNCQf3ZKKmpQw/J0VkqHyqv6pzJSIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S5zIjxw237aVYciw74T32lodibUQSNCUZ0O48h8aB0Bl7oZI0BwuCxVhHlrOZqBNcmacPjxTPv5GuIGpGjicpw6AVmA7ZVPOs5/HQexT3eQZyqeIQi2yFlA5S3dluXq9mNL9GjtNFt8ejMyTWoYSO3KBhkko51DNySd6hyZf1oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h5hJIonm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 805CDC4CEFB;
	Tue, 30 Dec 2025 13:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767102983;
	bh=xFldLpic3xtmpqNCQf3ZKKmpQw/J0VkqHyqv6pzJSIY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h5hJIonmpNmEX04j/5wjuUIxZ7sbNhEDFDmUY7tdibNnDXRrLOXO08eYho8Eopesi
	 GY3yZ1hKGHyxRL3azXgAmc7572rNJOrFzsKIMddYsXA5XGFCbfnpGoUhHah7Z2H343
	 VNXuGsR21A/PXRCcPfM5mbOWVVOHyoPVNPIzjhTZDtNGLc/eSKgZQMDhNR5kTHTdYn
	 TgWyKkTumcumrBqxqKZau2PtLMTEIFtl0TZxbuvhFu4MWg1PvM3TLpG3Bp2YkvnBUc
	 iaxI3J/MFE6GGNmqYy/LO3PjlsUXAcoaqlKEYf0o5yh+FFs/7EePtF3ODq2srdVejn
	 EHOiIGNTFMIow==
Message-ID: <2bba9546-225f-4a77-b9d9-483cb5a41611@kernel.org>
Date: Tue, 30 Dec 2025 14:56:18 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] media: i2c: ov9282: Fix reset-gpio logical state
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: andersson@kernel.org, konradybcio@kernel.org,
 dave.stevenson@raspberrypi.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mchehab@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org,
 laurent.pinchart@ideasonboard.com
References: <20251114133822.434171-1-loic.poulain@oss.qualcomm.com>
 <20251114133822.434171-2-loic.poulain@oss.qualcomm.com>
 <aRtbwK0Afo50Lh0B@kekkonen.localdomain>
 <CAFEp6-1zoU2cfVU06MoeOtAwMYN+XAxCwc0ebwaQyo78VNBf2Q@mail.gmail.com>
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
In-Reply-To: <CAFEp6-1zoU2cfVU06MoeOtAwMYN+XAxCwc0ebwaQyo78VNBf2Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/12/2025 11:00, Loic Poulain wrote:
> Hi Laurent,
> 
> On Mon, Nov 17, 2025 at 6:30 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
>>
>> Hi Loic,
>>
>> On Fri, Nov 14, 2025 at 02:38:19PM +0100, Loic Poulain wrote:
>>> Ensure reset state is low in the power-on state and high in the
>>> power-off state (assert reset). Note that the polarity is abstracted
>>> by the GPIO subsystem, so the logic level reflects the intended reset
>>> behavior.
>>
>> That's an interesting approach to fix DTS gone systematically wrong.
>>
>> I was thinking of the drivers that have this issue, too, but I would have
>> introduced a new GPIO under a different name (many sensors use "enable",
>> too). Any thoughts?
>>
>> Cc Laurent.
> 
> Do you have any feedback on this change?
> 
>>
>>>
>>> To maintain backward compatibility with DTS files that use an incorrect
>>> flag, we implement a mechanism similar to:
>>>   commit 738455858a2d ("ASoC: codecs: wsa881x: Use proper shutdown GPIO polarity")

Heh, so you even found my commit which exactly points which cases are
broken, but you:

...


>>> +     /*
>>> +      * Backwards compatibility work-around.
>>> +      *
>>> +      * The reset GPIO is active-low, but the driver has always used the
>>> +      * gpiod API with inverted logic. As a result, the DTS had to
>>> +      * incorrectly mark the GPIO as active-high to compensate for this
>>> +      * behavior. Changing the flag in the driver now would break backward
>>> +      * compatibility with existing DTS configurations. To address this,
>>> +      * we add a simple value inversion so the driver works with both old
>>> +      * and new DTS.

claim everything is working fine. Please read my commit.


Best regards,
Krzysztof

