Return-Path: <linux-media+bounces-15477-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 316F793F91F
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 17:09:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C854C28103E
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 15:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBD25156257;
	Mon, 29 Jul 2024 15:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="K0d48MAF"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E40415573D;
	Mon, 29 Jul 2024 15:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722265736; cv=none; b=VXKFDm6GWo/XpKlSuCQ2tW3Y7ETLkFmFW7x5v1RsvEeXlAiwNuvtjKXnAusLZQXhkJNxttFKdyj74Gd45Q5CqHpoUnOMn1dk+IAcN1/E+Q7vxPWzYlfI59ism0ErAH8aE+bqewgwtiSGU8SJ0Zn3jMCpOtfHGjC5TJSpn4ipN7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722265736; c=relaxed/simple;
	bh=aAbjuBpvIUGViH+nWkjTxRXW47KgMyjW6ht1VbHNVVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GOh3b6AzWtDzRiJMFvsoPQ5Z1iVGGp3smFIZPhi0g8X9Y8B6zm+tvPkPGkYw7Syp0XZbIZrd8GvVSOY9s7vHoskbQK9kYP8thuxQuN84j+Mo9ouf7aN7PkSjVtmBwt0lLEc1C8Gy6OpIjD9rTQfMPjUrvn0OewF4Dr31xmbBuP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=K0d48MAF; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722265733;
	bh=aAbjuBpvIUGViH+nWkjTxRXW47KgMyjW6ht1VbHNVVo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=K0d48MAFOsPJPuZxzUKierWTMxK6/6DD+ZV1qG1R++MQ9J2Ri0x7CqK2zaZSXRYdP
	 ablxsWAO3YD2/HNTwWbNeP4uBlQrzfEEJKgLAHGQpFtP4pJCIvWb2/42Ggg72+9HV8
	 ufdZ2cq0F2w5DHdukuqPRQhRxkmLmqkZCm/Rk/j3pYUGADab7p0anbLZ2PyFLoU6qc
	 K36kvascrBDl6QZGiFDt8jpjGjMZsFRrQc4SQ9S8n4z7f7ry9RHutm1hUxYOnhxwzH
	 WHStHbIV/LDFj1BLy4DFGuQmzA2xirXlS3zm55YKkADa0IZRpzLZPNtfvOuP8oxan9
	 tWvEaQllSt2Mg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 603D63780C11;
	Mon, 29 Jul 2024 15:08:50 +0000 (UTC)
Message-ID: <f2e4d8a1-f683-415d-853f-b55abdb8c27c@collabora.com>
Date: Mon, 29 Jul 2024 17:08:48 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] arm64: dts: mediatek: mt8365: Add support for
 camera
To: Julien Stephan <jstephan@baylibre.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andy Hsieh <andy.hsieh@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240729-add-mtk-isp-3-0-support-v6-0-c374c9e0c672@baylibre.com>
 <20240729-add-mtk-isp-3-0-support-v6-5-c374c9e0c672@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240729-add-mtk-isp-3-0-support-v6-5-c374c9e0c672@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 29/07/24 16:48, Julien Stephan ha scritto:
> Add base support for cameras for mt8365 platforms. This requires nodes
> for the sensor interface, camsv, and CSI receivers.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8365.dtsi | 125 +++++++++++++++++++++++++++++++
>   1 file changed, 125 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> index 24581f7410aa..cabdb51f4041 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> @@ -10,6 +10,7 @@
>   #include <dt-bindings/interrupt-controller/irq.h>
>   #include <dt-bindings/phy/phy.h>
>   #include <dt-bindings/power/mediatek,mt8365-power.h>
> +#include <dt-bindings/memory/mediatek,mt8365-larb-port.h>
>   
>   / {
>   	compatible = "mediatek,mt8365";
> @@ -703,6 +704,23 @@ ethernet: ethernet@112a0000 {
>   			status = "disabled";
>   		};
>   
> +		mipi_csi0: mipi-csi0@11c10000 {

Names must be generic. This is mipi-csi-phy@xyz or csi-phy@xyz as it looks
like it's not the entire CSI interface but just its PHY. Am I wrong?

> +			compatible = "mediatek,mt8365-csi-rx";
> +			reg = <0 0x11c10000 0 0x2000>;
> +			status = "disabled";
> +			num-lanes = <4>;
> +			#phy-cells = <1>;
> +		};
> +
> +		mipi_csi1: mipi-csi1@11c12000 {

Same for this one.

> +			compatible = "mediatek,mt8365-csi-rx";
> +			reg = <0 0x11c12000 0 0x2000>;
> +			phy-type = <PHY_TYPE_DPHY>;

...so the secondary CSIPHY only supports DPHY, while the first one supports either
C or D?

> +			status = "disabled";
> +			num-lanes = <4>;
> +			#phy-cells = <0>;

...and then, it's confusing, one CSI has got one PHY cell, one has got two?

> +		};
> +
>   		u3phy: t-phy@11cc0000 {
>   			compatible = "mediatek,mt8365-tphy", "mediatek,generic-tphy-v2";
>   			#address-cells = <1>;
> @@ -773,6 +791,113 @@ larb2: larb@15001000 {
>   			mediatek,larb-id = <2>;
>   		};
>   
> +		seninf: seninf@15040000 {
> +			compatible = "mediatek,mt8365-seninf";
> +			reg = <0 0x15040000 0 0x6000>;
> +			interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_LOW>;
> +			clocks = <&camsys CLK_CAM_SENIF>,
> +				 <&topckgen CLK_TOP_SENIF_SEL>;
> +			clock-names = "camsys", "top_mux";
> +
> +			power-domains = <&spm MT8365_POWER_DOMAIN_CAM>;
> +
> +			phys = <&mipi_csi0 PHY_TYPE_DPHY>, <&mipi_csi1>;
> +			phy-names = "csi0", "csi1";
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
> +
> +				port@3 {
> +					reg = <3>;
> +				};
> +

Empty ports, why?

Regards,
Angelo



