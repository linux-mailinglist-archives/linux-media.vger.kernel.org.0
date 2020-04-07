Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8753F1A088B
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 09:43:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727173AbgDGHno (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 03:43:44 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:35975 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726591AbgDGHno (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Apr 2020 03:43:44 -0400
Received: by mail-ot1-f66.google.com with SMTP id l23so2155535otf.3;
        Tue, 07 Apr 2020 00:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oE1P8brteBgNB/YCnZpMaazxZnoFoVLDlG5zmB4pDgo=;
        b=kcPLvyqhYQ50v8YhtUX8FFqSjQYiVcTka4/bJnGJOUbAyXhCnRpf/KmSHwtYhWoRgU
         WZ+byt8MVjKVf7dos+9PxzI2/x0kR/QuXmjP7a4DeiaKxZh+SA3A2oEoM/klr7CSHaBc
         2wS/XiJb4kqHOInxoY1czNpphTpZH5YxUg7NU778JzP7ht0g9nxjyMjGg+7a19EQCsE2
         zaiFKLpKMDviT5T67ApeAk76ESHZzP4yHILTJu+AmlWh4g4x/AhfAb1jd6YbJeKdKlp1
         NX+z0FD6vQrbPCwHWenptEq6pNTXGQVgzO/YBrJdfhfsfGUr7IC1vXduDxE9zycUBS6Z
         fWag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oE1P8brteBgNB/YCnZpMaazxZnoFoVLDlG5zmB4pDgo=;
        b=Amy5FZiqr8Rn2vVDilN75pHpNUSZMnY9t6NXQBwUQWN5BBjQS8/ZjFB+b7+4CtFxRm
         BxcKhpM5jj6gXI2wr8EPE+ZxxNmn1I7O/XfdcFcXGk6SP7WzVT8S4/hMsfRC24PF+Iaz
         l0JXPxXoQSV/CNwkzjmEesEt8mIHTG5J0M4VkmENASh3cDW8Mm+rzItvQ0GT0N8Bb31I
         ow+hvBDY4LNN0b8WKz4MkDDHNWkya2R6n1T6Vp68EF2ziCil8F8PoMRBV20P1TAEJJrO
         kqNNMaAjHpnLYNWwxeSCHpTTZf5JxiK/UEO489RY/003Wiv7X67MmXvTfjqg5SUYEFLQ
         LAeg==
X-Gm-Message-State: AGi0PuboMf05Dea+c4cTza4GsQf7OCCglM4TrO9yNHgd2Q9Pzy64v3lY
        fiCu7v4SRjMFGqOCBE23P0L3x3Xo7T1+NH/fwqva7FeP
X-Google-Smtp-Source: APiQypI2DyIIL0fcNOyS2Ap/cmRjpFvWT9aOUrsOGDAoZC8sUAs4Iyf5Mi2KOAKUvMSzfPs330HGeDMjEIH/ji0exyw=
X-Received: by 2002:a9d:220e:: with SMTP id o14mr510743ota.88.1586245423956;
 Tue, 07 Apr 2020 00:43:43 -0700 (PDT)
MIME-Version: 1.0
References: <1586191361-16598-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1586191361-16598-4-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdX4sGzVWPFYLBiySastZSR2afqMHxmaEh-WhRMAcXFeMQ@mail.gmail.com>
In-Reply-To: <CAMuHMdX4sGzVWPFYLBiySastZSR2afqMHxmaEh-WhRMAcXFeMQ@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Tue, 7 Apr 2020 08:43:18 +0100
Message-ID: <CA+V-a8uKf-poWO8XGKasnOESxOTYRGQs2dBLArMzq8+xT+1kOA@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] media: i2c: ov5645: Turn probe error into warning
 for xvclk frequency mismatch
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Geert,

Thank you for the review.

On Tue, Apr 7, 2020 at 8:19 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, Apr 6, 2020 at 6:43 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > PLL's on platforms might not be so accurate enough to generate the
> > required clock frequency, so instead of erroring out on xvlck frequency
>
> xvclk? (but see below)
>
> > mismatch just warn the user and continue ahead in probe.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Like for 2/5, what about the xvclk naming?
>
> > --- a/drivers/media/i2c/ov5645.c
> > +++ b/drivers/media/i2c/ov5645.c
> > @@ -1103,11 +1103,8 @@ static int ov5645_probe(struct i2c_client *client)
> >         }
> >         /* external clock must be 24MHz, allow 1% tolerance */
> >         xclk_freq = clk_get_rate(ov5645->xclk);
> > -       if (xclk_freq < 23760000 || xclk_freq > 24240000) {
> > -               dev_err(dev, "external clock frequency %u is not supported\n",
> > -                       xclk_freq);
> > -               return -EINVAL;
> > -       }
> > +       if (xclk_freq < 23760000 || xclk_freq > 24240000)
> > +               dev_warn(dev, "xvclk mismatched, modes are based on 24MHz\n");
>
> Calling it "xvclk" here will confuse the user, as the clock is named
> "xclk" in DT?
>
Agreed Ill replace it with xclk in the warning.

Cheers,
--Prabhakar

> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
