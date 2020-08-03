Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 024DC23ACD1
	for <lists+linux-media@lfdr.de>; Mon,  3 Aug 2020 21:15:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727780AbgHCTPX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Aug 2020 15:15:23 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:41794 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726007AbgHCTPX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Aug 2020 15:15:23 -0400
Received: by mail-ot1-f67.google.com with SMTP id a65so19576615otc.8;
        Mon, 03 Aug 2020 12:15:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N0eQNd7J5S8glmezMI2D/EdrAOA2yfNLqft/C7vxnm4=;
        b=pjlph09S2Ynkl4U2Pbnn5fDiNZ2H/lFAPoJEfDoy4WNnj02HkT6DnmXGvMONA3W9/t
         lP6EYr0JTQL90I7b+L+EXIkIyd7HaSTl0KVVJV2KM2ATAbFLEm63JoYEAYMtgPM7Dhj+
         wGqV/hwZ2jdYqrIQS6e2PvfwwGbc9zG/ZyN/34E5D2FYSZIQ3sBi/pFJ4doCJHWcaCMY
         JFxEg5KbSvTa9tgg7MzBljW02Pkf8wgDSkG95otJrIuu6Mr5c/p2Gw+usaqMRKIUxq7l
         26IyCvnn8wWoEq5246Qh0LaINf3JpwdNGEKORX/Xf2kg7rIj00AI7unLqhRHOrhUV5PN
         bWSg==
X-Gm-Message-State: AOAM533Ju96yxqmHFLgjO0K5anh8NSjm3xI/lgv7pzZotn1gqZh51khv
        UAnow/m597+TvXzqPJs0m09lfhpa/W+pQ3jPqH0=
X-Google-Smtp-Source: ABdhPJzTiQKgkA9oDHzv8uHxNqGnJwYb6cyIDEbnWP5rUKeo2rft9Wxkc+0jV9hoBBPbs2/sJiqNmJyFnqyU6vD1/dk=
X-Received: by 2002:a9d:7d8c:: with SMTP id j12mr14959491otn.250.1596482122569;
 Mon, 03 Aug 2020 12:15:22 -0700 (PDT)
MIME-Version: 1.0
References: <1596470573-15065-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200803180618.GA2297236@oden.dyn.berto.se>
In-Reply-To: <20200803180618.GA2297236@oden.dyn.berto.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 3 Aug 2020 21:15:11 +0200
Message-ID: <CAMuHMdWGRcFdyo4m4=jGKNt=GXOXddiD3cR2jZstiJN7LgBfZQ@mail.gmail.com>
Subject: Re: [PATCH v2] media: rcar-vin: Add support to select data pins for
 YCbCr422-8bit input
To:     Niklas <niklas.soderlund@ragnatech.se>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Mon, Aug 3, 2020 at 8:06 PM Niklas <niklas.soderlund@ragnatech.se> wrote:
> On 2020-08-03 17:02:53 +0100, Lad Prabhakar wrote:
> > Select the data pins for YCbCr422-8bit input format depending on
> > bus_width and data_shift passed as part of DT.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

> > --- a/drivers/media/platform/rcar-vin/rcar-core.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> > @@ -624,6 +624,11 @@ static int rvin_parallel_parse_v4l2(struct device *dev,
> >       vin->parallel = rvpe;
> >       vin->parallel->mbus_type = vep->bus_type;
> >
> > +     /* select VInDATA[15:8] pins for YCbCr422-8bit format */
> > +     if (vep->bus.parallel.bus_width == BUS_WIDTH_8 &&
> > +         vep->bus.parallel.data_shift == DATA_SHIFT_8)
> > +             vin->parallel->ycbcr_8b_g = true;
> > +
>
> I would store the bus_width and bus_shift values in the struct
> rvin_parallel_entity and evaluate them in place rater then create a flag
> for this specific use-case..
>
> Also according to the documentation is the check correct? Do we not wish
> to use the new mode when bus_width == 16 and bus_shift == 8. The check
> you have here seems to describe a 8 lane bus where 0 lanes are used.

The bus width used is 8.

Documentation/devicetree/bindings/media/video-interfaces.txt:

  - bus-width: number of data lines actively used, valid for the
parallel busses.
  - data-shift: on the parallel data busses, if bus-width is used to specify the
    number of data lines, data-shift can be used to specify which data lines are
    used, e.g. "bus-width=<8>; data-shift=<2>;" means, that lines 9:2 are used.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
