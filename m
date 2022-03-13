Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D970B4D75D3
	for <lists+linux-media@lfdr.de>; Sun, 13 Mar 2022 15:20:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234590AbiCMOVG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Mar 2022 10:21:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231871AbiCMOVF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Mar 2022 10:21:05 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0895727B14;
        Sun, 13 Mar 2022 07:19:58 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 71346475;
        Sun, 13 Mar 2022 15:19:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647181196;
        bh=WaoleO/ZRBx2siKXIxrzjB2abK9nh4CnPb/4zH5Uiak=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eRgokiQMZJ+psTH/JXlaWkjv9FrmHbDjEGcPrfa97aGFUSpv3JfQy7aCbQv6iU3pT
         vMSdFkHp0C/Q0KRi9wudoTfKQrj+efpr3GB2jQOH3epOxyIZMcFcHMM2kBUaItKFEv
         J7/fBtBmIAvYtLUosCETKYj93iKGjukwkkXl03SQ=
Date:   Sun, 13 Mar 2022 16:19:40 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v5 1/3] media: dt-bindings: media: renesas,vsp1: Document
 RZ/{G2L,V2L} VSPD bindings
Message-ID: <Yi39fGVE0f9LgN/1@pendragon.ideasonboard.com>
References: <20220312084205.31462-1-biju.das.jz@bp.renesas.com>
 <20220312084205.31462-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220312084205.31462-2-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Biju,

Thank you for the patch.

On Sat, Mar 12, 2022 at 08:42:03AM +0000, Biju Das wrote:
> Document VSPD found in RZ/G2L and RZ/V2L family SoC's. VSPD block is
> similar to VSP2-D found on R-Car SoC's, but it does not have a version
> register and it has 3 clocks compared to 1 clock on vsp1 and vsp2.
> 
> This patch introduces a new compatible 'renesas,rzg2l-vsp2' to handle
> these differences.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
> v4->v5:
>  * No change
> v3->v4:
>  * No change
> v2->v3:
>  * Added Rb tag from Krzysztof.
> v1->v2:
>  * Changed compatible from vsp2-rzg2l->rzg2l-vsp2
> RFC->v1:
>  * Updated commit description
>  * Changed compatible from vsp2-r9a07g044->vsp2-rzg2l
>  * Defined the clocks
>  * Clock max Items is based on SoC Compatible string
> RFC:
>  * https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-20-biju.das.jz@bp.renesas.com/
> ---
>  .../bindings/media/renesas,vsp1.yaml          | 52 ++++++++++++++-----
>  1 file changed, 39 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> index 990e9c1dbc43..2696a4582251 100644
> --- a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> @@ -19,6 +19,7 @@ properties:
>      enum:
>        - renesas,vsp1 # R-Car Gen2 and RZ/G1
>        - renesas,vsp2 # R-Car Gen3 and RZ/G2
> +      - renesas,rzg2l-vsp2 # RZ/G2L and RZ/V2L
>  
>    reg:
>      maxItems: 1
> @@ -26,8 +27,8 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> -  clocks:
> -    maxItems: 1
> +  clocks: true
> +  clock-names: true
>  
>    power-domains:
>      maxItems: 1
> @@ -50,17 +51,42 @@ required:
>  
>  additionalProperties: false
>  
> -if:
> -  properties:
> -    compatible:
> -      items:
> -        - const: renesas,vsp1
> -then:
> -  properties:
> -    renesas,fcp: false
> -else:
> -  required:
> -    - renesas,fcp
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,vsp1
> +    then:
> +      properties:
> +        renesas,fcp: false
> +    else:
> +      required:
> +        - renesas,fcp
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,rzg2l-vsp2
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: LCDC Main clock
> +            - description: LCDC Register Access Clock
> +            - description: LCDC Video Clock

Shouldn't we avoid referring to LCDC in the VSP bindings ?

> +        clock-names:
> +          items:
> +            - const: du.0

Similarly, I'm not sure this is a good name from the point of view of
the VSP.

> +            - const: pclk
> +            - const: vclk

I couldn't find those names in the documentation, where do they come
from ? Could you maybe share a DT integration example ?

> +      required:
> +        - clock-names
> +    else:
> +      properties:
> +        clocks:
> +          maxItems: 1
>  
>  examples:
>    # R8A7790 (R-Car H2) VSP1-S

-- 
Regards,

Laurent Pinchart
