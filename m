Return-Path: <linux-media+bounces-25735-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1D3A2B405
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2025 22:18:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 466B53A6B7E
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2025 21:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B73DC1DF73D;
	Thu,  6 Feb 2025 21:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HIcorzY5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E951DF25D;
	Thu,  6 Feb 2025 21:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738876697; cv=none; b=r6V4MwBSoBMcZKEmVBUfMbEnt4VnzLZbe1fNiwXO9k+qHPPWRaELPteSZgf+ZzMiXPKn1MIIUQaLTUsA8NBZvygdv9vZS4UtmOquAS26XAOuZjJZAoP1DshQiroMz+RPzCap9trTq3PTTlAUG8ugsyOuYqSjs/ZeuHgCAniqMfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738876697; c=relaxed/simple;
	bh=a9o//Z3kQXp75IfK8oqW2d3xPTbgXldqgAgvPGnV6UM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SXvHE4C+zi3P4IPq2FDYxsXeaad0zgF0FFXUA/Hn8d6okUUv79fFz7VbPKo8txyNtpxy9X+LFVkc7Y0RDt+c5ErilPznDIce8BO40h41ehQSoDqau69XsG1xQWa1WgrWaa7NdisWGPPgc16vSq7mAsMEtj7yX1nDRQSxjSwyKws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HIcorzY5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B7341227;
	Thu,  6 Feb 2025 22:16:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1738876619;
	bh=a9o//Z3kQXp75IfK8oqW2d3xPTbgXldqgAgvPGnV6UM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HIcorzY5kCIiui65WhPzYGRM2yHa4K+sORaYzMijC/QCL+w1+g4OPg1MU82u7stwj
	 qq0M/mQLFxlNuwuD3PcZhQhIV8QhnSH527Yi+wT7+73hyynYN4wn/nfv/gdzOtSPRp
	 rrkaAIDsNF3huY0t5AHXA+KyYP587Ae/UWijCJoo=
Date: Thu, 6 Feb 2025 23:18:08 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, "Guoniu.zhou" <guoniu.zhou@nxp.com>,
	Robby Cai <robby.cai@nxp.com>,
	Robert Chiras <robert.chiras@nxp.com>
Subject: Re: [PATCH v2 01/14] dt-bindings: phy: Add MIPI CSI PHY for i.MX8Q
Message-ID: <20250206211808.GA24886@pendragon.ideasonboard.com>
References: <20250205-8qxp_camera-v2-0-731a3edf2744@nxp.com>
 <20250205-8qxp_camera-v2-1-731a3edf2744@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250205-8qxp_camera-v2-1-731a3edf2744@nxp.com>

Hi Frank,

Thank you for the patch.

On Wed, Feb 05, 2025 at 12:18:10PM -0500, Frank Li wrote:
> Add MIPI CSI phy binding doc for i.MX8QXP, i.MX8QM and i.MX8ULP.

s/CSI/CSI-2/ in the subject line, here and below.
s/phy/PHY/

> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change from v1 to v2
> - Add missed fsl,imx8qm-mipi-cphy, which failback to fsl,imx8qxp-mipi-cphy
> - Move reg to required. Previous 8ulp use fsl,offset in downstream version.
> which should be reg. So move it to required
> ---
>  .../bindings/phy/fsl,imx8qxp-mipi-cphy.yaml        | 57 ++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8qxp-mipi-cphy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8qxp-mipi-cphy.yaml
> new file mode 100644
> index 0000000000000..7335b9262d0e7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/fsl,imx8qxp-mipi-cphy.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/fsl,imx8qxp-mipi-cphy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX8 SoC MIPI CSI PHY
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +properties:
> +  "#phy-cells":
> +    const: 0
> +
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - fsl,imx8qxp-mipi-cphy
> +          - fsl,imx8ulp-mipi-cphy
> +      - items:
> +          - const: fsl,imx8qm-mipi-cphy
> +          - const: fsl,imx8qxp-mipi-cphy

Why are those called cphy when, as far as I can tell from the
documentation, they are D-PHYs ? Does that stand for *C*SI PHY ? I find
it slightly confusing, but not so much that I'd ask for a change. It's
just a name at the end of the day.

Apart from that the binding looks fairly OK. Except maybe from the fact
that this device is not a PHY :-( It has two PHY control registers, but
the rest seems related to the glue logic at the output of the CSI-2
receiver. I wonder if we should go the syscon route.

> +
> +  reg:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - "#phy-cells"
> +  - compatible
> +  - reg
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx8qxp-mipi-cphy
> +    then:
> +      required:
> +        - power-domains
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    phy@58221000 {
> +            compatible = "fsl,imx8qxp-mipi-cphy";
> +            reg = <0x58221000 0x10000>;
> +            #phy-cells = <0>;
> +            power-domains = <&pd 0>;
> +    };
> +

-- 
Regards,

Laurent Pinchart

