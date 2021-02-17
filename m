Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F090D31E2C8
	for <lists+linux-media@lfdr.de>; Wed, 17 Feb 2021 23:50:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233233AbhBQWtp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Feb 2021 17:49:45 -0500
Received: from mail-oi1-f179.google.com ([209.85.167.179]:43271 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233304AbhBQWtY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Feb 2021 17:49:24 -0500
Received: by mail-oi1-f179.google.com with SMTP id d20so16748770oiw.10;
        Wed, 17 Feb 2021 14:49:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iwFEJ3kjWH7byU1Bj+qTU+zAIBp4rtQWtPBYut/wBEM=;
        b=T6YBFhb+pWt+f3ejys6q4pjLctaOJOrb2RItftMWmaG1PZYUaje+ln0kG3QFiDLUJa
         CxRtN4Y0atuKfBqyeoG3xqJCtz/uaK2rCrXm8f/pa8MRZw3FYVUAaH/AcPtDbRJr3tBR
         aDqf2jw6QiIj6MAAxVvSrp+PopjvfXNwb07bIq8FGL5rPh6b1tJI8lLrMMMKsYlIBdjw
         QEKVA0vpQMNhTJlvNl/lnA5hYbmxhaR/G1p9iXUaL2m56nYdFxIA+GKzmwBzgIiDq2a/
         WN+Ced2/vyIftkYbIQEEQgWtBH1H/jOF3KGFSzqokzGhOdraaKojUrbCPFU+GQVHiW2+
         Rc7w==
X-Gm-Message-State: AOAM5308IYXUy4RLV7unpjDk2SA30fDHCsJNfseoiX/hiSJBH+xG/GWF
        RuEcpwpnMcGYvJyKCp9tSg==
X-Google-Smtp-Source: ABdhPJyf/6sqkBW6AkNJ46Z+XYd5SPLiqxsxxEvUsHVT9KbgLtYtbIRNM/9Zyv8yIyOIeh47JrRsXA==
X-Received: by 2002:a05:6808:8da:: with SMTP id k26mr704298oij.165.1613602122708;
        Wed, 17 Feb 2021 14:48:42 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 20sm166385oiz.14.2021.02.17.14.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 14:48:41 -0800 (PST)
Received: (nullmailer pid 2937635 invoked by uid 1000);
        Wed, 17 Feb 2021 22:48:39 -0000
Date:   Wed, 17 Feb 2021 16:48:39 -0600
From:   Rob Herring <robh@kernel.org>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     ezequiel@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, gregkh@linuxfoundation.org,
        mripard@kernel.org, paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, krzk@kernel.org, shengjiu.wang@nxp.com,
        adrian.ratiu@collabora.com, aisheng.dong@nxp.com, peng.fan@nxp.com,
        Anson.Huang@nxp.com, hverkuil-cisco@xs4all.nl,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        kernel@collabora.com
Subject: Re: [PATCH v1 17/18] dt-bindings: media: nxp,imx8mq-vpu: Update
 bindings
Message-ID: <20210217224839.GA2888647@robh.at.kernel.org>
References: <20210217080306.157876-1-benjamin.gaignard@collabora.com>
 <20210217080306.157876-18-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210217080306.157876-18-benjamin.gaignard@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 17, 2021 at 09:03:05AM +0100, Benjamin Gaignard wrote:
> The introduction on HEVC decoder lead to update the bindings
> to support it.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
> ---
>  .../bindings/media/nxp,imx8mq-vpu.yaml        | 54 ++++++++++++-------
>  1 file changed, 36 insertions(+), 18 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> index 762be3f96ce9..468435c70eef 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> @@ -15,24 +15,25 @@ description:
>  
>  properties:
>    compatible:
> -    const: nxp,imx8mq-vpu
> +    enum:
> +      - nxp,imx8mq-vpu
> +      - nxp,imx8mq-vpu-g2
>  
>    reg:
> -    maxItems: 3
> +    maxItems: 1
>  
>    reg-names:
> -    items:
> -      - const: g1
> -      - const: g2
> -      - const: ctrl
> +    enum:
> +      - g1
> +      - g2

This isn't a compatible change. You need to state why that's okay if it 
is okay.

>  
>    interrupts:
> -    maxItems: 2
> +    maxItems: 1
>  
>    interrupt-names:
> -    items:
> -      - const: g1
> -      - const: g2
> +    enum:
> +      - g1
> +      - g2
>  
>    clocks:
>      maxItems: 3
> @@ -46,6 +47,9 @@ properties:
>    power-domains:
>      maxItems: 1
>  
> +  resets:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
> @@ -54,6 +58,7 @@ required:
>    - interrupt-names
>    - clocks
>    - clock-names
> +  - resets
>  
>  additionalProperties: false
>  
> @@ -61,19 +66,32 @@ examples:
>    - |
>          #include <dt-bindings/clock/imx8mq-clock.h>
>          #include <dt-bindings/interrupt-controller/arm-gic.h>
> +        #include <dt-bindings/reset/imx8mq-vpu-reset.h>
>  
> -        vpu: video-codec@38300000 {
> +        vpu_g1: video-codec@38300000 {
>                  compatible = "nxp,imx8mq-vpu";
> -                reg = <0x38300000 0x10000>,
> -                      <0x38310000 0x10000>,
> -                      <0x38320000 0x10000>;
> -                reg-names = "g1", "g2", "ctrl";
> -                interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
> -                             <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> -                interrupt-names = "g1", "g2";
> +                reg = <0x38300000 0x10000>;
> +                reg-names = "g1";
> +                interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +                interrupt-names = "g1";
> +                clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>,
> +                         <&clk IMX8MQ_CLK_VPU_G2_ROOT>,
> +                         <&clk IMX8MQ_CLK_VPU_DEC_ROOT>;
> +                clock-names = "g1", "g2", "bus";
> +                power-domains = <&pgc_vpu>;
> +                resets = <&vpu_reset IMX8MQ_RESET_VPU_RESET_G1>;
> +        };
> +
> +        vpu_g2: video-codec@38310000 {
> +                compatible = "nxp,imx8mq-vpu-g2";
> +                reg = <0x38310000 0x10000>;
> +                reg-names = "g2";
> +                interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> +                interrupt-names = "g2";
>                  clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>,
>                           <&clk IMX8MQ_CLK_VPU_G2_ROOT>,
>                           <&clk IMX8MQ_CLK_VPU_DEC_ROOT>;
>                  clock-names = "g1", "g2", "bus";
>                  power-domains = <&pgc_vpu>;
> +                resets = <&vpu_reset IMX8MQ_RESET_VPU_RESET_G2>;
>          };
> -- 
> 2.25.1
> 
