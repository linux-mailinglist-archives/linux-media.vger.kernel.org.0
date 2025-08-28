Return-Path: <linux-media+bounces-41256-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F9DB3A188
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 16:25:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62D4C1886C86
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 14:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D0D5221FA0;
	Thu, 28 Aug 2025 14:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lqlIZZOH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D579E219A79
	for <linux-media@vger.kernel.org>; Thu, 28 Aug 2025 14:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756391084; cv=none; b=fdWxX/3oxkgF5/KepNVSZsr/YhkvSV6qCYaXZxQP+S+r8G57rc9WoDLJq6uUaoWeRfS/2Gvh5d/Y1WNSiwuSd+Yj/Himpp0g0X9ao7ezLfPR/pO3tBKP1pNxsKUuHeQCcgVEBJ18lmdfgdxjUjLdYCfz/Twmp6Qx3fgLgi0e2zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756391084; c=relaxed/simple;
	bh=/FUZ3GPbSoHCMLnSSqyt2z+YmIiFI7VibbClJvvxduQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=QdBA8EPRgFMGizzsYCp4kI180kUyZMMpi8gkf5f2LBNQ1IrFlAOzd7P4lWCSZWO61zMHNGyr5k6YXavyzO2XUETzzxvTk/X8OALK1Z7/svo4SFqMATOduFOOMNBgnYKJMF6sNYfYkF2qrUFytzP6Nal6p5HKsC5WfT2GDoPbvf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lqlIZZOH; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-afead3cf280so128857366b.1
        for <linux-media@vger.kernel.org>; Thu, 28 Aug 2025 07:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756391081; x=1756995881; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8zQUneuXaOfUh+xTN94Xip4u0CuKfuimGc68GwyO7co=;
        b=lqlIZZOHTZZ4xnW5Jelr/XU2Km2WfJUvHfQi0emQxM1RN8qSYHX5ZJSsMLfCqfDnwf
         UOMod4sjvwZpd81O/N2etmRRYaOpLPDP1SSMj2g3y82T5ufgvFnDpO7Q53z8DuKtvHI4
         h0o2CGP+gQvZGFUgDG4JI5OEjGKt8knAARZ+NDXoIVQO1vFFb3H122Wx1o5VACwITD8y
         txfvi2kbwdHxwJo2trD2ImvIK+G/2zkmzYfnvsJihtTkjtDT7l7Cc2tda7TcGzvh8TAv
         TZXzzl+bRqR67i3SWJt/pbYx+4eLAMC02yPWqXuAjOs0yC1tfkGOajbCHoYP1EOAYU+/
         RNjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756391081; x=1756995881;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8zQUneuXaOfUh+xTN94Xip4u0CuKfuimGc68GwyO7co=;
        b=FAEnBhnTJkfajq9mNTqv2fXs4vN8KcJsUupbRqvOkkd/TI7jyFqCBzpUY/Way/JpkL
         0m0b7dHUZtjSOLXth32Qh4E5KfNmmz6+n5E0VPbCk817l/0PLfmNXSCkS9Pm91/ybEQT
         kNviuWSmdLRkAohKsn99TIfEJaPQwrCEWi0Qa2O2eNqVVg2Y+ekuQmBImLo3x8/zVqq5
         760IDAxfOzGlDI7MyqBuo14XLFbgNLFKbatKge6N3m4tG1oECFmLgZmAlEMq2ZHRDCyE
         ON2ZJ1Ehbl+QVJ5S7wXeDSK7wPFC9ekzQ5my4bTJOs3oMoSMG+WvlqocQtkF89AVXafq
         FUqA==
X-Forwarded-Encrypted: i=1; AJvYcCWaQJsin6L/4tBbDwKkT+W2no31pCpv7GLk4bVEPCVIr/ijvxldraOFCsd8Z77mFDl0aevF9+hWFL0wig==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+O+qhGAIGjerj+PRZA6ycYKpcwLfBUPF+GyCc826AdMHkVORq
	TAFPKje3yA7S2TBxMULxPbG4DLTaciJ9IY4lLMFnl+u4WguHMesFZLkKHZUn9xMED58=
X-Gm-Gg: ASbGnctxoGih9/fBbCCkWTPEQflyvzK6OZY8RkkDezEnI5dHQrkzdzU9RI7fArfXiYb
	k9FNzVxoRPszUJEdqoKGAQzDvQtZHiZjTk8HzgQ9BoCLNcB+BVQ0EvxZyYYpAOyn88/y+YeJGaw
	mWc5M5uYVhHe3d/75nkku3/8GGGQCqvbGroKjFRzbdOiw96dmMS8wJZepzwOI3+hDwhvMpE5X/I
	yaZ4AVyTxu5mTvHKDFynpT8trhlRhSWZ/D7tvCBm+VM0g9uWBTYFORs6g1bEp32+MN80aEc3GKb
	xg28XRKXO4cemLgI8JzghwmmqbrU68OfWzT8J+U2J3eqWOjADWtMQZmCFkVtGWeV2FRwVJaJFhf
	N76mc1nNbQseVLfofcCYlmrKqilSSo0ANGDcZ1s+hmVS+wj8QXCgVwfMbQOdO7SZQbU8JXTfcbv
	CFKw==
X-Google-Smtp-Source: AGHT+IF1vN7HT36zey49ZEbRrWO4fa06Ex/wR33zWhhQXlp86FpsFXiY/mB0hsHLpGg2OthL7HWsng==
X-Received: by 2002:a17:906:478f:b0:af9:8d61:2651 with SMTP id a640c23a62f3a-afe28ec535emr1937046766b.9.1756391081186;
        Thu, 28 Aug 2025 07:24:41 -0700 (PDT)
Received: from [10.41.150.230] ([77.241.232.9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afef7489f8asm44327966b.69.2025.08.28.07.24.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 07:24:40 -0700 (PDT)
Message-ID: <a9c40b7d-d70d-48fb-b4a0-deb773969936@linaro.org>
Date: Thu, 28 Aug 2025 16:24:39 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: dt-bindings: qcom,sm8550-iris: Do not reference
 legacy venus properties
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250823155349.22344-2-krzysztof.kozlowski@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250823155349.22344-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/08/2025 17:53, Krzysztof Kozlowski wrote:
> The Qualcomm SoC Iris video codec is an evolution of previous Venus and
> it comes with its own Iris Linux drivers.  These new drivers were
> accepted under condition they actually improve state of afairs, instead
> of duplicating old, legacy solutions.
> 
> Unfortunately binding still references common parts of Venus without
> actual need and benefit.  For example Iris does not use fake
> "video-firmware" device node (fake because there is no actual device
> underlying it and it was added only to work around some Linux issues
> with IOMMU mappings).
> 
> Stop referencing venus-common schema in the new Qualcomm Iris bindings
> and move all necessary properties, except unused "video-firmware" (no
> driver usage, no DTS).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../devicetree/bindings/media/qcom,sm8550-iris.yaml | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> index c79bf2101812..320227f437a1 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> @@ -26,6 +26,9 @@ properties:
>             - qcom,sm8550-iris
>             - qcom,sm8650-iris
>   
> +  reg:
> +    maxItems: 1
> +
>     power-domains:
>       maxItems: 4
>   
> @@ -45,6 +48,12 @@ properties:
>         - const: core
>         - const: vcodec0_core
>   
> +  firmware-name:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
>     interconnects:
>       maxItems: 2
>   
> @@ -69,6 +78,9 @@ properties:
>   
>     dma-coherent: true
>   
> +  memory-region:
> +    maxItems: 1
> +
>     operating-points-v2: true
>   
>     opp-table:
> @@ -85,7 +97,6 @@ required:
>     - dma-coherent
>   
>   allOf:
> -  - $ref: qcom,venus-common.yaml#
>     - if:
>         properties:
>           compatible:
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>

