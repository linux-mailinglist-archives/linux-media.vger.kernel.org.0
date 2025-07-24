Return-Path: <linux-media+bounces-38429-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E96B113B0
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 00:15:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D25E18927F0
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 22:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A19DA223336;
	Thu, 24 Jul 2025 22:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iIKxAq8N"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A7523BCF7;
	Thu, 24 Jul 2025 22:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753395312; cv=none; b=kVrO1EruDYNdW0JBCORVczqQnpPIR55uxaw4aVAaeeZvKhqPv0s/syo3PAUciRLg7gYDY2xObzex0Ee97CSz1eFftqBBRojn3pRV8Bxn0nUUkmI4MoxyweOzgn3BgJ6bWObfR+LVnpryh7PeHhEmZLp/w3gKuxlyIRHj8/DOex4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753395312; c=relaxed/simple;
	bh=wnDieMEk7I0tE4d8tFbRvCZXpUeQxwW/lMFB5n8RFBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kvo5iuzn+/1Bo3m9sVcw2chhC5b1EMREVgMH/x1oI8saQwlbGnJCxII5klPQghDC+4w/T68EIz+pANUTYc09Yx9m+r1ZcPI4IvWdGgkyNIiTFOCxCqtVgtIbj3jgk/LX/2sMCxnJAHMOJ34xLPW883zc0jP45zWFJgz1wGDaJjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iIKxAq8N; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 78DE4169;
	Fri, 25 Jul 2025 00:14:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753395268;
	bh=wnDieMEk7I0tE4d8tFbRvCZXpUeQxwW/lMFB5n8RFBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iIKxAq8NUNohSczhCUHjFjYjqGXvzOVyJgHf8JfWyG1deUVOrNEMGVQtTRSy2Gndc
	 2Sg3ej8KtZL7H49g0cjQdnvEkPeMXmVH26rENhDo520m1dlD7IT579WdFLK5tOkZQr
	 8evCoDc4SwrI+mq5D6iovJFdU1TD5D3YBx8Nb1m4=
Date: Fri, 25 Jul 2025 01:15:04 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank.Li@nxp.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Alice Yuan <alice.yuan@nxp.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: media: add i.MX parallel CPI support
Message-ID: <20250724221504.GB17890@pendragon.ideasonboard.com>
References: <20250708-imx8qxp_pcam-v3-0-c8533e405df1@nxp.com>
 <20250708-imx8qxp_pcam-v3-1-c8533e405df1@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250708-imx8qxp_pcam-v3-1-c8533e405df1@nxp.com>

Hi Frank,

On Tue, Jul 08, 2025 at 01:48:42PM -0400, Frank Li via B4 Relay wrote:
> From: Alice Yuan <alice.yuan@nxp.com>
> 
> Document the binding for parallel CPI controller found in i.MX8QXP, i.MX93
> and i.MX91 SoCs.
> 
> Signed-off-by: Alice Yuan <alice.yuan@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Change in v3:
> - use enum at compatible string
> - add ref to video-interfaces.yaml#
> - use cpi as node name in examples.
> - replace csi (Camera Serial Interface) with CPI (Camera Parallel Interface)
> in commit message.
> 
> Change in v2:
> - use pcif surfix as Laurent Pinchart's suggest.
> - put power-domains into required list
> ---
>  .../devicetree/bindings/media/fsl,imx93-pcif.yaml  | 126 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 127 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/fsl,imx93-pcif.yaml b/Documentation/devicetree/bindings/media/fsl,imx93-pcif.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..f92e9af371c91636cef42e48573198d4ea5e15f5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/fsl,imx93-pcif.yaml
> @@ -0,0 +1,126 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/fsl,imx93-pcif.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: i.MX8/9 Parallel Camera Interface
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +description: |
> +  This is device node for the Parallel Camera Interface which enables the
> +  chip to connect directly to external Parallel CMOS image sensors.
> +  Supports up to 80MHz input clock from sensor.
> +  Supports the following input data formats
> +    - 8-bit/10-bit Camera Sensor Interface (CSI)
> +    - 8-bit data port for RGB, YCbCr, and YUV data input
> +    - 8-bit/10-bit data ports for Bayer data input
> +  Parallel Camera Interface is hooked to the Imaging subsystem via the
> +  Pixel Link.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - fsl,imx8qxp-pcif
> +          - fsl,imx93-pcif
> +      - items:
> +          - enum:
> +              - fsl,imx91-pcif
> +          - const: fsl,imx93-pcif
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: pixel
> +      - const: ipg
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        unevaluatedProperties: false
> +        description: Input port node.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              bus-type:
> +                const: 5
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        unevaluatedProperties: false
> +        description: Output port node.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              bus-type:
> +                const: 5
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx93-clock.h>
> +    #include <dt-bindings/power/fsl,imx93-power.h>
> +
> +    cpi@4ac10070 {
> +        compatible = "fsl,imx93-pcif";
> +        reg = <0x4ac10070 0x10>;
> +        clocks = <&clk IMX93_CLK_MIPI_CSI_GATE>,
> +                 <&clk IMX93_CLK_MEDIA_APB>;
> +        clock-names = "pixel", "ipg";
> +        assigned-clocks = <&clk IMX93_CLK_CAM_PIX>;
> +        assigned-clock-parents = <&clk IMX93_CLK_VIDEO_PLL>;
> +        assigned-clock-rates = <140000000>;
> +        power-domains = <&media_blk_ctrl IMX93_MEDIABLK_PD_MIPI_CSI>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +
> +                endpoint {
> +                    remote-endpoint = <&mt9m114_ep>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +                endpoint {
> +                    remote-endpoint = <&isi_in>;
> +                };
> +            };
> +        };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8dc0f6609d1fe2e3eefd50088dbe566d9e107bfa..8ae0667d2bb41fb6a1549bd3b2b33f326cbd1303 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15107,6 +15107,7 @@ L:	linux-media@vger.kernel.org
>  S:	Maintained
>  T:	git git://linuxtv.org/media.git
>  F:	Documentation/admin-guide/media/imx7.rst
> +F:	Documentation/devicetree/bindings/media/fsl,imx93-pcif.yaml
>  F:	Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
>  F:	Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
>  F:	Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml

-- 
Regards,

Laurent Pinchart

