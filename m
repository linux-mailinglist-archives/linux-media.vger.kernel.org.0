Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C6A143F4AF
	for <lists+linux-media@lfdr.de>; Fri, 29 Oct 2021 03:57:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231392AbhJ2CAR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Oct 2021 22:00:17 -0400
Received: from mail-oi1-f175.google.com ([209.85.167.175]:36490 "EHLO
        mail-oi1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbhJ2CAQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Oct 2021 22:00:16 -0400
Received: by mail-oi1-f175.google.com with SMTP id q124so11142256oig.3;
        Thu, 28 Oct 2021 18:57:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=P+qv4zb1078jX0S7MK3LLDw8EFq8xA9/Akm7u2r5r6Q=;
        b=Xq1vEQ5QWd0nlDRFoJ/8D/3M7MYIcES7uDUOXjxVyEovK+ve5zKIs+jT0miGpTbTWb
         KIQih5fU2W1rZWHx4SOZj9SvNSz7H1eURS1YQcBJbr/eliIk85Vq5tIFB8YAfijHZm/G
         XQmN+nWIQIKk67FzcydPu49PutIgTioNio546dk5d4exds0uw7bY54esY3hWq/C7RnDM
         cVAIwDRVyCpXAoI/G9X82neusgAycghyBn6LbpyNV65X2YwCRQ62al0f2g7wmQbEakWN
         JZQWe/xu57MUL/ihCLYEZo89Mz3mn7tmj/Oro9vfXDWrgaU4tV+Gjme0H9KwKX/9Xsx/
         WqgA==
X-Gm-Message-State: AOAM533tPn5mbDmA0h0jvp8exaJTSjKq4I9gsCTqPXGkxj+qIIPIluAk
        38hvx2a56RA38JFkKrdDmA==
X-Google-Smtp-Source: ABdhPJzqx/kPKLBQVEl9gUQg+7uPZV/cNe0xNMsvmYNh1oEwuL1V+8+k4FOCztKS1siTmJ36bVFhsw==
X-Received: by 2002:aca:3c8b:: with SMTP id j133mr5907259oia.159.1635472668578;
        Thu, 28 Oct 2021 18:57:48 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id t12sm117233oiw.39.2021.10.28.18.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 18:57:47 -0700 (PDT)
Received: (nullmailer pid 999202 invoked by uid 1000);
        Fri, 29 Oct 2021 01:57:46 -0000
Date:   Thu, 28 Oct 2021 20:57:46 -0500
From:   Rob Herring <robh@kernel.org>
To:     Eugen Hristev <eugen.hristev@microchip.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        jacopo@jmondi.org, laurent.pinchart@ideasonboard.com,
        sakari.ailus@iki.fi, nicolas.ferre@microchip.com
Subject: Re: [PATCH 02/21] dt-bindings: media: atmel: csi2dc: add bindings
 for microchip csi2dc
Message-ID: <YXtVGrG8HcEJ/gLf@robh.at.kernel.org>
References: <20211022075247.518880-1-eugen.hristev@microchip.com>
 <20211022075247.518880-3-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211022075247.518880-3-eugen.hristev@microchip.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 22, 2021 at 10:52:28AM +0300, Eugen Hristev wrote:
> Add bindings documentation for Microchip CSI2 Demultiplexer controller.
> 
> CSI2DC is a demultiplexer from Synopsys IDI interface specification to
> parallel interface connection or direct memory access.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
> Changes in this version :
> - fixed 'sink' name to be actually source.
> - added dma properties and example with dma
> 
> Previous change log:
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
> 
>  .../bindings/media/microchip,csi2dc.yaml      | 149 ++++++++++++++++++
>  1 file changed, 149 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/microchip,csi2dc.yaml b/Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
> new file mode 100644
> index 000000000000..d317478908d0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
> @@ -0,0 +1,149 @@
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
> +  IDI interface is Synopsys proprietary.
> +
> +  CSI2DC provides two pipes, one video pipe and one data pipe. Video pipe
> +  is connected to a sensor controller and the data pipe is accessible
> +  as a DMA slave port to a DMA controller.
> +
> +  CSI2DC supports a single 'port' node as a sink port with Synopsys 32-bit
> +  IDI interface. The connected endpoint must be a IDI interface compatible
> +  device , that can provide 32-bit IDI interface connection as source port.
> +  For graph video endpoints please refer to the bindings defined in
> +  Documentation/devicetree/bindings/media/video-interfaces.txt.
> +  This port is mandatory.
> +
> +  CSI2DC supports one 'port' node as source port with parallel interface.
> +  This is called video pipe.
> +  This port has an 'endpoint' that can be connected to a sink port of another
> +  controller (next in pipeline).
> +  Please refer to the bindings defined in
> +  Documentation/devicetree/bindings/media/video-interfaces.txt.
> +
> +  CSI2DC also supports direct access to the data through AHB, via DMA channel,
> +  called data pipe.
> +  Because of this, the source 'port' child node (second) is not mandatory.
> +  If the source 'port' child node is missing, only data pipe is available.
> +  For data pipe to be available, a dma controller must be referenced.
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
> +  dmas:
> +    maxItems: 1
> +
> +  dma-names:
> +    const: rx
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
> +          Input port node, single endpoint describing the input port.
> +      port@1:
> +        type: object
> +        description:
> +          Output port node, single endpoint, describing the output port.

These need references to graph.yaml schema. See examples in the tree 
now.

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
> +  # Example for connecting to a parallel sensor controller block
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
> +  # Example for connecting to a DMA master as an AHB slave
> +  - |
> +    #include <dt-bindings/dma/at91.h>
> +    csi2dc@e1404000 {
> +        compatible = "microchip,sama7g5-csi2dc";
> +        reg = <0xe1404000 0x500>;
> +        clocks = <&pclk>, <&scck>;
> +        clock-names = "pclk", "scck";
> +        dmas = <&dma0 AT91_XDMAC_DT_PERID(34)>;
> +        dma-names = "rx";
> +
> +        ports {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               port@0 {
> +                       reg = <0>; /* must be 0, first child port */
> +                       csi2dc_input: endpoint { /* input from IDI interface */
> +                               remote-endpoint = <&csi2host_out>;
> +                       };
> +               };
> +        };
> +    };
> +
> +...
> -- 
> 2.25.1
> 
> 
