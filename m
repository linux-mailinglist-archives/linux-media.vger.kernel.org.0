Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A88A928B58C
	for <lists+linux-media@lfdr.de>; Mon, 12 Oct 2020 15:09:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388657AbgJLNJj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Oct 2020 09:09:39 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:44666 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388651AbgJLNJj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Oct 2020 09:09:39 -0400
Received: from relay1-d.mail.gandi.net (unknown [217.70.183.193])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 342963B2B91;
        Mon, 12 Oct 2020 13:00:51 +0000 (UTC)
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 38632240003;
        Mon, 12 Oct 2020 13:00:24 +0000 (UTC)
Date:   Mon, 12 Oct 2020 15:04:25 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Eugen.Hristev@microchip.com
Cc:     laurent.pinchart@ideasonboard.com, robh+dt@kernel.org,
        sakari.ailus@iki.fi, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: media: atmel: csi2dc: add bindings
 for microchip csi2dc
Message-ID: <20201012130425.2rszhgd7eh7nffrv@uno.localdomain>
References: <20200826065142.205000-1-eugen.hristev@microchip.com>
 <20201010211743.GB3939@pendragon.ideasonboard.com>
 <c5d27d11-891b-afd8-0be1-02bf5eb8bef9@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c5d27d11-891b-afd8-0be1-02bf5eb8bef9@microchip.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,
   just my 2 cents, as I've noticed this patch skimming through the
   list

On Mon, Oct 12, 2020 at 07:19:43AM +0000, Eugen.Hristev@microchip.com wrote:
> On 11.10.2020 00:17, Laurent Pinchart wrote:
> > Hi Eugen,
> >
> > Thank you for the patch.
>
> Hi,
>
> Thank you for your review,
>
> >
> > On Wed, Aug 26, 2020 at 09:51:40AM +0300, Eugen Hristev wrote:
> >> Add bindings documentation for Microchip CSI2 Demultiplexer controller.
> >>
> >> CSI2DC is a demultiplexer from Synopsys IDI interface specification to
> >> parallel interface connection or direct memory access.
> >>
> >> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> >> ---
> >> Changes in v3:
> >> - Removed some text from description, as it was explained in the schema
> >> - fixed other things as per Rob's review
> >> - moved some text inside the schema, like the clock description
> >>
> >> Changes in v2:
> >> - fixed warnings reported by dt_binding_check
> >>
> >>   .../bindings/media/microchip,csi2dc.yaml      | 174 ++++++++++++++++++
> >>   1 file changed, 174 insertions(+)
> >>   create mode 100644 Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/media/microchip,csi2dc.yaml b/Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
> >> new file mode 100644
> >> index 000000000000..b4c1b8800a3b
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
> >> @@ -0,0 +1,174 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/media/microchip,csi2dc.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Microchip CSI2 Demux Controller (CSI2DC)
> >> +
> >> +maintainers:
> >> +  - Eugen Hristev <eugen.hristev@microchip.com>
> >> +
> >> +description:
> >> +  CSI2DC - Camera Serial Interface 2 Demux Controller
> >> +
> >> +  CSI2DC is a hardware block that receives incoming data from an IDI interface
> >> +  and filters packets based on their data type and virtual channel identifier,
> >> +  then converts the byte stream into a cross clock domain to a pixel stream
> >> +  to a parallel interface that can be read by a sensor controller.
> >> +
> >> +  CSI2DC provides two pipes, one video pipe and one data pipe. Video pipe
> >> +  is connected to a sensor controller and the data pipe is accessible
> >> +  as a DMA slave port to a DMA controller.
> >> +
> >> +  CSI2DC supports a single 'port' node as a source pad with Synopsys 32-bit
> >> +  IDI interface. The connected endpoint must be a IDI interface compatible
> >> +  device (like Synopsys CSI2HOST) , that can provide 32-bit IDI interface
> >> +  connection as sink pad.
> >> +  For media entity and endpoints please refer to the bindings defined in
> >> +  Documentation/devicetree/bindings/media/video-interfaces.txt.
> >> +  For Synopsys IDI interface please refer to
> >> +  Documentation/devicetree/bindings/media/snps,dw-csi-plat.txt
> >> +
> >> +  CSI2DC supports one 'port' node as sink pad with parallel interface. This is
> >> +  called video pipe.
> >> +  This port has an 'endpoint' can then be used as a source pad for another
> >> +  controller (next in pipeline).
> >> +  Please refer to the bindings defined in
> >> +  Documentation/devicetree/bindings/media/video-interfaces.txt.
> >> +
> >> +  CSI2DC also supports direct access to the data through AHB, via DMA channel,
> >> +  called data pipe.
> >> +  Because of this, the sink 'port' child node (second) is not mandatory.
> >> +  If the sink 'port' child node is missing, only data pipe is available.
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: microchip,sama7g5-csi2dc
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +
> >> +  clocks:
> >> +    maxItems: 2
> >> +
> >> +  clock-names:
> >> +    description:
> >> +      CSI2DC must have two clocks to function correctly. One clock is the
> >> +      peripheral clock for the inside functionality of the hardware block.
> >> +      This is named 'pclk'. The second clock must be the cross domain clock,
> >> +      in which CSI2DC will perform clock crossing. This clock must be fed
> >> +      by the next controller in pipeline, which usually is a sensor controller.
> >> +      Normally this clock should be given by this sensor controller who
> >> +      is also a clock source. This clock is named 'scck', sensor controller clock.
> >> +    items:
> >> +      - const: pclk
> >> +      - const: scck
> >> +
> >> +  microchip,clk-gated:
> >> +    type: boolean
> >> +    description:
> >> +      If present, indicates that the clock is gated.
> >> +      Otherwise, the clock is free-running.
> >
> > I don't think this belongs to the DT bindings, it should instead be
> > queried from the source subdev at runtime.
>
> If this should be queried, do you know what is the v4l2 mechanism to
> query such information ?
> The subdevice is connected through a port interface to this device, so
> it was natural for me to fully describe the interface in the devicetree
> port description
>

Is this property describing the CSI-2 clock continuous, non-continuous
mode configuration, or did I mis-interpreted it ?

We added support for retrieving run-time configuration of the media
bus with the get_mbus_config pad operations recently. Among the
configuration flags for MBUS_CSI2_DPHY there are inded CONTINUOUS and
NON_CONTINUOUS clock flags.

> >
> >> +
> >> +  microchip,inter-line-delay:
> >> +    allOf:
> >> +    - $ref: /schemas/types.yaml#/definitions/uint32
> >> +    - minimum: 1
> >> +    - maximum: 16
> >> +    default: 16
> >> +    description:
> >> +      Indicates how many clock cycles should be introduced between each line.
> >
> > This also sounds like a configuration parameter. How does one compute
> > the right value for this ?
>
> I think this is a delay that can be added inside the hardware block,
> depending on the interface speed and bandwidth. I will try to understand
> more details from the hardware design and come back with a more detailed
> answer.
>
> >
> >> +
> >> +  port@0:
> >> +    type: object
> >> +    description:
> >> +      Input port node, single endpoint describing the input pad.
> >> +
> >> +    properties:
> >> +      reg:
> >> +        const: 0
> >> +
> >> +      endpoint:
> >> +        type: object
> >> +
> >> +        properties:
> >> +          remote-endpoint: true
> >> +
> >> +        required:
> >> +          - remote-endpoint
> >> +
> >> +        additionalProperties: false
> >> +
> >> +    additionalProperties: false
> >> +
> >> +  port@1:
> >> +    type: object
> >> +    description:
> >> +      Output port node, single endpoint, describing the output pad.
> >> +
> >> +    properties:
> >> +      '#address-cells':
> >> +        const: 1
> >> +
> >> +      '#size-cells':
> >> +        const: 0
> >> +
> >> +      reg:
> >> +        const: 1
> >> +
> >> +    patternProperties:
> >> +      "^endpoint@[0-3]$":
> >> +        type: object
> >> +
> >> +        properties:
> >> +          reg:
> >> +            enum: [0, 1, 2, 3]
> >> +            description: virtual channel for the endpoint
> >
> > The virtual channel used by the source is also something that needs to
> > be queried from the source at runtime, it doesn't belong to this
> > binding.
>
> The same question as for the gated clock configuration. How can we use
> v4l2 subdevice API to obtain such information from the subdevice? And if
> the subdevice does not offer such information ?

I think the subdev driver should be instrumented to report it instead of
hard-coding the information in DT which should be otherwise updated
depending on which sensor is connected to the board. Does it make
sense to you ?

Cheers
   j

>
> Thanks again,
>
> Eugen
> >
> >> +
> >> +          remote-endpoint: true
> >> +
> >> +        required:
> >> +          - remote-endpoint
> >> +          - reg
> >> +
> >> +        additionalProperties: false
> >> +
> >> +    additionalProperties: false
> >> +
> >> +required:
> >> +  - compatible
> >> +  - reg
> >> +  - clocks
> >> +  - clock-names
> >> +  - port@0
> >> +
> >> +examples:
> >> +  - |
> >> +    csi2dc@e1404000 {
> >> +        compatible = "microchip,sama7g5-csi2dc";
> >> +        #address-cells = <1>;
> >> +        #size-cells = <0>;
> >> +        reg = <0xe1404000 0x500>;
> >> +        clocks = <&pclk>, <&scck>;
> >> +        clock-names = "pclk", "scck";
> >> +
> >> +        port@0 {
> >> +               reg = <0>; /* must be 0, first child port */
> >> +               csi2dc_in: endpoint { /* input from IDI interface */
> >> +                     remote-endpoint = <&csi2host_out>;
> >> +               };
> >> +        };
> >> +
> >> +        port@1 {
> >> +                #address-cells = <1>;
> >> +                #size-cells = <0>;
> >> +                reg = <1>; /* must be 1, second child port */
> >> +                csi2dc_out: endpoint@2 {
> >> +                        reg = <2>;  /* virtual channel identifier */
> >> +                        remote-endpoint = <&xisc_in>; /* output to sensor controller */
> >> +                };
> >> +        };
> >> +    };
> >> +
> >> +...
> >
> > --
> > Regards,
> >
> > Laurent Pinchart
> >
>
