Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F2F02AF8C6
	for <lists+linux-media@lfdr.de>; Wed, 11 Nov 2020 20:15:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbgKKTPf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Nov 2020 14:15:35 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:46004 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725949AbgKKTPd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Nov 2020 14:15:33 -0500
Received: by mail-ot1-f68.google.com with SMTP id k3so3156577otp.12;
        Wed, 11 Nov 2020 11:15:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8gKCHEvFzJANeCSj/Y9iNsSZFzZ8Qf0AqO8I6cBIIJE=;
        b=H3/GE5aKxRh/ljtNXu3KAmLUJa6E/EZmV/M9VCJzLNv05o60n45qTFRDXjVEcZeRhM
         rkUwW3UVI74RrDezaZrHeC1wTDDr01NBsT+ESUezMuGNvbnwDnFrrMu0AYiGYjZaFgqZ
         VQ8EUjrIGOsMWhgDKSSu0EY4hAzeKR9epFssRz/gKnlggaaEEH7q0WDWH1WEWxKuBpMF
         Qrx6BSLRrIR7BpJlJ3/x9WJqNs8U1iwJphkSYs6L9rNaMGssP5ZFR+J52bAK0r3WoPT0
         fLdcroSGpi7eMgCxLCoFKAaRolR02boH0ST94RpS+NlFpL5pOWWmCfsses1DPQCqTcRF
         97/g==
X-Gm-Message-State: AOAM532ynhNucEbjXx8jnrBrHThk5AYAeXqKOtWQ6OxlyaBWh7I2H8Kq
        NLB6c7ejPbaaO69nc7iLBg==
X-Google-Smtp-Source: ABdhPJzC2WcNGxa3VvkHl8Hj3vaDJyYVrenKAKyMQ7gEegGH0RsScqxeETtYU2hIe3kc6mY8OKMi2A==
X-Received: by 2002:a9d:d37:: with SMTP id 52mr17544349oti.326.1605122132280;
        Wed, 11 Nov 2020 11:15:32 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i1sm700680ool.43.2020.11.11.11.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 11:15:31 -0800 (PST)
Received: (nullmailer pid 1856229 invoked by uid 1000);
        Wed, 11 Nov 2020 19:15:30 -0000
Date:   Wed, 11 Nov 2020 13:15:30 -0600
From:   Rob Herring <robh@kernel.org>
To:     Eugen Hristev <eugen.hristev@microchip.com>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, sakari.ailus@iki.fi,
        laurent.pinchart@ideasonboard.com, jacopo@jmondi.org
Subject: Re: [PATCH v4 1/3] dt-bindings: media: atmel: csi2dc: add bindings
 for microchip csi2dc
Message-ID: <20201111191530.GC1844086@bogus>
References: <20201110151116.161260-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201110151116.161260-1-eugen.hristev@microchip.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 10, 2020 at 05:11:14PM +0200, Eugen Hristev wrote:
> Add bindings documentation for Microchip CSI2 Demultiplexer controller.
> 
> CSI2DC is a demultiplexer from Synopsys IDI interface specification to
> parallel interface connection or direct memory access.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
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
>  .../bindings/media/microchip,csi2dc.yaml      | 144 ++++++++++++++++++
>  1 file changed, 144 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/microchip,csi2dc.yaml b/Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
> new file mode 100644
> index 000000000000..967e8fefe363
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
> @@ -0,0 +1,144 @@
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
> +  port@0:

Put multiple 'port' nodes under a 'ports' node.

> +    type: object
> +    description:
> +      Input port node, single endpoint describing the input pad.

This:

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

...to here can be omitted.

> +
> +  port@1:
> +    type: object
> +    description:
> +      Output port node, single endpoint, describing the output pad.
> +
> +    properties:
> +      reg:
> +        const: 1
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

Same here.

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
> +                reg = <1>; /* must be 1, second child port */
> +                csi2dc_out: endpoint {
> +                        remote-endpoint = <&xisc_in>; /* output to sensor controller */
> +                };
> +        };
> +    };
> +
> +...
> -- 
> 2.25.1
> 
