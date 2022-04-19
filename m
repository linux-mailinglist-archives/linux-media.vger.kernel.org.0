Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E13125066EB
	for <lists+linux-media@lfdr.de>; Tue, 19 Apr 2022 10:30:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350005AbiDSIcn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Apr 2022 04:32:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245659AbiDSIc3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Apr 2022 04:32:29 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A36D52DA8D;
        Tue, 19 Apr 2022 01:29:45 -0700 (PDT)
Received: from pendragon.ideasonboard.com (85-76-101-166-nat.elisa-mobile.fi [85.76.101.166])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A16E6305;
        Tue, 19 Apr 2022 10:29:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650356982;
        bh=grUzb/1hkBTCZySunV8a8ldWofTVRuYtPbiP44C1hd4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bICzM93xYnNCNI+NfCiMB24AO4ET892MH4EmPpDQg9mRo5lXGHCISUNrZDNPfMdqP
         YP8Rq2Td/2fvcxU/rYab80t4BtGNN36XWsnzH9kBjZhDUhdpXi0O6uX3T3ydmkmIBy
         oaoO7ez+klfVjmtUw7GmuiT61tbVfDVOGVEs0SEw=
Date:   Tue, 19 Apr 2022 11:29:39 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v7 1/3] media: dt-bindings: media: renesas,vsp1: Document
 RZ/{G2L,V2L} VSPD bindings To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Message-ID: <Yl5y80gOfKW33gNn@pendragon.ideasonboard.com>
References: <20220414142605.26235-1-biju.das.jz@bp.renesas.com>
 <20220414142605.26235-2-biju.das.jz@bp.renesas.com>
 <Ylk6dp6TiuwbJqkn@pendragon.ideasonboard.com>
 <OS0PR01MB5922A9C796546784737639B386F39@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <OS0PR01MB5922A9C796546784737639B386F39@OS0PR01MB5922.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Biju,

On Mon, Apr 18, 2022 at 07:34:19PM +0000, Biju Das wrote:
> > Subject: Re: [PATCH v7 1/3] media: dt-bindings: media: renesas,vsp1:
> > Document RZ/{G2L,V2L} VSPD bindings 
> > 
> > Hi Biju,
> > 
> > Thank you for the patch.
> > 
> > On Thu, Apr 14, 2022 at 03:26:03PM +0100, Biju Das wrote:
> > > Document VSPD found in RZ/G2L and RZ/V2L family SoC's. VSPD block is
> > > similar to VSP2-D found on R-Car SoC's, but it does not have a version
> > > register and it has 3 clocks compared to 1 clock on vsp1 and vsp2.
> > >
> > > This patch introduces a new compatible 'renesas,rzg2l-vsp2' to handle
> > > these differences.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> > > ---
> > > v6->v7:
> > >  * No change
> > > v5->v6:
> > >  * Removed LCDC reference clock description
> > >  * Changed the clock name from du.0->aclk
> > > v4->v5:
> > >  * No change
> > > v3->v4:
> > >  * No change
> > > v2->v3:
> > >  * Added Rb tag from Krzysztof.
> > > v1->v2:
> > >  * Changed compatible from vsp2-rzg2l->rzg2l-vsp2
> > > RFC->v1:
> > >  * Updated commit description
> > >  * Changed compatible from vsp2-r9a07g044->vsp2-rzg2l
> > >  * Defined the clocks
> > >  * Clock max Items is based on SoC Compatible string
> > > RFC:
> > >  *
> > 
> > > ---
> > >  .../bindings/media/renesas,vsp1.yaml          | 52 ++++++++++++++-----
> > >  1 file changed, 39 insertions(+), 13 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> > > b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> > > index 990e9c1dbc43..a236b266fa4b 100644
> > > --- a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> > > +++ b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> > > @@ -19,6 +19,7 @@ properties:
> > >      enum:
> > >        - renesas,vsp1 # R-Car Gen2 and RZ/G1
> > >        - renesas,vsp2 # R-Car Gen3 and RZ/G2
> > > +      - renesas,rzg2l-vsp2 # RZ/G2L and RZ/V2L
> > >
> > >    reg:
> > >      maxItems: 1
> > > @@ -26,8 +27,8 @@ properties:
> > >    interrupts:
> > >      maxItems: 1
> > >
> > > -  clocks:
> > > -    maxItems: 1
> > > +  clocks: true
> > > +  clock-names: true
> > 
> > clock-names shouldn't be true here, as it should only be set on rzg2l-vsp2.
> > I think you can actually drop both clocks and clock-names here.
> 
> If I drop clocks, then I get below dt_binding_check error
> 
> biju@biju-VirtualBox:~/rzg2l-linux$ make ARCH=arm64 DT_CHECKER_FLAGS=-m DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/renesas,vsp1.yaml CROSS_COMPILE=~/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/bin/aarch64-none-linux-gnu- dt_binding_check -j8
>   LINT    Documentation/devicetree/bindings
>   DTEX    Documentation/devicetree/bindings/media/renesas,vsp1.example.dts
>   CHKDT   Documentation/devicetree/bindings/processed-schema.json
>   SCHEMA  Documentation/devicetree/bindings/processed-schema.json
>   DTC     Documentation/devicetree/bindings/media/renesas,vsp1.example.dtb
>   CHECK   Documentation/devicetree/bindings/media/renesas,vsp1.example.dtb
> /home/biju/rzg2l-linux/Documentation/devicetree/bindings/media/renesas,vsp1.example.dtb: vsp@fe928000: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	From schema: /home/biju/rzg2l-linux/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> /home/biju/rzg2l-linux/Documentation/devicetree/bindings/media/renesas,vsp1.example.dtb: vsp@fe920000: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	From schema: /home/biju/rzg2l-linux/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> 
> If I drop clock-names, I get dtbs-check error for RZ/G2{L,LC},
> 
> make ARCH=arm64 DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/renesas,vsp1.yaml CROSS_COMPILE=~/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/bin/aarch64-none-linux-gnu- dtbs_check -j8
> 
> /home/biju/rzg2l-linux/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: vsp@10870000: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	From schema: /home/biju/rzg2l-linux/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> /home/biju/rzg2l-linux/arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb: vsp@10870000: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	From schema: /home/biju/rzg2l-linux/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> 
> So looks like both are required.

Indeed, we would need to switch from additionalProperties to
unevaluatedProperties then, and that's not allowed for schemas without a
$ref.

> Please correct me, If I am missing anything here.

Let's keep both properties here, but then ... (see below)

> > With this addressed,
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > >
> > >    power-domains:
> > >      maxItems: 1
> > > @@ -50,17 +51,42 @@ required:
> > >
> > >  additionalProperties: false
> > >
> > > -if:
> > > -  properties:
> > > -    compatible:
> > > -      items:
> > > -        - const: renesas,vsp1
> > > -then:
> > > -  properties:
> > > -    renesas,fcp: false
> > > -else:
> > > -  required:
> > > -    - renesas,fcp
> > > +allOf:
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            const: renesas,vsp1
> > > +    then:
> > > +      properties:
> > > +        renesas,fcp: false
> > > +    else:
> > > +      required:
> > > +        - renesas,fcp
> > > +
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            const: renesas,rzg2l-vsp2
> > > +    then:
> > > +      properties:
> > > +        clocks:
> > > +          items:
> > > +            - description: Main clock
> > > +            - description: Register access clock
> > > +            - description: Video clock
> > > +        clock-names:
> > > +          items:
> > > +            - const: aclk
> > > +            - const: pclk
> > > +            - const: vclk
> > > +      required:
> > > +        - clock-names
> > > +    else:
> > > +      properties:
> > > +        clocks:
> > > +          maxItems: 1

... you will need

        clock-names: false

here.

> > >
> > >  examples:
> > >    # R8A7790 (R-Car H2) VSP1-S

-- 
Regards,

Laurent Pinchart
