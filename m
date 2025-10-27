Return-Path: <linux-media+bounces-45635-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB04C0C51C
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 09:34:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A69D24F24DE
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 08:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A73152F0C7C;
	Mon, 27 Oct 2025 08:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="SVci1QMI"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9961C84B9;
	Mon, 27 Oct 2025 08:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761553900; cv=pass; b=L8M4YoFhvhBJOslX/qKaNc0aiXdg4R1UruKcOSW9Q0ZL3dim7NUrdm2KP4EeJH/yTj0zriM1f3Jt8VBRIddSn7dh2KpmggKy/XHSV99G+/znm7y34CWh5kmmMqfV6uSnwbCs9PxpKLmLixWZ1iYz/M0SAuEM4g4k4WlAoq6cdLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761553900; c=relaxed/simple;
	bh=McrhOuzhrnLYLJ3Yd+2aPpk7WDKuLddjS6Ppo7mJKKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DXu/bC0xy3U2lPv9BV2FusP2dg+UI2twURTHg6s5y7purKMJl8rTmaVT9ORsCs3UJ/IEnSegTqlllirmFZXllVbVh9ysUbSGScvR2+dwcaMOtaT4SYsS/5yYzf7s4gm8Fi2ALIdXC+h2/DpzWBwXc1+dcZmWfTo6bDxInU4wROE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=SVci1QMI; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4cw6DG3ZVczyS8;
	Mon, 27 Oct 2025 10:31:26 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1761553888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0vcpvhF5urzAN7K3wpgk7xwaAxcma2kFDIrKQc/Gknc=;
	b=SVci1QMIf6DQF3QJGG6IvxwWPCCbeqZpjSffOVgw1knI3OfEpMa+G6gdxdn2Yzy9prXKlg
	4raZJXlHxv1qKxzaZRr/UGPh/FRPZnDXRB1Vta9BvD/O5DZLotO3ffjLskNvHNu+getjJh
	xomqgH/huEHMNVf9Xy3nng+mq+sUZeQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1761553888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0vcpvhF5urzAN7K3wpgk7xwaAxcma2kFDIrKQc/Gknc=;
	b=OgulRCt6/GZcUbYBPfcrCRPu+lmQT1TxrG7z/LT4wj+NJisiYYy1d/gbKmn+2qOwBGr6wW
	OIb9jJlAeQSyjfmf3aQEJBs1Y+jimmhzgLgUDp6P4pYpRRQvA14BlF3pZYLcz5qFoH0gjQ
	9AwvIj8IXmsmpEnxa6Z0rjCPN78fJkk=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1761553888; a=rsa-sha256; cv=none;
	b=Z6M5vn5d0QQk5z/e5iYJ7DRxmHK4SMNRhbBubBTvj2QrecRm7CrcadKe+bud7GW1yetIvu
	VFDSbnEv4nI353DHC8Unb92tNPpPiCc/rJ4n2nUdS8IYLhbFQGtWNQWVdA10QP4wlhL4Nm
	g/G84m8AW/FJogYPDXDBuy7847tmU9o=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id A06EA634C5E;
	Mon, 27 Oct 2025 10:31:25 +0200 (EET)
Date: Mon, 27 Oct 2025 10:31:25 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
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
Subject: Re: [PATCH v3 01/31] dt-bindings: media: add DW MIPI CSI-2 Host
 support
Message-ID: <aP8t3YClrZxOnHea@valkosipuli.retiisi.eu>
References: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
 <20250821-95_cam-v3-1-c9286fbb34b9@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821-95_cam-v3-1-c9286fbb34b9@nxp.com>

Hei Eugen,

On Thu, Aug 21, 2025 at 04:15:36PM -0400, Frank Li wrote:
> From: Eugen Hristev <eugen.hristev@linaro.org>
> 
> Add bindings for Synopsys DesignWare MIPI CSI-2 host, which used at i.MX93
> and i.MX95 platform.
> 
> Signed-off-by: Luis Oliveira <lolivei@synopsys.com>
> Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change in v3
> - drop remote-endpoint: true
> - drop clock-lanes
> 
> Change in v2
> - remove Eugen Hristev <eugen.hristev@microchip.com> from mantainer.
> - update ugen Hristev's s-o-b tag to align original author's email address
> - remove single snps,dw-mipi-csi2-v150 compatible string
> - move additionalProperties after required
> ---
>  .../bindings/media/snps,dw-mipi-csi2-v150.yaml     | 151 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 152 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/snps,dw-mipi-csi2-v150.yaml b/Documentation/devicetree/bindings/media/snps,dw-mipi-csi2-v150.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..d950daa4ee9cfd504ef84b83271b2a1b710ffd6b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/snps,dw-mipi-csi2-v150.yaml
> @@ -0,0 +1,151 @@
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

If 4 is the only value supported, you can drop the property altogether.

> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +                items:
> +                  maximum: 4
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

Are both input and output of this block CSI-2 with D-PHY?

> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    csi@3000 {
> +        compatible = "fsl,imx93-mipi-csi2", "snps,dw-mipi-csi2-v150";
> +        reg = <0x03000 0x1000>;
> +        reg-names = "core";
> +        phys = <&mipi_dphy_rx 0>;
> +        phy-names = "rx";
> +        resets = <&dw_rst 1>;
> +        interrupts = <2>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +
> +                endpoint {
> +                    bus-type = <4>; /* MIPI CSI2 D-PHY */
> +                    remote-endpoint = <&camera_1>;
> +                    data-lanes = <1 2>;
> +                    clock-lanes = <0>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +
> +                endpoint {
> +                    remote-endpoint = <&idi_receiver>;
> +                    bus-type = <4>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9d9d2be7be8037dfa96f1c9edd24a0cf997b9393..ecb7bc7cc8ad797f43173075ca8973804bf335f7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15334,6 +15334,7 @@ F:	Documentation/devicetree/bindings/media/fsl,imx93-parallel-csi.yaml
>  F:	Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
>  F:	Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
>  F:	Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> +F:	Documentation/devicetree/bindings/media/snps,dw-mipi-csi2-v150.yaml
>  F:	drivers/media/platform/nxp/imx-mipi-csis.c
>  F:	drivers/media/platform/nxp/imx-parallel-csi.c
>  F:	drivers/media/platform/nxp/imx7-media-csi.c
> 

-- 
Regards,

Sakari Ailus

