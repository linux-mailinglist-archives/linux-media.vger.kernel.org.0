Return-Path: <linux-media+bounces-43876-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E78DFBC293B
	for <lists+linux-media@lfdr.de>; Tue, 07 Oct 2025 22:01:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6AE0188D502
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 20:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AED3721C9FD;
	Tue,  7 Oct 2025 20:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lLmGfuz4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC71B15C0;
	Tue,  7 Oct 2025 20:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759867262; cv=none; b=L8+ZOt0h1EScEBnUiL2+mCXgqyGXDpKeJjn7bS89Ii+iu6/SuKT46iAfP0W/HPt6lVve/3MYKEY3Q2PdCl5WX4fRj7SCbDxiJkmyTG4AHD5Pc/9HKLrBb3us09fiEfCBxeGueAewCisR9+lR/ZbSG/nZqIlzDH0pU89TasNnJDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759867262; c=relaxed/simple;
	bh=NK24BaQ9xWl+tVnNXQiE60htjjVsEiyaZFyhIAwv8Lk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QYHJYQZ9DpPUId9U8kqTxBkhqh6XlfnrNESUFpwMrcy0exn8muTVYtOZdtNJEhK3FBqB/KjLIQJL2Cn7EqOf3CSbfyFno4yoNklQcUrAZH6MKkqWjkQbU0s812+2DwtmRbAP1ZleheR5427t9/MqcnCIayeK3zt0nymNM67npgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lLmGfuz4; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759867260; x=1791403260;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NK24BaQ9xWl+tVnNXQiE60htjjVsEiyaZFyhIAwv8Lk=;
  b=lLmGfuz4A52UYH/0apuAExXWg4lMTMRpNZBl/HiqXojKxbBrOctyi7Gs
   K7VXxtd4U/37r3s+UYlYn7nAUT6Np3SnsRoGoa6axd2spUUi//E3HBzYr
   +5yBJw1D8vZv1WnJFA1QAvPBrwB4anuNw9Ruc8Agc6/dzM9CfdIScAxMi
   ji974XgR78f4bdzbQ7neya0qUUryMXGOJvznA69MPlcZmnPGwBNxn/RAc
   oePMPe3npaUsPhsmMtY7MTl4RPGczz2YgRFEdKbL5keG15YRuXRnyJKxn
   TOFzjR3Bg2oIcYiTEg9+OHjvD4hMHwnxjFm1+C2dGFPFLCfNtqPkRGxd6
   Q==;
X-CSE-ConnectionGUID: 5lhCTWZrRLWU/uDRgXIMmw==
X-CSE-MsgGUID: MzXxcACCQ3izazBWDoOWRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="73482588"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; 
   d="scan'208";a="73482588"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2025 13:00:59 -0700
X-CSE-ConnectionGUID: 9ETq42g/Trm9vsdAgEjDMg==
X-CSE-MsgGUID: j6SYt8suQBCKkEB45Z0qlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; 
   d="scan'208";a="179917379"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.53])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2025 13:00:52 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id DA85011F8B0;
	Tue, 07 Oct 2025 23:00:49 +0300 (EEST)
Date: Tue, 7 Oct 2025 23:00:49 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: michael.riesch@collabora.com
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Markus Elfring <Markus.Elfring@web.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Bryan O'Donoghue <bod@kernel.org>
Subject: Re: [PATCH v11 05/17] media: dt-bindings: add rockchip rk3568 mipi
 csi-2 receiver
Message-ID: <aOVxcQV-8c9m6Stg@kekkonen.localdomain>
References: <20240220-rk3568-vicap-v11-0-af0eada54e5d@collabora.com>
 <20240220-rk3568-vicap-v11-5-af0eada54e5d@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240220-rk3568-vicap-v11-5-af0eada54e5d@collabora.com>

Hi Michael,

On Wed, Sep 17, 2025 at 05:38:45PM +0200, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> Add documentation for the Rockchip RK3568 MIPI CSI-2 Receiver.
> 
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>  .../bindings/media/rockchip,rk3568-mipi-csi.yaml   | 144 +++++++++++++++++++++
>  MAINTAINERS                                        |   6 +
>  2 files changed, 150 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml
> new file mode 100644
> index 000000000000..8cbab93b4b85
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml
> @@ -0,0 +1,144 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip RK3568 MIPI CSI-2 Receiver
> +
> +maintainers:
> +  - Michael Riesch <michael.riesch@collabora.com>
> +
> +description:
> +  The Rockchip RK3568 MIPI CSI-2 Receiver is a CSI-2 bridge with one input port
> +  and one output port. It receives the data with the help of an external
> +  MIPI PHY (C-PHY or D-PHY) and passes it to the Rockchip RK3568 Video Capture
> +  (VICAP) block.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - rockchip,rk3588-mipi-csi
> +          - const: rockchip,rk3568-mipi-csi
> +      - const: rockchip,rk3568-mipi-csi
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
> +      - const: irq1
> +      - const: irq2
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
> +                enum: [1, 4]
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
> +        description: Output port connected to a RK3568 VICAP port.

As the VICAP port appears to be a DVP/Bt.565 receiver, also this output can
presumably be connected elsewhere, too.

Either way, aren't signal polarity or sampling related properties relevant
here, too, and perhaps more so for the VICAP bindings?

See e.g.
Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml .

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
> +            compatible = "rockchip,rk3568-mipi-csi";
> +            reg = <0x0 0xfdfb0000 0x0 0x10000>;
> +            interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +            interrupt-names = "irq1", "irq2";
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
> index 4c39b9fd80bb..2ac4b7a5b255 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21797,6 +21797,12 @@ F:	Documentation/userspace-api/media/v4l/metafmt-rkisp1.rst
>  F:	drivers/media/platform/rockchip/rkisp1
>  F:	include/uapi/linux/rkisp1-config.h
>  
> +ROCKCHIP MIPI CSI-2 RECEIVER DRIVER
> +M:	Michael Riesch <michael.riesch@collabora.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml
> +
>  ROCKCHIP RK3568 RANDOM NUMBER GENERATOR SUPPORT
>  M:	Daniel Golle <daniel@makrotopia.org>
>  M:	Aurelien Jarno <aurelien@aurel32.net>
> 

-- 
Kind regards,

Sakari Ailus

