Return-Path: <linux-media+bounces-40100-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BD1B29C2A
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 10:28:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFF571892F60
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 08:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1497E301472;
	Mon, 18 Aug 2025 08:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FFsv9ZC6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB2F22F01;
	Mon, 18 Aug 2025 08:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755505604; cv=none; b=jy6hDaGgwuGBuCMZjfefYs4G4EJERIngIQ+CSD1oYUsndFy3mgfIx1V3CfrjQyXQahjE1s70PaErN65f1Uoh+ZBW0ju2AiJmnEW+VxOiezLFXHVwEmF7yz77qkl+zUdxwTf4YLuEYon4htQPUFyLGfQIkZnnso66IqI49J697bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755505604; c=relaxed/simple;
	bh=Vm8cWvKgpjFAKW99yrjp0C+LOL3fJWGgMbbY76Ih1RY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oXrLZ5wf/x0eZ4MuF8LOpJdCTLsA2YbQC62R5fXnguH3th7+lG0p67v12LWOj518BQXcLI9lgsU5HYSx8laYoVyTo+m7vElxua0VPp5VsOGTk5rKLfdqNskLM1+yShHjv9eFgLbPBVlU9xZscx242DPzPlp036ww85RJwnLoWH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FFsv9ZC6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A772C4CEED;
	Mon, 18 Aug 2025 08:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755505602;
	bh=Vm8cWvKgpjFAKW99yrjp0C+LOL3fJWGgMbbY76Ih1RY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FFsv9ZC6MF/RWiBx47eLyFD9CBfESKS/m7zZ90r6SnLHCScdp3+iudxbEnezGPWBd
	 AsXQVeOqpXCQ61elmgUi8/QCp8aRkXglnamVhsmqxty9ZFtWIZFlWckKle8rgMXcKL
	 xc77cPQ6M5AwyqFnc+tjARmMhuMpVFHH7eRSBa16aE9IOI3lJWilOdksaoTCGMaQEk
	 nFsiU0jWFZkgY0/MY73Gp0cplRLHmTl3FaCpBvKRaT9Ubjm2pZgY7MYBXSS/oe4JTa
	 WdIMwgcflSTu1e+cMbze+VRaUA12e3AGoVmNothVIG6NUHfAwdZruIB39D4aCoLFwJ
	 xr5R9VC6Y5i9A==
Message-ID: <1919de68-99ea-47f7-b3d2-cae4611f9c52@kernel.org>
Date: Mon, 18 Aug 2025 10:26:34 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/12] arm64: dts: fsd: Add CSI nodes
To: Inbaraj E <inbaraj.e@samsung.com>, mturquette@baylibre.com,
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 s.nawrocki@samsung.com, s.hauer@pengutronix.de, shawnguo@kernel.org,
 cw00.choi@samsung.com, rmfrfs@gmail.com, laurent.pinchart@ideasonboard.com,
 martink@posteo.de, mchehab@kernel.org, linux-fsd@tesla.com, will@kernel.org,
 catalin.marinas@arm.com, pankaj.dubey@samsung.com, shradha.t@samsung.com,
 ravi.patel@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alim.akhtar@samsung.com,
 linux-samsung-soc@vger.kernel.org, kernel@puri.sm, kernel@pengutronix.de,
 festevam@gmail.com, linux-media@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
 <CGME20250814141019epcas5p2f957b934d5b60d4649cf9c6abd6969d5@epcas5p2.samsung.com>
 <20250814140943.22531-5-inbaraj.e@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250814140943.22531-5-inbaraj.e@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/08/2025 16:09, Inbaraj E wrote:
> There is a csi dma and csis interface that bundles together to allow

CSI DMA?
What is CSIS?

> csi2 capture.

CSI2?

> 
> Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
> ---
>  arch/arm64/boot/dts/tesla/fsd-evb.dts |  96 +++++
>  arch/arm64/boot/dts/tesla/fsd.dtsi    | 552 ++++++++++++++++++++++++++
>  2 files changed, 648 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/tesla/fsd-evb.dts b/arch/arm64/boot/dts/tesla/fsd-evb.dts
> index 9ff22e1c8723..dcc9a138cdb9 100644
> --- a/arch/arm64/boot/dts/tesla/fsd-evb.dts
> +++ b/arch/arm64/boot/dts/tesla/fsd-evb.dts
> @@ -130,3 +130,99 @@ &serial_0 {
>  &ufs {
>  	status = "okay";
>  };
> +
> +&mipicsis0 {
> +	status = "okay";
> +};
> +
> +&mipicsis1 {
> +	status = "okay";
> +};
> +
> +&mipicsis2 {
> +	status = "okay";
> +};
> +
> +&mipicsis3 {
> +	status = "okay";
> +};
> +
> +&mipicsis4 {
> +	status = "okay";
> +};
> +
> +&mipicsis5 {
> +	status = "okay";
> +};
> +
> +&mipicsis6 {
> +	status = "okay";
> +};
> +
> +&mipicsis7 {
> +	status = "okay";
> +};
> +
> +&mipicsis8 {
> +	status = "okay";
> +};
> +
> +&mipicsis9 {
> +	status = "okay";
> +};
> +
> +&mipicsis10 {
> +	status = "okay";
> +};
> +
> +&mipicsis11 {
> +	status = "okay";
> +};
> +
> +&csis0 {
> +	status = "okay";
> +};
> +
> +&csis1 {
> +	status = "okay";
> +};
> +
> +&csis2 {
> +	status = "okay";
> +};
> +
> +&csis3 {
> +	status = "okay";
> +};
> +
> +&csis4 {
> +	status = "okay";
> +};
> +
> +&csis5 {
> +	status = "okay";
> +};
> +
> +&csis6 {
> +	status = "okay";
> +};
> +
> +&csis7 {
> +	status = "okay";
> +};
> +
> +&csis8 {
> +	status = "okay";
> +};
> +
> +&csis9 {
> +	status = "okay";
> +};
> +
> +&csis10 {
> +	status = "okay";
> +};
> +
> +&csis11 {
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi b/arch/arm64/boot/dts/tesla/fsd.dtsi
> index a5ebb3f9b18f..a83503e9c502 100644
> --- a/arch/arm64/boot/dts/tesla/fsd.dtsi
> +++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
> @@ -493,6 +493,558 @@ clock_mfc: clock-controller@12810000 {
>  			clock-names = "fin_pll";
>  		};
>  
> +		mipicsis0: mipi-csis@12640000 {

Messed ordering. See DTS coding style.

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

What is csis?

> +			compatible = "tesla,fsd-mipi-csi2";
> +			reg = <0x0 0x12640000 0x0 0x124>;
> +			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clock_csi CAM_CSI0_0_IPCLKPORT_I_ACLK>,
> +				<&clock_csi CAM_CSI0_0_IPCLKPORT_I_PCLK>;
> +			clock-names = "aclk", "pclk";
> +			samsung,syscon-csis = <&sysreg_cam 0x40c>;
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					mipi_csis_0_out: endpoint {
> +						remote-endpoint = <&csis_in_0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		csis0: csis@12641000 {
> +			compatible = "tesla,fsd-csis-media";
> +			reg = <0x0 0x12641000 0x0 0x44c>;
> +			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clock_csi CAM_CSI0_0_IPCLKPORT_I_ACLK>,
> +				<&clock_csi CAM_CSI0_0_IPCLKPORT_I_PCLK>,
> +				<&clock_csi CAM_CSI_PLL>;
> +			clock-names = "aclk", "pclk", "pll";
> +			iommus = <&smmu_isp 0x0 0x0>;
> +			status = "disabled";
> +
> +			port {
> +				csis_in_0: endpoint {
> +					remote-endpoint = <&mipi_csis_0_out>;
> +				};
> +			};
> +		};
> +
> +		mipicsis1: mipi-csis@12650000 {
> +			compatible = "tesla,fsd-mipi-csi2";
> +			reg = <0x0 0x12650000 0x0 0x124>;
> +			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clock_csi CAM_CSI0_1_IPCLKPORT_I_ACLK>,
> +				<&clock_csi CAM_CSI0_1_IPCLKPORT_I_PCLK>;
> +			clock-names = "aclk", "pclk";
> +			samsung,syscon-csis = <&sysreg_cam 0x40c>;
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					mipi_csis_1_out: endpoint {
> +						remote-endpoint = <&csis_in_1>;
> +					};
> +				};
> +			};
> +		};
> +
> +		csis1: csis@12651000 {
> +			compatible = "tesla,fsd-csis-media";
> +			reg = <0x0 0x12651000 0x0 0x44c>;
> +			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clock_csi CAM_CSI0_1_IPCLKPORT_I_ACLK>,
> +				<&clock_csi CAM_CSI0_1_IPCLKPORT_I_PCLK>,
> +				<&clock_csi CAM_CSI_PLL>;
> +			clock-names = "aclk", "pclk", "pll";
> +			iommus = <&smmu_isp 0x0 0x0>;
> +			status = "disabled";
> +
> +			port {
> +				csis_in_1: endpoint {
> +					remote-endpoint = <&mipi_csis_1_out>;
> +				};
> +			};
> +		};
> +
> +		mipicsis2: mipi-csis@12660000 {
> +			compatible = "tesla,fsd-mipi-csi2";
> +			reg = <0x0 0x12660000 0x0 0x124>;
> +			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clock_csi CAM_CSI0_2_IPCLKPORT_I_ACLK>,
> +				<&clock_csi CAM_CSI0_2_IPCLKPORT_I_PCLK>;
> +			clock-names = "aclk", "pclk";
> +			samsung,syscon-csis = <&sysreg_cam 0x40c>;
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					mipi_csis_2_out: endpoint {
> +						remote-endpoint = <&csis_in_2>;
> +					};
> +				};
> +			};
> +		};
> +
> +		csis2: csis@12661000 {


What is CSIS? Seems like copy paste from other Samsung code, but isn't
this just CSI?

What is the meaning of this CSIS acronym?


Best regards,
Krzysztof

