Return-Path: <linux-media+bounces-48874-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C1DCC2C14
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 13:32:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8549B3025721
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 12:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B875C396541;
	Tue, 16 Dec 2025 12:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gbdjEghI"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA48B387B3C;
	Tue, 16 Dec 2025 12:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765888304; cv=none; b=FATTcOXhZlPtD2l9dpBAmbNC3Y98Jx/VM3IChQMOGtNhEvr1F02qeJwa+74vEV/k+6wY8uAYnPFjDP2Sbnm0J8yeYj4slCuc802uzptCzAlfCiOmoL0RcfaoR63Poke+2C2Vr5BdM57RlS806pOwqsmqSEphzCXGdCTydSqCMtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765888304; c=relaxed/simple;
	bh=oIcj7gxRphXjuqHHm38sS9faS0qO68es9rdYHIV7pTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VsuT90tIcq/U2CR/nYiM3//N0RjAlUF2cuCtbPAINfBz87YWRn0FJWfObrL/AjJyj0UZB+mzUgUuv9RwVjYMt0GZW5RUyQSgWpIpujUBMTXRB6OBY8ftpv9FCtC44aCeVolY6IRT6mhqEOxeFHNEwtm4yEI51zM7ZzJRI2/Q2bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gbdjEghI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9D9DC19422;
	Tue, 16 Dec 2025 12:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765888303;
	bh=oIcj7gxRphXjuqHHm38sS9faS0qO68es9rdYHIV7pTU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gbdjEghIaHP4eO7hFksOKinAuOAcAujpJsQyEjLphOjhtnYXQ299jebMN0ayPNacB
	 aU0OFmdxieLh4mYb3rS2zPJfHf+5wcqbrfnwscDfj+shQ2ZOdkYXZqZmZvxItGdSwI
	 utspDHGk33Js1S4tsXBz9TaojZopUXSwIIz+2dlSYoWZcfMibonhRu8iV0UkqFNY1W
	 iEwvC5zaZwZoOAhxEAZxT59qdeZ7IEEzvvh7WXMsSYYiZL6dduGVycoFSpk1PSgPHK
	 D1XkFF382KC9Id79bys3U3ehRIvkYGRcN4bw/WFWkneHdpbrwn26B0DG0OyiCfJrO8
	 kRnBRdyFZbesw==
Message-ID: <58fa4a36-f931-418a-9f0a-47069f7086df@kernel.org>
Date: Tue, 16 Dec 2025 12:31:37 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] media: dt-bindings: Update camss VDDA PHY supply
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
 Richard Acayan <mailingradian@gmail.com>, Hans Verkuil
 <hverkuil@kernel.org>, Depeng Shao <quic_depengs@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20251216-docs-camss-fixes-v3-0-c238b6810771@ixit.cz>
 <gyLLwnJT7mfY4NyW6TOWv3lj3JHA3A8QOFn2HW_eElrRWXs7FlEyBQMRCRvoMpY2_zfNhns6y7EhLA3IM4msAQ==@protonmail.internalid>
 <20251216-docs-camss-fixes-v3-2-c238b6810771@ixit.cz>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20251216-docs-camss-fixes-v3-2-c238b6810771@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/12/2025 12:24, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Usually, the supply is around 0.875 - 0.88 V. Include the information
> same as is already done for more recent camss dt-bindings.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml  | 2 +-
>   Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml   | 2 +-
>   Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml | 2 +-
>   Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml   | 2 +-
>   Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml   | 2 +-
>   Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml   | 2 +-
>   Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml   | 2 +-
>   7 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> index 4986d18d1a2da..5c47a2cf220fb 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> @@ -126,7 +126,7 @@ properties:
> 
>     vdda-phy-supply:
>       description:
> -      Phandle to a regulator supply to PHY core block.
> +      0.88V regulator supply to CSIPHY IP blocks.
> 
>     vdda-pll-supply:
>       description:
> diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
> index e4b0b7ffdc336..7d180e9cb6fa9 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
> @@ -125,7 +125,7 @@ properties:
> 
>     vdda-phy-supply:
>       description:
> -      Phandle to a regulator supply to PHY core block.
> +      0.88V regulator supply to CSIPHY IP blocks.
> 
>     vdda-pll-supply:
>       description:
> diff --git a/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
> index 9cba6e0819fb1..cd5e4948b97fc 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
> @@ -264,7 +264,7 @@ properties:
> 
>     vdda-phy-supply:
>       description:
> -      Phandle to a regulator supply to PHY core block.
> +      0.88V regulator supply to CSIPHY IP blocks.
> 
>     vdda-pll-supply:
>       description:
> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> index 61222839556bd..56346b650d21e 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> @@ -91,7 +91,7 @@ properties:
> 
>     vdda-phy-supply:
>       description:
> -      Phandle to a regulator supply to PHY core block.
> +      0.88V regulator supply to CSIPHY IP blocks.
> 
>     vdda-pll-supply:
>       description:
> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
> index 03b9b34460b0a..008a739a0018a 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
> @@ -207,7 +207,7 @@ properties:
> 
>     vdda-phy-supply:
>       description:
> -      Phandle to a regulator supply to PHY core block.
> +      0.88V regulator supply to CSIPHY IP blocks.
> 
>     vdda-pll-supply:
>       description:
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> index acf9c54682107..db5029d521291 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> @@ -296,7 +296,7 @@ properties:
> 
>     vdda-phy-supply:
>       description:
> -      Phandle to a regulator supply to PHY core block.
> +      0.88V regulator supply to CSIPHY IP blocks.
> 
>     vdda-pll-supply:
>       description:
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
> index cd34f14916b42..ebf82a8c423bc 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
> @@ -134,7 +134,7 @@ properties:
> 
>     vdda-phy-supply:
>       description:
> -      Phandle to a regulator supply to PHY core block.
> +      0.88V regulator supply to CSIPHY IP blocks.
> 
>     vdda-pll-supply:
>       description:
> 
> --
> 2.51.0
> 
> 

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>

