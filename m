Return-Path: <linux-media+bounces-4571-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3168462EE
	for <lists+linux-media@lfdr.de>; Thu,  1 Feb 2024 22:53:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E330B26B9D
	for <lists+linux-media@lfdr.de>; Thu,  1 Feb 2024 21:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A061D3F8DB;
	Thu,  1 Feb 2024 21:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OmMb5s1Y"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019FC3FE3D;
	Thu,  1 Feb 2024 21:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706824421; cv=none; b=adaSIp7b6CL5LOY0Yw9LNeF+o765lG14CjD1yPpIP2pDB94UaEt1kVL3rwP/K4G7DZN1v/ayrfIotnDqMcOqQtagEbxOCvpBN1/0R7OaJfsvf9eusU3xSeksA8DJr/a1uikga5qWUaIKDzh72hggdbSB+c5rWfwMP7IhPqTMhGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706824421; c=relaxed/simple;
	bh=/PfD8LLZ6psxlafhPVyk8PVWnDgOmfWvSdNe88zHNqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pAkpQKvaQ5rf7L6t+uOQrX7FLwPTW6C1kSg/PkE7++QKzwSrPNVdfs6m5d9njipl/5gaCsPV0LrZTItmdBc4lmx/E+uUeiwYCFlcFZ8MxochUZX/him1gSVpN037YAytDY6Z2HXvwckKhNf+uvFRvL86uscIvRIkMCzjXmDRuA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OmMb5s1Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E6A1C433C7;
	Thu,  1 Feb 2024 21:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706824420;
	bh=/PfD8LLZ6psxlafhPVyk8PVWnDgOmfWvSdNe88zHNqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OmMb5s1YNBmZm6pl1THzxGb3f8e8tb1qY6wi+aYWbvkyD+aJBJnJHZ6Jwn4gd2W6b
	 B0C+g/zzSQA+bGdHTfhSwcjX8TzlnIqSoa20phBV4A0f3ib6UvJa7I2coMyggmgmxB
	 L6XWIZljtyoDQfBs6Upe9B0SlyMJeW4hnvE40NymCPA6wZAXl4i/WWhqGJbS2FVFXB
	 2OpF1+hcK2dQTJNQARXbGJlJ4MATLsVSy9gi7Mn8jC+Fqq73tM7lSjgitQjmSb7NYk
	 kqTSElFvB5xjSS2Ru/NKn4KW05lLqGT8N0kfrerFRXwfJvs7WQgDys+kxprk/iQ3fF
	 x+OHnwCjmIThQ==
Date: Thu, 1 Feb 2024 15:53:38 -0600
From: Rob Herring <robh@kernel.org>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, jacopo.mondi@ideasonboard.com,
	nayden.kanchev@arm.com, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
	laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 2/5] dt-bindings: media: Add bindings for ARM mali-c55
Message-ID: <20240201215338.GA1544581-robh@kernel.org>
References: <20240131164709.810587-1-dan.scally@ideasonboard.com>
 <20240131164709.810587-3-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240131164709.810587-3-dan.scally@ideasonboard.com>

On Wed, Jan 31, 2024 at 04:47:06PM +0000, Daniel Scally wrote:
> Add the yaml binding for ARM's Mali-C55 Image Signal Processor.
> 
> Acked-by: Nayden Kanchev <nayden.kanchev@arm.com>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
>  .../bindings/media/arm,mali-c55.yaml          | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> new file mode 100644
> index 000000000000..83000175aeda
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> @@ -0,0 +1,51 @@
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
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/graph.yaml#/properties/endpoint
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - port

Surely some clocks are needed.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    mali_c55: isp@400000 {
> +      compatible = "arm,mali-c55";
> +      reg = <0x400000 0x200000>;
> +      interrupts = <0>;
> +
> +      port@0 {
> +        isp_in: endpoint@0 {
> +          remote-endpoint = <&mipi_out>;
> +        };
> +      };
> +    };
> +...
> -- 
> 2.34.1
> 

