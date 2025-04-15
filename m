Return-Path: <linux-media+bounces-30266-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F31A8A0D6
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 16:20:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4A2857A6689
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 14:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 227E61C4A0A;
	Tue, 15 Apr 2025 14:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vutmKMv/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF6827B4EB
	for <linux-media@vger.kernel.org>; Tue, 15 Apr 2025 14:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744726807; cv=none; b=goNsz7MSx+hOcZVjb/1XY8l8PMl8w0D7rbnaWIX6bNwr5nPq6OKjuz/mZK6O8LYfBnKme6bTUDROMXYanAt4EjImiUiqxRAmp6+EcweYGnSARFaV1KzYuBpZNofCiUb98kvMJQgeZOVe5/Oj1zCJ3XwSC/8smhqMBRzQhF+2pmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744726807; c=relaxed/simple;
	bh=groN+RJqDV7k5FDV8ZPREj37G2iBdyik12AU8kIACEs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q3u5kup3/0NEFeYbgksGstUDG2504/jOXKBMa4uUqNMvk7qGAKXVoHQE3ssmQo807DWYQbtLPLwVWb7pTH7PoGiH3tvvtMjt1OnZCFTkT3CBUstKc0J9X6GlRBuGHIKjohem/MSlLv28psYzrOR3IdhYoJN89UnAlPtoHZ7bOyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vutmKMv/; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso59199345e9.0
        for <linux-media@vger.kernel.org>; Tue, 15 Apr 2025 07:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744726804; x=1745331604; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tXKjxnMoQUwfTbUXCqJlzEVhnVQGRvKpp9LSwIPdUJ0=;
        b=vutmKMv/QAIsAq9xhXtF6atnAkRBhbemdkZGDXWC9prxLB5MOrssp58haY004eqF96
         L9mRoNWBDfK1CLZwcUV9UP5YpMuhuFZzAB4oLeo3XLj707Lbdg4MThldIcw1ATzBp9Ux
         sETakoq0U8T9edOGsyzvbFp/X/WFnDixOpiO7IFxXt8Q6qd3Hqq7v0JJuAgFGaz8q1EI
         qmJMxp9WeelgOhroO35o2bMeFwa6rjevv6+yq4GHc0hHQVYFu7I5pCBFseeNrsk227b1
         eGu72M68T/+v8ez4c+qRADEeb0AHEZjLoXWpFCX3Y1jy0ZMZAmvIDQS/Vihcyz3vkhog
         fuaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744726804; x=1745331604;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tXKjxnMoQUwfTbUXCqJlzEVhnVQGRvKpp9LSwIPdUJ0=;
        b=TL5130dU0ysKYcIBAub5OfuXCv+lZBMcmuKvj127ai+zBVp5ulz/B0X/cpacvnVLOi
         yr45gMiCYR6ahX40bV6IUDh7BjzgfE2lBX5X/j7k18b2XrCazCywtPx9VONNMwTtHd6J
         9a+v+gredkM/pZyHaHQ/cdIybGlCfU4egg2cyub5/fbu6KL67swWflVNcdPBgyE8kp3+
         AM35bCjqNYociJlpVS7DKOe7Yb6NEeBztz6xoYtHV6IXeWCunjLds9oHC81EsyCLxtaW
         6g38B45dpYETvDR5HjjGiigO4ZMRSg1vEDjAoXJVNUj2kFkZxpXbC1Hbr9pfBhNm69Be
         5VFw==
X-Gm-Message-State: AOJu0Yxuy9RtPHVVba+V8X4MXWZEpYxtOMeIxDN4KpTBoVO1n7tX5MpF
	3wQdtkVaNU3t6fiWRWDscPesYXny8yZLl57R1gTUkYfHycNzXmPZhXhPyBwz5PM=
X-Gm-Gg: ASbGncsNnXfPuiqaHJJAy2hVN13VQIWVFVCH7NySHfY38cM2+Zr2oSxTaSB1VR56gXR
	k3YZwgkwTZXLOLSk8B6o+4Q3J733W6Cy5uh5n0yD15mkXhLO3mtl9/aTFQXs5+jyaBDmle9WrKp
	tOlobrWOjp1Kbqnc9RY86FfQoeoek6qX5iRMUKezIBtFcI+7Hc6Xa13yH5/zl1qkVXXFpyVhIXt
	bvL/0bt6HynVNfYcakotIilsWUusYpN70fzvFT1+r1pjgNnKSarVs4QbZNTEtmpWwYwOM+KdCKC
	OFqHAQ98xxkUr4uYaUcm7i89x+AtddhSIz1Iukc3h21HYwZ3LO7q0nxEEExWP7kECDqz00NxhWL
	OAmRYLA==
X-Google-Smtp-Source: AGHT+IFHuCjBCol6ieY1BDDq4pk5yi7yjbY/hlWuVW8OtROYN0kmZ0rTHkOXvlF+zTukhd9HS/iXXw==
X-Received: by 2002:a05:600c:4f10:b0:43d:878c:7c40 with SMTP id 5b1f17b1804b1-43f3a94c657mr195976435e9.10.1744726803832;
        Tue, 15 Apr 2025 07:20:03 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf44577dsm14436191f8f.94.2025.04.15.07.20.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 07:20:03 -0700 (PDT)
Message-ID: <d5107ddd-284e-4239-a251-f6ee16bc873d@linaro.org>
Date: Tue, 15 Apr 2025 15:20:02 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/7] media: platform: qcom/iris: rename platform_sm8550
 to platform_gen2
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250415-topic-sm8x50-iris-v10-v6-0-8ad319094055@linaro.org>
 <20250415-topic-sm8x50-iris-v10-v6-6-8ad319094055@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250415-topic-sm8x50-iris-v10-v6-6-8ad319094055@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/04/2025 14:47, Neil Armstrong wrote:
> In order to prepare for supporting the SM8650 SoC, move the
> iris_platform_sm8550.c file into iris_platform_gen2.c that will
> contain all the common HFI GEN2x structures.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/media/platform/qcom/iris/Makefile                               | 2 +-
>   .../platform/qcom/iris/{iris_platform_sm8550.c => iris_platform_gen2.c} | 0
>   2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> index 473aaf655448180ade917e642289677fc1277f99..e86d00ee6f15dda8bae2f25f726feb0d427b7684 100644
> --- a/drivers/media/platform/qcom/iris/Makefile
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -10,7 +10,7 @@ qcom-iris-objs += \
>                iris_hfi_gen2_packet.o \
>                iris_hfi_gen2_response.o \
>                iris_hfi_queue.o \
> -             iris_platform_sm8550.o \
> +             iris_platform_gen2.o \
>                iris_power.o \
>                iris_probe.o \
>                iris_resources.o \
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> similarity index 100%
> rename from drivers/media/platform/qcom/iris/iris_platform_sm8550.c
> rename to drivers/media/platform/qcom/iris/iris_platform_gen2.c
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

