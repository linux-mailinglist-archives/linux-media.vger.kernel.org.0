Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2E5E142A04
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2020 13:05:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbgATMFW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jan 2020 07:05:22 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:38670 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726573AbgATMFW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jan 2020 07:05:22 -0500
Received: by mail-ot1-f68.google.com with SMTP id z9so26330427oth.5;
        Mon, 20 Jan 2020 04:05:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8IGISWNwTs2bNmoDODVRHiVGV+QnUc2aI36aOiRfO3A=;
        b=ehBMNUNSvqJ0oQ91aZxbfu2Lcp9Oy9dECZx1qTD3176riFrhyJvEASm8wXRcC3DKIe
         ntiqtUUtvxMfw6BWizVAddjEsgZ+wKPs+vOU36vfr7FN0+ycwD2w7Sf5cQtW8tW0Wikg
         CbFRffcZfcLjPrkmpEU55vPdv8B97Fgr17ZW9y/VpXdIpkhwl3BR1Mm53JXyHqggph2I
         Ndc/Jp2eDkNwULhhNmLL+5wtJ7o5LmT595km+8wn4o/bhIX77faBXgO49BrbMw9VCFmo
         ERcwkQdpodHzKUoBtk8gsFc4WNIzvcZalJ/7C9wzgLsno6X7BSmlR1oM+MwausP0mC6c
         ZIsA==
X-Gm-Message-State: APjAAAUTi8h2HFQwGuxeTSQZWHkKis5LtErivUdhLiLxl4y+BjAqzoF1
        JeeFFVg6jUikWvi8riOrKUIg/xkZRCdva8SG4fuXU9MG
X-Google-Smtp-Source: APXvYqz4OtZxTxDjvqbBlOXznpj0zV6t75mZIt8QDFhI+1zDn4ZTkzfm/BzJLg7d/t4A9sO4EamAcXsetSXbnBkA2OM=
X-Received: by 2002:a9d:8f1:: with SMTP id 104mr14795679otf.107.1579521920977;
 Mon, 20 Jan 2020 04:05:20 -0800 (PST)
MIME-Version: 1.0
References: <20191217104025.23318-1-peter.ujfalusi@ti.com>
In-Reply-To: <20191217104025.23318-1-peter.ujfalusi@ti.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 20 Jan 2020 13:05:09 +0100
Message-ID: <CAMuHMdUPhabZrXJ3UqSVTdy2aWf6VG27q287MizKJ5q5tyRnwA@mail.gmail.com>
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

On Tue, Dec 17, 2019 at 11:41 AM Peter Ujfalusi <peter.ujfalusi@ti.com> wrote:
> dma_request_slave_channel() is a wrapper on top of dma_request_chan()
> eating up the error code.
>
> By using dma_request_chan() directly the driver can support deferred
> probing against DMA.
>
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

One comment below.

> --- a/drivers/media/platform/rcar_drif.c
> +++ b/drivers/media/platform/rcar_drif.c
> @@ -275,10 +275,10 @@ static int rcar_drif_alloc_dmachannels(struct rcar_drif_sdr *sdr)
>         for_each_rcar_drif_channel(i, &sdr->cur_ch_mask) {
>                 struct rcar_drif *ch = sdr->ch[i];
>
> -               ch->dmach = dma_request_slave_channel(&ch->pdev->dev, "rx");
> -               if (!ch->dmach) {
> +               ch->dmach = dma_request_chan(&ch->pdev->dev, "rx");
> +               if (IS_ERR(ch->dmach)) {
>                         rdrif_err(sdr, "ch%u: dma channel req failed\n", i);

Now there is an error code, you might (1) want to print it, and (2) only
do so when it is not due to probe deferral:

        if (PTR_ERR(ch->dmach) != -EPROBE_DEFER)
                rdrif_err(sdr, "ch%u: dma channel req failed %pe\n",
i, ch->dmach);

> -                       ret = -ENODEV;
> +                       ret = PTR_ERR(ch->dmach);
>                         goto dmach_error;
>                 }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
