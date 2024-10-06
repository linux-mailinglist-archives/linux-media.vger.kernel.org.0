Return-Path: <linux-media+bounces-19132-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 127F2991C32
	for <lists+linux-media@lfdr.de>; Sun,  6 Oct 2024 04:39:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE658281EFE
	for <lists+linux-media@lfdr.de>; Sun,  6 Oct 2024 02:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94799166F0C;
	Sun,  6 Oct 2024 02:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B8y6hcZl"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC7A5338D;
	Sun,  6 Oct 2024 02:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728182366; cv=none; b=t9iTcfQsPesZw6f0ZttLLCg7IxoH1kpEGqLP7zKABwa8c2HnwGmAQd8s3gx1Q8k0mOSTqjSlpbHPYl92uTFDH7KUG34/zVxDFCngPcNqlPIrE4DhCNxfCzLpLxgQfUxipZbKyxC2qZ6WBApsVTyivvfH0VRjXTetpUw47ziHEPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728182366; c=relaxed/simple;
	bh=8mQ7NYC63Rd8DM1i7CwPRzGY0R/Ayn2zU8oc90EuhPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lwLfVGIA5P+K4l6/H3/TgaC6qORuzXt33nY7Ze71yKZEQPVMFviPz+J3eY9+95TrXlVWppJrvplh0imm3omMt7Oer/GGR+aqR8oivuwR0jj13SlzHyhiomKTMKW9lInqJQImSbgDq0UThYW5/LtpLSin0l2aLkBoEQR0iZYWV2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B8y6hcZl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05830C4CEC2;
	Sun,  6 Oct 2024 02:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728182365;
	bh=8mQ7NYC63Rd8DM1i7CwPRzGY0R/Ayn2zU8oc90EuhPo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B8y6hcZlRr9yqgs7sGzoq6+YtrZZ8OhFlehh3Yb/8F3HHFEveztjqA4WL3GkqqfoA
	 BfzMzkHIKCuzKb95GnY2Zz9hdO/s764oHB5SaASzanomx9E3oeMiJVSP5PnpECmq+T
	 GXSMF36+93gQijvKir/M1m1MPzcFuMKEqpm+LbHzbpkeYD2ngOmL+16mq1yC3yVdWx
	 M8qjnXHDAV8SIcC04vSRkoL32NLdv52mE1NSlfMyBwjmHHy2VSnJUm594Du6UB7QSK
	 a+pS1m2NbWH4h9KUsWIg7b5M1R/1akSdyeySRbMYFiCBaHKXmGVMpklDUik7Xw5GKN
	 BkRHW5Pj/pEVQ==
Date: Sat, 5 Oct 2024 21:39:21 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v2 4/6] arm64: dts: qcom: sc8280xp: Fix interrupt type of
 camss interrupts
Message-ID: <c27ufmedz2ht7voie5pszvzxnj5qrxw3l3pbu6kujxrvpbpjyb@ooxz26rhf6jc>
References: <20240923072827.3772504-1-vladimir.zapolskiy@linaro.org>
 <20240923072827.3772504-5-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923072827.3772504-5-vladimir.zapolskiy@linaro.org>

On Mon, Sep 23, 2024 at 10:28:25AM GMT, Vladimir Zapolskiy wrote:
> The expected type of all CAMSS interrupts is edge rising, fix it in
> the CAMSS device tree node for sc8280xp platform.
> 

Why did we get all these interrupts wrong? Why should they be RISING and
not LEVEL_HIGH?

Please document the reason why this is changed, so that the next person
adding a camss node can find your explanation and understand why it
should look this way.

Regards,
Bjorn

> Fixes: 5994dd60753e ("arm64: dts: qcom: sc8280xp: camss: Add CAMSS block definition")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Tested-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 40 +++++++++++++-------------
>  1 file changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index 80a57aa22839..aa2678eb3bcd 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -3882,26 +3882,26 @@ camss: camss@ac5a000 {
>  				    "vfe3",
>  				    "csid3";
>  
> -			interrupts = <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 640 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 758 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 759 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 760 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 761 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 762 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 764 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts = <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 640 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 641 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 758 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 759 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 760 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 761 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 762 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 764 IRQ_TYPE_EDGE_RISING>;
>  			interrupt-names = "csid1_lite",
>  					  "vfe_lite1",
>  					  "csiphy3",
> -- 
> 2.45.2
> 

