Return-Path: <linux-media+bounces-26584-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0ABA3F6EC
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 15:13:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1BBFF1899680
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 14:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42E4B20F07F;
	Fri, 21 Feb 2025 14:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E4V+FGgM"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE625433DE;
	Fri, 21 Feb 2025 14:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740147205; cv=none; b=P9X0OQz3ctMuCTFPr4fSAgdNx6dhkZanxUEiMsaoTOC3eZN+YYEXD6ljpfWTog0eW33+O+UT22dbnGkS633DKeZa/C8gjHM0IQFENHyA7tV9wDbvahcy3rkjCuNNF299lf0h/sF5fRcZ9e5OfE4AlgUfwszzBUm54ucXXaX38Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740147205; c=relaxed/simple;
	bh=Rdw7VcsQXfPz8ijFFRK9pCO/RD7kMR5M0Z/uSgEDHcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EykDFFxpAFB0mvsVeEUm6hpVoMuslynDqvU/gFOkDffDSaNFTInw0rvMAwh3DLTpFdZcaLvVClQ/n7SYDmgCNpTB8Ukk8fdYM2m5KOzj0WOdOp0nN2hcDfB+4PI/wPmMaNQ1P5MNKBIqBH6M2to/mjZPsD/4qz18zIiqX26RCMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E4V+FGgM; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740147204; x=1771683204;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Rdw7VcsQXfPz8ijFFRK9pCO/RD7kMR5M0Z/uSgEDHcs=;
  b=E4V+FGgMeFEMoyeauFsbzatVvwZo9rI0kc6cYtZLdZtp/7+AXeqpG+G4
   QPdQxvKOIlD1dbU03pAq4gs/xMlGOObnnz1qhl7BzHBHdiqKZ49znveVC
   a/XzjliS8a0lzODEXZk32XoNpJaVgw6NxKihKyZdVVESua+SM2eOOHMo9
   P9tUp2qWvXyVBCM7AFXgGbN2/8Vuo9ZCH2V2pUzee3i8g6AgX3s+OSXu7
   HuMyRDXj78WzfH2CEKwO+5vvagu9AjbjUvFWiBZJh9AfYKmIz1g+hMZ5L
   7rXllncBj/NLeiUAsh9ij/7FlMiPoyQ7y+sp3b16O9PBtLdfcpUzn0EwJ
   Q==;
X-CSE-ConnectionGUID: wveR+8v0TJaNKM8PX3j3Lw==
X-CSE-MsgGUID: cs9z5RIFSfy08XVWNdpOMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="41105529"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="41105529"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 06:13:23 -0800
X-CSE-ConnectionGUID: kuWEpc3JQdWW113ZADD5WQ==
X-CSE-MsgGUID: r9mxKPfoREW6/MVEd3c6sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="115099483"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 06:13:16 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E5D12120289;
	Fri, 21 Feb 2025 16:13:13 +0200 (EET)
Date: Fri, 21 Feb 2025 14:13:13 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Michael Riesch <michael.riesch@wolfvision.net>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 04/11] media: dt-bindings: media: add bindings for
 rockchip mipi csi host
Message-ID: <Z7iJ-UaLabqK4ZhY@kekkonen.localdomain>
References: <20250219-v6-8-topic-rk3568-vicap-v4-0-e906600ae3b0@wolfvision.net>
 <20250219-v6-8-topic-rk3568-vicap-v4-4-e906600ae3b0@wolfvision.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219-v6-8-topic-rk3568-vicap-v4-4-e906600ae3b0@wolfvision.net>

Hi Michael,

On Wed, Feb 19, 2025 at 11:16:35AM +0100, Michael Riesch wrote:
> Add documentation for the Rockchip RK3568 MIPI CSI-2 Host unit.
> 
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> ---
>  .../bindings/media/rockchip,rk3568-mipi-csi.yaml   | 123 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 124 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml
> new file mode 100644
> index 000000000000..288941686e96
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml
> @@ -0,0 +1,123 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip RK3568 MIPI CSI-2 Host
> +
> +maintainers:
> +  - Michael Riesch <michael.riesch@wolfvision.net>
> +
> +description:
> +  The Rockchip RK3568 MIPI CSI-2 Host is a CSI-2 bridge with one input port
> +  and one output port. It receives the data with the help of an external
> +  MIPI PHY (C-PHY or D-PHY) and passes it to the Rockchip RK3568 Video Capture
> +  (VICAP) block.
> +
> +properties:
> +  compatible:
> +    const: rockchip,rk3568-mipi-csi
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  phys:
> +    maxItems: 1
> +    description: MIPI C-PHY or D-PHY.
> +
> +  phy-names:
> +    items:
> +      - const: csiphy
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
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
> +          Input port node. Connect to e.g., a MIPI CSI-2 image sensor.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              bus-type:
> +                enum: [1, 4]
> +
> +            required:
> +              - bus-type
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Output port node. Connect to RK3568 VICAP MIPI CSI-2 port.

What's the purpose of a port node without an endpoint?

> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - phys
> +  - phy-names
> +  - ports
> +  - power-domains
> +  - resets
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/rk3568-cru.h>
> +    #include <dt-bindings/power/rk3568-power.h>
> +
> +    parent {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        csi: csi@fdfb0000 {
> +            compatible = "rockchip,rk3568-mipi-csi";
> +            reg = <0x0 0xfdfb0000 0x0 0x10000>;
> +            clocks = <&cru PCLK_CSI2HOST1>;
> +            phys = <&csi_dphy>;
> +            phy-names = "csiphy";
> +            power-domains = <&power RK3568_PD_VI>;
> +            resets = <&cru SRST_P_CSI2HOST1>;
> +            status = "disabled";
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                csi_in: port@0 {
> +                    reg = <0>;
> +                };
> +
> +                csi_out: port@1 {
> +                    reg = <1>;
> +
> +                    csi_output: endpoint {
> +                        remote-endpoint = <&vicap_mipi_input>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cd8fa1afe5eb..d83a7762dbe3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20407,6 +20407,7 @@ M:	Michael Riesch <michael.riesch@wolfvision.net>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/media/rockchip,px30-vip.yaml
> +F:	Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml
>  F:	Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
>  
>  ROCKCHIP CRYPTO DRIVERS
> 

-- 
Kind regards,

Sakari Ailus

