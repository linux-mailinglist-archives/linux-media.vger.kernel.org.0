Return-Path: <linux-media+bounces-26582-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6157EA3F6DD
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 15:10:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 622431898D52
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 14:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51F5720E6FA;
	Fri, 21 Feb 2025 14:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lpcK20Mt"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8843B433DE;
	Fri, 21 Feb 2025 14:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740147042; cv=none; b=IWfpO1Er+PfkjFy7OYXcOAGeMcBtETUwBIcsJ2L/ASySCI5+RiFdAygOVAzEMAjO81xPo1uXT5lZLd+ZmBljQQ7tAkbkI6l/kBqNHudNRNFOYAbSaHSImW7/dypi/P5XYRB51Yqat/o6iQaS7ojrukCIx83xjhxSLxl8coC6SQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740147042; c=relaxed/simple;
	bh=sRkollq7aUdEod9DwGNTqSYaedg1P55G6GG07rIbd3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OXgzqo5n9X5YPF/Qawn75oJTSxnpF+G2WHP+90c1p3kLkKkxo5n3tk8/rt2vgHecPsrPGtJMlfrMHokB0BqhK/qv23o5B1SH2nhyU9RVIxjCCSsHrWrvCMnCGPnPQy9K6BFp9yGhg69Zrr5lWK235RjkHJmbXsBDch4nz3biSZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lpcK20Mt; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740147041; x=1771683041;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sRkollq7aUdEod9DwGNTqSYaedg1P55G6GG07rIbd3s=;
  b=lpcK20Mt0qzlLIGxWyqEhMlwhWEhGB2NEokOiTxQBPyN6hdV9NZSR1EP
   +zFETpjgI5O4ME5ND3Y57ctyCXw/JjGbqU8/0kr8NiItPVJhH6rt6VeSX
   onZHKoVM/C5bFCNtSZe0HZGTsqvxmIDDxZ8iiAXUTxJ1W1qNsS71uDqoT
   DLddZ1H0H0W3CrnK+beCIt4eD2xYn97XiFwmrOKks5rhIlCtbGfXl0jd7
   wOS5+QzSiCL72Jl4+fDn3MpsoDDELpMGE8X170MtaSA6Pe42BrJFP6jaO
   f51CF2XavdGmu3JefuJ1SCNBnVeJ1lyNzmNshm1ai1x7cF/DZvQQL2CUs
   Q==;
X-CSE-ConnectionGUID: p47Em7V9S2qM1NV41GZsCw==
X-CSE-MsgGUID: q9y2nIinTHyFuburhOrypA==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="40842066"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="40842066"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 06:10:40 -0800
X-CSE-ConnectionGUID: aCI6g3nqRDavtpRc+aawEg==
X-CSE-MsgGUID: e6xGiywaQ1+G1N9OiCqMlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="120361076"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 06:10:34 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 36155120289;
	Fri, 21 Feb 2025 16:10:31 +0200 (EET)
Date: Fri, 21 Feb 2025 14:10:31 +0000
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
Subject: Re: [PATCH v4 03/11] media: dt-bindings: media: add bindings for
 rockchip rk3568 vicap
Message-ID: <Z7iJV1rOaqMmcjY7@kekkonen.localdomain>
References: <20250219-v6-8-topic-rk3568-vicap-v4-0-e906600ae3b0@wolfvision.net>
 <20250219-v6-8-topic-rk3568-vicap-v4-3-e906600ae3b0@wolfvision.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219-v6-8-topic-rk3568-vicap-v4-3-e906600ae3b0@wolfvision.net>

Hi Michael,

Thanks for the update.

On Wed, Feb 19, 2025 at 11:16:34AM +0100, Michael Riesch wrote:
> Add documentation for the Rockchip RK3568 Video Capture (VICAP) unit.
> 
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> ---
>  .../bindings/media/rockchip,rk3568-vicap.yaml      | 168 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 169 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
> new file mode 100644
> index 000000000000..3dc15efeb32e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
> @@ -0,0 +1,168 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/rockchip,rk3568-vicap.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip RK3568 Video Capture (VICAP)
> +
> +maintainers:
> +  - Michael Riesch <michael.riesch@wolfvision.net>
> +
> +description:
> +  The Rockchip RK3568 Video Capture (VICAP) block features a digital video
> +  port (DVP, a parallel video interface) and a MIPI CSI-2 port. It receives
> +  the data from camera sensors, video decoders, or other companion ICs and
> +  transfers it into system main memory by AXI bus.
> +
> +properties:
> +  compatible:
> +    const: rockchip,rk3568-vicap
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: ACLK
> +      - description: HCLK
> +      - description: DCLK
> +      - description: ICLK
> +
> +  clock-names:
> +    items:
> +      - const: aclk
> +      - const: hclk
> +      - const: dclk
> +      - const: iclk
> +
> +  rockchip,cif-clk-delaynum:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 127
> +    description:
> +      Delay the DVP path clock input to align the sampling phase, only valid
> +      in dual edge sampling mode.

I suppose there's further documentation on this somewhere else? A reference
would be nice.

> +
> +  iommus:
> +    maxItems: 1
> +
> +  resets:
> +    items:
> +      - description: ARST
> +      - description: HRST
> +      - description: DRST
> +      - description: PRST
> +      - description: IRST
> +
> +  reset-names:
> +    items:
> +      - const: arst
> +      - const: hrst
> +      - const: drst
> +      - const: prst
> +      - const: irst
> +
> +  rockchip,grf:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to general register file used for video input block control.
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
> +          The digital video port (DVP, a parallel video interface).
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              bus-type:
> +                enum: [5, 6]
> +
> +            required:
> +              - bus-type
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: The MIPI CSI-2 port.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false

Don't you need things like data-lanes here? Or is this a single lane
receiver?

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/rk3568-cru.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/power/rk3568-power.h>
> +    #include <dt-bindings/media/video-interfaces.h>
> +
> +    parent {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        vicap: video-capture@fdfe0000 {
> +            compatible = "rockchip,rk3568-vicap";
> +            reg = <0x0 0xfdfe0000 0x0 0x200>;
> +            interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
> +            assigned-clocks = <&cru DCLK_VICAP>;
> +            assigned-clock-rates = <300000000>;
> +            clocks = <&cru ACLK_VICAP>, <&cru HCLK_VICAP>,
> +                     <&cru DCLK_VICAP>, <&cru ICLK_VICAP_G>;
> +            clock-names = "aclk", "hclk", "dclk", "iclk";
> +            iommus = <&vicap_mmu>;
> +            power-domains = <&power RK3568_PD_VI>;
> +            resets = <&cru SRST_A_VICAP>, <&cru SRST_H_VICAP>,
> +                     <&cru SRST_D_VICAP>, <&cru SRST_P_VICAP>,
> +                     <&cru SRST_I_VICAP>;
> +            reset-names = "arst", "hrst", "drst", "prst", "irst";
> +            rockchip,grf = <&grf>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                vicap_dvp: port@0 {
> +                    reg = <0>;
> +
> +                    vicap_dvp_input: endpoint {
> +                        bus-type = <MEDIA_BUS_TYPE_BT656>;
> +                        bus-width = <16>;
> +                        pclk-sample = <MEDIA_PCLK_SAMPLE_DUAL_EDGE>;
> +                        remote-endpoint = <&it6801_output>;
> +                    };
> +                };
> +
> +                vicap_mipi: port@1 {
> +                    reg = <1>;

Where is the endpoint?

> +                };
> +            };
> +        };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bbfaf35d50c6..cd8fa1afe5eb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20407,6 +20407,7 @@ M:	Michael Riesch <michael.riesch@wolfvision.net>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/media/rockchip,px30-vip.yaml
> +F:	Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
>  
>  ROCKCHIP CRYPTO DRIVERS
>  M:	Corentin Labbe <clabbe@baylibre.com>
> 

-- 
Kind regards,

Sakari Ailus

