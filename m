Return-Path: <linux-media+bounces-32454-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6EBAB6778
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 11:26:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BD233B0F60
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 09:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28F5A225784;
	Wed, 14 May 2025 09:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="qGo19Ijw"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF0C219A93;
	Wed, 14 May 2025 09:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747214792; cv=none; b=PlRdsx7Udu77WXaDomu+5nJz22OoHbXPrRZ4bOOa1TstKmwWdHshqLqj3s9K9FP4KF6w+uRqu/YohCj+KQfcQjDv+weN8Nf7ZQlwRyPTtPVoFTikHqULb84yFEcCn5ifsY190kn2SOZxuDjHwq7eTqlJ1xj4aeu5q7WiUjafghw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747214792; c=relaxed/simple;
	bh=5cD75BXaFRwyh8ohcDtPqbxDsCTGom3Sk84YFkgcyIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XXen6B46ZwE/2I8GGcRIWCuo85IBxObja45gblMebH7oqdGqZWE6qcUf68Dt2p8OIa34/uGN2VD4XoMCicYxD3FiC4R/PqjDmJ6FYDrj3/lJFp5GnfnndwcgF83FlmkGfoYI67PjjR4mqgobmiVAjBRzN4AEP/1puKUbycCfmW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=qGo19Ijw; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747214788;
	bh=5cD75BXaFRwyh8ohcDtPqbxDsCTGom3Sk84YFkgcyIc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qGo19IjwogcaWhI462YEGkRkzQpbMFbHvAIwuAD02sYosOHaZHzjVBa0yRbqpYLSW
	 5bqhtUeDx8y/tZ1W0h8/QPraCTBPvv/4t3Fhl3U5JFGhgRCcM1fFamqmkkPGW55Kgi
	 Iml9HmLrKehj6R6/jlCPVzHdAJr182fQNbq51wRKwtovHgj8IUiXGmGS/twnu+GyzQ
	 CO2Zxa1XKLayYXBBGB1wxz1F1yfjdMbwTrGLSvdXaK5/a5oeyOvMOBXMoIZ7p31auo
	 wfCiwRuwSvLvcmkzDelUOeJDQDuaGMiVMgy8Pt5hvsfMqiGkZO5iaPmnpt78ci03v7
	 Fb/Txhj6iBPLw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AD26217E0FC3;
	Wed, 14 May 2025 11:26:27 +0200 (CEST)
Message-ID: <439db3ea-4fb7-4944-b182-222663c09b3d@collabora.com>
Date: Wed, 14 May 2025 11:26:26 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: mediatek: mt8188: Add all Multimedia
 Data Path 3 nodes
To: robh@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, Nicolas Dufresne
 <nicolas.dufresne@collabora.com>, Chun-Kuang Hu <chunkuang.hu@mediatek.com>,
 Conor Dooley <conor.dooley@microchip.com>
References: <20250514092259.47035-1-angelogioacchino.delregno@collabora.com>
 <20250514092259.47035-3-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250514092259.47035-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 14/05/25 11:22, AngeloGioacchino Del Regno ha scritto:
> Add all of the Multimedia Data Path 3 (MDP3) related nodes
> including its Mutex instances, one for each VPPSYS block, and
> all of its DMA controllers, Film Grain (FG), HDR, Adaptive Ambient
> Light (AAL), Frame Resizer (RSZ), Tone Curve Conversion (TCC),
> Two-Dimensional Sharpness (TDSHP), and others, enabling the entire
> MDP3 macro-block.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Rob, sorry again for missing your previous email about the warnings
generated by this commit.

I ran a dtbs_check on this and I didn't see any warning - can you please urgently
check and confirm that I didn't miss anything on this one so that I can pull it in
the MediaTek trees for a fixed up PR?

If anything else is wrong with this one, I'll have to just drop it and delay this
for the next cycle as it's really too late (my bad, though).

Many many thanks,
Angelo


> ---
>   arch/arm64/boot/dts/mediatek/mt8188.dtsi | 299 +++++++++++++++++++++++
>   1 file changed, 299 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> index 29d35ca94597..55260357ac66 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> @@ -2224,6 +2224,118 @@ vppsys0: syscon@14000000 {
>   			#clock-cells = <1>;
>   		};
>   
> +		dma-controller@14001000 {
> +			compatible = "mediatek,mt8188-mdp3-rdma";
> +			reg = <0 0x14001000 0 0x1000>;
> +			#dma-cells = <1>;
> +			clocks = <&vppsys0 CLK_VPP0_MDP_RDMA>;
> +			mboxes = <&gce0 13 CMDQ_THR_PRIO_1>,
> +				 <&gce0 14 CMDQ_THR_PRIO_1>,
> +				 <&gce0 16 CMDQ_THR_PRIO_1>,
> +				 <&gce0 21 CMDQ_THR_PRIO_1>,
> +				 <&gce0 22 CMDQ_THR_PRIO_1>;
> +			iommus = <&vpp_iommu M4U_PORT_L4_MDP_RDMA>;
> +			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS0>;
> +			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x1000 0x1000>;
> +			mediatek,gce-events = <CMDQ_EVENT_VPP0_MDP_RDMA_SOF>,
> +					      <CMDQ_EVENT_VPP0_MDP_RDMA_FRAME_DONE>;
> +			mediatek,scp = <&scp>;
> +		};
> +
> +		display@14002000 {
> +			compatible = "mediatek,mt8188-mdp3-fg", "mediatek,mt8195-mdp3-fg";
> +			reg = <0 0x14002000 0 0x1000>;
> +			clocks = <&vppsys0 CLK_VPP0_MDP_FG>;
> +			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x2000 0x1000>;
> +		};
> +
> +		display@14004000 {
> +			compatible = "mediatek,mt8188-mdp3-hdr", "mediatek,mt8195-mdp3-hdr";
> +			reg = <0 0x14004000 0 0x1000>;
> +			clocks = <&vppsys0 CLK_VPP0_MDP_HDR>;
> +			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x4000 0x1000>;
> +		};
> +
> +		display@14005000 {
> +			compatible = "mediatek,mt8188-mdp3-aal", "mediatek,mt8195-mdp3-aal";
> +			reg = <0 0x14005000 0 0x1000>;
> +			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&vppsys0 CLK_VPP0_MDP_AAL>;
> +			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS0>;
> +			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x5000 0x1000>;
> +		};
> +
> +		display@14006000 {
> +			compatible = "mediatek,mt8188-mdp3-rsz", "mediatek,mt8183-mdp3-rsz";
> +			reg = <0 0x14006000 0 0x1000>;
> +			clocks = <&vppsys0 CLK_VPP0_MDP_RSZ>;
> +			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x6000 0x1000>;
> +			mediatek,gce-events = <CMDQ_EVENT_VPP0_MDP_RSZ_IN_RSZ_SOF>,
> +					      <CMDQ_EVENT_VPP0_MDP_RSZ_FRAME_DONE>;
> +		};
> +
> +		display@14007000 {
> +			compatible = "mediatek,mt8188-mdp3-tdshp", "mediatek,mt8195-mdp3-tdshp";
> +			reg = <0 0x14007000 0 0x1000>;
> +			clocks = <&vppsys0 CLK_VPP0_MDP_TDSHP>;
> +			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x7000 0x1000>;
> +		};
> +
> +		display@14008000 {
> +			compatible = "mediatek,mt8188-mdp3-color", "mediatek,mt8195-mdp3-color";
> +			reg = <0 0x14008000 0 0x1000>;
> +			interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&vppsys0 CLK_VPP0_MDP_COLOR>;
> +			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS0>;
> +			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x8000 0x1000>;
> +		};
> +
> +		display@14009000 {
> +			compatible = "mediatek,mt8188-mdp3-ovl", "mediatek,mt8195-mdp3-ovl";
> +			reg = <0 0x14009000 0 0x1000>;
> +			interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&vppsys0 CLK_VPP0_MDP_OVL>;
> +			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS0>;
> +			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x9000 0x1000>;
> +			iommus = <&vpp_iommu M4U_PORT_L4_MDP_OVL>;
> +		};
> +
> +		display@1400a000 {
> +			compatible = "mediatek,mt8188-mdp3-padding", "mediatek,mt8195-mdp3-padding";
> +			reg = <0 0x1400a000 0 0x1000>;
> +			clocks = <&vppsys0 CLK_VPP0_PADDING>;
> +			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS0>;
> +			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0xa000 0x1000>;
> +		};
> +
> +		display@1400b000 {
> +			compatible = "mediatek,mt8188-mdp3-tcc", "mediatek,mt8195-mdp3-tcc";
> +			reg = <0 0x1400b000 0 0x1000>;
> +			clocks = <&vppsys0 CLK_VPP0_MDP_TCC>;
> +			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0xb000 0x1000>;
> +		};
> +
> +		display@1400c000 {
> +			compatible = "mediatek,mt8188-mdp3-wrot", "mediatek,mt8183-mdp3-wrot";
> +			reg = <0 0x1400c000 0 0x1000>;
> +			#dma-cells = <1>;
> +			clocks = <&vppsys0 CLK_VPP0_MDP_WROT>;
> +			iommus = <&vpp_iommu M4U_PORT_L4_MDP_WROT>;
> +			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS0>;
> +			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0xc000 0x1000>;
> +			mediatek,gce-events = <CMDQ_EVENT_VPP0_MDP_WROT_SOF>,
> +					      <CMDQ_EVENT_VPP0_MDP_WROT_VIDO_WDONE>;
> +		};
> +
> +		mutex@1400f000 {
> +			compatible = "mediatek,mt8188-vpp-mutex";
> +			reg = <0 0x1400f000 0 0x1000>;
> +			interrupts = <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&vppsys0 CLK_VPP0_MUTEX>;
> +			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS0>;
> +			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0xf000 0x1000>;
> +		};
> +
>   		vpp_smi_common: smi@14012000 {
>   			compatible = "mediatek,mt8188-smi-common-vpp";
>   			reg = <0 0x14012000 0 0x1000>;
> @@ -2255,6 +2367,184 @@ vpp_iommu: iommu@14018000 {
>   			mediatek,larbs = <&larb1 &larb3 &larb4 &larb6 &larb7 &larb23>;
>   		};
>   
> +		dma-controller@14f09000 {
> +			compatible = "mediatek,mt8188-mdp3-rdma";
> +			reg = <0 0x14f09000 0 0x1000>;
> +			#dma-cells = <1>;
> +			clocks = <&vppsys1 CLK_VPP1_SVPP2_MDP_RDMA>;
> +			iommus = <&vdo_iommu M4U_PORT_L5_SVPP2_MDP_RDMA>;
> +			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS1>;
> +			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0x9000 0x1000>;
> +			mediatek,gce-events = <CMDQ_EVENT_VPP1_SVPP2_MDP_RDMA_SOF>,
> +					      <CMDQ_EVENT_VPP1_SVPP2_MDP_RDMA_FRAME_DONE>;
> +		};
> +
> +		dma-controller@14f0a000 {
> +			compatible = "mediatek,mt8188-mdp3-rdma";
> +			reg = <0 0x14f0a000 0 0x1000>;
> +			#dma-cells = <1>;
> +			clocks = <&vppsys1 CLK_VPP1_SVPP3_MDP_RDMA>;
> +			iommus = <&vpp_iommu M4U_PORT_L6_SVPP3_MDP_RDMA>;
> +			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS1>;
> +			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0xa000 0x1000>;
> +			mediatek,gce-events = <CMDQ_EVENT_VPP1_SVPP3_MDP_RDMA_SOF>,
> +					      <CMDQ_EVENT_VPP1_SVPP3_MDP_RDMA_FRAME_DONE>;
> +		};
> +
> +		display@14f0c000 {
> +			compatible = "mediatek,mt8188-mdp3-fg", "mediatek,mt8195-mdp3-fg";
> +			reg = <0 0x14f0c000 0 0x1000>;
> +			clocks = <&vppsys1 CLK_VPP1_SVPP2_MDP_FG>;
> +			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0xc000 0x1000>;
> +		};
> +
> +		display@14f0d000 {
> +			compatible = "mediatek,mt8188-mdp3-fg", "mediatek,mt8195-mdp3-fg";
> +			reg = <0 0x14f0d000 0 0x1000>;
> +			clocks = <&vppsys1 CLK_VPP1_SVPP3_MDP_FG>;
> +			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0xd000 0x1000>;
> +		};
> +
> +		display@14f0f000 {
> +			compatible = "mediatek,mt8188-mdp3-hdr", "mediatek,mt8195-mdp3-hdr";
> +			reg = <0 0x14f0f000 0 0x1000>;
> +			clocks = <&vppsys1 CLK_VPP1_SVPP2_MDP_HDR>;
> +			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0xf000 0x1000>;
> +		};
> +
> +		display@14f10000 {
> +			compatible = "mediatek,mt8188-mdp3-hdr", "mediatek,mt8195-mdp3-hdr";
> +			reg = <0 0x14f10000 0 0x1000>;
> +			clocks = <&vppsys1 CLK_VPP1_SVPP3_MDP_HDR>;
> +			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0 0x1000>;
> +		};
> +
> +		display@14f12000 {
> +			compatible = "mediatek,mt8188-mdp3-aal", "mediatek,mt8195-mdp3-aal";
> +			reg = <0 0x14f12000 0 0x1000>;
> +			interrupts = <GIC_SPI 618 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&vppsys1 CLK_VPP1_SVPP2_MDP_AAL>;
> +			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS1>;
> +			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0x2000 0x1000>;
> +		};
> +
> +		display@14f13000 {
> +			compatible = "mediatek,mt8188-mdp3-aal", "mediatek,mt8195-mdp3-aal";
> +			reg = <0 0x14f13000 0 0x1000>;
> +			interrupts = <GIC_SPI 619 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&vppsys1 CLK_VPP1_SVPP3_MDP_AAL>;
> +			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS1>;
> +			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0x3000 0x1000>;
> +		};
> +
> +		display@14f15000 {
> +			compatible = "mediatek,mt8188-mdp3-rsz", "mediatek,mt8183-mdp3-rsz";
> +			reg = <0 0x14f15000 0 0x1000>;
> +			clocks = <&vppsys1 CLK_VPP1_SVPP2_MDP_RSZ>;
> +			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0x5000 0x1000>;
> +			mediatek,gce-events = <CMDQ_EVENT_VPP1_SVPP2_MDP_RSZ_SOF>,
> +					      <CMDQ_EVENT_VPP1_SVPP2_MDP_RSZ_FRAME_DONE>;
> +		};
> +
> +		display@14f16000 {
> +			compatible = "mediatek,mt8188-mdp3-rsz", "mediatek,mt8183-mdp3-rsz";
> +			reg = <0 0x14f16000 0 0x1000>;
> +			clocks = <&vppsys1 CLK_VPP1_SVPP3_MDP_RSZ>;
> +			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0x6000 0x1000>;
> +			mediatek,gce-events = <CMDQ_EVENT_VPP1_SVPP3_MDP_RSZ_SOF>,
> +					      <CMDQ_EVENT_VPP1_SVPP3_MDP_RSZ_FRAME_DONE>;
> +		};
> +
> +		display@14f18000 {
> +			compatible = "mediatek,mt8188-mdp3-tdshp", "mediatek,mt8195-mdp3-tdshp";
> +			reg = <0 0x14f18000 0 0x1000>;
> +			clocks = <&vppsys1 CLK_VPP1_SVPP2_MDP_TDSHP>;
> +			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0x8000 0x1000>;
> +		};
> +
> +		display@14f19000 {
> +			compatible = "mediatek,mt8188-mdp3-tdshp", "mediatek,mt8195-mdp3-tdshp";
> +			reg = <0 0x14f19000 0 0x1000>;
> +			clocks = <&vppsys1 CLK_VPP1_SVPP3_MDP_TDSHP>;
> +			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0x9000 0x1000>;
> +		};
> +
> +		display@14f1a000 {
> +			compatible = "mediatek,mt8188-mdp3-merge", "mediatek,mt8195-mdp3-merge";
> +			reg = <0 0x14f1a000 0 0x1000>;
> +			clocks = <&vppsys1 CLK_VPP1_SVPP2_VPP_MERGE>;
> +			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS1>;
> +			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0xa000 0x1000>;
> +		};
> +
> +		display@14f1b000 {
> +			compatible = "mediatek,mt8188-mdp3-merge", "mediatek,mt8195-mdp3-merge";
> +			reg = <0 0x14f1b000 0 0x1000>;
> +			clocks = <&vppsys1 CLK_VPP1_SVPP3_VPP_MERGE>;
> +			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS1>;
> +			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0xb000 0x1000>;
> +		};
> +
> +		display@14f1d000 {
> +			compatible = "mediatek,mt8188-mdp3-color", "mediatek,mt8195-mdp3-color";
> +			reg = <0 0x14f1d000 0 0x1000>;
> +			interrupts = <GIC_SPI 629 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&vppsys1 CLK_VPP1_SVPP2_MDP_COLOR>;
> +			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS1>;
> +			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0xd000 0x1000>;
> +		};
> +
> +		display@14f1e000 {
> +			compatible = "mediatek,mt8188-mdp3-color", "mediatek,mt8195-mdp3-color";
> +			reg = <0 0x14f1e000 0 0x1000>;
> +			interrupts = <GIC_SPI 630 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&vppsys1 CLK_VPP1_SVPP3_MDP_COLOR>;
> +			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS1>;
> +			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0xe000 0x1000>;
> +		};
> +
> +		display@14f21000 {
> +			compatible = "mediatek,mt8188-mdp3-padding",
> +				     "mediatek,mt8195-mdp3-padding";
> +			reg = <0 0x14f21000 0 0x1000>;
> +			clocks = <&vppsys1 CLK_VPP1_SVPP2_VPP_PAD>;
> +			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS1>;
> +			mediatek,gce-client-reg = <&gce1 SUBSYS_14f2XXXX 0x1000 0x1000>;
> +		};
> +
> +		display@14f22000 {
> +			compatible = "mediatek,mt8188-mdp3-padding",
> +				     "mediatek,mt8195-mdp3-padding";
> +			reg = <0 0x14f22000 0 0x1000>;
> +			clocks = <&vppsys1 CLK_VPP1_SVPP3_VPP_PAD>;
> +			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS1>;
> +			mediatek,gce-client-reg = <&gce1 SUBSYS_14f2XXXX 0x2000 0x1000>;
> +		};
> +
> +		display@14f24000 {
> +			compatible = "mediatek,mt8188-mdp3-wrot", "mediatek,mt8183-mdp3-wrot";
> +			reg = <0 0x14f24000 0 0x1000>;
> +			#dma-cells = <1>;
> +			clocks = <&vppsys1 CLK_VPP1_SVPP2_MDP_WROT>;
> +			iommus = <&vdo_iommu M4U_PORT_L5_SVPP2_MDP_WROT>;
> +			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS1>;
> +			mediatek,gce-client-reg = <&gce1 SUBSYS_14f2XXXX 0x4000 0x1000>;
> +			mediatek,gce-events = <CMDQ_EVENT_VPP1_SVPP2_MDP_WROT_SOF>,
> +					      <CMDQ_EVENT_VPP1_SVPP2_MDP_WROT_FRAME_DONE>;
> +		};
> +
> +		display@14f25000 {
> +			compatible = "mediatek,mt8188-mdp3-wrot", "mediatek,mt8183-mdp3-wrot";
> +			reg = <0 0x14f25000 0 0x1000>;
> +			#dma-cells = <1>;
> +			clocks = <&vppsys1 CLK_VPP1_SVPP3_MDP_WROT>;
> +			iommus = <&vpp_iommu M4U_PORT_L6_SVPP3_MDP_WROT>;
> +			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS1>;
> +			mediatek,gce-client-reg = <&gce1 SUBSYS_14f2XXXX 0x5000 0x1000>;
> +			mediatek,gce-events = <CMDQ_EVENT_VPP1_SVPP3_MDP_WROT_SOF>,
> +					      <CMDQ_EVENT_VPP1_SVPP3_MDP_WROT_FRAME_DONE>;
> +		};
> +
>   		wpesys: clock-controller@14e00000 {
>   			compatible = "mediatek,mt8188-wpesys";
>   			reg = <0 0x14e00000 0 0x1000>;
> @@ -2284,6 +2574,15 @@ vppsys1: syscon@14f00000 {
>   			#clock-cells = <1>;
>   		};
>   
> +		mutex@14f01000 {
> +			compatible = "mediatek,mt8188-vpp-mutex";
> +			reg = <0 0x14f01000 0 0x1000>;
> +			interrupts = <GIC_SPI 635 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&vppsys1 CLK_VPP1_DISP_MUTEX>;
> +			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS1>;
> +			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0x1000 0x1000>;
> +		};
> +
>   		larb5: smi@14f02000 {
>   			compatible = "mediatek,mt8188-smi-larb";
>   			reg = <0 0x14f02000 0 0x1000>;



