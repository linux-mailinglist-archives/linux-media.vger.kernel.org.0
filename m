Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA63612FFC0
	for <lists+linux-media@lfdr.de>; Sat,  4 Jan 2020 01:44:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727133AbgADAoA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Jan 2020 19:44:00 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:37879 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726911AbgADAn7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Jan 2020 19:43:59 -0500
Received: by mail-io1-f68.google.com with SMTP id k24so12790550ioc.4
        for <linux-media@vger.kernel.org>; Fri, 03 Jan 2020 16:43:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KVOAVEbJI4by8dHylpbGdlYjAc7ICQ7+bWPH7m8U5UI=;
        b=HrU1s5Vsr6wWeldVZCnGxVJ3yWXlOO3W8nF7lWV8LIMddX3EUcGg9+WFmJ9X3zPnkC
         MfPjbEN5Tp6pYmE0KSc1vG2aj10wB9d0FQm/8OiW41J+M0kgkbglRnJGC8sYrnocK1RH
         ZWlVU8gjR6/Si/9/CBe3x+1s2tbOiW2LC019TUSwko6YGngXY3C6/wvQTWrudXVw1Ils
         BybaiW9TOBlXjakAqSrtCSOZdJq5vVCRuLo5+sUms6Itdz34Q8LcyIc3cBRHW4OUbJF3
         7h8FDXoqVM3G/kAMDBW0RaDENdCKARoGLZzshmlVNUvmwlcMxVcU78cq/P+JeLIQ9VEL
         w6ZA==
X-Gm-Message-State: APjAAAXPGGSoxvcNpvC8YjTRSAzzB4lPPFD+78Z0sV5xhZiTlYEpU5j4
        qyQWUSFXuji0fffYkr1gC7eFk6g=
X-Google-Smtp-Source: APXvYqxV4ekftPTlXd507plc0IMLp+7iOMMZzWsTk805bQ/6jETXCQskZn1wKPKO5ijrX0CNXCw/0Q==
X-Received: by 2002:a6b:6f17:: with SMTP id k23mr59328177ioc.75.1578098638766;
        Fri, 03 Jan 2020 16:43:58 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id i13sm15255049ioi.67.2020.01.03.16.43.57
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 16:43:58 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219a5
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Fri, 03 Jan 2020 17:43:57 -0700
Date:   Fri, 3 Jan 2020 17:43:57 -0700
From:   Rob Herring <robh@kernel.org>
To:     Dikshita Agarwal <dikshita@codeaurora.org>
Cc:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, vgarodia@codeaurora.org
Subject: Re: [PATCH V3 2/4] dt-bindings: media: venus: Add sc7180 DT schema
Message-ID: <20200104004357.GA16614@bogus>
References: <1577971501-3732-1-git-send-email-dikshita@codeaurora.org>
 <1577971501-3732-3-git-send-email-dikshita@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1577971501-3732-3-git-send-email-dikshita@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 02, 2020 at 06:54:59PM +0530, Dikshita Agarwal wrote:
> Add new qcom,sc7180-venus DT binding schema.
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> ---
>  .../bindings/media/qcom,venus-sc7180.yaml          | 136 +++++++++++++++++++++
>  1 file changed, 136 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,venus-sc7180.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,venus-sc7180.yaml b/Documentation/devicetree/bindings/media/qcom,venus-sc7180.yaml
> new file mode 100644
> index 0000000..b78952c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,venus-sc7180.yaml
> @@ -0,0 +1,136 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/media/qcom,venus-sc7180.yaml#"
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
> +    const: "qcom,sc7180-venus"

No need for quotes.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 2
> +
> +  power-domain-names:
> +    maxItems: 2

You can drop maxItems. Implied by size of 'items'.

> +    items:
> +      - const: venus
> +      - const: vcodec0
> +
> +  clocks:
> +    maxItems: 5
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: iface
> +      - const: bus
> +      - const: vcodec0_core
> +      - const: vcodec0_bus
> +
> +  iommus:
> +    minItems: 1
> +    maxItems: 20

As I said on the other Venus schemas, can you really have 20 IOMMUs 
attached? This is a single SoC, you should know how many are attached.

Rob

> +
> +  memory-region:
> +    maxItems: 1
> +
> +  video-core0:
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
> +  video-core1:
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
> +  - power-domain-names
> +  - clocks
> +  - clock-names
> +  - iommus
> +  - memory-region
> +  - video-core0
> +  - video-core1
> +
> +examples:
> +  - |
> +        #include <dt-bindings/interrupt-controller/arm-gic.h>
> +        #include <dt-bindings/clock/qcom,videocc-sc7180.h>
> +
> +		venus: video-codec@aa00000 {
> +			compatible = "qcom,sc7180-venus";
> +			reg = <0 0x0aa00000 0 0xff000>;
> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +			power-domains = <&videocc VENUS_GDSC>,
> +					<&videocc VCODEC0_GDSC>;
> +			power-domain-names = "venus", "vcodec0";
> +			clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
> +				 <&videocc VIDEO_CC_VENUS_AHB_CLK>,
> +				 <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>,
> +				 <&videocc VIDEO_CC_VCODEC0_CORE_CLK>,
> +				 <&videocc VIDEO_CC_VCODEC0_AXI_CLK>;
> +			clock-names = "core", "iface", "bus",
> +				"vcodec0_core", "vcodec0_bus";
> +			iommus = <&apps_smmu 0x0c00 0x60>;
> +			memory-region = <&venus_mem>;
> +

> +			interconnects = <&mmss_noc MASTER_VIDEO_P0 &mc_virt SLAVE_EBI1>,
> +					<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_VENUS_CFG>;
> +			interconnect-names = "video-mem", "cpu-cfg";

Not documented.

> +
> +			video-core0 {
> +				compatible = "venus-decoder";
> +			};
> +
> +			video-core1 {
> +				compatible = "venus-encoder";
> +			};
> +
> +		};
> -- 
> 1.9.1
> 
