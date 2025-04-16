Return-Path: <linux-media+bounces-30348-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DD8A8B972
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 14:42:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5842189C66E
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 12:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2288A14375D;
	Wed, 16 Apr 2025 12:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vQf7FTiL"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DD58528E;
	Wed, 16 Apr 2025 12:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744807348; cv=none; b=sQ6+Pvoi2pC2wTF0icmK8Nh/A6Pr9lhDjVfmU6fmka8+kK8B6CqeahGCaemNqpumT9SGApLPDSfAXcrKK7buttl9zDN+US4PEdslfkkKyxKW3pSGA2df3trRz/bQqJyJCPBPEIQJun7XtjUPucGLUMCAr8xomm2PNC2KtZUwwTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744807348; c=relaxed/simple;
	bh=YaLyJ2LyojkdkHa6UjzZZ5YY5cd2AoOll8QQL7QvgqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uUNR7CsAbgkXF0M8evT2tVrXNEL+gTf0XPSDP+WuMzp6N9oeRjtmx7nt0m/k+wFUorwmMkjn+GLxrGBfr2kU5Z6lDiO5FJ3KtXmagoBRvFpx+WzgNdrpkLx1NQiWgrIdhvgO8tiSsQmZvGy19zBPsBL6o510kzkPuEuWSzGbzsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vQf7FTiL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA1CEC4CEE2;
	Wed, 16 Apr 2025 12:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744807347;
	bh=YaLyJ2LyojkdkHa6UjzZZ5YY5cd2AoOll8QQL7QvgqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vQf7FTiLueTna3mVqCVJ04IS1e4UW2CrQdmeBOPzquGZ5diNSIX8FAxdcU8mYoxrR
	 mBoNq4BK0HYCEzl+yInEai3zaXntIGCoLgrszNd6pqh+vKdITUUL6Kvw0sa4WHOAMC
	 VFlJM0Yq0Wuqyr7MHvO6gapNWev6kQC4tx1Cpa98wtzEz391rx9H23RTW7gqwxJabT
	 RbUlMSu3SEO5xx+fmo17D7Q6FMhetFapfP/Ry204hkndMr0hRjtAtEDtvmF/jycTR6
	 De4CQ5fO5g3pQMAl2v54Lg4auQmztCiPsX9JYou38B5zn+p3BmEbmaF1IvkBFhXRWM
	 UR4MoCeRknWRg==
Date: Wed, 16 Apr 2025 07:42:26 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" <linux-media@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: media: convert imx.txt to yaml format
Message-ID: <20250416124226.GA2498696-robh@kernel.org>
References: <20250414210720.3359301-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414210720.3359301-1-Frank.Li@nxp.com>

On Mon, Apr 14, 2025 at 05:07:18PM -0400, Frank Li wrote:
> Convert binding doc imx.txt to yaml format. Create two yaml files:
> fsl,imx6-mipi-csi2.yaml and fsl,imx-capture-subsystem.yaml.
> 
> Additional changes:
> - add example for fsl,imx6-mipi-csi2
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../media/fsl,imx-capture-subsystem.yaml      |  38 ++++++
>  .../bindings/media/fsl,imx6-mipi-csi2.yaml    | 126 ++++++++++++++++++
>  .../devicetree/bindings/media/imx.txt         |  53 --------
>  3 files changed, 164 insertions(+), 53 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/fsl,imx-capture-subsystem.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/fsl,imx6-mipi-csi2.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/imx.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/fsl,imx-capture-subsystem.yaml b/Documentation/devicetree/bindings/media/fsl,imx-capture-subsystem.yaml
> new file mode 100644
> index 0000000000000..77be3c1f37c5b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/fsl,imx-capture-subsystem.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/fsl,imx-capture-subsystem.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX Media Video Device
> +
> +description:
> +  This is the media controller node for video capture support. It is a
> +  virtual device that lists the camera serial interface nodes that the
> +  media device will control
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +properties:
> +  compatible:
> +    const: fsl,imx-capture-subsystem
> +
> +  ports:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description:
> +      Should contain a list of phandles pointing to camera
> +      sensor interface ports of IPU devices.
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    capture-subsystem {
> +        compatible = "fsl,imx-capture-subsystem";
> +        ports = <&ipu1_csi0>, <&ipu1_csi1>;
> +    };
> +
> diff --git a/Documentation/devicetree/bindings/media/fsl,imx6-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/fsl,imx6-mipi-csi2.yaml
> new file mode 100644
> index 0000000000000..1e69a1ff868cd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/fsl,imx6-mipi-csi2.yaml
> @@ -0,0 +1,126 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/fsl,imx6-mipi-csi2.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MIPI CSI-2 Receiver core in the i.MX SoC
> +
> +description:
> +  This is the device node for the MIPI CSI-2 Receiver core in the i.MX
> +  SoC. This is a Synopsys Designware MIPI CSI-2 host controller core
> +  combined with a D-PHY core mixed into the same register block. In
> +  addition this device consists of an i.MX-specific "CSI2IPU gasket"
> +  glue logic, also controlled from the same register block. The CSI2IPU
> +  gasket demultiplexes the four virtual channel streams from the host
> +  controller's 32-bit output image bus onto four 16-bit parallel busses
> +  to the i.MX IPU CSIs.
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +properties:
> +  compatible:
> +    const: fsl,imx6-mipi-csi2
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: hsi_tx (the D-PHY clock)
> +      - description: video_27m (D-PHY PLL reference clock)
> +      - description: eim_podf;
> +
> +  clock-names:
> +    items:
> +      - const: dphy
> +      - const: ref
> +      - const: pix
> +
> +  interrupts:
> +    maxItems: 2

Need to define each entry though the original binding is not too helpful 
there.

> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  port@0:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    unevaluatedProperties: false
> +    description:
> +      Input port node, single endpoint describing the CSI-2 transmitter.
> +
> +    properties:
> +      endpoint:
> +        $ref: video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          clock-lanes:
> +            const: 0
> +
> +          data-lanes:
> +            minItems: 1
> +            items:
> +              - const: 1
> +              - const: 2
> +              - const: 3
> +              - const: 4
> +
> +        required:
> +          - data-lanes
> +
> +patternProperties:
> +  '^port@[1-4]':

'^port@[1-4]$'

> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    unevaluatedProperties: false
> +    description:
> +      ports 1 through 4 are output ports connecting with parallel bus sink
> +      endpoint nodes and correspond to the four MIPI CSI-2 virtual channel
> +      outputs.
> +
> +    properties:
> +      endpoint@0:
> +        $ref: video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +      endpoint@1:
> +        $ref: video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx6qdl-clock.h>
> +
> +    mipi@21dc000 {
> +        compatible = "fsl,imx6-mipi-csi2";
> +        reg = <0x021dc000 0x4000>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        clocks = <&clks IMX6QDL_CLK_HSI_TX>,
> +                 <&clks IMX6QDL_CLK_VIDEO_27M>,
> +                 <&clks IMX6QDL_CLK_EIM_PODF>;
> +        clock-names = "dphy", "ref", "pix";
> +
> +        port@0 {
> +            reg = <0>;
> +
> +            endpoint {
> +                remote-endpoint = <&ov5640_to_mipi_csi2>;
> +                clock-lanes = <0>;
> +                data-lanes = <1 2>;
> +            };
> +        };

I would think at least 1 output port is required?


> +    };
> +

