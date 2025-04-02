Return-Path: <linux-media+bounces-29234-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED555A78F34
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 14:57:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B61A416BB8C
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 12:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B6B123AE7C;
	Wed,  2 Apr 2025 12:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pGXJ1GC7"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E331023A9A2;
	Wed,  2 Apr 2025 12:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743598547; cv=none; b=P14i3rB+f0HRBgoY1vpmOsL2Y3sI0p8ROC5aHKKQ54V0O6TzSaLrU9amkImRpRa7qFKKNhJsrYbi4EYu9L3kBv13X1YIRVXM1F39811pdie/BaV0a3KMe8FUmGIsrsF2VyhBxMjaDH/4KvYEP9MRp1aVYw/FZZM3KuausdEBU5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743598547; c=relaxed/simple;
	bh=7Oa7dZIB+yqiTzbdqm9vU96Ae/PK/xcRM4BPNdPHiLo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D0homFUVlZUYOksLPed/o7i5YDZD/bftUb3RaVQAwn9ouXccxNRTZCzJ8PAQYH27sODExMKR/4bvMGsZ83+EZHR72vfyck1WvsfTTtVnerD3tvkAuRjMSYPPapPQYEBdK52OU0gz09o64ZnoBC9BCLuKkVob226wRp29wp8RQKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pGXJ1GC7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE952C4CEDD;
	Wed,  2 Apr 2025 12:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743598546;
	bh=7Oa7dZIB+yqiTzbdqm9vU96Ae/PK/xcRM4BPNdPHiLo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pGXJ1GC7cuTAJXyvjroGnk7PdyHQ+41FN7uUttyErsCtJb7+RT9qTHPxpFuqkXUlI
	 Toyf8iMFdiJYYNsKy6fvnFvvc1QsaFdpFYI0/KbBcPqi9k4icNqmnni7k2BDS9N8O4
	 lbvgJkogySMEC7elETEyjt+zTMThSj+1XtE7A5qTV7oNQFrohiB23GxLQ6eWo4t97l
	 M8+nqL2yT+SRuDnWdy8ScjRQr6wUogHG3TXs5V/VOMna91Bq2Aep/roOjcaK/oPqny
	 lSLhkOeVEy/CmvN8biNXd2w1BvgpPyTLeXvQPBn8M1rsY5Y5kzY3D9VWAMvzmSQp22
	 Nr7sGeMQCrTRA==
Message-ID: <6f832ce4-03d3-46bc-afcc-86983b2ec47a@kernel.org>
Date: Wed, 2 Apr 2025 14:55:40 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] media: dt-bindings: Add ST VD55G1 camera sensor
 binding
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250401-b4-vd55g1-v2-0-0c8ab8a48c55@foss.st.com>
 <20250401-b4-vd55g1-v2-1-0c8ab8a48c55@foss.st.com>
 <20250402-curvy-seriema-of-blizzard-b1c4d9@krzk-bin>
 <228ddf41-e1d0-4d06-9e0e-9e0dad841688@foss.st.com>
 <fd874f4d-d68c-4443-8bb6-115246f4407b@kernel.org>
 <a0c62797-3c4c-453c-938b-d43666f3b264@foss.st.com>
 <7d501bf2-a017-4c02-a96f-184a7d648b6a@foss.st.com>
 <9f128ce9-6a26-435c-b133-0da80120de2d@kernel.org>
 <20250402124605.GB13181@pendragon.ideasonboard.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250402124605.GB13181@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/04/2025 14:46, Laurent Pinchart wrote:
> On Wed, Apr 02, 2025 at 12:27:08PM +0200, Krzysztof Kozlowski wrote:
>> On 02/04/2025 11:41, Benjamin Mugnier wrote:
>>> On 4/2/25 11:38, Benjamin Mugnier wrote:
>>>> On 4/2/25 11:11, Krzysztof Kozlowski wrote:
>>>>> On 02/04/2025 10:34, Benjamin Mugnier wrote:
>>>>>> Hi Krzysztof,
>>>>>>
>>>>>> On 4/2/25 09:08, Krzysztof Kozlowski wrote:
>>>>>>> On Tue, Apr 01, 2025 at 01:05:58PM +0200, Benjamin Mugnier wrote:
>>>>>>>> +    properties:
>>>>>>>> +      endpoint:
>>>>>>>> +        $ref: /schemas/media/video-interfaces.yaml#
>>>>>>>> +        unevaluatedProperties: false
>>>>>>>> +
>>>>>>>> +        properties:
>>>>>>>> +          data-lanes:
>>>>>>>> +            items:
>>>>>>>> +              const: 1
>>>>>>>
>>>>>>> Not what I asked. Now you miss number of items. Just use the syntax I
>>>>>>> proposed. Or was there any issue with it?
>>>>>>
>>>>>> No issue I just misunderstood and thought const: 1 was impliying
>>>>>> maxItems: 1. I'll add maxItems back.
>>>>>
>>>>> That's just longer way to express what I asked for. So I repeat the
>>>>> question: why not using the syntax I asked for?
>>>>
>>>> I guess I didn't understand what you asked for.
>>>> May I ask you to write it ? That will help me a lot.
>>>
>>> By 'it' I mean the binding.
>>
>> I wrote it last time. I don't think that copying the same here would
>> change anything. If I can look at v1, you can do as well.
> 
> Reading your comment on v1, I would have come up with the exact same
> result as Benjamin's v2. I can't figure out what alternative description
> you meant.
What do you mean by description? I pasted code. The *exact* code to use.
Benjamin used different code. Two times I asked why you cannot use the
code I pasted. Still no answer.

Best regards,
Krzysztof

