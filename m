Return-Path: <linux-media+bounces-46152-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 90674C2942E
	for <lists+linux-media@lfdr.de>; Sun, 02 Nov 2025 18:44:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 288B64E8BD3
	for <lists+linux-media@lfdr.de>; Sun,  2 Nov 2025 17:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F34522E11B9;
	Sun,  2 Nov 2025 17:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cKKwq5N2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC522DCC06;
	Sun,  2 Nov 2025 17:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762105463; cv=none; b=cKX0Rr1UCHXoFVSf1hQ63F7+mUx0Bqk+e80fub1jzzc+PGh7fUmyUcgNO1i+Cc+Of3JTYA7iHksUIOygp0faGqh0SRLchmPVKVarT3+eyqK5sZiGH47EkBA1mZnjIB1viRNZMoA0BTezwJT0XA5i5SBdDugYIJS/GK4ekwrDzEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762105463; c=relaxed/simple;
	bh=vpPR77XHjyDj+vV2L4Rrr9qMsTSvy7lHsQRPED9tUmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MdlgCgZ9jKmSGGhYhEFq/NBmHSNdxJq0hUTAU4iqTU2i/anclhDTk2ptWQPgumEE2m8kGjco8yn2f1E8qnZoLNY9CNxaoMNht7cbgOKKTVua6rsT324BBZVsNEJaOeQU4iQs759aRehoZ00K8ZiImhsbKenXoJzULPd3IHluPSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cKKwq5N2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBDFDC4CEF7;
	Sun,  2 Nov 2025 17:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762105462;
	bh=vpPR77XHjyDj+vV2L4Rrr9qMsTSvy7lHsQRPED9tUmo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cKKwq5N2dIEqb3ADpS3Jp403ShcNFRGMvjuMkNLOHPxkQyA+lQ7oFlaURygWld5Z3
	 XrbUOYqtLqfc5PD4ozONOj7pHfYXB4OTpDQbgKjq3U7i0LOBglYE+4TL0iiaLFJjrb
	 /Z4Yn8rkR1K+rFMRKairgq2LN3QWxhcZCjhBjNcKeHrlStpen1Cti6JK70RHgGbIpi
	 YK6rlv6sL7nrf/fR2cAjZcleCC5/kLdVT1+pg4LKASQp9/l1Pv4puJ/o7NSvJQiPoR
	 YaOQREGDOBHuSPykNV0plZPvTTY453yWmgtgp60iCydxFIcm0+rtTET1ybhbjrirLZ
	 RFuoQHjbpvmfg==
Date: Sun, 2 Nov 2025 11:47:47 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, 
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm6150: Add camss node
Message-ID: <lf5nlalqrx6zirhzxf7z4nfqwx5lljwot6izj66ljm57pbz3bd@t7cipoonvy4o>
References: <20251016-sm6150-camss-v1-0-e7f64ac32370@oss.qualcomm.com>
 <20251016-sm6150-camss-v1-3-e7f64ac32370@oss.qualcomm.com>
 <b0224cd8-fe81-4229-94a4-c314c7b19811@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b0224cd8-fe81-4229-94a4-c314c7b19811@linaro.org>

On Thu, Oct 16, 2025 at 04:48:02PM +0300, Vladimir Zapolskiy wrote:
> On 10/16/25 13:22, Wenmeng Liu wrote:
> > Add node for the SM6150 camera subsystem.
> > 
> > Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> > ---
> >   arch/arm64/boot/dts/qcom/sm6150.dtsi | 121 +++++++++++++++++++++++++++++++++++
> >   1 file changed, 121 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sm6150.dtsi b/arch/arm64/boot/dts/qcom/sm6150.dtsi
> > index 3d2a1cb02b628a5db7ca14bea784429be5a020f9..ebfb336439b4fdfa567c0e011cd4da88a6290dfd 100644
> > --- a/arch/arm64/boot/dts/qcom/sm6150.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm6150.dtsi
> > @@ -3646,6 +3646,127 @@ videocc: clock-controller@ab00000 {
> >   			#power-domain-cells = <1>;
> >   		};
> > +		camss: isp@acb3000 {
> > +			compatible = "qcom,sm6150-camss";
> > +
> > +			reg = <0x0 0x0acb3000 0x0 0x1000>,
> > +			      <0x0 0x0acba000 0x0 0x1000>,
> > +			      <0x0 0x0acc8000 0x0 0x1000>,
> > +			      <0x0 0x0ac65000 0x0 0x1000>,
> > +			      <0x0 0x0ac66000 0x0 0x1000>,
> > +			      <0x0 0x0ac67000 0x0 0x1000>,
> > +			      <0x0 0x0acaf000 0x0 0x4000>,
> > +			      <0x0 0x0acb6000 0x0 0x4000>,
> > +			      <0x0 0x0acc4000 0x0 0x4000>;
> > +			reg-names = "csid0",
> > +				    "csid1",
> > +				    "csid_lite",
> > +				    "csiphy0",
> > +				    "csiphy1",
> > +				    "csiphy2",
> > +				    "vfe0",
> > +				    "vfe1",
> > +				    "vfe_lite";
> > +
> > +			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> > +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> > +				 <&camcc CAM_CC_CSIPHY0_CLK>,
> > +				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> > +				 <&camcc CAM_CC_CSIPHY1_CLK>,
> > +				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> > +				 <&camcc CAM_CC_CSIPHY2_CLK>,
> > +				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> > +				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
> > +				 <&camcc CAM_CC_SOC_AHB_CLK>,
> > +				 <&camcc CAM_CC_IFE_0_CLK>,
> > +				 <&camcc CAM_CC_IFE_0_AXI_CLK>,
> > +				 <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
> > +				 <&camcc CAM_CC_IFE_0_CSID_CLK>,
> > +				 <&camcc CAM_CC_IFE_1_CLK>,
> > +				 <&camcc CAM_CC_IFE_1_AXI_CLK>,
> > +				 <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
> > +				 <&camcc CAM_CC_IFE_1_CSID_CLK>,
> > +				 <&camcc CAM_CC_IFE_LITE_CLK>,
> > +				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
> > +				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
> > +
> > +			clock-names = "camnoc_axi",
> > +				      "cpas_ahb",
> > +				      "csiphy0",
> > +				      "csiphy0_timer",
> > +				      "csiphy1",
> > +				      "csiphy1_timer",
> > +				      "csiphy2",
> > +				      "csiphy2_timer",
> > +				      "gcc_axi_hf",
> > +				      "soc_ahb",
> > +				      "vfe0",
> > +				      "vfe0_axi",
> > +				      "vfe0_cphy_rx",
> > +				      "vfe0_csid",
> > +				      "vfe1",
> > +				      "vfe1_axi",
> > +				      "vfe1_cphy_rx",
> > +				      "vfe1_csid",
> > +				      "vfe_lite",
> > +				      "vfe_lite_cphy_rx",
> > +				      "vfe_lite_csid";
> > +
> > +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> > +					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> > +					<&mmss_noc MASTER_CAMNOC_HF0 QCOM_ICC_TAG_ALWAYS
> > +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> > +			interconnect-names = "ahb",
> > +					     "hf_mnoc";
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
> > +					  "csid_lite",
> > +					  "csiphy0",
> > +					  "csiphy1",
> > +					  "csiphy2",
> > +					  "vfe0",
> > +					  "vfe1",
> > +					  "vfe_lite";
> > +
> > +			iommus = <&apps_smmu 0x820 0x40>;
> > +
> > +			power-domains = <&camcc IFE_0_GDSC>,
> > +					<&camcc IFE_1_GDSC>,
> > +					<&camcc TITAN_TOP_GDSC>;
> > +			power-domain-names = "ife0",
> > +					     "ife1",
> > +					     "top";
> > +
> > +			status = "disabled";
> 
> Please remove empty lines between properties all above.
> 

The empty lines between groups of properties makes this massive chunk of
properties easier to read, at no real cost.

The one exception is the extra empty line between clocks and
clock-names, but there's no need to resubmit for that.

Regards,
Bjorn

> > +
> > +			ports {
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +
> > +				port@0 {
> > +					reg = <0>;
> > +				};
> > +
> > +				port@1 {
> > +					reg = <1>;
> > +				};
> > +
> > +				port@2 {
> > +					reg = <2>;
> > +				};
> > +			};
> > +		};
> > +
> >   		camcc: clock-controller@ad00000 {
> >   			compatible = "qcom,qcs615-camcc";
> >   			reg = <0 0x0ad00000 0 0x10000>;
> > 
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> 
> -- 
> Best wishes,
> Vladimir

