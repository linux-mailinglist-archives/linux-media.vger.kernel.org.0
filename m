Return-Path: <linux-media+bounces-25606-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2A2A2664E
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 23:02:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 219FB16537A
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 22:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC5B520FAAB;
	Mon,  3 Feb 2025 22:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oMpqO6Vk"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3731F182B4;
	Mon,  3 Feb 2025 22:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738620152; cv=none; b=Xpn8QlQvRPTcSVfjbbHbrICowPlcZGJICbC7uT2e6JZgrFrM3AEMWIUmJq6tROWV2ngJu7FdBdabK5AnPfb4u3wcMkX5/P+R840kM8JuTY74xW/Wm3oGFOi0uzEIcAc5EZn3L5jfZfu7IY1GKPVLJ4lDJSUbGfCWkRxtcEp82+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738620152; c=relaxed/simple;
	bh=4MG6GO9DO9XXRUtRL6e1XPm8IlP29lzu4zko2OYSN4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WH0JojDfwarNyS8k/QgG1keMSLG6uqC+yscvK0OBGlakOg6d70gEY2W34HgLMTClhZs1u7b61SZTgUh2ESwKN1v2Gfy7g4pWJ01BHE2JEMsudxhsD/qaw5h6RrOepmL1flJitlJOtdTBicxVzEn5OhYBdh1LGxDrSsddSRZt3z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oMpqO6Vk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F7D4C4CED2;
	Mon,  3 Feb 2025 22:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738620151;
	bh=4MG6GO9DO9XXRUtRL6e1XPm8IlP29lzu4zko2OYSN4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oMpqO6VkqzpV+wbAibm7M8luRjJhxkCgqeGU7rn9lXqAg4ZtVc1T5FmKx3eq6W2xG
	 consJmclmmkd7RVsl+PIG1Q+LinmL9Pdm8cQUnkzO1Z0+W8n8tv68OC6VXmiEkUuTv
	 XKrEH3CIw0jZ3VZTlKR6LaRLO1+2hFrG/0zATTbcycZoicVhtSsWTp5Y08uOMR9dYk
	 SrsKZaSDuCfNnW9LmkBev3uEA6lv01VdSgyO5nYUzYJ370KV1Jz3F8blq6rLpDsyxx
	 I86WpWwDG0MWroQky/1hjH/4JLm8IbI1FwI92BqwtDQ67KZN6WMGZahMdroT3yz7vS
	 WEucqe692Lp4Q==
Date: Mon, 3 Feb 2025 16:02:30 -0600
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, "Guoniu.zhou" <guoniu.zhou@nxp.com>,
	Robby Cai <robby.cai@nxp.com>,
	Robert Chiras <robert.chiras@nxp.com>
Subject: Re: [PATCH 01/14] dt-bindings: phy: Add MIPI CSI PHY for i.MX8Q
Message-ID: <20250203220230.GA120569-robh@kernel.org>
References: <20250131-8qxp_camera-v1-0-319402ab606a@nxp.com>
 <20250131-8qxp_camera-v1-1-319402ab606a@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131-8qxp_camera-v1-1-319402ab606a@nxp.com>

On Fri, Jan 31, 2025 at 04:33:46PM -0500, Frank Li wrote:
> Add MIPI CSI phy binding doc for i.MX8QXP, i.MX8QM and i.MX8ULP.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/phy/fsl,imx8qxp-mipi-cphy.yaml        | 53 ++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8qxp-mipi-cphy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8qxp-mipi-cphy.yaml
> new file mode 100644
> index 0000000000000..c6cbedd9ed114
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/fsl,imx8qxp-mipi-cphy.yaml
> @@ -0,0 +1,53 @@
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
> +    enum:
> +      - fsl,imx8qxp-mipi-cphy
> +      - fsl,imx8ulp-mipi-cphy

Where's imx8qm?

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
> +        - reg

How is the device accessed with no registers?

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
> 
> -- 
> 2.34.1
> 

