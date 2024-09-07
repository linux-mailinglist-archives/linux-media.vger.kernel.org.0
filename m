Return-Path: <linux-media+bounces-17871-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E8C970149
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 11:08:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45F511C220D5
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 09:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BFAF155CB3;
	Sat,  7 Sep 2024 09:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dAzINJ6h"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A8014B094;
	Sat,  7 Sep 2024 09:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725700075; cv=none; b=GBWlFJ0hSF6qUtm5VBye/dkAiP0KEnduDpg+haMd2bmwWWu+/9zuPnkGBPWHAP4QeOLmvjQo8jiP8BFQNyo4OPZ+MPK5rWP0lVaqpbeq837oH58Jf+yprPkDL9543EckCIlUnsPITA9rbQQolnExMhDadGvC4VFF6rwiqPsOhj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725700075; c=relaxed/simple;
	bh=DxFZRsW+AZZBSAZT0A4Mpaler5iftVr7G/9wqCUcvWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cj6Ft5+ADxRSnoWJMp+6aRILaCgDg7iUkWWNR4PhrZmDZf48wAxcnlPyJJOGYY6GnQo0sVsDLjPbI1oYWdPX6em1E3i8GtcgDi1snRgrgDEZjkQZr08Z8xF05UK7h4hppgDWkO5Gq3dmBHkKxOnaYG4E5/nqPWSWTBSPWGuIJrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dAzINJ6h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36230C4CEC2;
	Sat,  7 Sep 2024 09:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725700074;
	bh=DxFZRsW+AZZBSAZT0A4Mpaler5iftVr7G/9wqCUcvWc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dAzINJ6heOeB9/94GaOk8W36pYTm8ATvlD0bf7pgR5hea4me2txh/b7YM5DKFift6
	 xA/svDW62YSHeHxXKg9hERQrw9h5RSa0RS3KXt5tdBYfvySM8XxAFXiVFtMU785jDk
	 twJwtm0gP+Z8fAYZ8pMFUadGTkk1czR0f0l8xvUXddhepjMNTDCh4d3kNjnn116uGX
	 oNGFnAwevnp1NSegmIOYAhhScH7RYtnufAblqdQ7Jyfhl5Am//581BPG2rOBHDhwo0
	 SE6FPeUY59F3U9cGn3t9WdmcVqDqUO9xtwc7xFQGUvBE2xtiTjwIWyBATVj6GZruAV
	 ifS5x7BlpU9VA==
Message-ID: <75c7baa9-1403-42bc-9034-192d53adb95c@kernel.org>
Date: Sat, 7 Sep 2024 11:07:47 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/29] media: iris: initialize power resources
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
 <20240827-iris_v3-v3-4-c5fdbbe65e70@quicinc.com>
 <81fd218f-aa0f-4710-b832-cab927bfab9d@kernel.org>
 <ba747923-38de-5c05-9220-762c5272ec74@quicinc.com>
 <76ffb882-10f9-4737-afa2-9bb60248835d@kernel.org>
 <f88d8596-c6a0-356e-060e-81d68f038995@quicinc.com>
 <c7fd8c50-d5d9-4210-8253-457d7523eb30@kernel.org>
 <463caa4f-c32c-d74c-a8c6-1afbc22a877d@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <463caa4f-c32c-d74c-a8c6-1afbc22a877d@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/09/2024 21:47, Vikash Garodia wrote:
> Hi,
> 
> On 9/6/2024 5:34 PM, Krzysztof Kozlowski wrote:
>> On 06/09/2024 13:21, Vikash Garodia wrote:
>>>>>>
>>>>>>> +	}
>>>>>>> +
>>>>>>>  	ret = v4l2_device_register(dev, &core->v4l2_dev);
>>>>>>>  	if (ret)
>>>>>>>  		return ret;
>>>>>>> @@ -88,8 +101,14 @@ static int iris_probe(struct platform_device *pdev)
>>>>>>>  }
>>>>>>>  
>>>>>>>  static const struct of_device_id iris_dt_match[] = {
>>>>>>> -	{ .compatible = "qcom,sm8550-iris", },
>>>>>>> -	{ .compatible = "qcom,sm8250-venus", },
>>>>>>> +	{
>>>>>>> +		.compatible = "qcom,sm8550-iris",
>>>>>>> +		.data = &sm8550_data,
>>>>>>> +	},
>>>>>>> +	{
>>>>>>> +		.compatible = "qcom,sm8250-venus",
>>>>>>> +		.data = &sm8250_data,
>>>>>>
>>>>>> You just added this. No, please do not add code which is immediatly
>>>>>> incorrect.
>>>>> It's not incorrect, in earlier patch we only added the compatible strings
>>>>> and with this patch introducing the platform data and APIs to get it.
>>>>
>>>> It is incorrect to immediately remove it. You keep arguing on basic
>>>> stuff. Sorry, but that is not how it works. If you add code and
>>>> IMMEDIATELY remove it, then it means the code was not needed. Or was not
>>>> correct. Choose one.
>>> I think it is not removing it. It is adding platform data to compatibles
>>> introduced in previous patch. Maybe it appears as if it is removing it.
>>
>> I know how the diff works.
> Perhaps, i have misunderstood. Are you suggesting to add compat data and
> compatible string together in single patch rather than splitting it in 2 patches
> ? If so, that would essentially end up squashing patch #3 and #4. Let me know if
> that would address your comment and we will plan to do that.

You are supposed to organize your patches so they have logical order. I
already explained why this order is wrong. What's more, previous patch
of two equal compatibles does not have much value. Devices cannot work
and code is confusing.

Best regards,
Krzysztof


