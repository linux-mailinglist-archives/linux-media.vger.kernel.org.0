Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF5DC2FE7D9
	for <lists+linux-media@lfdr.de>; Thu, 21 Jan 2021 11:43:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729399AbhAUKmd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jan 2021 05:42:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728517AbhAUKlp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jan 2021 05:41:45 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 147CCC0613C1
        for <linux-media@vger.kernel.org>; Thu, 21 Jan 2021 02:41:04 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id u4so1386422pjn.4
        for <linux-media@vger.kernel.org>; Thu, 21 Jan 2021 02:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dFR+c2Pfo9M8oaU3yZCdx7wEQxFuEIJ1lNSgajb4ESk=;
        b=UIJJHD0kTU5Dy65+M7pWKcXmMMGm9uUyjxraxWU3VnGpB22lM22gWU3bddNJoZIwF0
         s8Rbb2nWIoCtHo6kZJyojwvOdGEsTkSJ3oQfpJmVTKaYUFmnZbIw9JGb6tarxbmuCPrI
         K3Cr99gPZX1/VE1MIX58DReLxoqQmfigFX4wupt3Nubp4RCbQpO837A0G1M+rfWoJAkC
         OxuZxaRyJUp/2tWq0kCRXVgTOuxfLmykhFBH9xzoLWf3whYm2pM53vAQnRDx63yK+8zk
         clrJ7BRfNfTdyr8nm4d2+CP34tLom/pBisze46ubhN0YMuiv4rMT1rCiONJCaT0lxvlC
         TMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dFR+c2Pfo9M8oaU3yZCdx7wEQxFuEIJ1lNSgajb4ESk=;
        b=BqWxxwiHPVw9yAvlRznicnuMAoQwF1bQ20ccX7RgVJb5ymUGBvEzc7C6wjYhowWHgi
         5wyCmGrfQm+BKohkmKjMQGOOSlzx1e6Vdorcwpqu7XgxROhBLITcqHgH4PgJYXvFK74p
         /zxLi2sXxzBNxb29Xh/SniryXE6e9KS+10VqBDjtkr17LhfyEhI1RVczypeUg23XP2gR
         Dbb0PPYeA+hOTAI2+/1zHTYupwa6IBrksmhsrmM4R84KwTmKqJng+zoRHt8UzZDvZa1T
         eMtTLN2PsmH3F/1e1zfhytNE/9K3o5+PLPFYOCWT9rq1kzRg70L6vYsm9NIDaLV7OMyW
         jWgA==
X-Gm-Message-State: AOAM5330JetB5T4Edx2P4t+OyTgzVa1txHA+FySXIQjHUat3cjLMTQfs
        GLZ7WIauLHvcqFAGC2jZKG105JZH9GzjbXURD6lY1Q==
X-Google-Smtp-Source: ABdhPJzxT/P6WngknEAWK/HpmHcZX6DP19WXKvEwo6QUlCTOwpshzNLHnMG9ZM1KgnLNdYCbTm7+dkNVW3IGJ9ZV6v0=
X-Received: by 2002:a17:902:9a02:b029:dc:3481:3ff1 with SMTP id
 v2-20020a1709029a02b02900dc34813ff1mr14242215plp.28.1611225663418; Thu, 21
 Jan 2021 02:41:03 -0800 (PST)
MIME-Version: 1.0
References: <20210120134357.1522254-1-robert.foss@linaro.org>
 <20210120134357.1522254-15-robert.foss@linaro.org> <CAK7fi1ZZhpJqs9oEA=h+7msZ7VzkvOwF4y6p9E2ykrYxb8=0CA@mail.gmail.com>
In-Reply-To: <CAK7fi1ZZhpJqs9oEA=h+7msZ7VzkvOwF4y6p9E2ykrYxb8=0CA@mail.gmail.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 21 Jan 2021 11:40:52 +0100
Message-ID: <CAG3jFyt=_v_-22i4+Gv0WCC+ORhdhTRE-oo7vBJ8YuqVbD0Chg@mail.gmail.com>
Subject: Re: [PATCH v2 15/22] dt-bindings: media: camss: Add qcom,sdm660-camss binding
To:     AngeloGioacchino Del Regno <kholk11@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>, will@kernel.org,
        shawnguo@kernel.org, leoyang.li@nxp.com, geert+renesas@glider.be,
        Vinod Koul <vkoul@kernel.org>, Anson.Huang@nxp.com,
        michael@walle.cc, agx@sigxcpu.org, max.oss.09@gmail.com,
        MSM <linux-arm-msm@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Jonathan Marek <jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Angelo,

On Wed, 20 Jan 2021 at 17:17, AngeloGioacchino Del Regno
<kholk11@gmail.com> wrote:
>
> Il giorno mer 20 gen 2021 alle ore 14:44 Robert Foss
> <robert.foss@linaro.org> ha scritto:
> >
> > Add bindings for qcom,sdm660-camss in order to support the camera
> > subsystem on SDM630/660 and SDA variants.
> >
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
>
> Hey Robert!
>
> > ---
> >
> > Changes since v1:
> >  - Laurent: Reworked driver to use dtschema
> >
> >
> >  .../bindings/media/qcom,sdm660-camss.yaml     | 416 ++++++++++++++++++
> >  1 file changed, 416 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
> > new file mode 100644
> > index 000000000000..105ce84f9b71
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
> > @@ -0,0 +1,416 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +
> > +%YAML 1.2
> > +---
> > +$id: "http://devicetree.org/schemas/media/qcom,sdm660-camss.yaml#"
> > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > +
> > +title: Qualcomm CAMSS ISP
> > +
> > +maintainers:
>
> If you want, feel free to add me to the maintainers list for SDM660 CAMSS
> - AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

Alright, I'll add you right away :)

>
> > +  - Robert Foss <robert.foss@linaro.org>
> > +  - Todor Tomov <todor.too@gmail.com>
> > +
> > +description: |
> > +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,sdm660-camss
> > +
> > +  clocks:
> > +    description:
> > +      Input clocks for the hardware block.
> > +    minItems: 42
> > +    maxItems: 42
> > +
> > +  clock-names:
> > +    description:
> > +      Names of input clocks for the hardware block.
> > +    items:
> > +      - const: ahb
> > +      - const: cphy_csid0
> > +      - const: cphy_csid1
> > +      - const: cphy_csid2
> > +      - const: cphy_csid3
> > +      - const: csi0_ahb
> > +      - const: csi0
> > +      - const: csi0_phy
> > +      - const: csi0_pix
> > +      - const: csi0_rdi
> > +      - const: csi1_ahb
> > +      - const: csi1
> > +      - const: csi1_phy
> > +      - const: csi1_pix
> > +      - const: csi1_rdi
> > +      - const: csi2_ahb
> > +      - const: csi2
> > +      - const: csi2_phy
> > +      - const: csi2_pix
> > +      - const: csi2_rdi
> > +      - const: csi3_ahb
> > +      - const: csi3
> > +      - const: csi3_phy
> > +      - const: csi3_pix
> > +      - const: csi3_rdi
> > +      - const: csiphy0_timer
> > +      - const: csiphy1_timer
> > +      - const: csiphy2_timer
> > +      - const: csiphy_ahb2crif
> > +      - const: csi_vfe0
> > +      - const: csi_vfe1
> > +      - const: ispif_ahb
> > +      - const: throttle_axi
> > +      - const: top_ahb
> > +      - const: vfe0_ahb
> > +      - const: vfe0
> > +      - const: vfe0_stream
> > +      - const: vfe1_ahb
> > +      - const: vfe1
> > +      - const: vfe1_stream
> > +      - const: vfe_ahb
> > +      - const: vfe_axi
> > +
> > +  interrupts:
> > +    description:
> > +      IRQs for the hardware block.
> > +    minItems: 10
> > +    maxItems: 10
> > +
> > +  interrupt-names:
> > +    description:
> > +      Names of IRQs for the hardware block.
> > +    items:
> > +      - const: csid0
> > +      - const: csid1
> > +      - const: csid2
> > +      - const: csid3
> > +      - const: csiphy0
> > +      - const: csiphy1
> > +      - const: csiphy2
> > +      - const: ispif
> > +      - const: vfe0
> > +      - const: vfe1
> > +
> > +  iommus:
> > +    maxItems: 4
> > +
> > +  power-domains:
> > +    maxItems: 2
> > +
> > +  ports:
> > +    description:
> > +      The CSI data input ports.
> > +
> > +    type: object
> > +
> > +    properties:
> > +      port@0:
> > +        type: object
> > +        description: Input node for receiving CSI data.
> > +        properties:
> > +          endpoint:
> > +            type: object
> > +
> > +            properties:
> > +              clock-lanes:
> > +                description: |-
> > +                  The physical clock lane index.
> > +
> > +              data-lanes:
> > +                description: |-
> > +                  An array of physical data lanes indexes.
> > +                  Position of an entry determines the logical
> > +                  lane number, while the value of an entry
> > +                  indicates physical lane index.
> > +
> > +            required:
> > +              - clock-lanes
> > +              - data-lanes
> > +
> > +        required:
> > +          - endpoint
> > +          - reg
> > +
> > +      port@1:
> > +        type: object
> > +        description: Input node for receiving CSI data.
> > +        properties:
> > +          endpoint:
> > +            type: object
> > +
> > +            properties:
> > +              clock-lanes:
> > +                description: |-
> > +                  The physical clock lane index.
> > +
> > +              data-lanes:
> > +                description: |-
> > +                  An array of physical data lanes indexes.
> > +                  Position of an entry determines the logical
> > +                  lane number, while the value of an entry
> > +                  indicates physical lane index.
> > +
> > +            required:
> > +              - clock-lanes
> > +              - data-lanes
> > +
> > +        required:
> > +          - endpoint
> > +          - reg
> > +
> > +      port@2:
> > +        type: object
> > +        description: Input node for receiving CSI data.
> > +        properties:
> > +          endpoint:
> > +            type: object
> > +
> > +            properties:
> > +              clock-lanes:
> > +                description: |-
> > +                  The physical clock lane index.
> > +
> > +              data-lanes:
> > +                description: |-
> > +                  An array of physical data lanes indexes.
> > +                  Position of an entry determines the logical
> > +                  lane number, while the value of an entry
> > +                  indicates physical lane index.
> > +
> > +            required:
> > +              - clock-lanes
> > +              - data-lanes
> > +
> > +        required:
> > +          - endpoint
> > +          - reg
> > +
> > +      port@3:
> > +        type: object
> > +        description: Input node for receiving CSI data.
> > +        properties:
> > +          endpoint:
> > +            type: object
> > +
> > +            properties:
> > +              clock-lanes:
> > +                description: |-
> > +                  The physical clock lane index.
> > +
> > +              data-lanes:
> > +                description: |-
> > +                  An array of physical data lanes indexes.
> > +                  Position of an entry determines the logical
> > +                  lane number, while the value of an entry
> > +                  indicates physical lane index.
> > +
> > +            required:
> > +              - clock-lanes
> > +              - data-lanes
> > +
> > +        required:
> > +          - endpoint
> > +          - reg
> > +
> > +  reg:
> > +    minItems: 14
> > +    maxItems: 14
> > +
> > +  reg-names:
> > +    items:
> > +      - const: csi_clk_mux
> > +      - const: csid0
> > +      - const: csid1
> > +      - const: csid2
> > +      - const: csid3
> > +      - const: csiphy0
> > +      - const: csiphy0_clk_mux
> > +      - const: csiphy1
> > +      - const: csiphy1_clk_mux
> > +      - const: csiphy2
> > +      - const: csiphy2_clk_mux
> > +      - const: ispif
> > +      - const: vfe0
> > +      - const: vfe1
> > +
> > +  vdda-supply:
> > +    description:
> > +      Definition of the regulator used as analog power supply.
> > +
> > +required:
> > +  - clock-names
> > +  - clocks
> > +  - compatible
> > +  - interrupt-names
> > +  - interrupts
> > +  - iommus
> > +  - power-domains
> > +  - reg
> > +  - reg-names
> > +  - vdda-supply
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/clock/qcom,gcc-sdm660.h>
> > +    #include <dt-bindings/clock/qcom,mmcc-sdm660.h>
> > +
> > +    camss: camss@ca00000 {
> > +      compatible = "qcom,sdm660-camss";
> > +
> > +      clocks = <&mmcc CAMSS_AHB_CLK>,
> > +        <&mmcc CAMSS_CPHY_CSID0_CLK>,
> > +        <&mmcc CAMSS_CPHY_CSID1_CLK>,
> > +        <&mmcc CAMSS_CPHY_CSID2_CLK>,
> > +        <&mmcc CAMSS_CPHY_CSID3_CLK>,
> > +        <&mmcc CAMSS_CSI0_AHB_CLK>,
> > +        <&mmcc CAMSS_CSI0_CLK>,
> > +        <&mmcc CAMSS_CPHY_CSID0_CLK>,
> > +        <&mmcc CAMSS_CSI0PIX_CLK>,
> > +        <&mmcc CAMSS_CSI0RDI_CLK>,
> > +        <&mmcc CAMSS_CSI1_AHB_CLK>,
> > +        <&mmcc CAMSS_CSI1_CLK>,
> > +        <&mmcc CAMSS_CPHY_CSID1_CLK>,
> > +        <&mmcc CAMSS_CSI1PIX_CLK>,
> > +        <&mmcc CAMSS_CSI1RDI_CLK>,
> > +        <&mmcc CAMSS_CSI2_AHB_CLK>,
> > +        <&mmcc CAMSS_CSI2_CLK>,
> > +        <&mmcc CAMSS_CPHY_CSID2_CLK>,
> > +        <&mmcc CAMSS_CSI2PIX_CLK>,
> > +        <&mmcc CAMSS_CSI2RDI_CLK>,
> > +        <&mmcc CAMSS_CSI3_AHB_CLK>,
> > +        <&mmcc CAMSS_CSI3_CLK>,
> > +        <&mmcc CAMSS_CPHY_CSID3_CLK>,
> > +        <&mmcc CAMSS_CSI3PIX_CLK>,
> > +        <&mmcc CAMSS_CSI3RDI_CLK>,
> > +        <&mmcc CAMSS_CSI0PHYTIMER_CLK>,
> > +        <&mmcc CAMSS_CSI1PHYTIMER_CLK>,
> > +        <&mmcc CAMSS_CSI2PHYTIMER_CLK>,
> > +        <&mmcc CSIPHY_AHB2CRIF_CLK>,
> > +        <&mmcc CAMSS_CSI_VFE0_CLK>,
> > +        <&mmcc CAMSS_CSI_VFE1_CLK>,
> > +        <&mmcc CAMSS_ISPIF_AHB_CLK>,
> > +        <&mmcc THROTTLE_CAMSS_AXI_CLK>,
> > +        <&mmcc CAMSS_TOP_AHB_CLK>,
> > +        <&mmcc CAMSS_VFE0_AHB_CLK>,
> > +        <&mmcc CAMSS_VFE0_CLK>,
> > +        <&mmcc CAMSS_VFE0_STREAM_CLK>,
> > +        <&mmcc CAMSS_VFE1_AHB_CLK>,
> > +        <&mmcc CAMSS_VFE1_CLK>,
> > +        <&mmcc CAMSS_VFE1_STREAM_CLK>,
> > +        <&mmcc CAMSS_VFE_VBIF_AHB_CLK>,
> > +        <&mmcc CAMSS_VFE_VBIF_AXI_CLK>;
> > +
> > +      clock-names = "ahb",
> > +        "cphy_csid0",
> > +        "cphy_csid1",
> > +        "cphy_csid2",
> > +        "cphy_csid3",
> > +        "csi0_ahb",
> > +        "csi0",
> > +        "csi0_phy",
> > +        "csi0_pix",
> > +        "csi0_rdi",
> > +        "csi1_ahb",
> > +        "csi1",
> > +        "csi1_phy",
> > +        "csi1_pix",
> > +        "csi1_rdi",
> > +        "csi2_ahb",
> > +        "csi2",
> > +        "csi2_phy",
> > +        "csi2_pix",
> > +        "csi2_rdi",
> > +        "csi3_ahb",
> > +        "csi3",
> > +        "csi3_phy",
> > +        "csi3_pix",
> > +        "csi3_rdi",
> > +        "csiphy0_timer",
> > +        "csiphy1_timer",
> > +        "csiphy2_timer",
> > +        "csiphy_ahb2crif",
> > +        "csi_vfe0",
> > +        "csi_vfe1",
> > +        "ispif_ahb",
> > +        "throttle_axi",
> > +        "top_ahb",
> > +        "vfe0_ahb",
> > +        "vfe0",
> > +        "vfe0_stream",
> > +        "vfe1_ahb",
> > +        "vfe1",
> > +        "vfe1_stream",
> > +        "vfe_ahb",
> > +        "vfe_axi";
> > +
> > +      interrupts = <GIC_SPI 296 IRQ_TYPE_EDGE_RISING>,
> > +        <GIC_SPI 297 IRQ_TYPE_EDGE_RISING>,
> > +        <GIC_SPI 298 IRQ_TYPE_EDGE_RISING>,
> > +        <GIC_SPI 299 IRQ_TYPE_EDGE_RISING>,
> > +        <GIC_SPI 78 IRQ_TYPE_EDGE_RISING>,
> > +        <GIC_SPI 79 IRQ_TYPE_EDGE_RISING>,
> > +        <GIC_SPI 80 IRQ_TYPE_EDGE_RISING>,
> > +        <GIC_SPI 309 IRQ_TYPE_EDGE_RISING>,
> > +        <GIC_SPI 314 IRQ_TYPE_EDGE_RISING>,
> > +        <GIC_SPI 315 IRQ_TYPE_EDGE_RISING>;
> > +
> > +      interrupt-names = "csid0",
> > +        "csid1",
> > +        "csid2",
> > +        "csid3",
> > +        "csiphy0",
> > +        "csiphy1",
> > +        "csiphy2",
> > +        "ispif",
> > +        "vfe0",
> > +        "vfe1";
> > +
> > +      iommus = <&mmss_smmu 0xc00>,
> > +        <&mmss_smmu 0xc01>,
> > +        <&mmss_smmu 0xc02>,
> > +        <&mmss_smmu 0xc03>;
> > +
> > +      power-domains = <&mmcc CAMSS_VFE0_GDSC>,
> > +        <&mmcc CAMSS_VFE1_GDSC>;
> > +
> > +      reg = <0x0ca00020 0x10>,
> > +        <0x0ca30000 0x100>,
> > +        <0x0ca30400 0x100>,
> > +        <0x0ca30800 0x100>,
> > +        <0x0ca30c00 0x100>,
> > +        <0x0c824000 0x1000>,
> > +        <0x0ca00120 0x4>,
> > +        <0x0c825000 0x1000>,
> > +        <0x0ca00124 0x4>,
> > +        <0x0c826000 0x1000>,
> > +        <0x0ca00128 0x4>,
> > +        <0x0ca31000 0x500>,
> > +        <0x0ca10000 0x1000>,
> > +        <0x0ca14000 0x1000>;
> > +
> > +      reg-names = "csi_clk_mux",
> > +        "csid0",
> > +        "csid1",
> > +        "csid2",
> > +        "csid3",
> > +        "csiphy0",
> > +        "csiphy0_clk_mux",
> > +        "csiphy1",
> > +        "csiphy1_clk_mux",
> > +        "csiphy2",
> > +        "csiphy2_clk_mux",
> > +        "ispif",
> > +        "vfe0",
> > +        "vfe1";
> > +
> > +      vdda-supply = <&reg_2v8>;
> > +
> > +      ports {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +      };
> > +    };
> > --
> > 2.27.0
> >
