Return-Path: <linux-media+bounces-48741-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 461B9CBB517
	for <lists+linux-media@lfdr.de>; Sun, 14 Dec 2025 01:05:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8F5430109A3
	for <lists+linux-media@lfdr.de>; Sun, 14 Dec 2025 00:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85F091758B;
	Sun, 14 Dec 2025 00:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iNoA/bek"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002153B8D4C
	for <linux-media@vger.kernel.org>; Sun, 14 Dec 2025 00:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765670698; cv=none; b=ZBPP7qIjmPpZuuCeVnNS/VVSNAxiDemyF0eUiZevAmfECfTlPgKLT2NMXJjK1XKqTj5ArFuCv3gSUZ/aGofCb+ywgHXcufKtauU9Bhy7jEMK5sXAiBqbbFCIZT2BYisTM+SMn5OyEI8J3lHVkB5Iy+IiXhTkKwCe9mbaWfeHHpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765670698; c=relaxed/simple;
	bh=+zQAz+Rb/94sTj+jzifGC0Wl/VBMTW3fTEGmfxduBUk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ECoO7FD8wfkpT5skG/QQscDJ+8u57FRhoHjbhjziQznFRVXBFKG1Z1XDMaKkU/eOzzsd5GYFXdUd+LGsWde313pKN3jh8wQGlzx9JRD1LEiw3jr1YQ/S0qrmu3Px257vhhdy3kkpi0+MJmioL0kYIPmefLayEseUMkf2GgR1gk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iNoA/bek; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-37fcd0704d5so2570761fa.0
        for <linux-media@vger.kernel.org>; Sat, 13 Dec 2025 16:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765670695; x=1766275495; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5BgboonVbxKrO9X8kRKN4BUW9psx0IkF2ipu6x5mfes=;
        b=iNoA/bekPHTxP1q3Nr2OzNojY8sy6H/d8k9YHmSPWix9gHriFGPYgqcX23fodFeet1
         OgIpuxYVeYK/hzPB6YQyyDCOJrMAQZqgwp1YvLu/43oq4+oe1ABoBMWzrLfh2b7/Kww6
         rOsiw9yETELqkwFxZfk2PCw63/W4ciQNm9HO5ckuLLz6CSc/iNyOG8+HVK+2gbZB2U3Y
         ORxlAn+cjwaDRICR/8cI7neCFXdXEqlv7PTFjiwNczwqAJVkJBkS7AsgbrCXZNx3fUrK
         7SfXVedYW2/KctJKCc5MO1T8+N+z/79T4IGVcznJ3dzYhupRzqoMJ/zX7HjXlv+B9oc3
         HpaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765670695; x=1766275495;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5BgboonVbxKrO9X8kRKN4BUW9psx0IkF2ipu6x5mfes=;
        b=hLYpvc0DrsoiBJ3y5nkdRIZLxUPL9WMVcw4q/v6YnU/DBpCBVI86l0iDIgCFQy15NL
         G7hE0BWwrQ5yvunJnxm5mqFl7hgvnLOrJi9I8NOniOwQvG/4l1ZwQdmpLKwFGHKjm+kX
         scyqVS7HtiBIZAIlad5GLEpCrSfJbbmN5UPLfz5+IA2QVt8V0VgBF8vQOzKIZto8Oh8c
         7BSPUQ0sb9WLVMu6eHvVRe2PKMj01f/qezXS8vX7/ZH0wmuKVTOXSxOsK4o7nydklj2W
         6aHm7D4jA+AUf59FxNiCs9BEI0D4VVwFnSGR4AVM0s+9lgeTN11LKaCtyK2Zs/5t4gaE
         t/0g==
X-Gm-Message-State: AOJu0YxDn7Q2t3Sek2SUDLcg9F5LyZH6pZAHSWUu7eJMluuUbKkiFKPI
	xWldH3K/t72AWc5yMaJ51ytJsdkLZKsCM1nr8og2kV83ulBWMl15MVTDj3t/6+Fr7+g=
X-Gm-Gg: AY/fxX5CMeZ+/xZi+p9JEDzWjCg/YI9erPOb9eAJHLF1Ueuzh0hScXY4ApKnHxx6a9Q
	Yeo/hG57IkU97Xsi7FfuJ1Gd8ioasyIekhdhh9pd/9VFHHksO7TvGB7GxUj7j4WRFTYVReXH/3L
	NFdqUB60blyH7RZD/OZOAMSFRzG6WYy2LNjpiJegpd3XfHnYXpMZRf0FIi8+nO6gLNAGHpOyJHv
	ZpqROivK8ujySHkCCYdxTByJ63E28IQX/2m+RhWzxhrLmHU3VSzdjrW6ioiHwWkZZShMmnYENF+
	+xRz0A4geaCqgbn7BA4xhvjnM0sqKRtrIwWe77BRI2kO7S5heQxCWeo244XloKDPt1zcqL/0yvl
	5XY5ZgdXiBvTdKEhGbcQ2BRqLHlie2t7+1fsgsxU7eY5gzgdvVYL48XutBs3pryZlFc5larHzsw
	9j7B3pCHXOiKOPeHHnBHACfuhJlRsa9MvjfuTBeTrZUSVy+F5brwF6r1nlYoHA0VXkyYskMEqXo
	4zV
X-Google-Smtp-Source: AGHT+IG0gHywQrxKrfUQzEHRspDDk2UVqLJp4GZHTOJ02LFhlHAWCfdGIvRgbfMc4gVJJKA+2cbEpg==
X-Received: by 2002:a05:6512:b98:b0:594:93b8:88a0 with SMTP id 2adb3069b0e04-598faa8dc1fmr1251168e87.6.1765670694934;
        Sat, 13 Dec 2025 16:04:54 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-598f3195e52sm3425805e87.84.2025.12.13.16.04.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Dec 2025 16:04:53 -0800 (PST)
Message-ID: <1e09a93a-d42f-4a23-b346-9f158a60d8aa@linaro.org>
Date: Sun, 14 Dec 2025 02:04:43 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: dt-bindings: Correct camss VDDA PLL supply
 description
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vikram Sharma <quic_vikramsa@quicinc.com>,
 Kapatrala Syed <akapatra@quicinc.com>,
 Hariram Purushothaman <hariramp@quicinc.com>,
 Richard Acayan <mailingradian@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20251212-docs-camss-fixes-v1-1-5c011505ff59@ixit.cz>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251212-docs-camss-fixes-v1-1-5c011505ff59@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/13/25 00:55, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Usually, the supply is around 1.2 V, not 1.8 V. Rather remove mention of
> voltage from the description.
> 
> Fixes: 849139d46d09 ("media: dt-bindings: media: camss: Fixup vdda regulator descriptions sdm845")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> Added only Fixes tag for the initial commit, not all the copy-paste
> propagated ones.

Generally it should be possible to specify a list of Fixes: tags.

However, despite the change is the proper one, there is an opinion that Fixes
tags are not applicable to dt bindings with a given reason that only executed
code can be fixed. So you may be asked to remove even a single Fixes tag.

>   Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml  | 2 +-
>   Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml   | 2 +-
>   Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml | 2 +-
>   Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml   | 2 +-
>   Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml   | 2 +-
>   Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml   | 2 +-
>   6 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> index 019caa2b09c32..9009cfe993d75 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> @@ -130,7 +130,7 @@ properties:
>   
>     vdda-pll-supply:
>       description:
> -      Phandle to 1.8V regulator supply to PHY refclk pll block.
> +      Phandle to regulator supply to PHY refclk pll block.
>   
>     ports:
>       $ref: /schemas/graph.yaml#/properties/ports
> diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
> index ee35e3bc97ffd..cb922f90fe900 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
> @@ -129,7 +129,7 @@ properties:
>   
>     vdda-pll-supply:
>       description:
> -      Phandle to 1.8V regulator supply to PHY refclk pll block.
> +      Phandle to regulator supply to PHY refclk pll block.
>   
>     ports:
>       $ref: /schemas/graph.yaml#/properties/ports
> diff --git a/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
> index c99fe4106eee9..2231d7216f62a 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
> @@ -268,7 +268,7 @@ properties:
>   
>     vdda-pll-supply:
>       description:
> -      Phandle to 1.8V regulator supply to PHY refclk pll block.
> +      Phandle to regulator supply to PHY refclk pll block.
>   
>   required:
>     - clock-names
> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> index 35c40fe223767..8e6ca94c88695 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> @@ -95,7 +95,7 @@ properties:
>   
>     vdda-pll-supply:
>       description:
> -      Phandle to 1.8V regulator supply to PHY refclk pll block.
> +      Phandle to regulator supply to PHY refclk pll block.
>   
>     ports:
>       $ref: /schemas/graph.yaml#/properties/ports
> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
> index 82bf4689d3300..d50e096b900db 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
> @@ -211,7 +211,7 @@ properties:
>   
>     vdda-pll-supply:
>       description:
> -      Phandle to 1.8V regulator supply to PHY refclk pll block.
> +      Phandle to regulator supply to PHY refclk pll block.
>   
>   required:
>     - clock-names
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> index ebf68ff4ab961..ccd2d024bfd10 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> @@ -300,7 +300,7 @@ properties:
>   
>     vdda-pll-supply:
>       description:
> -      Phandle to 1.8V regulator supply to PHY refclk pll block.
> +      Phandle to regulator supply to PHY refclk pll block.
>   
>   required:
>     - clock-names
> 

As for the change itself it is good, I'd prefer to get a correction
to 1.2V in the documentation rather than a complete removal though.

In any case,

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

