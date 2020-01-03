Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79FAE12FF57
	for <lists+linux-media@lfdr.de>; Sat,  4 Jan 2020 00:59:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726438AbgACX7G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Jan 2020 18:59:06 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:36725 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726229AbgACX7G (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Jan 2020 18:59:06 -0500
Received: by mail-io1-f68.google.com with SMTP id r13so33016894ioa.3
        for <linux-media@vger.kernel.org>; Fri, 03 Jan 2020 15:59:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LACUrtg785uiAnshI5y6g26nVt7CN5SDOx6ApB3lhZY=;
        b=WIxrZM6kjyt+biwZKpkTF8XyNSpqToo4d8hMFL/zR6530By2G7ZsKrxuJOpurtga1E
         deRHzePFVpqk+mOVzQ85bTLPuHzSp1xxfgeuiFThPYcd9lTF4CErMFKNblav+H2NI68b
         H8JzMvUi1oewCf0wxdeGUAIofvhk4P8XT97Vu46hNbUYeDqjXcBV/CWkRejiopyiZuSJ
         +87AZ2TEfCWJuZiC/bsghthr4RkmI9JvUK14G+4wCqTcMwL0fYQ2nkeNIPFuwPGv3g8A
         lTKgvIgJzD1YGew/Iy107ezdocqg73xE4OuL7R05T6l1JE0vrl0QhVymBZTAt8/4Ee2p
         a2qw==
X-Gm-Message-State: APjAAAWTP3cXn3lA4xDVAUOoylFyr5znn2X9fvihqITKlzZlJKVmfBHC
        TeOqAOx5/Sc8es/Sg7yqz6a6h78=
X-Google-Smtp-Source: APXvYqx67KBSy0vPewr/jxzDCLisdQE2T7819DthuraxUQ9R07mLPDDf64oc9nQCh75ywgQQ/IM27Q==
X-Received: by 2002:a05:6638:81:: with SMTP id v1mr71700794jao.143.1578095945308;
        Fri, 03 Jan 2020 15:59:05 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id e1sm21348337ill.47.2020.01.03.15.59.04
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 15:59:04 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219a5
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Fri, 03 Jan 2020 16:59:02 -0700
Date:   Fri, 3 Jan 2020 16:59:02 -0700
From:   Rob Herring <robh@kernel.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        dikshita@codeaurora.org
Subject: Re: [PATCH v3 06/12] dt-bindings: media: venus: Convert msm8916 to
 DT schema
Message-ID: <20200103235902.GA7619@bogus>
References: <20191223113311.20602-1-stanimir.varbanov@linaro.org>
 <20191223113311.20602-7-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191223113311.20602-7-stanimir.varbanov@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Dec 23, 2019 at 01:33:05PM +0200, Stanimir Varbanov wrote:
> Convert qcom,msm8916-venus Venus binding to DT schema
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  .../bindings/media/qcom,msm8916-venus.yaml    | 117 ++++++++++++++++++
>  1 file changed, 117 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml b/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
> new file mode 100644
> index 000000000000..14331c16135c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
> @@ -0,0 +1,117 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/media/qcom,msm8916-venus.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm Venus video encode and decode accelerators
> +
> +maintainers:
> +  - Stanimir Varbanov <stanimir.varbanov@linaro.org>
> +
> +description: |
> +  The Venus IP is a video encode and decode accelerator present
> +  on Qualcomm platforms
> +
> +properties:
> +  compatible:
> +    const: "qcom,msm8916-venus"

No need for quotes.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: iface
> +      - const: bus
> +
> +  iommus:
> +    minItems: 1
> +    maxItems: 20

You can have 20 IOMMUs attached to the Venus IP? The binding is for 1 
SoC, you should know how many IOMMUs there are.

> +
> +  memory-region:
> +    maxItems: 1
> +
> +  video-decoder:
> +    type: object
> +
> +    properties:
> +      compatible:
> +        const: "venus-decoder"
> +
> +    required:
> +      - compatible
> +
> +    additionalProperties: false
> +
> +  video-encoder:
> +    type: object
> +
> +    properties:
> +      compatible:
> +        const: "venus-encoder"
> +
> +    required:
> +      - compatible
> +
> +    additionalProperties: false
> +
> +  video-firmware:
> +    type: object
> +
> +    description: |
> +      Firmware subnode is needed when the platform does not
> +      have TrustZone.
> +
> +    properties:
> +      iommus:
> +        minItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - power-domains
> +  - clocks
> +  - clock-names
> +  - iommus
> +  - memory-region
> +  - video-decoder
> +  - video-encoder
> +
> +examples:
> +  - |
> +        #include <dt-bindings/interrupt-controller/arm-gic.h>
> +        #include <dt-bindings/clock/qcom,gcc-msm8916.h>
> +
> +        video-codec@1d00000 {
> +                compatible = "qcom,msm8916-venus";
> +                reg = <0x01d00000 0xff000>;
> +                interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> +                clocks = <&gcc GCC_VENUS0_VCODEC0_CLK>,
> +                        <&gcc GCC_VENUS0_AHB_CLK>,
> +                        <&gcc GCC_VENUS0_AXI_CLK>;
> +                clock-names = "core", "iface", "bus";
> +                power-domains = <&gcc VENUS_GDSC>;
> +                iommus = <&apps_iommu 5>;
> +                memory-region = <&venus_mem>;
> +
> +                video-decoder {
> +                        compatible = "venus-decoder";
> +                };
> +
> +                video-encoder {
> +                        compatible = "venus-encoder";
> +                };
> +        };
> -- 
> 2.17.1
> 
