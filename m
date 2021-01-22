Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A7F33008D2
	for <lists+linux-media@lfdr.de>; Fri, 22 Jan 2021 17:43:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728684AbhAVQk0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jan 2021 11:40:26 -0500
Received: from mail-oi1-f180.google.com ([209.85.167.180]:37591 "EHLO
        mail-oi1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728662AbhAVQi7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jan 2021 11:38:59 -0500
Received: by mail-oi1-f180.google.com with SMTP id r189so6599252oih.4;
        Fri, 22 Jan 2021 08:38:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lTuHQ4UlfZkguZ0cbc1Ol2Evb9EfKU6F2YZJSKyGnh0=;
        b=pfxTLsZKtjnkvjk40Yt+q16QQPt0n6n3TDzeInJAdYcQ/+JkyullMBbSFWp8aKXdKn
         XtB952sZX30yyfNNk7/E5R0RgXne0T/kf4AjCTp1GHAw1MdywwEgj1X1VCe+24FeJLf3
         18qIiVzm/blerXNbvT0tsUo9rnObTMbp0SyV89iW1zt1cq9Y0r07+x6KsPHEd0X9YhKS
         JB7PIzXIMQS+1yhKZwOoS0jF+0b9AL20lnpcHggyMS4bOA7dpk0Fedip0yqpq+OYtruj
         tyaTs/0sPeklv3BgWoQn5T/rVPQFbQAXwJe7WepmjgbHilRvQVr4jTq7JuH6uGd/Ulpq
         ZgKg==
X-Gm-Message-State: AOAM533ttYVkb/Ng/y7Xik0Mc6L6xq0Zg0X9UQ4tPgmcht6ICKzSddgl
        +8cBCaK1PkTW4qwfdm85k5iLaU/ILg==
X-Google-Smtp-Source: ABdhPJw21osrwiJXrEsQWTyQVGDgcvV4oJCkDEljVba3b9aB+7OUXXBAHCysrElXoCbJFJyd21gkkg==
X-Received: by 2002:aca:e007:: with SMTP id x7mr3756171oig.8.1611333193563;
        Fri, 22 Jan 2021 08:33:13 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m7sm1759199otq.33.2021.01.22.08.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 08:33:12 -0800 (PST)
Received: (nullmailer pid 921964 invoked by uid 1000);
        Fri, 22 Jan 2021 16:33:10 -0000
Date:   Fri, 22 Jan 2021 10:33:10 -0600
From:   Rob Herring <robh@kernel.org>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, todor.too@gmail.com,
        mchehab@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, leoyang.li@nxp.com, geert+renesas@glider.be,
        vkoul@kernel.org, Anson.Huang@nxp.com, michael@walle.cc,
        agx@sigxcpu.org, max.oss.09@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH v2 14/22] dt-bindings: media: camss: Add
 qcom,msm8996-camss binding
Message-ID: <20210122163310.GA897089@robh.at.kernel.org>
References: <20210120134357.1522254-1-robert.foss@linaro.org>
 <20210120134357.1522254-14-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210120134357.1522254-14-robert.foss@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 20, 2021 at 02:43:49PM +0100, Robert Foss wrote:
> Add bindings for qcom,msm8996-camss in order to support the camera
> subsystem on MSM8996.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
> 
> Changes since v1:
>  - Laurent: Reworked driver to use dtschema
> 
> 
>  .../bindings/media/qcom,msm8996-camss.yaml    | 418 ++++++++++++++++++
>  1 file changed, 418 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml b/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
> new file mode 100644
> index 000000000000..5ca0be8892ab
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
> @@ -0,0 +1,418 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/media/qcom,msm8996-camss.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm CAMSS ISP
> +
> +maintainers:
> +  - Robert Foss <robert.foss@linaro.org>
> +  - Todor Tomov <todor.too@gmail.com>
> +
> +description: |
> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms
> +
> +properties:
> +  compatible:
> +    const: qcom,msm8996-camss
> +
> +  clocks:
> +    description:
> +      Input clocks for the hardware block.

That's every 'clocks' entry. Drop.

> +    minItems: 36
> +    maxItems: 36
> +
> +  clock-names:
> +    description:
> +      Names of input clocks for the hardware block.

ditto.

> +    items:
> +      - const: top_ahb
> +      - const: ispif_ahb
> +      - const: csiphy0_timer
> +      - const: csiphy1_timer
> +      - const: csiphy2_timer
> +      - const: csi0_ahb
> +      - const: csi0
> +      - const: csi0_phy
> +      - const: csi0_pix
> +      - const: csi0_rdi
> +      - const: csi1_ahb
> +      - const: csi1
> +      - const: csi1_phy
> +      - const: csi1_pix
> +      - const: csi1_rdi
> +      - const: csi2_ahb
> +      - const: csi2
> +      - const: csi2_phy
> +      - const: csi2_pix
> +      - const: csi2_rdi
> +      - const: csi3_ahb
> +      - const: csi3
> +      - const: csi3_phy
> +      - const: csi3_pix
> +      - const: csi3_rdi
> +      - const: ahb
> +      - const: vfe0
> +      - const: csi_vfe0
> +      - const: vfe0_ahb
> +      - const: vfe0_stream
> +      - const: vfe1
> +      - const: csi_vfe1
> +      - const: vfe1_ahb
> +      - const: vfe1_stream
> +      - const: vfe_ahb
> +      - const: vfe_axi
> +
> +  interrupts:
> +    description:
> +      IRQs for the hardware block.

ditto

> +    minItems: 10
> +    maxItems: 10
> +
> +  interrupt-names:
> +    description:
> +      Names of IRQs for the hardware block.
> +    items:
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csid3
> +      - const: ispif
> +      - const: vfe0
> +      - const: vfe1
> +
> +  iommus:
> +    maxItems: 4
> +
> +  power-domains:
> +    maxItems: 2

Need to define what each one is.

items:
  - description: ...
  - description: ...

> +
> +  ports:

This needs to reference graph.yaml#/properties/ports

See recent additions in -next.

> +    description:
> +      The CSI data input ports.
> +
> +    type: object
> +
> +    properties:
> +      port@0:

There's a pending video-interfaces.yaml conversion which this is going 
to need to use[1].

> +        type: object
> +        description: Input node for receiving CSI data.
> +        properties:
> +          endpoint:
> +            type: object
> +
> +            properties:
> +              clock-lanes:
> +                description: |-
> +                  The physical clock lane index. The value must
> +                  always be <7> as the hardware supports D-PHY
> +                  and C-PHY, indexes are in a common set and
> +                  D-PHY physical clock lane is labeled as 7.

You don't need this in DT if it can only be 1 value.

> +
> +              data-lanes:
> +                description: |-
> +                  An array of physical data lanes indexes.
> +                  Position of an entry determines the logical
> +                  lane number, while the value of an entry
> +                  indicates physical lane index. Lane swapping
> +                  is supported. Physical lane indexes are:
> +                  0, 1, 2, 3

No need to redescribe this here. Just any additional constraints. 
'maxItems: 4' at least since the base allows 8.

Rob

[1] https://lore.kernel.org/linux-devicetree/20210104165808.2166686-1-robh@kernel.org/
