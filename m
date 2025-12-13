Return-Path: <linux-media+bounces-48733-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4172FCBA6A1
	for <lists+linux-media@lfdr.de>; Sat, 13 Dec 2025 08:28:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 64D6D301A9B1
	for <lists+linux-media@lfdr.de>; Sat, 13 Dec 2025 07:28:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F219427FB03;
	Sat, 13 Dec 2025 07:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GuwYDZsp"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3351A3C38;
	Sat, 13 Dec 2025 07:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765610923; cv=none; b=kXmb11RP2yR0cWOwglBA9gtrWFMSCOqNY/SJ8EyZ7MU69n2CMxwbj0LkNEFrwj2eENXK4Bv3wyo9bDNcR8hk0vPyMLa6DkxoBtsKfoWx0puohbEGq7HTunLPe9McVbwiy4FjiCSyeC9J0ImSRfnhTyv1C1QcBu2++cRjjUScYmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765610923; c=relaxed/simple;
	bh=I8KHB05J4hzU7RAcGfM4K+COzPxnPfyndjSsOY4V+h8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IimK+2xakRLlAj+bO4wFdAzYVPDfJvNDuiHS+1eVmQzCFxYsV2liVcIrGs1GlYMUOURYe4MEJhX5oWu1Lg2gaEzaD7b3qcFiOH3tpQhHqPFjsHEZ6LOh7r/ojx0imKiCg+kWaFuqGMQQwUJv1WoiCxWbV08UXq8U0/KHGySB6v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GuwYDZsp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCC7CC116B1;
	Sat, 13 Dec 2025 07:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765610922;
	bh=I8KHB05J4hzU7RAcGfM4K+COzPxnPfyndjSsOY4V+h8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GuwYDZspCrlYpM3yidUiAHpYR37T1Q4VnneG1ihkjSwHfoZCcVywhoxvYuSZxWN5D
	 Z9OqOMjbPCmMPeA+HZln6BeweyVD+Z6hg6CYHPTY2F8ktiPFPwqd7EUpvJtBNp2Z7J
	 12W9+OAtXmUrabNWkNAh4xCK4M3z/N8saObqde0ZqZJi9lQk6nMuQV2sKRPkXH5RL+
	 bDXSWd1ekWMCLmmTA+/lANrI+O67Zkbd9rboRmzRU07ULyEBCQC+g16n62r6/C2NVd
	 LjCCAAmBlmBzwLn7bnH8qpxR1rth9wlsEvgb/Ya1pTXpR2WBu9YiIGDIUUYBc/Q3Ba
	 eu+3LAX6Sqmtg==
Message-ID: <37ef8a9e-0ebc-4d31-99e1-3f0512d73412@kernel.org>
Date: Sat, 13 Dec 2025 07:28:32 +0000
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
References: <-p_V50_c9ufrDqGMvZ5pwIXywQxh2C6Rjo4IEUlVAeFJouqq3zlWRt-VsIRsCmGwuvslk9MU3XxtxyTZrXuSSg==@protonmail.internalid>
 <20251212-docs-camss-fixes-v1-1-5c011505ff59@ixit.cz>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <20251212-docs-camss-fixes-v1-1-5c011505ff59@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/12/2025 22:55, David Heidelberg via B4 Relay wrote:
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
> ---
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
> ---
> base-commit: d9771d0dbe18dd643760431870a6abf9b0866bb0
> change-id: 20251212-docs-camss-fixes-0fa525271951
> 
> Best regards,
> --
> David Heidelberg <david@ixit.cz>
> 
> 
> 

I think this is copy/paste legacy error.

The voltage level should be more usefully encoded in the name anyway.

---
bod

