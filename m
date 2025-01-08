Return-Path: <linux-media+bounces-24390-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 02629A05878
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 11:44:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D68791885DCC
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 10:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7224E1F867B;
	Wed,  8 Jan 2025 10:43:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4431CEAD6;
	Wed,  8 Jan 2025 10:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736333031; cv=none; b=l+L6tujd8bPgBhKpN6wgsSc7dkAjpxDjy3xHTLQYpyPCyAEJT3b0G5t+W1ky/yROIyu45vR98SB1ialiTMEvE/CQcdllertjW/+ROOtEAfMxlWgGmzh7gNAqrEUXze0MFeHRr7mYPv6Dor1Y3USUBvI+k/4nf+x+C2FQSmFaldk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736333031; c=relaxed/simple;
	bh=1P1KrTcR8V8R1f8L+0GLWXARzxVo+K4mjkTICs/ig0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qoDfxV15GqeA0wmBgqDs66Ji9v/OSZYdVqEG47lQTyjq3ttw3ZITuPE7omZDdynfldCi2Y1Z4/GcIqEigZUMmvP0ZlefGIe5dWAx7ioQmGA4hOukQxZN/ZEtx79Luk3kq0wm4r4oOwGXnDxFIe9sy0ORJ0f9txYEoj+JWi24m1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03B83C4CEDF;
	Wed,  8 Jan 2025 10:43:46 +0000 (UTC)
Message-ID: <067d0deb-50ea-46bd-9f09-827b0ba61aa3@xs4all.nl>
Date: Wed, 8 Jan 2025 11:43:45 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 27/28] media: iris: enable video driver probe of SM8250
 SoC
Content-Language: en-US
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
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
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <6654d78e-d16b-489a-3532-e2fbc788b0ef@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 1/8/25 11:21, Dikshita Agarwal wrote:
> 
> 
> On 1/8/2025 2:25 PM, Hans Verkuil wrote:
>> On 08/01/2025 09:51, Dikshita Agarwal wrote:
>>>
>>>
>>> On 1/8/2025 1:17 PM, Hans Verkuil wrote:
>>>> On 08/01/2025 08:43, Dikshita Agarwal wrote:
>>>>>
>>>>>
>>>>> On 1/7/2025 7:27 PM, Nicolas Dufresne wrote:
>>>>>> Le lundi 23 décembre 2024 à 16:21 +0530, Dikshita Agarwal a écrit :
>>>>>>>
>>>>>>> On 12/23/2024 4:00 PM, Mauro Carvalho Chehab wrote:
>>>>>>>> Em Thu, 12 Dec 2024 17:21:49 +0530
>>>>>>>> Dikshita Agarwal <quic_dikshita@quicinc.com> escreveu:
>>>>>>>>
>>>>>>>>> +	.dma_mask = GENMASK(31, 29) - 1,
>>>>>>>>
>>>>>>>> Setting a mask to GENMASK() - 1 sounds weird. Is it really what you want?
>>>>>>>> I so, why?
>>>>>>>>
>>>>>>> Hi Mauro,
>>>>>>>
>>>>>>> the value of this dma mask should be 0xe0000000 -1.
>>>>>>>
>>>>>>> The background for the same is, 0xe0000000 onward memory space is allocated
>>>>>>> for IO register space so we are restricting the driver buffer allocations
>>>>>>> to 0xe0000000 - 1.
>>>>>>>
>>>>>>> Based on the comments received in the past, we are using GENMASK to
>>>>>>> generate 0xe0000000.
>>>>>>>
>>>>>>> Does this answer your query or I missed something?
>>>>>>
>>>>>> I'm not sure it will do what you want. (0xe0000000 -1) matches ~BIT(29). Perhaps
>>>>>> you wanted to use ~0xe0000000. 
>>>>>>
>>>>> value of dma mask is coming as expected with GENMASK(31, 29) - 1
>>>>>
>>>>> qcom-iris aa00000.video-codec: dma_mask DFFFFFFF (0xe0000000 -1)
>>>>
>>>> Isn't this just the equivalent of GENMASK(28, 0)? Can't you use that?
>>
>> Too early in the morning, this suggestion was clearly wrong.
>>
>>>>
>>>> It's much easier to understand than GENMASK()-1.
>>>
>>> Sure, I can use either ~GENMASK(29, 29) or ~BIT(29),
>>
>> ~BIT(29).
>>
>> It's really weird to just disable a single bit, so I think some comments
>> explaining why this mask is needed would be good (if there aren't comments
>> already).
>>
> I tested this some more, and seems ~BIT(29) doesn't work, as its still
> conflicting with the register space.

Odd, perhaps a 64 vs 32 bit issue?

> Correct value would be GENMASK(31,30) + GENMASK(28,0) to set the exact bits
> to get the desired value i.e 0xe0000000 -1

Honestly, in this case I would prefer to just go with the actual hex value
0xdfffffff together with an explanatory comment.

Regards,

	Hans

>> Regards,
>>
>> 	Hans
>>
>>> Please let me know which would be better?
>>>
>>> Thanks,
>>> Dikshita
>>>
>>>>
>>>> Regards,
>>>>
>>>> 	Hans
>>>>
>>>>>
>>>>> Thanks,
>>>>> Dikshita
>>>>>> Nicolas
>>>>>>
>>>>>>>
>>>>>>> Thanks,
>>>>>>> Dikshita
>>>>>>>> Thanks,
>>>>>>>> Mauro
>>>>>>
>>>>
>>>>
>>


