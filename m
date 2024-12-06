Return-Path: <linux-media+bounces-22815-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2AE9E7AFC
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 22:29:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12A441889619
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 21:26:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACCC7203D45;
	Fri,  6 Dec 2024 21:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R0Xsj1vj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F44522C6FA
	for <linux-media@vger.kernel.org>; Fri,  6 Dec 2024 21:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733520362; cv=none; b=cCG8BUZ7MB2ddRndl7q8OlmulzTrYJR/NcUvaOm8SAvLwKVkNEi2BftDezWjvYUdZ7nmVucHjBWhYIbUwXoR4IVy2KX/QPiV1zgQlO4MV5XWNMBxcB7Iyk4w8e4YbIEwH5B+uf6rMAbwi/xTNsZ2XYgulosk1Sv6/nJ4CtWLHAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733520362; c=relaxed/simple;
	bh=XozRvPqqiHeG9PpK+KAt8BvlC4+3PPnRXff6x442qkA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HKX1gdAbr6rsljSGOonBcKN94q9KBO+ceWRnj3NXbqLLX/+aIHyCAuO8P/72F9oOpcJyahPBcBXXWScPcbTJ2YyOj1dCPvex2Qs6EIRjL6URni7TcILt89bhab3HBtf20igoXkA1IedJqjVhvQK6xknfARQqy1JsP2/sNPjXmak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R0Xsj1vj; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-385dece873cso1256967f8f.0
        for <linux-media@vger.kernel.org>; Fri, 06 Dec 2024 13:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733520358; x=1734125158; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fY5PGKfinw0bTTrofkyjWmSLNTzsh9f6hZ66ZvW8/Rw=;
        b=R0Xsj1vjQDh/J7ZFE9ReRAD6mPkf/aMC5AhbaxH1E1V7cKw+9guxvFdTcUhuqFUsvY
         vJZ3J14zYxJtnyizJQ8ce0rXJM3CBE5UlIMFFtKfKgc4jCIhufYWO/UiifsvyG0OQUBb
         21VkqvkrPKzttYEqZyUdwShnPyxHuPh6SPZz32k3pA0A+A0n5ZYZ1ETbwgz8NxqiGcHF
         8QAeTlILznQyBTAkN/5ToizB4q4eIDE+t9q0bxcsBo/Z43ypeF1mqc8zI5xTcskZ8h4L
         Cn/7G+Ee6z6F4mDkzcVtQPpq03wxaTOKh81Wrhnh0LnCHHny7GrsJmPrCz/pZvOKk4Qu
         NpoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733520358; x=1734125158;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fY5PGKfinw0bTTrofkyjWmSLNTzsh9f6hZ66ZvW8/Rw=;
        b=abNV9sli4NvYTfm7t6T8CN5QA5ysiiRMz1NXUeSvItF8N4VM0dEhtqkSQCT73oaTJz
         VMyzGCv505AIyN0CyFg+otx0cnAYOo73LjBU5SstwyX7ZU4SDPUwTIOE5TiFq2GS902V
         3X8oFYm0tNedrsLioIUreSvXBPIiPcLGMOhtTTSYQsKvVALClWcQfuz39IGLleM99/Xh
         02h7sl6XkVE2nibfek/8m2MyvwHhrO3CZprQJu5lrt6Za0tvBc9dA9/anxJPBUaZFUDG
         qjpf/GBIBLrLlxa4WcIYVUW0Fm709OWimhjXpT7pk37YvUc/YS6+4jckVWd2E/VgETmZ
         7IVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvVPPWLxp1YRXn5J0WtYuR0NUXDqXlr5UhDckXcQXW5JX5bJH0ldXhJd0vntUbvl9hlw/4e++jo2br8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWuVx3aMZ73kJPQTgkrmoYogbc1w7CURUkLhJ4ImYipBpINCKv
	vQ2XmJkZ78mMNSWRjeDmAe6qhIgYKHPEQrqwS7fzVX3eetmon8sJ9m4InlBi98w=
X-Gm-Gg: ASbGncvSZlbji7sDdG+DIKW9dJ28LBaOxgs0J3FPrSkTEybJULEMQBHhxYPDCon387D
	5g6s+E91qgx1E0F0aaxrs3xHcNvXafvzK43KLXZHRSw4PyGZwDemU4mYc/r88tC6L0LXAeAlU4d
	Oekv4pHe/6rB5AMua6QTSVx42QI2COQu/WTYYqm1jEA+vi8DNNJQlR0rgb+zCY/Qwz8EqXEXpLV
	ECPsRLpnEAA+IJb/hBcdIycTbDEMfyYTrqgE7SNE27O2BpwZktxKCmUQj4hZYU=
X-Google-Smtp-Source: AGHT+IFCuNytTJqW2Q/06hLBEwztlzuz4/nMye2kjnSGSBSbzlnpZShoPe5MRNOfbMcnO8GBE+1lBA==
X-Received: by 2002:a05:6000:1ac8:b0:385:fc32:1ec3 with SMTP id ffacd0b85a97d-3862b36b015mr3629269f8f.20.1733520358248;
        Fri, 06 Dec 2024 13:25:58 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3861fc51451sm5521521f8f.47.2024.12.06.13.25.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 13:25:57 -0800 (PST)
Message-ID: <e9812ebc-c96b-44ba-8fad-e64eab19ccb6@linaro.org>
Date: Fri, 6 Dec 2024 21:25:56 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] media: dt-bindings: qcom-venus: Deprecate
 video-decoder and video-encoder where applicable
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: quic_renjiang@quicinc.com, quic_vnagar@quicinc.com,
 konradybcio@kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20241128-media-staging-24-11-25-rb3-hw-compat-string-v4-0-fd062b399374@linaro.org>
 <20241128-media-staging-24-11-25-rb3-hw-compat-string-v4-3-fd062b399374@linaro.org>
 <a2285d28-0f57-d165-a22e-2aa57b3cff65@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <a2285d28-0f57-d165-a22e-2aa57b3cff65@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/12/2024 10:03, Dikshita Agarwal wrote:
> On 11/28/2024 9:51 PM, Bryan O'Donoghue wrote:
>> For the list of yaml files here the video-decoder and video-encoder nodes
>> provide nothing more than configuration input for the driver. These entries
>> do not in fact impart hardware specific data and should be deprecated.
>>
>> Reviewed-by: Krzysztof Kozlowski<krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Bryan O'Donoghue<bryan.odonoghue@linaro.org>
>> ---
>>   .../devicetree/bindings/media/qcom,msm8916-venus.yaml        | 12 ++----------
>>   .../devicetree/bindings/media/qcom,sc7180-venus.yaml         | 12 ++----------
>>   .../devicetree/bindings/media/qcom,sc7280-venus.yaml         | 12 ++----------
>>   .../devicetree/bindings/media/qcom,sdm845-venus-v2.yaml      | 12 ++----------
>>   .../devicetree/bindings/media/qcom,sm8250-venus.yaml         | 12 ++----------
>>   5 files changed, 10 insertions(+), 50 deletions(-)
>>
> A general query, this change is not done for 8996-venus, sdm660-venus and
> sdm845-venus, was that intentional? may be because these are not active
> SOCs in upstream?

No per the cover letter, those SoCs have power-domains and clocks inside 
of them, so the dtsi entries actually does relate to a hardware 
description in that case.

---
bod



