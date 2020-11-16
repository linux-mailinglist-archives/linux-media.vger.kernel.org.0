Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45FE72B4F28
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 19:24:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731210AbgKPSXg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 13:23:36 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:41131 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730520AbgKPSXg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 13:23:36 -0500
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 4D06F1C0004;
        Mon, 16 Nov 2020 18:23:31 +0000 (UTC)
Date:   Mon, 16 Nov 2020 19:23:34 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Eugen Hristev <eugen.hristev@microchip.com>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        sakari.ailus@iki.fi, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v5 1/3] dt-bindings: media: atmel: csi2dc: add bindings
 for microchip csi2dc
Message-ID: <20201116182334.colrvkj7lztz52t4@uno.localdomain>
References: <20201112133437.372475-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201112133437.372475-1-eugen.hristev@microchip.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Eugen,

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

Comments on a description from a non-native speaker might be
mis-leading, take the following as suggestions only :)

the here mentioned port node is said to be a 'source' to which an IDI
interface that provides data is connected ? Is this a s/sink/source
mistake or did you mean the first port node has to be connected to a
source (the IDI interface) ?

Also, maybe it's me but 'pad' is a media-controller concept, which
should not be mentioned in bindings (as well as 'source' and 'sink'
but they have a more generic usage)

The first port, to me, is simply an 'IDI input port'

> +  For media entity and endpoints please refer to the bindings defined in
> +  Documentation/devicetree/bindings/media/video-interfaces.txt.

I would drop 'media-entity'. To be honest I would drop this phrase and
mention ../video-interfaces.txt in the ports description. Up to you.

> +  For Synopsys IDI interface please refer to
> +  Documentation/devicetree/bindings/media/snps,dw-csi-plat.txt
> +
> +  CSI2DC supports one 'port' node as sink pad with parallel interface. This is
> +  called video pipe.

I'm confused again, isn't the parallel interface an output ? Why is it
said to be a 'sink pad' ?

Isn't port one simply a 'video output port' ?

Also the association between bindings' 'port' and their representation
as media-controller constructs should in my opinion be avoided.
Bindings are about describing hardware, and they could be used by
non-Linux systems as well (at least, I've been told this multiple
times :)

> +  This port has an 'endpoint' can then be used as a source pad for another
> +  controller (next in pipeline).
> +  Please refer to the bindings defined in
> +  Documentation/devicetree/bindings/media/video-interfaces.txt.
> +
> +  CSI2DC also supports direct access to the data through AHB, via DMA channel,
> +  called data pipe.

Is my understanding correct of this 'direct access' is not represented
in DTS ?

> +  Because of this, the sink 'port' child node (second) is not mandatory.
> +  If the sink 'port' child node is missing, only data pipe is available.

And so the DMA channel and the output video port are mutually
exclusive ? I feel like the DMA port should be described or at least
represented and made exclusive with port1 presence ?

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

That's a parallel video output, correct ? Does this port support any
configurable property of the ones defined by video-interfaces.txt ?

Thanks
   j
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
