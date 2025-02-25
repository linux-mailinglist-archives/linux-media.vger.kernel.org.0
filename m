Return-Path: <linux-media+bounces-26967-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C80CBA44552
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 17:03:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C2AE1886794
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 16:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAE071552F5;
	Tue, 25 Feb 2025 16:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aayJ+tLx"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2870E17A597;
	Tue, 25 Feb 2025 16:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740499373; cv=none; b=YD0saJss20nuuVlQxj8ZZTVdjQ1NiWKJfCyWOT8S/OPU+jBScFxmaj4nM+3CMApE1MpMPxfFdLjyblMDQz8N02EWnQpyDMgxBfuFIx0afzKhkYAjDoo+zwIO/NNHjRUsfzLF0ao/H8SHyQS62das11U7lo+H1nVFVmlUkVascfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740499373; c=relaxed/simple;
	bh=NKncxX/f4OhZjM586JgqScppgEm06MohF+FhDmQBvJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mz+EBbvpRHXY91ZIMXXTQBhmMWeS2CPZIgqa1hKJN4mxbnrEC5QRmxI5+t4G5cbwKegBo/wqpnPbLHEoWqIcOgGBq6BXNwQUbiKazhrwnN+urnKzoo4RCuYWpufzJy4soZSbIVOUkRKqSJJNLKcRbS7cj/3UaaHGxt6kveAVYzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aayJ+tLx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 263E1C4CEDD;
	Tue, 25 Feb 2025 16:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740499371;
	bh=NKncxX/f4OhZjM586JgqScppgEm06MohF+FhDmQBvJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aayJ+tLxA6sG7cTVHHP4hUNez7LShHiaUnSSJzHetMr0TTsIqSW1PvC+ZUJ9IylE7
	 XlWq5aGz/7ZLsFiIKCGQ+pWmDERxvEmBdfgcQNT73hLMRjK/aWv1nxDQ9Be+WUtb/9
	 IxLLTAq02Rm+/M6N3AyMn3uwkw/UY1hMjCSoMBjMSIaePE/L+Qt01+v17wK+HsdLta
	 yuvJmFvmc3hkC+asYqMSqPc7TAUKOm/snWXAHGGLreTeuo2+hfnTYI6e9APTZJVd+T
	 8oKTWtP4n5A+GLUUHGhO38M0u90xZ/OY0/wrimn3qWuhSur6TavIPSH36oLHQA9CbG
	 WLKmVFAGQ+l4A==
Date: Tue, 25 Feb 2025 10:02:48 -0600
From: Rob Herring <robh@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Oded Gabbay <ogabbay@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2 1/7] dt-bindings: npu: rockchip,rknn: Add bindings
Message-ID: <20250225160248.GA2563229-robh@kernel.org>
References: <20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net>
 <20250225-6-10-rocket-v2-1-d4dbcfafc141@tomeuvizoso.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225-6-10-rocket-v2-1-d4dbcfafc141@tomeuvizoso.net>

On Tue, Feb 25, 2025 at 08:55:47AM +0100, Tomeu Vizoso wrote:
> Add the bindings for the Neural Processing Unit IP from Rockchip.
> 
> v2:
> - Adapt to new node structure (one node per core, each with its own
>   IOMMU)
> - Several misc. fixes from Sebastian Reichel
> 
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  .../bindings/npu/rockchip,rknn-core.yaml           | 152 +++++++++++++++++++++
>  1 file changed, 152 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml b/Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..e8d0afe4a7d1c4f166cf13a9f4aa7c1901362a3f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml
> @@ -0,0 +1,152 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/npu/rockchip,rknn-core.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Neural Processing Unit IP from Rockchip
> +
> +maintainers:
> +  - Tomeu Vizoso <tomeu@tomeuvizoso.net>
> +
> +description:
> +  Rockchip IP for accelerating inference of neural networks, based on NVIDIA's
> +  open source NVDLA IP.
> +
> +properties:
> +  $nodename:
> +    pattern: '^npu-core@[a-f0-9]+$'
> +
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - rockchip,rk3588-rknn-core-top
> +          - const: rockchip,rknn-core-top

Drop the fallbacks unless you have some evidence that the IP is the 
same across a lot of SoCs. If you don't, then 
rockchip,rk3588-rknn-core-top can be the fallback whenever there are 
more compatible SoCs.

Or if there's version/feature registers that otherwise make it 
discoverable, then a common compatible is fine.

> +      - items:
> +          - enum:
> +              - rockchip,rk3588-rknn-core
> +          - const: rockchip,rknn-core

I don't understand the difference between core and core-top. That needs 
to be explained in the top-level description.

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 2
> +    maxItems: 4
> +
> +  clock-names:
> +    items:
> +      - const: aclk
> +      - const: hclk
> +      - const: npu
> +      - const: pclk
> +    minItems: 2
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  iommus:
> +    maxItems: 1
> +
> +  npu-supply: true
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 2
> +
> +  reset-names:
> +    items:
> +      - const: srst_a
> +      - const: srst_h
> +
> +  sram-supply: true

Group supply properties together

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - iommus
> +  - npu-supply
> +  - power-domains
> +  - resets
> +  - reset-names
> +  - sram-supply
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - rockchip,rknn-core-top
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 4
> +
> +        clock-names:
> +          minItems: 4
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - rockchip,rknn-core
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 2
> +        clock-names:
> +          maxItems: 2
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/rk3588-power.h>
> +    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
> +
> +    bus {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      rknn_core_top: npu-core@fdab0000 {

npu@...

> +        compatible = "rockchip,rk3588-rknn-core-top", "rockchip,rknn-core-top";
> +        reg = <0x0 0xfdab0000 0x0 0x9000>;
> +        assigned-clocks = <&scmi_clk SCMI_CLK_NPU>;
> +        assigned-clock-rates = <200000000>;
> +        clocks = <&cru ACLK_NPU0>, <&cru HCLK_NPU0>,
> +                 <&scmi_clk SCMI_CLK_NPU>, <&cru PCLK_NPU_ROOT>;
> +        clock-names = "aclk", "hclk", "npu", "pclk";
> +        interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH 0>;
> +        iommus = <&rknn_mmu_top>;
> +        npu-supply = <&vdd_npu_s0>;
> +        power-domains = <&power RK3588_PD_NPUTOP>;
> +        resets = <&cru SRST_A_RKNN0>, <&cru SRST_H_RKNN0>;
> +        reset-names = "srst_a", "srst_h";
> +        sram-supply = <&vdd_npu_mem_s0>;
> +      };
> +
> +      rknn_core_1: npu-core@fdac0000 {
> +        compatible = "rockchip,rk3588-rknn-core", "rockchip,rknn-core";
> +        reg = <0x0 0xfdac0000 0x0 0x9000>;
> +        clocks = <&cru ACLK_NPU1>, <&cru HCLK_NPU1>;
> +        clock-names = "aclk", "hclk";
> +        interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH 0>;
> +        iommus = <&rknn_mmu_1>;
> +        npu-supply = <&vdd_npu_s0>;
> +        power-domains = <&power RK3588_PD_NPU1>;
> +        resets = <&cru SRST_A_RKNN1>, <&cru SRST_H_RKNN1>;
> +        reset-names = "srst_a", "srst_h";
> +        sram-supply = <&vdd_npu_mem_s0>;
> +      };
> +    };
> +...
> 
> -- 
> 2.48.1
> 

