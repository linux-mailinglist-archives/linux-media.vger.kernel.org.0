Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 688C2D3FD5
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2019 14:44:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728002AbfJKMoN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Oct 2019 08:44:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:36780 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727589AbfJKMoN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Oct 2019 08:44:13 -0400
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DF33221D80;
        Fri, 11 Oct 2019 12:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570797852;
        bh=MEKOQdvYjwnV7XxSeqjDPTn7gFVU7mMSkuBj2ymboMo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ZswXe9+0nzY9X3l/t3kfrKcFduNQAtzvf6wLYtAd4LyML+5zr0+WLbeYI5A/SBhRL
         g22T2gP80BXIk1gRH5n8sVSZamE6EyqH+DWoYmrK+ympuyzeXFLGusCA23jlsQd1WR
         312EcVaYJoaK3EZXUvcfBjJZqGu8hrCG+epWsNz8=
Received: by mail-qt1-f182.google.com with SMTP id o12so13666577qtf.3;
        Fri, 11 Oct 2019 05:44:11 -0700 (PDT)
X-Gm-Message-State: APjAAAUwrIFVadetYfDUD4pmvh7eh/VRU8Iskecs82+ZqK9Ku+BSAehk
        i07NyzfLGBXti83rSaDyuMViexNroasfBEjMLg==
X-Google-Smtp-Source: APXvYqwVc+cipqk2hiwueeEGXDM/JKUDZPO53c7H1w6zenvtLkPW0FEI+rIctoU/ClWSPxDeQqBjwzaQSHKcUKdJyZ8=
X-Received: by 2002:a0c:e606:: with SMTP id z6mr15185686qvm.135.1570797850997;
 Fri, 11 Oct 2019 05:44:10 -0700 (PDT)
MIME-Version: 1.0
References: <20191002151410.15306-1-benjamin.gaignard@st.com>
In-Reply-To: <20191002151410.15306-1-benjamin.gaignard@st.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 11 Oct 2019 07:43:59 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK0hBSzn4YfhGmFyv8a5bCDtBvW0_bdhJwk0g_N7iVFtQ@mail.gmail.com>
Message-ID: <CAL_JsqK0hBSzn4YfhGmFyv8a5bCDtBvW0_bdhJwk0g_N7iVFtQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: media: Convert stm32 cec bindings to json-schema
To:     Benjamin Gaignard <benjamin.gaignard@st.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Yannick Fertre <yannick.fertre@st.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 2, 2019 at 10:14 AM Benjamin Gaignard
<benjamin.gaignard@st.com> wrote:
>
> Convert the STM32 cec binding to DT schema format using json-schema

Similar comments here too.

>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  .../devicetree/bindings/media/st,stm32-cec.txt     | 19 --------
>  .../devicetree/bindings/media/st,stm32-cec.yaml    | 57 ++++++++++++++++++++++
>  2 files changed, 57 insertions(+), 19 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/st,stm32-cec.txt
>  create mode 100644 Documentation/devicetree/bindings/media/st,stm32-cec.yaml
>
> diff --git a/Documentation/devicetree/bindings/media/st,stm32-cec.txt b/Documentation/devicetree/bindings/media/st,stm32-cec.txt
> deleted file mode 100644
> index 6be2381c180d..000000000000
> --- a/Documentation/devicetree/bindings/media/st,stm32-cec.txt
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -STMicroelectronics STM32 CEC driver
> -
> -Required properties:
> - - compatible : value should be "st,stm32-cec"
> - - reg : Physical base address of the IP registers and length of memory
> -        mapped region.
> - - clocks : from common clock binding: handle to CEC clocks
> - - clock-names : from common clock binding: must be "cec" and "hdmi-cec".
> - - interrupts : CEC interrupt number to the CPU.
> -
> -Example for stm32f746:
> -
> -cec: cec@40006c00 {
> -       compatible = "st,stm32-cec";
> -       reg = <0x40006C00 0x400>;
> -       interrupts = <94>;
> -       clocks = <&rcc 0 STM32F7_APB1_CLOCK(CEC)>, <&rcc 1 CLK_HDMI_CEC>;
> -       clock-names = "cec", "hdmi-cec";
> -};
> diff --git a/Documentation/devicetree/bindings/media/st,stm32-cec.yaml b/Documentation/devicetree/bindings/media/st,stm32-cec.yaml
> new file mode 100644
> index 000000000000..c99144107185
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/st,stm32-cec.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/st,stm32-cec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32 CEC bindings
> +
> +maintainers:
> +  - Benjamin Gaignard <benjamin.gaignard@st.com>
> +  - Yannick Fertre <yannick.fertre@st.com>
> +
> +properties:
> +  compatible:
> +    const: st,stm32-cec
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Module Clock
> +      - description: Bus Clock
> +
> +  clock-names:
> +    items:
> +      - const: cec
> +      - const: hdmi-cec
> +
> +  pinctrl-names: true
> +
> +patternProperties:
> +  "^pinctrl-[0-9]+$": true

You don't need to list the pinctrl properties.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names

additionalProperties: false

> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/stm32mp1-clks.h>
> +    cec: cec@40006c00 {
> +        compatible = "st,stm32-cec";
> +        reg = <0x40006c00 0x400>;
> +        interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&rcc CEC_K>, <&clk_lse>;
> +        clock-names = "cec", "hdmi-cec";
> +    };
> +
> +...
> --
> 2.15.0
>
