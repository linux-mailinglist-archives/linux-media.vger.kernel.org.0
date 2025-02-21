Return-Path: <linux-media+bounces-26646-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97745A402BE
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 23:34:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42C75864E1A
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 22:33:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 235F725332C;
	Fri, 21 Feb 2025 22:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dYjhTcww"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7FB1FF612;
	Fri, 21 Feb 2025 22:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740177188; cv=none; b=AbPMo1rQARJtGCYGozecnc1Xa3P1QhuPWXicLKiF+rMJBhB2rlx7zoDwnJuvLh9cJsC3mldhVfhz/yf4hPYYwkePWLHJ2ZEvnT4fdGNX9C+KVgzXGBci9ts6s14YcqiJxbTvSFY0q2b7ICRQkeybslypvTLgOWQ2eR4AzubcGFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740177188; c=relaxed/simple;
	bh=jhNLKKmZdBg6gC6tf7E+ph0/0dRu9QCUxQqNNWqYgC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J+ljDK6OwJBlTDADdpAY84LqqsIlxlZktv6GChKUrQJCEYkBBobDkOQGQMFzxHniY2jS6Mmw1dvOyfsCFpoV32DBINXmWl5JXa5utC5ectAOYNlStVdX7lLq7MtURlEzG2hiYrxq58U+fpRUWeJxbJpqgy0V/ldG7Tov9WJDc4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dYjhTcww; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3D05C4CEEA;
	Fri, 21 Feb 2025 22:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740177187;
	bh=jhNLKKmZdBg6gC6tf7E+ph0/0dRu9QCUxQqNNWqYgC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dYjhTcwwqkB+c0oQIgk5fXqY7qD4VMlHaawaWAbdLAgVxTx4vfF28H23IGQVv6/wW
	 F5djNnKngrl0f+naFDP4anowjcC+UUlJBfW2G90yCVkA8fnDxg9wUaVQUhJE5Rftwe
	 x6hyPuSRyFIIAjNBIj9ZU2BH0iHb2D5wtYv/wOgzovzxXuOuy365iHa/Ztyb5Vlnuw
	 C0VTKNpHdMGINUOuHbM3InaaOMmyisQGF6ZmDQbkC7iPgj1+zH7el90AjnSPPCFqc3
	 osWpNaSTdCDmB23MaI9DbNlpajc5ecKR025rkdU3EETMUctdciuGxyoF/ejPSHz9AM
	 vlLgeM8y2HUSQ==
Date: Fri, 21 Feb 2025 16:33:06 -0600
From: Rob Herring <robh@kernel.org>
To: "bo.kong" <bo.kong@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	zhaoyuan.chen@mediatek.com, teddy.chen@mediatek.com
Subject: Re: [PATCH v4 1/4] media: dt-bindings: add MT8188 AIE
Message-ID: <20250221223306.GA190439-robh@kernel.org>
References: <20250220070114.15015-1-bo.kong@mediatek.com>
 <20250220070114.15015-2-bo.kong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220070114.15015-2-bo.kong@mediatek.com>

On Thu, Feb 20, 2025 at 02:59:50PM +0800, bo.kong wrote:
> From: Bo Kong <Bo.Kong@mediatek.com>
> 
> Add YAML device tree bindings for MT8188 AIE.
> 
> Signed-off-by: Bo Kong <Bo.Kong@mediatek.com>
> ---
> Changes in v4:
> 1. Remove address-cells and size-cells
> 2. Remove larb12 related content
> 3. Update id content
> 
> Changes in v3:
> None
> 
> Changes in v2:
> 1. Fix coding style
> ---
>  .../bindings/media/mediatek,mt8188-aie.yaml   | 90 +++++++++++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8188-aie.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8188-aie.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8188-aie.yaml
> new file mode 100644
> index 000000000000..232b5afc2ad3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mt8188-aie.yaml
> @@ -0,0 +1,90 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek,mt8188-aie.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: The AI Engine Unit of MediaTek Camera System
> +
> +maintainers:
> +  - Bo Kong <bo.kong@mediatek.com>
> +
> +description:
> +  AIE(AI Engine) is one of the units in mt8188 ISP which
> +  provides hardware accelerated face detection function,
> +  it can detect different sizes of faces in a raw image.

Wrap lines at 80 char.

> +
> +properties:
> +  compatible:
> +    items:
> +      - const: mediatek,mt8188-aie
> +
> +  reg:
> +    maxItems: 1
> +    description: Physical base address and length of the register space.

Drop description. That's every 'reg' entry.

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  mediatek,larb:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Must contain the local arbiters in the current SoCs, see
> +      Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
> +      for details.
> +
> +  iommus:
> +    maxItems: 4
> +    description:
> +      Points to the respective IOMMU block with master port as argument, see
> +      Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
> +      Ports are according to the HW.

It's not really clear what the 4 entries are. Like any other property, 
the order should be defined.

> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: clock for imgsys main ipe
> +      - description: clock for ipe fdvt
> +      - description: clock for ipe top
> +
> +  clock-names:
> +    items:
> +      - const: img_ipe
> +      - const: ipe_fdvt
> +      - const: ipe_top
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - iommus
> +  - power-domains
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/memory/mediatek,mt8188-memory-port.h>
> +    #include <dt-bindings/power/mediatek,mt8188-power.h>
> +    #include <dt-bindings/clock/mediatek,mt8188-clk.h>
> +    aie@15310000 {
> +      compatible = "mediatek,mt8188-aie";
> +      reg = <0x15310000 0x1000>;
> +      interrupts = <GIC_SPI 787 IRQ_TYPE_LEVEL_HIGH 0>;
> +      iommus = <&vpp_iommu M4U_PORT_L12_FDVT_RDA_0>,
> +               <&vpp_iommu M4U_PORT_L12_FDVT_RDB_0>,
> +               <&vpp_iommu M4U_PORT_L12_FDVT_WRA_0>,
> +               <&vpp_iommu M4U_PORT_L12_FDVT_WRB_0>;
> +      power-domains = <&spm MT8188_POWER_DOMAIN_IPE>;
> +      clocks = <&imgsys CLK_IMGSYS_MAIN_IPE>,
> +               <&ipesys CLK_IPE_FDVT>,
> +               <&ipesys CLK_IPESYS_TOP>;
> +      clock-names = "img_ipe",
> +                    "ipe_fdvt",
> +                    "ipe_top";
> +    };
> -- 
> 2.45.2
> 

