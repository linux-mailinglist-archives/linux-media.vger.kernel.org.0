Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F95628F327
	for <lists+linux-media@lfdr.de>; Thu, 15 Oct 2020 15:26:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729009AbgJON0I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Oct 2020 09:26:08 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:53249 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728216AbgJON0I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Oct 2020 09:26:08 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id E19F820011;
        Thu, 15 Oct 2020 13:26:02 +0000 (UTC)
Date:   Thu, 15 Oct 2020 17:25:46 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Rui Miguel Silva <rmfrfs@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, sakari.ailus@linux.intel.com,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: imx7-csi: convert bindings to yaml
Message-ID: <20201015152546.s5fvuxklgludyv2u@uno.localdomain>
References: <20201014142759.726823-1-rmfrfs@gmail.com>
 <20201014142759.726823-3-rmfrfs@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201014142759.726823-3-rmfrfs@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rui,

On Wed, Oct 14, 2020 at 03:27:58PM +0100, Rui Miguel Silva wrote:
> Convert imx7-csi bindings documentation to yaml schema, remove the
> textual bindings document and update MAINTAINERS entry.
>
> Signed-off-by: Rui Miguel Silva <rmfrfs@gmail.com>
> ---
>  .../devicetree/bindings/media/imx7-csi.txt    | 42 ----------
>  .../bindings/media/nxp,imx7-csi.yaml          | 84 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 85 insertions(+), 43 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/imx7-csi.txt
>  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
>
> diff --git a/Documentation/devicetree/bindings/media/imx7-csi.txt b/Documentation/devicetree/bindings/media/imx7-csi.txt
> deleted file mode 100644
> index d80ceefa0c00..000000000000
> --- a/Documentation/devicetree/bindings/media/imx7-csi.txt
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -Freescale i.MX7 CMOS Sensor Interface
> -=====================================
> -
> -csi node
> ---------
> -
> -This is device node for the CMOS Sensor Interface (CSI) which enables the chip
> -to connect directly to external CMOS image sensors.
> -
> -Required properties:
> -
> -- compatible    : "fsl,imx7-csi" or "fsl,imx6ul-csi";
> -- reg           : base address and length of the register set for the device;
> -- interrupts    : should contain CSI interrupt;
> -- clocks        : list of clock specifiers, see
> -        Documentation/devicetree/bindings/clock/clock-bindings.txt for details;
> -- clock-names   : must contain "mclk";
> -
> -The device node shall contain one 'port' child node with one child 'endpoint'
> -node, according to the bindings defined in:
> -Documentation/devicetree/bindings/media/video-interfaces.txt.
> -
> -In the following example a remote endpoint is a video multiplexer.
> -
> -example:
> -
> -                csi: csi@30710000 {
> -                        #address-cells = <1>;
> -                        #size-cells = <0>;
> -
> -                        compatible = "fsl,imx7-csi";
> -                        reg = <0x30710000 0x10000>;
> -                        interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> -                        clocks = <&clks IMX7D_CSI_MCLK_ROOT_CLK>;
> -                        clock-names = "mclk";
> -
> -                        port {
> -                                csi_from_csi_mux: endpoint {
> -                                        remote-endpoint = <&csi_mux_to_csi>;
> -                                };
> -                        };
> -                };
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml b/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
> new file mode 100644
> index 000000000000..9fe064dd5ba3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
> @@ -0,0 +1,84 @@
> +# SPDX-License-Identifier: GPL-2.0

Shouldn't bindings be dual licensed ?

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/nxp,imx7-csi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: i.MX7 CMOS Sensor Interface
> +
> +maintainers:
> +  - Rui Miguel Silva <rmfrfs@gmail.com>
> +
> +description: |
> +  This is device node for the CMOS Sensor Interface (CSI) which enables the
> +  chip to connect directly to external CMOS image sensors.

Pretty cryptic, not your fault as it was there already. Is NXP using
CSI as a name but it's not really MIPI CSI-2 ? This seems to be a
bridge, right ?

> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx7-csi
> +      - fsl,imx6ul-csi
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: mclk
> +
> +  port:
> +    type: object
> +    additionalProperties: false
> +    description:
> +      A node containing input port nodes with endpoint definitions as documented
> +      in Documentation/devicetree/bindings/media/video-interfaces.txt
> +
> +    properties:
> +      endpoint:
> +        type: object
> +        additionalProperties: false
> +
> +        properties:
> +          remote-endpoint: true
> +
> +        required:
> +          - remote-endpoint
> +
> +    required:
> +      - endpoint

As per the comment on ov2680, this last part can be removed

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - port
> +
> +unevaluatedProperties: false

additionalProperties: false ?

This apart
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
  j

> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx7d-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    csi: csi@30710000 {
> +            compatible = "fsl,imx7-csi";
> +            reg = <0x30710000 0x10000>;
> +            interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks = <&clks IMX7D_CSI_MCLK_ROOT_CLK>;
> +            clock-names = "mclk";
> +
> +            port {
> +                    csi_from_csi_mux: endpoint {
> +                            remote-endpoint = <&csi_mux_to_csi>;
> +                    };
> +            };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 926dcdc4794c..b7f7f14cd85b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10773,8 +10773,8 @@ L:	linux-media@vger.kernel.org
>  S:	Maintained
>  T:	git git://linuxtv.org/media_tree.git
>  F:	Documentation/admin-guide/media/imx7.rst
> -F:	Documentation/devicetree/bindings/media/imx7-csi.txt
>  F:	Documentation/devicetree/bindings/media/imx7-mipi-csi2.txt
> +F:	Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
>  F:	drivers/staging/media/imx/imx7-media-csi.c
>  F:	drivers/staging/media/imx/imx7-mipi-csis.c
>
> --
> 2.28.0
>
