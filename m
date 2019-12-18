Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F4FD12573B
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2019 23:52:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726695AbfLRWvy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Dec 2019 17:51:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:37946 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726463AbfLRWvy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Dec 2019 17:51:54 -0500
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B3019227BF;
        Wed, 18 Dec 2019 22:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576709513;
        bh=ikIQL3G4qYb8KbWizxcrAUGL1YeXt314hX/pFQ5TyHQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=yN86uhHVuanyGmYlZ2UiRTDBQmIsfbs+GLuq8RIuBgz4ZkAuXKMu7n1HnUZQA6qVM
         eW5hafPQvno+/8pl5AY+E2dWs6keMM5izYAbYVnjeGdOYED7Hv566k03ufAJHvV9Rx
         X0HbfvCpxC06YomOX8K/V2NMDugaG/FZDzGy4lRw=
Received: by mail-qk1-f176.google.com with SMTP id w127so3009782qkb.11;
        Wed, 18 Dec 2019 14:51:53 -0800 (PST)
X-Gm-Message-State: APjAAAWZO2XkEQSiX9iz18YhDgMRcDKoz927zn7RvOm1qwfdg3ffQ4w3
        4CKreDcA1GRTV7ieYFNrVz4odb15KiDZvlwzzg==
X-Google-Smtp-Source: APXvYqxaQcia+7wj43il7/VAVS2mF5JlbvYF0y3vbSxJME+Yu57ll5wT1N+cqSquqi899qwSawtvom5DUUYmgUmDHto=
X-Received: by 2002:a37:a70b:: with SMTP id q11mr5145839qke.393.1576709512817;
 Wed, 18 Dec 2019 14:51:52 -0800 (PST)
MIME-Version: 1.0
References: <20191218132251.24161-1-stanimir.varbanov@linaro.org> <20191218132251.24161-7-stanimir.varbanov@linaro.org>
In-Reply-To: <20191218132251.24161-7-stanimir.varbanov@linaro.org>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 18 Dec 2019 16:51:41 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+1Z72J03tZa9T4DLzR7skFweV8Xe4vBd_QBUktVOekrA@mail.gmail.com>
Message-ID: <CAL_Jsq+1Z72J03tZa9T4DLzR7skFweV8Xe4vBd_QBUktVOekrA@mail.gmail.com>
Subject: Re: [PATCH v2 06/12] dt-bindings: media: venus: Convert msm8916 to DT schema
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        dikshita@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 18, 2019 at 7:24 AM Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
> Convert qcom,msm8916-venus Venus binding to DT schema
>
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  .../bindings/media/qcom,venus-msm8916.yaml    | 115 ++++++++++++++++++
>  1 file changed, 115 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,venus-msm8916.yaml

Make the filename match the compatible.

>
> diff --git a/Documentation/devicetree/bindings/media/qcom,venus-msm8916.yaml b/Documentation/devicetree/bindings/media/qcom,venus-msm8916.yaml
> new file mode 100644
> index 000000000000..f82a8d968202
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,venus-msm8916.yaml
> @@ -0,0 +1,115 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/media/qcom,venus-msm8916.yaml#"
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
> +      - qcom,msm8916-venus

Not likely a 2nd compatible here?, so you can use 'const' instead.

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
> +    maxItems: 3

Don't need this. Implied with the length of 'items'.

> +    items:
> +      - const: core
> +      - const: iface
> +      - const: bus
> +
> +  iommus:
> +    minItems: 1
> +    maxItems: 20
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

       additionalProperties: false

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

Here too.

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
