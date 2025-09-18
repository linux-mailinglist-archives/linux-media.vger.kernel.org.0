Return-Path: <linux-media+bounces-42449-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 792B6B55129
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 16:24:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BFD03AC31E
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 14:24:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B0A431E0E7;
	Fri, 12 Sep 2025 14:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XLCKDDoI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7E331D759
	for <linux-media@vger.kernel.org>; Fri, 12 Sep 2025 14:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757686919; cv=none; b=eFPJJsvMkzwp9IT6A1vJxAiFvVYGGOzLl5eMZyQc+FLPTnb857ZzHAGmlO/cgMnZVR/l4QswsBma7JZcURI1jLNcqOM36X0kh21eS0QxqGeC7elt5n07z0Y20sR87+KwvMPJzbguKki+yLwwr94ivAYJxNnqJ4F2P/1nVFSh0PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757686919; c=relaxed/simple;
	bh=siDtpOyPHlJogKpoK1uQHvD+1Dw/J9WYVT9JVE2rw54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FPulmoe3AXugcxfbVEROEuF93X4Kt9F0syjU12K/Aq2+raDYFSpS0BkHW3ZRGLoOqRSXDylmje4CvXVYib3XG8GyCokheQIDpWc1dXusf3QR5zboM4Dz7EduCbrkjCCHjoqrgX181SKRpnW5LcnhTsCuYx7xcQ9DFMHJ71wlZ7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XLCKDDoI; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3d3ff4a4d6fso1560330f8f.0
        for <linux-media@vger.kernel.org>; Fri, 12 Sep 2025 07:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757686915; x=1758291715; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zESS1ySkymLTPY0hw83hB8DWQtQJQL+KqOm/xeYktnM=;
        b=XLCKDDoIa/CBBQnI483eoj+HaFcMyv4s5BjclVw20aOWf9TFWhm/qDv3QJF1+7/GAo
         Tekvh2vDNARcV2ByjJ30Vnba1OiSxjbH2X0D5sHTJ8VdsQ/KCyfLCzu8FLUYWldRbGq5
         YlO0ywhaFQ8AQWmR/n981kOBrX8LOtDy2LEdqdER70rXenWnswNdSC6L8SViG+FjSe6M
         398t/hc2YQXWPvN5MBuv3hPMj8AIQGePEyICSIPn1CqkkxjjVE0EEr5sX9TqXZJPtEiU
         t7Cq8HClqk+5zmURXZWb56mHvBj0/RZc6c9fi01I1+FUVfBNglZUwR+BXx0R5YtGAZtv
         hM0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757686915; x=1758291715;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zESS1ySkymLTPY0hw83hB8DWQtQJQL+KqOm/xeYktnM=;
        b=WqEZZDv/uWNXbSGPvmBeViL5e9ZQs9RcyFiETXP2A2I44dcBh0DgTKuS1CNzm+Z/zb
         FY9ES6xQGVkt7ZI7v6SVjq/mweQrmDAGQI/NWXm+dVD7eaCTJdaszKuqPgOOo00ra9Rx
         K+Pj1zXzKmKoyPtjYX022MuhIUAxIHrckirPlpH14sVhVCWs5Ua8m+X4ycyE30eeiiKv
         3jlu4PONMBbo6aNHFvNCOGur+kaf1KGWv0D4ucfxwWsL9e2oXcbeufA4Ve8Vh0EhcXxu
         yHFPfPTvhRZhDE+//dYVFfrAUVEeA0GwyiyVnIYB13N3j83+r+WyYC1ZZujzn5HAo2hl
         vC2w==
X-Forwarded-Encrypted: i=1; AJvYcCVastti2Tz95dTVmlTPQLjcGJcHOlFKlvWPgmYqzJ8BGL3CBq0ZhuECoN6W9CHrsvcc68nD1HOYy11Naw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yym8JECK4JCnvRsEQvtC5C14GYBt2H4MIGvsk7a0Zc3ibs+ObiA
	+d/K0sFi17T430VnloCSEeLKJA2l+WIZ4GuhRavtl8gDCGoHy9Jcy5t2
X-Gm-Gg: ASbGncs8B1Qi5PzJEHF6lsUuXp024hdRTFQlY+VQ2vqki0L4yIYQRirOvL9FM+BH0fm
	LdJsV5c12uNkCmQPrlBhjAk2oUU8+0/16zn9GzRylbl12QtlOgjxvWpdtXrScrmPNP6ACwTtRBR
	rqAgmWDwrJyy3t7vTgLDiIbjlQTWgOfx1jfgyGlk9LJZXgKbLKX3JbOLGLMtPmbuxmR25PIcd/D
	6JCtkXA6lI4yl6Tx+zvJbOSHaxIzpDkWB1nBWcJl9EURz0O4THyfnwF+jHu8WeQqtiTMdi5dEuo
	vFcnqVznDIjeKUdABHwUY74xLdiBRcRwylgGA8om4+ZS/KO/INMQm8B6EpZjAgoke1ke4+wxdr+
	BrCCBDPNxVdQZ/GAfrmtoxAOIEhDtRUD3J7rRBIdABA==
X-Google-Smtp-Source: AGHT+IH9tJVloCbXIz91BDgTphPMX9koCByRsNlQtJ6Ob3jZPlH+RpEgqZOqPbkwhlkvGUM18ooTpQ==
X-Received: by 2002:a05:6000:40cb:b0:3da:d015:bf84 with SMTP id ffacd0b85a97d-3e7659cc7e2mr3361179f8f.25.1757686915029;
        Fri, 12 Sep 2025 07:21:55 -0700 (PDT)
Received: from [192.168.2.177] ([91.116.220.47])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607878c9sm6750010f8f.26.2025.09.12.07.21.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 07:21:54 -0700 (PDT)
Message-ID: <78130188-62b4-4206-abd7-7d50157a6b76@gmail.com>
Date: Fri, 12 Sep 2025 16:19:35 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 34/38] arm64: dts: mediatek: mt8195: Fix ranges for jpeg
 enc/decoder nodes
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, robh@kernel.org
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, krzk+dt@kernel.org,
 conor+dt@kernel.org, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, jassisinghbrar@gmail.com,
 mchehab@kernel.org, chunfeng.yun@mediatek.com, vkoul@kernel.org,
 kishon@kernel.org, sean.wang@kernel.org, linus.walleij@linaro.org,
 lgirdwood@gmail.com, broonie@kernel.org, andersson@kernel.org,
 mathieu.poirier@linaro.org, daniel.lezcano@linaro.org, tglx@linutronix.de,
 atenart@kernel.org, jitao.shi@mediatek.com, ck.hu@mediatek.com,
 houlong.wei@mediatek.com, kyrie.wu@mediatek.corp-partner.google.com,
 andy.teng@mediatek.com, tinghan.shen@mediatek.com, jiaxin.yu@mediatek.com,
 shane.chien@mediatek.com, olivia.wen@mediatek.com, granquet@baylibre.com,
 eugen.hristev@linaro.org, arnd@arndb.de, sam.shih@mediatek.com,
 jieyy.yang@mediatek.com, frank-w@public-files.de, mwalle@kernel.org,
 fparent@baylibre.com, linux-crypto@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-35-angelogioacchino.delregno@collabora.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20250724083914.61351-35-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/07/2025 10:39, AngeloGioacchino Del Regno wrote:
> The jpeg decoder main node is under the soc bus but currently has
> no ranges or reg specified, while the children do, and this is
> wrong in multiple aspects.
> 
> The very same is also valid for the jpeg encoder node.
> 
> Rename the decoder and encoder nodes to "jpeg-decoder@1a040000"
> and to "jpeg-encoder@1a030000" respectively, and change their
> children to use the newly defined ranges.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks

> ---
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 30 +++++++++++++-----------
>   1 file changed, 16 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index dd065b1bf94a..35b10082bb89 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -3014,7 +3014,7 @@ venc: video-codec@1a020000 {
>   			#size-cells = <2>;
>   		};
>   
> -		jpgdec-master {
> +		jpeg-decoder@1a040000 {
>   			compatible = "mediatek,mt8195-jpgdec";
>   			power-domains = <&spm MT8195_POWER_DOMAIN_VDEC1>;
>   			iommus = <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA0>,
> @@ -3025,11 +3025,12 @@ jpgdec-master {
>   				 <&iommu_vdo M4U_PORT_L19_JPGDEC_BUFF_OFFSET0>;
>   			#address-cells = <2>;
>   			#size-cells = <2>;
> -			ranges;
> +			ranges = <0 0 0 0x1a040000 0 0x20000>,
> +				 <1 0 0 0x1b040000 0 0x10000>;
>   
> -			jpgdec@1a040000 {
> +			jpgdec@0,0 {
>   				compatible = "mediatek,mt8195-jpgdec-hw";
> -				reg = <0 0x1a040000 0 0x10000>;/* JPGDEC_C0 */
> +				reg = <0 0 0 0x10000>;/* JPGDEC_C0 */
>   				iommus = <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA0>,
>   					 <&iommu_vdo M4U_PORT_L19_JPGDEC_BSDMA0>,
>   					 <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA1>,
> @@ -3042,9 +3043,9 @@ jpgdec@1a040000 {
>   				power-domains = <&spm MT8195_POWER_DOMAIN_VDEC0>;
>   			};
>   
> -			jpgdec@1a050000 {
> +			jpgdec@0,10000 {
>   				compatible = "mediatek,mt8195-jpgdec-hw";
> -				reg = <0 0x1a050000 0 0x10000>;/* JPGDEC_C1 */
> +				reg = <0 0 0x10000 0x10000>;/* JPGDEC_C1 */
>   				iommus = <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA0>,
>   					 <&iommu_vdo M4U_PORT_L19_JPGDEC_BSDMA0>,
>   					 <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA1>,
> @@ -3057,9 +3058,9 @@ jpgdec@1a050000 {
>   				power-domains = <&spm MT8195_POWER_DOMAIN_VDEC1>;
>   			};
>   
> -			jpgdec@1b040000 {
> +			jpgdec@1,0 {
>   				compatible = "mediatek,mt8195-jpgdec-hw";
> -				reg = <0 0x1b040000 0 0x10000>;/* JPGDEC_C2 */
> +				reg = <1 0 0 0x10000>;/* JPGDEC_C2 */
>   				iommus = <&iommu_vpp M4U_PORT_L20_JPGDEC_WDMA0>,
>   					 <&iommu_vpp M4U_PORT_L20_JPGDEC_BSDMA0>,
>   					 <&iommu_vpp M4U_PORT_L20_JPGDEC_WDMA1>,
> @@ -3088,7 +3089,7 @@ vdosys0: syscon@1c01a000 {
>   		};
>   
>   
> -		jpgenc-master {
> +		jpeg-encoder@1a030000 {
>   			compatible = "mediatek,mt8195-jpgenc";
>   			power-domains = <&spm MT8195_POWER_DOMAIN_VENC_CORE1>;
>   			iommus = <&iommu_vpp M4U_PORT_L20_JPGENC_Y_RDMA>,
> @@ -3097,11 +3098,12 @@ jpgenc-master {
>   					<&iommu_vpp M4U_PORT_L20_JPGENC_BSDMA>;
>   			#address-cells = <2>;
>   			#size-cells = <2>;
> -			ranges;
> +			ranges = <0 0 0 0x1a030000 0 0x10000>,
> +				 <1 0 0 0x1b030000 0 0x10000>;
>   
> -			jpgenc@1a030000 {
> +			jpgenc@0,0 {
>   				compatible = "mediatek,mt8195-jpgenc-hw";
> -				reg = <0 0x1a030000 0 0x10000>;
> +				reg = <0 0 0 0x10000>;
>   				iommus = <&iommu_vdo M4U_PORT_L19_JPGENC_Y_RDMA>,
>   						<&iommu_vdo M4U_PORT_L19_JPGENC_C_RDMA>,
>   						<&iommu_vdo M4U_PORT_L19_JPGENC_Q_TABLE>,
> @@ -3112,9 +3114,9 @@ jpgenc@1a030000 {
>   				power-domains = <&spm MT8195_POWER_DOMAIN_VENC>;
>   			};
>   
> -			jpgenc@1b030000 {
> +			jpgenc@1,0 {
>   				compatible = "mediatek,mt8195-jpgenc-hw";
> -				reg = <0 0x1b030000 0 0x10000>;
> +				reg = <1 0 0 0x10000>;
>   				iommus = <&iommu_vpp M4U_PORT_L20_JPGENC_Y_RDMA>,
>   						<&iommu_vpp M4U_PORT_L20_JPGENC_C_RDMA>,
>   						<&iommu_vpp M4U_PORT_L20_JPGENC_Q_TABLE>,


