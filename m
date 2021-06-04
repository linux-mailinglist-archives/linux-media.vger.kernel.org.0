Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B56539C294
	for <lists+linux-media@lfdr.de>; Fri,  4 Jun 2021 23:37:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230270AbhFDVjc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Jun 2021 17:39:32 -0400
Received: from mail-oo1-f44.google.com ([209.85.161.44]:45050 "EHLO
        mail-oo1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230242AbhFDVjb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Jun 2021 17:39:31 -0400
Received: by mail-oo1-f44.google.com with SMTP id o5-20020a4a2c050000b0290245d6c7b555so2568585ooo.11;
        Fri, 04 Jun 2021 14:37:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Utd5Q3vo5MjFZyun8vrWlVKBnn1w3zWcUu6IodeWHUU=;
        b=TOBCfyd5axBJ2Z5eGacKVay6KjqOkBYxpDxJl6TzLpCn8gRoIWvq1eNIfs26sDkU6S
         kNdsv3xoqnWG5zNjt4du01udd8AgTMqg2QqLZiBayJRPc6GeREDUHnOoJk0AGU7gzrxn
         dXDNG608iQPsifVVxU8C7e1Gs9Et6aPMliD5BDHGO85JVAPaugnTkAJ9YFAypKWO6Nn+
         OYacqgd2c3mEJBFOkHDc9xsYZni3+8mEhyGbRwsDzuj0HkkTn2pyBBPUD472d8iOdR/s
         kvdwR8hPT+pmeh1FXDl7YjNWYRyaPlliQ+rhBxnGIQRNgXPaubsfENVP1L6kk3e+qzgj
         0f5g==
X-Gm-Message-State: AOAM532k3U4JmH2zefCGf2ekIgRwtOvl6nGQ479o7huhd8gV4r6GoYTr
        goR/OK7Vs9xMB90isx7n6g==
X-Google-Smtp-Source: ABdhPJzvJgDQDeMiCoKjZthSNJrKCtqHQg3qyuYlPMBVAbp34R47bLfNiQpR/eAri9x8YIz3Ym8j4g==
X-Received: by 2002:a4a:d85:: with SMTP id 127mr5337961oob.26.1622842648813;
        Fri, 04 Jun 2021 14:37:28 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m1sm731257otq.12.2021.06.04.14.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 14:37:28 -0700 (PDT)
Received: (nullmailer pid 3965565 invoked by uid 1000);
        Fri, 04 Jun 2021 21:37:26 -0000
Date:   Fri, 4 Jun 2021 16:37:26 -0500
From:   Rob Herring <robh@kernel.org>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     festevam@gmail.com, krzk@kernel.org,
        laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        devicetree@vger.kernel.org, kernel@pengutronix.de, kernel@puri.sm,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, shawnguo@kernel.org,
        slongerbeam@gmail.com, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: media: document the
 nxp,imx8mq-mipi-csi2 receiver phy and controller
Message-ID: <20210604213726.GA3960263@robh.at.kernel.org>
References: <20210531112326.90094-1-martin.kepplinger@puri.sm>
 <20210531112326.90094-2-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210531112326.90094-2-martin.kepplinger@puri.sm>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, May 31, 2021 at 01:23:24PM +0200, Martin Kepplinger wrote:
> The i.MX8MQ SoC integrates a different MIPI CSI receiver as the i.MX8MM so
> describe the DT bindings for it.
> 
> Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> ---
>  .../bindings/media/nxp,imx8mq-mipi-csi2.yaml  | 162 ++++++++++++++++++
>  1 file changed, 162 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> new file mode 100644
> index 000000000000..4e3b17c220fc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> @@ -0,0 +1,162 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/nxp,imx8mq-mipi-csi2.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP and i.MX8MQ MIPI CSI-2 receiver
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
> +    minItems: 4
> +
> +  clock-names:
> +    minItems: 4
> +    items:
> +      - const: core
> +      - const: esc
> +      - const: pxl
> +      - const: clko2
> +
> +  assigned-clocks:
> +    maxItems: 3
> +
> +  assigned-clock-rates:
> +    maxItems: 3
> +
> +  assigned-clock-parents:
> +    maxItems: 3
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  phy-reset:
> +    description:
> +      The phandle to the imx8mq reset-controller.
> +    maxItems: 1

Sounds like this should use the reset binding.

> +
> +  phy-gpr:
> +    description:
> +      The phandle to the imx8mq syscon iomux-gpr.
> +    maxItems: 1

Should be using the phy binding?

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
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - assigned-clocks
> +  - assigned-clock-rates
> +  - assigned-clock-parents
> +  - power-domains
> +  - phy-reset
> +  - phy-gpr
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx8mq-clock.h>
> +    #include <dt-bindings/interconnect/imx8mq.h>
> +
> +    mipi_csi1@30a70000 {

csi@...

> +        compatible = "fsl,imx8mq-mipi-csi2";
> +        reg = <0x30a70000 0x1000>; /* MIPI CSI1 Controller base addr */
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
> +        phy-reset = <&src>;
> +        phy-gpr = <&iomuxc_gpr>;
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
