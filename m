Return-Path: <linux-media+bounces-23675-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E69E69F5A16
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 00:06:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88FE97A33E1
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 23:06:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CBEB1F9F5E;
	Tue, 17 Dec 2024 23:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mna7PDae"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB49813B792;
	Tue, 17 Dec 2024 23:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734476791; cv=none; b=DNy3XbKgUb9y9pYMMOR5oTFHEiT1ogzgbcXIX1ltQ9jwry9yQ62RY/oBvghwI589A4fdLy3VFj+SUL0qcqWrSg+JEVqtbdLA614W9NYKKMXd/xA7niFJOSitZZCgRVisJe9tTU5oiWT3hWJYGq4Qe1MZwUXeqNBNyhdT9SWQvA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734476791; c=relaxed/simple;
	bh=0SR1eMuWszQEl/NyWvu2rOOq2VFDutiwKJXP8t+stqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f2BPzO2pGV+LC6fc70HVg5EAuOHceLKSYftsivM1S8wnZQNN8L/7q4ZOLPPF2PP9W1c50SGKPa7KklNx9n6DMfJyyj2llOFy1Noy+AMyFPOyeo5Hr1dFOolTqn1wXJyV7mtzomYDdWvgcB1FmG9svuo5wcdGXNO9iVCuSPjz8kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mna7PDae; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-844e161a8b4so181523839f.0;
        Tue, 17 Dec 2024 15:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734476789; x=1735081589; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Acq93aifQWo1Pdc34YKlwCnrsHa49zJ1ORbrZ18IDTc=;
        b=Mna7PDae2MW0N1KnMjvXmA+e+q00lA11Ju6q9lHGlEt89UpAEGG/y+zu2SxCOzAGXU
         fGbraMmPs0tMVQbFbxyIXqiHv3lsJIycNZq7xPnyo9eGvhit7lfN6U0pKLHNIa08UAkU
         hSOd7Q2ftyqcqb3NZPqRcECaYzd9GgbT8+mBWN02bZYpW9Hb5tYs+0WC+OxMX3UsfFGd
         qV8o4zGIQ6zl9zqHFQZxFc3j4Xhnv5Q3Z447fYZkcs4vPvAYov8RI6HG0mSP7i8SGYpg
         7lk20yJIntthF6D4NfU5CYkLzl7RO/1Y0pVNXJfJ9lfSa8v0NuWjU2KCkTgPrwYF8hnq
         Z6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734476789; x=1735081589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Acq93aifQWo1Pdc34YKlwCnrsHa49zJ1ORbrZ18IDTc=;
        b=Aljo/5TUvFsBu1IKUz13YSxgcvxZuRCzxeWEOgS72TCqz4C8Wu9moMa/JAlU6zbDNy
         g/MrHXRaLVyhcc5CcBqiYhbDvjiJ519pietTs/TGQRI/x0OBcvrDfRy/A8XMtl3xjp2j
         K8zyU9fi9BLR6a4ia79+dhHAPQBHMZK3NrFscu20D7nsAsACBabFgPM5MgrWLiXu1Few
         wdIP2cM+p9WyMgNhuFM9ZMz+qfEb4z6xVHRvqU1F8tLz8V5H8H+mO7q5wm5CDnuCuSuk
         XqU8fdn6gOsGJfWLXiWE/bKCRD7ClKqsKIK0EK5vsb1UUv2pOUdVo2wxppalBU/ijNAl
         uHuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWRSE/85acW6o4UAudFUqpXy+0RYi9gkizO36wtAWVcxlaN03O5XnPLlBiiBokNLR07XlQOTsED3ppMJo=@vger.kernel.org, AJvYcCVAgYBhK1+CPZazqHU99ptSmPjMDPttSu6pegIDaIzZzBSPwUnGQ/RLmPFkvHfz3/HOUCJRXN2MxNwBz9NdNw==@vger.kernel.org, AJvYcCWMmfVpCygFpquVBTh5J2E+m92jlrbf35waJsfVhmK8CclgU1W1/QNBo4H/KCnRU/AzpAs5aVio6ST1@vger.kernel.org, AJvYcCXvhabatZriY5cU5gVmzpBhwYKm22GH38/fyCwxI4h1+yBwUtVKlymfEhxIvIDO7uLmONhZe60KtK9Z@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6Qub5DCSzEbHfLY4fgGCDOixVM1ZO1ldBjXLBAYkFlOzjZcmg
	gALBAvpq3q0AsZcNowHHgmlhaL1aN8+cO+drMdTIcDzSW0gaIxau/L96p1j1
X-Gm-Gg: ASbGncsm3MVvnTeSpe81WDWGNFLfM21BX9y9CSetE8EnzMbQhLoVNWQdKnOieOEdr5Z
	oKUJaq05o2EArzQ1YOLzTo4PWbqRAV+GR4jOJaPpLDj/mBUjfhEj7kWGILrgN+7ldvuJcsH9od7
	VIkG+sa+rbIyY6i1f3ZqULsSJ38USFY+zMhayMRuRKK+luZ7IRi046Nt9AuoPZ4e8GtYUXCp23U
	CAKH0EIrHSco8cU9WjsXJdaQEZqOsWADL+rAv8azyqy
X-Google-Smtp-Source: AGHT+IG8aF+vlYBwPDvLYSan3pGN/J1r/uqKSbLcpnikuVHYCGV66vb7DlPCjIf/uUAi8OGL7F/Mag==
X-Received: by 2002:a05:6602:1645:b0:83a:a305:d9ee with SMTP id ca18e2360f4ac-847585d78abmr86754639f.12.1734476788829;
        Tue, 17 Dec 2024 15:06:28 -0800 (PST)
Received: from localhost ([2607:fea8:52a3:d200::b824])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-844f6257e41sm200273339f.13.2024.12.17.15.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 15:06:27 -0800 (PST)
Date: Tue, 17 Dec 2024 18:06:24 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v8 5/5] arm64: dts: qcom: sdm670: add camss and cci
Message-ID: <Z2ID8BrR9f38iy3s@radian>
References: <20241216223019.70155-8-mailingradian@gmail.com>
 <20241216223019.70155-13-mailingradian@gmail.com>
 <565d14e1-1478-4a60-8f70-a76a732cde97@linaro.org>
 <Z2HeS7mZ976l_Mrw@radian>
 <e9dc1a6f-156b-40aa-9209-2010464d54ed@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9dc1a6f-156b-40aa-9209-2010464d54ed@linaro.org>

On Tue, Dec 17, 2024 at 11:34:20PM +0200, Vladimir Zapolskiy wrote:
> On 12/17/24 22:25, Richard Acayan wrote:
> > On Tue, Dec 17, 2024 at 09:31:50AM +0200, Vladimir Zapolskiy wrote:
> > > Hi Richard.
> > > 
> > > On 12/17/24 00:30, Richard Acayan wrote:
> > > > Add the camera subsystem and CCI used to interface with cameras on the
> > > > Snapdragon 670.
> > > > 
> > > > Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> > > > Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > > > ---
> > > >    arch/arm64/boot/dts/qcom/sdm670.dtsi | 185 +++++++++++++++++++++++++++
> > > >    1 file changed, 185 insertions(+)
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> > > > index 328096b91126..d4e1251ada04 100644
> > > > --- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
> > > > +++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> > > > @@ -6,6 +6,7 @@
> > > >     * Copyright (c) 2022, Richard Acayan. All rights reserved.
> > > >     */
> > > > +#include <dt-bindings/clock/qcom,camcc-sdm845.h>
> > > >    #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
> > > >    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
> > > >    #include <dt-bindings/clock/qcom,rpmh.h>
> > > > @@ -1168,6 +1169,34 @@ tlmm: pinctrl@3400000 {
> > > >    			gpio-ranges = <&tlmm 0 0 151>;
> > > >    			wakeup-parent = <&pdc>;
> > > > +			cci0_default: cci0-default-state {
> > > > +				pins = "gpio17", "gpio18";
> > > > +				function = "cci_i2c";
> > > > +				drive-strength = <2>;
> > > > +				bias-pull-up;
> > > > +			};
> > > > +
> > > > +			cci0_sleep: cci0-sleep-state {
> > > > +				pins = "gpio17", "gpio18";
> > > > +				function = "cci_i2c";
> > > > +				drive-strength = <2>;
> > > > +				bias-pull-down;
> > > > +			};
> > > > +
> > > > +			cci1_default: cci1-default-state {
> > > > +				pins = "gpio19", "gpio20";
> > > > +				function = "cci_i2c";
> > > > +				drive-strength = <2>;
> > > > +				bias-pull-up;
> > > > +			};
> > > > +
> > > > +			cci1_sleep: cci1-sleep-state {
> > > > +				pins = "gpio19", "gpio20";
> > > > +				function = "cci_i2c";
> > > > +				drive-strength = <2>;
> > > > +				bias-pull-down;
> > > > +			};
> > > > +
> > > >    			qup_i2c0_default: qup-i2c0-default-state {
> > > >    				pins = "gpio0", "gpio1";
> > > >    				function = "qup0";
> > > > @@ -1400,6 +1429,162 @@ spmi_bus: spmi@c440000 {
> > > >    			#interrupt-cells = <4>;
> > > >    		};
> > > > +		cci: cci@ac4a000 {
> > > > +			compatible = "qcom,sdm670-cci", "qcom,msm8996-cci";
> > > > +			#address-cells = <1>;
> > > > +			#size-cells = <0>;
> > > > +
> > > > +			reg = <0 0x0ac4a000 0 0x4000>;
> > > > +			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
> > > > +			power-domains = <&camcc TITAN_TOP_GDSC>;
> > > > +
> > > > +			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> > > > +				 <&camcc CAM_CC_SOC_AHB_CLK>,
> > > > +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> > > > +				 <&camcc CAM_CC_CCI_CLK>;
> > > > +			clock-names = "camnoc_axi",
> > > > +				      "soc_ahb",
> > > > +				      "cpas_ahb",
> > > > +				      "cci";
> > > > +
> > > > +			pinctrl-names = "default", "sleep";
> > > > +			pinctrl-0 = <&cci0_default &cci1_default>;
> > > > +			pinctrl-1 = <&cci0_sleep &cci1_sleep>;
> > > > +
> > > > +			status = "disabled";
> > > > +
> > > > +			cci_i2c0: i2c-bus@0 {
> > > > +				reg = <0>;
> > > > +				clock-frequency = <1000000>;
> > > > +				#address-cells = <1>;
> > > > +				#size-cells = <0>;
> > > > +			};
> > > > +
> > > > +			cci_i2c1: i2c-bus@1 {
> > > > +				reg = <1>;
> > > > +				clock-frequency = <1000000>;
> > > > +				#address-cells = <1>;
> > > > +				#size-cells = <0>;
> > > > +			};
> > > > +		};
> > > > +
> > > > +		camss: camera-controller@acb3000 {
> > > 
> > > Wasn't it agreed recently to have 'isp' as a generic device name for CAMSS IP?
> > 
> > Yeah, will change.
> > 
> > > 
> > > > +			compatible = "qcom,sdm670-camss";
> > > > +			reg = <0 0x0acb3000 0 0x1000>,
> > > > +			      <0 0x0acba000 0 0x1000>,
> > > > +			      <0 0x0acc8000 0 0x1000>,
> > > > +			      <0 0x0ac65000 0 0x1000>,
> > > > +			      <0 0x0ac66000 0 0x1000>,
> > > > +			      <0 0x0ac67000 0 0x1000>,
> > > > +			      <0 0x0acaf000 0 0x4000>,
> > > > +			      <0 0x0acb6000 0 0x4000>,
> > > > +			      <0 0x0acc4000 0 0x4000>;
> > > > +			reg-names = "csid0",
> > > > +				    "csid1",
> > > > +				    "csid2",
> > > > +				    "csiphy0",
> > > > +				    "csiphy1",
> > > > +				    "csiphy2",
> > > > +				    "vfe0",
> > > > +				    "vfe1",
> > > > +				    "vfe_lite";
> > > > +
> > > > +			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> > > > +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> > > > +				 <&camcc CAM_CC_IFE_0_CSID_CLK>,
> > > > +				 <&camcc CAM_CC_IFE_1_CSID_CLK>,
> > > > +				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
> > > > +				 <&camcc CAM_CC_CSIPHY0_CLK>,
> > > > +				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> > > > +				 <&camcc CAM_CC_CSIPHY1_CLK>,
> > > > +				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> > > > +				 <&camcc CAM_CC_CSIPHY2_CLK>,
> > > > +				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> > > > +				 <&gcc GCC_CAMERA_AHB_CLK>,
> > > > +				 <&gcc GCC_CAMERA_AXI_CLK>,
> > > > +				 <&camcc CAM_CC_SOC_AHB_CLK>,
> > > > +				 <&camcc CAM_CC_IFE_0_CLK>,
> > > > +				 <&camcc CAM_CC_IFE_0_AXI_CLK>,
> > > > +				 <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
> > > > +				 <&camcc CAM_CC_IFE_1_CLK>,
> > > > +				 <&camcc CAM_CC_IFE_1_AXI_CLK>,
> > > > +				 <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
> > > > +				 <&camcc CAM_CC_IFE_LITE_CLK>,
> > > > +				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>;
> > > > +			clock-names = "camnoc_axi",
> > > > +				      "cpas_ahb",
> > > > +				      "csi0",
> > > > +				      "csi1",
> > > > +				      "csi2",
> > > > +				      "csiphy0",
> > > > +				      "csiphy0_timer",
> > > > +				      "csiphy1",
> > > > +				      "csiphy1_timer",
> > > > +				      "csiphy2",
> > > > +				      "csiphy2_timer",
> > > > +				      "gcc_camera_ahb",
> > > > +				      "gcc_camera_axi",
> > > > +				      "soc_ahb",
> > > > +				      "vfe0",
> > > > +				      "vfe0_axi",
> > > > +				      "vfe0_cphy_rx",
> > > > +				      "vfe1",
> > > > +				      "vfe1_axi",
> > > > +				      "vfe1_cphy_rx",
> > > > +				      "vfe_lite",
> > > > +				      "vfe_lite_cphy_rx";
> > > > +
> > > > +			interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
> > > > +				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
> > > > +				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
> > > > +				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> > > > +				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> > > > +				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> > > > +				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
> > > > +				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
> > > > +				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>;
> > > > +			interrupt-names = "csid0",
> > > > +					  "csid1",
> > > > +					  "csid2",
> > > > +					  "csiphy0",
> > > > +					  "csiphy1",
> > > > +					  "csiphy2",
> > > > +					  "vfe0",
> > > > +					  "vfe1",
> > > > +					  "vfe_lite";
> > > > +
> > > > +			iommus = <&apps_smmu 0x808 0x0>,
> > > > +				 <&apps_smmu 0x810 0x8>,
> > > > +				 <&apps_smmu 0xc08 0x0>,
> > > > +				 <&apps_smmu 0xc10 0x8>;
> > > > +
> > > > +			power-domains = <&camcc IFE_0_GDSC>,
> > > > +					<&camcc IFE_1_GDSC>,
> > > > +					<&camcc TITAN_TOP_GDSC>;
> > > > +			power-domain-names = "ife0",
> > > > +					     "ife1",
> > > > +					     "top";
> > > > +
> > > > +			status = "disabled";
> > > > +
> > > > +			ports {
> > > > +				#address-cells = <1>;
> > > > +				#size-cells = <0>;
> > > > +
> > > > +				camss_port0: port@0 {
> > > > +					reg = <0>;
> > > > +				};
> > > > +
> > > > +				camss_port1: port@1 {
> > > > +					reg = <1>;
> > > > +				};
> > > > +
> > > > +				camss_port2: port@2 {
> > > 
> > > Likely labels to ports are excessive here, please remove them.
> > 
> > How would you imagine connecting a camera to the ports, then? For MDSS,
> > there's a label for the endpoint (mdss_dsi0_out) which the device DTS
> > can then reference:
> > 
> > 	&mdss_dsi0_out {
> > 		remote-endpoint = <&panel_in>;
> > 		data-lanes = <0 1 2 3>;
> > 	};
> > 
> > For CAMSS, the port labels would be used like so:
> > 
> > 	&camss_port1 {
> > 		camss_endpoint1: endpoint {
> > 			clock-lanes = <7>;
> > 			data-lanes = <0 1 2 3>;
> > 			remote-endpoint = <&cam_front_endpoint>;
> > 		};
> > 	};
> > 
> > Without the labels, the connection might look something like:
> > 
> 
> Even if you insist on moving endpoints out of &camss, then why do
> you add port labels? Unavoidably you do have endpoint labels, so
> it's non-obvious why the version above is better than the next one:
> 
> 	&camss_endpoint1 {
> 		clock-lanes = <7>;
> 		data-lanes = <0 1 2 3>;
> 		remote-endpoint = <&cam_front_endpoint>;
> 	};
> 
> Minus two lines of code, minus one label. Port labels are not needed.

Thanks for having me look into this.

In DTSI:

	ports {
		#address-cells = <1>;
		#size-cells = <0>;

		camss_port0: port@0 {
			reg = <0>;

			camss_endpoint0: endpoint {
			};
		};

		camss_port1: port@1 {
			reg = <1>;

			camss_endpoint1: endpoint {
			};
		};

		camss_port2: port@2 {
			reg = <2>;

			camss_endpoint2: endpoint {
			};
		};
	};

The example above doesn't work as-is.

	[   15.387215] qcom-camss acb3000.camera-controller: Cannot get remote parent
	[   15.387604] qcom-camss acb3000.camera-controller: probe with driver qcom-camss failed with error -22

However, the camss_of_parse_ports function has a way to make it work,
even if all endpoint nodes are present.

In DTSI:

	ports {
		#address-cells = <1>;
		#size-cells = <0>;

		camss_port0: port@0 {
			reg = <0>;

			camss_endpoint0: endpoint {
				status = "disabled";
			};
		};

		camss_port1: port@1 {
			reg = <1>;

			camss_endpoint1: endpoint {
				status = "disabled";
			};
		};

		camss_port2: port@2 {
			reg = <2>;

			camss_endpoint2: endpoint {
				status = "disabled";
			};
		};
	};

In DTS:

 	&camss_endpoint1 {
 		clock-lanes = <7>;
 		data-lanes = <0 1 2 3>;
 		remote-endpoint = <&cam_front_endpoint>;
		status = "okay";
 	};

I didn't know how to make the working example.

