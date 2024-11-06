Return-Path: <linux-media+bounces-21018-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB4C9BF04B
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 15:30:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7ED331F21CDD
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 14:30:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C33192022C1;
	Wed,  6 Nov 2024 14:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r02PlFyQ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CFA20110E;
	Wed,  6 Nov 2024 14:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730903363; cv=none; b=TVTV+oM3/r2+oBX1Zu4klZuCQgCAFmli277jgB3frJfTnnisXlMYPFP77c7iTLMyXFPqURRKwC0vbKaCwoxVlSODBMbrqSo+NvwGZ932PX1zX+Qzt/G9ZvTOjI4XiL0TwJ9q5jXLv0CXqoYeTJQEfYdVUCoYDs1bE5M/tK4HhmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730903363; c=relaxed/simple;
	bh=PQkhyej+3msxWtwdvICDp2SXr6agJstmZdE0qQDLpy4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DF6tGhWbLTOwN4TK0G4ohNoadWvSaQJCY5dHq/dvIwkMRFtoq4ebYZFYOATIld6epc3UUqIindBlFTywwngm55BtBYJ4rI9a0UMykBA+f9rEl+YXo6hS1wytmoXaYQH++VXCXRxGWgNHJ/+5tRIc+m9uo9fARgMyzA4AjQKKJZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r02PlFyQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEF74C4CECC;
	Wed,  6 Nov 2024 14:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730903362;
	bh=PQkhyej+3msxWtwdvICDp2SXr6agJstmZdE0qQDLpy4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=r02PlFyQNeF/mPFOyM7dXapPv60s9nyuscTGIwmcJUlm+YmLHl/Y6UC9kTRke3PE3
	 NU8KIRSWQEO1G8ughJ5lg0gSJ7vre+NKbjeRPmP4ALLF5eX8St6tNiaDY2TCPOiqfz
	 zkcTKXsvlIMeNIMjq4OSp41eFwzptOwn2rkj0B4x1Q5PmLCzukBfjFoB7Wy5LRpDlW
	 dk78dg0NRwRTuhn822L5Gfxv+M3IGmI5azrEgOk2pV5i9T42RAVZvtzZqcJ+vRg79j
	 qd37SwxwoxJqSMTnjFmJdxEpAcoo7q1aA5VBQLoieuDi863l8Q31rbHwEkYL/Gd8fK
	 tYK1FYWQGFS+w==
Message-ID: <a8cb35fd-d474-4104-b1f8-90ce5aa4a790@kernel.org>
Date: Wed, 6 Nov 2024 15:29:17 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 05/17] dt-bindings: media: Add bindings for ARM
 mali-c55
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Anthony.McGivern@arm.com, jacopo.mondi@ideasonboard.com,
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
 sakari.ailus@iki.fi
References: <20241106100534.768400-1-dan.scally@ideasonboard.com>
 <20241106100534.768400-6-dan.scally@ideasonboard.com>
 <lag7gfpuj2hdxw6i5pumaivxl5rylt2hztd57rynjestffwool@ate7u3zhrgfn>
 <20241106135756.GI9369@pendragon.ideasonboard.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20241106135756.GI9369@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/11/2024 14:57, Laurent Pinchart wrote:
> Hi Krzysztof,
> 
> On Wed, Nov 06, 2024 at 01:15:23PM +0100, Krzysztof Kozlowski wrote:
>> On Wed, Nov 06, 2024 at 10:05:22AM +0000, Daniel Scally wrote:
>>> Add the yaml binding for ARM's Mali-C55 Image Signal Processor.
>>>
>>> Acked-by: Nayden Kanchev <nayden.kanchev@arm.com>
>>> Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>>> ---
>>> Changes in v8:
>>>
>>> 	- Added the video clock back in. Now that we have actual hardware it's
>>> 	  clear that it's necessary.
>>> 	- Added reset lines 
>>> 	- Dropped R-bs
>>
>> These are trivial, so I wish you kept the review... but since you ask,
>> then comment further
>>
>> I recommend using b4, so your cover letter changelog comes with nice
>> links to previous versions. I scrolled through entire cover letter for
>> this (for me that's almost the only point of cover letter) and could
>> not find them. Anyway, just a remark.
>>
>>
>> ...
>>
>>> +  resets:
>>> +    items:
>>> +      - description: vclk domain reset
>>> +      - description: aclk domain reset
>>> +      - description: hclk domain reset
>>> +
>>> +  reset-names:
>>> +    items:
>>> +      - const: vresetn
>>
>> drop "reset", it's redundant and rather come here with logical name. I
>> wonder what "n" means as well. It's not a GPIO to be "inverted"...
> 
> The aresetn and hresetn names come directly from a hardware manual
> (vresetn seems to be called rstn in that document though). As far as I
> understand, they are the names of the external signals of the IP core.
> I tend to pick the hardware names for clock and reset names. That makes
> it easier for integrators, and from a driver point of view it doesn't
> change much as DT names are just a convention anyway.
> 
> That being said, if there's a good reason to do otherwise (such as
> standardizing property names to make handling through common code
> possible), that's fine too.

If these are from manual then it is fine, although sometimes the names
are really pointless in manual...

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


