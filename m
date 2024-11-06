Return-Path: <linux-media+bounces-21024-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6149BF8C2
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 22:54:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71A66283F6B
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 21:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 535351DA0F5;
	Wed,  6 Nov 2024 21:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Qiq7frHc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EDB18FDA5;
	Wed,  6 Nov 2024 21:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730930083; cv=none; b=nkRCWOCBLC7zVi1qTNoqqvzdgHjevpc4wBSO3BMAn5yWXXIJSh0A/1PKEr7j7ptL4CHZwQMyI/j+UZLtQBISm03mVkQUBvhsOA6k85y/ecknEyl74geRTqZhv5i/FR5RPaLsiMTBvyhRFhXsbXy9DdEV+2WmsRahJh4TclRPaak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730930083; c=relaxed/simple;
	bh=vENICEnWjVMqE3gmHs1z3oU013ifba25gIzbAHFqT2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ruHVktvRX1uUEEfIWHOPyD1NxcaNhYDEFoyytmuth4rsn2FL0QjdCSsRcy3+USCZxEG5YAYHSr1WXuwRKLlhAVoII92sXT8XGk5C6cFD0WhLlTQxGdc2ZMsV7hNUaXcF2hTDYQ1eAo81jDooKvpxYLwtiteaNrjys68NLN6zFcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Qiq7frHc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D014A670;
	Wed,  6 Nov 2024 22:54:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730930070;
	bh=vENICEnWjVMqE3gmHs1z3oU013ifba25gIzbAHFqT2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qiq7frHc6wqs7Y6WaQAkle61hlwFJHd2vqhQWPVcCOPNDWyD9mq1rA8yke0EH1A7d
	 1Buid7tZRwDWoaWzetI8D2gbDL3L+FMvSdUH76PViMZpPWTI8dQunCYVEvsTSzi/Do
	 7dwcHh/iW88t8/KUJVHrMAmfgybuQGhoMKIUvgj8=
Date: Wed, 6 Nov 2024 23:54:32 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Anthony.McGivern@arm.com,
	jacopo.mondi@ideasonboard.com, nayden.kanchev@arm.com,
	robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
	sakari.ailus@iki.fi
Subject: Re: [PATCH v8 05/17] dt-bindings: media: Add bindings for ARM
 mali-c55
Message-ID: <20241106215432.GG21454@pendragon.ideasonboard.com>
References: <20241106100534.768400-1-dan.scally@ideasonboard.com>
 <20241106100534.768400-6-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241106100534.768400-6-dan.scally@ideasonboard.com>

Hi Dan,

Thank you for the patch.

On Wed, Nov 06, 2024 at 10:05:22AM +0000, Daniel Scally wrote:
> Add the yaml binding for ARM's Mali-C55 Image Signal Processor.
> 
> Acked-by: Nayden Kanchev <nayden.kanchev@arm.com>
> Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
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
> 
>  .../bindings/media/arm,mali-c55.yaml          | 82 +++++++++++++++++++
>  1 file changed, 82 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> new file mode 100644
> index 000000000000..efc88fd2c447
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> @@ -0,0 +1,82 @@
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

I have a feeling we may need to add an SoC-specific compatible string to
support platform-specific integration quirks. Let's see if we will have
a use for that in the RZ/V2H. It can also be addressed later if needed.

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

Doesn't the ISP have two input ports, for two exposures ? Depending on
the SoC integration, could they be connected to two different devices,
with the two connections having to be modelled in DT ? Looking at the
changelog you've switched from 'ports' to 'port' in v4, but I think we
should either have two ports right away, or be ready for a second port
later if SoC integrations requires that. That could be a good enough
reason to use 'ports' right away, even with a single port.

> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/graph.yaml#/properties/endpoint
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

-- 
Regards,

Laurent Pinchart

