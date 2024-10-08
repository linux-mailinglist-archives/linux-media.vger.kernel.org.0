Return-Path: <linux-media+bounces-19264-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC7299507A
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 15:42:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2893F1C24D1F
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 13:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B1FD1DF27A;
	Tue,  8 Oct 2024 13:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aA4B8JW1"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CF61D362B;
	Tue,  8 Oct 2024 13:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728394965; cv=none; b=H0ALcLSbNd6rfNfpAxxXUyClTq5emn5ZVysLpW0OysS2rjzyd6aMLnRMhWTyfpRtTAyCqzkG6q1NEbSf00kUU58Wu0w0wclNIJbE+euMuL8RQEANV5rjRHU3udfsVGAH/Xc+xzVgUswfc9WSgKBAmFKQqu5Ms1ZBWBhVwxkw720=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728394965; c=relaxed/simple;
	bh=CrrE8VhPKL8JLO/ea83GTqyPPT8hwwbopSCwHs9vxzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sXI9Yepkj5ST3aslVeDVGV57+WToRriazYfb+g62KewXykkI6d1x0q6AjlwEEEOfc3lQrPK9kX4814JsK1+w8pi0Xs7g0J66cpfmATvsPcqenaTkT0ovpcIJLvPLWQb/dMpD5eFEJ8DiR9QeqDhJKi/0mWs455NpHo3FbldI60I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aA4B8JW1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAF92C4CEC7;
	Tue,  8 Oct 2024 13:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728394964;
	bh=CrrE8VhPKL8JLO/ea83GTqyPPT8hwwbopSCwHs9vxzQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aA4B8JW1TDPbtmvDjxpLHDPhNay/cJbOTqMzrqPmFxo35B23hYxkQdcC0kiELZ5n2
	 6DZvGz1YhyQSYOg8B23J6HMO/bwJI7VbZ73XZUogLZdaWws3v+OK7yGQXCLwDNMvL7
	 F/egj1n4KJdSXlFM4Nv2Mql59sNzjM8qH4IXw62S87aI9ULalK3JQ6k4tcNMaNoKe2
	 mgkhSyKye8Tg/wMvKjPCSawfFX/TyN5iARrZOOSzZQvr6lqiNnm1530h8X8/B0fJ2v
	 e1ZB5XRUk/wbwf+i24sJp6K3jQ9guCD/vyd9ljsPw+VioAB++t8Ax6nVJQ+xIenI9m
	 gstNnky+HOHOQ==
Date: Tue, 8 Oct 2024 15:42:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Hugues Fruchet <hugues.fruchet@foss.st.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 15/15] arm64: dts: st: enable imx335/csi/dcmipp pipeline
 on stm32mp257f-ev1
Message-ID: <fgxjk5tikvd5vihlzslovhlpy5xbbgnr3kywkvkd62ppx6ttm7@2rbaqvllyb25>
References: <20241008-csi_dcmipp_mp25-v1-0-e3fd0ed54b31@foss.st.com>
 <20241008-csi_dcmipp_mp25-v1-15-e3fd0ed54b31@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241008-csi_dcmipp_mp25-v1-15-e3fd0ed54b31@foss.st.com>

On Tue, Oct 08, 2024 at 01:18:17PM +0200, Alain Volmat wrote:
> Enable the camera pipeline with a imx335 sensor connected to the
> dcmipp via the csi interface.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 87 ++++++++++++++++++++++++++++++
>  1 file changed, 87 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
> index 214191a8322b..599af4801d82 100644
> --- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
> +++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
> @@ -27,6 +27,38 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	clocks {
> +		clk_ext_camera: clk-ext-camera {
> +			#clock-cells = <0>;
> +			compatible = "fixed-clock";
> +			clock-frequency = <24000000>;
> +		};
> +	};
> +
> +	imx335_2v9: imx335-2v9 {

Please use name for all fixed regulators which matches current format
recommendation: 'regulator-[0-9]v[0-9]'
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml?h=v6.11-rc1#n46

> +		compatible = "regulator-fixed";
> +		regulator-name = "imx335-avdd";
> +		regulator-min-microvolt = <2900000>;
> +		regulator-max-microvolt = <2900000>;
> +		regulator-always-on;
> +	};
> +
> +	imx335_1v8: imx335-1v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "imx335-ovdd";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-always-on;
> +	};
> +
> +	imx335_1v2: imx335-1v2 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "imx335-dvdd";
> +		regulator-min-microvolt = <1200000>;
> +		regulator-max-microvolt = <1200000>;
> +		regulator-always-on;
> +	};
> +
>  	memory@80000000 {
>  		device_type = "memory";
>  		reg = <0x0 0x80000000 0x1 0x0>;
> @@ -50,6 +82,40 @@ &arm_wdt {
>  	status = "okay";
>  };
>  
> +&csi {
> +	vdd-supply =  <&scmi_vddcore>;
> +	vdda18-supply = <&scmi_v1v8>;
> +	status = "okay";
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		port@0 {
> +			reg = <0>;
> +			csi_sink: endpoint {
> +				remote-endpoint = <&imx335_ep>;
> +				data-lanes = <0 1>;
> +				bus-type = <4>;
> +			};
> +		};
> +		port@1 {
> +			reg = <1>;
> +			csi_source: endpoint {
> +				remote-endpoint = <&dcmipp_0>;
> +			};
> +		};
> +	};
> +};
> +
> +&dcmipp {
> +	status = "okay";
> +	port {
> +		dcmipp_0: endpoint {
> +			remote-endpoint = <&csi_source>;
> +			bus-type = <4>;
> +		};
> +	};
> +};
> +
>  &ethernet2 {
>  	pinctrl-names = "default", "sleep";
>  	pinctrl-0 = <&eth2_rgmii_pins_a>;
> @@ -81,6 +147,27 @@ &i2c2 {
>  	i2c-scl-falling-time-ns = <13>;
>  	clock-frequency = <400000>;
>  	status = "okay";
> +
> +	imx335: imx335@1a {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +		compatible = "sony,imx335";
> +		reg = <0x1a>;
> +		clocks = <&clk_ext_camera>;
> +		avdd-supply = <&imx335_2v9>;
> +		ovdd-supply = <&imx335_1v8>;
> +		dvdd-supply = <&imx335_1v2>;
> +		reset-gpios = <&gpioi 7 (GPIO_ACTIVE_HIGH | GPIO_PUSH_PULL)>;
> +		powerdown-gpios = <&gpioi 0 (GPIO_ACTIVE_HIGH | GPIO_PUSH_PULL)>;
> +		status = "okay";

Why? Didi you disable it anywhere?

Best regards,
Krzysztof


