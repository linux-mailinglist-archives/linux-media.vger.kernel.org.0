Return-Path: <linux-media+bounces-45820-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF99C14878
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 13:08:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1470E1A685F7
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 12:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 110CA32ABC6;
	Tue, 28 Oct 2025 12:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K2i9Sqhv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546A232A3FB
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 12:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761653295; cv=none; b=CyWaWUg4gPEwMznGqn7W2C8nn6PKUwFGOi21JEUAmzC0YMOG/S1jnjp/ClYa4gMR2sKv8z8IPaB4kOvyw/JuBovA30hxsbrEgpGSKTCbaNLbmRW0iURXHTvTrDX7MEiebCnEtGPV2xhMWLh263KOEq/RdF5yJBnEogIH/tM9BpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761653295; c=relaxed/simple;
	bh=FFZIhW7dPQduoS7KNYpmAufTpW86vs1zECIWDOcIxOM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b/O7dAKKmrB/n795yudPx4p4zzqmOqL5y00uM7el3v/cEabInQq4UjgJWchHf4cjXlA9LgIgNleqyI8FmRQSsAZg2c7pX6RkcRjWCICuWUOpB1GEkcygdT8VX3DjuQI+ahJhReJR2OtrqjoIFq1Og4F2irQh+DPnNZAcT+5JU/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K2i9Sqhv; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-475c9881821so36321445e9.0
        for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 05:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761653291; x=1762258091; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OjjiZbIUuyLAf493CLwJMzPeawzS5Hi7KDfcQ8XqHPU=;
        b=K2i9SqhvhcTFN5t8WVdPFenAzKDJnwsKubl9rZC8x3Htax5UES0T2I6SAZjZy2k4yo
         O4G9ltAZ3OB/iV92UmlooAkR14Fj3hmqb87CAR05EO2Wb3SmOh38eHCy7rqE3YpIzany
         H+sGzx7SITrsa+PpzgXqFnSwb0g+7YYkQhtqDKvWrBdvRbl9FTt23CcdxOxpWuEZWrIl
         ySzV/OzpKWLiaEjkklTX0TIhV9U6CNVK81+yvhMxxSJCKKt3T3QlcgHuPjUjwPjiWM+B
         P0sLoRg39JShhSg0CcnljL4qtJOXUZnVpOV+Fu8vWKOUvTYfdnbGkK5lS3TuZI1aA0Jn
         7anQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761653291; x=1762258091;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OjjiZbIUuyLAf493CLwJMzPeawzS5Hi7KDfcQ8XqHPU=;
        b=B5gPIdkAU8yB4ktBl8Hyk6qNSC2VjHhvXrmHO1uyTtR2VMfnN5/OnqMFN2gHokFgiI
         pafeN04NDDB6LDOvx2vJB9JgQ+Ur8w+X/YMEGoY40ruhhxQCLQRh4dE9fD+XdT56PXUL
         VvrCuRtiRCGEGZYr/mftrIMpCYYw0woKhJ57Nl4CjvYyHygKHGfMFAiOTXlMFALanlSw
         nTtD0sk/O0s90BwoDDOf46Y8X707Rt1pEvTJBbO1mHFGZMZ/bbvYc6tPtV9VtpUIwGA4
         hfG7DE9zo5grxk70BS4WePi+Foa02oc0AfHE7qUbmlfvvG9Y5um1dXQa/u4WIh0OdguI
         +wCQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9DaRlDXtvQ5H47Dyi25yafyyXe6iFdOSypOV35efQ22/4po7PBSlH1QllEPHvvQ7eigwGaGf7vldedQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTQ8/HlvpyBq2czZwz3zHloLywTGMjEpA5CtyLXvFfuUK00/kI
	g1uUd8qS2/ZJ4MQsHL5z1tr0w3oM92MaUb2F26VQbC/xZIv/Q6tSua1XrTnwollO1I8=
X-Gm-Gg: ASbGnctXsaDwPadqC5YQOJAD1ms3j+6sFTZX5Bxs2lV7MYnSz77V39hlHNNQtfdb4fa
	DLqppnY+VxKmwL6lELU8gXwl/9Sb95XSuvciFShB+XbiQ8YE82Jm6BXYoOLrllOwqjFW1b6mQ0I
	dTTgdSgivsGPMZ6UaYAtYD6TeWho9kxWwhytnXNhSAcRFiOHfvWGC6B6vkg/7ZUj1fG8QF8UWhZ
	l3OAAHItxkr2kqTAwa2I0U4XLYg4dqhUx5A3Gny3LMHlFnwNNLjzMj846F1lXdkQ8CwSRd0ZFSH
	DbFky0P/wXaxP0b21Atni1MyU9ojz6bJtCquwavUvwAY5/6BDVbfeUheeOIEUtkH1SCfH0Mwi3W
	Uva4xKlgQuzLliy5nE/kA8TZLgzdzUWPvQ+daqs3dFdbw3hGUmvk95Yjy6H5+6iIjQZ/cz+PRKs
	Cgpv3x9XYFO5wbOvZGFNqBMNyTN0B+JWNptTT+hAhk8A==
X-Google-Smtp-Source: AGHT+IGFpjPN8Cn5YgLMJOAQI6Ro/JGJGzDgKuY2HvqITluVdL/i2A10CTxri2/CVAdNVkSLxXekrg==
X-Received: by 2002:a05:600c:a08b:b0:477:c68:b4da with SMTP id 5b1f17b1804b1-47718176e5amr27234325e9.20.1761653291379;
        Tue, 28 Oct 2025 05:08:11 -0700 (PDT)
Received: from [192.168.0.21] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd4a36easm193604505e9.10.2025.10.28.05.08.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 05:08:10 -0700 (PDT)
Message-ID: <aaa361f7-6ada-4347-8bc6-3820cfc9feb4@linaro.org>
Date: Tue, 28 Oct 2025 12:08:09 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: media: camss: Add qcom,sm6350-camss
To: Luca Weiss <luca.weiss@fairphone.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251024-sm6350-camss-v1-0-63d626638add@fairphone.com>
 <20251024-sm6350-camss-v1-1-63d626638add@fairphone.com>
 <20251028-defiant-visionary-rottweiler-f97cda@kuoka>
 <DDTUHFIN3IEK.3FY5IS9S73ASO@fairphone.com>
 <0bf4ab2e-9846-4f8b-ad72-e9db6fb7d08e@kernel.org>
 <DDTVUXIIQQUS.2UUJ9BS4JCZ0V@fairphone.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <DDTVUXIIQQUS.2UUJ9BS4JCZ0V@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/10/2025 10:28, Luca Weiss wrote:
>> So that's vdda-pll-supply
> Just noticed, this S5A regulator is the MX power-domain, so we cannot
> add it as vdda-pll-supply.
> 
>  From what I can see, so far no other camss bindings take in an rpmhpd
> power domain, and given it's not referenced in downstream kernel, it
> doesn't look like it's necessary to control it, from camss.
> 
> Maybe it should be added to camcc though? Still not quite sure how
> downstream vdd_class should translate to upstream...
> 
> Thanks for helping with the other points, those are clear.
> 
> Regards
> Luca

Standard practice here is for MX and MMXC in newer parts. MX certain 
pertains to the clock-controller in this case.

---
bod

