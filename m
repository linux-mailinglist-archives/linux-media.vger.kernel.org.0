Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27E7967C2DF
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 03:36:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229736AbjAZCg4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Jan 2023 21:36:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbjAZCgz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Jan 2023 21:36:55 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E62C561D4B;
        Wed, 25 Jan 2023 18:36:53 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id d9so713879pll.9;
        Wed, 25 Jan 2023 18:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TilgJNWaH/PIir4Wxj/i44qPjBEK6i+yTW+gTWVxk/A=;
        b=naxpa4gf7LfN+6b239hNIpOvPU6LGpuCf/VxnLMpEf2/QOaVA3bvkQxEVOiYN9+ye7
         +jHL9PCPDm8FVqIMLwXmvqrkhYyZdsTEIcgtzrGqPFNgNGTLrJVcj0EJRZEqGyBX6/iC
         v/IhNjwqQwx8r33+x/2M8Kk+QBrsjLe9IuBGMBWUxfozn/rmVhgB9l2m9TVBBn9hUlh9
         r40Q59RPSY/t9e9inX09g6cgoVNGVEsq9B7zHKkyeBtzGImYafoqwLeYcq/xrwL+8tvI
         QUKwnulfXA4zHYU7InWwpanCRBF5+h+nwi6bg5kZlQNWOkCRlGzjxHh/pa+AnVa2d6d4
         RQuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TilgJNWaH/PIir4Wxj/i44qPjBEK6i+yTW+gTWVxk/A=;
        b=LGObeGbLp/796hcYyt/wsmbTbaPN2FevUawkU9mMcCPH01pOuGUosoUdJzbdhyqwaE
         GFvfUx41pgJyZ7MN4UwVVKq3ABTaNrd86+3ETx6IDA+Az9kTnY060GNvD08hEZaJmisV
         OUgGgVMC+CNzJBx0bCc5dXe3yy/HR7BrrqzmFe7Kf9i+SVHjGCwEnPDpl+40q0Bgo9qb
         Pk5sG/EREFqdedzQHCcHpNs0F3MZPTFKaaB2RyZQuPUoale4Wr2D8Ia2usAqq3K9/+Kp
         vKgg8FYKdzvXLtJM/RfJshgkh1PL5XtItc/5F5FePYlo5lmPekOBGd8M0u5z+qKM+cm3
         R2KQ==
X-Gm-Message-State: AFqh2kqozaZ+EygQxwiR+THnZCqM32DAkdr33b0rcIDu30VwujZyhXcl
        HPxPq+u6yXjMzOYYJuBJSNOJiUdSm6gu25GJyz8=
X-Google-Smtp-Source: AMrXdXvRo3fwzXJBAjTRAY+8iOn9Z6q133XHvaDKtgKOJ0Y7OQWI6Wvz5nyUvivPC9Fmgcgw/d6Qo/vL/XS6j8hmqIU=
X-Received: by 2002:a17:902:714c:b0:195:eb15:6ed0 with SMTP id
 u12-20020a170902714c00b00195eb156ed0mr2427027plm.19.1674700612894; Wed, 25
 Jan 2023 18:36:52 -0800 (PST)
MIME-Version: 1.0
References: <20230126003320.10047-1-laurent.pinchart@ideasonboard.com> <20230126003320.10047-2-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20230126003320.10047-2-laurent.pinchart@ideasonboard.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Wed, 25 Jan 2023 20:36:41 -0600
Message-ID: <CAHCN7x+PcBk-Y+t3AP4saJK=tntYr85btTzQMFD=WL+KYQfHGg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: media: Add i.MX8 ISI DT bindings
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-imx@nxp.com, kernel@pengutronix.de,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 25, 2023 at 6:33 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> The Image Sensing Interface (ISI) combines image processing pipelines
> with DMA engines to process and capture frames originating from a
> variety of sources. The inputs to the ISI go through Pixel Link
> interfaces, and their number and nature is SoC-dependent. They cover
> both capture interfaces (MIPI CSI-2 RX, HDMI RX) and memory inputs.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v2:
>
> - Describe the interrupts property
> - Set global minItems and maxItems for interrupts
> - Set maxItems for power-domains
>
> Changes since v1:
>
> - Fix compatible string checks in conditional schema
> - Fix interrupts property handling
> ---
>  .../bindings/media/nxp,imx8-isi.yaml          | 152 ++++++++++++++++++
>  1 file changed, 152 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
>
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> new file mode 100644
> index 000000000000..130fa41b9d8e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> @@ -0,0 +1,152 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/nxp,imx8-isi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: i.MX8 Image Sensing Interface
> +
> +maintainers:
> +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +
> +description: |
> +  The Image Sensing Interface (ISI) combines image processing pipelines with
> +  DMA engines to process and capture frames originating from a variety of
> +  sources. The inputs to the ISI go through Pixel Link interfaces, and their
> +  number and nature is SoC-dependent. They cover both capture interfaces (MIPI
> +  CSI-2 RX, HDMI RX, ...) and display engine outputs for writeback support.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx8mn-isi
> +      - fsl,imx8mp-isi
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: The AXI clock
> +      - description: The APB clock
> +      # TODO: Check if the per-channel ipg_proc_clk clocks need to be specified
> +      # as well, in case some SoCs have the ability to control them separately.
> +      # This may be the case of the i.MX8[DQ]X(P)
> +
> +  clock-names:
> +    items:
> +      - const: axi
> +      - const: apb
> +
> +  fsl,blk-ctrl:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      A phandle referencing the block control that contains the CSIS to ISI
> +      gasket.
> +
> +  interrupts:
> +    description: Processing pipeline interrupts, one per pipeline
> +    minItems: 1
> +    maxItems: 2
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description: |
> +      Ports represent the Pixel Link inputs to the ISI. Their number and
> +      assignment are model-dependent. Each port shall have a single endpoint.
> +
> +    patternProperties:
> +      "^port@[0-9]$":
> +        $ref: /schemas/graph.yaml#/properties/port
> +        unevaluatedProperties: false
> +
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - fsl,blk-ctrl
> +  - ports
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx8mn-isi
> +    then:
> +      properties:
> +        interrupts:
> +          maxItems: 1
> +        ports:
> +          properties:
> +            port@0:
> +              description: MIPI CSI-2 RX
> +          required:
> +            - port@0

The imx8mn only has one port for the ISI.  When I compile the device
tree with W=1, I get the following:
arch/arm64/boot/dts/freescale/imx8mn.dtsi:1058.11-1068.7: Warning
(graph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph
node has single child node 'port@0', #address-cells/#size-cells are
not necessary

Should the "ports" node be replaced with a single port with port@0 removed?

The device tree would look something like:

port {
    isi_in: endpoint {
        remote-endpoint = <&mipi_csi_out>;
    };
};

With the above, the messages go away, and I can still see the media
pipeline and the video captures.  I am not good with YAML, so I am not
exactly sure how to code that in YAML form.

adam

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx8mp-isi
> +    then:
> +      properties:
> +        interrupts:
> +          maxItems: 2
> +        ports:
> +          properties:
> +            port@0:
> +              description: MIPI CSI-2 RX 0
> +            port@1:
> +              description: MIPI CSI-2 RX 1
> +          required:
> +            - port@0
> +            - port@1
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx8mp-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    isi@32e00000 {
> +        compatible = "fsl,imx8mp-isi";
> +        reg = <0x32e00000 0x4000>;
> +        interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>,
> +                 <&clk IMX8MP_CLK_MEDIA_APB_ROOT>;
> +        clock-names = "axi", "apb";
> +        fsl,blk-ctrl = <&media_blk_ctrl>;
> +        power-domains = <&mediamix_pd>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +                isi_in_0: endpoint {
> +                    remote-endpoint = <&mipi_csi_0_out>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +                isi_in_1: endpoint {
> +                    remote-endpoint = <&mipi_csi_1_out>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> --
> Regards,
>
> Laurent Pinchart
>
