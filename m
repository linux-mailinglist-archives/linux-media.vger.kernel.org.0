Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6E13424AB1
	for <lists+linux-media@lfdr.de>; Thu,  7 Oct 2021 01:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231960AbhJFXwB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Oct 2021 19:52:01 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54028 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230513AbhJFXwA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Oct 2021 19:52:00 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1449E9DC;
        Thu,  7 Oct 2021 01:50:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633564206;
        bh=4UPzGV+QPQo4KpsEL0bjQ6ehMfNTwYAqMdMnTOjq/DE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KmdFmUrcFGl5qkktZjEF5SCRA5t5Iar/W1KQDrh53JgDK8uyEbQ8LW/dLAbQSJQdb
         IBp02WdIUs9HLcFhkJiPkuvmkScLMELBKXu/8+J2eHEwE8fmHev4SwdH5SZoMuFfzB
         bNApQrjqbf0LePzmwlfzwLCeS8MLe3FuLv5UJq+o=
Date:   Thu, 7 Oct 2021 02:49:57 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Pratyush Yadav <p.yadav@ti.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Benoit Parrot <bparrot@ti.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v4 10/11] media: dt-bindings: Add DT bindings for TI
 J721E CSI2RX driver
Message-ID: <YV42JQ00Q2GqW+6Q@pendragon.ideasonboard.com>
References: <20210915120240.21572-1-p.yadav@ti.com>
 <20210915120240.21572-11-p.yadav@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210915120240.21572-11-p.yadav@ti.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Pratyush,

Thank you for the patch.

On Wed, Sep 15, 2021 at 05:32:39PM +0530, Pratyush Yadav wrote:
> TI's J721E uses the Cadence CSI2RX and DPHY peripherals to facilitate
> capture over a CSI-2 bus. The TI CSI2RX platform driver glues all the
> parts together.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> 
> (no changes since v2)
> 
> Changes in v2:
> - Rename to ti,j721e-csi2rx.yaml
> - Add an entry in MAINTAINERS.
> - Add a description for the binding.
> - Change compatible to ti,j721e-csi2rx to make it SoC specific.
> - Remove description from dmas, reg, power-domains.
> - Remove a limit of 2 from #address-cells and #size-cells.
> - Fix add ^ to csi-bridge subnode regex.
> - Make ranges mandatory.
> - Add unit address in example.
> - Add a reference to cdns,csi2rx in csi-bridge subnode.
> - Expand the example to include the csi-bridge subnode as well.
> - Re-order subject prefixes.
> 
>  .../bindings/media/ti,j721e-csi2rx.yaml       | 101 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 102 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/ti,j721e-csi2rx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/ti,j721e-csi2rx.yaml b/Documentation/devicetree/bindings/media/ti,j721e-csi2rx.yaml
> new file mode 100644
> index 000000000000..db87cfd65bed
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/ti,j721e-csi2rx.yaml
> @@ -0,0 +1,101 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/ti,j721e-csi2rx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI J721E CSI2RX Wrapper Device Tree Bindings
> +
> +description: |
> +  The TI J721E CSI2RX Wrapper is a wrapper around Cadence CSI2RX bridge that
> +  enables sending captured frames to memory over PSI-L DMA. In the J721E
> +  Technical Reference Manual (SPRUIL1B) it is referred to as "SHIM" under the
> +  CSI_RX_IF section.
> +
> +maintainers:
> +  - Pratyush Yadav <p.yadav@ti.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: ti,j721e-csi2rx
> +
> +  dmas:
> +    maxItems: 1
> +
> +  dma-names:
> +    items:
> +      - const: rx0
> +
> +  reg:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  ranges: true
> +
> +  "#address-cells": true
> +
> +  "#size-cells": true
> +
> +patternProperties:
> +  "^csi-bridge@":
> +    type: object
> +    description: CSI2 bridge node.
> +    $ref: cdns,csi2rx.yaml#
> +
> +required:
> +  - compatible
> +  - reg
> +  - dmas
> +  - dma-names
> +  - power-domains
> +  - ranges
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/soc/ti,sci_pm_domain.h>
> +
> +    ti_csi2rx0: ticsi2rx@4500000 {
> +        compatible = "ti,j721e-csi2rx";
> +        dmas = <&main_udmap 0x4940>;
> +        dma-names = "rx0";
> +        reg = <0x4500000 0x1000>;
> +        power-domains = <&k3_pds 26 TI_SCI_PD_EXCLUSIVE>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges;
> +
> +        cdns_csi2rx: csi-bridge@4504000 {
> +            compatible = "cdns,csi2rx";
> +            reg = <0x4504000 0x1000>;
> +            clocks = <&k3_clks 26 2>, <&k3_clks 26 0>, <&k3_clks 26 2>,
> +              <&k3_clks 26 2>, <&k3_clks 26 3>, <&k3_clks 26 3>;
> +            clock-names = "sys_clk", "p_clk", "pixel_if0_clk",
> +              "pixel_if1_clk", "pixel_if2_clk", "pixel_if3_clk";
> +            phys = <&dphy0>;
> +            phy-names = "dphy";
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                csi2_0: port@0 {
> +
> +                    reg = <0>;
> +
> +                    csi2rx0_in_sensor: endpoint {
> +                        remote-endpoint = <&csi2_cam0>;
> +                        bus-type = <4>; /* CSI2 DPHY. */
> +                        clock-lanes = <0>;
> +                        data-lanes = <1 2>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7ee236cbd016..7b3e557c9d3b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18716,6 +18716,7 @@ TI J721E CSI2RX DRIVER
>  M:	Pratyush Yadav <p.yadav@ti.com>
>  L:	linux-media@vger.kernel.org
>  S:	Supported
> +F:	Documentation/devicetree/bindings/media/ti,j721e-csi2rx.yaml
>  F:	drivers/media/platform/ti/j721e-csi2rx/
>  
>  TI DAVINCI MACHINE SUPPORT

-- 
Regards,

Laurent Pinchart
