Return-Path: <linux-media+bounces-20010-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BFB9A98A1
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 07:36:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2068E1C22F84
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 05:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFAD113A899;
	Tue, 22 Oct 2024 05:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rO6GUJnd"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F24F12F38B;
	Tue, 22 Oct 2024 05:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729575387; cv=none; b=htsdnuFtFa9NxsxT3+WuT6B1e3GEHUhMXTl1MftHXTVUDTyROZjnugB8kgezicW/02OYidaBGpe5qLdQYyqjMqhY/LDAeIG686RSkXfCzJYSpmBWmCbvPzd1Xf33XUfTsq+mtxbzJPIXcTzq6n133g/uciUpI+mvv/+xlH0SUjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729575387; c=relaxed/simple;
	bh=u7PMHWbaYwoD+m3HKWRCrVBQIUxw6mA45pdQQu+ljpY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d4NEdxK/v4378aSpU+ZZAgMX92ZdJpjzvPK/qgfy5FSbSBEJ723YAVfBDmG982bS+l7h2bDLXSezgpfntphtHue/YAn35+4iYcux2U7UDHBTz5fExykPp7P2cmNq2yIpIr6+lxgcGtTeOSYLbY2Ac3b0Q1jVKZrmeUUmTZ4zEhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rO6GUJnd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FF35C4CEC7;
	Tue, 22 Oct 2024 05:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729575386;
	bh=u7PMHWbaYwoD+m3HKWRCrVBQIUxw6mA45pdQQu+ljpY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rO6GUJndyv1kw9iqU97/yaoaIENRKgozgYuSw35ZRtOG7ui+8iaLWdiOzJlaDlSuH
	 jZdIrmU2XU16hHrk6uCZZpdi3DURETPEjfrAh8VstrEAUsQVedd6fIYSBFpbysCioN
	 DxgAAYcX0m68ILh/si3FfCYK3z4NV/xZMsfR870q8rq+TeBSZ0SKfvhkeks29lQEtj
	 pTd93iXc1mqd1nW2Sr4outC1e3xFh0IfyLm1YI5AzO5d1Dg1ZkRvULarH9eVskmfoL
	 7bK5C+W4VUaGsCjyBT13Ypz5dfXX0bAeVuoreRoQuAHOLVhJ0CJgXGGzRy3qAGxYuc
	 9xz1SdP4mAXHQ==
Message-ID: <35d27ab4-c0df-4b82-a53c-9dc8d55a6048@kernel.org>
Date: Tue, 22 Oct 2024 07:36:16 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/10] dt-bindings: media: mediatek: add camsys device
To: Shu-hsiang Yang <Shu-hsiang.Yang@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian Konig <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, yaya.chang@mediatek.com,
 teddy.chen@mediatek.com, hidenorik@chromium.org, yunkec@chromium.org,
 shun-yi.wang@mediatek.com
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
 <20241009111551.27052-2-Shu-hsiang.Yang@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20241009111551.27052-2-Shu-hsiang.Yang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/10/2024 13:15, Shu-hsiang Yang wrote:
> 1. Add camera isp7x module device document
> 2. Add camera interface device document
> 
> Signed-off-by: Shu-hsiang Yang <Shu-hsiang.Yang@mediatek.com>
> ---
>  .../media/mediatek/mediatek,cam-raw.yaml      | 169 ++++++++++++++++++
>  .../media/mediatek/mediatek,cam-yuv.yaml      | 148 +++++++++++++++
>  .../media/mediatek/mediatek,camisp.yaml       |  71 ++++++++
>  .../media/mediatek/mediatek,seninf-core.yaml  | 106 +++++++++++
>  .../media/mediatek/mediatek,seninf.yaml       |  88 +++++++++
>  5 files changed, 582 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek/mediatek,cam-raw.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek/mediatek,cam-yuv.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek/mediatek,camisp.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek/mediatek,seninf-core.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek/mediatek,seninf.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek/mediatek,cam-raw.yaml b/Documentation/devicetree/bindings/media/mediatek/mediatek,cam-raw.yaml
> new file mode 100644
> index 000000000000..c709e4bf0a18
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek/mediatek,cam-raw.yaml
> @@ -0,0 +1,169 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2024 MediaTek Inc.
> +

Drop blank line

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek/mediatek,cam-raw.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: The cam-raw unit of MediaTek ISP system
> +
> +maintainers:
> +  - Shu-hsiang Yang <shu-hsiang.yang@mediatek.com>
> +  - Shun-yi Wang <shun-yi.wang@mediatek.com>
> +  - Teddy Chen <teddy.chen@mediatek.com>
> +
> +description:
> +  MediaTek cam-raw is the camera RAW processing unit in MediaTek SoC.
> +
> +properties:
> +  compatible:
> +    const: mediatek,cam-raw

SoC specific compatible instead. I see Rob gave you review, so few more
points.
...

> +
> +  assigned-clocks:
> +    maxItems: 1
> +
> +  assigned-clock-parents:
> +    maxItems: 1

Drop assigned-clock*

> +
> +  iommus:
> +    description:
> +      Points to the respective IOMMU block with master port as argument, see
> +      Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
> +      Ports are according to the HW.
> +    minItems: 1
> +    maxItems: 32
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - power-domains
> +  - clocks
> +  - clock-names
> +  - iommus
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/power/mediatek,mt8188-power.h>
> +    #include <dt-bindings/clock/mediatek,mt8188-clk.h>
> +    #include <dt-bindings/memory/mediatek,mt8188-memory-port.h>
> +
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      cam_raw_a@16030000 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

e.g. isp

Also, underscores are not allowed in node names. Please do not send to
us your downstream code. Read DTS coding style and write code maching
upstream style.


> +        compatible = "mediatek,cam-raw";
> +        reg = <0 0x16030000 0 0x8000>,
> +              <0 0x16038000 0 0x8000>;
> +        reg-names = "base", "inner_base";
> +        mediatek,cam-id = <0>;
> +        mediatek,larbs = <&larb16a>;
> +        interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH 0>;
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +        dma-ranges = <0x2 0x0 0x0 0x40000000 0x1 0x0>;
> +        power-domains = <&spm MT8188_POWER_DOMAIN_CAM_SUBA>;
> +        clocks = <&camsys CLK_CAM_MAIN_CAM2MM0_GALS>,
> +            <&camsys CLK_CAM_MAIN_CAM2MM1_GALS>,
> +            <&camsys CLK_CAM_MAIN_CAM2SYS_GALS>,
> +            <&camsys CLK_CAM_MAIN_CAM>,
> +            <&camsys CLK_CAM_MAIN_CAMTG>,
> +            <&camsys_rawa CLK_CAM_RAWA_LARBX>,
> +            <&camsys_rawa CLK_CAM_RAWA_CAM>,
> +            <&camsys_rawa CLK_CAM_RAWA_CAMTG>,
> +            <&topckgen CLK_TOP_CAM>,
> +            <&topckgen CLK_TOP_CAMTG>,
> +            <&topckgen CLK_TOP_CAMTM>;

Messed alignment.

> +        clock-names = "camsys_cam2mm0_cgpdn",
> +            "camsys_cam2mm1_cgpdn",
> +            "camsys_cam2sys_cgpdn",
> +            "camsys_cam_cgpdn",
> +            "camsys_camtg_cgpdn",
> +            "camsys_rawa_larbx_cgpdn",
> +            "camsys_rawa_cam_cgpdn",
> +            "camsys_rawa_camtg_cgpdn",
> +            "topckgen_top_cam",
> +            "topckgen_top_camtg",
> +            "topckgen_top_camtm";

Also misaligned.

> +        assigned-clocks = <&topckgen CLK_TOP_CAM>;
> +        assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5>;
> +        iommus = <&vpp_iommu M4U_PORT_L16A_IMGO_R1>,
> +            <&vpp_iommu M4U_PORT_L16A_CQI_R1>,

Also misaligned.


All comments apply to other files as well.

Best regards,
Krzysztof


