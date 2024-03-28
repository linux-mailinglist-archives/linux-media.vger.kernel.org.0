Return-Path: <linux-media+bounces-7869-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8793488D00B
	for <lists+linux-media@lfdr.de>; Tue, 26 Mar 2024 22:30:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C9E91F66C75
	for <lists+linux-media@lfdr.de>; Tue, 26 Mar 2024 21:30:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7CF713D88A;
	Tue, 26 Mar 2024 21:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nXG9sw/R"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533C613D62E
	for <linux-media@vger.kernel.org>; Tue, 26 Mar 2024 21:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711488607; cv=none; b=No4i/PSvVV5GPIGs2qcP+DrDHyK55I37N3iXNv0OYr0LlS2ZbLXrHTxt/1bY9jfV9LsKu7q+7Gw/dJMaDpQFUAL5rKTCTaMqNCgpCNUa7D3HQuGol6par37usRkgk9SS1I4OwHJOm6XLnyPDv+8lMDDtnD7ROLPacb4gd5ZwhYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711488607; c=relaxed/simple;
	bh=LycH+44Xb+JTPpqfbC5uU7Mi8HxjQOstj+fuX27aKXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ED1qWqNHC/pwbS4376j7qLeaSn/DCsntWjocIls6mJomPuCV/YM/+DtYoEbkc+zvjjXmiSFJeVciAqd3/Sh/jBO00vR2CiplDNUbFb+hzTUdvk8QSvL+uKPnH4hpdYZo1vzM63CDkhHR7M7bNapXLPAPBDJRhkrPjQApa8RyLdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nXG9sw/R; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a474c4faf5eso358469666b.2
        for <linux-media@vger.kernel.org>; Tue, 26 Mar 2024 14:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711488603; x=1712093403; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nHaB+0+fYJxUTdtRETIH4SSyklGWxCbQzRPTcFdYBVU=;
        b=nXG9sw/RTSlq+63VzxN2XlSP6BOs0fJlr3f+mvnOdT4RZzqlC/ExQP0htg3BY7BVno
         EOvLM+RtH105PzVHVceHAcV0RxV3+IYhsjh66S762VD40/Lz1wLdzW65GdBS2Y8++t8s
         PYcGi4k14W2LNPNxLo2kXVDjTEbKyZsZntmm4zY7RE5d1qIgxFNeA41UMTi9XuiK3voo
         dy5nBvMsH2S1nzq8lp0M6nM+azOYwuhvt3XHVJk5CAlQcowufRRVJIXbjvnEX/pR9eYG
         7hUeykp1TcLyvGEZSTf3urbkwYgPzzscU/W24yaNMh9vbGpopCuWRe/r4kGXQWfJePp6
         Umjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711488603; x=1712093403;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nHaB+0+fYJxUTdtRETIH4SSyklGWxCbQzRPTcFdYBVU=;
        b=M38Cq94Kivz4M77sWbeJe79SIHUuw/h4HgUql0JYHpmJw8ebMjTJ2svzO9sw9IM0e8
         gjXs3oSEFFCeKusgZgpLsCI4CWnWzT7p+K2KuOBrQEwkEqIjXtKCXUGXNJJOb884cr/j
         KbVE1WUF3Lwn6iXacDj+/xZcJ+O7F74+3Qaog9H4ZHVCOnSXmr7LZcz4MUcFqAKI8uUm
         u+S/rhVT73LkP/yM193kgVOW6hImaKRwAKvd4MmLXfvJONI81HZgcBrph4zx3IXAEaUQ
         iRzG5NVAM/aaqmzBFD7oMVDrKOytZ00MQlPsBPCqRzsThGzDitYbqbUrhOUw22WostaB
         QXpw==
X-Forwarded-Encrypted: i=1; AJvYcCU2YL+Cw3p7KImcRxWn5LtiSrRdIx46CYD8+1NXhjgZSSUKpFUhBSe4hD1f5OixZ1UMGf2vatDE4nU0rCZD1/6P1qyiEwLZkydz7oE=
X-Gm-Message-State: AOJu0Yxs4pk9Vg1azNBPXNVWys1onftPHDLN5AanphZFjHzRiQ11m/V2
	B/wphCU+WEy6/6htrE5UiPhNC+OT3byYrcpbVAeIjoiPHCH38HquBaI53zvp0Qw=
X-Google-Smtp-Source: AGHT+IHtZooY87fwyO2JOQ1AM8+SDn818Zi8Q+x+f8c4tjasX1FVJo5IofS+iWf+FvzACgpmDfGmnQ==
X-Received: by 2002:a17:906:c2c4:b0:a46:f9c2:f059 with SMTP id ch4-20020a170906c2c400b00a46f9c2f059mr7044312ejb.22.1711488603466;
        Tue, 26 Mar 2024 14:30:03 -0700 (PDT)
Received: from [192.168.92.47] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id i20-20020a17090671d400b00a46e92e583bsm4688081ejk.149.2024.03.26.14.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Mar 2024 14:30:03 -0700 (PDT)
Message-ID: <f50de786-837d-4c51-9c29-1a8711adc7d2@linaro.org>
Date: Tue, 26 Mar 2024 22:30:00 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/20] media: venus: pm_helpers: Kill dead code
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230911-topic-mars-v2-0-3dac84b88c4b@linaro.org>
 <20230911-topic-mars-v2-5-3dac84b88c4b@linaro.org>
 <5e0656ac-badf-dd37-b598-8e4a6f23d2c2@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <5e0656ac-badf-dd37-b598-8e4a6f23d2c2@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4.03.2024 6:40 AM, Dikshita Agarwal wrote:
> 
> 
> On 2/10/2024 2:39 AM, Konrad Dybcio wrote:
>> A situation like:
>>
>> if (!foo)
>> 	goto bar;
>>
>> for (i = 0; i < foo; i++)
>> 	...1...
>>
>> bar:
>> 	...2...
>>
>> is totally identical to:
>>
>> for (i = 0; i < 0; i++) // === if (0)
>> 	...1...
>>
>> ...2...
>>
>> Get rid of such boilerplate.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  drivers/media/platform/qcom/venus/pm_helpers.c | 10 ----------
>>  1 file changed, 10 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
>> index 1ba65345a5e2..7193075e8c04 100644
>> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
>> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
>> @@ -878,14 +878,10 @@ static int vcodec_domains_get(struct venus_core *core)
>>  		.pd_flags = PD_FLAG_NO_DEV_LINK,
>>  	};
>>  
>> -	if (!res->vcodec_pmdomains_num)
>> -		goto skip_pmdomains;
>> -
> Removing the if check and relying only on for loop is good.
> but I don't see the for loop here.
>>  	ret = dev_pm_domain_attach_list(dev, &vcodec_data, &core->pmdomains);
>>  	if (ret < 0)
>>  		return ret;
>>  
> Also, what's the base of this change? I don't see above API in the code
> anywhere.

It's inside the dev_pm_domain_attach_list helper.. It was there explicitly
when I first submitted the patch.

Konrad

