Return-Path: <linux-media+bounces-35843-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C89BFAE753D
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 05:27:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38EC517BB69
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 03:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C09361DA60F;
	Wed, 25 Jun 2025 03:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o2daXyu1"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2633ECA5E;
	Wed, 25 Jun 2025 03:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750822026; cv=none; b=HXQ/O0Fq6W8pW/0SYWllxSzfgAZOKejcV4PR/h5vK+wk7yZnJYPs9N1wisPU/A/lvvcLoNyYNP/Ds0cYWXpCSVAvwq4R003SFSQWIclcwGuEXG1MIJ+iUgDyGIlNqmpL/zxZNQeX5dWJBqpqUR0GUSrJQ5GZCjaRJGk/1ui1FWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750822026; c=relaxed/simple;
	bh=g8yJbDRU3cigldhY2jqAOJeXToTfsEDC/4DEmKLPWWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oBQfH/MPF9p4HojZ3nLQIahJd/TfTTZo1IOB+9bmVWQiONUkP1q+EXeaUbISoOdfkjHAsrYV4IXzVIi2C/f/0wTBCqSMifT06rfQAI8aOAjWiZpZArWuA/K9OqPF9HnxxkT8cie2eHB5k05WUyqRZroJj8U/K/0OjZQ41scBSm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o2daXyu1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E88EC4CEE3;
	Wed, 25 Jun 2025 03:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750822025;
	bh=g8yJbDRU3cigldhY2jqAOJeXToTfsEDC/4DEmKLPWWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o2daXyu1mjcbU+WNa1Hiu8jmZ3UJdwfSQU96P8Zd2FSxQnnGPdN0LjmXFDnswdIb9
	 S04xiCXepWjrXqkU4SlgUejuciGOrrFoAe6lKClL+DqaVUOvgtwuHmEDuiVITGc95U
	 R4dUheblRKk172WbPW4bbuNXSABw7yWyf6Mqyo+MFHDK3npR0gPHmclnWxO3lYlg/m
	 2ANBAWl4y+dCe/rbzM0xxwDt/NIikHQbdwaDtqOUadQGVWuHah+btzObG55/Wl1fp/
	 jcIyp0wcD70eLgmlyiF9jHmV98kumRqBdzRrLEUtpamzvf/h9212ex4grqMwT7MBxh
	 uR9Il1AAbY0Pw==
Date: Tue, 24 Jun 2025 22:27:04 -0500
From: Rob Herring <robh@kernel.org>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Anthony.McGivern@arm.com,
	jacopo.mondi@ideasonboard.com, nayden.kanchev@arm.com,
	mchehab@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, jerome.forissier@linaro.org,
	kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v10 05/17] dt-bindings: media: Add bindings for ARM
 mali-c55
Message-ID: <20250625032704.GA2501351-robh@kernel.org>
References: <20250624-c55-v10-0-54f3d4196990@ideasonboard.com>
 <20250624-c55-v10-5-54f3d4196990@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624-c55-v10-5-54f3d4196990@ideasonboard.com>

On Tue, Jun 24, 2025 at 11:21:18AM +0100, Daniel Scally wrote:
> Add the yaml binding for ARM's Mali-C55 Image Signal Processor.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Nayden Kanchev <nayden.kanchev@arm.com>
> Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> Changes in v10:
> 
> 	- None
> 
> Changes in v9:
> 
> 	- Added the arm,inline_mode property to differentiate between inline and
> 	  memory input configurations
> 
> Changes in v8:
> 
> 	- Added the video clock back in. Now that we have actual hardware it's
> 	  clear that it's necessary.
> 	- Added reset lines
> 	- Dropped R-bs
> 
> Changes in v7:
> 
> 	- None
> 
> Changes in v6:
> 
> 	- None
> 
> Changes in v5:
> 
> 	- None
> 
> Changes in v4:
> 
> 	- Switched to port instead of ports
> 
> Changes in v3:
> 
> 	- Dropped the video clock as suggested by Laurent. I didn't retain it
> 	for the purposes of the refcount since this driver will call .s_stream()
> 	for the sensor driver which will refcount the clock anyway.
> 	- Clarified that the port is a parallel input port rather (Sakari)
> 
> Changes in v2:
> 
> 	- Added clocks information
> 	- Fixed the warnings raised by Rob
> ---
>  .../devicetree/bindings/media/arm,mali-c55.yaml    | 89 ++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..539fa8163bd07cf8a80c361012400cbcc7d073eb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> @@ -0,0 +1,89 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/arm,mali-c55.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ARM Mali-C55 Image Signal Processor
> +
> +maintainers:
> +  - Daniel Scally <dan.scally@ideasonboard.com>
> +  - Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> +
> +properties:
> +  compatible:
> +    const: arm,mali-c55
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: ISP Video Clock
> +      - description: ISP AXI clock
> +      - description: ISP AHB-lite clock
> +
> +  clock-names:
> +    items:
> +      - const: vclk
> +      - const: aclk
> +      - const: hclk
> +
> +  resets:
> +    items:
> +      - description: vclk domain reset
> +      - description: aclk domain reset
> +      - description: hclk domain reset
> +
> +  reset-names:
> +    items:
> +      - const: vresetn
> +      - const: aresetn
> +      - const: hresetn
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description: Input parallel video bus
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/graph.yaml#/properties/endpoint
> +
> +  arm,inline_mode:

arm,inline-mode

> +    description:
> +      The ISP can be either electrically connected to sensor and CSI-2 receiver
> +      or driven through a DMA input device. This property declares the ISP as
> +      being electrically connected to the source of image data.
> +    type: boolean
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    mali_c55: isp@400000 {

Drop unused labels.

> +      compatible = "arm,mali-c55";
> +      reg = <0x400000 0x200000>;
> +      clocks = <&clk 0>, <&clk 1>, <&clk 2>;
> +      clock-names = "vclk", "aclk", "hclk";
> +      resets = <&resets 0>, <&resets 1>, <&resets 2>;
> +      reset-names = "vresetn", "aresetn", "hresetn";
> +      interrupts = <0>;
> +
> +      port {
> +        isp_in: endpoint {
> +            remote-endpoint = <&csi2_rx_out>;
> +        };
> +      };
> +    };
> +...
> 
> -- 
> 2.34.1
> 

