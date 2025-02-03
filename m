Return-Path: <linux-media+bounces-25601-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C75CA26038
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 17:34:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 58EAA7A1026
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 16:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D76120B20C;
	Mon,  3 Feb 2025 16:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CjtwPXwD"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C60420B1EC;
	Mon,  3 Feb 2025 16:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738600469; cv=none; b=uNEd7w06ffSBas98ellLAgB5WOFYimLU4a0GaaLUcVw2HupdTLrq/1b5DkXKYBKUh+R0fiQNYqOvekAMEZsq4O9Y9PGuuazgNVSzHRwMlXMxiSmehKA/zdRNz7+L/7y5xiCrON/7PNg8c8xQGsYJeIzjbjQ3sRB137DxVI1TCFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738600469; c=relaxed/simple;
	bh=QzAhLfygH1VmeI6a93oc1pLJc+Tl3u3i4HIkwZDVWdY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sgdDBATogLe/h+Q+qbX8cR1pWMNwBo7m5+vhbARnVmq5PGAyZ+SH1arKkgFuopCVD2zG4LPiZ0tcZ+61hpbnnAtiet5UQtkRid7otUd/U1HWBfqTCh0SlLkQKAwrjchqgKa2X1dCq+LGkOcPj2Pz2aI3FUH8wht43CBZr2uK0BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CjtwPXwD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36F7CC4CED2;
	Mon,  3 Feb 2025 16:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738600468;
	bh=QzAhLfygH1VmeI6a93oc1pLJc+Tl3u3i4HIkwZDVWdY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CjtwPXwDLEP0VrI4vKCdbZ5sa0hagVfZ6VCFikPp3SIMjIT+bd+8zP61i4gnuuaGe
	 tyUHQVeU2MOtAfxQ40rKhVyJUw6URKi3RSBZOL2YgezMtkfHA9kS951Om2RhNxIS3w
	 5CnGn/QNR0XTrcUcaXFgZD+jswBRTnlKwDbQnniB2ggyYJ2DPDCeKohSVNCBkHJnda
	 YH3iovjmXPMLXxFdNYYnLiIlzULAvDveZhf48NhLB2eUe/7MLnFcheO0cfnuQHAodH
	 1DMVIL7oqN1Kmx6obxz0f2s09WLl/lxVfdFJtsra+enPJ1HIyEtV0i4nWXWFQTjRcO
	 hBiS65sjjbRaQ==
Message-ID: <0708dbf1-5914-4372-9df2-5cf590fd7bd6@kernel.org>
Date: Mon, 3 Feb 2025 17:34:20 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v10 1/2] media: iris: introduce helper module to
 select video driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Johan Hovold <johan@kernel.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>, quic_vgarodia@quicinc.com,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 p.zabel@pengutronix.de, hverkuil@xs4all.nl, sebastian.fricke@collabora.com,
 bryan.odonoghue@linaro.org, neil.armstrong@linaro.org, nicolas@ndufresne.ca,
 u.kleine-koenig@baylibre.com, stefan.schmidt@linaro.org,
 lujianhua000@gmail.com, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org
References: <20250128080429.3911091-1-quic_dikshita@quicinc.com>
 <20250128080429.3911091-2-quic_dikshita@quicinc.com>
 <5070e1f1-914b-4654-88ef-3566e3eee9ca@kernel.org>
 <f1344e49-61b6-4115-ae88-55b4a3cfed28@quicinc.com>
 <Z6B822-6UTxQfX46@hovoldconsulting.com>
 <tqbm672pi223ipcw7btiemlb745weeeiy4gnazzeghozhq2emj@wppbkms6hir5>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <tqbm672pi223ipcw7btiemlb745weeeiy4gnazzeghozhq2emj@wppbkms6hir5>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/02/2025 16:16, Dmitry Baryshkov wrote:
> On Mon, Feb 03, 2025 at 09:22:51AM +0100, Johan Hovold wrote:
>> On Fri, Jan 31, 2025 at 10:44:28AM -0800, Abhinav Kumar wrote:
>>> On 1/29/2025 2:44 AM, Krzysztof Kozlowski wrote:
>>>> On 28/01/2025 09:04, Dikshita Agarwal wrote:
>>
>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
>>>>> index 954cc7c0cc97..276461ade811 100644
>>>>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
>>>>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
>>>>> @@ -196,6 +196,9 @@ static int iris_probe(struct platform_device *pdev)
>>>>>   	u64 dma_mask;
>>>>>   	int ret;
>>>>>   
>>>>> +	if (!video_drv_should_bind(&pdev->dev, true))
>>>>> +		return -ENODEV;
>>>>
>>>> Wouldn't it mark the probe as failed and cause dmesg regressions?
>>
>> No, this is perfectly fine. Probe can return -ENODEV and driver core
>> will continue with any further matches.
>>
>>>>> +#if !IS_REACHABLE(CONFIG_VIDEO_QCOM_VENUS) || !IS_REACHABLE(CONFIG_VIDEO_QCOM_IRIS)
>>>>> +bool video_drv_should_bind(struct device *dev, bool is_iris_driver)
>>>>> +{
>>>>> +	/* If just a single driver is enabled, use it no matter what */
>>>>> +	return true;
>>>>> +}
>>>>> +
>>>>> +#else
>>>>> +static bool prefer_venus = true;
>>>>> +MODULE_PARM_DESC(prefer_venus, "Select whether venus or iris driver should be preferred");
>>>>> +module_param(prefer_venus, bool, 0444);
>>>>
>>>>
>>>> The choice of driver is by module blacklisting, not by failing probes.
>>>>
>>>> I don't understand why this patchset is needed and neither commit msg
>>>> nor above longer code comment explain me that. Just blacklist the module.
>>
>>> Summarizing the discussion with myself, Krzysztof and Dmitry:
>>>
>>> 1) module blacklisting solution will not be ideal if users want to have 
>>> both venus and iris or either of them built-in
>>
>> Module blacklisting is not the way to go, you shouldn't have two drivers
>> racing to bind to the same device ever.
>>
>>> 2) with current approach, one of the probes (either venus or iris) will 
>>> certainly fail as video_drv_should_bind() will fail for one of them. 
>>> This can be considered as a regression and should not happen.
>>
>> How can that be a regression? One driver must fail to probe (see above).
> 
> I also don't think that it's a regression. I think Krzysztof was
> concerned about the 'failed to bind' messages in dmesg.

I never used word "regression" alone. I said "dmesg regression", which
means you have error in logs or any system facility which provides you
self-information about device probe history. I don't remember if -ENODEV
leads to any printks, so maybe I am wrong here, but regardless normal
and expected operation of a driver should never result in -ERRNO, except
deferred probe of course.

Best regards,
Krzysztof

