Return-Path: <linux-media+bounces-56795-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cG4RGgoBwmkjYwQAu9opvQ
	(envelope-from <linux-media+bounces-56795-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 04:12:10 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DF09F30196D
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 04:12:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4226E304A884
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 03:07:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 212763876CC;
	Tue, 24 Mar 2026 03:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u+dD6wlU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82353381AE2;
	Tue, 24 Mar 2026 03:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774321660; cv=none; b=FAA0Qge22UwYJMDQvMG/I/t2ECNcNKrpQrBBh/5pSdV6ez7BMOwwrRaTFGVEpcEPS6FHhsEg5VCH+GeL8ilm+pV7udUri0XPp5esu1n6gh+306EB079ve/ANGIkoAT7rEyO4fTUGPeHgCAeQZuwq0YBD2Or9+fz1kthQf+cWSlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774321660; c=relaxed/simple;
	bh=8FkRL1nwHf/0wNUUU8ehm47Kp2O5R7mZOu2jyo1vTQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D41pe8xuO1vSPBiudhb3AvT2oJDYlwBwUWEe1xJ1Kmr0tGSZxLl29t891Q8LuNiSs+wnqVc5lqffyqwlflnEHsm5uaULq312gati+YULpKqcxRP2fsbrC1Reepj5kG0hNNixlfN1pTv7wFQecdtWJ4rmZK4R0+PBArlzprs500Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u+dD6wlU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22A95C4CEF7;
	Tue, 24 Mar 2026 03:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774321660;
	bh=8FkRL1nwHf/0wNUUU8ehm47Kp2O5R7mZOu2jyo1vTQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u+dD6wlUBZWUczeEgX9t4MPcAF14ngnSixuJgg4RTBAK6bg+ETk+SjC7vGMmQlvfc
	 W7dZFE7nZepecLL113k6swiPAm3SmRJhzsgBzciDTvicuoLUfl7n6NaipveWwarHtR
	 SCpa3kXuBx0v//EBnmYtDERUh0ESknKsDoGnwrEe6p4IvPtTSmRCb3MFxRjQacAog0
	 jhX2/zESG/uEz+dnC7hjXoiKcuh9UDYLTKVQe6EppVwGvoWJLzKSgzfefbxqY/1b8P
	 vlS0QBg9JSCNgd/o6JyPH/ngxTWa/kwML6Ah0vcszHnS4L/dcrAC1/1jWhIDDRdAIa
	 IhfqK5IIL2d1Q==
Date: Mon, 23 Mar 2026 22:07:36 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: talos: Add camss node
Message-ID: <acH_30LE_xHXneqf@baldur>
References: <20260112-sm6150-camss-v4-0-0cd576d627f7@oss.qualcomm.com>
 <20260112-sm6150-camss-v4-3-0cd576d627f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112-sm6150-camss-v4-3-0cd576d627f7@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56795-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.2:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.0:email,qualcomm.com:email,linaro.org:email,0.0.0.1:email]
X-Rspamd-Queue-Id: DF09F30196D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jan 12, 2026 at 04:04:54PM +0800, Wenmeng Liu wrote:
> Add node for the SM6150 camera subsystem.
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

arch/arm64/boot/dts/qcom/qcs615-ride.dtb: isp@acb3000 (qcom,sm6150-camss) interrupts: [[0, 464, 1, 0], [466, 1, 0, 468], [1, 0, 477, 1], [0, 478, 1, 0], [479, 1, 0, 465], [1, 0, 467, 1], [0, 469, 1, 0], [459, 1, 0, 461], [1, 0, 463, 1], [0, 475, 1, 0], [474, 1, 0, 476], [1]] is too short

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/talos.dtsi | 200 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 200 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
> index 8171ec482be054a6d2bc8afdd1a122fa4fc591a2..5e5b43441e8919d6afc5a457e61f8a49664db66a 100644
> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
> @@ -3780,6 +3780,206 @@ videocc: clock-controller@ab00000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +		camss: isp@acb3000 {
> +			compatible = "qcom,sm6150-camss";
> +
> +			reg = <0x0 0x0acb3000 0x0 0x1000>,
> +			      <0x0 0x0acba000 0x0 0x1000>,
> +			      <0x0 0x0acc8000 0x0 0x1000>,
> +			      <0x0 0x0ac65000 0x0 0x1000>,
> +			      <0x0 0x0ac66000 0x0 0x1000>,
> +			      <0x0 0x0ac67000 0x0 0x1000>,
> +			      <0x0 0x0acaf000 0x0 0x4000>,
> +			      <0x0 0x0acb6000 0x0 0x4000>,
> +			      <0x0 0x0acc4000 0x0 0x4000>,
> +			      <0x0 0x0ac6f000 0x0 0x3000>,
> +			      <0x0 0x0ac42000 0x0 0x5000>,
> +			      <0x0 0x0ac48000 0x0 0x1000>,
> +			      <0x0 0x0ac40000 0x0 0x1000>,
> +			      <0x0 0x0ac18000 0x0 0x3000>,
> +			      <0x0 0x0ac00000 0x0 0x6000>,
> +			      <0x0 0x0ac10000 0x0 0x8000>,
> +			      <0x0 0x0ac87000 0x0 0x3000>,
> +			      <0x0 0x0ac52000 0x0 0x4000>,
> +			      <0x0 0x0ac4e000 0x0 0x4000>,
> +			      <0x0 0x0ac6b000 0x0 0x0a00>;
> +			reg-names = "csid0",
> +				    "csid1",
> +				    "csid_lite",
> +				    "csiphy0",
> +				    "csiphy1",
> +				    "csiphy2",
> +				    "vfe0",
> +				    "vfe1",
> +				    "vfe_lite",
> +				    "bps",
> +				    "camnoc",
> +				    "cpas_cdm",
> +				    "cpas_top",
> +				    "icp_csr",
> +				    "icp_qgic",
> +				    "icp_sierra",
> +				    "ipe0",
> +				    "jpeg_dma",
> +				    "jpeg_enc",
> +				    "lrme";
> +
> +			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
> +				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +				 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CSIPHY0_CLK>,
> +				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY1_CLK>,
> +				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY2_CLK>,
> +				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_SOC_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_0_CLK>,
> +				 <&camcc CAM_CC_IFE_0_AXI_CLK>,
> +				 <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_0_CSID_CLK>,
> +				 <&camcc CAM_CC_IFE_1_CLK>,
> +				 <&camcc CAM_CC_IFE_1_AXI_CLK>,
> +				 <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_1_CSID_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
> +				 <&camcc CAM_CC_BPS_CLK>,
> +				 <&camcc CAM_CC_BPS_AHB_CLK>,
> +				 <&camcc CAM_CC_BPS_AXI_CLK>,
> +				 <&camcc CAM_CC_BPS_AREG_CLK>,
> +				 <&camcc CAM_CC_ICP_CLK>,
> +				 <&camcc CAM_CC_IPE_0_CLK>,
> +				 <&camcc CAM_CC_IPE_0_AHB_CLK>,
> +				 <&camcc CAM_CC_IPE_0_AREG_CLK>,
> +				 <&camcc CAM_CC_IPE_0_AXI_CLK>,
> +				 <&camcc CAM_CC_JPEG_CLK>,
> +				 <&camcc CAM_CC_LRME_CLK>;
> +			clock-names = "gcc_ahb",
> +				      "gcc_axi_hf",
> +				      "camnoc_axi",
> +				      "cpas_ahb",
> +				      "csiphy0",
> +				      "csiphy0_timer",
> +				      "csiphy1",
> +				      "csiphy1_timer",
> +				      "csiphy2",
> +				      "csiphy2_timer",
> +				      "soc_ahb",
> +				      "vfe0",
> +				      "vfe0_axi",
> +				      "vfe0_cphy_rx",
> +				      "vfe0_csid",
> +				      "vfe1",
> +				      "vfe1_axi",
> +				      "vfe1_cphy_rx",
> +				      "vfe1_csid",
> +				      "vfe_lite",
> +				      "vfe_lite_cphy_rx",
> +				      "vfe_lite_csid",
> +				      "bps",
> +				      "bps_ahb",
> +				      "bps_axi",
> +				      "bps_areg",
> +				      "icp",
> +				      "ipe0",
> +				      "ipe0_ahb",
> +				      "ipe0_areg",
> +				      "ipe0_axi",
> +				      "jpeg",
> +				      "lrme";
> +
> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&mmss_noc MASTER_CAMNOC_HF0 QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&mmss_noc MASTER_CAMNOC_HF1 QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "ahb",
> +					     "hf_0",
> +					     "hf_1",
> +					     "sf_mnoc";
> +
> +			interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 459 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 461 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 463 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 475 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 476 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "csid0",
> +					  "csid1",
> +					  "csid_lite",
> +					  "csiphy0",
> +					  "csiphy1",
> +					  "csiphy2",
> +					  "vfe0",
> +					  "vfe1",
> +					  "vfe_lite",
> +					  "camnoc",
> +					  "cdm",
> +					  "icp",
> +					  "jpeg_dma",
> +					  "jpeg_enc",
> +					  "lrme";
> +
> +			iommus = <&apps_smmu 0x0820 0x40>,
> +				 <&apps_smmu 0x0840 0x00>,
> +				 <&apps_smmu 0x0860 0x40>,
> +				 <&apps_smmu 0x0c00 0x00>,
> +				 <&apps_smmu 0x0cc0 0x00>,
> +				 <&apps_smmu 0x0c80 0x00>,
> +				 <&apps_smmu 0x0ca0 0x00>,
> +				 <&apps_smmu 0x0d00 0x00>,
> +				 <&apps_smmu 0x0d20 0x00>,
> +				 <&apps_smmu 0x0d40 0x00>,
> +				 <&apps_smmu 0x0d80 0x20>,
> +				 <&apps_smmu 0x0da0 0x20>,
> +				 <&apps_smmu 0x0de2 0x00>;
> +
> +			power-domains = <&camcc IFE_0_GDSC>,
> +					<&camcc IFE_1_GDSC>,
> +					<&camcc TITAN_TOP_GDSC>,
> +					<&camcc BPS_GDSC>,
> +					<&camcc IPE_0_GDSC>;
> +			power-domain-names = "ife0",
> +					     "ife1",
> +					     "top",
> +					     "bps",
> +					     "ipe";
> +
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
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +				};
> +			};
> +		};
> +
>  		camcc: clock-controller@ad00000 {
>  			compatible = "qcom,qcs615-camcc";
>  			reg = <0 0x0ad00000 0 0x10000>;
> 
> -- 
> 2.34.1
> 

