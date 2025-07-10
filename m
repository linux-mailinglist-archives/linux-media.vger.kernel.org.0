Return-Path: <linux-media+bounces-37434-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 02100B00F42
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 01:09:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E2FB7B1676
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 23:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA51D2BEFF3;
	Thu, 10 Jul 2025 23:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H8Yh71qM"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0690429E10D;
	Thu, 10 Jul 2025 23:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752188928; cv=none; b=RhUsyDBqplRxHyJw54OhjvrYXwdwSxwolTQbTTMmHDOSt29p8WhQgrSKoxmH9nFGN4dcIKEs9rXDLZLRGhuqr8FPsflBFkbzaZG7o5rZ+DLhmp4Gfx3y40T1RC5Qhw+A/XjaQlvosXgVq1uTADgkY2MMXkgPZWmXUn9WdREd6bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752188928; c=relaxed/simple;
	bh=v5cEblJiF+k/jXiSINmQRV8w5aE0inYcqN0Zq9PgItk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XV0cwahx9fI7T2KjQmuuP5EsV51RGwHacmYgjpb5TD2wrDWkLSKjZCIvlGElMP5im00hIte2pOJXy0d6lCFkhBkaUzYYlaHM8XCiQkQqqri019ODMZKb8ompUahu8Rr5LEEHwxHZK9TDCLKKtqvQUpHURnoDAeFOreb95z4Ego4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H8Yh71qM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E65FC4CEE3;
	Thu, 10 Jul 2025 23:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752188927;
	bh=v5cEblJiF+k/jXiSINmQRV8w5aE0inYcqN0Zq9PgItk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H8Yh71qMkAt17Nzl11tn+JVsq12nLOiVrKKoHXmP0+l8qxkG0vLvYLcV1FHAe8fCD
	 1n1DxSSleOBA4NiD0ecfGQjyAqHSGBImgqoiwGnAiW3Qwi7HDEUKU5nXo4g8moXRAI
	 eM8sbqD8NClIg+KmphRf3NVCMQjxpaIjG6HRKLC4ftHmTXQ1yVC8uTjozUd38CcOCo
	 3ycPlS0vBEeqs9XntyFI2PDHjqQbvxP+cG09R8n4NeEfGzGRPsRl7y0Rmhg6s9IEUC
	 DHh8zCEOUHChoY20Xg/4N7+f6fg7+1A/hwTqFXSLhv64/Xh/OYewn1fuuh2zcVBXQI
	 lvkAmuzx3A6iA==
Date: Thu, 10 Jul 2025 18:08:46 -0500
From: Rob Herring <robh@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom: Add MIPI CSI2 C-PHY/DPHY
 Combo schema
Message-ID: <20250710230846.GA44483-robh@kernel.org>
References: <20250710-x1e-csi2-phy-v1-0-74acbb5b162b@linaro.org>
 <20250710-x1e-csi2-phy-v1-1-74acbb5b162b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710-x1e-csi2-phy-v1-1-74acbb5b162b@linaro.org>

On Thu, Jul 10, 2025 at 05:16:47PM +0100, Bryan O'Donoghue wrote:
> Add a base schema initially compatible with x1e80100 to describe MIPI CSI2
> PHY devices.
> 
> The hardware can support both C-PHY and D-PHY modes. The CSIPHY devices
> have their own pinouts on the SoC as well as their own individual voltage
> rails.
> 
> The need to model voltage rails on a per-PHY basis leads us to define
> CSIPHY devices as individual nodes.
> 
> Two nice outcomes in terms of schema and DT arise from this change.
> 
> 1. The ability to define on a per-PHY basis voltage rails.
> 2. The ability to require those voltage.
> 
> We have had a complete bodge upstream for this where a single set of
> voltage rail for all CSIPHYs has been buried inside of CAMSS.
> 
> Much like the I2C bus which is dedicated to Camera sensors - the CCI bus in
> CAMSS parlance, the CSIPHY devices should be individually modelled.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../phy/qcom,x1e80100-mipi-csi2-combo-phy.yaml     | 95 ++++++++++++++++++++++
>  1 file changed, 95 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-mipi-csi2-combo-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-mipi-csi2-combo-phy.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..e0976f012516452ae3632ff4732620b5c5402d3b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-mipi-csi2-combo-phy.yaml
> @@ -0,0 +1,95 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/qcom,x1e80100-mipi-csi2-combo-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm MIPI CSI2 Combo PHY
> +
> +maintainers:
> +  - Bryan O'Donoghue <bod@kernel.org>
> +
> +description:
> +  Qualcomm MIPI CSI2 C-PHY/D-PHY combination PHY. Connects MIPI CSI2 sensors
> +  to Qualcomm's Camera CSI Decoder. The PHY supports both C-PHY and D-PHY
> +  modes.
> +
> +properties:
> +  compatible:
> +    const: qcom,x1e80100-mipi-csi2-combo-phy

Kind of long. CSI2 implies MIPI and is there a non-combo phy for the 
SoC? Could drop either or both mipi and combo...

> +
> +  reg:
> +    maxItems: 1
> +
> +  "#phy-cells":
> +    const: 0
> +
> +  clocks:
> +    maxItems: 4
> +
> +  clock-names:
> +    items:
> +      - const: camnoc_axi
> +      - const: cpas_ahb

These look like the source is included in the name. Is there more than 1 
AXI and AHB bus for this device?

> +      - const: csiphy
> +      - const: csiphy_timer

Module clocks should probably come first.

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  vdda-0p8-supply:
> +    description: Phandle to a 0.8V regulator supply to a PHY.
> +
> +  vdda-1p2-supply:
> +    description: Phandle to 1.2V regulator supply to a PHY.
> +
> +  phy-type:
> +    description: D-PHY or C-PHY mode
> +    enum: [ 10, 11 ]
> +    $ref: /schemas/types.yaml#/definitions/uint32

Perhaps putting this in phy cells would be better because the consumer 
decides on the mode.

> +
> +required:
> +  - compatible
> +  - reg
> +  - "#phy-cells"
> +  - clocks
> +  - clock-names
> +  - vdda-0p8-supply
> +  - vdda-1p2-supply
> +  - phy-type
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
> +    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
> +    #include <dt-bindings/phy/phy.h>
> +
> +    csiphy0: csiphy@ace4000 {

Drop unused labels.

> +        compatible = "qcom,x1e80100-mipi-csi2-combo-phy";
> +        reg = <0x0ace4000 0x2000>;
> +        #phy-cells = <0>;
> +
> +        clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
> +                 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +                 <&camcc CAM_CC_CSIPHY0_CLK>,
> +                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>;
> +        clock-names = "camnoc_axi",
> +                      "cpas_ahb",
> +                      "csiphy",
> +                      "csiphy_timer";
> +
> +        interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
> +
> +        power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +        vdda-0p8-supply = <&vreg_l2c_0p8>;
> +        vdda-1p2-supply = <&vreg_l1c_1p2>;
> +
> +        phy-type = <PHY_TYPE_DPHY>;
> +    };
> 
> -- 
> 2.49.0
> 

