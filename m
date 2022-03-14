Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F37CC4D83D3
	for <lists+linux-media@lfdr.de>; Mon, 14 Mar 2022 13:20:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241142AbiCNMVw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Mar 2022 08:21:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242304AbiCNMS4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Mar 2022 08:18:56 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 690464754D;
        Mon, 14 Mar 2022 05:13:59 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1CE3130B;
        Mon, 14 Mar 2022 13:13:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647260036;
        bh=CCBbr7YW6AtHXNdUGRWrM8dwrLI+DcEe4pseQUM4RHY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RXYeAcOdrMmmaGhWIbNyyLP5lf08OVC6hdRP4viaoEz2/yVqxuzIqgMgFry9LZhjc
         AYivOazAv5K10ulztR+upt/4qxSvtLw2XYEA8Jqovmm7kHvcJYsqLKzNjseMjl7BMa
         s21gEzBTRUE5lpROWveHbHI8k+sG8eXrepFTjPJo=
Date:   Mon, 14 Mar 2022 14:13:38 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v5 1/3] media: dt-bindings: media: renesas,vsp1: Document
 RZ/{G2L,V2L} VSPD bindings
Message-ID: <Yi8xcuxSff0UFRaf@pendragon.ideasonboard.com>
References: <20220312084205.31462-1-biju.das.jz@bp.renesas.com>
 <20220312084205.31462-2-biju.das.jz@bp.renesas.com>
 <Yi39fGVE0f9LgN/1@pendragon.ideasonboard.com>
 <OS0PR01MB592293BC9493DC1DAD1DA0C0860F9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdVYYMJvbnR3r-KGtU=3hiKjsiaXH4xyUzhv7vY5Y6MB6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdVYYMJvbnR3r-KGtU=3hiKjsiaXH4xyUzhv7vY5Y6MB6A@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Geert,

On Mon, Mar 14, 2022 at 10:01:14AM +0100, Geert Uytterhoeven wrote:
> On Mon, Mar 14, 2022 at 9:44 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > On Sat, Mar 12, 2022 at 08:42:03AM +0000, Biju Das wrote:
> > > > Document VSPD found in RZ/G2L and RZ/V2L family SoC's. VSPD block is
> > > > similar to VSP2-D found on R-Car SoC's, but it does not have a version
> > > > register and it has 3 clocks compared to 1 clock on vsp1 and vsp2.
> > > >
> > > > This patch introduces a new compatible 'renesas,rzg2l-vsp2' to handle
> > > > these differences.
> > > >
> > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> 
> > > > index 990e9c1dbc43..2696a4582251 100644
> > > > --- a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> > > > +++ b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> 
> > > > +        clock-names:
> > > > +          items:
> > > > +            - const: du.0
> > >
> > > Similarly, I'm not sure this is a good name from the point of view of the
> > > VSP.
> >
> > OK, will use the name 'aclk', which is Main clock for this module which is
> > shared with LCDC. 'du.0' is not valid any more here as we are using different
> > CRTC implementation for RZ/G2LC.
> >
> > > > +            - const: pclk
> > > > +            - const: vclk
> > >
> > > I couldn't find those names in the documentation, where do they come from
> >
> > HW manual (page 312) mentions about LCDC_CLK_A, LCDC_CLK_P & LCDC_CLK_D.
> >
> > Detailed description is mentioned in Clock list document. Please see below.
> >
> >         LCDC_CLK_A      M0φ     PLL3    200     200             LCDC  Main clock
> >         LCDC_CLK_P      ZTφ     PLL3    100     100             LCDC Register Access Clock
> >         LCDC_CLK_D      M3φ     SEL_PLL5_4      148.5~5.803     LCDC Video Clock
> >
> > > ? Could you maybe share a DT integration example ?
> >
> > Please see below,
> 
> >
> > +               du: display@0x10890000 {
> > +                       compatible = "renesas,du-r9a07g044l";
> > +                       reg = <0 0x10890000 0 0x10000>;
> > +                       interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
> > +                       clocks = <&cpg CPG_MOD R9A07G044_LCDC_CLK_A>,
> > +                                <&cpg CPG_MOD R9A07G044_LCDC_CLK_P>,
> > +                                <&cpg CPG_MOD R9A07G044_LCDC_CLK_D>;
> > +                       clock-names = "du.0", "pclk", "vclk";
> > +                       power-domains = <&cpg>;
> > +                       resets = <&cpg R9A07G044_LCDC_RESET_N>;
> > +                       reset-names = "du.0";
> > +                       renesas,vsps = <&vspd0 0>;
> 
> Given the DU driver is no longer shared, perhaps all occurrencies of "du"
> should be replaced by "lcdc"?

The LCDC is the combination of the FCPVD, the VSPD and the DU. The first
two are similar to the eponymous IP cores used on R-Car Gen3, while the
DU is a different beast, despite sharing the same name.

-- 
Regards,

Laurent Pinchart
