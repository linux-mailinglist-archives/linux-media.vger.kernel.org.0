Return-Path: <linux-media+bounces-2404-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C96BE812D41
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 11:44:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0EF81C2138D
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 10:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 305B93C47D;
	Thu, 14 Dec 2023 10:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="oWZ3jLXI"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC549BD;
	Thu, 14 Dec 2023 02:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702550667;
	bh=cAT6HmiYeTlVqmi2uXEf6RyUkhAQ2o/TgivLiKg7xng=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oWZ3jLXIEj3UPozYna6D0FNBFm7legTk4Y4t7BniXyaUMxwmAwhzkg9r8Gp3XQe4j
	 tbZqks35ReyaJajZ0HLf0nWlB3zhDnGXnQ0L8Qz4QXwFFQcJu0fthEka0uiG/MGgrt
	 aKW5P+8QbPvl9Dt00r7ggoWmVFcO+D+P8iWrXjGIUONSQgiS5kJhgiV9TURHNpeiVm
	 pz2GZYxVFMALQGy/UyzsDmWqZY5uCIaSWIN4qVXaYZgKLvKGVinPLa0AaxYby8bwwY
	 iJFjB5zAdjqbDv763gVeFJpSbH7+MQw4dRYjNZQLFs5dQ1j31gMm3WwkIWp/cjyrwZ
	 dDuJq6BjOpeSA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id CD23D378000B;
	Thu, 14 Dec 2023 10:44:26 +0000 (UTC)
Message-ID: <d20c35e2-cc40-436d-90ca-4cab555874ca@collabora.com>
Date: Thu, 14 Dec 2023 11:44:26 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: mediatek: mt8186: Add venc node
Content-Language: en-US
To: Eugen Hristev <eugen.hristev@collabora.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
 matthias.bgg@gmail.com, Kyrie Wu <kyrie.wu@mediatek.com>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>
References: <20231213122017.102100-1-eugen.hristev@collabora.com>
 <20231213122017.102100-4-eugen.hristev@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231213122017.102100-4-eugen.hristev@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 13/12/23 13:20, Eugen Hristev ha scritto:
> From: Kyrie Wu <kyrie.wu@mediatek.com>
> 
> Add video encoder node.
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>
> [eugen.hristev@collabora.com: minor cleanup]
> Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8186.dtsi | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> index 66ead3f23336..8535ff2b44e9 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> @@ -1993,6 +1993,30 @@ larb7: smi@17010000 {
>   			power-domains = <&spm MT8186_POWER_DOMAIN_VENC>;
>   		};
>   
> +		venc: venc@17020000 {
> +			compatible = "mediatek,mt8183-vcodec-enc";
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			reg = <0 0x17020000 0 0x2000>;
> +			interrupts = <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH 0>;
> +			iommus = <&iommu_mm IOMMU_PORT_L7_VENC_RCPU>,
> +				 <&iommu_mm IOMMU_PORT_L7_VENC_REC>,
> +				 <&iommu_mm IOMMU_PORT_L7_VENC_BSDMA>,
> +				 <&iommu_mm IOMMU_PORT_L7_VENC_SV_COMV>,
> +				 <&iommu_mm IOMMU_PORT_L7_VENC_RD_COMV>,
> +				 <&iommu_mm IOMMU_PORT_L7_VENC_CUR_LUMA>,
> +				 <&iommu_mm IOMMU_PORT_L7_VENC_CUR_CHROMA>,
> +				 <&iommu_mm IOMMU_PORT_L7_VENC_REF_LUMA>,
> +				 <&iommu_mm IOMMU_PORT_L7_VENC_REF_CHROMA>;
> +			dma-ranges = <0x1 0x0 0x1 0x0 0x1 0x0>;
> +			mediatek,scp = <&scp>;
> +			clocks = <&vencsys CLK_VENC_CKE1_VENC>;
> +			clock-names = "MT_CG_VENC";

clock-names = "venc"; (please no underscores and please lower case)

> +			assigned-clocks = <&topckgen CLK_TOP_VENC>;
> +			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D3>;
> +			power-domains = <&spm MT8186_POWER_DOMAIN_VENC>;
> +		};


....also:

The following order of properties in device nodes is preferred:

1. "compatible"
2. "reg"
3. "ranges"
4. Standard/common properties (defined by common bindings, e.g. without
    vendor-prefixes)
5. Vendor-specific properties
6. "status" (if applicable)
7. Child nodes, where each node is preceded with a blank line

Documentation/devicetree/bindings/dts-coding-style.rst

Please reorder as per the DTS coding style document, and also please rename the
venc node to use a generic name, such as "video-encoder@xxxx"

Cheers,
Angelo

