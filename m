Return-Path: <linux-media+bounces-23642-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D179F57A5
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 21:26:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA43B16EB4D
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 20:26:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D6761F9AA7;
	Tue, 17 Dec 2024 20:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eBhp4sS/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD0A14885B;
	Tue, 17 Dec 2024 20:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734467152; cv=none; b=uLprkcqPVHmW+/X8wjAwQz0KBO0tXVa1mTRNsBdoLCe92hehjM/kYAPfjKhAoaJv1IkB+/mD3TOE0tQPsHgVjMScHllfa5TCPCX5NJT9TFWeOAzjlKpE2cS/24KzNct9R6uytLDeOKZU0syT0y+pCNtsTWLw8+SVQKkFF/n1Wmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734467152; c=relaxed/simple;
	bh=gJu3mrSmNyAE419VQKa6EEmifFE5XEmum7/TLp1yvZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DjpUsGHXHAnNUqDAtqhCfNtpbjBNICExuK2wfDcXoTG46WETnuCq9m7Ckngj//e9kv9PuOhICYPWPhm9Vc0ZWH//3oPH54RGEVWJwJfdtmJfY6NzwwnTbcl5Er5WQz5Fld2Fou/Qbd3EM4eypbArYWy7taPhndpK13E3dLZBP34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eBhp4sS/; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6d932b5081eso52435836d6.1;
        Tue, 17 Dec 2024 12:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734467149; x=1735071949; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AsQRwomI1GANSmgpDa7sqCPSYfEVOLz/ljhi+bRhKKY=;
        b=eBhp4sS/NG0UhdDi0p18KmZ8XCLIyGPhJOmnVxCVtgrGNLtuigx4ULBGTZ55diu1ri
         gETRIndG/3AEB1B5qUWx6gpJ1hHt3xsPinfUVXmMFySAgd9ZdXe3X81BlHVZJ+5kxXPf
         n62f73UBMTj+TPTdQzxp78ldlgolowFzo140S/HzkcI3+HvNrOsK/rGXGqeAO1hoST9E
         Ii+I6gFSkWerLxzAk3IOyFveXA7QM+FO/uXstkFQKoXW75XK5pbHHarg4v8bcHrJ1L8u
         Xp+3YCDQAWdVXaqvZo+TtnC/xtF8gn55JawEbACR2id5i2LrRNGrAFBlFUadZY6F7Yci
         eU6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734467149; x=1735071949;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AsQRwomI1GANSmgpDa7sqCPSYfEVOLz/ljhi+bRhKKY=;
        b=w2k55cCFs8WCsQ98iJQ0cJ6nGcPc5oGzgyq4EvlkVoTFP5i8gXhOZqN2ABVvquJLUB
         W+hDnEMa5gXZmMZkmdqWVn7yEudMMeN44xhJHPhI5H0/pvSy/VmCDg8aEUB3VzKtxFjd
         oheoQVCpbda96X5WxtAYg6nijVdVg6aMYFnsJHMAvrK8k8HoGVQaEBVQ8sF4wCvE+KFZ
         ocwsqbutDzpMVhHE3fmEKZaNAP9HW2Qg7clWMss4N2yOanAZw/w9PlaEzAyR0pnnWF32
         sA5+6TvP8lVI7LYtmim+CYO64MzV5LF7gNcShLVfYg19x84vqkQSTgPdpfidQYN7sBdR
         XwUA==
X-Forwarded-Encrypted: i=1; AJvYcCU4JzEJ7oXgRZmDLC7zLP7X9OaJF6ocDdoAOF/Id6erBXuRM/iu6039wzgmQcSyURYHmc5W6c7bBe/r@vger.kernel.org, AJvYcCVnjPqkr6ijmX4wla8wu0buh6+gF+ew9+4KGz0uyHLHypd8KMVdoJHKpI3fk2YLUuD2J/nKh9Je3H1OMdM=@vger.kernel.org, AJvYcCX1SkxVZoZ0dXC83OvP3Bqw8Fi6COCfeAAo0wvBvzz62vH2QnTL4+H8afzxxPiNrT/Gc6GQXId/wFIg@vger.kernel.org, AJvYcCX6jJH4D9bFVtG+5mIPPp0DQA+svYGv0VBQV9uu0eNyX+fQXaC8WgHfdUDa8eJLP8QBWmIJP45h+rD1OOLwKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWe2eqPZgNJubywn37IF0pENBuM8Y8DNQDOzSwcgPP6J4B3WBh
	f+pWb8fR6e4AP09LiWlv77fzQUHDBNeOZOlnNG9DSXhfJjRwDV9r
X-Gm-Gg: ASbGnct35tdA/LpVTyf9fkW1RcPqHIs4MYLoyR1P7+Fkd+M2O1QibV26RKPaQjXJ1O7
	E8uchI0b+1cLJbio/9z2jmSIfo8rxoiUOZdci0mRioJF6HWYn1C+8RNDaWj+jcIQEWdrwWl+PeV
	8nTtkWxpAmvSP4+yTdgLPLLUwTKX5Mj6ZEx+00rSZ4ql3xtftJYztiIAiicVTqCkQuS7ZrsCbpR
	xpTGozlobSStBNtDbKOJ0sBhIdRuh8mCg5TwaQ2PKDA
X-Google-Smtp-Source: AGHT+IEjSztKKuV1Xa08LXaxnXphJ01KGsvl/o5djHZsWw/+hPDMrEHJYTBKHRTLbzXy7wTcsd5NEw==
X-Received: by 2002:a05:6214:240d:b0:6d8:88fc:c0f4 with SMTP id 6a1803df08f44-6dd0923d0dcmr6717596d6.33.1734467149618;
        Tue, 17 Dec 2024 12:25:49 -0800 (PST)
Received: from localhost ([2607:fea8:52a3:d200::b824])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dccd3670a7sm42373476d6.86.2024.12.17.12.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 12:25:49 -0800 (PST)
Date: Tue, 17 Dec 2024 15:25:47 -0500
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
Message-ID: <Z2HeS7mZ976l_Mrw@radian>
References: <20241216223019.70155-8-mailingradian@gmail.com>
 <20241216223019.70155-13-mailingradian@gmail.com>
 <565d14e1-1478-4a60-8f70-a76a732cde97@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <565d14e1-1478-4a60-8f70-a76a732cde97@linaro.org>

On Tue, Dec 17, 2024 at 09:31:50AM +0200, Vladimir Zapolskiy wrote:
> Hi Richard.
> 
> On 12/17/24 00:30, Richard Acayan wrote:
> > Add the camera subsystem and CCI used to interface with cameras on the
> > Snapdragon 670.
> > 
> > Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> > Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > ---
> >   arch/arm64/boot/dts/qcom/sdm670.dtsi | 185 +++++++++++++++++++++++++++
> >   1 file changed, 185 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> > index 328096b91126..d4e1251ada04 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> > @@ -6,6 +6,7 @@
> >    * Copyright (c) 2022, Richard Acayan. All rights reserved.
> >    */
> > +#include <dt-bindings/clock/qcom,camcc-sdm845.h>
> >   #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
> >   #include <dt-bindings/clock/qcom,gcc-sdm845.h>
> >   #include <dt-bindings/clock/qcom,rpmh.h>
> > @@ -1168,6 +1169,34 @@ tlmm: pinctrl@3400000 {
> >   			gpio-ranges = <&tlmm 0 0 151>;
> >   			wakeup-parent = <&pdc>;
> > +			cci0_default: cci0-default-state {
> > +				pins = "gpio17", "gpio18";
> > +				function = "cci_i2c";
> > +				drive-strength = <2>;
> > +				bias-pull-up;
> > +			};
> > +
> > +			cci0_sleep: cci0-sleep-state {
> > +				pins = "gpio17", "gpio18";
> > +				function = "cci_i2c";
> > +				drive-strength = <2>;
> > +				bias-pull-down;
> > +			};
> > +
> > +			cci1_default: cci1-default-state {
> > +				pins = "gpio19", "gpio20";
> > +				function = "cci_i2c";
> > +				drive-strength = <2>;
> > +				bias-pull-up;
> > +			};
> > +
> > +			cci1_sleep: cci1-sleep-state {
> > +				pins = "gpio19", "gpio20";
> > +				function = "cci_i2c";
> > +				drive-strength = <2>;
> > +				bias-pull-down;
> > +			};
> > +
> >   			qup_i2c0_default: qup-i2c0-default-state {
> >   				pins = "gpio0", "gpio1";
> >   				function = "qup0";
> > @@ -1400,6 +1429,162 @@ spmi_bus: spmi@c440000 {
> >   			#interrupt-cells = <4>;
> >   		};
> > +		cci: cci@ac4a000 {
> > +			compatible = "qcom,sdm670-cci", "qcom,msm8996-cci";
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +
> > +			reg = <0 0x0ac4a000 0 0x4000>;
> > +			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
> > +			power-domains = <&camcc TITAN_TOP_GDSC>;
> > +
> > +			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> > +				 <&camcc CAM_CC_SOC_AHB_CLK>,
> > +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> > +				 <&camcc CAM_CC_CCI_CLK>;
> > +			clock-names = "camnoc_axi",
> > +				      "soc_ahb",
> > +				      "cpas_ahb",
> > +				      "cci";
> > +
> > +			pinctrl-names = "default", "sleep";
> > +			pinctrl-0 = <&cci0_default &cci1_default>;
> > +			pinctrl-1 = <&cci0_sleep &cci1_sleep>;
> > +
> > +			status = "disabled";
> > +
> > +			cci_i2c0: i2c-bus@0 {
> > +				reg = <0>;
> > +				clock-frequency = <1000000>;
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +			};
> > +
> > +			cci_i2c1: i2c-bus@1 {
> > +				reg = <1>;
> > +				clock-frequency = <1000000>;
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +			};
> > +		};
> > +
> > +		camss: camera-controller@acb3000 {
> 
> Wasn't it agreed recently to have 'isp' as a generic device name for CAMSS IP?

Yeah, will change.

> 
> > +			compatible = "qcom,sdm670-camss";
> > +			reg = <0 0x0acb3000 0 0x1000>,
> > +			      <0 0x0acba000 0 0x1000>,
> > +			      <0 0x0acc8000 0 0x1000>,
> > +			      <0 0x0ac65000 0 0x1000>,
> > +			      <0 0x0ac66000 0 0x1000>,
> > +			      <0 0x0ac67000 0 0x1000>,
> > +			      <0 0x0acaf000 0 0x4000>,
> > +			      <0 0x0acb6000 0 0x4000>,
> > +			      <0 0x0acc4000 0 0x4000>;
> > +			reg-names = "csid0",
> > +				    "csid1",
> > +				    "csid2",
> > +				    "csiphy0",
> > +				    "csiphy1",
> > +				    "csiphy2",
> > +				    "vfe0",
> > +				    "vfe1",
> > +				    "vfe_lite";
> > +
> > +			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> > +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> > +				 <&camcc CAM_CC_IFE_0_CSID_CLK>,
> > +				 <&camcc CAM_CC_IFE_1_CSID_CLK>,
> > +				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
> > +				 <&camcc CAM_CC_CSIPHY0_CLK>,
> > +				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> > +				 <&camcc CAM_CC_CSIPHY1_CLK>,
> > +				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> > +				 <&camcc CAM_CC_CSIPHY2_CLK>,
> > +				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> > +				 <&gcc GCC_CAMERA_AHB_CLK>,
> > +				 <&gcc GCC_CAMERA_AXI_CLK>,
> > +				 <&camcc CAM_CC_SOC_AHB_CLK>,
> > +				 <&camcc CAM_CC_IFE_0_CLK>,
> > +				 <&camcc CAM_CC_IFE_0_AXI_CLK>,
> > +				 <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
> > +				 <&camcc CAM_CC_IFE_1_CLK>,
> > +				 <&camcc CAM_CC_IFE_1_AXI_CLK>,
> > +				 <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
> > +				 <&camcc CAM_CC_IFE_LITE_CLK>,
> > +				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>;
> > +			clock-names = "camnoc_axi",
> > +				      "cpas_ahb",
> > +				      "csi0",
> > +				      "csi1",
> > +				      "csi2",
> > +				      "csiphy0",
> > +				      "csiphy0_timer",
> > +				      "csiphy1",
> > +				      "csiphy1_timer",
> > +				      "csiphy2",
> > +				      "csiphy2_timer",
> > +				      "gcc_camera_ahb",
> > +				      "gcc_camera_axi",
> > +				      "soc_ahb",
> > +				      "vfe0",
> > +				      "vfe0_axi",
> > +				      "vfe0_cphy_rx",
> > +				      "vfe1",
> > +				      "vfe1_axi",
> > +				      "vfe1_cphy_rx",
> > +				      "vfe_lite",
> > +				      "vfe_lite_cphy_rx";
> > +
> > +			interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
> > +				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
> > +				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
> > +				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> > +				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> > +				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> > +				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
> > +				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
> > +				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>;
> > +			interrupt-names = "csid0",
> > +					  "csid1",
> > +					  "csid2",
> > +					  "csiphy0",
> > +					  "csiphy1",
> > +					  "csiphy2",
> > +					  "vfe0",
> > +					  "vfe1",
> > +					  "vfe_lite";
> > +
> > +			iommus = <&apps_smmu 0x808 0x0>,
> > +				 <&apps_smmu 0x810 0x8>,
> > +				 <&apps_smmu 0xc08 0x0>,
> > +				 <&apps_smmu 0xc10 0x8>;
> > +
> > +			power-domains = <&camcc IFE_0_GDSC>,
> > +					<&camcc IFE_1_GDSC>,
> > +					<&camcc TITAN_TOP_GDSC>;
> > +			power-domain-names = "ife0",
> > +					     "ife1",
> > +					     "top";
> > +
> > +			status = "disabled";
> > +
> > +			ports {
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +
> > +				camss_port0: port@0 {
> > +					reg = <0>;
> > +				};
> > +
> > +				camss_port1: port@1 {
> > +					reg = <1>;
> > +				};
> > +
> > +				camss_port2: port@2 {
> 
> Likely labels to ports are excessive here, please remove them.

How would you imagine connecting a camera to the ports, then? For MDSS,
there's a label for the endpoint (mdss_dsi0_out) which the device DTS
can then reference:

	&mdss_dsi0_out {
		remote-endpoint = <&panel_in>;
		data-lanes = <0 1 2 3>;
	};

For CAMSS, the port labels would be used like so:

	&camss_port1 {
		camss_endpoint1: endpoint {
			clock-lanes = <7>;
			data-lanes = <0 1 2 3>;
			remote-endpoint = <&cam_front_endpoint>;
		};
	};

Without the labels, the connection might look something like:

	&camss {
		status = "okay";

		// Modification of existing /soc/isp@acb3000/ports node
		ports {
			// Modification of existing /soc/isp@acb3000/ports/port@1 node
			port@1 {
				// New node
				camss_endpoint1: endpoint {
					clock-lanes = <7>;
					data-lanes = <0 1 2 3>;
					remote-endpoint = <&cam_front_endpoint>;
				};
			};
		};
	};

which I believe is not preferred.

