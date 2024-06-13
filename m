Return-Path: <linux-media+bounces-13209-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDC9907C18
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 21:15:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 060121F23734
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 19:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EF0D14C58A;
	Thu, 13 Jun 2024 19:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gzUl1M7v"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34EA2F50;
	Thu, 13 Jun 2024 19:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718306138; cv=none; b=EzuA9AZT/fi1M7WuvgklvfEqFSRnsTpLB2hobTW+XUPt/Ng6E82B+qo4xeMq1FxT3U4JMCzUBcpsf+lWKfLqUuAq03BjfnBBPmZqCzK8gA+pQhqTWtMa3nbEJWp96ligESEBCLUDBjiO8N56H7KqEc8W6tSZxflH6fl+Mt7OgCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718306138; c=relaxed/simple;
	bh=PxaAEnheuEVKucWpehjXgII5Lh2MtTO4KEUYjKFPDkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fvhPNU7EhOb67xRf4bsrKXkVYCTuXNrFTyZcLnTTlv0BUR0DUiKT/Bc8hroNU+izhfe27yF3YHo+8zCF3wJdCxWWLw8JZpBEJPIj08A4p89MUwEJ9Kh1Xs9zpRsTVgO/fq8p+WB9TCUAPMzPlPBbCWL03YWYtbu28QxNkz4QmPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gzUl1M7v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08D34C2BBFC;
	Thu, 13 Jun 2024 19:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718306137;
	bh=PxaAEnheuEVKucWpehjXgII5Lh2MtTO4KEUYjKFPDkw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gzUl1M7vQrd2T8fS4MvHteaVlR1Jg0QGhIBkzYQ8VNBg0lTX2rpjj0pAC/eLgQY/e
	 6AQ8nRPOww0PlBfjVxVpfPv9MUz/a0mQzYdvhCAdVq8F4IuRuq8llzgQ03mjrSFBMp
	 +5mY9eOtmwMrpRXlt0ZSoID0xDfxfeHSYywgaxLNGv6CeG735rEWHy6IGMeMIJIypf
	 oxzJxsAAuj5LA/6v4XLmFfCiKZWRQQi9QIOcrOCZGCcOykdQ8kub+XLk8yPJGzfQuE
	 hSFCbKTpsZMyLng1o5+VvInMLoNLXzvLGq8w3AV1ghg3gNmXN1ETemlf7jYNXWkpH6
	 xNhP+d2XQzwLg==
Date: Thu, 13 Jun 2024 13:15:35 -0600
From: Rob Herring <robh@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Oded Gabbay <ogabbay@kernel.org>,
	Tomeu Vizoso <tomeu.vizoso@tomeuvizoso.net>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 3/9] dt-bindings: mailbox: rockchip,rknn: Add bindings
Message-ID: <20240613191535.GA2319626-robh@kernel.org>
References: <20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net>
 <20240612-6-10-rocket-v1-3-060e48eea250@tomeuvizoso.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612-6-10-rocket-v1-3-060e48eea250@tomeuvizoso.net>

On Wed, Jun 12, 2024 at 03:52:56PM +0200, Tomeu Vizoso wrote:
> Add the bindings for the Neural Processing Unit IP from Rockchip.

Subject is wrong. Not a mailbox...

> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> ---
>  .../devicetree/bindings/npu/rockchip,rknn.yaml     | 123 +++++++++++++++++++++
>  1 file changed, 123 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/npu/rockchip,rknn.yaml b/Documentation/devicetree/bindings/npu/rockchip,rknn.yaml
> new file mode 100644
> index 000000000000..570a4889c11c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/npu/rockchip,rknn.yaml
> @@ -0,0 +1,123 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/npu/rockchip,rknn.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Neural Processing Unit IP from Rockchip, based on NVIDIA's NVDLA
> +
> +maintainers:
> +  - Tomeu Vizoso <tomeu@tomeuvizoso.net>
> +
> +description: |+
> +  Rockchip IP for accelerating inference of neural networks, based on NVIDIA's open source NVDLA IP.

Wrap at 80.

> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - rockchip,rk3588-rknn
> +      - const: rockchip,rknn

Is there any evidence this block is 'the same' on multiple chips?

> +
> +  reg:
> +    description: Base registers for NPU cores
> +    minItems: 1
> +    maxItems: 20
> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 20
> +
> +  interrupt-names:
> +    minItems: 1
> +    maxItems: 20
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 20
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 20
> +
> +  assigned-clocks:
> +    maxItems: 1
> +
> +  assigned-clock-rates:
> +    maxItems: 1

You don't need assigned-clocks in schemas.

> +
> +  resets:
> +    minItems: 1
> +    maxItems: 20
> +
> +  reset-names:
> +    minItems: 1
> +    maxItems: 20
> +
> +  power-domains:
> +    minItems: 1
> +    maxItems: 20
> +
> +  power-domain-names:
> +    minItems: 1
> +    maxItems: 20
> +
> +  iommus:
> +    items:
> +      - description: IOMMU for all cores
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - clock-names
> +  - assigned-clocks
> +  - assigned-clock-rates

And never should be required.

> +  - resets
> +  - reset-names
> +  - power-domains
> +  - power-domain-names
> +  - iommus
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    bus {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        rknn: npu@fdab0000 {
> +          compatible = "rockchip,rk3588-rknn", "rockchip,rknn";
> +          reg = <0x0 0xfdab0000 0x0 0x9000>,
> +                <0x0 0xfdac0000 0x0 0x9000>,
> +                <0x0 0xfdad0000 0x0 0x9000>;
> +          interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH 0>,
> +                       <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH 0>,
> +                       <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH 0>;
> +          interrupt-names = "npu0_irq", "npu1_irq", "npu2_irq";

'irq' is redundant. Names with the index are also kind of pointless
unless they can be not contiguous.

> +          clocks = <&scmi_clk 0>, <&cru 1>,
> +                   <&cru 2>, <&cru 3>,
> +                   <&cru 4>, <&cru 5>,
> +                   <&cru 6>, <&cru 7>;
> +          clock-names = "clk_npu",

'clk_' is redundant.

> +                  "aclk0", "aclk1", "aclk2",
> +                  "hclk0", "hclk1", "hclk2",
> +                  "pclk";

Assuming 0, 1, 2 are cores and may vary, put all the fixed clocks first 
and then better to do "aclk0", "hclk0", "aclk1", "hclk1",...

> +          assigned-clocks = <&scmi_clk 0>;
> +          assigned-clock-rates = <200000000>;
> +          resets = <&cru 0>, <&cru 1>, <&cru 2>,
> +                   <&cru 3>, <&cru 4>, <&cru 5>;
> +          reset-names = "srst_a0", "srst_a1", "srst_a2",
> +                        "srst_h0", "srst_h1", "srst_h2";

And similar order here.

> +          power-domains = <&power 0>, <&power 1>, <&power 2>;
> +          power-domain-names = "npu0", "npu1", "npu2";
> +          iommus = <&rknpu_mmu>;
> +          status = "disabled";
> +        };
> +    };
> +...
> 
> -- 
> 2.45.2
> 

