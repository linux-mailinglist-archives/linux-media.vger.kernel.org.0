Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D64984D8575
	for <lists+linux-media@lfdr.de>; Mon, 14 Mar 2022 13:51:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233516AbiCNMwj convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 14 Mar 2022 08:52:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231528AbiCNMwi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Mar 2022 08:52:38 -0400
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B805CEB1;
        Mon, 14 Mar 2022 05:51:28 -0700 (PDT)
Received: by mail-qk1-f182.google.com with SMTP id g8so9040847qke.2;
        Mon, 14 Mar 2022 05:51:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=R2mGQRlSs2sPNfzIP5enDMwkH/6tUq+UYR9mrMFxdzg=;
        b=JWMjIDbuI89xhEm/QXVKFCCtozcJ+W4g0x+YdKYg5D4FHkOR10tTqNr3g1QJ+0AZ/z
         zjcY4Zn5b39bCKen8Qu2o+ew/fOlvlFdSTk6bSfc2LfUuyR+d+w1yz41W7BoUK4qbVUe
         65yJyD7RGngPMYg1X56ezCPNEE6S7NfwvchWqTyoZOFp7Ea55r0eKNyTkFsUx8Qw6mnd
         TQyDVz+H6fHn6WdI8Vb9l066wXzJS/WALOlgtPfNXhvo6uBwfHg61KC3mEnKqEPwPjIA
         dFvVlows/jxgjiAIvUhT77Z8EVE3eLHB1cvTm686aEA7/fcx/EeU4viiS6NlePu9wvup
         a2Ew==
X-Gm-Message-State: AOAM533gNS30bhSsrjy7ADPv/XGU3swkHALzsMHcd/2L50T/WlQeXer9
        MGlon1Bom8IZrKrMkJz3DRRbRywBbLsUbg==
X-Google-Smtp-Source: ABdhPJw82l+EPoFHJBvUIcD4km/M8KqnhX7LBn0DJZDUdtO1y1iI7Rcdq9lbCwCwplS2uxcVtDkrFA==
X-Received: by 2002:a37:af81:0:b0:502:7ea:34e7 with SMTP id y123-20020a37af81000000b0050207ea34e7mr14458043qke.737.1647262287238;
        Mon, 14 Mar 2022 05:51:27 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id n8-20020ac85a08000000b002e06aa02021sm11258188qta.49.2022.03.14.05.51.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Mar 2022 05:51:27 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-2dc348dab52so161674117b3.6;
        Mon, 14 Mar 2022 05:51:26 -0700 (PDT)
X-Received: by 2002:a81:c703:0:b0:2d0:cc6b:3092 with SMTP id
 m3-20020a81c703000000b002d0cc6b3092mr18267309ywi.449.1647262286483; Mon, 14
 Mar 2022 05:51:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220312084205.31462-1-biju.das.jz@bp.renesas.com>
 <20220312084205.31462-2-biju.das.jz@bp.renesas.com> <Yi39fGVE0f9LgN/1@pendragon.ideasonboard.com>
 <OS0PR01MB592293BC9493DC1DAD1DA0C0860F9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdVYYMJvbnR3r-KGtU=3hiKjsiaXH4xyUzhv7vY5Y6MB6A@mail.gmail.com> <Yi8xcuxSff0UFRaf@pendragon.ideasonboard.com>
In-Reply-To: <Yi8xcuxSff0UFRaf@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 14 Mar 2022 13:51:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVjXA_hN53=-B4+4ERbjYz-s=on6NWWXYFXjD0xnPNpoQ@mail.gmail.com>
Message-ID: <CAMuHMdVjXA_hN53=-B4+4ERbjYz-s=on6NWWXYFXjD0xnPNpoQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] media: dt-bindings: media: renesas,vsp1: Document
 RZ/{G2L,V2L} VSPD bindings
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Mon, Mar 14, 2022 at 1:13 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Mar 14, 2022 at 10:01:14AM +0100, Geert Uytterhoeven wrote:
> > On Mon, Mar 14, 2022 at 9:44 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > > On Sat, Mar 12, 2022 at 08:42:03AM +0000, Biju Das wrote:
> > > > > Document VSPD found in RZ/G2L and RZ/V2L family SoC's. VSPD block is
> > > > > similar to VSP2-D found on R-Car SoC's, but it does not have a version
> > > > > register and it has 3 clocks compared to 1 clock on vsp1 and vsp2.
> > > > >
> > > > > This patch introduces a new compatible 'renesas,rzg2l-vsp2' to handle
> > > > > these differences.
> > > > >
> > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > > > > index 990e9c1dbc43..2696a4582251 100644
> > > > > --- a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> > > > > +++ b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> >
> > > > > +        clock-names:
> > > > > +          items:
> > > > > +            - const: du.0
> > > >
> > > > Similarly, I'm not sure this is a good name from the point of view of the
> > > > VSP.
> > >
> > > OK, will use the name 'aclk', which is Main clock for this module which is
> > > shared with LCDC. 'du.0' is not valid any more here as we are using different
> > > CRTC implementation for RZ/G2LC.
> > >
> > > > > +            - const: pclk
> > > > > +            - const: vclk
> > > >
> > > > I couldn't find those names in the documentation, where do they come from
> > >
> > > HW manual (page 312) mentions about LCDC_CLK_A, LCDC_CLK_P & LCDC_CLK_D.
> > >
> > > Detailed description is mentioned in Clock list document. Please see below.
> > >
> > >         LCDC_CLK_A      M0φ     PLL3    200     200             LCDC  Main clock
> > >         LCDC_CLK_P      ZTφ     PLL3    100     100             LCDC Register Access Clock
> > >         LCDC_CLK_D      M3φ     SEL_PLL5_4      148.5~5.803     LCDC Video Clock
> > >
> > > > ? Could you maybe share a DT integration example ?
> > >
> > > Please see below,
> >
> > >
> > > +               du: display@0x10890000 {
> > > +                       compatible = "renesas,du-r9a07g044l";
> > > +                       reg = <0 0x10890000 0 0x10000>;
> > > +                       interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
> > > +                       clocks = <&cpg CPG_MOD R9A07G044_LCDC_CLK_A>,
> > > +                                <&cpg CPG_MOD R9A07G044_LCDC_CLK_P>,
> > > +                                <&cpg CPG_MOD R9A07G044_LCDC_CLK_D>;
> > > +                       clock-names = "du.0", "pclk", "vclk";
> > > +                       power-domains = <&cpg>;
> > > +                       resets = <&cpg R9A07G044_LCDC_RESET_N>;
> > > +                       reset-names = "du.0";
> > > +                       renesas,vsps = <&vspd0 0>;
> >
> > Given the DU driver is no longer shared, perhaps all occurrencies of "du"
> > should be replaced by "lcdc"?
>
> The LCDC is the combination of the FCPVD, the VSPD and the DU. The first
> two are similar to the eponymous IP cores used on R-Car Gen3, while the
> DU is a different beast, despite sharing the same name.

OK, that's a good reason to keep the DU name.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
