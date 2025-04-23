Return-Path: <linux-media+bounces-30886-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE369A99B78
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 00:22:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BBA01B84F97
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 22:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A532D1F9A8B;
	Wed, 23 Apr 2025 22:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mX4dTlbp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A59C14F9F7
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 22:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745446967; cv=none; b=nS7LnNz12368zOUxw0YthB2Z7tAqoHDZFdyuKfeqFlyHrsP+vLAAr7bu1OYhWbEhUT0O6XY/YwZwtT7cAU2P99wmkvTQDuoeCRUjMnlvJWVr4eZamRrxDqVbC20bbD9AD04moymzZbN/rJFfFZ/YOQzadLWwu8tscgyGaWwSnGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745446967; c=relaxed/simple;
	bh=f8rmn8x0+XiyVCnOHeO4qzpNjcf63Wjvbg0U+J0oM0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q/Al2+3P6prX2B3qs2Mr9El3cxTozHBDkvC/EuQjNK7mex97kTxrAm3NULznAwCiDtaBLeT0dasJQcnaq9NbFHTy12iuT4rGRFo+ni7EH3j4pGk6QlCJJQpwUmnAtXAYLviAb1GpBNVysOTbJqyuez+k2dKlK1ZpzDhY+sqhwJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mX4dTlbp; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so11809585e9.1
        for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 15:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745446964; x=1746051764; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xTp47s3WR8jXpXuKbLchqgYAkI9mdRH62NADe5YGQAI=;
        b=mX4dTlbpno5hMdD2MJ5pkbt5R8HTUKicQeyoi9RZbRJw4G06mT81sLD2qcYJoxPpqS
         Mdz74RcAw0DYB/DGnHXEgt6kR3Wc6BmBNMQrRBAYhmKTlSvZZDfDzzPjvzzFPH+0liJ+
         KbZs6Gk+/mVGtXVkBx3nppBkfsH7yE7S++Kc3AwaGe+Uvm9xJt/lL9K6RO59NF1F/963
         id4Pr/EKyX6pO92/Rm9SQnmjNTJ+FImV9FalG+RhIOg3pEbtWFewUVkCqXFIyXRUY3Oz
         y8qVOje9173NI6uCOaR8k1uqyD5q1RHp7YmkTpn35yuYxGDPSHpC0dwK+NKFPcNvw4oi
         xA3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745446964; x=1746051764;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xTp47s3WR8jXpXuKbLchqgYAkI9mdRH62NADe5YGQAI=;
        b=iXR2YtkDVB4sRzge/vxh7L/z6W8bEoGG+wibyxmS7JWtUwasb6wRb15mw8M0uUroN9
         f2wJFwBO86spiNz1Zy5Q2b6TOnXSENcY1Y0I78AG9AE5/bdA+cPz4zI24Vy+jNm9jCKR
         yrbLvyILPH4bvAwYET90V4xCTr/VPly/YHms5UMUrDZjrXMWABsZHyv/wBrQ61sdDui3
         oJvmR0296xLO2UQJhYj60Rn5XE0VKGtCTKDJTljoxj8QpYotLqyY+p3S66cyeFd/9ebB
         XYo2VSH9YJ6roNg8IjCSxj+yd8RXt1mLxRnT7+JpO2DxBJMruTkyRfphFIE1X0iFHU3N
         /OqA==
X-Forwarded-Encrypted: i=1; AJvYcCVf4udjuBOIeCjuzdIR3GgeBVdAwhpjbBmoK2roh9e26zjg8pTHnOQ+OgK5M0vdsHIHuKL/8QUcytNrjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSybvmFwT/Ny+aJ4d1FfH1YO68rE8Mtmgm9Ir0PhfViNdibR50
	0UpRgar6NED14SddOpXU7guc0abCkeTf34V8o9QdPTcazyaRqBeca+sZyDP/pLE=
X-Gm-Gg: ASbGnctFy2zKdas9iuxHRNgmEei+4NImkVusMfud+rdTEXPmqkqbrQl2joJYA7BmQgj
	EHLSye4eDyo9MZlKCKIWaajXurydE/wTgVe8EjoOsJpfuAAIBVjOF1gMqDXIOt0FSRq4LGVDbGw
	mKYh9UvPT1CsuZ0R4YOJQ34dkvh7FBQdMWoKZ72HqOeKQ2l8U6kQhXRql3l5QTExeqeHvBlu9ir
	oQiO4m5D6kDpkBxNnof0Ylx3FEimw70KNbpsT6XM376aQN18O6hN+/fVqANzfFHOy3I9zVTBmrP
	B2DxkNI9VXH2hRl3EOsSN6whKLAdyFttx45o+AVuPPK9seSQd8IYzpt50EfLCuf7Vi7wPF8rsc4
	WeCXtE/8kssRnDk50
X-Google-Smtp-Source: AGHT+IFnXuOk9MgklNNThUU3rPWX1hvW7UN1+EWzXnzv4MbCmpVehJitPAXKPYi2MAqK0eYnKXo7Cw==
X-Received: by 2002:a5d:47cc:0:b0:39f:bf3:6f21 with SMTP id ffacd0b85a97d-3a06d64cab2mr29229f8f.11.1745446963654;
        Wed, 23 Apr 2025 15:22:43 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409c29b55bsm1325515e9.6.2025.04.23.15.22.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 15:22:42 -0700 (PDT)
Message-ID: <54824271-7b67-49e7-a27e-61b8a993e901@linaro.org>
Date: Wed, 23 Apr 2025 23:22:41 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sm8650: Add CAMSS block
 definition
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250423221954.1926453-1-vladimir.zapolskiy@linaro.org>
 <20250423221954.1926453-3-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250423221954.1926453-3-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/04/2025 23:19, Vladimir Zapolskiy wrote:
> Add SM8650 CAMSS device tree node to the platform dtsi file,
> it contains of
> * 6 x CSIPHY
> * 3 x CSID
> * 2 x CSID Lite
> * 3 x IFE
> * 2 x IFE Lite
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 189 +++++++++++++++++++++++++++
>   1 file changed, 189 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index c2937f721794..b24ab52413f6 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -5065,6 +5065,195 @@ cci2_i2c1: i2c-bus@1 {
>   			};
>   		};
>   
> +		camss: isp@acb8000 {
> +			compatible = "qcom,sm8650-camss";
> +			reg = <0 0x0acb8000 0 0x1000>,
> +			      <0 0x0acba000 0 0x1000>,
> +			      <0 0x0acbc000 0 0x1000>,
> +			      <0 0x0accb000 0 0x1000>,
> +			      <0 0x0acd0000 0 0x1000>,
> +			      <0 0x0acb6000 0 0x1000>,
> +			      <0 0x0ace4000 0 0x2000>,
> +			      <0 0x0ace6000 0 0x2000>,
> +			      <0 0x0ace8000 0 0x2000>,
> +			      <0 0x0acea000 0 0x2000>,
> +			      <0 0x0acec000 0 0x2000>,
> +			      <0 0x0acee000 0 0x2000>,
> +			      <0 0x0ac62000 0 0xf000>,
> +			      <0 0x0ac71000 0 0xf000>,
> +			      <0 0x0ac80000 0 0xf000>,
> +			      <0 0x0accc000 0 0x2000>,
> +			      <0 0x0acd1000 0 0x2000>;
> +			reg-names = "csid0",
> +				    "csid1",
> +				    "csid2",
> +				    "csid_lite0",
> +				    "csid_lite1",
> +				    "csid_wrapper",
> +				    "csiphy0",
> +				    "csiphy1",
> +				    "csiphy2",
> +				    "csiphy3",
> +				    "csiphy4",
> +				    "csiphy5",
> +				    "vfe0",
> +				    "vfe1",
> +				    "vfe2",
> +				    "vfe_lite0",
> +				    "vfe_lite1";

Could you please include csiphytpgX for whatever number of TPGs 8650 has.

Otherwise looks good.

---
bod

