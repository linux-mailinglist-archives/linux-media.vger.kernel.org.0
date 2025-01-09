Return-Path: <linux-media+bounces-24498-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E833A07367
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 11:37:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C249818814B7
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 10:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D35CA2163A0;
	Thu,  9 Jan 2025 10:37:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642D1215F7B;
	Thu,  9 Jan 2025 10:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736419035; cv=none; b=twsWQc55cK0C6XqUO0jdB/l6A300sL2rHUjlNcBRzrGWwsOX/450mV+EuV04ea+TZaOksYgnhmTuah+ieK+eHuNx8xapNJF1uB5iWUnE4t3YR+qh+XtfdlDQlSpRSPmgQb6HDoJe/PTrlD8pgVcz+TpPcckZaIZ0OJe9QWMU+OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736419035; c=relaxed/simple;
	bh=ygBHJkQp0Y34pt4vk9hozJg+Ik4F+/vP/52yR31soVw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LReqVZPTdsq0EtmFUqGATWl4kRjEb9LkP/rpIzYa5RR2b9yD8TjqC7TU3dnhq727tA7fiDHCUYMffgF1uX1J8VJkJhYy4Pk1JC03bDcy8kvK6q4FhZoDHt9cjte4Zm2kzIY+LMZKZf77dA1FFffC+D0lDk+3MEJ/u6EmORcgXUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACE88C4CEE2;
	Thu,  9 Jan 2025 10:37:10 +0000 (UTC)
Message-ID: <0d69e79f-e14f-4636-8360-8b5c2a6c2735@xs4all.nl>
Date: Thu, 9 Jan 2025 11:37:09 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 27/28] media: iris: enable video driver probe of SM8250
 SoC
To: Stanimir Varbanov <svarbanov@suse.de>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Jianhua Lu <lujianhua000@gmail.com>,
 Stefan Schmidt <stefan.schmidt@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com>
 <20241212-qcom-video-iris-v9-27-e8c2c6bd4041@quicinc.com>
 <20241223113027.21b8f7ab@foz.lan>
 <fbe0d935-a3cf-dfa0-aad8-56834a0a002c@quicinc.com>
 <635ce4ed82aaca422b869f467300b0eccf9c8703.camel@ndufresne.ca>
 <c0f59149-713b-45e4-3755-4a52cfaa93f6@quicinc.com>
 <498a99e1-77ca-4acf-8850-cb74417ae88c@xs4all.nl>
 <9fc76dd1-ef49-a9d2-0271-eacb50943b03@quicinc.com>
 <9b33ba28-5aa9-4863-8fde-535841ddbc10@xs4all.nl>
 <6654d78e-d16b-489a-3532-e2fbc788b0ef@quicinc.com>
 <067d0deb-50ea-46bd-9f09-827b0ba61aa3@xs4all.nl>
 <5953bea1-194d-fe2e-251a-d4ef3e7544d3@quicinc.com>
 <20250108155237.5cf0ba10@foz.lan>
 <e2716cd5-4765-d8da-888b-bcdcd86df5c4@quicinc.com>
 <b0bf27f8-ea31-42f5-864d-f769bcbb3833@suse.de>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <b0bf27f8-ea31-42f5-864d-f769bcbb3833@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/01/2025 10:49, Stanimir Varbanov wrote:
> Hi,
> 
> On 1/9/25 10:43 AM, Dikshita Agarwal wrote:
>>
>>
>> On 1/8/2025 8:22 PM, Mauro Carvalho Chehab wrote:
>>> Em Wed, 8 Jan 2025 16:42:03 +0530
>>> Dikshita Agarwal <quic_dikshita@quicinc.com> escreveu:
>>>
>>>> On 1/8/2025 4:13 PM, Hans Verkuil wrote:
>>>>> On 1/8/25 11:21, Dikshita Agarwal wrote:  
>>>>>>
>>>>>>
>>>>>> On 1/8/2025 2:25 PM, Hans Verkuil wrote:  
>>>>>>> On 08/01/2025 09:51, Dikshita Agarwal wrote:  
>>>>>>>>
>>>>>>>>
>>>>>>>> On 1/8/2025 1:17 PM, Hans Verkuil wrote:  
>>>>>>>>> On 08/01/2025 08:43, Dikshita Agarwal wrote:  
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> On 1/7/2025 7:27 PM, Nicolas Dufresne wrote:  
>>>>>>>>>>> Le lundi 23 décembre 2024 à 16:21 +0530, Dikshita Agarwal a écrit :  
>>>>>>>>>>>>
>>>>>>>>>>>> On 12/23/2024 4:00 PM, Mauro Carvalho Chehab wrote:  
>>>>>>>>>>>>> Em Thu, 12 Dec 2024 17:21:49 +0530
>>>>>>>>>>>>> Dikshita Agarwal <quic_dikshita@quicinc.com> escreveu:
>>>>>>>>>>>>>  
>>>>>>>>>>>>>> +	.dma_mask = GENMASK(31, 29) - 1,  
>>>>>>>>>>>>>
>>>>>>>>>>>>> Setting a mask to GENMASK() - 1 sounds weird. Is it really what you want?
>>>>>>>>>>>>> I so, why?
>>>>>>>>>>>>>  
>>>>>>>>>>>> Hi Mauro,
>>>>>>>>>>>>
>>>>>>>>>>>> the value of this dma mask should be 0xe0000000 -1.
>>>>>>>>>>>>
>>>>>>>>>>>> The background for the same is, 0xe0000000 onward memory space is allocated
>>>>>>>>>>>> for IO register space so we are restricting the driver buffer allocations
>>>>>>>>>>>> to 0xe0000000 - 1.
>>>>>>>>>>>>
>>>>>>>>>>>> Based on the comments received in the past, we are using GENMASK to
>>>>>>>>>>>> generate 0xe0000000.
>>>>>>>>>>>>
>>>>>>>>>>>> Does this answer your query or I missed something?  
>>>>>>>>>>>
>>>>>>>>>>> I'm not sure it will do what you want. (0xe0000000 -1) matches ~BIT(29). Perhaps
>>>>>>>>>>> you wanted to use ~0xe0000000. 
>>>>>>>>>>>  
>>>>>>>>>> value of dma mask is coming as expected with GENMASK(31, 29) - 1
>>>>>>>>>>
>>>>>>>>>> qcom-iris aa00000.video-codec: dma_mask DFFFFFFF (0xe0000000 -1)  
>>>>>>>>>
>>>>>>>>> Isn't this just the equivalent of GENMASK(28, 0)? Can't you use that?  
>>>>>>>
>>>>>>> Too early in the morning, this suggestion was clearly wrong.
>>>>>>>  
>>>>>>>>>
>>>>>>>>> It's much easier to understand than GENMASK()-1.  
>>>>>>>>
>>>>>>>> Sure, I can use either ~GENMASK(29, 29) or ~BIT(29),  
>>>>>>>
>>>>>>> ~BIT(29).
>>>>>>>
>>>>>>> It's really weird to just disable a single bit, so I think some comments
>>>>>>> explaining why this mask is needed would be good (if there aren't comments
>>>>>>> already).
>>>>>>>  
>>>>>> I tested this some more, and seems ~BIT(29) doesn't work, as its still
>>>>>> conflicting with the register space.  
>>>>>
>>>>> Odd, perhaps a 64 vs 32 bit issue?
>>>>>   
>>>>>> Correct value would be GENMASK(31,30) + GENMASK(28,0) to set the exact bits
>>>>>> to get the desired value i.e 0xe0000000 -1  
>>>>> Honestly, in this case I would prefer to just go with the actual hex value
>>>>> 0xdfffffff together with an explanatory comment.
>>>>>   
>>>> We moved to GENMASK way to address comment on previous version, but sure
>>>> can directly use 0xdfffffff with a comment.
>>>
>>> If I understood it right, bits 0-31 can be used, but the hardware has some
>>> issue using bit 29 at the mask. Could you please comment why it can't be
>>> used?
>>>
>> That would not be a correct statement, We don't have issue with using BIT
>> 29 with mask but upper limit of DMA address available to use is 0xdfffffff.
> 
> I'd keep the original representation of the DMA address mask. This is
> not an register to represent it via GENMASK. It is used by the driver to
> set the hardware limitation on the upper bound of DMA address range.
> 
> .dma_mask = 0xe0000000 - 1
> 
> because we set it through dma_set_mask_and_coherent() which expects a
> mask we subtract 1.

Yes, I agree. I see the venus driver does the same thing, so let's follow
that example for consistency.

Regards,

	Hans

> 
> ~Stan
> 
> 


