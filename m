Return-Path: <linux-media+bounces-34481-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D71C6AD4495
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 23:15:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 633021784A4
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 21:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CE70274FC1;
	Tue, 10 Jun 2025 21:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xq2SfB7C"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09502749C9
	for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 21:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749590113; cv=none; b=V6TDt/8iBcOF1zM2P8CYTZF+6/ace3lVXNivpXKzdx/Mx8FKhKlkhNWks0UvO6BPuqhdYu/lNb8vaP7AvnsJmeWGPVC/YGtOVVqLVTXyAJyg/XFZTQbmAmacnTbMyPrZIksZeUr/3cxk5SmwfOo1lklq7/DG4MxAXVrcI2hMXOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749590113; c=relaxed/simple;
	bh=Z38cuJp33LWArvdj5hyZqOMy6cQfIIBF5uVgw+/DXwg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cb+2RLDCEKcA7j9qwtnXwDogLLlSc1wrLr5VsSq8ZdYZuXYzg7PQNxdp6BlvQcT0L+xLo4PLQT5E2En75ekJn5+hvG/4ZTjcv6dOpsVS1s4fuyDo1LcFBJoL7tRymFHZg92EJFsfp459yfbXtLlPzPocC9Pyv190+/0GYUJU1ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xq2SfB7C; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-553645133f0so636005e87.0
        for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 14:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749590110; x=1750194910; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xp9DTTw1nAnCu7+mJSX+wELA9PUPZoEDRChqKms+7Zw=;
        b=Xq2SfB7C438tDciEkqt/yJ6bIvaGTzbR3hB4EFmmI0Gx2qAozCUjmoJ4kakAVW+kGn
         tcHluRuyU4K+mFX9JEnje+hDLfRkErv51nJGtMDRkODwUeLVd7i1x6dCp7Ml5S+SKoVM
         UJGXMlH8XkCUPELs4yVT/WkY7MN9cJV2VJOMRUCK8MJ3XO46gUjrv1lMCtpBRcqGJzTc
         7Ajsb12XsUGmv97Lp7kwIE9kQi6AsnO+nSOAitG1nJPsWFnVLnRj/N/fRbUrw9rUcPPF
         b3to4Z48Cd5OHqYq+Jjtj23ffoKErEN3HuZLmNwMUfQT+YYeL5NZOKJJaQYnowH3wAmT
         SPGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749590110; x=1750194910;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xp9DTTw1nAnCu7+mJSX+wELA9PUPZoEDRChqKms+7Zw=;
        b=U1OGmc6JUOoDz0db020kgfjIxSt0vZ06kN6YVMcNcaqYBHVp2bDovpmImccmOq1qY1
         s/FuKvEiQi5hlqY6DJCKwbhODhly3qZyBNr50SxywR1IRUFC+fBnFffZmPL+n97TePkc
         LMyt1ImqnJ3IHs51chpiqobPfyjFNHTf0rUMAU9UnMV6RsAUoP/u6STCdbfjB2rb3qGW
         dc7UesBmsX401QA8tV4YnteFipWhztA9HxHHAqd0Wn/E+VPSYFwrXhbU7wUNWomeQV2b
         8Eg0amwis1zThSHqSLl33IeLavMZNMH0VksH6sgCBw6Vpke1Xi7B9PiN1QLnaijUvR9e
         L7cA==
X-Forwarded-Encrypted: i=1; AJvYcCVu1BtFxFOt63/7ymBMh6uFqLoN/x+7Bewm83i30rs/3jJZbSa1A0Qc5bBmo/CIK7V5lQr/aRONWV92ug==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUdonRBTDRRq00gIkc8l7jjlhqoaz521/5ALGkMbfAZetY33wk
	+RROF+Qg96rQ2Dv1+7W4RDsV3/yW20wwSjnT9phaV0DxuKeaDkGK11RaUY1qZGwHb3Y=
X-Gm-Gg: ASbGncu3vXBt51Uu7EnlNQZL3HK9bacLs+AcYmG4A0s54TpjXyvISIZLou3xm8TPlbX
	0EdlyiCiXdwjagU4oteYZ3YNpa9lLw+Nfb9jZiBzFyZeHqJfnDw2mXI1xDGDF58PMHwNrseQ34G
	c6jq49cZ+jtyTbENOP17oKJPRblWwh34YTvIrlTeeJ1sbG64fJsRUoqku0Sq4JsOlW7oh3N27r0
	eOJ5sxoo6qSWzwfdVHw66XS9CmSJlYuPO8l4BV18nUbQsuibgvdfmlCcd/mYrmHMCm6uNv4848R
	iy1OIK4b2CcppLxhaHyen0E2oinsojtBx20Iyy5IXc/dWOzG7zFFD8Mh8HNn+2PR8nsxglDERGx
	EZO2dAauuVdZx+Z4mvMR0BhRebP3RcnEbfAJjxzm2
X-Google-Smtp-Source: AGHT+IGZItlbSfmzgJrv1aE8F6o4CS4khJJN0XB1HO2JSTvC5zGxXbluAy7/VezJqQ/3zhgAVPeIQg==
X-Received: by 2002:a05:6512:1329:b0:545:2774:4cb0 with SMTP id 2adb3069b0e04-5539c04fd49mr116148e87.0.1749590109708;
        Tue, 10 Jun 2025 14:15:09 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553676cfe42sm1709240e87.30.2025.06.10.14.15.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 14:15:09 -0700 (PDT)
Message-ID: <7e82074f-0476-4081-b30e-2d1ace9bb3f9@linaro.org>
Date: Wed, 11 Jun 2025 00:15:08 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] media: qcom: camss: a number of cleanups and fixes
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
 <b268a017-b42c-4b4c-859c-a7e8ea6cf8fa@linaro.org>
 <bc139945-2fe7-46da-8929-2098d77e155a@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <bc139945-2fe7-46da-8929-2098d77e155a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Bryan.

On 6/10/25 21:53, Bryan O'Donoghue wrote:
> On 10/06/2025 18:26, Vladimir Zapolskiy wrote:
>> On 5/13/25 17:23, Vladimir Zapolskiy wrote:
>>> The patchset prepares the ground for a CSIPHY rework in CAMSS ISP driver.
>>>
>>> For simplicity of continuing my reviews of CAMSS paches add myself as
>>> a reviewer, as well it will simplify the work of syncing and avoiding
>>> patch conflicts between work oin CAMSS done by others and myself.
>>>
>>> Vladimir Zapolskiy (9):
>>>     media: qcom: camss: cleanup media device allocated resource on
>>> error path
>>>     media: qcom: camss: remove duplicated csiphy_formats_sc7280 data
>>>     media: qcom: camss: remove .link_entities
>>>     media: qcom: camss: register camss media device before subdevices
>>>     media: qcom: camss: unconditionally set async notifier of subdevices
>>>     media: qcom: camss: simplify camss_subdev_notifier_complete() function
>>>     media: qcom: camss: change internals of endpoint parsing to fwnode
>>> handling
>>>     media: qcom: camss: use a handy v4l2_async_nf_add_fwnode_remote()
>>> function
>>>     MAINTAINERS: add myself as a CAMSS patch reviewer
>>>
>>>    MAINTAINERS                                   |   1 +
>>>    .../media/platform/qcom/camss/camss-csiphy.c  |   5 -
>>>    .../media/platform/qcom/camss/camss-csiphy.h  |   1 -
>>>    drivers/media/platform/qcom/camss/camss.c     | 182 +++++++-----------
>>>    drivers/media/platform/qcom/camss/camss.h     |   1 -
>>>    5 files changed, 71 insertions(+), 119 deletions(-)
>>>
>>
>> The changeset is left unreviewed for 4 weeks...
>>
>> May I ask linux-media maintainers to take care of the patchset?..
>>
>> -- 
>> Best wishes,
>> Vladimir
> 
> I haven't forgotten about your series, thanks for the ping.
> 

Thank you in advance, it would be nice to get your review/testing
and get the changeset landed into the linux-next.

--
Best wishes,
Vladimir

