Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D74992FC4A2
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 00:19:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730396AbhASXSS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Jan 2021 18:18:18 -0500
Received: from mail-oo1-f52.google.com ([209.85.161.52]:41334 "EHLO
        mail-oo1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729209AbhASXRy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Jan 2021 18:17:54 -0500
Received: by mail-oo1-f52.google.com with SMTP id q6so5348035ooo.8;
        Tue, 19 Jan 2021 15:17:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZdAUfULu81mG/InBc8v1Wa0Tsn2ZfzsveD5C7xYRCrY=;
        b=H7MjOtreTKrpZId6z1RLQTfL0yYqhE0AXQjIiAbjyGwPKYjyuUUqVPp1/BGOdD3Iyy
         QEarKIPYsIJplA7SGU1iN1tWp4sSB1DOJMteY5JH/lKLyaMl5/28KAReB1fgc2CYAtE8
         r1UvIiz7iFKRoR2sDGGT88LMrnZjS4EOH81eX+3qMeyHLmFh0Jktrn9/4Q9XAz6IKB9m
         KvenVfhVgUP4djMsCqD6QkXTBluJHPweaW8TpIG5YtmeaX/qsCTO7ljIVyEiBy05uOkv
         OgbaOp+eQfSsC1JHOKWPOAybb7ayWqyTqSofNFmPE/udRfk2pBSZw0/LLuW98QUyCDV2
         w07Q==
X-Gm-Message-State: AOAM533KJcc8iRKZE5uLCmQhiYu017/c4MbMLFq07MQw402khGG2qs6P
        tF2r+KI95LICd3SBgzeLSw==
X-Google-Smtp-Source: ABdhPJwcq7ejQIzs65t9YC69ricWFQhQN37yXNDpg1krIIw2+TapDBjVRAdW5EHKAfuIv0TxLe2kFg==
X-Received: by 2002:a4a:98e7:: with SMTP id b36mr4403875ooj.3.1611098231965;
        Tue, 19 Jan 2021 15:17:11 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i16sm20355otc.61.2021.01.19.15.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 15:17:11 -0800 (PST)
Received: (nullmailer pid 2784084 invoked by uid 1000);
        Tue, 19 Jan 2021 23:17:09 -0000
Date:   Tue, 19 Jan 2021 17:17:09 -0600
From:   Rob Herring <robh@kernel.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: dt-bindings: media: venus: Add sdm660 DT
 schema
Message-ID: <20210119231709.GA2775697@robh.at.kernel.org>
References: <20210115185252.333562-1-angelogioacchino.delregno@somainline.org>
 <20210115185252.333562-3-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210115185252.333562-3-angelogioacchino.delregno@somainline.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jan 15, 2021 at 07:52:52PM +0100, AngeloGioacchino Del Regno wrote:
> Add new qcom,sdm660-venus DT binding schema.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  .../bindings/media/qcom,sdm660-venus.yaml     | 164 ++++++++++++++++++
>  1 file changed, 164 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm660-venus.yaml
> 
> base-commit: 012bd807cf654b992cdc4db7eab85c1e95f9d571
> prerequisite-patch-id: 734bdefdb043a8f91a48916246cc9a36fb5966e5
> prerequisite-patch-id: 999517c02973237996492a41ed5bfc2990083932
> prerequisite-patch-id: a48910425fac61948a7a26bec4d40d63e3368569
> prerequisite-patch-id: b1a1a4216eed0d04dd16e6e8e1053dee185d06d8
> prerequisite-patch-id: dff12be2631cc21ef1c3c930fba49d979f5055fe
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm660-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sdm660-venus.yaml
> new file mode 100644
> index 000000000000..e7568d4007af
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sdm660-venus.yaml
> @@ -0,0 +1,164 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/media/qcom,sdm660-venus.yaml#"
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
> +    const: qcom,sdm660-venus
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 5
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: iface
> +      - const: bus
> +      - const: bus_throttle
> +      - const: vcodec0_core
> +
> +  interconnects:
> +    maxItems: 2
> +
> +  interconnect-names:
> +    items:
> +      - const: video-mem
> +      - const: cpu-cfg
> +
> +  iommus:
> +    maxItems: 20

Perhaps some explanation as to what all these are. Looks like it is just 
1 iommu, but lots of ids?

> +
> +  memory-region:
> +    maxItems: 1
> +
> +  power-domains:
> +    minItems: 3
> +
> +  power-domain-names:
> +    items:
> +      - const: cx
> +      - const: vcodec0
> +      - const: venus
> +
> +  video-decoder:
> +    type: object
> +
> +    properties:
> +      compatible:
> +        const: venus-decoder
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
> +        const: venus-encoder
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
> +        maxItems: 2
> +
> +    required:
> +      - iommus
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
> +  - video-decoder
> +  - video-encoder
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +        #include <dt-bindings/interrupt-controller/arm-gic.h>
> +        #include <dt-bindings/clock/qcom,mmcc-sdm660.h>
> +        #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +        video-codec@cc00000 {
> +                compatible = "qcom,sdm660-venus";
> +                reg = <0x0cc00000 0xff000>;
> +                interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
> +                power-domains = <&rpmpd SDM660_VDDCX>,
> +                                <&mmcc VENUS_CORE0_GDSC>,
> +                                <&mmcc VENUS_GDSC>;
> +                power-domain-names = "cx", "vcodec0", "venus";
> +                clocks = <&mmcc VIDEO_CORE_CLK>,
> +                         <&mmcc VIDEO_AHB_CLK>,
> +                         <&mmcc VIDEO_AXI_CLK>,
> +                         <&mmcc THROTTLE_VIDEO_AXI_CLK>,
> +                         <&mmcc VIDEO_SUBCORE0_CLK>;
> +                clock-names = "core", "iface", "bus", "bus_throttle",
> +                              "vcodec0_core";
> +                iommus = <&mmss_smmu 0x400>,
> +                         <&mmss_smmu 0x401>,
> +                         <&mmss_smmu 0x40a>,
> +                         <&mmss_smmu 0x407>,
> +                         <&mmss_smmu 0x40e>,
> +                         <&mmss_smmu 0x40f>,
> +                         <&mmss_smmu 0x408>,
> +                         <&mmss_smmu 0x409>,
> +                         <&mmss_smmu 0x40b>,
> +                         <&mmss_smmu 0x40c>,
> +                         <&mmss_smmu 0x40d>,
> +                         <&mmss_smmu 0x410>,
> +                         <&mmss_smmu 0x421>,
> +                         <&mmss_smmu 0x428>,
> +                         <&mmss_smmu 0x429>,
> +                         <&mmss_smmu 0x42b>,
> +                         <&mmss_smmu 0x42c>,
> +                         <&mmss_smmu 0x42d>,
> +                         <&mmss_smmu 0x411>,
> +                         <&mmss_smmu 0x431>;
> +                memory-region = <&venus_region>;
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
> 2.29.2
> 
