Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9CD9142AFC
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2020 13:36:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727022AbgATMgW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jan 2020 07:36:22 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:32844 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726589AbgATMgW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jan 2020 07:36:22 -0500
Received: by mail-oi1-f193.google.com with SMTP id q81so13536099oig.0;
        Mon, 20 Jan 2020 04:36:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h5LLv85IHqiD9bJHkYVPOat4WjpKlymYmibbM8KDiHI=;
        b=bfTWbcMSbQdMNztDIHcYD4spp9FUSu9zPcH9ic7I8birk0tW/1CasmhDHemrbrf/hV
         XGlWPPvj7xyX4G1rIMB5u3O2XNekZxuLNPphvctxffT3wUkgjCX3LzTBaJB93WYiH9Wq
         jdutMFEpSzeEp11EwI2FmrEzAtpSV6nY4a4qqZngFS6BuK+uWBi9njb13dYnQLddJBzt
         df/TCo2UP+SF1vMdm7eFLkBq4Iy8fl2LjL94qYQ64Zw9zbiG+xsXiRhysuGlaDzAZKAZ
         W6kGACSrunTYhT/qO7djJE1VsChBVkStNVuzRQnxoUdtGTaV9I0208Ms9zUzJOgCo7f0
         7Cdw==
X-Gm-Message-State: APjAAAVK9WlikJyH7gCLrZ9vLVk39kQ+YTLOK0Oiiob8l+NNoRobJpfF
        BDEirwaeVaR27h/Jk18hPnY59bIH+aFlscNlE9X/NTyJ
X-Google-Smtp-Source: APXvYqw6I8qtOuyHTu5+mS/goZMEOclkdUxdtam6G+pmDKAAIhr9OjUJ+zVr5mfvRHGw5EzeX0ZkHm40aSRoXimn9Bg=
X-Received: by 2002:a05:6808:292:: with SMTP id z18mr12124841oic.131.1579523781652;
 Mon, 20 Jan 2020 04:36:21 -0800 (PST)
MIME-Version: 1.0
References: <20191217104025.23318-1-peter.ujfalusi@ti.com> <CAMuHMdUPhabZrXJ3UqSVTdy2aWf6VG27q287MizKJ5q5tyRnwA@mail.gmail.com>
 <c7eedf72-aa00-8ffe-8c8f-4946a4f54fa7@ti.com>
In-Reply-To: <c7eedf72-aa00-8ffe-8c8f-4946a4f54fa7@ti.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 20 Jan 2020 13:36:10 +0100
Message-ID: <CAMuHMdXU9_WY54iU5DY6UHZHmyaR06pW7X0nnyCWHA=R3GtcJA@mail.gmail.com>
Subject: Re: [PATCH] media: rcar_drif: Use dma_request_chan() instead dma_request_slave_channel()
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ramesh Shanmugasundaram <rashanmu@gmail.com>,
        Vinod <vkoul@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Peter,

On Mon, Jan 20, 2020 at 1:09 PM Peter Ujfalusi <peter.ujfalusi@ti.com> wrote:
> On 20/01/2020 14.05, Geert Uytterhoeven wrote:
> > On Tue, Dec 17, 2019 at 11:41 AM Peter Ujfalusi <peter.ujfalusi@ti.com> wrote:
> >> dma_request_slave_channel() is a wrapper on top of dma_request_chan()
> >> eating up the error code.
> >>
> >> By using dma_request_chan() directly the driver can support deferred
> >> probing against DMA.
> >>
> >> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > One comment below.
> >
> >> --- a/drivers/media/platform/rcar_drif.c
> >> +++ b/drivers/media/platform/rcar_drif.c
> >> @@ -275,10 +275,10 @@ static int rcar_drif_alloc_dmachannels(struct rcar_drif_sdr *sdr)
> >>         for_each_rcar_drif_channel(i, &sdr->cur_ch_mask) {
> >>                 struct rcar_drif *ch = sdr->ch[i];
> >>
> >> -               ch->dmach = dma_request_slave_channel(&ch->pdev->dev, "rx");
> >> -               if (!ch->dmach) {
> >> +               ch->dmach = dma_request_chan(&ch->pdev->dev, "rx");
> >> +               if (IS_ERR(ch->dmach)) {
> >>                         rdrif_err(sdr, "ch%u: dma channel req failed\n", i);
> >
> > Now there is an error code, you might (1) want to print it, and (2) only
> > do so when it is not due to probe deferral:
> >
> >         if (PTR_ERR(ch->dmach) != -EPROBE_DEFER)
> >                 rdrif_err(sdr, "ch%u: dma channel req failed %pe\n",
> > i, ch->dmach);
>
> Yes, this is true.
>
> >
> >> -                       ret = -ENODEV;
> >> +                       ret = PTR_ERR(ch->dmach);
>
> if (ret != -EPROBE_DEFER)
>         rdrif_err(sdr, "ch%u: dma channel req failed (%d)\n", i, ret);
>
> might be simpler.

Sure, checking ret is simpler.
But printing ch->dmach means you can use the new %pe format specifier
to pretty-print the error code.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
