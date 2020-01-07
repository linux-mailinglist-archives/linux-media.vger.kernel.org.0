Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DB17132834
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2020 14:57:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727880AbgAGN45 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jan 2020 08:56:57 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:36848 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727858AbgAGN45 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jan 2020 08:56:57 -0500
Received: by mail-ed1-f67.google.com with SMTP id j17so50409502edp.3
        for <linux-media@vger.kernel.org>; Tue, 07 Jan 2020 05:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dPFVnSyX9G7Xno3hG+Ni/JXNUtGdIA/0mAR2Q6kZsno=;
        b=qWr8P8YFqXfDZNldkjhAm+txdX7iIsKYJ6Z2fvhyXf0CewIQyOlAdr57I9+xCyepgl
         rct4zTGcdabb78WzLt1LIKtDmbOK492SzsAI16IQ0Lw/3lmWcZ/0MDCn7eFlykhioQAh
         kbRok0v1P4AoU0SEuTpCCrXkDzBHwpmDV90WBtJYxSSdVRXLdV9nI8NX9GUPhUy/Pli3
         FIyCjPHvj13FOvlVqXzrHDcygbdRCxNvlQ8n5SLvXiALR0DKIGfTdVPFkCyejskLB8HP
         rGGhB4a0TiHpZsC5K4lCH3ooC5h9mtFlw6tnj5Ss3gVCL7/0bNqpKjyw4aAmfHfsUW3l
         G0AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dPFVnSyX9G7Xno3hG+Ni/JXNUtGdIA/0mAR2Q6kZsno=;
        b=UPIuKJNiXKI9tjUPxZcmLvvdORC/bBcGxFyJ4WVpOQopJjRLFlmrlvncCfJt9goteQ
         W/w1Sl3z9VPdA+XMmK1UEnahRMWg3N89XhU0/zgAUjrYteqPnoZQE2OrmBpdbt9sueB/
         lIhhK+YclIRSGcYnzS2u03pdQ1E9QYC7VfRd7ATuTKth8Xx/J9pW7yJTNLTUfcVQpFks
         EoEwqG/Idw1ap4JUBEyTGOrK9vhpPsu8qkfoPlkPu4E5dnzgrm8tPK5srliz8+6Qgxge
         ecXIeOGMaQS6KDOMa2zc5O1BXELWqcytBWjdYdCaq+cxC8jddbVVCL+INUvA7ua4lL/a
         dLGA==
X-Gm-Message-State: APjAAAUDdv8Lqv1NOakKPf1flARR7DNjSPU3lfG4pFgIjAyvN6eI95Ak
        b+d35wifzwcFL7tFRjJmKP3iYQ==
X-Google-Smtp-Source: APXvYqy1DsslueK8hPG0D1udj2o42a4IBAsIGV0XdtvHCr1VC+bgDCeGfO9fon7w18YmZGPO2BylAg==
X-Received: by 2002:a05:6402:3184:: with SMTP id di4mr113867727edb.59.1578405414488;
        Tue, 07 Jan 2020 05:56:54 -0800 (PST)
Received: from [192.168.27.209] ([37.157.136.193])
        by smtp.googlemail.com with ESMTPSA id dn12sm7560355edb.89.2020.01.07.05.56.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2020 05:56:53 -0800 (PST)
Subject: Re: [PATCH V3 2/4] dt-bindings: media: venus: Add sc7180 DT schema
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, vgarodia@codeaurora.org
References: <1577971501-3732-1-git-send-email-dikshita@codeaurora.org>
 <1577971501-3732-3-git-send-email-dikshita@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <d5b04aea-00f2-a2da-3e78-03dd776bbad9@linaro.org>
Date:   Tue, 7 Jan 2020 15:56:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1577971501-3732-3-git-send-email-dikshita@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 1/2/20 3:24 PM, Dikshita Agarwal wrote:
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

please add

       required:
         - iommus
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
> 

-- 
regards,
Stan
