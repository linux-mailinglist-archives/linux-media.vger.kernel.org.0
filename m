Return-Path: <linux-media+bounces-50861-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 028D5D2F539
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 11:11:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2D8AE3017113
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 10:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DBB635F8B0;
	Fri, 16 Jan 2026 10:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R6Yf9fRP"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A93035F8AF;
	Fri, 16 Jan 2026 10:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768558293; cv=none; b=khIBjzmJkrEJp9QsEPUpVP7prtP+0OuETUCAkk+Sgt8jswJevvpzRXsdg98s2UN5g912QD5puku9wU9Ve//7yWORlQEY1wCKNvmdXgQ7Pc21fTzBqujCZFNFZt1q5QN9IWJE2eq1w8pBEcQnoOyKHL6wdGVnuHzh6S7XUT4lGxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768558293; c=relaxed/simple;
	bh=CXms3wV+dr/BvdIE0bkqbm0VBHZBrUrXZywM475Coa0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lB4F6pMbUz2l6/kcsVYOj5I3TW6vKQz9/2lY6tK1m1EfEEwKiT7Rs9qSamMxbhMBxz50Xh5Oi2qC2vdVMZ62p/OkdlCBo7gis9qFU9mmt+9tWRq08Enlo7SD665qFFE+ux2jHOF64i894JkWSNEL2adYv+BxvPKDCbGyf2piNFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R6Yf9fRP; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768558292; x=1800094292;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CXms3wV+dr/BvdIE0bkqbm0VBHZBrUrXZywM475Coa0=;
  b=R6Yf9fRPA2DVNNEdkm9+6dCSLw8oPE/QA0ESRnOR9KR0DbM85j3zSOzg
   7RbgO8CeAt0orQilb94QWpv2IriNFFS0IYG8oP/2L4jC4EFAdCVXIOULA
   FpxzIcsUXG6LwRKH7lVbZ2mkctIGY9HTgSDKIFeeRy4hHl1ltznz1KraA
   TeaetfPwIWuxN0qpe8qxE9g95AhWAFLux9Ct+cAZocXJlg2oemQtE1Deq
   EfW2fTBLg+8cC/f3MsbvE152Lz/jU+irqhkgXFo+UFu94noxnnH349dSX
   2FsFyH2VEF4++tIiXn273IPyENnwo6zIOadPxozjBTBlRLEIWN5Ipz69U
   A==;
X-CSE-ConnectionGUID: EsdDTZEAS4GksDGBKLLpjg==
X-CSE-MsgGUID: msLga3C1TQe89bU3/JfUqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="70038361"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="70038361"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 02:11:32 -0800
X-CSE-ConnectionGUID: aot0kgc3R3qKz+Vp58al2Q==
X-CSE-MsgGUID: jcnNr+btQymo4lY4jHry6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="209702430"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.150])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 02:11:27 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 86BF9121D8E;
	Fri, 16 Jan 2026 12:11:26 +0200 (EET)
Date: Fri, 16 Jan 2026 12:11:26 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: michael.riesch@collabora.com
Cc: Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>, Frank Li <Frank.li@nxp.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] media: dt-bindings: add rockchip mipi csi-2
 receiver
Message-ID: <aWoOzn_d7ixgbzj4@kekkonen.localdomain>
References: <20251114-rockchip-mipi-receiver-v4-0-a9c86fecd052@collabora.com>
 <20251114-rockchip-mipi-receiver-v4-1-a9c86fecd052@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114-rockchip-mipi-receiver-v4-1-a9c86fecd052@collabora.com>

Hi Michael,

On Thu, Jan 15, 2026 at 07:26:07PM +0100, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> Add documentation for the Rockchip MIPI CSI-2 Receiver.
> 
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>  .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  | 141 +++++++++++++++++++++
>  MAINTAINERS                                        |   6 +
>  2 files changed, 147 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
> new file mode 100644
> index 000000000000..2c2bd87582eb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml

I'd add a compatible string for the base IP block and name it accordingly.

> @@ -0,0 +1,141 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip MIPI CSI-2 Receiver
> +
> +maintainers:
> +  - Michael Riesch <michael.riesch@collabora.com>
> +
> +description:
> +  The Rockchip MIPI CSI-2 Receiver is a CSI-2 bridge with one input port and
> +  one output port. It receives the data with the help of an external MIPI PHY
> +  (C-PHY or D-PHY) and passes it to the Rockchip Video Capture (VICAP) block.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - rockchip,rk3568-mipi-csi2
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: Interrupt that signals changes in CSI2HOST_ERR1.
> +      - description: Interrupt that signals changes in CSI2HOST_ERR2.
> +
> +  interrupt-names:
> +    items:
> +      - const: err1
> +      - const: err2
> +
> +  clocks:
> +    maxItems: 1
> +
> +  phys:
> +    maxItems: 1
> +    description: MIPI C-PHY or D-PHY.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: Input port node. Connect to e.g., a MIPI CSI-2 image sensor.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              bus-type:
> +                enum:
> +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +            required:
> +              - bus-type
> +              - data-lanes
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Output port connected to a Rockchip VICAP port.
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - phys
> +  - ports
> +  - power-domains
> +  - resets
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/rk3568-cru.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/media/video-interfaces.h>
> +    #include <dt-bindings/power/rk3568-power.h>
> +
> +    soc {
> +        interrupt-parent = <&gic>;
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        csi: csi@fdfb0000 {
> +            compatible = "rockchip,rk3568-mipi-csi2";

This would become e.g.

            compatible = "rockchip,rk3568-mipi-csi2", "snps,dw-mipi-csi2rx";

See my comments on the driver patch as well.

> +            reg = <0x0 0xfdfb0000 0x0 0x10000>;
> +            interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +            interrupt-names = "err1", "err2";
> +            clocks = <&cru PCLK_CSI2HOST1>;
> +            phys = <&csi_dphy>;
> +            power-domains = <&power RK3568_PD_VI>;
> +            resets = <&cru SRST_P_CSI2HOST1>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                csi_in: port@0 {
> +                    reg = <0>;
> +
> +                    csi_input: endpoint {
> +                        bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +                        data-lanes = <1 2 3 4>;
> +                        remote-endpoint = <&imx415_output>;
> +                    };
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
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fc68ee0c68c0..965132e0933a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25364,6 +25364,12 @@ S:	Maintained
>  F:	drivers/i2c/busses/i2c-designware-amdisp.c
>  F:	include/linux/soc/amd/isp4_misc.h
>  
> +SYNOPSYS DESIGNWARE MIPI CSI-2 RECEIVER DRIVER
> +M:	Michael Riesch <michael.riesch@collabora.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
> +
>  SYNOPSYS DESIGNWARE MMC/SD/SDIO DRIVER
>  M:	Jaehoon Chung <jh80.chung@samsung.com>
>  M:	Shawn Lin <shawn.lin@rock-chips.com>
> 

-- 
Kind regards,

Sakari Ailus

