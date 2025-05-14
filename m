Return-Path: <linux-media+bounces-32436-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C979AB6259
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 07:29:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13238169B41
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 05:29:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A57171E480;
	Wed, 14 May 2025 05:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TpwJv5xR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBEF1F03C0
	for <linux-media@vger.kernel.org>; Wed, 14 May 2025 05:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747200539; cv=none; b=coMvY1b9LV7yp8s6qp05AG8lIjUL4ofrl0DhMiXGxpQq7oD4b53Hy7j2fmN0QimHqcqDgaxib3O0aPLED4Z0NrQQnt/JOOWHRw3xMRYoX6U0V1kuMTwMsNs2mcT6p7hDTAWRE8zDMcrkyRtBWWR4Cy6q2TyR0aZPtO/WOGBnX+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747200539; c=relaxed/simple;
	bh=5dTwjDqUGC71o92UrTZQlZyU+5wMlvQZNqYAOZynkT4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O1y5LRANaoAgQZVe4bJ8l3Ne6AnKRZNQqXXszgsh6cADNFArXx5I8cULhtVttRJsDI3VfrjvedZaFDGJmuW/An0imgItNM16TM//pPB6QO4FKmwRNsEFzxv7L7nKLfcE1xW/MqLdtOA9gldzMkc+gFBvLEkpIvI1SfZlsXSGBgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TpwJv5xR; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-442f5b3c710so642365e9.1
        for <linux-media@vger.kernel.org>; Tue, 13 May 2025 22:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747200535; x=1747805335; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nmEU5NrY0WO7E3ww65s2y0b0wKsXCEAa4aBHaeCuKV4=;
        b=TpwJv5xRrFdE281NAmtGg71gLpjkMOJScZz0UndpQiYQQoMgtol4h15g8DIIfyj+Km
         RQx03bYO2KNoRqakOpwSvYtY6mRKw61uJQCZDhvawAZzafUWoJqYhXHs+iKGOuw5iSlD
         8gZCGcl5ne09ay4/NfPIZK3VyK2E93ALlJylb8awh8OHXQlHU9R5rPPuS8aUJHHNJ5yF
         L97a5uFPCZWiKAcDHegMPiHKMIrWEWZBPXfvUEnBLZI9IvYjr++3bzvW6+DNSHBRbWL/
         Abjq6+/STJqRFfE6ov+byFjQeTLtxt6lHkgtEWKAUJbWoHxHyT6pwlm8yqqyAUppqjUn
         +SDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747200535; x=1747805335;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nmEU5NrY0WO7E3ww65s2y0b0wKsXCEAa4aBHaeCuKV4=;
        b=YCq2/FHiwXBCOM3x4Jwvd0g1VVEsDkjZxzMjp/pAeTXBp3tlA72Ctvf6sKrG78gAx9
         UOxwvVpik7B7JW/35UxzL0HP87+B1vIwLFh8ytyUb1kRdGzA6tWHPkYO3INOs9RGUSZB
         lAeLIFBm1PwvvHg9l907j4O4BWZqhjisl5w6z/RI+YnCSEklax4c7n8aq79TZASQKZQM
         W5J97KYFdKM/1pKIKqA+JPWt+tm/wg3ppE6BjYub3jp6+jdldJfNtT/lnzoXP9D3xJcB
         9Wuc07MD7pfuAWRFbpacx+BNXuOhr9GaMUlFIMw+0rc7t15qdwTczxw9b2vOU8hcMqtt
         tdLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeLe8Cg50er18xlHtr8NhgzTN2hH5jXoa+LaB9mHSjPMFXcPNFxKCTkadN1SyBCrvCKNTI+9YaTQrxbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBlasRxn0iwSz121ha533ercUvcWtq3xpQM/PURJEqBXLcEigT
	agXQzazuEhQLmyAgWZa3fiv4ibAlOoniiG2RRUAabQtWcccJaqel0jPVzC25fcM=
X-Gm-Gg: ASbGncvFlABzbMLXc0aEjT4B+ic37S/NLdtUejvYLNkzdiYt2ezzpHJP15PgdAeFjfN
	Rq4LkeDqdQZzUctxsve6DVZsNis7T7Ba5o7j855cbd+imfVmLPTD3iN8BJ9Bs+jkvw1Qq88K0x8
	daWRoDw4yNSvkWIx9zn93W342UjPIatW+5wvwiL57C0SRhqW7Xqx/fY2RXWm09VcgYr8aKKXvji
	YODCqT3crKFQuIUXX2dGg/TH8o+1Wwv0qkWtx9xcxOXnD46ztIx3wl7aQmMzWTvZgqtHL24mvRH
	oNFncBuizX6BDr9o0m4dzdzyGgMZyLxgLrSlPGjeLjLqwvpzyHrgp1RdffAjH30t3nswyvN4J+6
	GHynA9wb2RYSO9RYObLtqmM8=
X-Google-Smtp-Source: AGHT+IEGAcfwKJBoQWtEXI0dUeoF2qoiKr1YbPO1n5TUPTbwmsk0AI4hKrFkPAFUSxZdY24ZnvFA2w==
X-Received: by 2002:a05:6000:1786:b0:3a0:b4a7:6e56 with SMTP id ffacd0b85a97d-3a3499512d4mr1435912f8f.56.1747200535475;
        Tue, 13 May 2025 22:28:55 -0700 (PDT)
Received: from [10.61.1.70] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c583sm18144903f8f.84.2025.05.13.22.28.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 22:28:55 -0700 (PDT)
Message-ID: <684be594-85e2-49ee-8b9b-cf0b6d444cf5@linaro.org>
Date: Wed, 14 May 2025 06:28:53 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: media: Add sa8775p cci dt binding
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
 <20250514-rb8_camera-v1-2-bf4a39e304e9@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250514-rb8_camera-v1-2-bf4a39e304e9@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/05/2025 03:40, Wenmeng Liu wrote:
> Add sa8775p cci i2c support in dt-binding documentation.
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---
>   Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index 73144473b9b24e574bfc6bd7d8908f2f3895e087..117e9db86d0e1b3cf7c5366860fb56e8e72a4059 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -25,6 +25,7 @@ properties:
>   
>         - items:
>             - enum:
> +              - qcom,sa8775p-cci
>                 - qcom,sc7280-cci
>                 - qcom,sc8280xp-cci
>                 - qcom,sdm670-cci
> @@ -184,6 +185,7 @@ allOf:
>           compatible:
>             contains:
>               enum:
> +              - qcom,sa8775p-cci
>                 - qcom,sc7280-cci
>                 - qcom,sm8250-cci
>                 - qcom,sm8450-cci
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

