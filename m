Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6054A447EC8
	for <lists+linux-media@lfdr.de>; Mon,  8 Nov 2021 12:21:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239187AbhKHLY0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Nov 2021 06:24:26 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:43649 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239195AbhKHLYZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Nov 2021 06:24:25 -0500
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 68FAB40006;
        Mon,  8 Nov 2021 11:21:38 +0000 (UTC)
Date:   Mon, 8 Nov 2021 12:22:31 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] media: max9271: Ignore busy loop read errors
Message-ID: <20211108112231.ps2kf4ie6o6bxfdh@uno.localdomain>
References: <20211104110924.248444-1-jacopo+renesas@jmondi.org>
 <20211104110924.248444-2-jacopo+renesas@jmondi.org>
 <CAMuHMdVF2fU4UTZTe_xjJUg7khUwhT_1kHQq49rbzZJygbpbow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdVF2fU4UTZTe_xjJUg7khUwhT_1kHQq49rbzZJygbpbow@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Geert

On Mon, Nov 08, 2021 at 11:45:58AM +0100, Geert Uytterhoeven wrote:
> Hi Jacopo,
>
> On Thu, Nov 4, 2021 at 12:10 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> > Valid pixel clock detection is performed by spinning on a register read
> > which if repeated too frequently might fail. As the error is not fatal
> > ignore it instead of bailing out to continue spinning until the timeout
> > completion.
> >
> > Also relax the time between bus transactions and slightly increase the
> > wait interval to mitigate the failure risk.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >
> > v1->v2:
> > - Do not continue but jump to a label to respect the sleep timout after a
> >   failed read
>
> Thanks for the update!
>
> > --- a/drivers/media/i2c/max9271.c
> > +++ b/drivers/media/i2c/max9271.c
> > @@ -55,7 +55,7 @@ static int max9271_write(struct max9271_device *dev, u8 reg, u8 val)
> >  /*
> >   * max9271_pclk_detect() - Detect valid pixel clock from image sensor
> >   *
> > - * Wait up to 10ms for a valid pixel clock.
> > + * Wait up to 15ms for a valid pixel clock.
> >   *
> >   * Returns 0 for success, < 0 for pixel clock not properly detected
> >   */
> > @@ -64,15 +64,16 @@ static int max9271_pclk_detect(struct max9271_device *dev)
> >         unsigned int i;
> >         int ret;
> >
> > -       for (i = 0; i < 100; i++) {
> > +       for (i = 0; i < 10; i++) {
> >                 ret = max9271_read(dev, 0x15);
> >                 if (ret < 0)
> > -                       return ret;
> > +                       goto skip;
>
> Edgar Dijkstra: Go To Statement Considered Harmful?
>

Dijkstra would be very unpleased reading the kernel error path
handling implementations. But I got your point, we're not in a cleanup
path here =)

> >
> >                 if (ret & MAX9271_PCLKDET)
>
> "if (ret > 0 && (ret & MAX9271_PCLKDET))"?
>

Much better, thanks. I'll resend!

Thanks
   j

> >                         return 0;
> >
> > -               usleep_range(50, 100);
> > +skip:
> > +               usleep_range(1000, 1500);
> >         }
> >
> >         dev_err(&dev->client->dev, "Unable to detect valid pixel clock\n");
>
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
