Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7100DE461F
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2019 10:47:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408582AbfJYIrI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Oct 2019 04:47:08 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:43799 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408566AbfJYIrG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Oct 2019 04:47:06 -0400
Received: by mail-ot1-f68.google.com with SMTP id z20so1459019otk.10;
        Fri, 25 Oct 2019 01:47:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DoJczN+PCPEBJvD5MiZA3h3v1VZ07mO7fWjvQsmxpoo=;
        b=GJsC8EHlADoxJqntdnjian9Wqg66KZ4+SeA83GlNj4AVuxYN45ehmdbLQZd73pcKT8
         sGqVQOBh8OZmXQ3QBuOIyI0PhoQdFpoMEejI0F2aB/EaH65QkOHmmhL1Ob9RutdzH9A5
         JW20/DF4EYpRH8csMBuaFm6udh8f0+NW8xUxEDNtn3HQpSkWsN9ZUk6numluRyw6WUae
         WIwRz3W247ztlDAFHzg1D+lvmYZFipgpisCM20J0ig5XUbZTU6zdR18z6fPD8gxKe7wI
         Sw1ghjGSOasIECGBoewrlBFKgl0x69NFcupGz5ns1w4sEzs9gqg3YkSaeYTO89wKxS/J
         h0SQ==
X-Gm-Message-State: APjAAAXZoOBwtYOVDJrKjav9D0M/ZrSA72uNvbKxyIxRRWVEiw7B7iUw
        Wq96Sp/aEgBEdxUFXtcRW3/RYJXcsWJcH7sPOgoicg//
X-Google-Smtp-Source: APXvYqxtaukGa9kru2/JTSrA7brj+MDNDbUcMU/53UF9Ll0L4Jj8XHV2gaQx3vGnSCzMhUfKBNtDoYmS+3ZYS9PxKW8=
X-Received: by 2002:a9d:7d19:: with SMTP id v25mr1793171otn.250.1571993224673;
 Fri, 25 Oct 2019 01:47:04 -0700 (PDT)
MIME-Version: 1.0
References: <20191024130916.16444-1-geert+renesas@glider.be> <05a62983-5132-0fcb-2e8e-70b95d44730f@ideasonboard.com>
In-Reply-To: <05a62983-5132-0fcb-2e8e-70b95d44730f@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 25 Oct 2019 10:46:53 +0200
Message-ID: <CAMuHMdX4xikRtojAWgWecEfqjrOw+aEGaW2HFvDkvJbwHxb1qA@mail.gmail.com>
Subject: Re: [PATCH] media: fdp1: Fix R-Car M3-N naming in debug message
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

On Thu, Oct 24, 2019 at 6:08 PM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> On 24/10/2019 14:09, Geert Uytterhoeven wrote:
> > The official name is "R-Car M3-N", not "R-Car M3N".
> >
> > Fixes: 4e8c120de9268fc2 ("media: fdp1: Support M3N and E3 platforms")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  drivers/media/platform/rcar_fdp1.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/rcar_fdp1.c b/drivers/media/platform/rcar_fdp1.c
> > index cb93a13e1777a53e..97bed45360f088d0 100644
> > --- a/drivers/media/platform/rcar_fdp1.c
> > +++ b/drivers/media/platform/rcar_fdp1.c
> > @@ -2369,7 +2369,7 @@ static int fdp1_probe(struct platform_device *pdev)
> >               dprintk(fdp1, "FDP1 Version R-Car H3\n");
> >               break;
> >       case FD1_IP_M3N:
>
> Should the FD1_IP_M3N naming also be updated accordingly?
> I guess that's not so important.
>
> Either way, up to you.

Na, you can't use hyphens in preprocessor definitions ;-)
FD1_IP_M3N is consistent with FD1_IP_M3W, and not user-visible.

> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
