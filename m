Return-Path: <linux-media+bounces-43283-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CF4BA5DCF
	for <lists+linux-media@lfdr.de>; Sat, 27 Sep 2025 12:37:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A4D43201BC
	for <lists+linux-media@lfdr.de>; Sat, 27 Sep 2025 10:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1808E2D77E0;
	Sat, 27 Sep 2025 10:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tke6yZ7k"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E3F1A267;
	Sat, 27 Sep 2025 10:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758969426; cv=none; b=AesTSg4KWTFWUbZz6cEIBDG9uLq8fl3e8yc7LgRXPnyEP956qhlHqEi6hQX+xJ55GMKl/G33kknACoTdWhcnYMQY3dW/EUFQ69NOu2Gv7OurZiM3cbQkqGauA98hOV9Ur6qhZ1srer5jJ6nwaeC9sG2xKzgudlC7P1+CzI25T5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758969426; c=relaxed/simple;
	bh=hN28MW52M+/qdHuPuduTEq7hUwxrCEo0Wx9RNlL10hI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qSKOX9pBkEBqElY3TV65aWAMFgcThygbOZQGfasrsPmraBdE38u6pMf1GPQ2ezm67ey3iqqzDP8LSKh+QGSKUltS9HDQUEbHqldAIPwgeD8FvlsdMm2hjMyMODNauHkyN69jOQa97HmGy5VaLJqUkeEc/rFZYway6ToOvwaCkNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tke6yZ7k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B943C4CEE7;
	Sat, 27 Sep 2025 10:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758969426;
	bh=hN28MW52M+/qdHuPuduTEq7hUwxrCEo0Wx9RNlL10hI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Tke6yZ7kzP2BJHJooBs9FdPkSKdx4zPMr5ze8yWkswZuv2QbLOcba6KScfbJPbrUV
	 hgH3XUq7FB1jYH7k2MIyhbnttIiIsg3OElL4ChE0c6K4TOs2E1YrBPHTsppGTx++Wi
	 VgEcjS2onavDSflXa0YF7LhJ11siKlwEGWo9AAC+7Huv/oX4B3I8JPy9iNzlfQrDdL
	 hMW3IHxXzl/aVrKC0kDCK5f9Tt7YdyxApwUJq8BhffCAl5Yp6zhNk4pfrpLZ5TPwlU
	 lhAk3o/1B+CWTWx3MoR9EptpZWoi7VqIsyix3dLc/TZ8SPkM6OdIb1BWITkIJ9bpnd
	 DTgPc62Flxi4Q==
Message-ID: <35402c21-bef8-44ac-844b-1cc97ff83c6f@kernel.org>
Date: Sat, 27 Sep 2025 11:37:01 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: qrb2210-rb1: Add overlay for
 vision mezzanine
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, andersson@kernel.org,
 konradybcio@kernel.org, dave.stevenson@raspberrypi.com,
 sakari.ailus@linux.intel.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org, mchehab@kernel.org, conor+dt@kernel.org,
 robh@kernel.org
References: <20250926073421.17408-1-loic.poulain@oss.qualcomm.com>
 <LAizvAKB21pYsBNwprUFqHcf56-GeWV5IFNd-yzGM688kLehFGW9bQ-LgO3uS6zSt5cXJKjwg8HAGa2ev9E4mw==@protonmail.internalid>
 <20250926073421.17408-4-loic.poulain@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20250926073421.17408-4-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/09/2025 08:34, Loic Poulain wrote:
> This initial version includes support for OV9282 camera sensor.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/Makefile             |  5 ++
>   .../qcom/qrb2210-rb1-vision-mezzanine.dtso    | 76 +++++++++++++++++++
>   2 files changed, 81 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtso
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index d7f22476d510..bee021efc249 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -138,6 +138,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-rb1.dtb
> +
> +qrb2210-rb1-vision-mezzanine-dtbs	:= qrb2210-rb1.dtb qrb2210-rb1-vision-mezzanine.dtbo
> +
> +dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-rb1-vision-mezzanine.dtb
> +
>   dtb-$(CONFIG_ARCH_QCOM)	+= qrb4210-rb2.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qrb5165-rb5.dtb
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtso
> new file mode 100644
> index 000000000000..3b6261131b75
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtso
> @@ -0,0 +1,76 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/clock/qcom,gcc-qcm2290.h>
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&tlmm {
> +	cam0a_default: cam0a-default-state {
> +		pins = "gpio28";
> +		function = "cam_mclk";
> +		drive-strength = <16>;
> +		bias-disable;
> +	};
> +};
> +
> +&pm8008 {
> +	status = "okay";
> +};
> +
> +&camss {
> +	status = "okay";
> +
> +	vdd-csiphy-1p2-supply = <&pm4125_l5>;
> +	vdd-csiphy-1p8-supply = <&pm4125_l13>;
> +
> +	ports {
> +		port@0 {
> +			csiphy0_ep: endpoint {
> +				data-lanes = <0 1>;
> +				remote-endpoint = <&ov9282_ep>;
> +			};
> +		};
> +	};
> +};
> +
> +&cci {
> +	status = "okay";
> +};
> +
> +&cci_i2c1 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	/* Vision Mezzanine DIP3-1 must be ON (Selects camera CAM0A&B) */
> +	camera@60 {
> +		compatible = "ovti,ov9282";
> +		reg = <0x60>;
> +
> +		/* Note: Reset is active-low but ov9282 driver logic is inverted... */
> +		reset-gpios = <&tlmm 18 GPIO_ACTIVE_LOW>;

This comment is confusing me a bit.

Shouldn't it be that the driver polarity gets fixed and the DTS just 
declares the correct thing ?

> +
> +		pinctrl-0 = <&cam0a_default>;
> +		pinctrl-names = "default";
> +
> +		clocks = <&gcc GCC_CAMSS_MCLK3_CLK>;
> +		assigned-clocks = <&gcc GCC_CAMSS_MCLK3_CLK>;
> +		assigned-clock-rates = <24000000>;
> +
> +		avdd-supply = <&vreg_l3p>;
> +		dvdd-supply = <&vreg_l1p>;
> +		dovdd-supply = <&vreg_l7p>;
> +
> +		port {
> +			ov9282_ep: endpoint {
> +				link-frequencies = /bits/ 64 <400000000>;
> +				data-lanes = <1 2>;
> +				remote-endpoint = <&csiphy0_ep>;
> +                        };
> +                };
> +	};
> +};
> --
> 2.34.1
> 
> 

---
bod

