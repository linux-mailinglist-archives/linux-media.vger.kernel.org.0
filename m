Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9525A5070FF
	for <lists+linux-media@lfdr.de>; Tue, 19 Apr 2022 16:50:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236134AbiDSOxE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Apr 2022 10:53:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231583AbiDSOxD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Apr 2022 10:53:03 -0400
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A7303A1BB;
        Tue, 19 Apr 2022 07:50:21 -0700 (PDT)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-deb9295679so17727974fac.6;
        Tue, 19 Apr 2022 07:50:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VVhKW8c7nc6SbAR/ZELt+tujD3qG5Z1/eLOMh2+5bgI=;
        b=UHrHvmtaFsn8u2bedmp1ZeC1ajacclIOi/EjObkz2SPZJyW+OPiaX4OphGJMlwajZZ
         5K+sQBvbwhhp7PIM63ZfHZMktraZnPyuuIOC9bL50YsrXkoqOSAB/Qmyj0a2UN9U0xV6
         ZvqUfN1s7G6ZYpYkHjDsv0OlqhSJ8w48Ng8r6iPRvOrevevDvFGJDuW0Sw79SNyRm2N4
         VIin+Wz4bT59ND0VGu6ui57XQbMtlyCJrbm3ucxGregdjIKfVx/Lcdg+gj8RtCJj3mQT
         vDiteAa4CKdAN0b3CeXDaHrqo/GQnqd3gYG/wjwVGY25Oi6E4q6ZqRM7D+sPSG8hs6Vu
         mE3g==
X-Gm-Message-State: AOAM531aJcaNIw4mEklfYZxTiVRhnP9g6V2tN77xYfuLI1F3eZFDMpla
        PuT1/qPuD8AJsEH0zkNayA==
X-Google-Smtp-Source: ABdhPJw6dC0y1vuNaOHanY8cwrprOHfXWv2LAozzZ3ctKwNp5XpWY5Vap2NT+KLSEckP+Whh5ALgeQ==
X-Received: by 2002:a05:6870:3394:b0:dd:cfdd:34c9 with SMTP id w20-20020a056870339400b000ddcfdd34c9mr8638427oae.31.1650379820258;
        Tue, 19 Apr 2022 07:50:20 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id d3-20020a9d2903000000b005cda765f578sm5417617otb.0.2022.04.19.07.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 07:50:19 -0700 (PDT)
Received: (nullmailer pid 2544435 invoked by uid 1000);
        Tue, 19 Apr 2022 14:50:19 -0000
Date:   Tue, 19 Apr 2022 09:50:19 -0500
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
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
Message-ID: <Yl7MKy0qtFYNMEyZ@robh.at.kernel.org>
References: <20220414142605.26235-1-biju.das.jz@bp.renesas.com>
 <20220414142605.26235-2-biju.das.jz@bp.renesas.com>
 <Ylk6dp6TiuwbJqkn@pendragon.ideasonboard.com>
 <OS0PR01MB5922A9C796546784737639B386F39@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <Yl5y80gOfKW33gNn@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yl5y80gOfKW33gNn@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Apr 19, 2022 at 11:29:39AM +0300, Laurent Pinchart wrote:
> Hi Biju,
> 
> On Mon, Apr 18, 2022 at 07:34:19PM +0000, Biju Das wrote:
> > > Subject: Re: [PATCH v7 1/3] media: dt-bindings: media: renesas,vsp1:
> > > Document RZ/{G2L,V2L} VSPD bindings 
> > > 
> > > Hi Biju,
> > > 
> > > Thank you for the patch.
> > > 
> > > On Thu, Apr 14, 2022 at 03:26:03PM +0100, Biju Das wrote:
> > > > Document VSPD found in RZ/G2L and RZ/V2L family SoC's. VSPD block is
> > > > similar to VSP2-D found on R-Car SoC's, but it does not have a version
> > > > register and it has 3 clocks compared to 1 clock on vsp1 and vsp2.
> > > >
> > > > This patch introduces a new compatible 'renesas,rzg2l-vsp2' to handle
> > > > these differences.
> > > >
> > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> > > > ---
> > > > v6->v7:
> > > >  * No change
> > > > v5->v6:
> > > >  * Removed LCDC reference clock description
> > > >  * Changed the clock name from du.0->aclk
> > > > v4->v5:
> > > >  * No change
> > > > v3->v4:
> > > >  * No change
> > > > v2->v3:
> > > >  * Added Rb tag from Krzysztof.
> > > > v1->v2:
> > > >  * Changed compatible from vsp2-rzg2l->rzg2l-vsp2
> > > > RFC->v1:
> > > >  * Updated commit description
> > > >  * Changed compatible from vsp2-r9a07g044->vsp2-rzg2l
> > > >  * Defined the clocks
> > > >  * Clock max Items is based on SoC Compatible string
> > > > RFC:
> > > >  *
> > > 
> > > > ---
> > > >  .../bindings/media/renesas,vsp1.yaml          | 52 ++++++++++++++-----
> > > >  1 file changed, 39 insertions(+), 13 deletions(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> > > > b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> > > > index 990e9c1dbc43..a236b266fa4b 100644
> > > > --- a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> > > > +++ b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> > > > @@ -19,6 +19,7 @@ properties:
> > > >      enum:
> > > >        - renesas,vsp1 # R-Car Gen2 and RZ/G1
> > > >        - renesas,vsp2 # R-Car Gen3 and RZ/G2
> > > > +      - renesas,rzg2l-vsp2 # RZ/G2L and RZ/V2L
> > > >
> > > >    reg:
> > > >      maxItems: 1
> > > > @@ -26,8 +27,8 @@ properties:
> > > >    interrupts:
> > > >      maxItems: 1
> > > >
> > > > -  clocks:
> > > > -    maxItems: 1
> > > > +  clocks: true
> > > > +  clock-names: true
> > > 
> > > clock-names shouldn't be true here, as it should only be set on rzg2l-vsp2.
> > > I think you can actually drop both clocks and clock-names here.
> > 
> > If I drop clocks, then I get below dt_binding_check error
> > 
> > biju@biju-VirtualBox:~/rzg2l-linux$ make ARCH=arm64 DT_CHECKER_FLAGS=-m DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/renesas,vsp1.yaml CROSS_COMPILE=~/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/bin/aarch64-none-linux-gnu- dt_binding_check -j8
> >   LINT    Documentation/devicetree/bindings
> >   DTEX    Documentation/devicetree/bindings/media/renesas,vsp1.example.dts
> >   CHKDT   Documentation/devicetree/bindings/processed-schema.json
> >   SCHEMA  Documentation/devicetree/bindings/processed-schema.json
> >   DTC     Documentation/devicetree/bindings/media/renesas,vsp1.example.dtb
> >   CHECK   Documentation/devicetree/bindings/media/renesas,vsp1.example.dtb
> > /home/biju/rzg2l-linux/Documentation/devicetree/bindings/media/renesas,vsp1.example.dtb: vsp@fe928000: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
> > 	From schema: /home/biju/rzg2l-linux/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> > /home/biju/rzg2l-linux/Documentation/devicetree/bindings/media/renesas,vsp1.example.dtb: vsp@fe920000: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
> > 	From schema: /home/biju/rzg2l-linux/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> > 
> > If I drop clock-names, I get dtbs-check error for RZ/G2{L,LC},
> > 
> > make ARCH=arm64 DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/renesas,vsp1.yaml CROSS_COMPILE=~/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/bin/aarch64-none-linux-gnu- dtbs_check -j8
> > 
> > /home/biju/rzg2l-linux/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: vsp@10870000: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
> > 	From schema: /home/biju/rzg2l-linux/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> > /home/biju/rzg2l-linux/arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb: vsp@10870000: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
> > 	From schema: /home/biju/rzg2l-linux/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> > 
> > So looks like both are required.
> 
> Indeed, we would need to switch from additionalProperties to
> unevaluatedProperties then, and that's not allowed for schemas without a
> $ref.

The issue is here if we allow properties to be defined in if/then 
schemas, we can't have some meta-schema checks on them as we don't know 
if the property is defined elsewhere or not. That's primarily a problem 
for vendor specific properties where we need to ensure a type and 
description.

Rob
