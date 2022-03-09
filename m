Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85C134D26E7
	for <lists+linux-media@lfdr.de>; Wed,  9 Mar 2022 05:06:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230303AbiCIBZI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Mar 2022 20:25:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229768AbiCIBZG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Mar 2022 20:25:06 -0500
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B5F03465A;
        Tue,  8 Mar 2022 17:23:54 -0800 (PST)
Received: by mail-oi1-f176.google.com with SMTP id ay7so1168436oib.8;
        Tue, 08 Mar 2022 17:23:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=z8phFBGIEyLJdM34Zal+e+8ZhJ9TzDoyxUSohk9RtYQ=;
        b=fmf78BiAAWUY7EnTs27JroQ/jIQ1/2ZjRlbN/PC5Zij6hkyCGHMiLjlLxQxtZbMPVU
         9SNGLstn8gXl4OESGu0sToB3lwCypcHSA/d2Ry5xeCPWYDEZl3EmjkLrGqZR/thFwCFT
         Y3Rb8NIcAiBwU4M4bCvxLwvP/5rJKppF89yCybRBGDFAsXl8apbhOpUcjJ1MCB/C18nZ
         pCzSsgZy3z7TPXFqVkWvM8LtT5CPelSKgi/lwn4mGH8I0ft9YWD3kGBgx0+t4EmJ9OBX
         TzBOEUoB7IoHIh2yLthrhJ0j1ccd08O91xAN0HIgktD52KjdGyDphurT7Oxb7CWlAKRM
         eqJw==
X-Gm-Message-State: AOAM533RKsAFrCOhG2s6RaPbvTm/j8wUYNfL5aZ6SK94rJVrrb8CH1nU
        pjmI2I5fcpK8DJQUHXzW1A==
X-Google-Smtp-Source: ABdhPJzjxTp5MHz1l0h6XpttmVDVM/j27iOw6ZiWKrpQnrsJpno3Hdthex7W7PQnpRle6ofg0N8FBg==
X-Received: by 2002:a05:6808:1592:b0:2d9:fd1a:1a69 with SMTP id t18-20020a056808159200b002d9fd1a1a69mr4822216oiw.110.1646789033593;
        Tue, 08 Mar 2022 17:23:53 -0800 (PST)
Received: from rob (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id v5-20020a544d05000000b002d7652b3c52sm258085oix.25.2022.03.08.17.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 17:23:52 -0800 (PST)
Received: (nullmailer pid 1713949 invoked by uid 1000);
        Wed, 09 Mar 2022 01:23:50 -0000
Date:   Tue, 8 Mar 2022 18:23:50 -0700
From:   Rob Herring <robh@kernel.org>
To:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, nicolas@ndufresne.ca,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 7/9] media: dt-bindings: media: Add i.MX8MP DW100
 binding
Message-ID: <20220309012350.GA1710752@robh.at.kernel.org>
References: <20220308201038.48386-1-xavier.roumegue@oss.nxp.com>
 <20220308201038.48386-8-xavier.roumegue@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220308201038.48386-8-xavier.roumegue@oss.nxp.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Mar 08, 2022 at 09:10:36PM +0100, Xavier Roumegue wrote:
> Add DT binding documentation for the Vivante DW100 dewarper engine found
> on NXP i.MX8MP SoC
> 
> Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../devicetree/bindings/media/nxp,dw100.yaml  | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/nxp,dw100.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/nxp,dw100.yaml b/Documentation/devicetree/bindings/media/nxp,dw100.yaml
> new file mode 100644
> index 000000000000..2c3b82be0b74
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/nxp,dw100.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/nxp,dw100.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP i.MX8MP DW100 Dewarper core
> +
> +maintainers:
> +  - Xavier Roumegue <xavier.roumegue@oss.nxp.com>
> +
> +description: |-
> +  The Dewarp Engine provides high-performance dewarp processing for the
> +  correction of the distortion that is introduced in images produced by fisheye
> +  and wide angle lenses. It is implemented with a line/tile-cache based
> +  architecture. With configurable address mapping look up tables and per tile
> +  processing, it successfully generates a corrected output image.
> +  The engine can be used to perform scaling, cropping and pixel format
> +  conversion.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nxp,dw100

Version of h/w and features are all discoverable? If so, add a note to 
that effect. If not, needs to be SoC specific.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: The AXI clock
> +      - description: The AHB clock
> +
> +  clock-names:
> +    items:
> +      - const: axi
> +      - const: ahb
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - power-domains
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx8mp-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/imx8mp-power.h>
> +
> +    dewarp: dwe@32e30000 {
> +            compatible = "nxp,dw100";
> +            reg = <0x32e30000 0x10000>;
> +            interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks = <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>,
> +                     <&clk IMX8MP_CLK_MEDIA_APB_ROOT>;
> +            clock-names = "axi", "ahb";
> +            power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_DWE>;
> +    };
> -- 
> 2.35.1
> 
> 
