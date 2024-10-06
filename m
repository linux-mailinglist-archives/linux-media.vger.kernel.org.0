Return-Path: <linux-media+bounces-19131-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AE4991C2F
	for <lists+linux-media@lfdr.de>; Sun,  6 Oct 2024 04:37:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02E3F1C20FB2
	for <lists+linux-media@lfdr.de>; Sun,  6 Oct 2024 02:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC56E1662F4;
	Sun,  6 Oct 2024 02:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RjsZfDZ2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD4F5338D;
	Sun,  6 Oct 2024 02:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728182221; cv=none; b=Gn/mfo7M1BXc4qljtRPcpY+k3oxE0xKaFDIyA1ATN6WJSRRAj/FB8gEta821o3khqwEdvDZoxZdQe5Vjhs0j25wU1RyuNvM4G0M6Jdj5Ndc9kHKo66utz4l8Wu8bT6IP7TDZK1nVNPGV/GDrqIHKcp8fsib1JPmDCqKHcQ/4GkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728182221; c=relaxed/simple;
	bh=B1eud6XayDVXl4MbMHfaAY7gWD6DQ62PCH29shW0c2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IlWIf8KsEgVDCw2Y9qdlo3q2Hn3KaoicxreyHZWl0cpuJzYjj2heJmfLhQrqLA8uuPWdS3X4x5N9d7hKbndFrURWm7MRWkTCkhwOp0vzWkaG3E0ywrIbzM7lnPPconB6iSSI4qNKCC6OwRhWeingeLiD0dBAvO9Tv/5XvCVEoVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RjsZfDZ2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A74A1C4CEC2;
	Sun,  6 Oct 2024 02:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728182220;
	bh=B1eud6XayDVXl4MbMHfaAY7gWD6DQ62PCH29shW0c2Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RjsZfDZ2g7vRkdDAOg4Rp2rYVnrBcaPcjgthiB9iRHMC0bwmatui4AdvCFIKfPZcg
	 dsltfCkl76PFEV2NxqkI6/AFIIPNi0bxcKTHcDUAzux1buS4C2XnLaeUMz87yh0QdM
	 SRedc66ppCZW5QX8h6ch2S2tMQb8SW3rs5oEKLavk2QxHPMCwj8P+7U0G6uCn8vyiO
	 JPySxkn+A1ixe36T6rSV0rjteU86D+kujYN3UXg6BZtKz88xo7fCokpUhc5K/OmFVu
	 0UYaFqsazCEHINRgetj9oGkS5l4LG6Wwstg8k8fMNbGMIZuwzKThVmO/p0J3HcSSRC
	 2FdZbfaxap+tA==
Date: Sat, 5 Oct 2024 21:36:57 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/6] dt-bindings: media: qcom,sc8280xp-camss: Fix
 interrupt types
Message-ID: <datahu33nmsser2p4fb2hyncsujtkwaca377ivwmpc6yj2naut@2sjsbebfm3gf>
References: <20240923072827.3772504-1-vladimir.zapolskiy@linaro.org>
 <20240923072827.3772504-2-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923072827.3772504-2-vladimir.zapolskiy@linaro.org>

On Mon, Sep 23, 2024 at 10:28:22AM GMT, Vladimir Zapolskiy wrote:
> The expected type of all CAMSS interrupts is edge rising, fix it in
> the documented example from CAMSS device tree bindings for sc8280xp.
> 

Who/what expects them to be RISING?

Regards,
Bjorn

> Fixes: bc5191e5799e ("media: dt-bindings: media: camss: Add qcom,sc8280xp-camss binding")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/media/qcom,sc8280xp-camss.yaml   | 40 +++++++++----------
>  1 file changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
> index c0bc31709873..9936f0132417 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
> @@ -328,26 +328,26 @@ examples:
>              vdda-phy-supply = <&vreg_l6d>;
>              vdda-pll-supply = <&vreg_l4d>;
>  
> -            interrupts = <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 640 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 758 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 759 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 760 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 761 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 762 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 764 IRQ_TYPE_LEVEL_HIGH>;
> +            interrupts = <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 640 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 641 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 758 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 759 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 760 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 761 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 762 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 764 IRQ_TYPE_EDGE_RISING>;
>  
>              interrupt-names = "csid1_lite",
>                                "vfe_lite1",
> -- 
> 2.45.2
> 

