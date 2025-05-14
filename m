Return-Path: <linux-media+bounces-32435-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A20AB6253
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 07:28:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 821F018919A7
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 05:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1AD03EA98;
	Wed, 14 May 2025 05:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dVihJdk+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652DE1DE3A9
	for <linux-media@vger.kernel.org>; Wed, 14 May 2025 05:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747200509; cv=none; b=kqunlFs65oS2nV5n+txuQKObgh/8+6No2VNFsbVQqRZHl71PJA9s7VYT7wdc7JcmyZcawCuvcDGP9UB5RlUQzkOz09tynqjZj7als22js6XKKwO7m/ylV4G4uYKfG45KC615HIJRU7cYj6RgIvT9bWAtbiD6Mq6fmU+zSb2MIT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747200509; c=relaxed/simple;
	bh=JkeFk5JvtELodwEn2MQCcvDJk93HA88o+taJ9J75Wvc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W1ipJ6uJpc08fFV1tmIvXmi6m9kB0qnLbk/AnWjXjSvGxCun1JesSEZH+GuxUPsolTgvhK5jtL+0zPZHeN64lLNAQtI3rIaWALzeYKVh4yIXVnomVHrrow4idhgdgkSj9ngzMNWl3pZ6QZDIkIjErqrcHy12Gkn27x1z616J9Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dVihJdk+; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so65880825e9.1
        for <linux-media@vger.kernel.org>; Tue, 13 May 2025 22:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747200506; x=1747805306; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fu+kToH5ynZZEiBVPI1+qje7yD+2OfrJbW9noNa4CNg=;
        b=dVihJdk+ifDgF3QyP8rRJJzBytMIYTapriOYoM6ZnyTuWmSF9CQhG4Y58jNjQKeI7f
         XvjQ3XBLfV3pq2TG9L7oFn91xIfnX5ijcey5ajzes8LcebC0CPRlziYwkdp+E2Ya7P2U
         OivLsOZeUx6v+eTBFXLwSIaZwi1gU/AjeKeqc6k87HbEnID4mlPTdGvpg874bzXh1XXP
         npceKV8lSYqFWgdu0afboQMPVWMfoFOwN02kNhOKp+kifGZWOsPMFWDHJkdC5uXaFLAQ
         RAlNBR1BOF3Q/2bSLJIZda0z7LqT3SkqFqwiYt4lE4ROWzDyNpYP25K5hgUby7suEnti
         jaDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747200506; x=1747805306;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fu+kToH5ynZZEiBVPI1+qje7yD+2OfrJbW9noNa4CNg=;
        b=p+5dDqj+TGOh0nvQelJXfNsClzY3g1911xdVPfFHhVI8COD4cy094t1svi1RidwBFL
         8oex2CobFPQrInwz4Yk7mMSAJWl2PIZeN1ejrhNyB+jQF7WsUM5hYbD3i3E9MKUK3OB4
         sLk8m6Vnkm+mboMm7CHK7cnI2LawsoGXIc/l2LtuqknLqrX33OTrZWsoVD7kzoLXMxOr
         cvaKwnc5wYSMTSa/RSjdVV0ZaKDBmlCQIW4phGgy8QYoLcbe7285q7dvlfahO/4lnoi2
         1I+ce2b6A0hyFaEejpADV/9lAeVTexgIGpK+6xkYUZ8zny6hiSB2FrkOGz+VF1EzvS4N
         o0kg==
X-Forwarded-Encrypted: i=1; AJvYcCXFMAl173N+CZvk/vtRQrhvGYUXv9sVHqT+Ogvd/QI+Vq6xbawwD3jEYKg7vTnwlP5lGRd1ZasYRARJSA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1X+pl5ksOeKza4FKmzxtTEVIMd5KdODoypcSrqrJIw3c61ghC
	HjKrO5EN3gAz8Te0ZX5rM4DnuIK7v1VkyNNImUPs1OIF8H/YlL1UyOmkawDxLwo=
X-Gm-Gg: ASbGncuKSWPXUs1fP3uTvagyfi47V8i3DeLAQdYfRsmOD3Gwy6r0Akd6/1LxHSwFoaA
	Jb5FeGQul4DvwyhokGzUnq+PluGDFM4gHsFdWJh0JK5MFrc0G8R/YWS1sGI/5taKSUhVtUX7Z3v
	nrTzMneyHogT948rc14f6nFWmB+rSxNMG00oQewrlbc0zL0MqB4+SBg4nCJNfrn9fIDjTLuYu+H
	bNqDWmQuNS/nEReOwwzaiNG/4fuR29q3kSolCbtk635UZ3lEfeD8O0/et//FCRwGtBeGtuTAbJB
	RkMlR9ZYrA35qObJTzEmMdF1VbPJIWnpbzogOT/dD3+owsBC3IJN8IcK1rnD639xPQhzd/thyQn
	t5NHuFHRjKUaS
X-Google-Smtp-Source: AGHT+IGR8fcXwr8UrIba7uq3uRKgiVAoO7flrB6Ax66vVZKivN1s8Mt+EFttdNMqYIyUx78KHccYtQ==
X-Received: by 2002:a05:6000:381:b0:3a2:229:2a4d with SMTP id ffacd0b85a97d-3a3496a49fdmr1286717f8f.22.1747200505555;
        Tue, 13 May 2025 22:28:25 -0700 (PDT)
Received: from [10.61.1.70] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2d2e9sm18279823f8f.75.2025.05.13.22.28.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 22:28:25 -0700 (PDT)
Message-ID: <017682c3-76c6-47fc-81f2-1da2a22a9d34@linaro.org>
Date: Wed, 14 May 2025 06:28:22 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: media: camss: Add supplies for
 qcom,sa8775p-camss binding
To: Wenmeng Liu <quic_wenmliu@quicinc.com>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vikram Sharma <quic_vikramsa@quicinc.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Andi Shyti <andi.shyti@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org
References: <20250514-rb8_camera-v1-0-bf4a39e304e9@quicinc.com>
 <20250514-rb8_camera-v1-1-bf4a39e304e9@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250514-rb8_camera-v1-1-bf4a39e304e9@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/05/2025 03:40, Wenmeng Liu wrote:
> Add supplies bindings for qcom,sa8775p-camss.
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---
>   .../devicetree/bindings/media/qcom,sa8775p-camss.yaml       | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> index 083e1193c474265edb445dd30717360de57ff986..aba46c0bc11faa062199f563602494bd2f62367c 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> @@ -125,6 +125,14 @@ properties:
>       items:
>         - const: top
>   
> +  vdda-phy-supply:
> +    description:
> +      Phandle to a regulator supply to PHY core block.
> +
> +  vdda-pll-supply:
> +    description:
> +      Phandle to 1.8V regulator supply to PHY refclk pll block.
> +
>     ports:
>       $ref: /schemas/graph.yaml#/properties/ports
>   
> @@ -164,6 +172,8 @@ required:
>     - iommus
>     - power-domains
>     - power-domain-names
> +  - vdda-phy-supply
> +  - vdda-pll-supply
>   
>   additionalProperties: false
>   
> @@ -343,6 +353,9 @@ examples:
>               power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
>               power-domain-names = "top";
>   
> +            vdda-phy-supply = <&vreg_l4a_0p88>;
> +            vdda-pll-supply = <&vreg_l1c_1p2>;
> +
>               ports {
>                   #address-cells = <1>;
>                   #size-cells = <0>;
> 

You can drop this from your next submission.

We are fixing the PHY schema to give a 1:1 relationship between PHYs and 
their associated rails.

---
bod

