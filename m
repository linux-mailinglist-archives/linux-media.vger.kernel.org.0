Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16C6A2758C7
	for <lists+linux-media@lfdr.de>; Wed, 23 Sep 2020 15:33:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbgIWNdi convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 23 Sep 2020 09:33:38 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:32907 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgIWNdi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Sep 2020 09:33:38 -0400
Received: by mail-oi1-f196.google.com with SMTP id m7so25057616oie.0;
        Wed, 23 Sep 2020 06:33:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jLvhxV8WN8tYwAsKLuQ5qoca0AxXLmY9ncmfD688UVE=;
        b=QsOT76/UlfNd6ehu92bgbyqo/n547aOOepxdTR6Z06939gAY+FLNAb3R5FEcUdN+je
         saiCP8jJHSe5HtdUXiGFzquR0tTo4+ulzI9x05+ZZIeqF6iUEO8wPlh4yXWRyFxmmQD8
         dOiQDvX5AoBEH1vSFS4nOdBP/u2wsg67E/f1UDSSBuKmdORlujLLRZfTxs7r3ADED0r5
         +48fM1uQW7lxiuLwSlqW4Q1J7HRN62vgXxArGJ40jYRx+kKyA5IHfAP1nbfoRNctnPvY
         9IBXuXpiwVTxJhVGpK9Shi+c4WUty9BljOnWODVGKfCKBjJigzh89rV8VFX+qTEKWhRW
         w1WA==
X-Gm-Message-State: AOAM533VSOa+nuMR2z4KeJY89VrrBSUr+PIZ41exm5Fy0zFmhk6MFSWG
        7B8cDhpqJDDbhBfC9afKjx2yBwB0T6efa4XpAsxI30Xthj8=
X-Google-Smtp-Source: ABdhPJxf5OeqXwmXtbr0WhpaUjkbIzjraQ7D8svwIUi3MJOGi3XetHfwKcml4BiolSeLliTWBCZ7aTJUY0J3J6a7hUw=
X-Received: by 2002:aca:4441:: with SMTP id r62mr5414688oia.153.1600868017348;
 Wed, 23 Sep 2020 06:33:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200916105949.24858-1-fabrizio.castro.jz@renesas.com>
 <20200916105949.24858-3-fabrizio.castro.jz@renesas.com> <CAMuHMdU-DSqUmch3OR1pSbDkVNGDKx_YGT_432uYpoPDh_nS1Q@mail.gmail.com>
 <OSAPR01MB2740DB23267470CF995978E5C2380@OSAPR01MB2740.jpnprd01.prod.outlook.com>
In-Reply-To: <OSAPR01MB2740DB23267470CF995978E5C2380@OSAPR01MB2740.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 23 Sep 2020 15:33:26 +0200
Message-ID: <CAMuHMdXbhqYPrFDa4rY4xM_wQcVRCr3Lh=EQHbS+jAQvLADvhg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] media: dt-bindings: media: renesas,drif: Convert
 to json-schema
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
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabrizio,

On Wed, Sep 23, 2020 at 1:55 PM Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Wed, Sep 16, 2020 at 1:00 PM Fabrizio Castro
> > <fabrizio.castro.jz@renesas.com> wrote:
> > > Convert the Renesas DRIF bindings to DT schema and update
> > > MAINTAINERS accordingly.
> > >
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

> > > +if:
> > > +  required:
> > > +    - renesas,primary-bond
> > > +then:
> > > +  required:
> > > +    - pinctrl-0
> > > +    - pinctrl-names
> > > +    - port
> >
> > The last 3 properties must not be present for a secondary interface,
> > right?
>
> If you have both channels enabled, then one of the two has to define properties:
> * renesas,primary-bond, pinctrl-0, pinctrl-names, and port.
>
> If only one channel is enabled, then the primary bond concept loses its value,
> whether renesas,primary-bond is specified or not doesn’t matter anymore, but the
> enabled node has to specify the pinctrl related properties and the port.
>
> > To express that, I think you need to add:
> >
> >     else:
> >       properties:
> >         - pinctrl-0: false
> >         - pinctrl-names: false
> >         - port: false
>
> If I went with this, we would not be able to allow those properties to be specified in the
> only enabled node for single channels configurations.
>
> Is there a better way to approach this?
>
> I'll wait for this point to get sorted before sending v3 out.

The old binding said:

    -Required properties of an internal channel when:
    -       - It is the only enabled channel of the bond (or)
    -       - If it acts as primary among enabled bonds

    -- renesas,primary-bond: empty property indicating the channel
acts as primary
    -                       among the bonded channels.

so renesas,primary-bond is required for the only enabled node for
single channels configurations anyway?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
