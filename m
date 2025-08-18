Return-Path: <linux-media+bounces-40168-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE10B2ABE5
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 16:58:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D27EA016BC
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 14:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DE0735A29D;
	Mon, 18 Aug 2025 14:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IohbkpI8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9856935A280;
	Mon, 18 Aug 2025 14:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755527967; cv=none; b=ODmqKJxShQxs18J5yAsOC/OpMvy9V4usXC72k4d3lMm1BAmpGFJ8L/HtZmZdH557eu3OT2RfbdUW6UIE9cfNkwOQPlMZzXkBL42tF4strDKiFZ9HRBFsU4SERIBigGc1gcmVaPdobG8uVetf11zA8Xje6vIxbAllRQ42Q6sAnX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755527967; c=relaxed/simple;
	bh=NNGx1BhKiXpo8fP1NrAIVQqjVfRV0yTMXi9fh1F4zrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=do/NLePdXWW4RVjmkXxmoEEosd/JaKKs/BnZZjtQ1+iZ3DhgzW5nL4PA0yQb/M2ZxA9MVM8uJCEPVyqn9PLp6Ljm6wMUbfO/ijGYmeF8c4II6p5dE2WMomr/DcTm4hoMuT2HZRLsMxxtnNhBZW+J6JuoyJv1DtUz1CcgvkiImf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IohbkpI8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8C3CC4CEEB;
	Mon, 18 Aug 2025 14:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755527967;
	bh=NNGx1BhKiXpo8fP1NrAIVQqjVfRV0yTMXi9fh1F4zrg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IohbkpI8Oqjzlt/YDjYYRVYKn0OTs7UpZ3CYOJTtRM0KKfLEG1mXf7DnloIT8p/of
	 9U1LnNJ7jRGeYBndKXNgPCjeF69GvqZgWjAqN+9NvvpuGcKr8WaXJqW4aqKRulGOzW
	 sevKtR2n4c8VtLo/4jDooMKRi9n8SJtSduy/gbGw5ewRPEgrNX3zWsKXcYQkAca5LO
	 8BuUy5rdvuU99dw3mwlKHIP7zlWPI2eQP/QHENnpk+mkF247WOX6v32+l0Om8XZFmU
	 G33Nre2FH6SHIJw0k6l8TehFUFvf4uaz0WnBw4OZm26HEvRbw+F7V/CUyVUDwjRth3
	 n5Il0Pkuozg5Q==
Date: Mon, 18 Aug 2025 09:39:26 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Alice Yuan <alice.yuan@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-staging@lists.linux.dev, Luis Oliveira <lolivei@synopsys.com>
Subject: Re: [PATCH v2 01/32] dt-bindings: media: add DW MIPI CSI-2 Host
 support
Message-ID: <20250818143926.GA1025181-robh@kernel.org>
References: <20250808-95_cam-v2-0-4b29fa6919a7@nxp.com>
 <20250808-95_cam-v2-1-4b29fa6919a7@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808-95_cam-v2-1-4b29fa6919a7@nxp.com>

On Fri, Aug 08, 2025 at 06:39:04PM -0400, Frank Li wrote:
> From: Eugen Hristev <eugen.hristev@linaro.org>
> 
> Add bindings for Synopsys DesignWare MIPI CSI-2 host, which used at i.MX93
> and i.MX95 platform.
> 
> Signed-off-by: Luis Oliveira <lolivei@synopsys.com>
> Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change in v2
> - remove Eugen Hristev <eugen.hristev@microchip.com> from mantainer.
> - update ugen Hristev's s-o-b tag to align original author's email address
> - remove single snps,dw-mipi-csi2-v150 compatible string
> - move additionalProperties after required
> ---
>  .../bindings/media/snps,dw-mipi-csi2-v150.yaml     | 158 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 159 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/snps,dw-mipi-csi2-v150.yaml b/Documentation/devicetree/bindings/media/snps,dw-mipi-csi2-v150.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..fc1b167d6d3b142a01e2ea7f04230934260a05e6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/snps,dw-mipi-csi2-v150.yaml
> @@ -0,0 +1,158 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/snps,dw-mipi-csi2-v150.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Synopsys DesignWare CSI-2 Host controller (csi2host)
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +description:
> +  CSI2HOST is used to receive image coming from an MIPI CSI-2 compatible
> +  camera. It will convert the incoming CSI-2 stream into a dedicated
> +  interface called the Synopsys IDI (Image Data Interface).
> +  This interface is a 32-bit SoC internal only, and can be assimilated
> +  with a CSI-2 interface.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - fsl,imx93-mipi-csi2
> +      - const: snps,dw-mipi-csi2-v150
> +
> +  reg:
> +    items:
> +      - description: MIPI CSI-2 core register
> +
> +  reg-names:
> +    items:
> +      - const: core
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: per
> +      - const: pixel
> +
> +  phys:
> +    maxItems: 1
> +    description: MIPI D-PHY
> +
> +  phy-names:
> +    items:
> +      - const: rx
> +
> +  resets:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port node, single endpoint describing the input port.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +            description: Endpoint connected to input device
> +
> +            properties:
> +              bus-type:
> +                const: 4
> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +                items:
> +                  maximum: 4
> +
> +              clock-lanes:
> +                maxItems: 1

Drop. clock-lanes is always 1 entry.

> +
> +              remote-endpoint: true

Drop.

> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Output port node, single endpoint describing the output port.
> +
> +        properties:
> +          endpoint:
> +            unevaluatedProperties: false
> +            $ref: video-interfaces.yaml#
> +            description: Endpoint connected to output device
> +
> +            properties:
> +              bus-type:
> +                const: 4
> +
> +              remote-endpoint: true

Drop.

Rob

