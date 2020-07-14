Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81F2B21E5F9
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2020 04:55:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726675AbgGNCzE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jul 2020 22:55:04 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:36281 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726372AbgGNCzE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jul 2020 22:55:04 -0400
Received: by mail-il1-f195.google.com with SMTP id x9so13041280ila.3;
        Mon, 13 Jul 2020 19:55:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=33mC0WNeWBJScLg34kZk7QhtvixCsZdcT9IrD69H6fg=;
        b=Lc+8ni+Co7lUy68+QjHk9dsz5IjulnskSEc0XL2jG72ypLWcXattbUm2lJ8bMVChx7
         SzHIGBARiReyILNFt/gscW6ZXLmXs/wFmD8QTyCpzqZvrkQo0Ejil1DiM+1fVK0CgBsF
         hE5DfiSDB/Ri5KnTgmMfrVUEj/Tj1DFHZk66o4ezHsKdzvioUQXnTupXgeZtRVdUVS0G
         GCq4F39m8LCvFU2yzh+FN3HS0epgI12GEvCc1FIRK6QDq+DWuLgU/XtT0GBtOHUD5civ
         4lVv9SsdG2kHIOD389mL6mYANcO/F3gdUneerzZGo9zhdIVxYvWKP0KNJzqHr9szeRo7
         t7CQ==
X-Gm-Message-State: AOAM532dd2K6d2MiMMOZ7I2M0xzQk1k3nrIQB79ul23PUlGP8zeJR1H4
        ZNCpolyT59p8wMLLJ2zF/+5XL+lfLJsf
X-Google-Smtp-Source: ABdhPJyE9VvhWE/YtF/sfRrUgNk6tQr8+XEEQkz614yZLL/axpbEH8QBKdMus3SSxaOMi+uD8xnotQ==
X-Received: by 2002:a92:9fcb:: with SMTP id z72mr2764823ilk.195.1594695302402;
        Mon, 13 Jul 2020 19:55:02 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id b20sm9555598ila.5.2020.07.13.19.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 19:55:01 -0700 (PDT)
Received: (nullmailer pid 1195007 invoked by uid 1000);
        Tue, 14 Jul 2020 02:55:00 -0000
Date:   Mon, 13 Jul 2020 20:55:00 -0600
From:   Rob Herring <robh@kernel.org>
To:     Eugen Hristev <eugen.hristev@microchip.com>
Cc:     mchehab@kernel.org, hverkuil@xs4all.nl,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] dt-bindings: media: csi2dc: add bindings for
 microchip csi2dc
Message-ID: <20200714025500.GA1187556@bogus>
References: <20200703074416.55272-1-eugen.hristev@microchip.com>
 <20200703074416.55272-2-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200703074416.55272-2-eugen.hristev@microchip.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 03, 2020 at 10:44:13AM +0300, Eugen Hristev wrote:
> Add bindings documentation for microchip CSI2 Demultiplexer controller.
> 
> CSI2DC is a demultiplexer from Synopsys IDI interface specification to
> parallel interface connection or direct memory access.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
> Changes in v2:
> - fixed warnings reported by dt_binding_check
> 
> 
>  .../bindings/media/microchip,csi2dc.yaml      | 185 ++++++++++++++++++
>  1 file changed, 185 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/microchip,csi2dc.yaml b/Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
> new file mode 100644
> index 000000000000..b7c46f7ad2a4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
> @@ -0,0 +1,185 @@
> +# SPDX-License-Identifier: GPL-2.0-only

New bindings should be:

(GPL-2.0-only OR BSD-2-Clause)

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
> +  It should contain one 'port' child node with one child 'endpoint' node.
> +  This node should always have the 'reg' property as 0, being the first child
> +  node.

This information should be expressed as a schema.

> +  For media entity and endpoints please refer to the bindings defined in
> +  Documentation/devicetree/bindings/media/video-interfaces.txt.
> +  For Synopsys IDI interface please refer to
> +  Documentation/devicetree/bindings/media/snps,dw-csi-plat.txt
> +

> +  CSI2DC supports one 'port' node as sink pad with parallel interface. This is
> +  called video pipe.
> +  The reg property inside this 'port' node must have the 'reg' property as 1,
> +  being the second child node.
> +  This node must have one 'endpoint', and this 'endpoint' is related to the
> +  virtual channel identifier.
> +  The 'reg' property inside this 'endpoint' represents the CSI2 virtual channel
> +  identifier.
> +  This 'endpoint' can then be used as a source pad for another controller
> +  (next in pipeline).
> +  Please refer to the bindings defined in
> +  Documentation/devicetree/bindings/media/video-interfaces.txt.

And all this.

> +
> +  CSI2DC must have two clocks to function correctly. One clock is the
> +  peripheral clock for the inside functionality of the hardware block.
> +  This is named 'pclk'. The second clock must be the cross domain clock,
> +  in which CSI2DC will perform clock crossing. This clock must be fed
> +  by the next controller in pipeline, which usually is a sensor controller.
> +  Normally this clock should be given by this sensor controller who
> +  is also a clock source. This clock is named 'scck', sensor controller clock.

Better to be part of 'clocks'.

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
> +    description:
> +      Physical base address and length of the registers set for the device.

That is every 'reg' prop. Drop.

> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: pclk
> +      - const: scck
> +
> +  microchip,clk-gated:
> +    type: boolean
> +    description:
> +      If present, indicates that the clock is gated.
> +      Otherwise, the clock is free-running.
> +
> +  microchip,inter-line-delay:
> +    allOf:
> +    - $ref: /schemas/types.yaml#/definitions/uint32
> +    - minimum: 1
> +    - maximum: 16
> +    default: 16
> +    description:
> +      Indicates how many clock cycles should be introduced between each line.
> +
> +  port@0:
> +    type: object
> +    description:
> +      Input port node, single endpoint describing the input pad.
> +
> +    properties:
> +      reg:
> +        const: 0
> +
> +      endpoint:
> +        type: object
> +
> +        properties:
> +          remote-endpoint: true
> +
> +        required:
> +          - remote-endpoint
> +
> +        additionalProperties: false
> +
> +    additionalProperties: false
> +
> +  port@1:
> +    type: object
> +    description:
> +      Output port node, single endpoint, describing the output pad.
> +
> +    properties:
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
> +      reg:
> +        const: 1
> +
> +    patternProperties:
> +      "^endpoint@[0-9a-f]$":

Looks like only [0-3] is valid.

> +        type: object
> +
> +        properties:
> +          reg:
> +            enum: [0, 1, 2, 3]
> +            description: virtual channel for the endpoint
> +
> +          remote-endpoint: true
> +
> +        required:
> +          - remote-endpoint
> +          - reg
> +
> +        additionalProperties: false
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - port@0
> +
> +examples:
> +  - |
> +    csi2dc@e1404000 {
> +        compatible = "microchip,sama7g5-csi2dc";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        reg = <0xe1404000 0x500>;
> +        clocks = <&pclk>, <&scck>;
> +        clock-names = "pclk", "scck";
> +
> +        port@0 {
> +               reg = <0>; /* must be 0, first child port */
> +               csi2dc_in: endpoint { /* input from IDI interface */
> +                     remote-endpoint = <&csi2host_out>;
> +               };
> +        };
> +
> +        port@1 {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                reg = <1>; /* must be 1, second child port */
> +                csi2dc_out: endpoint@2 {
> +                        reg = <2>;  /* virtual channel identifier */
> +                        remote-endpoint = <&xisc_in>; /* output to sensor controller */
> +                };
> +        };
> +    };
> +
> +...
> -- 
> 2.25.1
> 
