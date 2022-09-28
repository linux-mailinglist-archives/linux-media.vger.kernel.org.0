Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A80705EE372
	for <lists+linux-media@lfdr.de>; Wed, 28 Sep 2022 19:49:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234690AbiI1Rsy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Sep 2022 13:48:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233803AbiI1Rsr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Sep 2022 13:48:47 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56F12F6873
        for <linux-media@vger.kernel.org>; Wed, 28 Sep 2022 10:48:45 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id d42so21585475lfv.0
        for <linux-media@vger.kernel.org>; Wed, 28 Sep 2022 10:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=+IT6jI/tA+QmLxNfkgpSt+mqEt8iuqK1LQzi3BmIPbM=;
        b=R9b8iQDEllsyBMOQLZtP+YcGH+BbVQE+O7Fy/uLCYn1N+KgDPDN3RAi6JPINzEgRj4
         j1W6ZlPiCYpwBKdnjoxFdNrRjJdF5DqCE1JSeX6FwaCWy/BHq43ZEvVAztIR6He8AHdk
         RcyAtvhkwk5isE8VLmvcSlaOtlkUMKCpoJfcvQIbrPHpt5Cw0WzrhrruJmITMkx5M3he
         6BYChg9o2VFLv5LqYFc39g0GfPNk4BP7k+ZVQjolNe4J3cyAh9gCz5I5rkxAOjqy46YP
         p8+T6LEF32PkjwFCQnmA1VoR/53QUFULWbYvB4DjtkpuS/FU88xzsyKdCQ++7nXkoZAY
         mG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=+IT6jI/tA+QmLxNfkgpSt+mqEt8iuqK1LQzi3BmIPbM=;
        b=LHlcljRgjCN4kSbYUPxpWygPUEtepa+WTuzqZ6u7u3WjC/72GlBW6mugDwuCu54p4i
         ANFAvYetBwF9clxo8nL8x4MfHV/nLippCHq40jJpiAXnlEgsbwPABBdwfIFSV/KT39wJ
         h37Pfs/YvmD3JIusl9rjxU7P/geTxtH0T1L3I2emGXrf6isvrjt1F1tjweRPdgJx7241
         v9nAge7scsJXoq6liuk1/zS2M8qMZe9QvJCMGRPnjO4R2ssCMC88lQqR6ccxTNOzUV6y
         TgEuJ5VPvWQD8NcTfjHGW3C+nP1fQFxhFYIOu/AVx3b+f5G8wELZV2vmWDgP0F2zfdmF
         BTAg==
X-Gm-Message-State: ACrzQf3sH47isjKaYWhFaGbL9536QPKU+oycuFrzBVL2dyWCmQYOpKim
        7MFDC+XH/js76V7ufLPCS2C5Ng==
X-Google-Smtp-Source: AMsMyM4vRL8hpAE9BCUWh0ZDlmMKBfh1OtC+I7+IB4GRvGBa8RJq1FWlKYBH+Gd3SIqbPQtfP1qprw==
X-Received: by 2002:a19:2d5c:0:b0:498:3e16:b3fc with SMTP id t28-20020a192d5c000000b004983e16b3fcmr13494804lft.498.1664387323676;
        Wed, 28 Sep 2022 10:48:43 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id p20-20020a2eba14000000b002682754293fsm504528lja.1.2022.09.28.10.48.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 10:48:43 -0700 (PDT)
Message-ID: <6df35c78-0ab1-b471-4541-7e29ea26a6ca@linaro.org>
Date:   Wed, 28 Sep 2022 19:48:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v3 02/11] dt-bindings: remoteproc: mediatek: Support
 MT8195 dual-core SCP
Content-Language: en-US
To:     Tinghan Shen <tinghan.shen@mediatek.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20220927025606.26673-1-tinghan.shen@mediatek.com>
 <20220927025606.26673-3-tinghan.shen@mediatek.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220927025606.26673-3-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27/09/2022 04:55, Tinghan Shen wrote:
> The MT8195 SCP is a dual-core RISC-V MCU. Extend the yaml file
> to describe the 2nd core as a subnode of the boot core.
> 
> The configuration register is shared by MT8195 SCP core 0
> and core 1. The core 1 can retrieve the information of configuration
> registers from parent node.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  .../bindings/remoteproc/mtk,scp.yaml          | 97 ++++++++++++++++++-
>  1 file changed, 92 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> index 786bed897916..c012265be4eb 100644
> --- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> @@ -75,6 +75,83 @@ properties:
>      required:
>        - mediatek,rpmsg-name
>  
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 1
> +
> +  ranges: true
> +
> +patternProperties:
> +  "^scp-c[0-9]+@[a-f0-9]+$":

drop c[0-9]. Node names should be generic

> +    type: object
> +    description:
> +      The MediaTek SCP integrated to SoC might be a multi-core version.
> +      The other cores are represented as child nodes of the boot core.
> +      There are some integration differences for the IP like the usage of
> +      address translator for translating SoC bus addresses into address space
> +      for the processor.
> +
> +      Each SCP core has own cache memory. The SRAM and L1TCM are shared by
> +      cores. The power of cache, SRAM and L1TCM power should be enabled
> +      before booting SCP cores. The size of cache, SRAM, and L1TCM are varied
> +      on differnt SoCs.
> +
> +      The SCP cores do not use an MMU, but has a set of registers to
> +      control the translations between 32-bit CPU addresses into system bus
> +      addresses. Cache and memory access settings are provided through a
> +      Memory Protection Unit (MPU), programmable only from the SCP.
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - mediatek,mt8195-scp-core
> +
> +      reg:
> +        description: The base address and size of SRAM.
> +        maxItems: 1
> +
> +      reg-names:
> +        const: sram
> +
> +      interrupts:
> +        maxItems: 1
> +
> +      firmware-name:
> +        $ref: /schemas/types.yaml#/definitions/string
> +        description:
> +          If present, name (or relative path) of the file within the
> +          firmware search path containing the firmware image used when
> +          initializing sub cores of multi-core SCP.
> +
> +      memory-region:
> +        maxItems: 1
> +
> +      cros-ec-rpmsg:
> +        type: object
> +        description:
> +          This subnode represents the rpmsg device. The namesof the devices
> +          are not important. The properties of this node are defined by the
> +          individual bindings for the rpmsg devices.

Same comments as with patch #1.

> +
> +        properties:
> +          mediatek,rpmsg-name:
> +            $ref: /schemas/types.yaml#/definitions/string-array
> +            description:
> +              Contains the name for the rpmsg device. Used to match
> +              the subnode to rpmsg device announced by SCP.
> +
> +        required:
> +          - mediatek,rpmsg-name
> +
> +    required:
> +      - compatible
> +      - reg
> +      - reg-names
> +
> +    additionalProperties: false
> +
>  required:
>    - compatible
>    - reg
> @@ -110,16 +187,26 @@ additionalProperties: false
>  
>  examples:
>    - |
> -    #include <dt-bindings/clock/mt8192-clk.h>
> -
>      scp@10500000 {
> -        compatible = "mediatek,mt8192-scp";
> +        compatible = "mediatek,mt8195-scp";
>          reg = <0x10500000 0x80000>,
>                <0x10700000 0x8000>,
>                <0x10720000 0xe0000>;
>          reg-names = "sram", "cfg", "l1tcm";
> -        clocks = <&infracfg CLK_INFRA_SCPSYS>;
> -        clock-names = "main";
> +
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges = <0x105a0000 0x105a0000 0x20000>;
> +
> +        scp-c1@105a0000 {
> +                compatible = "mediatek,mt8195-scp-core";

Messed indentation. Use 4 spaces for example indentation.


Best regards,
Krzysztof

