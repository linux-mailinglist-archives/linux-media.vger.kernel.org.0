Return-Path: <linux-media+bounces-40033-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D6DB2923E
	for <lists+linux-media@lfdr.de>; Sun, 17 Aug 2025 10:28:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A7F32032A2
	for <lists+linux-media@lfdr.de>; Sun, 17 Aug 2025 08:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64E74219301;
	Sun, 17 Aug 2025 08:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hXkredwL"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B997B3176F5;
	Sun, 17 Aug 2025 08:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755419299; cv=none; b=IrybDmqx/JYYxax7wjF3lb5zsSIeV0bsOSg1ndmlzWRzACEhkrzNGIZqez5ncX7xLHdvA5lx8x/zOeFvs1SK/1aQQhdCwCyGYUHLHSkjUrFqw3WZv9M7RQKJnMN9snDiUNwePTLCt2mAgTwShB9r8XTIdPFDkjIyTr659xNlpdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755419299; c=relaxed/simple;
	bh=Zefgybi/8uhiiRyM5T1/XbLvYo6nNToH9kozBvIgikU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MJMMsk0WajE0P9T6Z8dDCCTotSSPnHuhnJvPb5ah6RBf9Y2Jm34nK7iZKFmUrWqmFuOsmVUaG8zc3zrxl2yNqZG+i92Zhhpn/52j2r5V5X5SxVquBYApFQfOj5g1iwZYnKnQoa1AihyjMqwF21AxsG3PnDncTUyoHA8bDI9DK/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hXkredwL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCD7BC4CEEB;
	Sun, 17 Aug 2025 08:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755419298;
	bh=Zefgybi/8uhiiRyM5T1/XbLvYo6nNToH9kozBvIgikU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hXkredwL5Y6o5sZHYXxnAh9+RzAKKW4LeBltbkL0HYmUnJTvWl3Jbj3DV3wcirC5i
	 LRnHfW7ok9G6K0v185orfJUwxgf6M3c67wboO2g4cZYIEguyREiXseMCJLNU2z+bpc
	 CNO/TssXgLagcZt66DisMIesfQjL/lN2PImCJaXE7Jy/8nXswkVYgf2cyj3ymq5z6g
	 cSKt6Zg4WGMoTglcJFDmuczCjEBlBWzd82Msqf4vU+1zeQPzmi7CxyweBeDnIlMg3r
	 OLrhWcIfXpsbbFCXMfB54XEwIz2y7fKQDecpVAyoOYDkbISAdw5gWQl9BXWURkbrQk
	 hKFWCxoSSMe1w==
Message-ID: <b9c8d571-e0ce-4703-8748-96f7ca4a59bf@kernel.org>
Date: Sun, 17 Aug 2025 10:28:14 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] media: i2c: imx585: Add Sony IMX585 image-sensor
 driver
To: Will Whang <will@willwhang.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250816055432.131912-1-will@willwhang.com>
 <20250816055432.131912-3-will@willwhang.com>
 <7e27b69b-40df-4ac4-aebf-dbd00044b71b@kernel.org>
 <CAFoNnrxbzcF+YranTL8Von3BkROhq8X=RX5sa90M6PYgS_vjkQ@mail.gmail.com>
 <daa45e3e-84a6-4c39-854a-1429fb68d415@kernel.org>
 <CAFoNnrw4yRKGL_m0=g14C583o13ptC6e84TN---ABdyeg8jMhg@mail.gmail.com>
 <04fd00bb-beb4-4f35-88fb-bf1cc7691505@kernel.org>
 <CAFoNnrxd_2=9aJqo9yQ8bcDsyW9pVRCfmUU6tOHoeX5wEB2AhA@mail.gmail.com>
 <11e35902-a19a-44b2-b816-15a495048d41@kernel.org>
 <CAFoNnrxT83nz0qxf8HTapqOXuEQ0Vh+RbxyqRGQy_sJp9nzpAg@mail.gmail.com>
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
In-Reply-To: <CAFoNnrxT83nz0qxf8HTapqOXuEQ0Vh+RbxyqRGQy_sJp9nzpAg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/08/2025 09:53, Will Whang wrote:
>>>
>>> And in all the examples I provided to you, this is the only IMX415
>>> that has the logic inverted.
>>
>> And? All other drivers, camera sensors, hwmon, iio, codecs and whatnot?
>>
> Are those Sony image sensors?
>>
>>> I can apply the same logic and say this is buggy and wrong.
>>
>> We are not going to talk imaginary things.
>>
> So you can imagine this code is buggy even though I tell you this is correct?
> Of course I tested it already.
> 
>>> Do you understand this is writing the GPIO directly and has nothing to
>>
>> It is not. Again, you are mixing logical level with line level. You
>> never responded to that part, you never used actual arguments except
>> some vague statements like above.
>>
>> You do not write GPIO directly.
>>
>> Each driver is supposed to use logical level.
>>
> hmm? Code in the tree disagree with you? Are you going to arguing that
> all the 90% of Sony image sensor drivers are old and buggy?


I checked now and both driver and all users of imx219 are wrong. Don't
ever use that as an example.

And you doing THE SAME as imx219 is also proof that your code is wrong.


Best regards,
Krzysztof

