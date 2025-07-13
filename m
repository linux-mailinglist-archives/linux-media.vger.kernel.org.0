Return-Path: <linux-media+bounces-37551-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2307AB02FC7
	for <lists+linux-media@lfdr.de>; Sun, 13 Jul 2025 10:15:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FA971A601A3
	for <lists+linux-media@lfdr.de>; Sun, 13 Jul 2025 08:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A29D158520;
	Sun, 13 Jul 2025 08:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="npXwOfPR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF181156677
	for <linux-media@vger.kernel.org>; Sun, 13 Jul 2025 08:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752394530; cv=none; b=DECm0CItOSQ7krcmVFuR2ZGCA+NIiXF51n+rfqrseMT1Mnh/wlwD0UXuxiODNLVFYOoHKqodtHOhm7OTqncywubAg7GktEflYJ/ruJiFgG2DfnLLBGRajfgQGQ2jhiuqangGtH8loH+2m84gwg9lp2sMFOPRjysrGp+atQo9jF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752394530; c=relaxed/simple;
	bh=vttOkDs56yPTVYl/8jktfR2NbnPG7uR/DNn09oaUX28=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bAe0lCF08+lNODfMCZlSDyEURdr2ukKgM56XPQXZX8EAOJuWFi3QZI1/G065bPMxa3g+Y24M8Pua4SsOOZK4Ks6ZroVEnFGDYaxbb3ujznDFxnUSqGyuEG0fsaPREfCc3B+ktMKiqJ5jTjRvrObeLNPFhb0S208KgapGGVYM1C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=npXwOfPR; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a4eb4acf29so221513f8f.0
        for <linux-media@vger.kernel.org>; Sun, 13 Jul 2025 01:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752394527; x=1752999327; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rZqk7kl0+iqHzktYNZZ/CDyHkx8iXY+hbYXd+b6DxSA=;
        b=npXwOfPRcqO8Zm8M65PEY3/uMjRVbopRlHJg5e7/BsHf5CborhDhPk4HZQ62x4fQwZ
         Q+3owlKIdGmCCqhX7Yn8sx5KBSgyTILkqaUMd6+HX8BF4GVfjg42CHgIh2C999ZKQFnR
         anzH7WJrg2lCYMBTPxFoaLZIKYLIKFUXu/QbKNe2in/XRN9HVtEoNisulZGRppvki5rS
         Qlz2LsxFHetot8qz+NQh9JGAW10noJYfNsEt3psc35m87U5sck60x9lVqLGkILgdL8ka
         vanF2+a0UAUYU7fvSnaOS6aCP2hXq3nqEVc9BXMmhP4Z0C+2AOCdnfqOdu2qEfiukT9Q
         Zvqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752394527; x=1752999327;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rZqk7kl0+iqHzktYNZZ/CDyHkx8iXY+hbYXd+b6DxSA=;
        b=wPCMx+0EMfgncvolUsuEXpGNCyp1XkZ1LHy+Wr5KiFxt2IRg766VXXnQZTikOse/C8
         mmP7HqA4empXOntLy173MWrrL7E/jrCl/vHEG2MtoRwJNCjftWznGDMhE4J5sy/qpoTT
         IWCzaZtgg3sbt+fRxQRuRzB8q1PG42vnediVO5ugicIdNQKimWL2Fty18c78NPQrCYvg
         MROICliS98N8nB7jKoRpvH5fNg0jND/3iRS1yfrqfITgXX0dP7iOY3ptASCuqZf8ZP2K
         NPAawWzD3OIaiwFFGG3abwUESCwtzzkGlDVEQbTEfqhYaenGJLMoaTscnHgB9BAFjf3M
         vbgQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5teDEuBvLj0oGlapTZ6B0gFQcidCkCIHOecFVfEgTnxon2kTkocM0sdL2m4nye9DlBqME9Mvy9G9mEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhoeswUWag5/JjY3sVqHVeBQC7GP2AMmXiu5n7HPm8/IHKGPKr
	mLRdAC8l9dx1KUUaS4UaqpUvFrmXexq/1O4yDGfSWUHJaiHi1aTRDqJG2my2N+FymZQ=
X-Gm-Gg: ASbGncuw28FZ9OAwygt855i3En8CtHmrkO09dhf+Nm96JeZ72saO8YX1McF3rqUYTZn
	aW40Ypmps+ACWntqT/4ww5Mkq9jcgWvqak+ub+Z61mYZmZM1QdwHBaey7VJtdaC8Gtlw6U0p412
	VkYx5lMxzg1IbkpvXYdomfONwsRtU7tHukIrhWV3s/XDLKJpsgfRWYTKc+/uVcNctofIFob9f0Y
	CYc5UbexfWyqPZwcmnpNf4lJqPodmkdSkGN/QDBiBwJjEgvNr8EmnaEomkZlzaeP8XsCp/XNRA4
	LSVY1vXCRlyJKhcYJ96nhkqS31tkktf4CD/ikQXv+8mDqB0tXXxI9IEguWoZli3JlQXaEcDY5cR
	CdtVVWSTThw6Wcxmg0RjAH6sM0yhZBneW2e9Oa2INSNbew7ejluZr
X-Google-Smtp-Source: AGHT+IGdUGte7uXEneQEdBIBq7W4vXJUZevCvhpIqCepwSuDSON9ol1D6QYcIdwDspBHZs33bH2Iuw==
X-Received: by 2002:a05:6000:2006:b0:3a5:7991:fee with SMTP id ffacd0b85a97d-3b5f2e6c69amr2490271f8f.14.1752394526971;
        Sun, 13 Jul 2025 01:15:26 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e0d571sm9335350f8f.57.2025.07.13.01.15.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Jul 2025 01:15:26 -0700 (PDT)
Message-ID: <f4fd544b-bd5e-49eb-83d9-290f77e503ef@linaro.org>
Date: Sun, 13 Jul 2025 10:15:23 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/15] dt-bindings: media: qcom,x1e80100-camss: Assign
 correct main register bank to first address
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
 <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-1-0bc5da82f526@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-1-0bc5da82f526@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/07/2025 14:57, Bryan O'Donoghue wrote:
> The first register bank should be the 'main' register bank, in this case
> the CSID wrapper register is responsible for muxing PHY/TPG inputs directly
> to CSID or to other blocks such as the Sensor Front End.
> 
> commit f4792eeaa971 ("dt-bindings: media: qcom,x1e80100-camss: Fix isp unit address")

I have next from few days ago and I don't have this commit.

> assigned the address to the first register bank "csid0" whereas what we
> should have done is retained the unit address and moved csid_wrapper to be
> the first listed bank.

This is confusing. Did that commit change entries in the binding?


> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../devicetree/bindings/media/qcom,x1e80100-camss.yaml       | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> index b075341caafc1612e4faa3b7c1d0766e16646f7b..2438e08b894f4a3dc577cee4ab85184a3d7232b0 100644
> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> @@ -21,12 +21,12 @@ properties:
>  
>    reg-names:
>      items:
> +      - const: csid_wrapper

Anyway, this is ABI break, so needs some sort of explanation in the
commit msg. We don't break ABI for cleanup reasons, unless it wasn't
released yet etc.

Best regards,
Krzysztof

