Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAFAD4D467F
	for <lists+linux-media@lfdr.de>; Thu, 10 Mar 2022 13:10:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241857AbiCJML1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Mar 2022 07:11:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236942AbiCJML1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Mar 2022 07:11:27 -0500
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12FF71480C0;
        Thu, 10 Mar 2022 04:10:26 -0800 (PST)
Received: by mail-qv1-f45.google.com with SMTP id x3so4316393qvd.8;
        Thu, 10 Mar 2022 04:10:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K0j5f+HYrjCTV0jzOeOydTM6Pe5LBji1gm3c+tuqjgY=;
        b=oKomq/9OSpsN5ys0gQK+/Mwt/fGycPfMbtj/kewA6PAFFSr0ypVjOZghdnsWwUhCGJ
         2pcU1NHLliKrkRTBrwHAq+FbGHqfzSkFUcnWq6OJ7RreIK203hXP+49LojpNiyGHZoBi
         246WJ127Ndd4us+U+5pqqMwtTOW4qJ96YNefkP1S4YK5881oPPyXeii27HLRJGK3ZjZm
         zVuLF88rAy8pKDJPtwICx0O90MIUWlIwHFC/mDJ+H3rTwLLlxKy3a6SpwyoF0B08UJXl
         4QtFt4lZxIpiNSUojztHxHt/ibO0GeQDwnw3uqC/b+AcL6vkOLD+DSAqrcTxjBEXsqm8
         J7cA==
X-Gm-Message-State: AOAM530u3d+d/2DJj5R7LWxDMLdIVXiztmiQ5NIh0++h+boUqeWzXM7m
        lmUgjDIOC5uyiYu/nGlC1+yDn88dpC/kFg==
X-Google-Smtp-Source: ABdhPJwU58ts8TG5udbpR4NAjoAskvhPI32DRaavl4P/Ig3gTP4bnk809SJao+5o6r9nlQbJdKc+VA==
X-Received: by 2002:a0c:d692:0:b0:432:3605:6192 with SMTP id k18-20020a0cd692000000b0043236056192mr3306324qvi.90.1646914224452;
        Thu, 10 Mar 2022 04:10:24 -0800 (PST)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id x26-20020ae9f81a000000b005f1916fc61fsm2159953qkh.106.2022.03.10.04.10.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Mar 2022 04:10:23 -0800 (PST)
Received: by mail-yb1-f182.google.com with SMTP id u61so10393002ybi.11;
        Thu, 10 Mar 2022 04:10:23 -0800 (PST)
X-Received: by 2002:a25:c54a:0:b0:628:9d7f:866a with SMTP id
 v71-20020a25c54a000000b006289d7f866amr3597669ybe.546.1646914222934; Thu, 10
 Mar 2022 04:10:22 -0800 (PST)
MIME-Version: 1.0
References: <20220309194521.7028-1-biju.das.jz@bp.renesas.com>
 <20220309194521.7028-4-biju.das.jz@bp.renesas.com> <164690820109.123014.3107899517422264094@Monstersaurus>
 <OS0PR01MB5922FA79BF95266260364627860B9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922FA79BF95266260364627860B9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Mar 2022 13:10:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUSBY6pE81OuoE9LX-Ekn+kFHDK=YT4=1w_+yfx-OmJ2A@mail.gmail.com>
Message-ID: <CAMuHMdUSBY6pE81OuoE9LX-Ekn+kFHDK=YT4=1w_+yfx-OmJ2A@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: vsp1: Add support for RZ/G2L VSPD
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, Mar 10, 2022 at 12:11 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH 3/3] media: vsp1: Add support for RZ/G2L VSPD
> > Quoting Biju Das (2022-03-09 19:45:21)
> > > The RZ/G2L VSPD provides a single VSPD instance. It has the following
> > > sub modules MAU, CTU, RPF, DPR, LUT, BRS, WPF and LIF.
> > >
> > > The VSPD block on RZ/G2L does not have a version register, so added a
> > > new compatible string "renesas,vsp2-rzg2l" with a data pointer
> > > containing

> > >  drivers/media/platform/vsp1/vsp1_drv.c  | 32
> > > +++++++++++++++++++------  drivers/media/platform/vsp1/vsp1_lif.c  |
> > > 7 ++++--  drivers/media/platform/vsp1/vsp1_regs.h |  1 +
> > >  3 files changed, 31 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/vsp1/vsp1_drv.c
> > > b/drivers/media/platform/vsp1/vsp1_drv.c
> > > index 77da6a6732d8..40c6d9290681 100644
> > > --- a/drivers/media/platform/vsp1/vsp1_drv.c
> > > +++ b/drivers/media/platform/vsp1/vsp1_drv.c

> > >         if (IS_ERR(vsp1->rstc))
> > >                 return dev_err_probe(&pdev->dev, PTR_ERR(vsp1->rstc),
> > >                                      "failed to get reset ctrl\n"); @@
> > > -874,13 +889,15 @@ static int vsp1_probe(struct platform_device *pdev)
> > >         if (ret < 0)
> > >                 goto done;
> > >
> > > -       vsp1->version = vsp1_read(vsp1, VI6_IP_VERSION);
> > > +       if (!vsp1->info) {
> > > +               vsp1->version = vsp1_read(vsp1, VI6_IP_VERSION);
> > >
> > > -       for (i = 0; i < ARRAY_SIZE(vsp1_device_infos); ++i) {
> > > -               if ((vsp1->version & VI6_IP_VERSION_MODEL_MASK) ==
> > > -                   vsp1_device_infos[i].version) {
> > > -                       vsp1->info = &vsp1_device_infos[i];
> > > -                       break;
> > > +               for (i = 0; i < ARRAY_SIZE(vsp1_device_infos); ++i) {
> > > +                       if ((vsp1->version & VI6_IP_VERSION_MODEL_MASK)
> > ==
> > > +                           vsp1_device_infos[i].version) {
> > > +                               vsp1->info = &vsp1_device_infos[i];
> > > +                               break;
> > > +                       }
> >
> >
> > This is looking like it gets a bit awkward. Two methods for identifying
> > the version and info structure is going to be a pain.
>
> On RFC, Laurent suggested to use info for RZ/G2L. Do you have better
> Suggestion? Please let me know.

I'm afraid we have no other option.  But the flow could be made
prettier by moving the table lookup into its own function, and using
something like below in the probe function:

    vsp1->info = of_device_get_match_data(&pdev->dev);
    if (!vsp1->info)
            vsp1->info = vsp1_lookup(vsp1_read(vsp1, VI6_IP_VERSION));
    if (!vsp1->info)
            return -ENODEV.

> > > @@ -943,6 +960,7 @@ static int vsp1_remove(struct platform_device
> > > *pdev)  static const struct of_device_id vsp1_of_match[] = {
> > >         { .compatible = "renesas,vsp1" },
> > >         { .compatible = "renesas,vsp2" },
> > > +       { .compatible = "renesas,vsp2-rzg2l", .data =
> > > + &vsp1_device_infos[14] },
> >
> > I don't think you should reference a specific index of the infos table.
> > What happens if someone adds an entry higher in the table which pushes the
> > indexes down ?
>
> I can think of adding macros in info structure and use that macro
> here to avoid such condition, if it all needed.
>
> Do you have any other better alternative to handle this scenario?
> Please let me know.

I would use a pointer to an independent struct vsp1_device_info, not
part of vsp1_device_infos[], so it can never be matched by accident
(see below).

> > > --- a/drivers/media/platform/vsp1/vsp1_regs.h
> > > +++ b/drivers/media/platform/vsp1/vsp1_regs.h
> > > @@ -766,6 +766,7 @@
> > >  #define VI6_IP_VERSION_MODEL_VSPD_V3   (0x18 << 8)
> > >  #define VI6_IP_VERSION_MODEL_VSPDL_GEN3        (0x19 << 8)
> > >  #define VI6_IP_VERSION_MODEL_VSPBS_GEN3        (0x1a << 8)
> > > +#define VI6_IP_VERSION_MODEL_VSPD_RZG2L        (0x1b << 8)
> >
> > I don't like the idea of using a value here that could really be used on a
> > real device somewhere.
> >
> > The hole in the sequence is only there because we havent' seen a datasheet
> > with 0x1b defined.
> >
> > If there truely is no version register on this hardware, we're going to
> > have to make sure this version value can't conflict.
>
> Currently, I don't see any device with 0x1b. If in future if we found a device
> With 0x1b, This can be moved to a higher value for eg:- 0xfe.
>
> Please let me know your thoughts.

I agree with Kieran, and strongly recommend against using a number
that might exist for real on current or future SoCs.  Unfortunately
there's only 8 bits available, precluding the use of e.g. (0xbeef01
<< 8). But starting from (0xff << 8), and counting down for future
entries, if needed, sounds like a good compromise.

And of course there should be a comment next to the definition,
to make it clear this is a made-up number.

P.S. If possible, please communicate to the hardware engineers it
     was IMHO a bad decision to get rid of the version register,
     which should be reconsidered for future SoCs.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
