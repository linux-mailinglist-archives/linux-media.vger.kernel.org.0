Return-Path: <linux-media+bounces-36594-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5DDAF5A56
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 16:00:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B67E1C22FF4
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 14:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07B34285073;
	Wed,  2 Jul 2025 13:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IibodPuY"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5787D275846;
	Wed,  2 Jul 2025 13:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751464780; cv=none; b=mKXq54cUzp4g9T2N7tIcTRprV14XU14pq3x3nO5HYWliuWWu8T0x5Oa6cDq9AehcErSvy+6Ie0RaEuHkOjnmiPM3DCf4RQtisKwF+d8T/+8CdBCF4QNSzp58dzrVrnIm/9wN5LZNyH4LlLJt2pVxs2gONJ9jLJOhnQPd3sSL87Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751464780; c=relaxed/simple;
	bh=kJfXmDm7NBssI4qDICIYhiXyYISGnFX7WgqKITyf61g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pchJU3kHjLHsRv6BE0kDGL3K4a4F+abnVjA0M/wNkp9xIGHAovQQ7fZKAr2FYxnm7GQiTwh8zRp79ql0RK5TQSUJhRc9iRV1PKCc3q+ytN1vrVyzekQzMkaytbT2djxisYEErMSqwkWmlZUsRVKA67z13g+svSD362kIAKrWEQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IibodPuY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D02CFC4CEE7;
	Wed,  2 Jul 2025 13:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751464779;
	bh=kJfXmDm7NBssI4qDICIYhiXyYISGnFX7WgqKITyf61g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IibodPuYAcsjAUE9NUbENQBAbqvZXrZuIJEyYWJ9pFz0ltuYqvowtxSR1iNRamVuZ
	 5DTR2w1js3OI6t39vBXoP3U5DkPrVNOi3W1Fb1c94H3MbkJKtaoLvd2R4OZnkh21bt
	 6jzu81uTrvqRwIVrHKpPKMnCiKh+eMSYAAhiRHNmdnOgYspLnFrEfiyr1VLAfAW742
	 wxtFwW8Q50/3hI4IBNnsNBfqtWH6M5WBSrBZbjq6F9Bz7Q6LCd7P4sc4UOSlYoKbFp
	 1NodI6a94fKicyV9o9qYKtx696FvqGGGDiWEjf/K3LSYPQtP2DqeezkhPdaGGy6AkN
	 2IA5pweEP8ynw==
Message-ID: <023038d4-2258-4b2d-a3f9-b817ef0173bc@kernel.org>
Date: Wed, 2 Jul 2025 15:59:35 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] media: dt-bindings: add non-pixel property in iris
 schema
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
 <20250627-video_cb-v3-1-51e18c0ffbce@quicinc.com>
 <19dd2e69-ad13-46f2-b99f-04a5e26f10d3@kernel.org>
 <08c8cdfd-099e-7b90-b163-23ecee3a5da4@quicinc.com>
 <118f2cbe-d8bd-4177-b0d5-91d9f1dbbef0@kernel.org>
 <9f5be122-302d-402f-91f2-675507612d32@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <9f5be122-302d-402f-91f2-675507612d32@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/07/2025 15:11, Konrad Dybcio wrote:
> On 7/2/25 1:46 PM, Krzysztof Kozlowski wrote:
>> On 02/07/2025 13:32, Vikash Garodia wrote:
>>>
>>> On 7/2/2025 4:43 PM, Krzysztof Kozlowski wrote:
>>>> On 27/06/2025 17:48, Vikash Garodia wrote:
>>>>> Existing definition limits the IOVA to an addressable range of 4GiB, and
>>>>> even within that range, some of the space is used by IO registers,
>>>>> thereby limiting the available IOVA to even lesser. Video hardware is
>>>>> designed to emit different stream-ID for pixel and non-pixel buffers,
>>>>> thereby introduce a non-pixel sub node to handle non-pixel stream-ID.
>>>>>
>>>>> With this, both iris and non-pixel device can have IOVA range of 0-4GiB
>>>>> individually. Certain video usecases like higher video concurrency needs
>>>>> IOVA higher than 4GiB.
>>>>>
>>>>> Add reference to the reserve-memory schema, which defines reserved IOVA
> 
> [...]
> 
>>>>>    dma-coherent: true
>>>>>  
>>>>> +  non-pixel:
>>>>
>>>> Why EXISTING hardware grows?
>>> Same here, the commit describes the limitation of existing design and also
>>> explains the need for having the non-pixel device. Its not that the hardware is
>>> growing here, rather the hardware stream-IDs are utilized differently to get
>>> higher device addressable range.
>>
>> You are not doing this for a new device. There is no new device here at
>> all. Nowhere here is a new device.
>>
>> Changes for a new device COME TOGETHER with the new device.
>>
>> What you are doing here is changing existing hardware without any
>> explanation why.
> 
> This is bindings getting a reality check.. this goes as far back as Venus
> existed (msm8974/2012)

This won't fly. This is a new binding after long reviews and
discussions, why Qualcomm does not want to extend existing Venus but
needs completely new Iris. Well, if you get completely new Iris, you
cannot use argument of "legacy". We insisted on growing existing
solution, but choice of abandoning it and coming with a new one means
you were supposed to do it right since there is no legacy.

> 
> We unfortunately have to expect a number of similar updates for all
> multimedia peripherals (GPU/Camera/Display etc.), as certain mappings
> must be done through certain SIDs (which are deemed 'secure') and some
> hardware has general addressing limitations that may have been causing
> silent issues all along
> 
Isn't all this commit msg here about non-pixel stuff just not really
describing the real problem at all? This commit msg is very vague and
silent on actual use cases and actual firmware, so even multiple
readings of commit msg did not help me. Stephan Gerhold now nicely
summarized what was never told in commit msg - there is a gap in address
space which is reserved for firmware and no allocations can be done from
that?

Also commit msg says "Existing definition limits the IOVA to an
addressable range of 4GiB, and" but I do not see such definition in the
binding at all. So what does it refer to?



Best regards,
Krzysztof

