Return-Path: <linux-media+bounces-24646-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D58A0A2F1
	for <lists+linux-media@lfdr.de>; Sat, 11 Jan 2025 11:45:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1DC787A41B7
	for <lists+linux-media@lfdr.de>; Sat, 11 Jan 2025 10:45:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6086A1922EF;
	Sat, 11 Jan 2025 10:45:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D4F19006F;
	Sat, 11 Jan 2025 10:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736592309; cv=none; b=RVpIUvBpCPw1w4dAnbJOGvnR75dHC44ivVwGGfODZhMydGdkYSJQx8VowAqsLvwRFoTNru4OWv9JFq2DakNkLOIyq6joZlIhjdU/ve/OpMB1F8livFZ+m11Qpno+6vQfeY5NI+phYRR+M3KO+MqBnB540oIOBwuN9j/SxZR25ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736592309; c=relaxed/simple;
	bh=52Pl44Q3COZfRIFHQEk5QMRdal6vOQrCpMHEDhgWu2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b0QavjlAd99g0N4rQZ+wiFn8cNun2zI1iyw/kBiPQ798NYhUNNsuuhAK5lpMhLVqyz9FqBDYjqIoy1P0GrySPSAiMfVIluJAcPY+RbR+T1tAupTQO/SOae+VE36VZn19wROGlHCbJ9h/LaELi3rD7Zkff0I7gZLMzQ6fm0CyM58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F144DC4CED2;
	Sat, 11 Jan 2025 10:45:04 +0000 (UTC)
Message-ID: <7e75deb6-6c0e-4bf8-b4c5-d76b1abe2d5b@xs4all.nl>
Date: Sat, 11 Jan 2025 11:45:02 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 27/28] media: iris: enable video driver probe of SM8250
 SoC
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>, Johan Hovold
 <johan@kernel.org>, Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Jianhua Lu <lujianhua000@gmail.com>,
 Stefan Schmidt <stefan.schmidt@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>
References: <20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com>
 <20241212-qcom-video-iris-v9-27-e8c2c6bd4041@quicinc.com>
 <Z3_nCPk_g8znto4A@hovoldconsulting.com>
 <64f8bebd-35e1-c743-b212-e1a3292bade2@quicinc.com>
 <Z4EuiPEw8mvDQ2gv@hovoldconsulting.com>
 <24334fb8-4d83-eb06-aee3-dfe1f8e4937b@quicinc.com>
 <552972B8-1ACA-4243-A8E3-8F48DAF39C5C@linaro.org>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <552972B8-1ACA-4243-A8E3-8F48DAF39C5C@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/01/2025 19:01, Dmitry Baryshkov wrote:
> On 10 January 2025 19:30:30 EET, Dikshita Agarwal <quic_dikshita@quicinc.com> wrote:
>>
>>
>> On 1/10/2025 7:58 PM, Johan Hovold wrote:
>>> On Thu, Jan 09, 2025 at 11:18:29PM +0530, Vikash Garodia wrote:
>>>> On 1/9/2025 8:41 PM, Johan Hovold wrote:
>>>>> On Thu, Dec 12, 2024 at 05:21:49PM +0530, Dikshita Agarwal wrote:
>>>>>> Initialize the platform data and enable video driver probe of SM8250
>>>>>> SoC. Add a kernel param to select between venus and iris drivers for
>>>>>> platforms supported by both drivers, for ex: SM8250.
>>>>>
>>>>> Why do you want to use a module parameter for this? What would be the
>>>>> default configuration? (Module parameters should generally be avoided.)
>>>
>>>> This was discussed during v4 [1] and implemented as per suggestion
>>>>
>>>> [1]
>>>> https://lore.kernel.org/linux-media/eea14133-2152-37bb-e2ff-fcc7ed4c47f5@quicinc.com/
>>>
>>> First, the background and motivation for this still needs to go in the
>>> commit message (and be mentioned in the cover letter).
>>>
>>> Second, what you implemented here is not even equivalent to what was
>>> done in the mdm drm driver since that module parameter is honoured by
>>> both drivers so that at most one driver tries to bind to the platform
>>> device.
>>>
>>> With this patch as it stands, which driver ends up binding depends on
>>> things like link order and what driver has been built a module, etc. (as
>>> I pointed out below).
>>>
>>>>> Why not simply switch to the new driver (and make sure that the new
>>>>> driver is selected if the old one was enabled in the kernel config)?
>>>
>>>> Its about the platform in migration i.e sm8250. Since new driver is not yet
>>>> feature parity with old driver, choice is provided to client if it wants to use
>>>> the new driver (default being old driver for sm8250)
>>>
>>> This should be described in the commit message, along with details on
>>> what the delta is so that the reasoning can be evaluated.
>>>
>>> And I'm still not sure using a module parameter for this is the right
>>> thing to do as it is generally something that should be avoided.
>>>
>> I understand your concern of using module params.
>> I will modify it to rely on Kconfig to select the driver (suggested by
>> Hans) instead of module param.
> 
> Please don't. This makes it impossible to perform side-by-side comparison. Also as venus and iris drivers are not completely equivalent wrt supported platforms, distributions will have to select whether to disable support for older platforms or for new platforms: Kconfig dependency will make it impossible to enable support for both kinds.

An alternative is that the module option is placed under

#if defined(CONFIG_VIDEO_QCOM_IRIS) && defined(CONFIG_VIDEO_QCOM_VENUS)

So it only activates if both drivers are compiled.

But the fact that both drivers can work for the same hardware is something that
must be clearly documented. Probably in a comment block before this module option.
Possibly also in the Kconfigs for the IRIS and VENUS drivers.

Things that are unusual require explanation, so in this case I'd like to see:

1) Why are there two drivers?
2) Why allow runtime-selection of which driver to use? (E.g. side-by-side comparison)
3) Which hardware supports only venus, only iris, or both?
4) What is the road forward? (I assume that venus is removed once feature parity is reached?)

Regards,

	Hans

> 
>> something like:
>> config VIDEO_QCOM_IRIS
>>        tristate "Qualcomm iris V4L2 decoder driver"
>>       ...
>>        depends on VIDEO_QCOM_VENUS=n || COMPILE_TEST
>>
>> Thanks,
>> Dikshita
>>>>>>  static int iris_probe(struct platform_device *pdev)
>>>>>>  {
>>>>>>  	struct device *dev = &pdev->dev;
>>>>>> @@ -196,6 +224,9 @@ static int iris_probe(struct platform_device *pdev)
>>>>>>  	u64 dma_mask;
>>>>>>  	int ret;
>>>>>>  
>>>>>> +	if (!video_drv_should_bind(&pdev->dev, true))
>>>>>> +		return -ENODEV;
>>>>>
>>>>> AFAICT nothing is preventing venus from binding even when 'prefer_venus'
>>>>> is false.
>>>>>
>>>>>> +
>>>>>>  	core = devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
>>>>>>  	if (!core)
>>>>>>  		return -ENOMEM;
>>>
>>> Johan
> 


