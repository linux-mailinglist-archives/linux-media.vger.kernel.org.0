Return-Path: <linux-media+bounces-36537-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A68AF1363
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 13:13:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 780B33A6DAB
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 11:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92EF32609C4;
	Wed,  2 Jul 2025 11:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="taQoeuCG"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE75623956E;
	Wed,  2 Jul 2025 11:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751454819; cv=none; b=JOFnTLbuYLFyFw2/vHDyTJUnDisnJ0sWlE1obzVRyHxY+bhK7b6XLpCu3tO8wTUbvpmhtUsZXnDlqLwuUa/XeX7tO+xqE8mULB3KfW+I019g6obm1lfQkjLms001bOotdGMOOAhcUO9ORygvb/xK1KkHllwzAPp27v2gdzLoWKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751454819; c=relaxed/simple;
	bh=/3UcYFAtiHdK/x/wf/hpXgHjxC2DHsZORgWcfa0tL2c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qYMXHrMvaGbHC4/H5KjCtMLsZeD73cF2mply6b8DvZM16bcgcMGJlm4TvSEs1+Gta6YpPNNo3E+alLjUSsEtEST2rbzmS6YpHkVt9xPtOkFo52BLcH62A6LS8gKJe4BKYzzxUKR2Pr2frzV8pXMJ/A2lx3/Ux+UwWNluXQqg9Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=taQoeuCG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E6D2C4CEED;
	Wed,  2 Jul 2025 11:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751454818;
	bh=/3UcYFAtiHdK/x/wf/hpXgHjxC2DHsZORgWcfa0tL2c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=taQoeuCGyVGXCF3ArPdIgGKzktogQkojqAiYSWlI2bP0V1r193wDfgwFYXXKaCwRc
	 nxtGQ0aW4R78AXPSwYeOHTLMG/OiaBjXSP3FBUonzgsLKsjhJxFu+1bmixSEerQcjO
	 hpLhoyuSWkKAXmDKY2udJknbBCATqzZVDIlPZhWrewbX9zcQYRIrIDGf1lXb/RiKUN
	 A0DM80KxchAhfTk62BLcIS0ByTjib7oLh/UgW54ifuWhdHK4C349y9L01BDfQ45l9x
	 ZzZq1H9RV2k9SqtMiNgAzv0hED7aXkEsu86qIR+jujS8FPX0pdhLlyzKCxnhEIdw6a
	 Mo3ovL6+xnw2w==
Message-ID: <19dd2e69-ad13-46f2-b99f-04a5e26f10d3@kernel.org>
Date: Wed, 2 Jul 2025 13:13:33 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] media: dt-bindings: add non-pixel property in iris
 schema
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
 <20250627-video_cb-v3-1-51e18c0ffbce@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250627-video_cb-v3-1-51e18c0ffbce@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/06/2025 17:48, Vikash Garodia wrote:
> Existing definition limits the IOVA to an addressable range of 4GiB, and
> even within that range, some of the space is used by IO registers,
> thereby limiting the available IOVA to even lesser. Video hardware is
> designed to emit different stream-ID for pixel and non-pixel buffers,
> thereby introduce a non-pixel sub node to handle non-pixel stream-ID.
> 
> With this, both iris and non-pixel device can have IOVA range of 0-4GiB
> individually. Certain video usecases like higher video concurrency needs
> IOVA higher than 4GiB.
> 
> Add reference to the reserve-memory schema, which defines reserved IOVA

No. That schema is always selected. This makes no sense at all.

> regions that are *excluded* from addressable range. Video hardware
> generates different stream IDs based on the predefined range of IOVA
> addresses. Thereby IOVA addresses for firmware and data buffers need to
> be non overlapping. For ex. 0x0-0x25800000 address range is reserved for
> firmware stream-ID, while non-pixel (bitstream) stream-ID can be
> generated by hardware only when bitstream buffers IOVA address is from
> 0x25800000-0xe0000000.
> Non-pixel stream-ID can now be part of the new sub-node, hence iommus in
> iris node can have either 1 entry for pixel stream-id or 2 entries for
> pixel and non-pixel stream-ids.
> 
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>  .../bindings/media/qcom,sm8550-iris.yaml           | 40 ++++++++++++++++++++--
>  1 file changed, 38 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> index c79bf2101812d83b99704f38b7348a9f728dff44..4dda2c9ca1293baa7aee3b9ee10aff38d280fe05 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> @@ -65,10 +65,31 @@ properties:
>        - const: core
>  
>    iommus:
> +    minItems: 1
>      maxItems: 2

No, why hardware suddenly has different amount?

>  
>    dma-coherent: true
>  
> +  non-pixel:

Why EXISTING hardware grows?

> +    type: object
> +    additionalProperties: false
> +
> +    description:
> +      Non pixel context bank is needed when video hardware have distinct iommus
> +      for non pixel buffers. Non pixel buffers are mainly compressed and
> +      internal buffers.
> +
> +    properties:
> +      iommus:
> +        maxItems: 1
> +
> +      memory-region:
> +        maxItems: 1
> +
> +    required:
> +      - iommus
> +      - memory-region
> +
>    operating-points-v2: true
>  
>    opp-table:
> @@ -86,6 +107,7 @@ required:
>  
>  allOf:
>    - $ref: qcom,venus-common.yaml#
> +  - $ref: /schemas/reserved-memory/reserved-memory.yaml

This makes no sense. how is this device a reserved memory?

>    - if:
>        properties:
>          compatible:
> @@ -117,6 +139,16 @@ examples:
>      #include <dt-bindings/power/qcom-rpmpd.h>
>      #include <dt-bindings/power/qcom,rpmhpd.h>
>  
> +    reserved-memory {
> +      #address-cells = <2>;
> +      #size-cells = <2>;

Why do you need this?

> +
> +      iris_resv: reservation-iris {

Mixing MMIO and non-MMIO is not the way to go. This is also not relevant
here. Don't embed other things into your binding example.


> +        iommu-addresses = <&iris_non_pixel 0x0 0x0 0x0 0x25800000>,
> +                          <&iris_non_pixel 0x0 0xe0000000 0x0 0x20000000>;
> +      };
> +    };
> +
>      video-codec@aa00000 {
>          compatible = "qcom,sm8550-iris";
>          reg = <0x0aa00000 0xf0000>;
> @@ -144,12 +176,16 @@ examples:
>          resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
>          reset-names = "bus";
>  
> -        iommus = <&apps_smmu 0x1940 0x0000>,
> -                 <&apps_smmu 0x1947 0x0000>;
> +        iommus = <&apps_smmu 0x1947 0x0000>;

Why did the device or hardware change? Nothing explains in commit msg
what is wrong with existing device and existing binding.

>          dma-coherent;
>  
>          operating-points-v2 = <&iris_opp_table>;
>  
> +        iris_non_pixel: non-pixel {
> +            iommus = <&apps_smmu 0x1940 0x0000>;
> +            memory-region = <&iris_resv>;
> +        };
> +
>          iris_opp_table: opp-table {
>              compatible = "operating-points-v2";
>  
> 


Best regards,
Krzysztof

