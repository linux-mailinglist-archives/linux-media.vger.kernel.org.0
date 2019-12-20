Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D2C7127855
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2019 10:37:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727420AbfLTJhy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Dec 2019 04:37:54 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:37917 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727205AbfLTJhx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Dec 2019 04:37:53 -0500
Received: by mail-ed1-f68.google.com with SMTP id i16so7616268edr.5
        for <linux-media@vger.kernel.org>; Fri, 20 Dec 2019 01:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zOD+/rCtXUEpuvPO7n4te3y6wG+M5leYuzLiofTN8Co=;
        b=t+U8cH9iblYlEGuw22f4vXJpGkea/lT7i3E2K2XQEZau0RsTPkegG2RVKR0ezm7+Tm
         ALcj3R67PKzGgWoo3rGBmDTLEaH5kfS/K03dsnjYbu1xBOtEc2Jb0C+4fx0+5wpXTv4M
         4P1F/kmz0XEgOKzKDQkn1PS5EieXgFi1XJqBxE/8VyY0JiTfxiMUn3+kFJHGcLEnPECN
         oIMpVIK+Sd2HWnS5Btxm+uwJ26gms579fUYFvtsN7F04EvAt4UUyK+stDBfJJQRpdl8F
         Iilxvxw2hkQpvrDbG/kbmEs3q5N5r8JpnNHmaEHp6YOmwsm+fra7IoJxHjkY/u+rU2u+
         SG4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zOD+/rCtXUEpuvPO7n4te3y6wG+M5leYuzLiofTN8Co=;
        b=Y7t8JbokSurkO828KU9wG8AoOLIHck9V++j+dBGBT3nIuDhmNKVX1+9inwahsuQ/nx
         X1Qc49nNrjjya7mlgxQGR+TtF1jNsJ5+kRJoRFBJFlcDsC3jMy+dJwFDLzNgIWF6XLR1
         Gz6fHWkWR9Alx0U2qGdOZLbUY3KGMcWDquSKmzjiQyNVmWJmGwchqtuiFKXZNoU2s9yG
         i1PYO3kmkf5Ufb+K/2Fn0w21wni+SmiNXpgjg2QXhpPFjPFIMGwGDkKMGXOoBRdLePWZ
         o8y3q1xtqHU2VVC9FQRXbWca9LD9z5Zj3LGPWKO3qzXJaOQX7duJzf3yFk+7t+8H8wlf
         KksQ==
X-Gm-Message-State: APjAAAUslsfUFObtx4STMPBrZoI8kwn/F5lU0DNTA+tNcLDWFs1dkdiz
        1HJWJl6/FAo0RejcAhKTofMcEQ==
X-Google-Smtp-Source: APXvYqy8GUCmwTn8lA5Sd00+zACmd+ZtWI/WlBRNFa+x6wCrN776jsTrZbhxncG017eEqPw69i4tug==
X-Received: by 2002:aa7:d3d0:: with SMTP id o16mr14913746edr.102.1576834671481;
        Fri, 20 Dec 2019 01:37:51 -0800 (PST)
Received: from [192.168.27.209] ([37.157.136.193])
        by smtp.googlemail.com with ESMTPSA id m5sm855526ede.10.2019.12.20.01.37.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2019 01:37:50 -0800 (PST)
Subject: Re: [PATCH 2/3] dt-bindings: media: venus: Add sc7180 DT schema
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, vgarodia@codeaurora.org
References: <1576828760-13176-1-git-send-email-dikshita@codeaurora.org>
 <1576828760-13176-3-git-send-email-dikshita@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <0b38ad39-4601-2b1b-2710-63796ed0c730@linaro.org>
Date:   Fri, 20 Dec 2019 11:37:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1576828760-13176-3-git-send-email-dikshita@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dikshita,

Thanks for the patch!

Please see Rob's comments about DT schema for msm8916. You have to
address them too.

On 12/20/19 9:59 AM, Dikshita Agarwal wrote:
> Add new qcom,sc7180-venus DT binding schema.
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> ---
>  .../bindings/media/qcom,venus-sc7180.yaml          | 131 +++++++++++++++++++++
>  1 file changed, 131 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,venus-sc7180.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,venus-sc7180.yaml b/Documentation/devicetree/bindings/media/qcom,venus-sc7180.yaml
> new file mode 100644
> index 0000000..a609739
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,venus-sc7180.yaml
> @@ -0,0 +1,131 @@
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
> +    enum:
> +      - qcom,sc7180-venus
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
> +    maxItems: 5
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
> +
> +			power-domain-names = "venus", "vcodec0";
> +			clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
> +				<&videocc VIDEO_CC_VENUS_AHB_CLK>,
> +				<&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>,
> +				<&videocc VIDEO_CC_VCODEC0_CORE_CLK>,
> +				<&videocc VIDEO_CC_VCODEC0_AXI_CLK>;
> +			clock-names = "core", "iface", "bus",
> +					"vcodec0_core", "vcodec0_bus";
> +			iommus = <&apps_smmu 0x0C00 0x60>;
> +			memory-region = <&venus_mem>;
> +			video-core0 {
> +					compatible = "venus-decoder";
> +			};
> +			video-core1 {
> +					compatible = "venus-encoder";
> +			};
> +			video-firmware {
> +					iommus = <&apps_smmu 0x0C42 0x0>;
> +			};
> +		};
> 

-- 
regards,
Stan
