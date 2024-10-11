Return-Path: <linux-media+bounces-19436-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B113599A6D7
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 16:50:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AF9F1F225AC
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 14:50:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4EBA19415D;
	Fri, 11 Oct 2024 14:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nMTfrFYu"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C9615252D;
	Fri, 11 Oct 2024 14:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728658160; cv=none; b=Znab166OtmMioNhKICOC8n9be3WaDIBXIxn1mr42B7lL66mL7ossr64Oihk6g+hiGnESSMo/mfLI9D0CmygANf3IgF52cpy/SC7ilZJngV8bKZh2zsfeR1wPmKPfhMg1o+rIISO4GFLyDjAAmBgD1B5u3Qi8yl7tKVBrhrIK9fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728658160; c=relaxed/simple;
	bh=RjYgyZ44THuAQGuVEDjAJZed+5wFrxBFRaSeQQ6Exv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XGdwBcGH8L44nq0KP13EgkeRRibGJIJoFvDlxyxXD8UvzUj56SvSGQjw6M0kM8KNL3v5HZXxxXCXGHe4aPWwCLJJTrpFC3U6biJ7Sz9BHYCOSKeQ3gtY8DJcGzICNRuA/9zvAZnQvqkweRA6aF7YsFHdmYMrykfjdPB/tO8rl8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nMTfrFYu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C54EDC4CECF;
	Fri, 11 Oct 2024 14:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728658159;
	bh=RjYgyZ44THuAQGuVEDjAJZed+5wFrxBFRaSeQQ6Exv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nMTfrFYu+g54px9K4gkvB+d4NBedupfc5G13PZUpUKQA7lJaIa5XOTYNNYwWU1Yhe
	 vQBCWwzaLtMPfJrK/qTGElpNaUfhhx5sq0vPDYL8EZz10WmHSnh7rnJ1fvSHZnUIbG
	 nN66qQl80+FfxlvvdezvEkPjthYnN1jupALrkXaAmI6l2coHz34f4wTY6v7FbRySZr
	 4EF/WdiSpxkBtKZyJQMfYQcjWdNMX17D0H+bYucsYPOD83vVyX49sHZwMewC936FHV
	 aeuiMx9TurY4HhaTZyB+kbW1yDlJwo/ELnSJHPqa0Fb6unVW0jNSBRVDPfjZeb41GE
	 S57PKHj5dg84w==
Date: Fri, 11 Oct 2024 16:49:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org, 
	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	akapatra@quicinc.com, hariramp@quicinc.com, andersson@kernel.org, 
	konradybcio@kernel.org, hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org, 
	catalin.marinas@arm.com, will@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@quicinc.com
Subject: Re: [PATCH v3 1/8] media: dt-bindings: media: camss: Add
 qcom,sc7280-camss binding
Message-ID: <q63w23zeoteagtw3px4sk3il4567plydgdhckmvpiksm6qc5i2@3rcdrr5uribq>
References: <20241011140932.1744124-1-quic_vikramsa@quicinc.com>
 <20241011140932.1744124-2-quic_vikramsa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241011140932.1744124-2-quic_vikramsa@quicinc.com>

On Fri, Oct 11, 2024 at 07:39:25PM +0530, Vikram Sharma wrote:
> @@ -0,0 +1,440 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +

Drop blank line (that's a new finding, I would not complain except that
I expect new version, see further).

> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        camss: camss@acaf000 {
> +            compatible = "qcom,sc7280-camss";
> +
> +            clocks = <&clock_camcc CAM_CC_CAMNOC_AXI_CLK>,
> +                <&clock_camcc CAM_CC_IFE_0_CSID_CLK>,

Alignment did not improve. Please carefully read DTS coding style.

> +                <&clock_camcc CAM_CC_IFE_1_CSID_CLK>,
> +                <&clock_camcc CAM_CC_IFE_2_CSID_CLK>,
> +                <&clock_camcc CAM_CC_IFE_LITE_0_CSID_CLK>,
> +                <&clock_camcc CAM_CC_IFE_LITE_1_CSID_CLK>,
> +                <&clock_camcc CAM_CC_CSIPHY0_CLK>,
> +                <&clock_camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +                <&clock_camcc CAM_CC_CSIPHY1_CLK>,
> +                <&clock_camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +                <&clock_camcc CAM_CC_CSIPHY2_CLK>,
> +                <&clock_camcc CAM_CC_CSI2PHYTIMER_CLK>,
> +                <&clock_camcc CAM_CC_CSIPHY3_CLK>,
> +                <&clock_camcc CAM_CC_CSI3PHYTIMER_CLK>,
> +                <&clock_camcc CAM_CC_CSIPHY4_CLK>,
> +                <&clock_camcc CAM_CC_CSI4PHYTIMER_CLK>,
> +                <&gcc GCC_CAMERA_AHB_CLK>,
> +                <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +                <&clock_camcc CAM_CC_CPAS_AHB_CLK>,
> +                <&clock_camcc CAM_CC_IFE_0_AXI_CLK>,
> +                <&clock_camcc CAM_CC_IFE_0_CLK>,
> +                <&clock_camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
> +                <&clock_camcc CAM_CC_IFE_1_AXI_CLK>,
> +                <&clock_camcc CAM_CC_IFE_1_CLK>,
> +                <&clock_camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
> +                <&clock_camcc CAM_CC_IFE_2_AXI_CLK>,
> +                <&clock_camcc CAM_CC_IFE_2_CLK>,
> +                <&clock_camcc CAM_CC_IFE_2_CPHY_RX_CLK>,
> +                <&clock_camcc CAM_CC_IFE_LITE_0_CLK>,
> +                <&clock_camcc CAM_CC_IFE_LITE_0_CPHY_RX_CLK>,
> +                <&clock_camcc CAM_CC_IFE_LITE_1_CLK>,
> +                <&clock_camcc CAM_CC_IFE_LITE_1_CPHY_RX_CLK>;
> +
> +            clock-names = "camnoc_axi",
> +                "csi0",

Alignment did not improve. Please carefully read DTS coding style.

> +                "csi1",
> +                "csi2",
> +                "csi3",
> +                "csi4",
> +                "csiphy0",
> +                "csiphy0_timer",
> +                "csiphy1",
> +                "csiphy1_timer",
> +                "csiphy2",
> +                "csiphy2_timer",
> +                "csiphy3",
> +                "csiphy3_timer",
> +                "csiphy4",
> +                "csiphy4_timer",
> +                "gcc_camera_ahb",
> +                "gcc_camera_axi",
> +                "soc_ahb",
> +                "vfe0_axi",
> +                "vfe0",
> +                "vfe0_cphy_rx",
> +                "vfe1_axi",
> +                "vfe1",
> +                "vfe1_cphy_rx",
> +                "vfe2_axi",
> +                "vfe2",
> +                "vfe2_cphy_rx",
> +                "vfe0_lite",
> +                "vfe0_lite_cphy_rx",
> +                "vfe1_lite",
> +                "vfe1_lite_cphy_rx";
> +
> +            interconnects = <&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_CAMERA_CFG 0>,
> +                <&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI1 0>;

Alignment did not improve. Please carefully read DTS coding style.

> +
> +            interconnect-names = "ahb", "hf_0";
> +
> +            interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
> +                <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,

Alignment did not improve. Please carefully read DTS coding style.

> +                <GIC_SPI 640 IRQ_TYPE_EDGE_RISING>,
> +                <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
> +                <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
> +                <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> +                <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> +                <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> +                <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
> +                <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
> +                <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
> +                <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
> +                <GIC_SPI 641 IRQ_TYPE_EDGE_RISING>,
> +                <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
> +                <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
> +
> +            interrupt-names = "csid0",
> +                "csid1",
> +                "csid2",
> +                "csid_lite0",

Alignment did not improve. Please carefully read DTS coding style.

> +                "csid_lite1",
> +                "csiphy0",
> +                "csiphy1",
> +                "csiphy2",
> +                "csiphy3",
> +                "csiphy4",
> +                "vfe0",
> +                "vfe1",
> +                "vfe2",
> +                "vfe_lite0",
> +                "vfe_lite1";
> +
> +            iommus = <&apps_smmu 0x800 0x4e0>;
> +
> +            power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
> +                <&camcc CAM_CC_IFE_1_GDSC>,

Alignment did not improve. Please carefully read DTS coding style.

> +                <&camcc CAM_CC_IFE_2_GDSC>,
> +                <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +            power-domains-names = "ife0", "ife1", "ife2", "top";
> +
> +            reg = <0x0 0x0acb3000 0x0 0x1000>,
> +                <0x0 0x0acba000 0x0 0x1000>,
> +                <0x0 0x0acc1000 0x0 0x1000>,

Alignment did not improve. Please carefully read DTS coding style.

> +                <0x0 0x0acc8000 0x0 0x1000>,
> +                <0x0 0x0accf000 0x0 0x1000>,
> +                <0x0 0x0ace0000 0x0 0x2000>,
> +                <0x0 0x0ace2000 0x0 0x2000>,
> +                <0x0 0x0ace4000 0x0 0x2000>,
> +                <0x0 0x0ace6000 0x0 0x2000>,
> +                <0x0 0x0ace8000 0x0 0x2000>,
> +                <0x0 0x0acaf000 0x0 0x4000>,
> +                <0x0 0x0acb6000 0x0 0x4000>,
> +                <0x0 0x0acbd000 0x0 0x4000>,
> +                <0x0 0x0acc4000 0x0 0x4000>,
> +                <0x0 0x0accb000 0x0 0x4000>;
> +
> +            reg-names = "csid0",
> +                "csid1",
> +                "csid2",
> +                "csid_lite0",

Alignment did not improve. Please carefully read DTS coding style.

> +                "csid_lite1",
> +                "csiphy0",
> +                "csiphy1",
> +                "csiphy2",

Best regards,
Krzysztof


