Return-Path: <linux-media+bounces-17678-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A115196D7BD
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 13:57:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41EE2281E36
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 11:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4560C19AA5A;
	Thu,  5 Sep 2024 11:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FFw8Gkhj"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914EA199225;
	Thu,  5 Sep 2024 11:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725537450; cv=none; b=fQMPLmfULHHU19WEPDQropaLDn9FPOyOizrlDEfooQgXOG4yzBjvNLNgJxKxfk/SFUB3f/8slCRlg5SO1+yW2jf1s9Kqp2/iL4Aq2Q4pyJVp1paCTIcTqfq8wNqlcs8a/hUzjHbXqhWpAOJhA+BUV0txTyDw6jP+2zeKOPrqmNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725537450; c=relaxed/simple;
	bh=QpfQqHC2bzP8XQjOSvJ/i6DCvNFydK+5BnFr8/38Ftg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ViD8ap08j9H2GJ95EbRUG+HxwFa20Lk+t8mSXvk8hQa40QFPwgsDWx61MEhSSbVxck+70j41NCqBM2Q0H7L9cdDZvuX3lBPIHBOoVcl0JcixZhKCb8OtTgDHxRsIdVclXum7AZrA+wJ/2mrfiD1jamD6M0lHn9pfHahJkyeQVbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FFw8Gkhj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25A6AC4CEC7;
	Thu,  5 Sep 2024 11:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725537450;
	bh=QpfQqHC2bzP8XQjOSvJ/i6DCvNFydK+5BnFr8/38Ftg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FFw8GkhjHMZsjZKHYxTjYptCY6MH7QZOBddLzg+ZHJxUQaqc+0HOdFz6WDHOoUxe6
	 kIN0W66bGfo9vQ4gK4vn+Vd70xuldqiXo6xHi1eQFeqQrpqc9WxgIpJz+Ltqh68K6s
	 OaTK5pgbHclL3uMaOrMfF83zqZDOvcuRhpLMweICM5cIDetfmkkf/7IsBcL1Q9LKOf
	 g5kvNp98jZ3aZAQ44Xgs+cGkoEhTWe/R2c8Wh6Ko6jokHXWZ1kNgnzhF3iP78kl28v
	 ua+tPI16hLcdn7MPw++GN5Yju5N9yytV4TPMUCvY2DSlnI69EK5o9ZV0CagqqYTIdh
	 SLnFLg5SV66QA==
Message-ID: <76ffb882-10f9-4737-afa2-9bb60248835d@kernel.org>
Date: Thu, 5 Sep 2024 13:57:23 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/29] media: iris: initialize power resources
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
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
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <ba747923-38de-5c05-9220-762c5272ec74@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/09/2024 13:53, Dikshita Agarwal wrote:
> 
> 
> On 8/27/2024 4:21 PM, Krzysztof Kozlowski wrote:
>> On 27/08/2024 12:05, Dikshita Agarwal via B4 Relay wrote:
>>> From: Dikshita Agarwal <quic_dikshita@quicinc.com>
>>>
>>> Add support for initializing Iris "resources", which are clocks,
>>> interconnects, power domains, reset clocks, and clock frequencies
>>> used for iris hardware.
>>>
>>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>>> ---
>>
>> ...
>>
>>> +struct iris_platform_data sm8550_data = {
>>> +	.icc_tbl = sm8550_icc_table,
>>> +	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
>>> +	.clk_rst_tbl = sm8550_clk_reset_table,
>>> +	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
>>> +	.pmdomain_tbl = sm8550_pmdomain_table,
>>> +	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
>>> +	.opp_pd_tbl = sm8550_opp_pd_table,
>>> +	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
>>> +	.clk_tbl = sm8550_clk_table,
>>> +	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
>>> +};
>>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
>>> index 0a54fdaa1ab5..2616a31224f9 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
>>> @@ -69,6 +69,19 @@ static int iris_probe(struct platform_device *pdev)
>>>  	if (core->irq < 0)
>>>  		return core->irq;
>>>  
>>> +	core->iris_platform_data = of_device_get_match_data(core->dev);
>>> +	if (!core->iris_platform_data) {
>>> +		ret = -ENODEV;
>>> +		dev_err_probe(core->dev, ret, "init platform failed\n");
>>
>> That's not even possible. I would suggest dropping entire if. But if yoi
>> insist, then without this weird redundant code. return -EINVAL.
>>
> Its possible if platform data is not initialized and this is only place we
> check it, there is no further NULL check for the same.

It is possible? Then point me to the code line. Or present some code
flow leading to it.

>>> +		return ret;
>>> +	}
>>> +
>>> +	ret = iris_init_resources(core);
>>> +	if (ret) {
>>> +		dev_err_probe(core->dev, ret, "init resource failed\n");
>>> +		return ret;
>>
>> How many same errors are you printing? Not mentioning that syntax of
>> dev_errp_rpboe is different...
> We have these errors at multiple points to know at what point the probe
> failed which is useful while debugging probe failures.

Duplicating is not helpful.

> But Sure we will revisit this code and fix the syntax of dev_err_probe.

>>
>>
>>> +	}
>>> +
>>>  	ret = v4l2_device_register(dev, &core->v4l2_dev);
>>>  	if (ret)
>>>  		return ret;
>>> @@ -88,8 +101,14 @@ static int iris_probe(struct platform_device *pdev)
>>>  }
>>>  
>>>  static const struct of_device_id iris_dt_match[] = {
>>> -	{ .compatible = "qcom,sm8550-iris", },
>>> -	{ .compatible = "qcom,sm8250-venus", },
>>> +	{
>>> +		.compatible = "qcom,sm8550-iris",
>>> +		.data = &sm8550_data,
>>> +	},
>>> +	{
>>> +		.compatible = "qcom,sm8250-venus",
>>> +		.data = &sm8250_data,
>>
>> You just added this. No, please do not add code which is immediatly
>> incorrect.
> It's not incorrect, in earlier patch we only added the compatible strings
> and with this patch introducing the platform data and APIs to get it.

It is incorrect to immediately remove it. You keep arguing on basic
stuff. Sorry, but that is not how it works. If you add code and
IMMEDIATELY remove it, then it means the code was not needed. Or was not
correct. Choose one.

...

>>
>> This should be just part of of main unit file, next to probe. It is
>> unusual to see probe parts not next to probe. Sorry, that's wrong.
>>
> All the APIs handling(init/enable/disable) the different resources (PM
> domains, OPP, clocks, buses) are kept in this iris_resource.c file hence
> this API to init all those resources is kept here to not load iris_probe.c
> file.

You introduce your own coding style and as an argument you use just "I
do this".

The expected is to see resource initialization next to probe. Repeating
what your code does, is not helping me to understand your design choice.

Best regards,
Krzysztof


