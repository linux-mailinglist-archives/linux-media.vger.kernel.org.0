Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A26C83A1FD8
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 00:11:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229979AbhFIWNI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Jun 2021 18:13:08 -0400
Received: from mail-oo1-f51.google.com ([209.85.161.51]:41980 "EHLO
        mail-oo1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbhFIWNI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Jun 2021 18:13:08 -0400
Received: by mail-oo1-f51.google.com with SMTP id k21-20020a4a2a150000b029024955603642so4137337oof.8;
        Wed, 09 Jun 2021 15:10:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pJ1pmJqdgFB+XRJ0dbrJYsD5EhkJC78pMhr5fClqAAo=;
        b=soOg3AsGONAbPPNgh7UAn7hZ3EeFMAbRsLDWHZ3HjqKLIEknT+5DKCTD9TH8WlAP18
         AE4kUnLcGunmcznhwTGqezum0KXl01labhIO+qyFFu1mEJIbHjYbRzHRZx1PCVL0O2d0
         qwdnJTGVnWQd9VaS4PxW6gcEJM1hD911G8VOK1I8zrMSB80cLGbHJ86DUWofCxrNXxTU
         9w1cD2Kofd2jAHjTubX+GxpFiZJl7gLDzFZlHJI4RGT9nMVLRaR3xDSDyf25NLYV8lRX
         1SH9PMxoIdMCRt8Z7VtygN/EiCkSREnRYEFZ71G0MntuQbUHQkvG5AEEzpENZaOTOfFB
         uZ9g==
X-Gm-Message-State: AOAM530LVQzGe+Tcnjvvbu71wUF7u6bbzqb6G9wM9bJUkuS9ciWFcfwo
        NOljkzmYWNeYoK7kRKmfVA==
X-Google-Smtp-Source: ABdhPJznE1cbyrGtOU7nhUahUXh9xv3TD1WHGlcoZjMUjRrdDBZ2iNu9PhEDCZPLmwwKgAnIcr3Cew==
X-Received: by 2002:a4a:b1c2:: with SMTP id j2mr1742402ooo.78.1623276656555;
        Wed, 09 Jun 2021 15:10:56 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 19sm198828oiy.11.2021.06.09.15.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 15:10:56 -0700 (PDT)
Received: (nullmailer pid 191717 invoked by uid 1000);
        Wed, 09 Jun 2021 22:10:55 -0000
Date:   Wed, 9 Jun 2021 17:10:55 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org, robert.foss@linaro.org,
        andrey.konovalov@linaro.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "open list:QUALCOMM CAMERA SUBSYSTEM DRIVER" 
        <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 17/17] media: dt-bindings: media: camss: Add
 qcom,sm8250-camss binding
Message-ID: <20210609221055.GA171974@robh.at.kernel.org>
References: <20210608223513.23193-1-jonathan@marek.ca>
 <20210608223513.23193-18-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210608223513.23193-18-jonathan@marek.ca>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 08, 2021 at 06:35:06PM -0400, Jonathan Marek wrote:
> Add bindings for qcom,sm8250-camss in order to support the camera
> subsystem for SM8250.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  .../bindings/media/qcom,sm8250-camss.yaml     | 399 ++++++++++++++++++
>  1 file changed, 399 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> new file mode 100644
> index 0000000000000..7180e52ee59a8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> @@ -0,0 +1,399 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/media/qcom,sm8250-camss.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm CAMSS ISP
> +
> +maintainers:
> +  - Robert Foss <robert.foss@linaro.org>
> +
> +description: |
> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms
> +
> +properties:
> +  compatible:
> +    const: qcom,sm8250-camss
> +
> +  clocks:
> +    minItems: 31
> +    maxItems: 31
> +
> +  clock-names:
> +    items:
> +      - const: cam_hf_axi
> +      - const: camnoc_axi
> +      - const: csiphy0
> +      - const: csiphy0_timer
> +      - const: csiphy1
> +      - const: csiphy1_timer
> +      - const: csiphy2
> +      - const: csiphy2_timer
> +      - const: csiphy3
> +      - const: csiphy3_timer
> +      - const: csiphy4
> +      - const: csiphy4_timer
> +      - const: csiphy5
> +      - const: csiphy5_timer
> +      - const: vfe0_ahb
> +      - const: vfe0_axi
> +      - const: vfe0
> +      - const: vfe0_cphy_rx
> +      - const: vfe0_csid
> +      - const: vfe0_areg
> +      - const: vfe1_ahb
> +      - const: vfe1_axi
> +      - const: vfe1
> +      - const: vfe1_cphy_rx
> +      - const: vfe1_csid
> +      - const: vfe1_areg
> +      - const: vfe_lite_ahb
> +      - const: vfe_lite_axi
> +      - const: vfe_lite
> +      - const: vfe_lite_cphy_rx
> +      - const: vfe_lite_csid
> +
> +  interrupts:
> +    minItems: 14
> +    maxItems: 14
> +
> +  interrupt-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csid3
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy3
> +      - const: csiphy4
> +      - const: csiphy5
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe_lite0
> +      - const: vfe_lite1
> +
> +  iommus:
> +    maxItems: 1
> +
> +  power-domains:
> +    items:
> +      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: Titan GDSC - Titan ISP Block, Global Distributed Switch Controller.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    description:
> +      CSI input ports.
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port for receiving CSI data.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              clock-lanes:
> +                maxItems: 1
> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +            required:
> +              - clock-lanes
> +              - data-lanes
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port for receiving CSI data.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              clock-lanes:
> +                maxItems: 1
> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +            required:
> +              - clock-lanes
> +              - data-lanes
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port for receiving CSI data.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              clock-lanes:
> +                maxItems: 1
> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +            required:
> +              - clock-lanes
> +              - data-lanes
> +
> +      port@3:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port for receiving CSI data.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              clock-lanes:
> +                maxItems: 1
> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +            required:
> +              - clock-lanes
> +              - data-lanes
> +
> +      port@4:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port for receiving CSI data.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              clock-lanes:
> +                maxItems: 1
> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +            required:
> +              - clock-lanes
> +              - data-lanes
> +
> +      port@5:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port for receiving CSI data.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              clock-lanes:
> +                maxItems: 1
> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +            required:
> +              - clock-lanes
> +              - data-lanes
> +
> +  reg:
> +    minItems: 10
> +    maxItems: 10
> +
> +  reg-names:

Move these before ports. (DT) properties first then nodes.

> +    items:
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy3
> +      - const: csiphy4
> +      - const: csiphy5

Should be separate phy nodes? Same/similar DPHY or CPHY as QCom DSI PHY?

> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe_lite0
> +      - const: vfe_lite1
> +
> +required:
> +  - clock-names
> +  - clocks
> +  - compatible
> +  - interrupt-names
> +  - interrupts
> +  - iommus
> +  - power-domains
> +  - reg
> +  - reg-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,camcc-sm8250.h>
> +    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
> +
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      camss: camss@ac6a000 {
> +        compatible = "qcom,sm8250-camss";
> +
> +        reg = <0 0xac6a000 0 0x2000>,
> +          <0 0xac6c000 0 0x2000>,
> +          <0 0xac6e000 0 0x1000>,
> +          <0 0xac70000 0 0x1000>,
> +          <0 0xac72000 0 0x1000>,
> +          <0 0xac74000 0 0x1000>,
> +          <0 0xacb4000 0 0xd000>,
> +          <0 0xacc3000 0 0xd000>,
> +          <0 0xacd9000 0 0x2200>,
> +          <0 0xacdb200 0 0x2200>;
> +        reg-names = "csiphy0",
> +          "csiphy1",
> +          "csiphy2",
> +          "csiphy3",
> +          "csiphy4",
> +          "csiphy5",
> +          "vfe0",
> +          "vfe1",
> +          "vfe_lite0",
> +          "vfe_lite1";
> +
> +        interrupts = <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
> +          <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
> +          <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
> +          <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
> +          <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
> +          <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
> +          <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
> +          <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
> +          <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
> +          <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
> +          <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
> +          <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
> +          <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
> +          <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names = "csiphy0",
> +          "csiphy1",
> +          "csiphy2",
> +          "csiphy3",
> +          "csiphy4",
> +          "csiphy5",
> +          "csid0",
> +          "csid1",
> +          "csid2",
> +          "csid3",
> +          "vfe0",
> +          "vfe1",
> +          "vfe_lite0",
> +          "vfe_lite1";
> +
> +        power-domains = <&camcc IFE_0_GDSC>,
> +          <&camcc IFE_1_GDSC>,
> +          <&camcc TITAN_TOP_GDSC>;
> +
> +        clocks = <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +          <&camcc CAM_CC_CSIPHY0_CLK>,
> +          <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +          <&camcc CAM_CC_CSIPHY1_CLK>,
> +          <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +          <&camcc CAM_CC_CSIPHY2_CLK>,
> +          <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> +          <&camcc CAM_CC_CSIPHY3_CLK>,
> +          <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
> +          <&camcc CAM_CC_CSIPHY4_CLK>,
> +          <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
> +          <&camcc CAM_CC_CSIPHY5_CLK>,
> +          <&camcc CAM_CC_CSI5PHYTIMER_CLK>,
> +          <&camcc CAM_CC_IFE_0_AHB_CLK>,
> +          <&camcc CAM_CC_IFE_0_AXI_CLK>,
> +          <&camcc CAM_CC_IFE_0_CLK>,
> +          <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
> +          <&camcc CAM_CC_IFE_0_CSID_CLK>,
> +          <&camcc CAM_CC_IFE_0_AREG_CLK>,
> +          <&camcc CAM_CC_IFE_1_AHB_CLK>,
> +          <&camcc CAM_CC_IFE_1_AXI_CLK>,
> +          <&camcc CAM_CC_IFE_1_CLK>,
> +          <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
> +          <&camcc CAM_CC_IFE_1_CSID_CLK>,
> +          <&camcc CAM_CC_IFE_1_AREG_CLK>,
> +          <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
> +          <&camcc CAM_CC_IFE_LITE_AXI_CLK>,
> +          <&camcc CAM_CC_IFE_LITE_CLK>,
> +          <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
> +          <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
> +
> +        clock-names = "cam_hf_axi",
> +          "csiphy0",
> +          "csiphy0_timer",
> +          "csiphy1",
> +          "csiphy1_timer",
> +          "csiphy2",
> +          "csiphy2_timer",
> +          "csiphy3",
> +          "csiphy3_timer",
> +          "csiphy4",
> +          "csiphy4_timer",
> +          "csiphy5",
> +          "csiphy5_timer",
> +          "vfe0_ahb",
> +          "vfe0_axi",
> +          "vfe0",
> +          "vfe0_cphy_rx",
> +          "vfe0_csid",
> +          "vfe0_areg",
> +          "vfe1_ahb",
> +          "vfe1_axi",
> +          "vfe1",
> +          "vfe1_cphy_rx",
> +          "vfe1_csid",
> +          "vfe1_areg",
> +          "vfe_lite_ahb",
> +          "vfe_lite_axi",
> +          "vfe_lite",
> +          "vfe_lite_cphy_rx",
> +          "vfe_lite_csid";
> +
> +        iommus = <&apps_smmu 0x800 0x400>;
> +
> +        ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +        };
> +      };
> +    };
> -- 
> 2.26.1
