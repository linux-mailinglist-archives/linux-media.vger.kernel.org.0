Return-Path: <linux-media+bounces-49363-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04520CD69DE
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 16:50:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EEC253021E7A
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 15:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D1F732E72F;
	Mon, 22 Dec 2025 15:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PYZsnfHh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9765432BF4C
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 15:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766418627; cv=none; b=q64e7gSwhDs0JnOA+4TBPpu4FFbWWy7+wbYDV5pzx5f2M1+j9+zFKe0Ld5lbb+ASb1oiX25ir/NYMcRJbv9EcQNk3D13XsI3lOUYRp8QwtCFLyXOc1NQTL2id4wOYvaV67dtPqGbwk5VrTauIUEUYLiEGLGHzTZU1XpkGSUUunE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766418627; c=relaxed/simple;
	bh=qCaw8AecTqvnpTYslVOSBCuOt9l5TDhTjG01WAGiQVw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ceHEohSCwIBMD7H+NbooxUahFlbIGK113gwSXbzrq8lAtl2ZF2gUAMONJxIw+7YQtJHtDcJzqfD0B9rRlTO3oh3/+7Bffqf3T5hZzEUmwEvzqVqJ8HOWopKYyy1xYMxS4YqamU6Vt3Nb5ZeJkYbpCbaLuHASEumidEBYy2QG8ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PYZsnfHh; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47aa03d3326so25909365e9.3
        for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 07:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766418624; x=1767023424; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MGab5CiD2jPfRBpHkXEMh/Ov2EOaoVnUhQp2EuD9XIo=;
        b=PYZsnfHhYbdm4IXW0iBfSnfe/eFErLMoAx5eL9pPxqjCnv+MWiSod6WAz4dEfnZdah
         IVOthkCYQtRHSNFf9n027nO0JH6YNLYblhYWDoqT6aE8xgGOL02Z7FEixzH7hR1Da+3u
         clcIOJj3EzmKoaCtsdlpsYryoxqoew/RWdl7rIsdv44bvAQdAzRNMV5iemaY6r6RB61s
         61/PYZ9sumEQYsMkCjt2ZksVqO8PKeTdoMMTywm43p8swMB+4Xqf3GO23wPKmxZm0VkX
         j8LTKIJUMotQOMEyIWjoqLCXdDNQMyD41bpOTRj72lAmjbySEtcoBgiycuZ+eNIM8Z2D
         rcIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766418624; x=1767023424;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MGab5CiD2jPfRBpHkXEMh/Ov2EOaoVnUhQp2EuD9XIo=;
        b=ttJinLAhWjemACg6mjnG0lKqgZCnsoALF3wTJMxHSz4vha4IODQbm7LD9LOr/PsyYy
         NJHZgqQKnDReY2hdeHNjVfjVWZ0Q+Zz7mZa20yCXS7s6Ot1FzYBdrtgfEeBOckC9R7Vp
         goL3+LhFTLJuitQ6Mm7KbE3NT/RIA3GqkoFmnYShXP/jd6ex9dRO3xEtAiwZwgNZKMzH
         NbWbRSr+n5aFBrs9XPu38eTTrMs+Wlwdu+U2D3c/4H6kWeFBueCb8g9Omar1nyDuMq7s
         VankI9fu/gaK9KnWTr/+LYZSMg4lH+0WA8sYFeoEG7mDgQG1/k97mL8mMybMPFHZTVsn
         cmrg==
X-Gm-Message-State: AOJu0YxhWJ5WUGljjUWAAy0lYwtPSKjhFFIm7SgnAAIjI508Q+dR7m/N
	K4QnKerBgP0iEuDJG0qr/3cOZ/IdK1NvNRqZo/IPxthoOeuZ3JCXsoMO8Ug1OfB1uIc=
X-Gm-Gg: AY/fxX5ywVwr5/E1G5YE8GNVGhIv6cQtkT9C5BbSNGftfvYRupzeM5t9BXkGsGYM2ZT
	jXJ7xOPAc8c97HXkT37qGHdwh9QryDf8d6SX3A5Qr6OXJdZmZUNRpzfVH84E+T2NodiVWjLZI+y
	4wwpG9S8rbdo9jfUWdBdDNclvTah092vZm5ZqZ5FXnLQY6g7+HUY2k/hdoC2WWi39Eh5mfMl54R
	baGhwkBAWEGVO2FQEJIVbFvE23dxDkZ7DG/mSjD2AKw8j7BfaDsZZWZtox/d3u+KzwA1Ceyf6u1
	g9ADHqQ41D8lp6BkPh4FN80OjSODL5KlkHCpY12pD5tEijFd+urJSOjMdinBe5qn4nc6Z1tSule
	49FiZm2lVNiVJ7sWpGUl4EQ+mejFJdr4FU+7O7U+qwuzRoj4o6ds4nrDdtOSbPtGnHRH+XevCBC
	yxUjGzXdKI98D/fzOwUR24GRaN/addzvR4urqxXK6ZH6NGW+tCuHyc
X-Google-Smtp-Source: AGHT+IEnNeIB7reQ9q4c4bCwKMSYMzsv5bCPVpus/n3dmX0FSxO1gTmCSFGyNJQfHYz24HlzhWIwfw==
X-Received: by 2002:a05:600c:3b15:b0:479:3a88:de5d with SMTP id 5b1f17b1804b1-47d247132b8mr82213085e9.36.1766418623769;
        Mon, 22 Dec 2025 07:50:23 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be279c5f8sm237816905e9.9.2025.12.22.07.50.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 07:50:23 -0800 (PST)
Message-ID: <517d6611-7540-4026-91ca-26c3d712517b@linaro.org>
Date: Mon, 22 Dec 2025 15:50:21 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] media: dt-bindings: Correct camss supply description
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vikram Sharma <quic_vikramsa@quicinc.com>,
 Kapatrala Syed <akapatra@quicinc.com>,
 Hariram Purushothaman <hariramp@quicinc.com>,
 Richard Acayan <mailingradian@gmail.com>, Bryan O'Donoghue <bod@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>, Depeng Shao <quic_depengs@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20251222-docs-camss-fixes-v4-1-914a4e5f7822@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251222-docs-camss-fixes-v4-1-914a4e5f7822@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/12/2025 14:16, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Usually, the supply is around 1.2 V, not 1.8 V, and also correct wording.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> Eventually, if more changes would be requested, would make sense someone
> from Qualcomm to follow-up on these, as I don't have schematics,
> documentation or also no access to the internal resources.
> 
> Thank you
> ---
> Changes in v4:
> - Everything in one commit. (Krzysztof)
> - Dropped Fixes tag. (Bryan)
> - Updated rest of the files to make them in sync.
> - Link to v3: https://lore.kernel.org/r/20251216-docs-camss-fixes-v3-0-c238b6810771@ixit.cz
> 
> Changes in v3:
> - Add commit improving vdda-phy-supply description to match more recent
>    bindings.
> - Double-checked and specified it's 1.2 V vdda-pll-supply. (Vladimir)
> - Link to v2: https://lore.kernel.org/r/20251213-docs-camss-fixes-v2-1-a8a4d4d51c6c@ixit.cz
> 
> Changes in v2:
> - Applied suggestion to clarify the description. (Krzysztof)
> - Link to v1: https://lore.kernel.org/r/20251212-docs-camss-fixes-v1-1-5c011505ff59@ixit.cz
> ---
>   Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml  | 4 ++--
>   Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml   | 4 ++--
>   Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml | 4 ++--
>   Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml   | 4 ++--
>   Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml   | 4 ++--
>   Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml   | 4 ++--
>   Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml   | 4 ++--
>   Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml | 4 ++--
>   8 files changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> index 019caa2b09c32..48f280e998096 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> @@ -126,11 +126,11 @@ properties:
>   
>     vdda-phy-supply:
>       description:
> -      Phandle to a regulator supply to PHY core block.
> +      0.88V supply to CSIPHY IP blocks.
>   
>     vdda-pll-supply:
>       description:
> -      Phandle to 1.8V regulator supply to PHY refclk pll block.
> +      1.2V supply to CSIPHY IP blocks.
>   
>     ports:
>       $ref: /schemas/graph.yaml#/properties/ports
> diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
> index ee35e3bc97ffd..b1c54c5b01b28 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
> @@ -125,11 +125,11 @@ properties:
>   
>     vdda-phy-supply:
>       description:
> -      Phandle to a regulator supply to PHY core block.
> +      0.88V supply to CSIPHY IP blocks.
>   
>     vdda-pll-supply:
>       description:
> -      Phandle to 1.8V regulator supply to PHY refclk pll block.
> +      1.2V supply to CSIPHY IP blocks.
>   
>     ports:
>       $ref: /schemas/graph.yaml#/properties/ports
> diff --git a/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
> index c99fe4106eee9..354130aba9fc9 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
> @@ -264,11 +264,11 @@ properties:
>   
>     vdda-phy-supply:
>       description:
> -      Phandle to a regulator supply to PHY core block.
> +      0.88V supply to CSIPHY IP blocks.
>   
>     vdda-pll-supply:
>       description:
> -      Phandle to 1.8V regulator supply to PHY refclk pll block.
> +      1.2V supply to CSIPHY IP blocks.
>   
>   required:
>     - clock-names
> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> index 35c40fe223767..46cc7fff15992 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> @@ -91,11 +91,11 @@ properties:
>   
>     vdda-phy-supply:
>       description:
> -      Phandle to a regulator supply to PHY core block.
> +      0.88V supply to CSIPHY IP blocks.
>   
>     vdda-pll-supply:
>       description:
> -      Phandle to 1.8V regulator supply to PHY refclk pll block.
> +      1.2V supply to CSIPHY IP blocks.
>   
>     ports:
>       $ref: /schemas/graph.yaml#/properties/ports
> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
> index 82bf4689d3300..be09cf3a3b3b8 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
> @@ -207,11 +207,11 @@ properties:
>   
>     vdda-phy-supply:
>       description:
> -      Phandle to a regulator supply to PHY core block.
> +      0.88V supply to CSIPHY IP blocks.
>   
>     vdda-pll-supply:
>       description:
> -      Phandle to 1.8V regulator supply to PHY refclk pll block.
> +      1.2V supply to CSIPHY IP blocks.
>   
>   required:
>     - clock-names
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> index ebf68ff4ab961..a509d4bbcb4aa 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> @@ -296,11 +296,11 @@ properties:
>   
>     vdda-phy-supply:
>       description:
> -      Phandle to a regulator supply to PHY core block.
> +      0.88V supply to CSIPHY IP blocks.
>   
>     vdda-pll-supply:
>       description:
> -      Phandle to 1.8V regulator supply to PHY refclk pll block.
> +      1.2V supply to CSIPHY IP blocks.
>   
>   required:
>     - clock-names
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
> index cd34f14916b42..4b9ab1352e914 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
> @@ -134,11 +134,11 @@ properties:
>   
>     vdda-phy-supply:
>       description:
> -      Phandle to a regulator supply to PHY core block.
> +      0.88V supply to CSIPHY IP blocks.
>   
>     vdda-pll-supply:
>       description:
> -      Phandle to 1.2V regulator supply to PHY refclk pll block.
> +      1.2V supply to CSIPHY IP blocks.
>   
>     ports:
>       $ref: /schemas/graph.yaml#/properties/ports
> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> index b87a13479a4bf..2d1662ef522b7 100644
> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> @@ -120,11 +120,11 @@ properties:
>   
>     vdd-csiphy-0p8-supply:
>       description:
> -      Phandle to a 0.8V regulator supply to a PHY.
> +      0.8V supply to a PHY.
>   
>     vdd-csiphy-1p2-supply:
>       description:
> -      Phandle to 1.2V regulator supply to a PHY.
> +      1.2V supply to a PHY.
>   
>     ports:
>       $ref: /schemas/graph.yaml#/properties/ports
> 
> ---
> base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
> change-id: 20251212-docs-camss-fixes-0fa525271951
> 
> Best regards,

I think the 'to a PHY' bit is redundant but sure, leave it as is.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

