Return-Path: <linux-media+bounces-21020-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 428299BF35E
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 17:38:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6A491F2349E
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 16:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81D26205AB7;
	Wed,  6 Nov 2024 16:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FkAo3Eph"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D760918FC8C;
	Wed,  6 Nov 2024 16:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730911089; cv=none; b=swOYag863BneGs/V1is0RkoTPL6tCWpP9rAu9s9KGDZ/yMeT9ucbk6EZsUQdaBRZWqnilekgd30tTxri7cKDaOSS7d9MFYHhiE2/KRomZJKDy7k6Tb4SPTlzymmdKqrorqzFGEmidYblcPTloe9Q3ktcKlnMQ2jgy3FsGC4TUDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730911089; c=relaxed/simple;
	bh=JYsSg8XGpZMd/iovEqFWzxyh+o/Jbj+GO3GOPMiOkmA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mf+cEvh6V9UMbgOPM/powOYLYaTQPPsN2NViGFm9JC8tLnIhX0E4TJ4akk/I415aYnZ+HHyr0DI1/VxrofWb+IJP0lwbHM0WYnm+NnHrzH8eneKSMKh8JwiD7/q5H7fcxwid7T3MmfVbndPetMpk9TL76ac0N1wpeI28XW5NsWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FkAo3Eph; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6D17559D;
	Wed,  6 Nov 2024 17:37:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730911077;
	bh=JYsSg8XGpZMd/iovEqFWzxyh+o/Jbj+GO3GOPMiOkmA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FkAo3EphpjzwcqhWGS5mYOA6rnUajxTEtPgd8dZEhtVXRU5F1JsTbh2YGe+7RDpQ6
	 4lryiZEua/Q+NUjl2uIXlSOyyv6O7diiUKGEWTFLCAYQaHcoNkCR57hmMAU0DkAhP1
	 5tQMP3s4BiTOgYBP7GcHFj+SAEJcaBuZGRs+JkBg=
Message-ID: <636ad36f-3182-431c-ae2e-1f590a06ad7f@ideasonboard.com>
Date: Wed, 6 Nov 2024 16:38:01 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 05/17] dt-bindings: media: Add bindings for ARM
 mali-c55
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Anthony.McGivern@arm.com,
 jacopo.mondi@ideasonboard.com, nayden.kanchev@arm.com, robh+dt@kernel.org,
 mchehab@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
 sakari.ailus@iki.fi
References: <20241106100534.768400-1-dan.scally@ideasonboard.com>
 <20241106100534.768400-6-dan.scally@ideasonboard.com>
 <lag7gfpuj2hdxw6i5pumaivxl5rylt2hztd57rynjestffwool@ate7u3zhrgfn>
 <20241106135756.GI9369@pendragon.ideasonboard.com>
 <a8cb35fd-d474-4104-b1f8-90ce5aa4a790@kernel.org>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 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
In-Reply-To: <a8cb35fd-d474-4104-b1f8-90ce5aa4a790@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Krzysztof - thanks for reviewing

On 06/11/2024 14:29, Krzysztof Kozlowski wrote:
> On 06/11/2024 14:57, Laurent Pinchart wrote:
>> Hi Krzysztof,
>>
>> On Wed, Nov 06, 2024 at 01:15:23PM +0100, Krzysztof Kozlowski wrote:
>>> On Wed, Nov 06, 2024 at 10:05:22AM +0000, Daniel Scally wrote:
>>>> Add the yaml binding for ARM's Mali-C55 Image Signal Processor.
>>>>
>>>> Acked-by: Nayden Kanchev <nayden.kanchev@arm.com>
>>>> Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>>> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>>>> ---
>>>> Changes in v8:
>>>>
>>>> 	- Added the video clock back in. Now that we have actual hardware it's
>>>> 	  clear that it's necessary.
>>>> 	- Added reset lines
>>>> 	- Dropped R-bs
>>> These are trivial, so I wish you kept the review...

Fair enough, I just didn't want to be presumptuous


>>> but since you ask,
>>> then comment further
>>>
>>> I recommend using b4, so your cover letter changelog comes with nice
>>> links to previous versions. I scrolled through entire cover letter for
>>> this (for me that's almost the only point of cover letter) and could
>>> not find them. Anyway, just a remark.


Thanks for the recommendation - I'll take a look when I get time, but either way I can add a link to 
the previous versions next time.

>>>
>>>
>>> ...
>>>
>>>> +  resets:
>>>> +    items:
>>>> +      - description: vclk domain reset
>>>> +      - description: aclk domain reset
>>>> +      - description: hclk domain reset
>>>> +
>>>> +  reset-names:
>>>> +    items:
>>>> +      - const: vresetn
>>> drop "reset", it's redundant and rather come here with logical name. I
>>> wonder what "n" means as well. It's not a GPIO to be "inverted"...
>> The aresetn and hresetn names come directly from a hardware manual
>> (vresetn seems to be called rstn in that document though). As far as I
>> understand, they are the names of the external signals of the IP core.
>> I tend to pick the hardware names for clock and reset names. That makes
>> it easier for integrators, and from a driver point of view it doesn't
>> change much as DT names are just a convention anyway.
>>
>> That being said, if there's a good reason to do otherwise (such as
>> standardizing property names to make handling through common code
>> possible), that's fine too.
> If these are from manual then it is fine, although sometimes the names
> are really pointless in manual...
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Thanks
>
> Best regards,
> Krzysztof
>

