Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AB403A31A6
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 19:02:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230232AbhFJREu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 13:04:50 -0400
Received: from mail-oi1-f179.google.com ([209.85.167.179]:45743 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229895AbhFJREt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 13:04:49 -0400
Received: by mail-oi1-f179.google.com with SMTP id w127so2821203oig.12;
        Thu, 10 Jun 2021 10:02:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=e4a/91iYGoY9yr3GZI7DZxVbEUDYySZoo2P+z2xpl9o=;
        b=FOUAGVAnbnMa0yUNcaRKkGMUbaUFcBS31PIafbrsrNs6fUNu7RlD5dsVeHO+mbV099
         ChfKUHR+jdPzqoF8MjqTa2XjL6Q2of4gx+74Iok6AWNJSR3A7icLmLofNLIb01+/x1Uo
         6Zt8hlOJ7LVgGwqIS2S7lPCmwfbdGMsrC74G9ap+71WvaMxfyHsa5tZBY+ME3TJQNM4h
         5yp6ayUhS8y8a41eiPzv20djrpIRRXJ7VtoMORA7gCUw5rG7Ve46xdTVM0gcHQrbfSsf
         7p24yM/sN5nhYCLFKop2O0P576g3VEVEcf8h+u/3QLo2zRjG1Z/y8a1GhNeQPdxQe4gd
         4QAA==
X-Gm-Message-State: AOAM533MmcdgPEMXc3Eq/y8rzX4FGHjoj3MfKNYdH6g7jqdXNFSzmBXl
        ukkJ1FbaRTroZ2f9wVUtoA==
X-Google-Smtp-Source: ABdhPJyCN2rSyQvYwP+VJ4DJWxdMIfMOuh00l62oVRXcHyvCP+ksagzHArpBvff/UlxQnvCH8/uMrQ==
X-Received: by 2002:aca:ea85:: with SMTP id i127mr4198702oih.176.1623344558097;
        Thu, 10 Jun 2021 10:02:38 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.99.113])
        by smtp.gmail.com with ESMTPSA id l128sm651998oif.16.2021.06.10.10.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 10:02:36 -0700 (PDT)
Received: (nullmailer pid 1967937 invoked by uid 1000);
        Thu, 10 Jun 2021 17:02:33 -0000
Date:   Thu, 10 Jun 2021 12:02:33 -0500
From:   Rob Herring <robh@kernel.org>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     festevam@gmail.com, krzk@kernel.org,
        laurent.pinchart@ideasonboard.com, devicetree@vger.kernel.org,
        kernel@pengutronix.de, kernel@puri.sm,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mchehab@kernel.org,
        phone-devel@vger.kernel.org, shawnguo@kernel.org,
        slongerbeam@gmail.com
Subject: Re: [PATCH v3 1/3] dt-bindings: media: document the
 nxp,imx8mq-mipi-csi2 receiver phy and controller
Message-ID: <20210610170233.GA1961013@robh.at.kernel.org>
References: <20210608104128.1616028-1-martin.kepplinger@puri.sm>
 <20210608104128.1616028-2-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210608104128.1616028-2-martin.kepplinger@puri.sm>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 08, 2021 at 12:41:26PM +0200, Martin Kepplinger wrote:
> The i.MX8MQ SoC integrates a different MIPI CSI receiver as the i.MX8MM so
> describe the DT bindings for it.
> 
> Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> ---
>  .../bindings/media/nxp,imx8mq-mipi-csi2.yaml  | 161 ++++++++++++++++++
>  1 file changed, 161 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> new file mode 100644
> index 000000000000..6eafdf803d36
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> @@ -0,0 +1,161 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/nxp,imx8mq-mipi-csi2.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP i.MX8MQ MIPI CSI-2 receiver
> +
> +maintainers:
> +  - Martin Kepplinger <martin.kepplinger@puri.sm>
> +
> +description: |-
> +  This binding covers the CSI-2 RX PHY and host controller included in the
> +  NXP i.MX8MQ SoC. It handles the sensor/image input and process for all the
> +  input imaging devices.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx8mq-mipi-csi2
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: core is the RX Controller Core Clock input. This clock
> +                     must be exactly equal to or faster than the receive
> +                     byteclock from the RX DPHY.
> +      - description: esc is the Rx Escape Clock. This must be the same escape
> +                     clock that the RX DPHY receives.
> +      - description: pxl is the pixel clock (phy_ref up to 333Mhz).
> +      - description: clko2 is the CLKO2 clock root.
> +                     See the reference manual for details.
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: esc
> +      - const: pxl
> +      - const: clko2
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  reset:

resets

> +    description:
> +      The phandle to the imx8mq reset-controller.

Drop. What the reset controller is is out of scope for a binding.

> +    maxItems: 1
> +
> +  phy:

phys? Assuming this is using the PHY binding. If it is not, then why 
not?

> +    description:
> +      The phandle to the imx8mq syscon iomux-gpr.
> +    maxItems: 1
> +
> +  interconnects:
> +    maxItems: 1
> +
> +  interconnect-names:
> +    const: dram
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port node, single endpoint describing the CSI-2 transmitter.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                items:
> +                  minItems: 1
> +                  maxItems: 4
> +                  items:
> +                    - const: 1
> +                    - const: 2
> +                    - const: 3
> +                    - const: 4
> +
> +            required:
> +              - data-lanes
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Output port node
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - reset
> +  - phy
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx8mq-clock.h>
> +    #include <dt-bindings/interconnect/imx8mq.h>
> +
> +    csi@30a70000 {
> +        compatible = "fsl,imx8mq-mipi-csi2";
> +        reg = <0x30a70000 0x1000>;
> +        clocks = <&clk IMX8MQ_CLK_CSI1_CORE>,
> +                 <&clk IMX8MQ_CLK_CSI1_ESC>,
> +                 <&clk IMX8MQ_CLK_CSI1_PHY_REF>,
> +                 <&clk IMX8MQ_CLK_CLKO2>;
> +        clock-names = "core", "esc", "pxl", "clko2";
> +        assigned-clocks = <&clk IMX8MQ_CLK_CSI1_CORE>,
> +                          <&clk IMX8MQ_CLK_CSI1_PHY_REF>,
> +                          <&clk IMX8MQ_CLK_CSI1_ESC>;
> +        assigned-clock-rates = <266000000>, <200000000>, <66000000>;
> +        assigned-clock-parents = <&clk IMX8MQ_SYS1_PLL_266M>,
> +                                 <&clk IMX8MQ_SYS2_PLL_1000M>,
> +                                 <&clk IMX8MQ_SYS1_PLL_800M>;
> +        power-domains = <&pgc_mipi_csi1>;
> +        reset = <&src>;
> +        phy = <&iomuxc_gpr>;
> +        interconnects = <&noc IMX8MQ_ICM_CSI1 &noc IMX8MQ_ICS_DRAM>;
> +        interconnect-names = "dram";
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +
> +                imx8mm_mipi_csi_in: endpoint {
> +                    remote-endpoint = <&imx477_out>;
> +                    data-lanes = <1 2 3 4>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +
> +                imx8mm_mipi_csi_out: endpoint {
> +                    remote-endpoint = <&csi_in>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> -- 
> 2.30.2
