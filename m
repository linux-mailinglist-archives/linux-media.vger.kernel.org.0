Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C8472B5CFF
	for <lists+linux-media@lfdr.de>; Tue, 17 Nov 2020 11:37:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727406AbgKQKhE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Nov 2020 05:37:04 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:52969 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726853AbgKQKhE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Nov 2020 05:37:04 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 072F82000C;
        Tue, 17 Nov 2020 10:36:59 +0000 (UTC)
Date:   Tue, 17 Nov 2020 11:37:02 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Eugen Hristev <eugen.hristev@microchip.com>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        sakari.ailus@iki.fi, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v5 1/3] dt-bindings: media: atmel: csi2dc: add bindings
 for microchip csi2dc
Message-ID: <20201117103702.2h77qvh7ebqx4yaq@uno.localdomain>
References: <20201112133437.372475-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201112133437.372475-1-eugen.hristev@microchip.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi again,

On Thu, Nov 12, 2020 at 03:34:35PM +0200, Eugen Hristev wrote:
> Add bindings documentation for Microchip CSI2 Demultiplexer controller.
>
> CSI2DC is a demultiplexer from Synopsys IDI interface specification to
> parallel interface connection or direct memory access.
>
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
> Changes in v5:
> - modified bindings as per Rob Herring review
>
> Changes in v4:
> - Removed property for inter-line-delay and for clock continuous/non-continuous
> - Removed virtual channel by reg for second endpoint
>
> Changes in v3:
> - Removed some text from description, as it was explained in the schema
> - fixed other things as per Rob's review
> - moved some text inside the schema, like the clock description
>
> Changes in v2:
> - fixed warnings reported by dt_binding_check
>
>  .../bindings/media/microchip,csi2dc.yaml      | 119 ++++++++++++++++++
>  1 file changed, 119 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
>
> diff --git a/Documentation/devicetree/bindings/media/microchip,csi2dc.yaml b/Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
> new file mode 100644
> index 000000000000..e79f0d6ba9db
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
> @@ -0,0 +1,119 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/microchip,csi2dc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip CSI2 Demux Controller (CSI2DC)
> +
> +maintainers:
> +  - Eugen Hristev <eugen.hristev@microchip.com>
> +
> +description:
> +  CSI2DC - Camera Serial Interface 2 Demux Controller
> +
> +  CSI2DC is a hardware block that receives incoming data from an IDI interface
> +  and filters packets based on their data type and virtual channel identifier,
> +  then converts the byte stream into a cross clock domain to a pixel stream
> +  to a parallel interface that can be read by a sensor controller.
> +
> +  CSI2DC provides two pipes, one video pipe and one data pipe. Video pipe
> +  is connected to a sensor controller and the data pipe is accessible
> +  as a DMA slave port to a DMA controller.
> +
> +  CSI2DC supports a single 'port' node as a source pad with Synopsys 32-bit
> +  IDI interface. The connected endpoint must be a IDI interface compatible
> +  device (like Synopsys CSI2HOST) , that can provide 32-bit IDI interface
> +  connection as sink pad.
> +  For media entity and endpoints please refer to the bindings defined in
> +  Documentation/devicetree/bindings/media/video-interfaces.txt.
> +  For Synopsys IDI interface please refer to
> +  Documentation/devicetree/bindings/media/snps,dw-csi-plat.txt

Is it me or this file doesn't exists on the most recent media/master
and on v5.10-rc4 ?

> +
> +  CSI2DC supports one 'port' node as sink pad with parallel interface. This is
> +  called video pipe.
> +  This port has an 'endpoint' can then be used as a source pad for another
> +  controller (next in pipeline).
> +  Please refer to the bindings defined in
> +  Documentation/devicetree/bindings/media/video-interfaces.txt.
> +
> +  CSI2DC also supports direct access to the data through AHB, via DMA channel,
> +  called data pipe.
> +  Because of this, the sink 'port' child node (second) is not mandatory.
> +  If the sink 'port' child node is missing, only data pipe is available.
> +
> +properties:
> +  compatible:
> +    const: microchip,sama7g5-csi2dc
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    description:
> +      CSI2DC must have two clocks to function correctly. One clock is the
> +      peripheral clock for the inside functionality of the hardware block.
> +      This is named 'pclk'. The second clock must be the cross domain clock,
> +      in which CSI2DC will perform clock crossing. This clock must be fed
> +      by the next controller in pipeline, which usually is a sensor controller.
> +      Normally this clock should be given by this sensor controller who
> +      is also a clock source. This clock is named 'scck', sensor controller clock.
> +    items:
> +      - const: pclk
> +      - const: scck
> +
> +  ports:
> +    type: object
> +    description:
> +      List of ports
> +
> +    properties:
> +      port@0:
> +        type: object
> +        description:
> +          Input port node, single endpoint describing the input pad.
> +      port@1:
> +        type: object
> +        description:
> +          Output port node, single endpoint, describing the output pad.
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - ports
> +
> +examples:
> +  - |
> +    csi2dc@e1404000 {
> +        compatible = "microchip,sama7g5-csi2dc";
> +        reg = <0xe1404000 0x500>;
> +        clocks = <&pclk>, <&scck>;
> +        clock-names = "pclk", "scck";
> +
> +        ports {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               port@0 {
> +                       reg = <0>; /* must be 0, first child port */
> +                       csi2dc_in: endpoint { /* input from IDI interface */
> +                               remote-endpoint = <&csi2host_out>;
> +                       };
> +               };
> +
> +               port@1 {
> +                       reg = <1>; /* must be 1, second child port */
> +                       csi2dc_out: endpoint {
> +                               remote-endpoint = <&xisc_in>; /* output to sensor controller */
> +                       };
> +               };
> +        };
> +    };
> +
> +...
> --
> 2.25.1
>
