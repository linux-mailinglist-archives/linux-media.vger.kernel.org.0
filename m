Return-Path: <linux-media+bounces-30536-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74351A935F1
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 12:23:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9763046837B
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 10:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 146082741C0;
	Fri, 18 Apr 2025 10:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zkmtQaSk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65322202C42
	for <linux-media@vger.kernel.org>; Fri, 18 Apr 2025 10:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744971778; cv=none; b=VoumHuUl55sWIzp5yQIvG9wLwZ7DL2tkYCbYlWWJfTZaKFk8/Av4WaFa7+i/9bp2JFMvC+/TryUEmxI0jxrK7bWUAPE0J80WO4hryqLcEGXVFtdrhXocROCSRptd361EFk+n3W/+DFM6uksAb2+vw+HwLlJ/CVzu1yt1dC9i4rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744971778; c=relaxed/simple;
	bh=kdcZo7k40rdzUo4iOEDODFuxSFIAmXugWOJxYj68wOQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oDkgNZVbP14I1+wmKzdd6RFn4aYSRG5dDmvKht2O3n0tlI/2D8OSpbc6vqQnbd76LNHk/yeo4ewDFMDCvKeasbdFtKklM+9oiKUZAksN0oRyOrhKHbsI4x1yeiJBpm6FAjsjAWbAmVey7/fQhUWdx0LZGCWbQ/aFUV4MRRCToek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zkmtQaSk; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso11425755e9.0
        for <linux-media@vger.kernel.org>; Fri, 18 Apr 2025 03:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744971774; x=1745576574; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/k0Y0aoMA2GBez0xVc7/5fQuBfWbJDDhwqoAabodniI=;
        b=zkmtQaSkONnWKoe3Lk3IQcZtBDYyiiVoOV0AACyTUGAL5BMnfEbe0ybHqE/XHBPVH9
         OWqPC+xC1oHeDEw4UzLkG1Ziulenj9Udyyp34ps0/cAJDZSXpHt20Mmco3R1Dz9la1Hy
         rr7XabZEvJ76dXvifA7Vx1nm1ePcYXRmRVjRG1uNve/K2cGWsL8xXSIg18uypEIWmKsJ
         QPtzfKv3PYdAwkPleWUnUfyU5cU+z+ezaWTQWfC3r0O84RF+xRRFdolK9DzQISRCWvXa
         FNIJ2bucZA0fSFP1m04CBwKOZGbin/pIRSsxAGTz9KXuVAvFV2GamJm8rz59P48F6wGj
         WhgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744971774; x=1745576574;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/k0Y0aoMA2GBez0xVc7/5fQuBfWbJDDhwqoAabodniI=;
        b=TwS66wZcBPJQ1g9hgdDeo+X3JYELJ0vT1wJ2Lcr3DU3wuTCxNm0oUoqUBsB5N9uwWu
         eXJFMmuC0TDPzPRAN+HLHalVmB2FSdCgogUeRVBL588KFamGd1P0T8FGQPJ2HUUL+fUu
         FrXYtTAy8NrZ3D4KCkGbS2V+C5t4mHW/bdqYUgozBjf4P6Vp7ci/X/Vngu7jvQNZ1e3r
         uJzC7Rx7QKhN1r2+K893D5vLyOZ/Y4px4KqujLGTBLLKYx+FvoPRLDqMt6BaOM2HHZdg
         7iU5ThVaK8VE70+I8kQTbXUiY+sQW1ypJMVb2AvM3UVWNULokcBXmH9Sl5nolgN4i2+V
         1x4w==
X-Gm-Message-State: AOJu0YyL1ZA7Q64W4Sbzp2MZ4KGHm6mhSJryor0YYnKDSFHHMWHV60bk
	uaBZSQWfxDU5Ve0Avbw36O+48bWljKB/oFb+VS1iMv8rrPkdDbV1C2zZZGeQsDQ=
X-Gm-Gg: ASbGncslrQcpYJ+Kd9eIiElUZUpMv/39NlaZ+PoxChHNSL7NzLKMPuzqN0eG+FdEV6X
	Rkf/a0sdhFkCYSKh+rzS0U5kk6CVzphVKV2wFAfoN6daC75N62DmY4xohuOG1UH6GsiMWr3urjP
	hJ6vgNMDqaw49s4s9UmKkOl1hngM/ApFjE58ApeF7Hc26hkmWCUTFITB9BxjxPpL34n8rFUfDV+
	wlh4QpOGzj2T6U3SSaKHf9SOlwS1LmUHFhOjCoge4CQpisOoiQWJk4VMNvXcVu6HSzUP9lfpuqe
	Kup41moc2i0sfny1hivLJmeoCvShrtA2JqjFM94lBmnWpQw8AtM1fHpknE7rZxHSHs2exEoV4G+
	mqXZHxg==
X-Google-Smtp-Source: AGHT+IEV+ngZedvb1G9GddVsd006y6aowAa3golTbSy0UL6/dPU7ikOlFtQiwJbx/8C4Y2tbwGajLA==
X-Received: by 2002:a05:600c:43d4:b0:440:67d4:ec70 with SMTP id 5b1f17b1804b1-44069732095mr22695595e9.8.1744971773715;
        Fri, 18 Apr 2025 03:22:53 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4a4c8fsm2264681f8f.89.2025.04.18.03.22.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 03:22:53 -0700 (PDT)
Message-ID: <a6689177-0f82-4b1e-b1c5-c50751d0f0bf@linaro.org>
Date: Fri, 18 Apr 2025 11:22:52 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: media: qcom,sm8550-iris: document
 QCS8300 IRIS accelerator
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250418-qcs8300_iris-v2-0-1e01385b90e9@quicinc.com>
 <20250418-qcs8300_iris-v2-1-1e01385b90e9@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250418-qcs8300_iris-v2-1-1e01385b90e9@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/04/2025 07:28, Vikash Garodia wrote:
> Document the IRIS video decoder and encoder accelerator found in the

Document the IRIS video "encoder/decoder" or "transcoder"


> QCS8300 platform. QCS8300 is a downscaled version of SM8550, thereby

is a down-scaled version of the SM8550.

QCS8300 has a fewer capabilities compared to SM8550.

Note: It might be nice to give a brief overview of what the differences 
are since you mention them or instead of making it a diff of 8550 just 
to state what the QCS8300 can do.

> have different(lower) capabilities when compared to SM8550.
> 
> This patch depends on patch 20250225-topic-sm8x50-iris-v10-a219b8a8b477
> 
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>   Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> index f567f84bd60d439b151bb1407855ba73582c3b83..3dee25e99204169c6c80f7db4bad62775aaa59b5 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> @@ -24,6 +24,7 @@ properties:
>         - enum:
>             - qcom,sm8550-iris
>             - qcom,sm8650-iris
> +          - qcom,qcs8300-iris
>   
>     power-domains:
>       maxItems: 4
> 
Otherwise looks good an applies, please update your commit long and add:

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

