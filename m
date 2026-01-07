Return-Path: <linux-media+bounces-50084-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D2340CFBF7F
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 05:32:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3963304F110
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 04:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D396E22A4EE;
	Wed,  7 Jan 2026 04:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q0NDdT+7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A67239E60
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 04:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767760040; cv=none; b=tsMyx8jdxJd9OMqBzekPbDlZL0yHaSgxvkA5x4H25ypN9pvfLH9ws5DPof76KtHofAUEGTGlF5mJ9wMcKp0ykPeOrHCsnjClGFun/fwz/WRDM+fza1al5UoUwZ6DkUdYz8ZWD+zXzU8r8PK5yG1Qa6wIow8uVtwFM2rTJhd6Bnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767760040; c=relaxed/simple;
	bh=piSehSDmE1J5QYtNOJHnlef8sfhUD2kJbIeqpKVVcKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lza0yY+u/Sf05PWXWvfgx738HTWWFS76UHUwtgdyszPGwWnGSP0mo4v9emjbaY8tr3xhkcN0u0UQ1yAANMoUTL+qLo9c3KX3MQ/7XDqupqRcYJACWZlCP3jKUtV8ZdSuxnXsLaf573rUg0YsPqZC2jhpmPqAzySp/ulaSfdOKd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q0NDdT+7; arc=none smtp.client-ip=209.85.208.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f195.google.com with SMTP id 38308e7fff4ca-3825130008dso2331851fa.2
        for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 20:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767760036; x=1768364836; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D/GmMP8nrQC1hfCtu8mHAhdt4VRVlDbgu8rN0Ly8gUA=;
        b=Q0NDdT+7cZ9+Mqh1QZHn1x8vH7H8jAxSTmY+MSFFNuCYIvNuSmEgFqVp3GeTnB5MSj
         lL53itWk63ZZUq28LXrhkGzBzQZ7nJxvBC1E7NlDM7ZDBJTArIZw5kFnkT3ZhMQ+0YPs
         2Pp6vIqeayXLUSd0SGtmYYAtpBLTbpnON1JINzMqG48S04MizCkHlZ0M/ogKjLsyjxWr
         ur6GCMrkooULonTLA+JS7MFcKOkc16YK+6FIEyolim9kNF+vrjqNjrMZDd+i9KMH5BzX
         6ueC1CfX4XwHZcfiP67S2SfH37MHEaTuzNfI1yqQYBst3p8zLatuQg8GnVdQ6/nLog1h
         DS6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767760036; x=1768364836;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D/GmMP8nrQC1hfCtu8mHAhdt4VRVlDbgu8rN0Ly8gUA=;
        b=q2hSbsjhinTjLu4/Uk7rlm1f7kcQhEdk2ufb2PR9gh0bA1kLGcdX3XQpmbexGHKGUM
         vim546PYgsiCEyJiiOEsquVYKYWNwf/Ki5/LWarWiSRWC3nyH8py5cs/h+hKSNJbGrNc
         foE81ICdGkHHz42zAnvgjZT44WAaQB/awee0VR8398PZvYDY9kg6a3ybl9m0nj2xmXoC
         dmUX4g7PgU3UCUm8Jwq2sYUShdYbV/gJCola4F/7dAfGsG7FhpKzuxIKVLXoeVrsdr0u
         xz9Pr1ePAhqCCk5rw/BZVf5ll0ULJDWh0rQ0rXzmsBW2+viC5dqyOuzJZlRPrqfUoFRU
         0uMA==
X-Forwarded-Encrypted: i=1; AJvYcCUpArfCcurDwut3WNmMQXIHUTyMHomknSLy9bS2uZz2VFtwEhYgTUUgFvk8XiMb/acsyAK0nyiySzP2GQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc1ANsNzVmd2KdhpjWMJIoPJR9aZ3eVFk27ndVGq19ThMIBbOV
	UhaEMP95zdk2oYDe5RpYJ4Vv2dpzz14enRrgyOGWPt/O7mNM+ZxVP6aKBPTA3RsZRW8=
X-Gm-Gg: AY/fxX5cw4VaCphgIyEFYnQcVBG3KfrASmyVD//8lk1WURjSMkeFFiAYIZ9Q8FrwIzR
	vvARAbbH6TreIy7uX/B/+PAA9E3DV69YRWbXCAhpOe57bHiOGTqnb4Zyb1iGKZVQzLTwqv58yKK
	j2busP+1eL+Ghk3aVWPfL+F2zymsLVyqYAMjucfW1huKvcvt2MVrVB+lUcRinISbMlR7obhQCIu
	90mq9tFyWyspVGXde1cRNAvXyQsuMpon7bKsbN6joTtyJ9ok3OQ3JdrcQi7ZuRWBtHrfvCOB9qT
	WnjVYEW/fyeRSZynJgsx3HVdV047r36wkeyIv5lPtanuRCNslPeZFFsjqAhu/qV+gM+OkW0FoUF
	2PDw4M4uDGJojhJjeYy6gI8v7mQlJBcYNOJ/uFTDDz824D1oteUOhd8CbKWAZE2LhA1EQ992AUe
	fsTNhgma6HhdsuEetRlXNZsGuK7oX0KvzM0NbdytQ9YOVNlJBCgKaGFaZ0qUG5uwFEDA==
X-Google-Smtp-Source: AGHT+IEGzLXnBc24vjmCmiFUscHl2WnDfpA2MZDZ1qBws5ysoDEqtjI0ZpUgvn6eyNtW2hRKVd9R5w==
X-Received: by 2002:a05:6512:3d86:b0:594:2a33:ac17 with SMTP id 2adb3069b0e04-59b6ef08358mr224542e87.2.1767760035577;
        Tue, 06 Jan 2026 20:27:15 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b71b7eaacsm83852e87.40.2026.01.06.20.27.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 20:27:15 -0800 (PST)
Message-ID: <cc8f93b6-0fc8-42f1-bda5-fae20d576673@linaro.org>
Date: Wed, 7 Jan 2026 06:27:13 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: i2c: qcom-cci: Document sm6150
 compatible
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com>
 <20260106-sm6150_evk-v2-1-bb112cb83d74@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260106-sm6150_evk-v2-1-bb112cb83d74@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/6/26 11:39, Wenmeng Liu wrote:
> Add the sm6150 CCI device string compatible.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>   .../devicetree/bindings/i2c/qcom,i2c-cci.yaml          | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index a3fe1eea6aece9685674feaa5ec53765c1ce23d8..cb5e6fd5b2ad1de79a9b29d54869d093c952d778 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -33,6 +33,7 @@ properties:
>                 - qcom,sc8280xp-cci
>                 - qcom,sdm670-cci
>                 - qcom,sdm845-cci
> +              - qcom,sm6150-cci
>                 - qcom,sm6350-cci
>                 - qcom,sm8250-cci
>                 - qcom,sm8450-cci
> @@ -263,6 +264,23 @@ allOf:
>               - const: cpas_ahb
>               - const: cci
>   
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sm6150-cci
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3
> +          maxItems: 3
> +        clock-names:
> +          items:
> +            - const: soc_ahb
> +            - const: cpas_ahb
> +            - const: cci
> +
>   additionalProperties: false
>   
>   examples:
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

