Return-Path: <linux-media+bounces-5149-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D6C854B5E
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 15:28:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 633FA285695
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 14:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24B2855E4A;
	Wed, 14 Feb 2024 14:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dmN5GpzP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFC71A58B;
	Wed, 14 Feb 2024 14:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707920907; cv=none; b=nC8xQFnKPw0JSFYwO7c40tD0BV5fIJ0vbQxYQsz+JF8jsRSU+kE/BztqtQon+YpSyPi5ErjpRbHIoGvOFXFjJ+f/n3wksrUTm/2GiAMfwSNdlRKsDGPf1e/uhyNBNbz53y1NWCJ/OX9o/GneWq6rJVlXe4/O0mPRsUZlZFMG4g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707920907; c=relaxed/simple;
	bh=Fgpr7G+xiPL9+Bqa70xzdEPo/a3bsJ7epPYvlzYyGi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WTP4uICtqbi8xCNc8leUk8n+QZu8Pta9TUUneSku3YLOt0uwlJA38EBMBetk3FYumEPuZtPEOmhP+liK8+LYhGj55CPUnFgauHptZgKdhYN2dmgZ4HdyJ2ooezimPxHfHfueMz0IafgI5lmy6pw3INK2nN7is1utKQHE9xifkqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dmN5GpzP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (85-76-48-253-nat.elisa-mobile.fi [85.76.48.253])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C26D1B3;
	Wed, 14 Feb 2024 15:28:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1707920901;
	bh=Fgpr7G+xiPL9+Bqa70xzdEPo/a3bsJ7epPYvlzYyGi0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dmN5GpzPyYF8c/MW379dyWK7VZd/lBHPMga6p8Yy2Dno9bxz59ayHeT2lzbb2pMNd
	 oI/q7fQ/dQr5TcEy/kyULcmdUWkn0SjdMbm8eZvawZa9nIBdVLa2y768gbic9ZD/3m
	 3RFD3eyB4qqn6EgBymwz3Pru4rqN0kzRMy84BG+0=
Date: Wed, 14 Feb 2024 16:28:25 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, jacopo.mondi@ideasonboard.com,
	nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 2/5] dt-bindings: media: Add bindings for ARM mali-c55
Message-ID: <20240214142825.GA7873@pendragon.ideasonboard.com>
References: <20240214141906.245685-1-dan.scally@ideasonboard.com>
 <20240214141906.245685-3-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240214141906.245685-3-dan.scally@ideasonboard.com>

Hi Dan,

Thank you for the patch.

On Wed, Feb 14, 2024 at 02:19:03PM +0000, Daniel Scally wrote:
> Add the yaml binding for ARM's Mali-C55 Image Signal Processor.
> 
> Acked-by: Nayden Kanchev <nayden.kanchev@arm.com>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> Changes in v2:
> 
> 	- Added clocks information
> 	- Fixed the warnings raised by Rob
> 
>  .../bindings/media/arm,mali-c55.yaml          | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> new file mode 100644
> index 000000000000..30038cfec3a4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> @@ -0,0 +1,77 @@
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
> +      - description: ISP video clock

I wonder if we need this clock. Granted, it's an input clock to the ISP,
but it's part of the input video bus. I don't expect anyone would ever
need to control it manually, it should be provided by the video source
automatically.

> +      - description: ISP AXI clock
> +      - description: ISP AHB-lite clock

These two other clocks look good to me.

> +
> +  clock-names:
> +    items:
> +      - const: vclk
> +      - const: aclk
> +      - const: hclk
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/graph.yaml#/properties/endpoint
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - ports
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
> +      interrupts = <0>;
> +
> +      ports {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        port@0 {
> +          reg = <0>;
> +          isp_in: endpoint {
> +              remote-endpoint = <&mipi_out>;
> +          };
> +        };
> +      };
> +    };
> +...

-- 
Regards,

Laurent Pinchart

