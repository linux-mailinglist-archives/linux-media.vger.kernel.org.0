Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A11014CDF4D
	for <lists+linux-media@lfdr.de>; Fri,  4 Mar 2022 22:01:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229920AbiCDUhm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Mar 2022 15:37:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229779AbiCDUhe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Mar 2022 15:37:34 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC6DA1ED4CF;
        Fri,  4 Mar 2022 12:36:45 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2CF32488;
        Fri,  4 Mar 2022 21:36:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646426203;
        bh=suJ3hI7+K0WUySr21+I1w+6rZPszXc18w8cCrTdna3Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TKJRuKdt4GofWOYZcFDrl2aEZuXB6llrLGQZrhRLD2uMX9YCtuaP5MMrsp3N8N/4p
         PCq3EO1i8gps5sf2fqLztok/ENB1+4G0R2eh3Gv9t3HqbFEZ4ACgM5jwIWOmcAlmkJ
         0UpbpkjsrYa6bYEeyJ46ju+d0/JQ4J0n6/uoMtpE=
Date:   Fri, 4 Mar 2022 22:36:30 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, tomi.valkeinen@ideasonboard.com,
        robh+dt@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] media: dt-bindings: media: Add i.MX8MP DW100 binding
Message-ID: <YiJ4TpTZWhslY/vN@pendragon.ideasonboard.com>
References: <20220304202813.2560202-1-xavier.roumegue@oss.nxp.com>
 <20220304202813.2560202-2-xavier.roumegue@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220304202813.2560202-2-xavier.roumegue@oss.nxp.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Xavier,

Thank you for the patch.

On Fri, Mar 04, 2022 at 09:28:11PM +0100, Xavier Roumegue wrote:
> Add DT binding documentation for the Vivante DW100 dewarper engine found
> on NXP i.MX8MP SoC
> 
> Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
> ---
>  .../devicetree/bindings/media/nxp,dw100.yaml  | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/nxp,dw100.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/nxp,dw100.yaml b/Documentation/devicetree/bindings/media/nxp,dw100.yaml
> new file mode 100644
> index 000000000000..0cea4bb03c5d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/nxp,dw100.yaml
> @@ -0,0 +1,74 @@
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
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 2
> +    items:
> +      - description: The AXI clock
> +      - description: The AHB clock
> +
> +  clock-names:
> +    minItems: 2
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
> +                    <&clk IMX8MP_CLK_MEDIA_APB_ROOT>;

One more space of indentation here.

> +            clock-names = "axi", "ahb";
> +            assigned-clocks = <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>,
> +                    <&clk IMX8MP_CLK_MEDIA_APB_ROOT>;
> +            assigned-clock-rates = <500000000>, <200000000>;

I'd drop the assigned-clocks property, as I think it would make more
sense to add them to the media-blk-ctrl node than to individual devices
in the mediamix power domain.

With these small issues fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +            power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_DWE>;
> +    };

-- 
Regards,

Laurent Pinchart
