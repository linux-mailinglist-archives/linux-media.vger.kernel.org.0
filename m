Return-Path: <linux-media+bounces-12970-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C69A9045FD
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 22:54:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 52CC9B24160
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 20:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AEE01527B6;
	Tue, 11 Jun 2024 20:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fcxfk+a1"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E6F8488;
	Tue, 11 Jun 2024 20:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718139282; cv=none; b=hSupsohHI8ifB5ThBXw42Wo8Y1/H5xV1h9BS5hQzXUuZqu4IRwNGcagDjkTTjpBUULvHwlw8UyEWOJqr58jCYTLv38EucAL6Lz5puUHcCE3lWipIf8BFR0owYkdWtEgdaM/3afN6YrxBvNkVDVLVmEMQj7rmlNfT9UAxXUsCI90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718139282; c=relaxed/simple;
	bh=SjB7p6Q6YXXhjAsZE+Txm0hdxAi9BcAoW4amSB4Hhmc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XJPAhAy9U/nPoBH9Znvhzn/p8jCWpHmzA8LQRXFvEEOVbWBkbMGqe/Bv/rgicm4VM+AsJzsY3lljCGnNJ0Ofk9nMWnn8k+r8qvduvVcos6D+6jBWB1LtG8JlqCFrxzT3SUfR+3nmKLGOQwFjAGw19gGBU1r4sEl7692ngRBFN9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fcxfk+a1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56503C2BD10;
	Tue, 11 Jun 2024 20:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718139282;
	bh=SjB7p6Q6YXXhjAsZE+Txm0hdxAi9BcAoW4amSB4Hhmc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Fcxfk+a1tSJp/hBDuM/+3yaJyaUme6cz+nYeKDzua3y3GDHrOb0L5XGLTz+vsppW8
	 MkTJlgF0SrjEkn/3P2TgmMBnLG3kCv3MIDOPSuIvBQDtOoqO/dl93tB8eDvzO5tOON
	 BFFmg4mEgXHdEOqLFjJUfGP+2DNmsCjYhGu3n/XR3KBL4qMpiwVuHurHXg57qlJc9s
	 f4Y+SxrKNA5H/PicWmdK2EI+iKc62+JF7x5GvtdHWmSHcVcrIpQ9qFe10h2KJdJqTg
	 Q+GJChXCO6AtCRIQ518wFOP9zHLJR2mcDTtrArra9ErWQ9RjuRmgw1xhZYK75F93z3
	 mqN2tGJZfc6jw==
Message-ID: <bd2aa638-e30c-4011-925b-4d922fe28f61@kernel.org>
Date: Tue, 11 Jun 2024 22:54:35 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: vgxy61: Add legacy compatible string
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240610150815.228790-1-benjamin.mugnier@foss.st.com>
 <20240610150815.228790-3-benjamin.mugnier@foss.st.com>
 <b4de42ba-d884-44b1-9f0e-12f5818c6781@kernel.org>
 <ZmgIiaqJy1tWL4Yz@kekkonen.localdomain>
 <b7514285-7a05-4874-a0fd-59ef16d5bce1@kernel.org>
 <458f8b1c-d750-424c-99dd-d31fde036314@foss.st.com>
 <4fd73e81-4573-4e1c-9623-c2f7f153d43a@kernel.org>
 <11cb5143-3c0e-4e7d-bcdb-6e8371bb1c0c@foss.st.com>
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
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJgPO8PBQkUX63hAAoJEBuTQ307
 QWKbBn8P+QFxwl7pDsAKR1InemMAmuykCHl+XgC0LDqrsWhAH5TYeTVXGSyDsuZjHvj+FRP+
 gZaEIYSw2Yf0e91U9HXo3RYhEwSmxUQ4Fjhc9qAwGKVPQf6YuQ5yy6pzI8brcKmHHOGrB3tP
 /MODPt81M1zpograAC2WTDzkICfHKj8LpXp45PylD99J9q0Y+gb04CG5/wXs+1hJy/dz0tYy
 iua4nCuSRbxnSHKBS5vvjosWWjWQXsRKd+zzXp6kfRHHpzJkhRwF6ArXi4XnQ+REnoTfM5Fk
 VmVmSQ3yFKKePEzoIriT1b2sXO0g5QXOAvFqB65LZjXG9jGJoVG6ZJrUV1MVK8vamKoVbUEe
 0NlLl/tX96HLowHHoKhxEsbFzGzKiFLh7hyboTpy2whdonkDxpnv/H8wE9M3VW/fPgnL2nPe
 xaBLqyHxy9hA9JrZvxg3IQ61x7rtBWBUQPmEaK0azW+l3ysiNpBhISkZrsW3ZUdknWu87nh6
 eTB7mR7xBcVxnomxWwJI4B0wuMwCPdgbV6YDUKCuSgRMUEiVry10xd9KLypR9Vfyn1AhROrq
 AubRPVeJBf9zR5UW1trJNfwVt3XmbHX50HCcHdEdCKiT9O+FiEcahIaWh9lihvO0ci0TtVGZ
 MCEtaCE80Q3Ma9RdHYB3uVF930jwquplFLNF+IBCn5JRzsFNBFVDXDQBEADNkrQYSREUL4D3
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
 YpsFAmA872oFCRRflLYACgkQG5NDfTtBYpvScw/9GrqBrVLuJoJ52qBBKUBDo4E+5fU1bjt0
 Gv0nh/hNJuecuRY6aemU6HOPNc2t8QHMSvwbSF+Vp9ZkOvrM36yUOufctoqON+wXrliEY0J4
 ksR89ZILRRAold9Mh0YDqEJc1HmuxYLJ7lnbLYH1oui8bLbMBM8S2Uo9RKqV2GROLi44enVt
 vdrDvo+CxKj2K+d4cleCNiz5qbTxPUW/cgkwG0lJc4I4sso7l4XMDKn95c7JtNsuzqKvhEVS
 oic5by3fbUnuI0cemeizF4QdtX2uQxrP7RwHFBd+YUia7zCcz0//rv6FZmAxWZGy5arNl6Vm
 lQqNo7/Poh8WWfRS+xegBxc6hBXahpyUKphAKYkah+m+I0QToCfnGKnPqyYIMDEHCS/RfqA5
 t8F+O56+oyLBAeWX7XcmyM6TGeVfb+OZVMJnZzK0s2VYAuI0Rl87FBFYgULdgqKV7R7WHzwD
 uZwJCLykjad45hsWcOGk3OcaAGQS6NDlfhM6O9aYNwGL6tGt/6BkRikNOs7VDEa4/HlbaSJo
 7FgndGw1kWmkeL6oQh7wBvYll2buKod4qYntmNKEicoHGU+x91Gcan8mCoqhJkbqrL7+nXG2
 5Q/GS5M9RFWS+nYyJh+c3OcfKqVcZQNANItt7+ULzdNJuhvTRRdC3g9hmCEuNSr+CLMdnRBY fv0=
In-Reply-To: <11cb5143-3c0e-4e7d-bcdb-6e8371bb1c0c@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/06/2024 15:07, Benjamin Mugnier wrote:
> 
>>>
>>> Will this be ok for you ? Tell me your thoughts.
>>
>> It seems you are making some changes assuming there is some error to be
>> fixed, but there is none. Compatible is just some unique string, so the
>> original compatible, although unfortunate, is okay and must not be
>> changed. I already explained that adding new compatibles for such cases
>> is only for exceptions. Is this exception? No. You provided no rationale
>> to make it an exception.
> 
> Thank you. I think I failed to provide some details :
> 
> The change is motivated by a will of consistency in naming.

Consistency is a preference and not really a reason here. Could be named
"st,yellow-elephant" and it would be kind of fine...

> As you correctly mentioned in the vd56g3 series [1], bindings should be
> 'vendor,device'. This will be changed for the vd56g3 series v3 by

Yeah, but that ship has sailed. Where is the answer about all the users?
You pick pieces of my arguments and ignore some parts of it.

None of this is suitable for exception. Style or preference is not
argument for exception.

> Sylvain, but the vgxy61 binding is already badly named.
> We will then have these 2 bindings in the wild : st,vd56g3 and
> st,st-vgxy61, for very similar sensors. Hence the will to add a
> st,vgxy61 binding for consistency.

Nope.

> This also prepares the ground for new camera sensor drivers we plan to
> submit later on, and that will respect the st,device binding naming scheme.

Nope

> 
> Is it the correct way to go ?

Nope, sorry.

I already said this several times in this email thread - answers here
and in other emails. Now, again.

When I said about exceptions, I really meant exceptions, e.g. something
is broken or something never worked and has to be fixed. Style or
preference is not this case. No point to keep arguing how style is
important for you.


Best regards,
Krzysztof


