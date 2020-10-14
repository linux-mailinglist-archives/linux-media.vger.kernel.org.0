Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E66C28E284
	for <lists+linux-media@lfdr.de>; Wed, 14 Oct 2020 16:52:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730517AbgJNOwE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Oct 2020 10:52:04 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:39798 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729276AbgJNOwE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Oct 2020 10:52:04 -0400
Received: by mail-ot1-f65.google.com with SMTP id f10so3677954otb.6;
        Wed, 14 Oct 2020 07:52:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H7EhDwxST9+VQIVrPmCGqIr98KMTxZz8OLqw4mC4ksY=;
        b=px1eY9ojW3F31Dvh1e4Y/SL64G0QBdg9EQxO8e7bFnJk9KmhEXTK+iG3GF3e3ZBX/x
         oI2LyNjySCrdW8787dVw8RM3ZsVWYIVzv920knFyUcTQwluXXFvuMxXo2hD1TlTs7Hc/
         mknYmJU/PatjhfXPD1vk9M+r3+0n9CyVmda9nNLvHNY4jLrxMTHq3dlw+W9WbcIb1y9L
         MOJrn5Y8D6rmb537Wline/kABnY3X7l5SA7ROKRNRFNyT2oBweBH+FyXnAH61TdsKy+F
         bDXB1Eo4CEdvmtwFffsYLvjlm5Z8eH6vEwXcXC6RcDNR8JCe6KRXLoWOcW4PYjxpk4R6
         0IGA==
X-Gm-Message-State: AOAM532cDiHyS0XY4GyiP2RVePaRVexHp5/NXRBNXTG89/Ad0sAOhXo6
        WrXFuqDK1P02bZZM1Wl/OQx6vp0GiwA5ukxJWlM=
X-Google-Smtp-Source: ABdhPJytQ8/100pK0VWl0u3XfP1/UQls0YNqRsQPR+8SOSzC59YaAxwlBA5Fic/E/JzwYaOVzHArsBb9PC3ujKxOG08=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr3728773otc.145.1602687122960;
 Wed, 14 Oct 2020 07:52:02 -0700 (PDT)
MIME-Version: 1.0
References: <20201013150150.14801-1-fabrizio.castro.jz@renesas.com>
 <20201013150150.14801-5-fabrizio.castro.jz@renesas.com> <CAMuHMdUxCiwjsFRYpVND-FLajaceUf+jWK0ZBR5Rp5xJ+MPDgA@mail.gmail.com>
 <OSAPR01MB274089EA87D5280E83E81C7DC2050@OSAPR01MB2740.jpnprd01.prod.outlook.com>
In-Reply-To: <OSAPR01MB274089EA87D5280E83E81C7DC2050@OSAPR01MB2740.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 14 Oct 2020 16:51:51 +0200
Message-ID: <CAMuHMdUPb=Sy1R1pOXCAbDcCiMgWa27tVMvvTWn2rnotanM8cw@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] media: dt-bindings: media: renesas,drif: Add
 r8a77965 support
To:     Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ramesh Shanmugasundaram <rashanmu@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabrizio,

On Wed, Oct 14, 2020 at 4:35 PM Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Tue, Oct 13, 2020 at 5:02 PM Fabrizio Castro
> > <fabrizio.castro.jz@renesas.com> wrote:
> > > The r8a77965 (a.k.a. R-Car M3-N) device tree schema is
> > > compatible with the already documented R-Car Gen3 devices.
> > >
> > > Document r8a77965 support within renesas,drif.yaml.
> > >
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> >
> > Thanks for your patch!
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > > --- a/Documentation/devicetree/bindings/media/renesas,drif.yaml
> > > +++ b/Documentation/devicetree/bindings/media/renesas,drif.yaml
> > > @@ -53,6 +53,7 @@ properties:
> > >        - enum:
> > >          - renesas,r8a7795-drif        # R-Car H3
> > >          - renesas,r8a7796-drif        # R-Car M3-W
> > > +        - renesas,r8a77965-drif       # R-Car M3-N
> > >          - renesas,r8a77990-drif       # R-Car E3
> > >        - const: renesas,rcar-gen3-drif # Generic R-Car Gen3 compatible device
> >
> > I guess you're aware M3-N (and E3) have an extra register?
> > Probably the driver just relies on its initial value, but it never hurts to be
> > explicit and initialize it properly.
>
> Yes, I am aware of the extra register, and that's reflected in the DRIF nodes
> definition within the SoC specific device trees.
> I'll tackle initialization and configuration of the extra register at some point,
> do you think we could use the default value for now?

Yes, that's fine for me, if it works with the current driver.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
