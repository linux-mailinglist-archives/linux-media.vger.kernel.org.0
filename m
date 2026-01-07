Return-Path: <linux-media+bounces-50139-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D97CFE03F
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 14:41:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B2C353086364
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 13:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89A0133F37F;
	Wed,  7 Jan 2026 13:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mouWI9Zf"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D867724397A;
	Wed,  7 Jan 2026 13:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767793029; cv=none; b=XSVntW+iERaRzZ7i6pSK0VM4R9OT6lWTe0VWoRxI+02uGXZhAATy2blvtlAS96ZusheWE45sXONccdsVd3fLNF+v1RLPZzsAPiuAaeIOaJBuHb54nVYc3Gd2KTM48QzDorg4dTtlMVafPUobq8SDYNLLwcClpYY64SRoDQPgr6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767793029; c=relaxed/simple;
	bh=LEUoa7l62g+TJDfOSn+FtDTHetT0GTOmCxQjZ+1AEjE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DYcbvKQnfHSfMdcO5qcXZsDyDWefqjN7rcSA4Ho0m5LUtzPl1aFI51LMRCokUdzuV+XYkNxROXvjGBchQ9rzzVp+R9gjDnj5ZycfUVQUrpgwMej7RuO/6MMdJQzqK/aCUNmmAIzp9OGWA52vUcVBkkqnpS5WzJjpoyHEgaaI3+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mouWI9Zf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18926C4CEF7;
	Wed,  7 Jan 2026 13:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767793026;
	bh=LEUoa7l62g+TJDfOSn+FtDTHetT0GTOmCxQjZ+1AEjE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mouWI9Zf32XLOQEelSa+xFNC/a0QZxxOxrNj1fDX69KtJEaIDyhDaRz+5vrWE8bup
	 dLARXI52uUwF1Uj/hQNk05OMMzTtvh4Ain9n6i29PkSabkkV08dmyqidZ/NX/hbh6M
	 XpYHRTuJi65V/B/GsNj13w9At+O7Cy79BhshquL/WZzRkayDWoNgZNNfO/P6L9qbZb
	 tx+96BiTOS0SLxMeFzn71n1LBC46Gcji3Dt84L0ySNF2t/E0qhDEGqLFSEJdi+oMbq
	 7vwIT3idtOyr3LO8L0dC580q0yO0B4joAY0sPvqo4EdVOTPL1ljGbR5sHOC+z47xwb
	 lCUZ4FNwmd7nA==
Message-ID: <a352539e-13a2-44f2-802c-f92747115732@kernel.org>
Date: Wed, 7 Jan 2026 13:37:00 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] arm64: dts: qcom: sdm670-google-sargo: add imx355
 front camera
To: Richard Acayan <mailingradian@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Robert Mader <robert.mader@collabora.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
References: <20260107043044.92485-1-mailingradian@gmail.com>
 <EH_uOtpcVsNitfFOqaxIc6mwDxTGSTrk6KihkoFf_tDOuglAxp2x9I70hChJgfC43qZUQKje80MW4gngc29-Mw==@protonmail.internalid>
 <20260107043044.92485-6-mailingradian@gmail.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20260107043044.92485-6-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/01/2026 04:30, Richard Acayan wrote:
> The Sony IMX355 is the front camera on the Pixel 3a, mounted in portrait
> mode. It is connected to CSIPHY1 and CCI I2C1, and uses MCLK2. Add
> support for it.
> 
> Co-developed-by: Robert Mader <robert.mader@collabora.com>
> Signed-off-by: Robert Mader <robert.mader@collabora.com>
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>   .../boot/dts/qcom/sdm670-google-sargo.dts     | 104 ++++++++++++++++++
>   1 file changed, 104 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
> index ed55646ca419..ec447fe3959a 100644
> --- a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
> @@ -172,6 +172,34 @@ vreg_s2b_1p05: vreg-s2b-regulator {
>   		regulator-min-microvolt = <1050000>;
>   		regulator-max-microvolt = <1050000>;
>   	};
> +
> +	cam_front_ldo: cam-front-ldo-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "cam_front_ldo";
> +		regulator-min-microvolt = <1352000>;
> +		regulator-max-microvolt = <1352000>;
> +		regulator-enable-ramp-delay = <135>;
> +
> +		gpios = <&pm660l_gpios 4 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&cam_front_ldo_pin>;
> +		pinctrl-names = "default";
> +	};
> +
> +	cam_vio_ldo: cam-vio-ldo-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "cam_vio_ldo";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-enable-ramp-delay = <233>;
> +
> +		gpios = <&pm660_gpios 13 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&cam_vio_pin>;
> +		pinctrl-names = "default";
> +	};
>   };
> 
>   &apps_rsc {
> @@ -392,6 +420,61 @@ vreg_bob: bob {
>   	};
>   };
> 
> +&camss {
> +	vdda-phy-supply = <&vreg_l1a_1p225>;
> +	vdda-pll-supply = <&vreg_s6a_0p87>;
> +
> +	status = "okay";
> +};
> +
> +&camss_port1 {
> +	camss_endpoint1: endpoint {
> +		clock-lanes = <7>;
> +		data-lanes = <0 1 2 3>;
> +		remote-endpoint = <&cam_front_endpoint>;
> +	};
> +};
> +
> +&cci {
> +	pinctrl-0 = <&cci1_default>;
> +	pinctrl-1 = <&cci1_sleep>;
> +	pinctrl-names = "default", "sleep";
> +
> +	status = "okay";
> +};
> +
> +&cci_i2c1 {
> +	camera@1a {
> +		compatible = "sony,imx355";
> +		reg = <0x1a>;
> +
> +		clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +
> +		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +		assigned-clock-rates = <19200000>;
> +
> +		reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
> +
> +		avdd-supply = <&cam_front_ldo>;
> +		dvdd-supply = <&cam_front_ldo>;
> +		dovdd-supply = <&cam_vio_ldo>;
> +
> +		pinctrl-0 = <&cam_front_default &cam_mclk2_default>;
> +		pinctrl-names = "default";
> +
> +		rotation = <270>;
> +		orientation = <0>;
> +
> +		port {
> +			cam_front_endpoint: endpoint {
> +				data-lanes = <1 2 3 4>;
> +				link-frequencies = /bits/ 64 <360000000>;
> +				remote-endpoint = <&camss_endpoint1>;
> +			};
> +		};
> +	};
> +};
> +
>   &gcc {
>   	protected-clocks = <GCC_QSPI_CORE_CLK>,
>   			   <GCC_QSPI_CORE_CLK_SRC>,
> @@ -490,6 +573,14 @@ &pm660_charger {
>   	status = "okay";
>   };
> 
> +&pm660_gpios {
> +	cam_vio_pin: cam-vio-state {
> +		pins = "gpio13";
> +		function = "normal";
> +		power-source = <0>;
> +	};
> +};
> +
>   &pm660_rradc {
>   	status = "okay";
>   };
> @@ -508,6 +599,12 @@ led-0 {
>   };
> 
>   &pm660l_gpios {
> +	cam_front_ldo_pin: cam-front-state {
> +		pins = "gpio4";
> +		function = "normal";
> +		power-source = <0>;
> +	};
> +
>   	vol_up_pin: vol-up-state {
>   		pins = "gpio7";
>   		function = "normal";
> @@ -547,6 +644,13 @@ &sdhc_1 {
>   &tlmm {
>   	gpio-reserved-ranges = <0 4>, <81 4>;
> 
> +	cam_front_default: cam-front-default-state {
> +		pins = "gpio9";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
>   	panel_default: panel-default-state {
>   		te-pins {
>   			pins = "gpio10";
> --
> 2.52.0
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

