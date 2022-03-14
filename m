Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 579114D7E0C
	for <lists+linux-media@lfdr.de>; Mon, 14 Mar 2022 10:01:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237783AbiCNJCn convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 14 Mar 2022 05:02:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237787AbiCNJCh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Mar 2022 05:02:37 -0400
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B4BB427F2;
        Mon, 14 Mar 2022 02:01:28 -0700 (PDT)
Received: by mail-qk1-f171.google.com with SMTP id k125so6758863qkf.0;
        Mon, 14 Mar 2022 02:01:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CUartTm5RYn3U2x9JASBVeXmeh/74nQQTrIajK/MG4k=;
        b=fg8atp4jXKx0jXgWB+abpkI5PR37wjqW4igC35oo/YMPFG4heVUaufG2ZdsD0WtQnj
         F6dH24NHUtUv6Z8/TEnaPhvTDke030oneUp3vLEtzIdX1o6XePPvki1ytehyD4v0wFu3
         2srTec0BDGaEYMbxaagL625JDulob/cP/csYfbH20hqbdxlQKV6MNW2S9Gt1zf3H6YXf
         hySMFQ1JXERZEgd9loHSP9Tcn2mAJou67kLOVTOYvVI3C+a2mvX7sebCnNF6V2tgfJ83
         ZGo+miJXn5qvxiL7FIUUwD5YoBn7Ys0XdNrOduPysfOQpZc0gDCMIhSLDDePQlG2LwAu
         N7Ag==
X-Gm-Message-State: AOAM53181no9QyS/cgOMCXXPym4gNqEFn0d3X0A0SGGzJMZWATmL14st
        GWCD5fV/xDyppebHjOahCUqrVGLp0zAeAQ==
X-Google-Smtp-Source: ABdhPJzYwL/t42JChEtzNVYhxG9bmIRqDQ/FAFPG0An/4yEAfqafWTHguWPvJufuIGYo2wmrXDo7Dw==
X-Received: by 2002:a05:620a:440d:b0:67b:489a:616f with SMTP id v13-20020a05620a440d00b0067b489a616fmr13533850qkp.639.1647248486879;
        Mon, 14 Mar 2022 02:01:26 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id u21-20020ae9c015000000b0067d4b2e1050sm6655573qkk.55.2022.03.14.02.01.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Mar 2022 02:01:26 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-2dbd8777564so155194077b3.0;
        Mon, 14 Mar 2022 02:01:26 -0700 (PDT)
X-Received: by 2002:a81:6dd1:0:b0:2dc:56d1:1dae with SMTP id
 i200-20020a816dd1000000b002dc56d11daemr17346854ywc.479.1647248486068; Mon, 14
 Mar 2022 02:01:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220312084205.31462-1-biju.das.jz@bp.renesas.com>
 <20220312084205.31462-2-biju.das.jz@bp.renesas.com> <Yi39fGVE0f9LgN/1@pendragon.ideasonboard.com>
 <OS0PR01MB592293BC9493DC1DAD1DA0C0860F9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB592293BC9493DC1DAD1DA0C0860F9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 14 Mar 2022 10:01:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVYYMJvbnR3r-KGtU=3hiKjsiaXH4xyUzhv7vY5Y6MB6A@mail.gmail.com>
Message-ID: <CAMuHMdVYYMJvbnR3r-KGtU=3hiKjsiaXH4xyUzhv7vY5Y6MB6A@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] media: dt-bindings: media: renesas,vsp1: Document
 RZ/{G2L,V2L} VSPD bindings
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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

Hi Biju,

On Mon, Mar 14, 2022 at 9:44 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH v5 1/3] media: dt-bindings: media: renesas,vsp1:
> > Document RZ/{G2L,V2L} VSPD bindings
> > On Sat, Mar 12, 2022 at 08:42:03AM +0000, Biju Das wrote:
> > > Document VSPD found in RZ/G2L and RZ/V2L family SoC's. VSPD block is
> > > similar to VSP2-D found on R-Car SoC's, but it does not have a version
> > > register and it has 3 clocks compared to 1 clock on vsp1 and vsp2.
> > >
> > > This patch introduces a new compatible 'renesas,rzg2l-vsp2' to handle
> > > these differences.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> > > index 990e9c1dbc43..2696a4582251 100644
> > > --- a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> > > +++ b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml

> > > +        clock-names:
> > > +          items:
> > > +            - const: du.0
> >
> > Similarly, I'm not sure this is a good name from the point of view of the
> > VSP.
>
> OK, will use the name 'aclk', which is Main clock for this module which is
> shared with LCDC. 'du.0' is not valid any more here as we are using different
> CRTC implementation for RZ/G2LC.
>
> >
> > > +            - const: pclk
> > > +            - const: vclk
> >
> > I couldn't find those names in the documentation, where do they come from
>
> HW manual (page 312) mentions about LCDC_CLK_A, LCDC_CLK_P & LCDC_CLK_D.
>
> Detailed description is mentioned in Clock list document. Please see below.
>
>         LCDC_CLK_A      M0φ     PLL3    200     200             LCDC  Main clock
>         LCDC_CLK_P      ZTφ     PLL3    100     100             LCDC Register Access Clock
>         LCDC_CLK_D      M3φ     SEL_PLL5_4      148.5~5.803     LCDC Video Clock
>
> > ? Could you maybe share a DT integration example ?
>
> Please see below,

>
> +               du: display@0x10890000 {
> +                       compatible = "renesas,du-r9a07g044l";
> +                       reg = <0 0x10890000 0 0x10000>;
> +                       interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD R9A07G044_LCDC_CLK_A>,
> +                                <&cpg CPG_MOD R9A07G044_LCDC_CLK_P>,
> +                                <&cpg CPG_MOD R9A07G044_LCDC_CLK_D>;
> +                       clock-names = "du.0", "pclk", "vclk";
> +                       power-domains = <&cpg>;
> +                       resets = <&cpg R9A07G044_LCDC_RESET_N>;
> +                       reset-names = "du.0";
> +                       renesas,vsps = <&vspd0 0>;

Given the DU driver is no longer shared, perhaps all occurrencies of "du"
should be replaced by "lcdc"?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
