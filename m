Return-Path: <linux-media+bounces-39981-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDC0B27EAD
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 12:49:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CD7EAC5095
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 10:45:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E54F2FFDCE;
	Fri, 15 Aug 2025 10:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nyECjAGZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2312FDC34
	for <linux-media@vger.kernel.org>; Fri, 15 Aug 2025 10:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755254682; cv=none; b=d3j5pPxK5JV7nXx7n4i5zmqzaz/dZW63BsaO930LsCDYYdt8gjL2Emh59lYBrYB/hUUOg+ozzPXDDC17RSS8AIcd67YAHjbpWShjMLzw7ixrh6/nwjWA5NSQ/4rSN2Fvg9mhGnrUmlDR77YYFF8g7Ynx0Yrd5RoSiVRNR3uvjmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755254682; c=relaxed/simple;
	bh=8LA+2kJNuPIw2fJF/HLy1WPGQ4k/QzgOM/5kdp6JFgo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JV+rFwdSfnBNVDtzQla17Lwy9qTpVq+D7GYUtPu4d22WzIPQb2u8O52XI7lPRc5zLH+BV0VQMudQKkSRo3rB1sldqMT9ckZoA2Nidlv3F1vsEKcoohdP4XBb19cyCHM0MeOzWbFtHzOz99PeA5+vcZ8ku47Qf2sOy6YpZzdLKs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nyECjAGZ; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b916fda762so1369869f8f.0
        for <linux-media@vger.kernel.org>; Fri, 15 Aug 2025 03:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755254678; x=1755859478; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9VXN7dyuqMDF593piqzOKDuFJ2+OEcBzrRSpDmpGS7k=;
        b=nyECjAGZCoVzy/0AtH4YgMEvaxuJO8Zc4U/+dRSM6fRvVrTO5mByLq3BECjG1/3jmD
         P8I/OtI5JjlQlvjz/gk6OzXP1wavt74YzBA+/gVlUrl+QnenkZpyWOB2Hj+yGckb0IJV
         MV8HpfbN3gRpIRUU4SnSxinVNq3kdnyJTrYOjlOZXHjPa5x/IL26oRKnAv7hRi6OSbg4
         DHRHftdfVRZIeg69irsGzY7x2E0LqS1aUQzVEa28o8WF34XgtdGSKp7SOs1QQ+EIyz42
         rzACdYyhOfM+G8XjvWd7eU/Vpl95SDoG9QnMhGPW/irzSg6vnYj/rpa4cucCPnePxwGi
         09uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755254678; x=1755859478;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9VXN7dyuqMDF593piqzOKDuFJ2+OEcBzrRSpDmpGS7k=;
        b=JMFvL5CI+ly64kPh0uXqRizMfgxTYK78qaGK/q/xAC68CFKcMwDICcAXGwVPaToOFG
         R48XrRtfDl+SJNbC6a/6qgecgJphTlz8HIiKOaUps04mZPiwKN+nTq42PZfMD6/vDWvp
         ONo1/X1zrmtCuswz1a+bAt02+/5zyhx8FZtin7MAVGX8No5IxoG9Jwfpp/5sYQwKx1v5
         0kt4zFnQbXh7OVy43RyWGgbJEHiTaWBw8XEU7N6Az9A35rR/gOAHr2G1r5XDEofgB0N6
         jqb7PEX/xMR710P3o0AsLFnTertXODV/7QUPTzHH3L9x2L7+6eqz7GADi+bnJlXR+9CA
         G9hw==
X-Forwarded-Encrypted: i=1; AJvYcCXhQIWvnnbvOrWGThU4OgAOikVT179FzdTTJPkoXYsoCDRsjRgqhaN0JDGG4QN+H6yJq8knTVtSE1Y2XQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvUglYGkMytRV9PMnfmQ/bTpUeni+YXyBqtvuwe3uP1NVwX4Dr
	jkvormOBpVJ+99j/0H/hOIANpNM887ZVA6veIX2h40y74HSApZyRN2yAcuy1986gmaA=
X-Gm-Gg: ASbGnctl40fxuJRuG6VBGKZFbJ2n1Cy5eg3wpy/PSB1g0ZU97ptsCJriOOtAJGKeCVw
	uS9UBTw+wXirRYgRMzJiBdp2df5Ua3r8auXNyiRi8N+1ekdsEA39eLO28bZVi3IzhFKllDiyulj
	TufyegMSgqanW/cjA+I2tLuihIFcd8h31ZGN4FGNDxOXr3712ZsfUWqnwwUBI/vHQUHmc19SdMS
	PR29m45oF4TNP2Xm97apUWyfNYh8t1AAW1dj0dKimi1reBLhbT7tgh6oEJDXqGWdp79MuW6Ef1s
	KjtWJZCzPQhx7ozVG9GDj4za+1qQVfd4E/DxMqRR0owFxAI9z+7Wh5ViyRocDLmNoLSFPqmQ8pl
	lUfJ25vykT1QboB1UvU64u8bBZv741bw5wDZfTV4Ax8qZloJj/AKRFB60vlWB+zk=
X-Google-Smtp-Source: AGHT+IG800cLWLqatWasBLVAd1JmHq64uktJOwC1nVkGq12rIf4uwmr3k1nR0sv0K30TYAXp61UV2Q==
X-Received: by 2002:a5d:5f8e:0:b0:3ba:cfe3:ad98 with SMTP id ffacd0b85a97d-3bb4a1f88ccmr1707195f8f.4.1755254678411;
        Fri, 15 Aug 2025 03:44:38 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb676c9b27sm1443907f8f.44.2025.08.15.03.44.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Aug 2025 03:44:37 -0700 (PDT)
Message-ID: <75df9709-5778-4a71-bb55-1151c6c657dd@linaro.org>
Date: Fri, 15 Aug 2025 11:44:35 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: i2c: qcom-cci: Document sa8775p
 compatible
To: Wenmeng Liu <quic_wenmliu@quicinc.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, vladimir.zapolskiy@linaro.org,
 todor.too@gmail.com
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20250815-rb8_camera-v2-0-6806242913ed@quicinc.com>
 <20250815-rb8_camera-v2-1-6806242913ed@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250815-rb8_camera-v2-1-6806242913ed@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/08/2025 08:07, Wenmeng Liu wrote:
> Add the sa8775p CCI device string compatible.
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---
>   Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index 73144473b9b24e574bfc6bd7d8908f2f3895e087..54441a638da2b7feb44741264810d7a0de319858 100644
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
> @@ -223,6 +224,7 @@ allOf:
>           compatible:
>             contains:
>               enum:
> +              - qcom,sa8775p-cci
>                 - qcom,sm8550-cci
>                 - qcom,sm8650-cci
>                 - qcom,x1e80100-cci
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

