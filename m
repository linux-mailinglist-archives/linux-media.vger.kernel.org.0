Return-Path: <linux-media+bounces-34289-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2C8AD0C4C
	for <lists+linux-media@lfdr.de>; Sat,  7 Jun 2025 11:46:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 699D21892552
	for <lists+linux-media@lfdr.de>; Sat,  7 Jun 2025 09:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41CDC212D7D;
	Sat,  7 Jun 2025 09:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SWjp5+hk"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4708F6B;
	Sat,  7 Jun 2025 09:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749289586; cv=none; b=O6AaaKy5cCbVNQdi7VXyDmiyeyxgv//jVGGC8PN2ecT6CgeaxNqFb9poViI3p41aPl2EIEgec9VuhxOne8MfhfjZ8bi6MmBwt591lGPLu6Mbg9UuXn8awXs/SY5PU3MDU0iO59F//2bka1BA+dZ2euXiczuMLPMw9STftni6Rns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749289586; c=relaxed/simple;
	bh=O79a+nbp6s/2+z86uMxBH1Qs3BThdL/vVT+uQXrMH0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aksDbEXIBSKETleJeMtBLc5e9TalHHPKAzihZ7TZ699+jljYRcnzlIma2XtZxLLifayB8e3Iyp1YL1yleEV3FBVGaGZds8WxKyugONxSE/rnxgtldBen3dwjHLkG9+S+NTcaiu2u8Wi3zVXJ7ey2OXOo1AkODFh84GCrbGr85PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SWjp5+hk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 851B3C4CEE4;
	Sat,  7 Jun 2025 09:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749289586;
	bh=O79a+nbp6s/2+z86uMxBH1Qs3BThdL/vVT+uQXrMH0Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SWjp5+hkTratYZnhlPOEeQQbX759cy6GvwhyCZCuB4EkE7dPzeCCcq3msjcsJdEQ5
	 HP9cqCStxo6SCVF85cX8N3yuXOiOBTSrVoyk5XYCCiHevj+I3vCa+GNcXu2V8xvtqy
	 mQGJsqDjNpDEqHdc9wcu/RfXzsAZtyJ7xUy9NWkLmcXX2nIgjPKl5ptjpqLxJ7opUS
	 kpFII6o+sH/SG6WXkfPt/s39J4oEeKVOqXAPJ6V51qPjH8QoqasE3Rqcs836/T3iFN
	 FshFF1rbc6pWhljRW5YRDBPKt1Kau1mQlEo++gVYR+KtYQLr0PKwNJSP4gRYu7xnzP
	 e0vIRNe3MmmqQ==
Message-ID: <5b6864a9-f0ee-4bc5-aba2-c165d14b0b75@kernel.org>
Date: Sat, 7 Jun 2025 11:46:20 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/3] media: venus: enable venus on qcs615
To: Renjiang Han <quic_renjiang@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
 <wmri66tkksq6i3hfyoveedq5slghnnpozjzx6gck5r3zsiwsg6@xevgh54rnlqd>
 <285cae4a-219c-4514-818f-34c8225529de@quicinc.com>
 <5854a587-aba7-4e71-87f8-249ba00cbc59@linaro.org>
 <996c9a39-5520-4b43-adfa-06ce29223ba0@quicinc.com>
 <713b87cb-0003-4ee3-a599-9cd41629bb42@kernel.org>
 <7aa36a0f-6741-40c2-93f4-036823d245fd@quicinc.com>
 <247002c0-ee68-4d0d-857a-768bf68bce75@kernel.org>
 <d5aee491-3ba2-4beb-8b8f-4ba8372e6d16@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <d5aee491-3ba2-4beb-8b8f-4ba8372e6d16@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/06/2025 15:32, Renjiang Han wrote:
> 
> On 6/6/2025 8:56 PM, Krzysztof Kozlowski wrote:
>> On 06/06/2025 14:51, Renjiang Han wrote:
>>> On 6/6/2025 8:44 PM, Krzysztof Kozlowski wrote:
>>>> On 06/06/2025 14:37, Renjiang Han wrote:
>>>>> On 6/5/2025 8:34 PM, Bryan O'Donoghue wrote:
>>>>>> On 31/05/2025 01:05, Renjiang Han wrote:
>>>>>>>>> Note:
>>>>>>>>> This series consist of DT patches and a venus driver patch. The patch
>>>>>>>>> 1/3, which is venus driver patch, can be picked independently without
>>>>>>>>> having any functional dependency. But patch 2/3 & patch 3/3, which are
>>>>>>>>> DT patches, still depend on [1].
>>>>>>>> I'd say 2/3 and 3/3 still depend on 1/3, otherwise we can get video
>>>>>>>> core
>>>>>>>> on QCS615 over(?)clocked.
>>>>>>> Agree, so we need to make sure that the driver patch is not picked
>>>>>>> after the DT patch.
>>>>>> This statement is confusing.
>>>>>>
>>>>>> 1/3 states that there will be a fallback if there is no OPP table
>>>>>> present.
>>>>>>
>>>>>> Giving the code a glance, I believe that is so, freq_table should be
>>>>>> used if there is no OPP specified in the DT.
>>>>>>
>>>>>> I think we are having a hard time here understanding what you are saying.
>>>>>>
>>>>>> My understanding:
>>>>>>
>>>>>> - venus modification is standalone 1/3
>>>>>>     Qcs615 will fallback if no OPP is present
>>>>>>
>>>>>> - dt modification 2/3 3/3 is therefore also independent of driver
>>>>>>
>>>>>> ---
>>>>>> bod
>>>>> yes, let me re-spin this with driver patch alone. Once that gets in,
>>>>> will bring in the DT patches.
>>>> Did you read my feedback? There is no "once that gets in". DTS is an
>>>> independent hardware description and your patchset claiming there is
>>>> dependency is just broken.
>>>>
>>>> I am repeating this since few emails, so shall I NAK it that you will
>>>> address the main issue you have?
>>>>
>>>> Best regards,
>>>> Krzysztof
>>> Hi Krzysztof
>>>
>>> SC7180 and QCS615 use the same video core. Only difference lies in the
>>> freq_table for the video. Freq_table is generally determined at SOC level.
>>> The Venus driver does not currently handle freq_table compatibility well
>>> across platforms. This patch enables the driver to use the OPP-table from
>>> the DT, addressing the frequency compatibility issue.
>> This does not resolve the main problem at all. If SW cannot use the
>> fallback alone, your fallback has no meaning and is not only confusing
>> but actually incorrect. And based on previous statements like
>> "overclocking" it is not only incorrect, but even harmful.
>>
>> Best regards,
>> Krzysztof
> The fallback is only triggered when there is no OPP table in the DT.

No. I don't think you understand how fallback works. Fallback will be
applied on any QCS615 DTS without front compatible.


Best regards,
Krzysztof

